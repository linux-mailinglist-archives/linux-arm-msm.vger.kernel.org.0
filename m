Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBCD42488D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 17:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727813AbgHRPML (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 11:12:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbgHRPMJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 11:12:09 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8CACC061389;
        Tue, 18 Aug 2020 08:12:08 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z18so18602674wrm.12;
        Tue, 18 Aug 2020 08:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K7rzgcMuhB59uSbGxt2+obmcC2a75JDzO+8IEBPn/20=;
        b=LBPbIGYQrU0mHziA4nNdl4eE3cXtppYEvfLXZxMFHqUJCC3aPFJcpOX4uJ04qMnssG
         Ag5clvTZ7KaHp05xI+LCkT46W+mumhbi4uMzTEJ0Zgw7EHw2biiG22cGZvWWi8pxSKUn
         b+v8CHE4M/CZIj/ImziP2Zwe6Qr+5YWvKJ7VWieX7JGRgV9arfMDfkxkIL/t2jBZldOQ
         42hgWUG6W+6+Bo9XvCgOGgt9ZRn/D8ze4gVCG8oUASyzK10IQlJx8mGSCfQnykVQkC+J
         UnF7P+cyJAVXZcDJ/N6ANDnOzFaD1Jc+NLZEKQQKLDOnvlSZiA5g2pYB+cNNfwTlgOBN
         eWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K7rzgcMuhB59uSbGxt2+obmcC2a75JDzO+8IEBPn/20=;
        b=er6gUCaHCrHfN1PbVsIjxmS/u6juuPVw8YcHXZ1rhQei1qvymrvY0LoBlXPFz/wYo5
         qLHeJHbaQBeEVDDKvvqWLvVJVhlvf/tZLTBKWY3grYOqLwI3ZLr8Tbz295tHgmLB31E9
         FY01AqHCHepiFb+Yj3y/G8GhmYt6fu15DNr+g8dHCwvrwS1MRt+5H5fJ2Ds5YKQKFK2z
         qNX48zIo2MkiElVW/2YWiQ/ANYnjBPIIUQ5NU2l0GS1dD5SNN7zIy3ehEc8xCv80wdmJ
         jQeGB+fZkIECnPs8OkQrqqtTCz5vqX4qCvkLVdXqti0lZ3IMMLLVGFfbDR/6z0fgKYRv
         HSKg==
X-Gm-Message-State: AOAM533V3dug9xAmRBQwqE9AVnkunX+rnXM82IBoDpEVW4kDfYGIaT1l
        NBqr53N2HhJxfMwWYtkQXRdFCQabFEiX0gkoWoA=
X-Google-Smtp-Source: ABdhPJwKdzwEohL5E9SDLCVg0q8nhvUN8RMpxHE73jN/E0C6arJhxxGXiKWPU1nLKhzAjKAWQrer6Yss9Q2RQ13N+mU=
X-Received: by 2002:adf:f485:: with SMTP id l5mr19243697wro.147.1597763527343;
 Tue, 18 Aug 2020 08:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <1591009402-681-1-git-send-email-mkrishn@codeaurora.org> <a3fcad3f97c258043cd4268ef2c99740@codeaurora.org>
In-Reply-To: <a3fcad3f97c258043cd4268ef2c99740@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 18 Aug 2020 08:12:53 -0700
Message-ID: <CAF6AEGvDN2B-xxecOt+0aaweWohGSKekb3tCerX42T1eOte-ig@mail.gmail.com>
Subject: Re: [v2] drm/msm: add shutdown support for display platform_driver
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>, nganji@codeaurora.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 18, 2020 at 3:03 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi,
>
> On 2020-06-01 16:33, Krishna Manikandan wrote:
> > Define shutdown callback for display drm driver,
> > so as to disable all the CRTCS when shutdown
> > notification is received by the driver.
> >
> > This change will turn off the timing engine so
> > that no display transactions are requested
> > while mmu translations are getting disabled
> > during reboot sequence.
> >
> > Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> >
> > Changes in v2:
> >       - Remove NULL check from msm_pdev_shutdown (Stephen Boyd)
> >       - Change commit text to reflect when this issue
> >         was uncovered (Sai Prakash Ranjan)
> > ---
> >  drivers/gpu/drm/msm/msm_drv.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c
> > b/drivers/gpu/drm/msm/msm_drv.c
> > index e4b750b..94e3963 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -1322,6 +1322,13 @@ static int msm_pdev_remove(struct
> > platform_device *pdev)
> >       return 0;
> >  }
> >
> > +static void msm_pdev_shutdown(struct platform_device *pdev)
> > +{
> > +     struct drm_device *drm = platform_get_drvdata(pdev);
> > +
> > +     drm_atomic_helper_shutdown(drm);
> > +}
> > +
> >  static const struct of_device_id dt_match[] = {
> >       { .compatible = "qcom,mdp4", .data = (void *)KMS_MDP4 },
> >       { .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
> > @@ -1334,6 +1341,7 @@ static int msm_pdev_remove(struct platform_device
> > *pdev)
> >  static struct platform_driver msm_platform_driver = {
> >       .probe      = msm_pdev_probe,
> >       .remove     = msm_pdev_remove,
> > +     .shutdown   = msm_pdev_shutdown,
> >       .driver     = {
> >               .name   = "msm",
> >               .of_match_table = dt_match,
>
> Any more comments on this patch?

sorry, I managed to overlook this earlier.. I've pulled it in to msm-next

BR,
-R

> Thanks,
> Sai
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> member
> of Code Aurora Forum, hosted by The Linux Foundation
