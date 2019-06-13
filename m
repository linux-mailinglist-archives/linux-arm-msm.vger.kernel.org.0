Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 707C343CC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 17:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732444AbfFMPhu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 11:37:50 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:43694 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732619AbfFMPht (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 11:37:49 -0400
Received: by mail-io1-f66.google.com with SMTP id k20so17874871ios.10;
        Thu, 13 Jun 2019 08:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5i3fllaM3zGVPRCjpemlXnZ90CuYrEwzTiEoElVhFe8=;
        b=Opg/Cz53GyZCtD8gdSvINfrJq82ClNEH2vJpIYLZbDB0mFJSOBPNRSnMuvc/ETy/u7
         3YSWspqqmO5FLQQeR1kCnj+/U4ZHiJsRiCJRNMNw1L0SF2wJHkafnoo29cUd6kie8j30
         5cyuXzzbbW2FEKDfoz7nPqdZ5xYVR8xXomfI9tUNAvmNdPLMvBspKsVE1PSfi4WSUW7m
         9OGHjF5Ed29skI3yLFbkvr9rhcWepSFeBIx63dE4dhB1orw7jkqAPJhyJ9Lo/9yM96oq
         B9pdy6+hEleo9Fbds6FkIa+8+xYNaINnWxBFiYG74h+rQS1l1Hkdvg2cnxXoieNejmna
         j2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5i3fllaM3zGVPRCjpemlXnZ90CuYrEwzTiEoElVhFe8=;
        b=AG77fa0gpED2GrZZelJP35nnYpFduYMOQVQ5R6egnc1nfiSlxxsm7oz3evsoGOqSaZ
         X8fwtvyUzg5x5zuhRdLlLVBg8OifZO2Ytp7y8+yfCmVDorC6pGU9H1o3MRriZ4izObk9
         oqoi+pYwwWh/G4bExw4NcQgJFbAKcdQJL97SJgpJoWnoVYuLdo9oO0FJr01cmAxJsB8H
         aVW2p9mA5eMvaI9uo1l0mru/L29ONkA0jCnliSU6KgBAjiVywLdB4pf7lmlV7gA2JePC
         XGlWHrukOhzO4jrwPqyotGim7FjuMr++nuJkRlEkPLrqSxhuBbo+RiwFVBHHZWaKYGMO
         MJ9g==
X-Gm-Message-State: APjAAAUOy5XDJjf4OdwyzATII34LyCQWscjwQ3c+9jpP+G1m4oXigU90
        sMeHpYFBBk0dAbhfm9niSLYn8QZD7IKIcLB55Uk=
X-Google-Smtp-Source: APXvYqwfUacV62ukDncawPLzKOEtROrJgrS0BIzPwynxnGl7fBiV1KhINj78l/YVKnvaiUlBeEdXQsYQ2XfmhId0Zac=
X-Received: by 2002:a02:c50a:: with SMTP id s10mr30311468jam.106.1560440268724;
 Thu, 13 Jun 2019 08:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
 <20190613142239.8779-1-jeffrey.l.hugo@gmail.com> <20190613151209.GB6792@builder>
 <20190613152430.GC6792@builder>
In-Reply-To: <20190613152430.GC6792@builder>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 13 Jun 2019 09:37:38 -0600
Message-ID: <CAOCk7NpLz-6kM2X=HOh4ZcEw4bzhKcjd=8664HX43w1V+ffeag@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] drivers: regulator: qcom_spmi: Refactor get_mode/set_mode
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     lgirdwood@gmail.com, broonie@kernel.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 13, 2019 at 9:24 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 13 Jun 08:12 PDT 2019, Bjorn Andersson wrote:
>
> > On Thu 13 Jun 07:22 PDT 2019, Jeffrey Hugo wrote:
> >
> > > spmi_regulator_common_get_mode and spmi_regulator_common_set_mode use
> > > multi-level ifs which mirror a switch statement.  Refactor to use a switch
> > > statement to make the code flow more clear.
> > >
> > > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > > ---
> > >  drivers/regulator/qcom_spmi-regulator.c | 28 ++++++++++++++++---------
> > >  1 file changed, 18 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
> > > index fd55438c25d6..1c18fe5969b5 100644
> > > --- a/drivers/regulator/qcom_spmi-regulator.c
> > > +++ b/drivers/regulator/qcom_spmi-regulator.c
> > > @@ -911,13 +911,14 @@ static unsigned int spmi_regulator_common_get_mode(struct regulator_dev *rdev)
> > >
> > >     spmi_vreg_read(vreg, SPMI_COMMON_REG_MODE, &reg, 1);
> > >
> > > -   if (reg & SPMI_COMMON_MODE_HPM_MASK)
>
> Sorry, didn't see the & here. Don't you need to mask out the mode bits
> before turning this into a switch?

Ah.  Yes.  I read the documentation wrong when doing this.  Will fix.

>
> > > +   switch (reg) {
> > > +   case SPMI_COMMON_MODE_HPM_MASK:
> > >             return REGULATOR_MODE_NORMAL;
> > > -
> > > -   if (reg & SPMI_COMMON_MODE_AUTO_MASK)
> > > +   case SPMI_COMMON_MODE_AUTO_MASK:
> > >             return REGULATOR_MODE_FAST;
> > > -
> > > -   return REGULATOR_MODE_IDLE;
> > > +   default:
> > > +           return REGULATOR_MODE_IDLE;
> > > +   }
> > >  }
> > >
> > >  static int
> > > @@ -925,12 +926,19 @@ spmi_regulator_common_set_mode(struct regulator_dev *rdev, unsigned int mode)
> > >  {
> > >     struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> > >     u8 mask = SPMI_COMMON_MODE_HPM_MASK | SPMI_COMMON_MODE_AUTO_MASK;
> > > -   u8 val = 0;
> > > +   u8 val;
> > >
> > > -   if (mode == REGULATOR_MODE_NORMAL)
> > > +   switch (mode) {
> > > +   case REGULATOR_MODE_NORMAL:
> > >             val = SPMI_COMMON_MODE_HPM_MASK;
> > > -   else if (mode == REGULATOR_MODE_FAST)
> > > +           break;
> > > +   case REGULATOR_MODE_FAST:
> > >             val = SPMI_COMMON_MODE_AUTO_MASK;
> > > +           break;
> > > +   default:
> > > +           val = 0;
> > > +           break;
> > > +   }
> >
> > For this part:
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > >
> > >     return spmi_vreg_update_bits(vreg, SPMI_COMMON_REG_MODE, val, mask);
> > >  }
> > > @@ -1834,9 +1842,9 @@ static int qcom_spmi_regulator_probe(struct platform_device *pdev)
> > >                     }
> > >             }
> > >
> > > -           if (vreg->logical_type == SPMI_REGULATOR_LOGICAL_TYPE_HFS430) {
> >
> > Squash this into patch 1.
> >
> > Regards,
> > Bjorn
> >
> > > +           if (vreg->set_points->count == 1) {
> > >                     /* since there is only one range */
> > > -                   range = spmi_regulator_find_range(vreg);
> > > +                   range = vreg->set_points->range;
> > >                     vreg->desc.uV_step = range->step_uV;
> > >             }
> > >
> > > --
> > > 2.17.1
> > >
