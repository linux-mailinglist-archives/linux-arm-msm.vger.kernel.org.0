Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D40991E4A35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 18:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391191AbgE0Qbk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 May 2020 12:31:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387775AbgE0Qbj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 May 2020 12:31:39 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9A60C05BD1E
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2020 09:31:39 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id i9so5114363ool.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2020 09:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NxBsCG/ZBuR/tyqaxmR6a/8NFdkSmWg7ajuut4LGUfA=;
        b=b+lMbZsTfHmILZwHDEtj1yw5O5x4XX8s8XDpQgw6wNybE3W4LYHAhyCF7+ColEcDPP
         EMpWb/iriXb6UFyDBun0GZHcOX9dj5oZtlk/x3CfmrrFxUpUR4gQInaul157f1p0VAM2
         ZzoG4NNhcOx5vebpK+p2ZCWLGrl2Zs/ikcDCyFgPdAkUUa1IizKTJZsCnFEZoeORqFRH
         B1aJWppTBUxeJ30/7H+ilLGyRJ28SZxnH5gmxBTTsvU5ftLm1x6fxWn9snpQoLnQGlxD
         AJiGz37SjZeKPKmZp2pZ9bepEp6aYhor5u8bWUeCmh6WRmlbdLuU+hV87tRQ3iDcywh0
         zSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NxBsCG/ZBuR/tyqaxmR6a/8NFdkSmWg7ajuut4LGUfA=;
        b=td9CbrcDHrM53OqwHuFAw8eKrLJMNvVHhYr3rhrJk9C/DD+ip892eN0SwzdJ+vHf8k
         /ldKU8uAPOq7bgd4El09JP7PXEBsQuwBy/zHPZhjLqZbPlJ/0EBNKkKFxBN+UYE1Xt0m
         Lf2QXkeyWbbkAtIelC883Cbag1LVw79Tvwa7V4+lIDeW+e8QHR9yuWuVfZ1qgvp+QRxR
         AEHq8d5g+Uo6rkP81FeXW+uVgwsNs5FAr58pGihAiULWGeE5npTBZJUaTFKBl9AAgbNO
         7YXmgHGeJOkMh2ZadqF7AkwYQb9Q/A74ZhTFMUCSWBQKwscyeavtEUrarrcr6rD9FMpx
         5zJg==
X-Gm-Message-State: AOAM533YMHwZqIF7kclDgGUeNI65p37ImNtll7j0ZvLEh+SSzhBFejf7
        DEAmYrUM8X2/ZxRo+LsvK/KVLSGxRn4WJPe4zTnFUA==
X-Google-Smtp-Source: ABdhPJxBq8QeDQCR39v9fZ3sYUGIbMy8dJJlxs9vQSgoBRg+s9wGSUND1yy0xbmGrnb1KxTaR3HXasfqVFSVK/OIfYQ=
X-Received: by 2002:a4a:909a:: with SMTP id j26mr3710376oog.21.1590597098962;
 Wed, 27 May 2020 09:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200508204200.13481-1-sumit.semwal@linaro.org>
 <20200508204200.13481-4-sumit.semwal@linaro.org> <20200511103937.GC8216@sirena.org.uk>
 <CAO_48GFGpHeu_xb9XT9CFMOSUOJgRrb-z_KZ3-r3X78s-2ddjw@mail.gmail.com>
In-Reply-To: <CAO_48GFGpHeu_xb9XT9CFMOSUOJgRrb-z_KZ3-r3X78s-2ddjw@mail.gmail.com>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Wed, 27 May 2020 22:01:27 +0530
Message-ID: <CAO_48GF0tjZDmTS+Fa4fv+cfH4skFZP_a9A=P7D0b_si4AFj5A@mail.gmail.com>
Subject: Re: [v2 3/4] regulator: qcom: Add labibb driver
To:     Mark Brown <broonie@kernel.org>
Cc:     agross@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        lgirdwood@gmail.com, robh+dt@kernel.org,
        Nisha Kumari <nishakumari@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Mark,

On Thu, 14 May 2020 at 16:57, Sumit Semwal <sumit.semwal@linaro.org> wrote:
>
> Hello Mark,
>
> Thank you for your review comments!
> On Mon, 11 May 2020 at 16:09, Mark Brown <broonie@kernel.org> wrote:
> >
> > On Sat, May 09, 2020 at 02:11:59AM +0530, Sumit Semwal wrote:
> >
> > > +     ret = regmap_bulk_read(reg->regmap, reg->base +
> > > +                            REG_LABIBB_STATUS1, &val, 1);
> > > +     if (ret < 0) {
> > > +             dev_err(reg->dev, "Read register failed ret = %d\n", ret);
> > > +             return ret;
> > > +     }
> >
> > Why a bulk read of a single register?
> Right, will change.
> >
> > > +static int _check_enabled_with_retries(struct regulator_dev *rdev,
> > > +                     int retries, int enabled)
> > > +{
> >
> > This is not retrying, this is polling to see if the regulator actually
> > enabled.
> Yes, will update accordingly.
>
> >
> > > +static int qcom_labibb_regulator_enable(struct regulator_dev *rdev)
> > > +{
> >
> > > +     ret = _check_enabled_with_retries(rdev, retries, 1);
> > > +     if (ret < 0) {
> > > +             dev_err(reg->dev, "retries exhausted: enable %s regulator\n",
> > > +                     reg->desc.name);
> > > +             return ret;
> > > +     }
> >
> > If this is useful factor it out into a helper or the core, other devices
> > also have status bits saying if the regulator is enabled.  It looks like
> > this may be mainly trying to open code something like enable_time, with
> > possibly some issues where the time taken to enable varies a lot.
> >
> Makes sense; I am not terribly familiar with the regulator core and
> helpers, so let me look and refactor accordingly.
Does something like this make sense, or did I misunderstand your
suggestion completely? I'll send the updated patches accordingly.

--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2353,6 +2353,7 @@ static int _regulator_do_enable(struct
regulator_dev *rdev)
+       /* If max_time_poll_enabled is set for the regulator,
+        * Poll upto max_time_poll_enabled time to see if the regulator
+        * actually got enabled.
+        * For each iteration, wait for the enable_time delay calculated
+        * above already.
+        * If the regulator isn't enabled after max_time_poll_enabled has
+        * expired, return -REG_ENABLED_CHECK_FAILED.
+        */
+       if (rdev->desc->max_time_poll_enabled) {
+               unsigned int remaining_time_to_poll =
rdev->desc->max_time_poll_enabled;
+
+               while (remaining_time_to_poll > 0) {
+                       /* We've already waited for enable_time above;
+                        * so we can start with immediate check of the
+                        * status of the regulator.
+                        */
+                       if (rdev->desc->ops->is_enabled(rdev))
+                               break;
+
+                       _regulator_enable_delay(delay);
+                       remaining_time_to_poll -= delay;
+               }
+
+               if (remaining_time_to_poll <= 0) {
+                       rdev_err(rdev, "Enabled check failed.\n");
+                       return -REG_ENABLED_CHECK_FAILED;
+               }
+       }
+

Since atleast in my use case, the delay is really enable_time (time
before we could check the status register), we could reuse the
already-calculated 'delay' based on enable_time?
>
<snip>

Best,
Sumit.
