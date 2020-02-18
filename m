Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5055C162DCE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 19:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgBRSI7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 13:08:59 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:33651 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbgBRSI5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 13:08:57 -0500
Received: by mail-ua1-f67.google.com with SMTP id w15so7815106uap.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2020 10:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R/hUNGk4SRM6kiHXV6o5gYzyAFxdFqq5txQCPei9mDM=;
        b=SH/AM7byq+GGZQOujD7y/pc9Z/jCNs8xRbvT3Xe26n4ObiDBca0/M1TL3iIp78G/R+
         KTx5VvRBK5p3StKKpsfLEm7H9wE343y6/5WBtpFIGos4DhvLfuVWpvX4GedZjL1+HaEc
         iJvH2r5Ftd+73Z/Pgaxa5yIH+MbzUINwlk1QetcQ2LojEZk8ZRig72UJrtiPm3RwCyO3
         sG7Bw8J0HX5+wDbWGKnHBCLC7AyVJAFKy5RAyYxDGpHixEcvDasdB20bLWeK3RlfFvXG
         19TGixZqnpV+mbILDmiWJHexNORo89AoO5/5humbXk7aszT1lJuRUya08rorJChwDm7k
         qKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R/hUNGk4SRM6kiHXV6o5gYzyAFxdFqq5txQCPei9mDM=;
        b=IDs/wh8PKaq1h7YUlwj4uTVBeUe/mXqBuOb/YsZPu/7aAt8ZknXA5kOdZLZyn24UYN
         RWSaIvTn2fa6JCWlYWGZXXYDjN0uYQqGOHOeM+MCZFx/hvTqteRD/UYCiQS5LONpjnYP
         /HpNKCCS6xyjDjQvPxnKNwmGjCGAKMDjYOVNj7cqXh7vhKjouq5EPIlm+iMYKirXvMgn
         GhkIu5+/QIrdNcK+2RVHRthP5/gwwUuGJoIX81RTfKT1cWM/0T9M1FRo0SDFiPuodpQv
         y8lmGNlKlicuopzexX4VPsbOcab6jAGyeY1Yxu9wR1qDSDb4b1jY4KB8wedPotVwtibL
         PCoA==
X-Gm-Message-State: APjAAAVafiIqKnTA+DmkZEa17rI3NxA5MoR5IsZBGE+ax/Xkv86vMahq
        87JvcnYYcTu6La8W64CcPi7U2kEo8tzKFIvTrcaywg==
X-Google-Smtp-Source: APXvYqyeUDwAdKkMhuDh2cUfhU3voe/Oj/lYB2U1rDCoNqf1S55cF1bQIpKWl5ZDtNg+HnjLQr+xWwKzvmFiPW+Dk2U=
X-Received: by 2002:ab0:7653:: with SMTP id s19mr11019733uaq.94.1582049334828;
 Tue, 18 Feb 2020 10:08:54 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580390127.git.amit.kucheria@linaro.org>
 <932e07a83fed192678b8f718bbae37d0dc83590d.1580390127.git.amit.kucheria@linaro.org>
 <20200203181413.GF3948@builder>
In-Reply-To: <20200203181413.GF3948@builder>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Tue, 18 Feb 2020 23:38:43 +0530
Message-ID: <CAHLCerNi2kb-bU_xsmB4aGLtUKPXfUrqDMLJLU=XXTnk-Kk=+A@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] drivers: thermal: tsens: Add critical interrupt support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>, sivaa@codeaurora.org,
        Andy Gross <agross@kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 3, 2020 at 11:44 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 30 Jan 05:27 PST 2020, Amit Kucheria wrote:
>
> > TSENS IP v2.x adds critical threshold interrupt support for each sensor
> > in addition to the upper/lower threshold interrupt. Add support in the
> > driver.
> >
> > While the critical interrupts themselves aren't currently used by Linux,
> > the HW line is also used by the TSENS watchdog. So this patch acts as
> > infrastructure to enable watchdog functionality for the TSENS IP.
> >
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
>
> Please do provide a changelog when respinning your patches.
>
> >  drivers/thermal/qcom/tsens-common.c | 120 ++++++++++++++++++++++++++--
> >  drivers/thermal/qcom/tsens-v2.c     |   8 +-
> >  drivers/thermal/qcom/tsens.c        |  24 +++++-
> >  drivers/thermal/qcom/tsens.h        |  71 ++++++++++++++++
> >  4 files changed, 212 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/tsens-common.c
> [..]
> > +irqreturn_t tsens_critical_irq_thread(int irq, void *data)
> > +{
> > +     struct tsens_priv *priv = data;
> > +     struct tsens_irq_data d;
> > +     unsigned long flags;
> > +     int temp, ret, i;
> > +
> > +     for (i = 0; i < priv->num_sensors; i++) {
> > +             const struct tsens_sensor *s = &priv->sensor[i];
> > +             u32 hw_id = s->hw_id;
> > +
> > +             if (IS_ERR(s->tzd))
> > +                     continue;
> > +             if (!tsens_threshold_violated(priv, hw_id, &d))
> > +                     continue;
> > +             ret = get_temp_tsens_valid(s, &temp);
> > +             if (ret) {
> > +                     dev_err(priv->dev, "[%u] %s: error reading sensor\n", hw_id, __func__);
> > +                     continue;
> > +             }
> > +
> > +             spin_lock_irqsave(&priv->crit_lock, flags);
> > +
>
> I see that I failed to follow up on the discussion on the previous
> revision. The handler is called from a single thread, so you don't need
> a lock to protect the irq handler from itself.

Makes sense now. Will fix.

Thanks for the review.

Regards,
Amit
