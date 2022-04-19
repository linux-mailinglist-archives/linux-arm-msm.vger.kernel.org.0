Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 258B2507973
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 20:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353359AbiDSSzF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 14:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240517AbiDSSzD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 14:55:03 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 902733D4B4
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 11:52:19 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id i24so1559039pfa.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 11:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NooUuNCkNMvpIoZXYh5tmIEgwsCUJNTDomQ0FyzjCCY=;
        b=e5tBOqr4lavAAuGYjg9IsQpk5mL/uk7Hdvwg9DtAAbKtZmxEWJgmAQp7FQIqkewjbk
         4YGEK7NP2wBE01hyYpf1yzb59q/zCTRm5NqBDu7ia28oqZbmNm5BSCnuDm60j0QDysmX
         NLoyNLkz+clrh32C0DkZmjHlXO4s9ujkPH9I8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NooUuNCkNMvpIoZXYh5tmIEgwsCUJNTDomQ0FyzjCCY=;
        b=02QywLDMA6ETW85DxWICN1B7rhdcFiGmLs2uraS5tEbJIEvdhp/DZqdjYMehhdhmTJ
         s2vtaeHRiOHroAwZAoaxzb+8H/3/o3Gy6A5rEwZGszb6EOYlS+dHSRyCFJRWCAJa6YHx
         w8JxqN/54eKMPQhPC8SAfg65+HW1YltHIbTk0KP4ffBmJU9DEWE/GYEHnhthTnIUinc7
         KT60RGMil0jY/k4IaDzwvwa3AOwuUjGflAEcufylwcqpHrrXPWQ6ZbumQImN1r400PzE
         K4RTcxALZNhAoTVMRubyrNkNK2d2R8ZZxy7P+L1kyfl8LcKtGd3H90ga9t8wy/EDeLWn
         ABNA==
X-Gm-Message-State: AOAM5314wTPFPJvY6C5FX1dnctoinh97wCaSMvCk6osaUPJxdjqR/1eJ
        HYEcPh24++b8u0Z70QBAp1P55kvxGr52xjXU0Dyr/g==
X-Google-Smtp-Source: ABdhPJw9leYYKP26T9hLXHvp/ankYK20nLxEHwwASoB++NOIyzORrRT1SBQhNE7UnLrUPU92v21CkG2tpm8Ax/lQl0k=
X-Received: by 2002:a63:6e04:0:b0:398:409:2928 with SMTP id
 j4-20020a636e04000000b0039804092928mr15992700pgc.250.1650394339106; Tue, 19
 Apr 2022 11:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220419181444.485959-1-sashal@kernel.org> <20220419181444.485959-11-sashal@kernel.org>
In-Reply-To: <20220419181444.485959-11-sashal@kernel.org>
From:   Rob Clark <robdclark@chromium.org>
Date:   Tue, 19 Apr 2022 11:53:23 -0700
Message-ID: <CAJs_Fx7YVBn7qvaE23ThBOFzozKHBkefdSztfF+xtTw2hhgw2Q@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.4 11/14] drm/msm: Stop using iommu_present()
To:     Sasha Levin <sashal@kernel.org>
Cc:     linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

You might want to drop this one, it seems to be causing some issues on
older generations.. I'll be sending another PR shortly with a revert.

https://patchwork.freedesktop.org/patch/482453

BR,
-R

On Tue, Apr 19, 2022 at 11:15 AM Sasha Levin <sashal@kernel.org> wrote:
>
> From: Robin Murphy <robin.murphy@arm.com>
>
> [ Upstream commit e2a88eabb02410267519b838fb9b79f5206769be ]
>
> Even if some IOMMU has registered itself on the platform "bus", that
> doesn't necessarily mean it provides translation for the device we
> care about. Replace iommu_present() with a more appropriate check.
>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> Reviewed-by: Rob Clark <robdclark@gmail.com>
> Patchwork: https://patchwork.freedesktop.org/patch/480707/
> Link: https://lore.kernel.org/r/5ab4f4574d7f3e042261da702d493ee40d003356.1649168268.git.robin.murphy@arm.com
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 407b51cf6790..7322df9cf673 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -303,7 +303,7 @@ bool msm_use_mmu(struct drm_device *dev)
>         struct msm_drm_private *priv = dev->dev_private;
>
>         /* a2xx comes with its own MMU */
> -       return priv->is_a2xx || iommu_present(&platform_bus_type);
> +       return priv->is_a2xx || device_iommu_mapped(dev->dev);
>  }
>
>  static int msm_init_vram(struct drm_device *dev)
> --
> 2.35.1
>
