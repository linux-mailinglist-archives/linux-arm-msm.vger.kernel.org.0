Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF2A543D5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 17:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731958AbfFMPlY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 11:41:24 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:34835 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731893AbfFMPlX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 11:41:23 -0400
Received: by mail-io1-f66.google.com with SMTP id m24so17927227ioo.2;
        Thu, 13 Jun 2019 08:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X0U3COzvPG/alEUAlKcOBGc1yFjBYdAAAltQ92Ad0Us=;
        b=s/FgaD9qgaBwjaM5QqEJzrW88GzXAvc6tcX3tWIiubqJW3V5Ap3a+QzjzbJY6LLvQS
         +fzuAuJqT7kVN4lF/1hp+wdg/I6DmX++1E7HnGKQRN0vzwuB8a5EoAKWjq+nl/OQZseD
         e12bjDGhjEK5qJlsFc5idgB8OpRZx1cS8vbnsmaoN4EXC1bPriV6AK1BAoYU4VuuB8TQ
         rVFl+bYOh8gH8jp4KEM71F6Sr2GpF+KV4epYXuRFE7h3F3ZPTcDiIggsT5oDCdwk9RCr
         SPkrdH9iTGAUNmeabAZkpbrMXWByj8JxOUtRbYc6CdI1BkqAb4QgYCwpVjIor45Kvozy
         7rMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X0U3COzvPG/alEUAlKcOBGc1yFjBYdAAAltQ92Ad0Us=;
        b=myy9BzqFbDGLbva1s4syraoDB3LkD45x2EUWAbpbcSEKitEW0pmEzbFthp8bJ13t7f
         hYxDkmbbqKmnSv6bcgQ7csj8EdvXM1MExWORjxGJO3Mo5J/tcSdYjWYuOzod8rLEEEyR
         e9Vf+xP/iFt41kPhF9+/8/EiraljatbwTCnrBmlGwa6VCBFhoblL9gCOp/Pphr4doK/J
         SPfYn2y3OUEr+5+HV4p5F2j9kn32rcSWiKNRnCIZoHiv/fhtcYgIPgnzTgx6Uffuq4qB
         fJW1ZkiXiJ5xo5jSi0RzOFalnh72qv8wMkLPRxmDDpUyOEepIYigJsWw+e8dI3uP48iD
         W/qw==
X-Gm-Message-State: APjAAAUgwlpmCt1QSYbOo7/eGEGZ9hRzPiK0XyZbPgv6M88uVG3CeN5B
        xX0SX0OuC7mDRzFeXvCVjCjHLphzjFPA4fykoFE=
X-Google-Smtp-Source: APXvYqzwNT7mHiqywn3SAW1FM82sriyhLVyrWRsVzp+UUe3c62r5hPDh7Ym+ANklDEsCQ+271EAdGpmGprECuzojlNg=
X-Received: by 2002:a6b:e615:: with SMTP id g21mr5725019ioh.178.1560440482991;
 Thu, 13 Jun 2019 08:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
 <20190613142425.9036-1-jeffrey.l.hugo@gmail.com> <20190613153316.GE6792@builder>
In-Reply-To: <20190613153316.GE6792@builder>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 13 Jun 2019 09:41:12 -0600
Message-ID: <CAOCk7NrKa9YvoTmbhXDeKp6cKWOaXmD67LJNf=obgtx7GnZfVg@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] drivers: regulator: qcom: add PMS405 SPMI regulator
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     lgirdwood@gmail.com, broonie@kernel.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
        Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 13, 2019 at 9:33 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 13 Jun 07:24 PDT 2019, Jeffrey Hugo wrote:
