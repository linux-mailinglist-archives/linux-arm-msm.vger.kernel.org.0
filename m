Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A71CF345154
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Mar 2021 22:02:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231455AbhCVVCF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 17:02:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbhCVVBi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 17:01:38 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF21EC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 14:01:35 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id a8so14591833oic.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 14:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=asjuGJGEOTEfrFrxkc5uKXC63GPD91QQyu+4R5YULTs=;
        b=X0eq0p8wzJ4I7EB/0feFJySDoRegM5/KgdcgRsW90iLzBlPbBaVrzOGUS/MZwGKfuQ
         rfK1E5Gha/U2ieDC90eBWDIdVpNPpwA64rA2TELSWfu0nrLyVYD07qjfGtfT4yh3QuI5
         YxrNvVPD6QACQRlKLMS0TRZCcCyg0zV5Ykb8s5lB8zO1rUs6esnHAvf1y9r3R86fvKIz
         IuM8VlRD3br/ttjN+frj/QnqsaxjP63ZpO/nLhluoUYQI7gBG6me4uY6nV83DwbHEqet
         SL/N3KO4ppdx75oP1wTa1HUe39TTj+6+5NXFlrHLP/pottrTV6rRVlwKrxoc7QwBLObw
         hQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=asjuGJGEOTEfrFrxkc5uKXC63GPD91QQyu+4R5YULTs=;
        b=QEpbUp/pc3Sci0oCmBW2gG6YY/ZvGYRpAEqFo+lRVep5CVWMDw/rV9D3k/zDkoCHvh
         zwaejfwGL/CJVBQTpaVa6LI65jHSQvDCuNU99y0iml7ixmMRyLt7nk0IKSKAnqLWPeSR
         5h5YVTxrA5greRkzthDehHNZ2m3rH7taOYpbkilRps5S0Xv3ZZz4+dCgkFgZHJ4h2kcG
         RHzF6HzeaHdOzx+Kct0WfBzpuwvFuoFVPV9C6ZtoVwYIOUDXrFfOv4aQML6yz/BruobU
         bWHPs3OO4IfbbahRMVqW5vIBeihZ/p8MlXAzXOdzADITbH7NVbMAKGLc3wQ7pUHdWfgL
         YWQA==
X-Gm-Message-State: AOAM531U05jROKUsTTMJjIODC8wyBKtoqVwksURVH/zyfTlugcR35/M5
        xRPzIcx1veMBDtjextBImXaoWArNJrE5qB5u
X-Google-Smtp-Source: ABdhPJyxjnhFSOS+FxUD+JERLC4qPmi9qIGy7kD6H9lOaHaY55oKtT7Uu7Nc9UJfA2c4VNh9VhwDDw==
X-Received: by 2002:a05:6808:1cc:: with SMTP id x12mr698032oic.113.1616446895304;
        Mon, 22 Mar 2021 14:01:35 -0700 (PDT)
Received: from ?IPv6:2806:10b7:2:e880:2c32:cfff:fe8e:de1f? ([2806:10b7:2:e880:2c32:cfff:fe8e:de1f])
        by smtp.gmail.com with ESMTPSA id y194sm3231160ooa.19.2021.03.22.14.01.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 14:01:34 -0700 (PDT)
Subject: Re: [PATCH 2/5] wcn36xx: Allow firmware name to be overridden by DT
To:     linux-arm-msm@vger.kernel.org
References: <20210312003318.3273536-1-bjorn.andersson@linaro.org>
 <20210312003318.3273536-3-bjorn.andersson@linaro.org>
From:   Anibal Limon <anibal.limon@linaro.org>
Message-ID: <7a4820b4-428c-9790-5138-e032ae06a9f1@linaro.org>
Date:   Mon, 22 Mar 2021 15:01:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312003318.3273536-3-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/11/21 6:33 PM, Bjorn Andersson wrote:
> The WLAN NV firmware blob differs between platforms, and possibly
> devices, so add support in the wcn36xx driver for reading the path of
> this file from DT in order to allow these files to live in a generic
> file system (or linux-firmware).
> 
> For some reason the parent (wcnss_ctrl) also needs to upload this blob,
> so rather than specifying the same information in both nodes wcn36xx
> reads the string from the parent's of_node.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Aníbal Limón <anibal.limon@linaro.org>
> ---
> 
> This patch can be applied independently of the others, but relates to the
> acceptance of the addition to the DT binding (in patch 1/5). So my suggestion
> is that this one goes through the ath tree and the others through the Qualcomm
> SoC tree.
> 
>   drivers/net/wireless/ath/wcn36xx/main.c    | 7 +++++++
>   drivers/net/wireless/ath/wcn36xx/smd.c     | 4 ++--
>   drivers/net/wireless/ath/wcn36xx/wcn36xx.h | 1 +
>   3 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wireless/ath/wcn36xx/main.c
> index afb4877eaad8..87b5c0ff16c0 100644
> --- a/drivers/net/wireless/ath/wcn36xx/main.c
> +++ b/drivers/net/wireless/ath/wcn36xx/main.c
> @@ -1407,6 +1407,13 @@ static int wcn36xx_probe(struct platform_device *pdev)
>   		goto out_wq;
>   	}
>   
> +	wcn->nv_file = WLAN_NV_FILE;
> +	ret = of_property_read_string(wcn->dev->parent->of_node, "firmware-name", &wcn->nv_file);
> +	if (ret < 0 && ret != -EINVAL) {
> +		wcn36xx_err("failed to read \"firmware-name\" property\n");
> +		goto out_wq;
> +	}
> +
>   	wcn->smd_channel = qcom_wcnss_open_channel(wcnss, "WLAN_CTRL", wcn36xx_smd_rsp_process, hw);
>   	if (IS_ERR(wcn->smd_channel)) {
>   		wcn36xx_err("failed to open WLAN_CTRL channel\n");
> diff --git a/drivers/net/wireless/ath/wcn36xx/smd.c b/drivers/net/wireless/ath/wcn36xx/smd.c
> index d0c3a1557e8d..7b928f988068 100644
> --- a/drivers/net/wireless/ath/wcn36xx/smd.c
> +++ b/drivers/net/wireless/ath/wcn36xx/smd.c
> @@ -514,10 +514,10 @@ int wcn36xx_smd_load_nv(struct wcn36xx *wcn)
>   	u16 fm_offset = 0;
>   
>   	if (!wcn->nv) {
> -		ret = request_firmware(&wcn->nv, WLAN_NV_FILE, wcn->dev);
> +		ret = request_firmware(&wcn->nv, wcn->nv_file, wcn->dev);
>   		if (ret) {
>   			wcn36xx_err("Failed to load nv file %s: %d\n",
> -				      WLAN_NV_FILE, ret);
> +				    wcn->nv_file, ret);
>   			goto out;
>   		}
>   	}
> diff --git a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h b/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
> index 71fa9992b118..5977af2116e3 100644
> --- a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
> +++ b/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
> @@ -185,6 +185,7 @@ struct wcn36xx {
>   	struct device		*dev;
>   	struct list_head	vif_list;
>   
> +	const char		*nv_file;
>   	const struct firmware	*nv;
>   
>   	u8			fw_revision;
> 
