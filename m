Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3835243B5D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 17:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727598AbfFMP2T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 11:28:19 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:38228 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727555AbfFMP2T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 11:28:19 -0400
Received: by mail-io1-f66.google.com with SMTP id k13so17807416iop.5;
        Thu, 13 Jun 2019 08:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gs6NoMzyTUTgpt3NkLyMgRheVG07G/duNOUEUDS36y4=;
        b=oLxsJPOAaVS9zcsx7BtVviCTfEK+f2WaSDX0FvUnPZJm8bRUy6g8IKUUYANmdRPx25
         GlxF9A6wqxJb4BkTGtlliTe53U4GHvRRyGJAmFt2EkUuVV+GnKoUBT1bGxYwDAIWVPw0
         8ggxG6XAW8qNM1/oDUILaVEQjuiQBthr7i8Z6IlMv8JkY34tN5VH9Yia/yFv17X/LPOp
         U4QDpkMrUWcCHu7MLe3EDiq5Rp5h6Yhog5ToBSls+odpCG02s0ydNenpzwdzLCRqFWrT
         SY4uNh3WCAYYHaDpaBT0ftJ5zmEt+nsfxNYafuisDbUqrmlMfoWRJwBA250P3HkPh9sl
         QYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gs6NoMzyTUTgpt3NkLyMgRheVG07G/duNOUEUDS36y4=;
        b=EGhu7zWQ0rEsn/BmTM++xn8xfRU0dx1vuKGEM+jIlpbSmGlY9nYQj1wRQOp+hWEDu8
         mHq2SLfQCPn3M1hh6EIdqQKy43JotN3r0yTUNSuSeIt7sGwiKagZdmG9wTc68MUYTg6U
         Z6BN2p3QpVuhbPKzSxGDYEyZVOzoGRjt+z7IOzYgTWWGXekq0YZd5HqJk7tPM1gEwvSx
         hcHRgmgg4HI6lHZc+qHyC9AkXZ9WyUjop0kb9eO6e5SIthlTr6cb0Msgsb4+xTEZs8rB
         LdoRdlM/ElspquelbjQzXhGo/Cd3UFU/54tQiRNanCKXdnA1ceJpMYx4P/nyI23SoIqR
         dnMw==
X-Gm-Message-State: APjAAAVIpOKWqdJOWXscoJY4lub9bvZ1UVJjYIQBBjDGfX9tP5n67xX3
        ld9aLGcfzjmNvtMFYb7Gv+zBo2mjR4CKQxWlALI=
X-Google-Smtp-Source: APXvYqyf6LHpg96PPrivEyxWZaBVyeZfqd9X/N0jd2g0ZnMTEvKkgMdTLq0AsVbn/YwxOs1DD5G3n9mLN0Y6vRenUhk=
X-Received: by 2002:a02:bca:: with SMTP id 193mr57475365jad.46.1560439698047;
 Thu, 13 Jun 2019 08:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
 <20190613142231.8728-1-jeffrey.l.hugo@gmail.com> <20190613151008.GA6792@builder>
In-Reply-To: <20190613151008.GA6792@builder>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 13 Jun 2019 09:28:06 -0600
Message-ID: <CAOCk7NpPkcFLR9HWQmfx+9heHs6KCPCZo9mSa_ibezdMUMXNFg@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] drivers: regulator: qcom_spmi: enable linear range info
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     lgirdwood@gmail.com, broonie@kernel.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 13, 2019 at 9:10 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 13 Jun 07:22 PDT 2019, Jeffrey Hugo wrote:
>
> > From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> >
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > ---
> >  drivers/regulator/qcom_spmi-regulator.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
> > index 53a61fb65642..fd55438c25d6 100644
> > --- a/drivers/regulator/qcom_spmi-regulator.c
> > +++ b/drivers/regulator/qcom_spmi-regulator.c
> > @@ -1744,6 +1744,7 @@ MODULE_DEVICE_TABLE(of, qcom_spmi_regulator_match);
> >  static int qcom_spmi_regulator_probe(struct platform_device *pdev)
> >  {
> >       const struct spmi_regulator_data *reg;
> > +     const struct spmi_voltage_range *range;
> >       const struct of_device_id *match;
> >       struct regulator_config config = { };
> >       struct regulator_dev *rdev;
> > @@ -1833,6 +1834,12 @@ static int qcom_spmi_regulator_probe(struct platform_device *pdev)
> >                       }
> >               }
> >
> > +             if (vreg->logical_type == SPMI_REGULATOR_LOGICAL_TYPE_HFS430) {
>
> This doesn't compile, because HFS430 isn't defined until patch 7.
>
> But in patch 2 you replace this with a check to see if there's just a
> single range, which is a better solution. So squash the last hunk of
> patch 2 into this.

Huh, I did botch that.  The patch 2 hunk was intended to be in patch
1.  Will fix.

>
> Regards,
> Bjorn
>
> > +                     /* since there is only one range */
> > +                     range = spmi_regulator_find_range(vreg);
> > +                     vreg->desc.uV_step = range->step_uV;
> > +             }
> > +
> >               config.dev = dev;
> >               config.driver_data = vreg;
> >               config.regmap = regmap;
> > --
> > 2.17.1
> >