>
> > From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
> >
> > The PMS405 has 5 HFSMPS and 13 LDO regulators,
> >
> > This commit adds support for one of the 5 HFSMPS regulators (s3) to
> > the spmi regulator driver.
> >
> > The PMIC HFSMPS 430 regulators have 8 mV step size and a voltage
> > control scheme consisting of two  8-bit registers defining a 16-bit
> > voltage set point in units of millivolts
> >
> > S3 controls the cpu voltages (s3 is a buck regulator of type HFS430);
> > it is therefore required so we can enable voltage scaling for safely
> > running cpufreq.
> >
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > ---
> >  drivers/regulator/qcom_spmi-regulator.c | 41 +++++++++++++++++++++++--
> >  1 file changed, 38 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
> > index c7880c1d4bcd..975655e787fe 100644
> > --- a/drivers/regulator/qcom_spmi-regulator.c
> > +++ b/drivers/regulator/qcom_spmi-regulator.c
> > @@ -105,6 +105,7 @@ enum spmi_regulator_logical_type {
> >       SPMI_REGULATOR_LOGICAL_TYPE_ULT_HO_SMPS,
> >       SPMI_REGULATOR_LOGICAL_TYPE_ULT_LDO,
> >       SPMI_REGULATOR_LOGICAL_TYPE_FTSMPS426,
> > +     SPMI_REGULATOR_LOGICAL_TYPE_HFS430,
> >  };
> >
> >  enum spmi_regulator_type {
> > @@ -157,6 +158,7 @@ enum spmi_regulator_subtype {
> >       SPMI_REGULATOR_SUBTYPE_ULT_HF_CTL2      = 0x0e,
> >       SPMI_REGULATOR_SUBTYPE_ULT_HF_CTL3      = 0x0f,
> >       SPMI_REGULATOR_SUBTYPE_ULT_HF_CTL4      = 0x10,
> > +     SPMI_REGULATOR_SUBTYPE_HFS430           = 0x0a,
> >  };
> >
> >  enum spmi_common_regulator_registers {
> > @@ -302,6 +304,8 @@ enum spmi_common_control_register_index {
> >  /* Clock rate in kHz of the FTSMPS426 regulator reference clock. */
> >  #define SPMI_FTSMPS426_CLOCK_RATE            4800
> >
> > +#define SPMI_HFS430_CLOCK_RATE                       1600
> > +
> >  /* Minimum voltage stepper delay for each step. */
> >  #define SPMI_FTSMPS426_STEP_DELAY            2
> >
> > @@ -515,6 +519,10 @@ static struct spmi_voltage_range ult_pldo_ranges[] = {
> >       SPMI_VOLTAGE_RANGE(0, 1750000, 1750000, 3337500, 3337500, 12500),
> >  };
> >
> > +static struct spmi_voltage_range hfs430_ranges[] = {
> > +     SPMI_VOLTAGE_RANGE(0, 320000, 320000, 2040000, 2040000, 8000),
> > +};
> > +
> >  static DEFINE_SPMI_SET_POINTS(pldo);
> >  static DEFINE_SPMI_SET_POINTS(nldo1);
> >  static DEFINE_SPMI_SET_POINTS(nldo2);
> > @@ -530,6 +538,7 @@ static DEFINE_SPMI_SET_POINTS(ult_lo_smps);
> >  static DEFINE_SPMI_SET_POINTS(ult_ho_smps);
> >  static DEFINE_SPMI_SET_POINTS(ult_nldo);
> >  static DEFINE_SPMI_SET_POINTS(ult_pldo);
> > +static DEFINE_SPMI_SET_POINTS(hfs430);
> >
> >  static inline int spmi_vreg_read(struct spmi_regulator *vreg, u16 addr, u8 *buf,
> >                                int len)
> > @@ -1397,12 +1406,24 @@ static struct regulator_ops spmi_ftsmps426_ops = {
> >       .set_pull_down          = spmi_regulator_common_set_pull_down,
> >  };
> >
> > +static struct regulator_ops spmi_hfs430_ops = {
> > +     /* always on regulators */
> > +     .set_voltage_sel        = spmi_regulator_ftsmps426_set_voltage,
> > +     .set_voltage_time_sel   = spmi_regulator_set_voltage_time_sel,
> > +     .get_voltage            = spmi_regulator_ftsmps426_get_voltage,
> > +     .map_voltage            = spmi_regulator_single_map_voltage,
> > +     .list_voltage           = spmi_regulator_common_list_voltage,
> > +     .set_mode               = spmi_regulator_ftsmps426_set_mode,
> > +     .get_mode               = spmi_regulator_ftsmps426_get_mode,
> > +};
> > +
> >  /* Maximum possible digital major revision value */
> >  #define INF 0xFF
> >
> >  static const struct spmi_regulator_mapping supported_regulators[] = {
> >       /*           type subtype dig_min dig_max ltype ops setpoints hpm_min */
> >       SPMI_VREG(BUCK,  GP_CTL,   0, INF, SMPS,   smps,   smps,   100000),
> > +     SPMI_VREG(BUCK,  HFS430,   0, INF, HFS430, hfs430, hfs430,  10000),
> >       SPMI_VREG(LDO,   N300,     0, INF, LDO,    ldo,    nldo1,   10000),
> >       SPMI_VREG(LDO,   N600,     0,   0, LDO,    ldo,    nldo2,   10000),
> >       SPMI_VREG(LDO,   N1200,    0,   0, LDO,    ldo,    nldo2,   10000),
> > @@ -1570,7 +1591,8 @@ static int spmi_regulator_init_slew_rate(struct spmi_regulator *vreg)
> >       return ret;
> >  }
> >
> > -static int spmi_regulator_init_slew_rate_ftsmps426(struct spmi_regulator *vreg)
> > +static int spmi_regulator_init_slew_rate_ftsmps426(struct spmi_regulator *vreg,
> > +                                                int clock_rate)
> >  {
> >       int ret;
> >       u8 reg = 0;
> > @@ -1587,7 +1609,7 @@ static int spmi_regulator_init_slew_rate_ftsmps426(struct spmi_regulator *vreg)
> >       delay >>= SPMI_FTSMPS426_STEP_CTRL_DELAY_SHIFT;
> >
> >       /* slew_rate has units of uV/us */
> > -     slew_rate = SPMI_FTSMPS426_CLOCK_RATE * range->step_uV;
> > +     slew_rate = clock_rate * range->step_uV;
> >       slew_rate /= 1000 * (SPMI_FTSMPS426_STEP_DELAY << delay);
> >       slew_rate *= SPMI_FTSMPS426_STEP_MARGIN_NUM;
> >       slew_rate /= SPMI_FTSMPS426_STEP_MARGIN_DEN;
> > @@ -1739,7 +1761,14 @@ static int spmi_regulator_of_parse(struct device_node *node,
> >                       return ret;
> >               break;
> >       case SPMI_REGULATOR_LOGICAL_TYPE_FTSMPS426:
> > -             ret = spmi_regulator_init_slew_rate_ftsmps426(vreg);
> > +             ret = spmi_regulator_init_slew_rate_ftsmps426(vreg,
> > +                                             SPMI_FTSMPS426_CLOCK_RATE);
> > +             if (ret)
> > +                     return ret;
> > +             break;
> > +     case SPMI_REGULATOR_LOGICAL_TYPE_HFS430:
> > +             ret = spmi_regulator_init_slew_rate_ftsmps426(vreg,
> > +                                                     SPMI_HFS430_CLOCK_RATE);
> >               if (ret)
> >                       return ret;
> >               break;
> > @@ -1907,6 +1936,11 @@ static const struct spmi_regulator_data pm8005_regulators[] = {
> >       { }
> >  };
> >
> > +static const struct spmi_regulator_data pms405_regulators[] = {
> > +     { "s3", 0x1a00, }, /* supply name in the dts only */
>
> Not sure what this comment is trying to say. The third element here
> should be the string that is used to find the supply as specified in DT.
> For s3 this is "vdd_s3".
>
>
> So please drop the comment and make this:
>         { "s3", 0x1a00, "s3" },

Makes sense, will update.

>
> Regards,
> Bjorn
>
> > +     { }
> > +};
> > +
> >  static const struct of_device_id qcom_spmi_regulator_match[] = {
> >       { .compatible = "qcom,pm8005-regulators", .data = &pm8005_regulators },
> >       { .compatible = "qcom,pm8841-regulators", .data = &pm8841_regulators },
> > @@ -1914,6 +1948,7 @@ static const struct of_device_id qcom_spmi_regulator_match[] = {
> >       { .compatible = "qcom,pm8941-regulators", .data = &pm8941_regulators },
> >       { .compatible = "qcom,pm8994-regulators", .data = &pm8994_regulators },
> >       { .compatible = "qcom,pmi8994-regulators", .data = &pmi8994_regulators },
> > +     { .compatible = "qcom,pms405-regulators", .data = &pms405_regulators },
> >       { }
> >  };
> >  MODULE_DEVICE_TABLE(of, qcom_spmi_regulator_match);
> > --
> > 2.17.1
> >
