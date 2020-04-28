Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 729331BB5BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 07:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725792AbgD1FRH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 01:17:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726276AbgD1FRE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 01:17:04 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA84EC03C1AA
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2020 22:17:04 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id t12so4421673oot.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2020 22:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kyGUYMPdvcwoGpvOuDgk/aiEpv2rX0tt8SNVhsSMdQ4=;
        b=k59JdLGhiziCb+4hFP6QIdWUt4Ofe+zs6WedIQWT1gHSzlRwZHhfAXAIa3HCHdHynW
         g4KIs/Qvk1GVG1z0ZSwnpZ9L+h8z7E4BBos+jDyslnxs05Yp+ftyfR0XsJSv6MY/A7pr
         WdmqoFhAkOG8sb0wXyVFl6yZTdbKpDHqAGWWDD/9jA17dm1sr1mwYrAhevjGMi+ye95g
         rXbo7WLXB9iJOr61f/D57brg/gBMloeXaAX1/3dwQozpv1E+LOFeRebXJehFvLvXsyLc
         62eVjnm2nezM4FRRT3ans1kwnshlYkr3rpGmvmsNwDi3vHhY91Sgp4QuwFro/5r9ilkp
         m0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kyGUYMPdvcwoGpvOuDgk/aiEpv2rX0tt8SNVhsSMdQ4=;
        b=qEoE6sSm9cnVzCV5WEEiUxc8lLcJOk1NpgFXl3kz8VGhj1Yayp2xxmYdulS0DiVnIQ
         P18+QyQ5DM9UCu/L137sHgbjBMwN4YPXgbexVHOtrzgldK3wFwxWmEJSFwWwJQHvuU9F
         BIx/ap/8Y7BplawYnQFot1NAequczVSdtK0sOzCb+uS2q3xzmYhV+PEFbMG8AZCNvYob
         uhhaj01OaqVbKdl40nQKUMF79rnW9qbG5NeX9+ZPdVSIHsQwU3q4pWNvpAB3Xg6+58tv
         7jor1eyAnF2pA3qR9a4vPaZr8QQsWXIN0Abov6+P23o968Zv/5+q7itGPxzw36t9pxc0
         yL0w==
X-Gm-Message-State: AGi0Pua749urUO50oCRUE5Kee+SuLm75oI+UDWXZgBbnhdK6AtH/Thf4
        Douizk0zMVDRTltulXUounS2oP5V1Bu5/0jmTkr4Vg==
X-Google-Smtp-Source: APiQypIvpS4S8gWYymZ3shMB3u7JstrB56GpILA18vJ5FfXikOYHsplz9bL9GkUGDrMqfcNmmYcL8ImD47sB+UAk+Bg=
X-Received: by 2002:a4a:b4c1:: with SMTP id g1mr22015000ooo.58.1588051023570;
 Mon, 27 Apr 2020 22:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
 <1560337252-27193-5-git-send-email-nishakumari@codeaurora.org> <20190613172738.GO5316@sirena.org.uk>
In-Reply-To: <20190613172738.GO5316@sirena.org.uk>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Tue, 28 Apr 2020 10:46:52 +0530
Message-ID: <CAO_48GEYAWBgzeEKx1kjjmLJ+F0chSkRs0EUC86Y2q20kyqjkA@mail.gmail.com>
Subject: Re: [PATCH 4/4] regulator: adding interrupt handling in labibb regulator
To:     Mark Brown <broonie@kernel.org>
Cc:     Nisha Kumari <nishakumari@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org, lgirdwood@gmail.com,
        mark.rutland@arm.com, david.brown@linaro.org,
        LKML <linux-kernel@vger.kernel.org>, kgunda@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Mark,

I am looking to address review comments and push v2 of this series (we
need it for pixel3 and poco phones' mainline efforts): I have a query
on your review comment below:

On Thu, 13 Jun 2019 at 22:57, Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Jun 12, 2019 at 04:30:52PM +0530, Nisha Kumari wrote:
>
> > +static void labibb_sc_err_recovery_work(void *_labibb)
> > +{
> > +     int ret;
> > +     struct qcom_labibb *labibb = (struct qcom_labibb *)_labibb;
> > +
> > +     labibb->ibb_vreg.vreg_enabled = 0;
> > +     labibb->lab_vreg.vreg_enabled = 0;
> > +
> > +     ret = qcom_ibb_regulator_enable(labibb->lab_vreg.rdev);
>
> The driver should *never* enable the regulator itself, it should only do
> this if the core told it to.
>
> > +     /*
> > +      * The SC(short circuit) fault would trigger PBS(Portable Batch
> > +      * System) to disable regulators for protection. This would
> > +      * cause the SC_DETECT status being cleared so that it's not
> > +      * able to get the SC fault status.
> > +      * Check if LAB/IBB regulators are enabled in the driver but
> > +      * disabled in hardware, this means a SC fault had happened
> > +      * and SCP handling is completed by PBS.
> > +      */
>
> Let the core worry about this, the driver should just report the problem
> to the core like all other devices do (and this driver doesn't...).

I (and Bjorn too) looked to find the api that allows us to do this
short circuit reporting and recovery in the core, but couldn't find
anything except REGULATOR_ERROR_OVER_CURRENT which also looks like
it's used only once in the code.

I am sure I'm missing something, maybe you could please help me find it?

Best,
Sumit.
