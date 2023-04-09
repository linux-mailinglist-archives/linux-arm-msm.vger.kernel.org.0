Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48E156DC09E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Apr 2023 18:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjDIQKc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Apr 2023 12:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjDIQKb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Apr 2023 12:10:31 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E0743590
        for <linux-arm-msm@vger.kernel.org>; Sun,  9 Apr 2023 09:10:29 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id n22so1456975ljq.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Apr 2023 09:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681056627; x=1683648627;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sZREeCBr///Shiq8jdwSn0p5JZZF5ydSiJvYkwH+KoQ=;
        b=RusavgALAATkpcX03rmvi5j99Xg9ZjHCWQk+vMeGZHh1jy5rOXpEPDE5AhXid7U5Pt
         gFYWkBLXoNRK9P0igG2zk0TiPLBwjkV5a2XhQj6LRp1tSGyvu3BXmlMbQgGKGfHijD3o
         SNtcjEUPsDK3/6RZch1MTnSB62p3QyGACfCFhYOENOGOrvr0ttdU2MaZy2Fe5mj/kJD+
         3PMGx3RSB34lTQPFLhJzZJ6nFNPlwHRH9d1VQANAKYx/rKKp41unXQEHktrJob5eMNdq
         KWCCiAskqgqLGDnxqmlME0JWXjcmyXko1U58NeJzxO6fz9P9LCr5MO3uS3BN0j/yM94R
         gLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681056627; x=1683648627;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sZREeCBr///Shiq8jdwSn0p5JZZF5ydSiJvYkwH+KoQ=;
        b=qn/5snzmSKRZuUDu0sHdqMSa6PTnfpbpeBL8ExoBPsiuHVozm8a7TFK4RpXWbQEHDP
         C4AThXeD1SKwxQ8UYZT+PEPNVTria5aj1xKyySIRNIIyE21D5ZEnjpnqzejIulU4SIq/
         QkF+K575TIX+uYc87K7zmi7293HxnlGTEXoZzZudbpuXF/pHKWJ8GJmEbXHvHaas5h2n
         l7lC1TRLZ7nY0OyPryXfwLKat5gQ5bf95/i7zPmWgf388+0MPY1Lj87qBRpDfLn4oXBK
         1zig4kvonKV4A/Ocq80Ffu5m/CF9XRTbBArJSFcF3bJn/ivSamrUhUNKzSVlMlnF4FPL
         RSQQ==
X-Gm-Message-State: AAQBX9dCCq+H24O0uWvUTP44nU8Mt5Yn+0K+VHQKnnrzhYIWt5WT4Qo5
        OZ67S7Aj68DhtlvdI18q5gc=
X-Google-Smtp-Source: AKy350ZxrjVC65CacRj+DQu/msGQpYSlVaHr/3NhIsTGmFIWOMxrPMXfH8C930zX49GwpeEO8J2Prg==
X-Received: by 2002:a2e:9c90:0:b0:298:aa96:55c2 with SMTP id x16-20020a2e9c90000000b00298aa9655c2mr2775935lji.44.1681056627532;
        Sun, 09 Apr 2023 09:10:27 -0700 (PDT)
Received: from [192.168.1.107] (byy157.neoplus.adsl.tpnet.pl. [83.30.44.157])
        by smtp.gmail.com with ESMTPSA id u7-20020a2e9f07000000b002a76f63a657sm555210ljk.105.2023.04.09.09.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Apr 2023 09:10:27 -0700 (PDT)
Message-ID: <7affdcfd-1e75-4a96-1110-83cfdb3e596e@gmail.com>
Date:   Sun, 9 Apr 2023 18:10:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH] drm/msm/a5xx: really check for A510 in a5xx_gpu_init
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230409011329.2365570-1-dmitry.baryshkov@linaro.org>
From:   Adam Skl <a39.skl@gmail.com>
In-Reply-To: <20230409011329.2365570-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9.04.2023 03:13, Dmitry Baryshkov wrote:

> The commit 010c8bbad2cb ("drm: msm: adreno: Disable preemption on Adreno
> 510") added special handling for a510 (this SKU doesn't seem to support
> preemption, so the driver should clamp nr_rings to 1). However the
> gpu->revn is not yet set (it is set later, in adreno_gpu_init()) and
> thus the condition is always false. Check config->rev instead.
>
> Fixes: 010c8bbad2cb ("drm: msm: adreno: Disable preemption on Adreno 510")
> Reported-by: Adam Skladowski <a39.skl@gmail.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 1e8d2982d603..a99310b68793 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1743,6 +1743,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>  {
>  	struct msm_drm_private *priv = dev->dev_private;
>  	struct platform_device *pdev = priv->gpu_pdev;
> +	struct adreno_platform_config *config = pdev->dev.platform_data;
>  	struct a5xx_gpu *a5xx_gpu = NULL;
>  	struct adreno_gpu *adreno_gpu;
>  	struct msm_gpu *gpu;
> @@ -1769,7 +1770,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>  
>  	nr_rings = 4;
>  
> -	if (adreno_is_a510(adreno_gpu))
> +	if (adreno_cmp_rev(ADRENO_REV(5, 1, 0, ANY_ID), config->rev))
>  		nr_rings = 1;
>  
>  	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, nr_rings);

After testing on Leeco S2 it appears to work as intended now, thanks.

Tested-by: Adam Skladowski <a39.skl@gmail.com>

