Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0FE2421CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 23:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbgHKVSp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 17:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgHKVSo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 17:18:44 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB9C8C061787
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 14:18:44 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id x1so12272263ilp.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 14:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5zCJzt+BJueo1G2rs0QZq7zeuowqnIxHPn78LDh13kg=;
        b=FlowTssUayfdaL85TriP2RcBUzG/T6vntLnxRx7DdtmcmiqIiV3bH2ED/pB1FCvjq+
         LokfjisnXtGBAQLL+YECpUsyNdAMytoTTAZ5ztFLMVlLx+lGEPmly8iE28Klsvc7m9Nu
         rW8uiNQz+QsV8/gNXH/owhOE1Gr3XvGLYs7sEeg4HsgRYX5YK59C4yWf/cz63g8iGHkX
         v6N8lFRoSD5yLRGWWVCsMSLMRuQBKlHgkOanGuqLjHak4zsryiT50596J4YrA9pfpLnW
         YixCIlT2k0xTm6BLZAwgZ2QaJYMqPvXMnsKIKrGVZYUiWFHwxbYRazU6BEIFJoP87MuW
         JfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5zCJzt+BJueo1G2rs0QZq7zeuowqnIxHPn78LDh13kg=;
        b=fXRiexAqQ0NlQ5PIIGCG1drpMuEyLk9i5MLLXCZ1c3GRWr05IxGYnfI8J7AoppCina
         c0QxRvqvYJFQLR0fqBdT3ux8eAkiU+uEt72k2JsQq6LA4FLhsAGr5CWhWCM4Y6Di3olc
         5xy8IaPD13N7zOfTO5X31kpOvB5EveMzVElpGFEs0PyCM4DLTLuDoGML5o7XElY2QoSF
         ofTh8VoD80VNPBuIuREYzDc11WzXllGCiG+/Aa57nZhelolYbundafVVYnTslQGWC17n
         3wy5jznG1YvN4hkR8s5rD79OP89PPkp6JvnlPZsQiihljiTc3D/mElz1H+QUV9cpr/aC
         bW9Q==
X-Gm-Message-State: AOAM530mCIXwqDVwmyM37t/Ghwqq4/ARW7QsfrhheMtAzkaSn/h1zgxw
        cHZYgsN7B7wl5DqOfUMjwDTj+hlMoNbt1VbHWbE06Q==
X-Google-Smtp-Source: ABdhPJydXaSlgITmBtELkzUO4DBmCANUrr1wRTcqhyIrK8VcFT550AeHkpAKa6iE1xor3dBnDr5/Yj0olPjyteNUyc8=
X-Received: by 2002:a92:1d1:: with SMTP id 200mr25295650ilb.71.1597180724140;
 Tue, 11 Aug 2020 14:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200811210938.552939-1-robdclark@gmail.com>
In-Reply-To: <20200811210938.552939-1-robdclark@gmail.com>
From:   Sean Paul <sean@poorly.run>
Date:   Tue, 11 Aug 2020 17:18:08 -0400
Message-ID: <CAMavQKJcRRc=K3m14A5NsFMKC-E84FL3-r7MKcpoPQ_rq7d6gw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: fix unitialized variable error
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        kernel test robot <lkp@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Drew Davenport <ddavenport@chromium.org>,
        Bernard <bernard@vivo.com>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Hongbo Yao <yaohongbo@huawei.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 11, 2020 at 5:08 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:817 dpu_crtc_enable() error: uninitialized symbol 'request_bandwidth'.
>
> Reported-by: kernel test robot <lkp@intel.com>

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index f272a8d0f95b..c2729f71e2fa 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -827,7 +827,7 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
>  {
>         struct dpu_crtc *dpu_crtc;
>         struct drm_encoder *encoder;
> -       bool request_bandwidth;
> +       bool request_bandwidth = false;
>
>         if (!crtc) {
>                 DPU_ERROR("invalid crtc\n");
> --
> 2.26.2
>
