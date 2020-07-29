Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEFCB23226C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 18:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbgG2QQz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jul 2020 12:16:55 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:5175 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726385AbgG2QQy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jul 2020 12:16:54 -0400
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 29 Jul 2020 09:16:53 -0700
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg02-sd.qualcomm.com with ESMTP; 29 Jul 2020 09:16:53 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 4FCA916C0; Wed, 29 Jul 2020 09:16:53 -0700 (PDT)
Date:   Wed, 29 Jul 2020 09:16:53 -0700
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v1 1/2] thermal: qcom-spmi-temp-alarm: add support
 for GEN2 rev 1 PMIC peripherals
Message-ID: <20200729161653.GA7773@codeaurora.org>
References: <f22bb151d836f924b09cf80ffd6e58eb286be5d6.1595612650.git.gurus@codeaurora.org>
 <159598490848.1360974.3638464473515157786@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159598490848.1360974.3638464473515157786@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 28, 2020 at 06:08:28PM -0700, Stephen Boyd wrote:
> Quoting Guru Das Srinagesh (2020-07-24 10:46:10)
> > diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> > index bf7bae4..05a9601 100644
> > --- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> > +++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> > @@ -38,26 +39,30 @@
> >  
> >  #define ALARM_CTRL_FORCE_ENABLE                BIT(7)
> >  
> > -/*
> > - * Trip point values based on threshold control
> > - * 0 = {105 C, 125 C, 145 C}
> > - * 1 = {110 C, 130 C, 150 C}
> > - * 2 = {115 C, 135 C, 155 C}
> > - * 3 = {120 C, 140 C, 160 C}
> > -*/
> > -#define TEMP_STAGE_STEP                        20000   /* Stage step: 20.000 C */
> > -#define TEMP_STAGE_HYSTERESIS          2000
> > +#define THRESH_COUNT                   4
> > +#define STAGE_COUNT                    3
> > +
> > +/* Over-temperature trip point values in mC */
> > +static const long temp_map_gen1[THRESH_COUNT][STAGE_COUNT] = {
> > +       {105000, 125000, 145000},
> 
> Please add a space after { and before }

Done.

> 
> > +       {110000, 130000, 150000},
> > +       {115000, 135000, 155000},
> > +       {120000, 140000, 160000},
> > +};
> > +
> > +static const long temp_map_gen2_v1[THRESH_COUNT][STAGE_COUNT] = {
> > +       { 90000, 110000, 140000},
> 
> Almost.

Done.

> 
> > +       { 95000, 115000, 145000},
> > +       {100000, 120000, 150000},
> > +       {105000, 125000, 155000},
> > +};
> >  
> > -#define TEMP_THRESH_MIN                        105000  /* Threshold Min: 105 C */
> > -#define TEMP_THRESH_STEP               5000    /* Threshold step: 5 C */
> > +#define TEMP_THRESH_STEP               5000 /* Threshold step: 5 C */
> >  
> >  #define THRESH_MIN                     0
> >  #define THRESH_MAX                     3
> >  
> > -/* Stage 2 Threshold Min: 125 C */
> > -#define STAGE2_THRESHOLD_MIN           125000
> > -/* Stage 2 Threshold Max: 140 C */
> > -#define STAGE2_THRESHOLD_MAX           140000
> > +#define TEMP_STAGE_HYSTERESIS          2000
> >  
> >  /* Temperature in Milli Celsius reported during stage 0 if no ADC is present */
> >  #define DEFAULT_TEMP                   37000
> > @@ -77,6 +82,7 @@ struct qpnp_tm_chip {
> >         bool                            initialized;
> >  
> >         struct iio_channel              *adc;
> > +       const long                      (*temp_map)[THRESH_COUNT][STAGE_COUNT];
> 
> It can be negative Celsius?

It's not unsigned because it has to match struct qpnp_tm_chip's temp
member, which is long - hope I understood your concern correctly. The
temperatures themselves cannot be negative.

> 
> >  };
> >  
> >  /* This array maps from GEN2 alarm state to GEN1 alarm stage */
> > @@ -101,6 +107,23 @@ static int qpnp_tm_write(struct qpnp_tm_chip *chip, u16 addr, u8 data)
> >  }
> >  
> >  /**
> > + * qpnp_tm_decode_temp() - return temperature in mC corresponding to the
> > + *             specified over-temperature stage
> > + * @chip:              Pointer to the qpnp_tm chip
> > + * @stage:             Over-temperature stage
> > + *
> > + * Return: temperature in mC
> > + */
> > +static long qpnp_tm_decode_temp(struct qpnp_tm_chip *chip, unsigned int stage)
> > +{
> > +       if (!chip->temp_map || chip->thresh >= THRESH_COUNT || stage == 0
> > +           || stage > STAGE_COUNT)
> 
> Nitpick: The || goes on the line above.

Done.

> 
> > +               return 0;
> > +
> > +       return (*chip->temp_map)[chip->thresh][stage - 1];
> > +}
> > +
> > +/**
> >   * qpnp_tm_get_temp_stage() - return over-temperature stage
> >   * @chip:              Pointer to the qpnp_tm chip
> >   *
