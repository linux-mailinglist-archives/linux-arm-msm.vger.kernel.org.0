Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA69B53C7CB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jun 2022 11:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243148AbiFCJoq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jun 2022 05:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243141AbiFCJoo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jun 2022 05:44:44 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83DC22DD54
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jun 2022 02:44:42 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id u23so11794040lfc.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jun 2022 02:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8jvPxXIiogQWZXupdX922CHoFednIGVLXVXf4QrHgiY=;
        b=O+UOlhaU1GPM2ffiLXlaOOMPGwOgfFKeYFBHms9Z8euUAUJMN780YC1U5nRTDDWGQ3
         4P1TMXkIg2nzQtv6Tp1TuxJ/QINIw9PazrWgt5IE0uzXCGT4o6iBDE+S1po2vLqoq3r4
         7ApFEsva8AT52NIR0mH/mDjoj+t6A9cC9bVtOjeWL6jZQXMk0IhxlpxdKx5PaBA9AFAB
         WHHcjMLbejA1cwApeH1b+djfmVvnhn54wv07zDj3HIt/13AEeHqWo9v3tIUpfATBwWhR
         M0ZzrA69wATnpkeRmnXLyhcvM72dUyL3htH+LN21JM2qsIchR9JbZpJZa9JUBMgfsbD7
         a/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8jvPxXIiogQWZXupdX922CHoFednIGVLXVXf4QrHgiY=;
        b=RYVJeeKuLYupEFeE6j6Q8P5knS7Lsk8tc8bD9Lb2EUg6SKw4B7m6L1u3W8SAwYv/QK
         aAUHlM/jByZowvsxyiLx902hqRLjOjIOEqx2k1SCCgbKauStZDKmEXH70ROQPTWozMvU
         /vUNk3odVnz8uzZK7usmfIkJkMorW+yhClPnLn3Ul3ioy5GJmAn06+wbNxN66pnnZJM/
         1avA3ygwCvuHEwP3On4GS5xf4DkRAHcDB+kKop8rAcSguCjXyEKnbipc7htjoXrtUQCi
         NKzqlKAli1tXXPruQGWY2dHHLYvprThSCeG9BekMjg7/hNe8D3aHhYBlbWKGSBIz9ReQ
         qSNg==
X-Gm-Message-State: AOAM533TDP6lL+RUCF5nl6H6tVqtPsZBA/bWUF6OHC44lFEqrJ6oJBjN
        gSlDXJy9FSJdp2F6+l9E5kiquQ==
X-Google-Smtp-Source: ABdhPJyZegfaWSTXswsrJxcn+pcCQNNZ/clp5ept6GyUSg+T+X/U1x6nsEJb4dwGWdJLV5++QVgCPw==
X-Received: by 2002:a05:6512:2115:b0:479:ba9:25c1 with SMTP id q21-20020a056512211500b004790ba925c1mr6124265lfr.591.1654249480917;
        Fri, 03 Jun 2022 02:44:40 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e29-20020a19691d000000b0047255d21202sm1397159lfc.305.2022.06.03.02.44.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jun 2022 02:44:40 -0700 (PDT)
Message-ID: <9e398930-6918-e95e-e15d-f8901047b9b7@linaro.org>
Date:   Fri, 3 Jun 2022 12:44:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [v2] drm/msm: add null checks for drm device to avoid crash
 during probe defer
Content-Language: en-GB
To:     Vinod Polimera <quic_vpolimer@quicinc.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, vpolimer@quicinc.com, swboyd@chromium.org,
        kalyant@quicinc.com
References: <1654249343-24959-1-git-send-email-quic_vpolimer@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1654249343-24959-1-git-send-email-quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/06/2022 12:42, Vinod Polimera wrote:
> During probe defer, drm device is not initialized and an external
> trigger to shutdown is trying to clean up drm device leading to crash.
> Add checks to avoid drm device cleanup in such cases.
> 
> BUG: unable to handle kernel NULL pointer dereference at virtual
> address 00000000000000b8
> 
> Call trace:
> 
> drm_atomic_helper_shutdown+0x44/0x144
> msm_pdev_shutdown+0x2c/0x38
> platform_shutdown+0x2c/0x38
> device_shutdown+0x158/0x210
> kernel_restart_prepare+0x40/0x4c
> kernel_restart+0x20/0x6c
> __arm64_sys_reboot+0x194/0x23c
> invoke_syscall+0x50/0x13c
> el0_svc_common+0xa0/0x17c
> do_el0_svc_compat+0x28/0x34
> el0_svc_compat+0x20/0x70
> el0t_32_sync_handler+0xa8/0xcc
> el0t_32_sync+0x1a8/0x1ac
> 
> Changes in v2:
> - Add fixes tag.

I'm still waiting for an answer to the questions raised in v1 review.

> 
> Fixes: 623f279c778 ("drm/msm: fix shutdown hook in case GPU components failed to bind")
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 4448536..d62ac66 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -142,6 +142,9 @@ static void msm_irq_uninstall(struct drm_device *dev)
>   	struct msm_drm_private *priv = dev->dev_private;
>   	struct msm_kms *kms = priv->kms;
>   
> +	if (!irq_has_action(kms->irq))
> +		return;
> +
>   	kms->funcs->irq_uninstall(kms);
>   	if (kms->irq_requested)
>   		free_irq(kms->irq, dev);
> @@ -259,6 +262,7 @@ static int msm_drm_uninit(struct device *dev)
>   
>   	ddev->dev_private = NULL;
>   	drm_dev_put(ddev);
> +	priv->dev = NULL;
>   
>   	destroy_workqueue(priv->wq);
>   
> @@ -1167,7 +1171,7 @@ void msm_drv_shutdown(struct platform_device *pdev)
>   	struct msm_drm_private *priv = platform_get_drvdata(pdev);
>   	struct drm_device *drm = priv ? priv->dev : NULL;
>   
> -	if (!priv || !priv->kms)
> +	if (!priv || !priv->kms || !drm)
>   		return;
>   
>   	drm_atomic_helper_shutdown(drm);


-- 
With best wishes
Dmitry
