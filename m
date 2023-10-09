Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF2117BD16A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 02:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbjJIAWP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Oct 2023 20:22:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbjJIAWO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Oct 2023 20:22:14 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B1C7A2
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Oct 2023 17:22:13 -0700 (PDT)
Received: from [192.168.0.206] (unknown [179.221.49.143])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: koike)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id AC51A660708F;
        Mon,  9 Oct 2023 01:22:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1696810931;
        bh=nkas8mbOCQXxhRukFI/jwF8URSIbu2B26St5BjLCUaQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=KU5lnaNCqvtuF4FAwWCmpVP5ASbf3jWbE7rHblLkht+QCGbU/eZDhRTz3QH0Awtk+
         wDfSm6Ot4eG7No1FvBOrt/T0SU9iKkmC1GRAB6+3u508PIiUrc5FVsP5dIrTHc7PP7
         X6yPGo945ZdUy+Zq1APS7vDPQzrPDwM2VDZBYqL4KVMx0+N5+lRmTVXeVqQdp5xh3U
         V8bvqSIuXHOb+biOmZiUvfyfAllZSJQ9o/osEwjgN9YnBAYLbFibj0ASRe4De+TgCG
         yJONXnOLp4I+fcO33fPPba2CJbzVcU0mwsDGJChwB20IY4qwfRO/eyJiq1URe0RM86
         CmDLAsAys5ECg==
Message-ID: <938af28b-23c3-4725-8ed5-a054bf2fa142@collabora.com>
Date:   Sun, 8 Oct 2023 21:22:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/ci: force-enable CONFIG_MSM_MMCC_8996 as built-in
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org
References: <20231008132320.762542-1-dmitry.baryshkov@linaro.org>
 <20231008132320.762542-2-dmitry.baryshkov@linaro.org>
From:   Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20231008132320.762542-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 08/10/2023 10:23, Dmitry Baryshkov wrote:
> Enable CONFIG_MSM_MMCC_8996, the multimedia clock controller on Qualcomm
> MSM8996 to prevent the the board from hitting the probe deferral
> timeouts in CI run.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Tested-by: Helen Koike <helen.koike@collabora.com>

Pipeline: 
https://gitlab.freedesktop.org/helen.fornazier/linux/-/jobs/50031700

I saw that msm:apq8096 driver wasn't loading without this patch, thanks!

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>   drivers/gpu/drm/ci/arm64.config | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
> index 45f9deb7c4f6..b4f653417883 100644
> --- a/drivers/gpu/drm/ci/arm64.config
> +++ b/drivers/gpu/drm/ci/arm64.config
> @@ -62,6 +62,7 @@ CONFIG_PHY_QCOM_QUSB2=y
>   CONFIG_PHY_QCOM_QMP=y
>   CONFIG_MSM_GCC_8996=y
>   CONFIG_QCOM_CLK_APCC_MSM8996=y
> +CONFIG_MSM_MMCC_8996=y
>   CONFIG_QCOM_LLCC=y
>   CONFIG_QCOM_LMH=y
>   CONFIG_QCOM_SPMI_TEMP_ALARM=y
