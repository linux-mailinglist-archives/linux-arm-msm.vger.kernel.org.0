Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D657531E8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 May 2022 00:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231411AbiEWWX4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 May 2022 18:23:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231409AbiEWWXz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 May 2022 18:23:55 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C2267CB11
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 15:23:53 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id h9so9056534qtx.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 15:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rhBj+A73ELnQFoNbPkX2hSX+KSJvhC1M2m97Vu/479U=;
        b=gbPrlQWowkamDaF8K7+q80kVb+d89r/jamslVl4EJbre5cyL4MvX/5dcBKf6q2VH6I
         er0Sb4aM2gD/x/rh8OZFGe5f38F5QBLwjqdPHWy6SbvRKdEr1LsFj21PaHNR2RtAXp41
         xyRRDnUVrPJRirTm+W6lvH49HTZpDQ5DmBXXZVXbgnuR9FYs25IwKDgZAYRLtQJiyNEu
         HRytXtVkCaxl7VXdZRBaKy51L1K6gXsoxJF18WY+OsgHLGj/NYqt5M1Yhfhu6eanRMws
         XsB9QAYGXJvKLKb+Wh/Mq8dVVQ5IwnxBXFlrLM40n6unAK9HzEGRQ3TNMXvT5172SkoC
         SZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rhBj+A73ELnQFoNbPkX2hSX+KSJvhC1M2m97Vu/479U=;
        b=ihDA5SriS+8TfgI1Y0uIptecD3eXnvsZaRbXRVbIDSBtC3aNwfJxdxW/50M7ywSC7J
         rpAv4yCu3DZz+SKjHVAB9pe6v3Rr/Kit+TjMgoNjCLOxL2Q2p3VPJHPHGRYjH8THVShB
         OFBeTf4bVG0eyDZBGU8+ecIXRlEYsuLNvnwKljyP8dfl95gqUjMt+PYVYEZfgPA0xgYt
         s81W7d1x1z0CZ02/8nMpzSfqDTJ1uwkG5wwaHCd8cFLCSPaP6rQxW2W7IdxH7H+S5Od4
         HbUItSb2aksOS7wlpGlWTF74AZ52J02ZVNDLM/r/3XU4xD8+c5xGKDsW2MclB3PWsUhM
         Q46w==
X-Gm-Message-State: AOAM533zvo8zlmMPkTThFNn4dS7i6g5JX5T1VHger/x17M8oSvgcapBW
        jH0y09OJMThcCVgeqQIrd6DNOH/oEnAKwiwzK5gZeA==
X-Google-Smtp-Source: ABdhPJy+5gX8nlhFRHAsmFRyR/Vx5wxFrt1lplOIzSVVkI5CsMu823+NB3bn7fO5Vn2JFo1KVJEaIHl+pCk04AND62M=
X-Received: by 2002:a05:622a:13c8:b0:2f9:1cb4:9079 with SMTP id
 p8-20020a05622a13c800b002f91cb49079mr12977238qtk.629.1653344632711; Mon, 23
 May 2022 15:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220523204337.19739-1-rdunlap@infradead.org>
In-Reply-To: <20220523204337.19739-1-rdunlap@infradead.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 24 May 2022 01:23:41 +0300
Message-ID: <CAA8EJpoLBLVv3Snth2Jn-aLAXTOnOas=zcns829ddr4mF7sNig@mail.gmail.com>
Subject: Re: [PATCH -next] drm/msm: DRM_DP_AUX_BUS depends on OF
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, 23 May 2022 at 23:43, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Fix a Kconfig warning for DRM_MSM by making it depend on OF,
> since 'select' does not follow any dependency chaings.
>
> WARNING: unmet direct dependencies detected for DRM_DP_AUX_BUS

I think it was agreed that DRM_DP_AUX_BUS should depend on OF ||
COMPILE_TEST (and the patch has been submitted by YueHaibing). See the
thread at https://lore.kernel.org/dri-devel/9534934e-4c4a-ba2f-3bc3-d6d241e=
625bb@linaro.org/T/


>   Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dm] && OF [=3Dn]
>   Selected by [m]:
>   - DRM_MSM [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && (ARCH_QCOM || SOC=
_IMX5 || COMPILE_TEST [=3Dy]) && COMMON_CLK [=3Dy] && IOMMU_SUPPORT [=3Dy] =
&& (QCOM_OCMEM [=3Dn] || QCOM_OCMEM [=3Dn]=3Dn) && (QCOM_LLCC [=3Dy] || QCO=
M_LLCC [=3Dy]=3Dn) && (QCOM_COMMAND_DB [=3Dn] || QCOM_COMMAND_DB [=3Dn]=3Dn=
)
>
> Fixes: f5d01644921b ("drm/msm: select DRM_DP_AUX_BUS for the AUX bus supp=
ort")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/msm/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
>
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -3,6 +3,7 @@
>  config DRM_MSM
>         tristate "MSM DRM"
>         depends on DRM
> +       depends on OF
>         depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
>         depends on COMMON_CLK
>         depends on IOMMU_SUPPORT



--=20
With best wishes
Dmitry
