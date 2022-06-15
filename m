Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 491A554C856
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jun 2022 14:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348060AbiFOMU5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 08:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241371AbiFOMU5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 08:20:57 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 013FF36E3D
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 05:20:55 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id e4so13079039ljl.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 05:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tzCBDGq5tGP2jW5rnyj4CLiseepU/qiH2K3m08j9gZQ=;
        b=K/iR/Jes4UImRpP9oPymqXSfBpOXxjBX/klSVMZxUQX0B3jmYTwpMevJVw9Bnm221j
         hnDovWtI96/30CVVsP8nOIgC04xORFFFdRaXazvIr16nw2ktjTJM9kqbmX6qxOUHbdYN
         flAiZIc9tn41EVx3SMnwQl+aS+ZW8fQIyVC61ZRxhzFKegIXXCtqpoHrNPjRqDdPb//V
         BcgAjnAiDKwsRvQSCpLnC5WXailqtBcceD0aJNOAU51RICuYtvzzrcV5f3ERlist4Btf
         sqixFsrqDMQwhOTWen74dmJLfvTH47zQFQCJbt80BhhyjwCvLkJkcz35nUBSWz7TNsoY
         btlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tzCBDGq5tGP2jW5rnyj4CLiseepU/qiH2K3m08j9gZQ=;
        b=6is1dSZyvtmnlbfmsPPPwF/M6Tn46jVET5YjSP4rEZw68juoHJI1VvBZG843lNIha0
         oXXfqE2wZcDsZZXifXvpuXlIJeTYCFcpd1CeCQx6NPRJ+Kgy1x0yq2z4e9K0kTi1gosu
         9xs4B80Scr26x4tumT3kMEZ0hZdJsrY9IPnDs7lsVRJry3iRdmSd4ZTr5cMUEDWOJtab
         bTMyZ4jxu/xZi4ypPrMkJ2wTYa/bGNkryu8iiHBwACoL98NQT3Uh1V4xshlGoE0zS3xI
         Yigkb5vPbscmDMLddCAnDfu0dcTQzSibaF6OVQLqtyUzxlcnKzV77DmDTF8xA73Duh5k
         iyBg==
X-Gm-Message-State: AJIora9CryzqsQwv/5F9BqgAXbxGH7geADoKK+PN0pYlFBqwGi3YKrja
        yg8xGjTxMNDJtp954UjBNm4Tbw==
X-Google-Smtp-Source: AGRyM1tXizTF3DMpBDe2HwCwP04IOR9oCCKUA7x0NKnvosFst6z4y8wzPyxa9IaqrtXKhCjtZtRGaQ==
X-Received: by 2002:a2e:3315:0:b0:258:dfff:e252 with SMTP id d21-20020a2e3315000000b00258dfffe252mr5229345ljc.141.1655295654031;
        Wed, 15 Jun 2022 05:20:54 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f18-20020a19dc52000000b0047255d21128sm1786085lfj.87.2022.06.15.05.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 05:20:53 -0700 (PDT)
Message-ID: <e78fb0d3-a7ea-9f0b-ae42-fac76e54aa6a@linaro.org>
Date:   Wed, 15 Jun 2022 15:20:52 +0300
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
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
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
> 
> Fixes: 623f279c778 ("drm/msm: fix shutdown hook in case GPU components failed to bind")
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


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
