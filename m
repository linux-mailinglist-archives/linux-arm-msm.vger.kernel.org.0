Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC4370B51D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 08:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231767AbjEVGe1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 02:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231734AbjEVGeU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 02:34:20 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AD95130
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 23:34:11 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3095b1b6e02so1492531f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 23:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684737250; x=1687329250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EAyY58pCbi3W8r2Mevgk+ep+W1pb3pJ/ucHMinuaS84=;
        b=A+wG49Gs9AoCWb6fIpuJql1Qx525ig00PRPuZsjZTRfztmcDeul8fJkUdztdlSkazD
         wl3Pn5YQSSaD0ZOHwgYBcnoPg591y5TZhau233ZZCHJwxW/9nyvvyFdcs5eUKYVtQ+fM
         h/NcSP0j9LOlDY7fsBHa+lb6rZbdIvg0esepOwLorgofVyjsbzzAzR/+nVsF7OdVBbnv
         JO7eFO5yGhip4RJ3Di9zuRIswgIlthQ2GGpUX7CTQpTKPvXWYTwmkyDbFGwyx+bqoC35
         ujT0VPdS9m0Iv3oLM9RU49buki+Qqdx0qTsWHWOkeNjb+TVoDUq4/rUZbiJmLKicBoGW
         vtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684737250; x=1687329250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAyY58pCbi3W8r2Mevgk+ep+W1pb3pJ/ucHMinuaS84=;
        b=D81csYtYJjrQzv/XemmdhI9nUEGcPaCMyjNTxhK3dMHgDBvQ1eDFNd2EWYsAF86/KG
         kVGHY39uqdvqubvveITqzW5P1cHWlDIs5kQIKyX/+RJuP+V91tYXXfuK8xaO0MdReguA
         jC34Gcat6y5rsu7PCl4kfuyx1IZtzw0vGc8E/wcwO2EpL6AbsivNry1g+r6spvl2Q0Jf
         fuSWzIdoo4o9xIvmeepOqOw869pCUUCZe1/O+1i/fbIVZoGBhMRshJ3mqOQSxLAEQRZc
         f+VO1/xmnodJ75wfVqKhooF21qLPytizbPM2+KWyVaAeBE2yZJB2NyxgPgSqtA9HwntG
         IGxw==
X-Gm-Message-State: AC+VfDwUmno4bg/jC06weFMSOnfN10BzyvSxOPSFloOb4s/vcy7ZAj1p
        xOFjG7bEIABwd9voEahlegBumlRPgwL8V8gVSRvhkQ==
X-Google-Smtp-Source: ACHHUZ4ZOLKEL9Fy0aJeksELWsZExOmWjwk016kyCGbYqYeUbvvZErTsAeHMdvgJHfZqM375hBeZ/2kl5PNt1+nQe5s=
X-Received: by 2002:adf:f1d0:0:b0:2f2:9198:f0f with SMTP id
 z16-20020adff1d0000000b002f291980f0fmr6866143wro.10.1684737249945; Sun, 21
 May 2023 23:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230522044512.4787-1-quic_kathirav@quicinc.com>
In-Reply-To: <20230522044512.4787-1-quic_kathirav@quicinc.com>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Mon, 22 May 2023 12:03:58 +0530
Message-ID: <CAH=2NtydsLsTRhWEqocg4AQPzk5QURHeKNe7N-DhhV2-qnic6Q@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom_scm: use the SCM_CONVENTION based on ARM / ARM64
To:     Kathiravan T <quic_kathirav@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_eberman@quicinc.com
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 22 May 2023 at 10:15, Kathiravan T <quic_kathirav@quicinc.com> wrote:
>
> During SCM probe, to identify the SCM convention, scm call is made with
> SMC_CONVENTION_ARM_64 followed by SMC_CONVENTION_ARM_32. Based on the
> result what convention to be used is decided.
>
> IPQ chipsets starting from IPQ807x, supports both 32bit and 64bit kernel
> variants, however TZ firmware runs in 64bit mode. When running on 32bit
> kernel, scm call is made with SMC_CONVENTION_ARM_64 is causing the
> system crash, due to the difference in the register sets between ARM and
> AARCH64, which is accessed by the TZ.

If a crash is being fixed, should we use a Fixes tag as well?

> To avoid this, use SMC_CONVENTION_ARM_64 only on ARM64 builds.
>
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---
>  drivers/firmware/qcom_scm.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index fde33acd46b7..db6754db48a0 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -171,6 +171,7 @@ static enum qcom_scm_convention __get_convention(void)
>         if (likely(qcom_scm_convention != SMC_CONVENTION_UNKNOWN))
>                 return qcom_scm_convention;
>
> +#if IS_ENABLED(CONFIG_ARM64)
>         /*
>          * Device isn't required as there is only one argument - no device
>          * needed to dma_map_single to secure world
> @@ -191,6 +192,7 @@ static enum qcom_scm_convention __get_convention(void)
>                 forced = true;
>                 goto found;
>         }
> +#endif

If we are already inside a 'CONFIG_ARM64' define here ^^^, do we even
need the following snippet now:

/*
     * Some SC7180 firmwares didn't implement the
     * QCOM_SCM_INFO_IS_CALL_AVAIL call, so we fallback to forcing ARM_64
     * calling conventions on these firmwares. Luckily we don't make any
     * early calls into the firmware on these SoCs so the device pointer
     * will be valid here to check if the compatible matches.
     */
    if (of_device_is_compatible(__scm ? __scm->dev->of_node : NULL,
"qcom,scm-sc7180")) {
        forced = true;
        goto found;
    }

'forced' will always be 'true' now that we are inside the CONFIG_ARM64
check above, right?
So, maybe you can clean-up that path as well.

Thanks,
Bhupesh
