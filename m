Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29E67225A54
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 10:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgGTItc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 04:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbgGTItb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 04:49:31 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1853C061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 01:49:30 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id s10so16918076wrw.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 01:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=T8ClyyvUS1HGIuXRSrIiq2ku06WP9e6Tf1QIkjSm0IU=;
        b=rPlOgRs8A1cyffmJ8kUeZfYxDEGcx+y7fbFetyvIiM0TAkm7guBou08bpgMq+AoLBl
         3Bk5ilX5FXideru3zmSJYZPeMyUz1eOnVHNca001lMBaSPvl+4i5HiZXPb82VCKf9VCF
         w1IHGbe1tK5Z5D1ZJHsGtVen5r+YAtiqGXEDXRxg2n8dqJsD3XPGc2lZnRNfJXimLxRL
         1OQqA1uZEQ6/vSytNMxirgxqlXrXL2YNDo4UIAE5CF+4M6WF/6nYKKwVEH+0feIwAPHY
         5iD1WuLWSCYDwT9Sms510fic8owjy8QVdgg3vgDCIZYT1bCNpuX2hLc7pern0iDH54Q/
         ggGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=T8ClyyvUS1HGIuXRSrIiq2ku06WP9e6Tf1QIkjSm0IU=;
        b=tzhZofqbHyKXA2O9wq6qhxunpQnmibPoAwoOTsGjESCqN5+yy4bL7oG1gg3ijbCgqI
         BkbxvqaKDDxvxdujAPcnivKuO4iAovKWPmVuZfydQR+XHzUICOY4FoLxeUiKLnwQSUPI
         3GlC1DOE+g+tvZbQ7n9iA1VlJjT7nKoTBjbfQPg7gYoEIsqfzpikjplL2ozvIRNOsB8x
         pY6pgSHdIVAEWeqZoS37sCfatwU2OWo1h//8fjkLgCiz59YC5WYls9uOdDXWFdBz2pM3
         mVEfu1s305CgquFG8bD+Ya6SAOGdGsn6hNvhVFVm1m0BsVbfoE2dwHwwl5o44nVeq/jK
         GWKg==
X-Gm-Message-State: AOAM5329RMeCxRDYDljIIm1YYsj6aXdvw0hV3xFPZ2reHNvapf5LwTjJ
        2L5rfTILWHDRmH9/wpI6FLmV3Q==
X-Google-Smtp-Source: ABdhPJwHNLzn6zy7vKBKFGBocNEVPI4flam0qLvEZ5TaQYlW7qhPWytYzRY1XBWZI2LRGjd2jl24bQ==
X-Received: by 2002:a5d:4b4f:: with SMTP id w15mr20741378wrs.84.1595234969543;
        Mon, 20 Jul 2020 01:49:29 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id k18sm31892822wrx.34.2020.07.20.01.49.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2020 01:49:28 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] nvmem: qcom-spmi-sdam: Enable multiple devices
To:     Guru Das Srinagesh <gurus@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Cc:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org
References: <1594684888-19090-1-git-send-email-gurus@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <b6f5edf4-2b1c-349c-d070-ac7bc76af42d@linaro.org>
Date:   Mon, 20 Jul 2020 09:49:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1594684888-19090-1-git-send-email-gurus@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 14/07/2020 01:01, Guru Das Srinagesh wrote:
> Specifying the name of the nvmem device while registering it with the
> nvmem framework has the side effect of causing the second instance of a
> device using this driver to fail probe with the following error message:
> 
>    sysfs: cannot create duplicate filename '/bus/nvmem/devices/spmi_sdam'
> 
> Removing the name allows the nvmem framework to assign a monotonically
> increasing integer id to each instance of this driver automatically,
> like so:
> 
>    /sys/bus/nvmem/devices # ls
>    nvmem0  nvmem1  nvmem2
> 
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> ---
>   drivers/nvmem/qcom-spmi-sdam.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/nvmem/qcom-spmi-sdam.c b/drivers/nvmem/qcom-spmi-sdam.c
> index 8682cda..6275f14 100644
> --- a/drivers/nvmem/qcom-spmi-sdam.c
> +++ b/drivers/nvmem/qcom-spmi-sdam.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Copyright (c) 2017 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2017, 2020 The Linux Foundation. All rights reserved.
>    */
>   
>   #include <linux/device.h>
> @@ -140,8 +140,6 @@ static int sdam_probe(struct platform_device *pdev)
>   	sdam->size = val * 32;
>   
>   	sdam->sdam_config.dev = &pdev->dev;
> -	sdam->sdam_config.name = "spmi_sdam";
> -	sdam->sdam_config.id = pdev->id;

Please use new flag NVMEM_DEVID_AUTO introduced in 
https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git/commit/?h=for-next&id=93ac5fdba1eddc679e9694b64f2fa321317df988 
  instead of pdev->id, which should fix the issue.

--srini

>   	sdam->sdam_config.owner = THIS_MODULE,
>   	sdam->sdam_config.stride = 1;
>   	sdam->sdam_config.word_size = 1;
> 
