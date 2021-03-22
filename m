Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A5C6345156
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Mar 2021 22:03:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbhCVVCh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 17:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231426AbhCVVCE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 17:02:04 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 159F0C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 14:02:04 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id f73-20020a9d03cf0000b02901b4d889bce0so17352795otf.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 14:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=GVI9PNUVxv58ToCrjDIYqik1KsupIaMOp6JJTQa0SbU=;
        b=chjtDVgqWXnkvauMyKZxQ17+ehGQUJw8+d3Z9y23ButcVhV+FnT5OmHkyMwAh93rHc
         37dBCH0xpxcNrxOVkLqX/3SQp9f9oUrKfzoyD4gWmE9ZX1RCjeofx6VVlO1gYB7cuoFu
         DPK+M1ibAW466mDUv7JbKIojV652wKV9Dppe+9pAGyLw2Ue6oJVyk8CaS4BAEghzb4AN
         exXJHb5ouyv2dwwvkmLTfDeLrW9gXgCiyX/eGlAjzNTTI0jEZZaB5dfeeFtJptKLTfBV
         etfLZ5b4kxCQbpJYr+XjCCn4So27OQeYrs9aKv78CTEKLGxMbdFry/QJA3m7CO9NydUY
         yShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GVI9PNUVxv58ToCrjDIYqik1KsupIaMOp6JJTQa0SbU=;
        b=V9fZIppkcqRxGIFXrTcCPAYbULhywZlZTsMDc7m2nUs12zr89Cz36/T+0oBy/YigZz
         D+5DJz77G49JlUy/Pl07F1J1daT5mEJfYbkyXcpfMa2pPq3X3BLlXQqFcQ59jzTs6Hye
         QrflueB0urXmCtCCZ09QaPh57qAlTC2dwX6a2iLyKahx5CFZr7e8LyTi1WShY2WG+8y9
         C6JtXFLPRPuejcA/pmFHyZ3A/aHdYkHNrXTOiMRbFcwTaHfIK93h+pZ9hXm4ADumiR6L
         EJ8vFo83D+7f6XsnjzbfoFG1niwUFKwPi1boejIrVZ+92NHExHcZSzurvUybIl4OrItc
         zYHg==
X-Gm-Message-State: AOAM530kWmpkOSWpyAgAvTslaFij4S2iXXniG4BjT02CzFjZzjTWoF7b
        zJ4cVxt4GTwihuHsUu879C2lr20fkCQebfIc
X-Google-Smtp-Source: ABdhPJw41orAps9fl8e8XGVDdfiiHRr2NQmqfLR1thPwEqZf7t8mOfzze/plYWoWAiRgG+kjm9K7Cw==
X-Received: by 2002:a05:6830:1c26:: with SMTP id f6mr1445138ote.53.1616446923464;
        Mon, 22 Mar 2021 14:02:03 -0700 (PDT)
Received: from ?IPv6:2806:10b7:2:e880:2c32:cfff:fe8e:de1f? ([2806:10b7:2:e880:2c32:cfff:fe8e:de1f])
        by smtp.gmail.com with ESMTPSA id g22sm3245746oop.7.2021.03.22.14.02.02
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 14:02:02 -0700 (PDT)
Subject: Re: [PATCH 4/5] soc: qcom: wcnss_ctrl: Allow reading firmware-name
 from DT
To:     linux-arm-msm@vger.kernel.org
References: <20210312003318.3273536-1-bjorn.andersson@linaro.org>
 <20210312003318.3273536-5-bjorn.andersson@linaro.org>
From:   Anibal Limon <anibal.limon@linaro.org>
Message-ID: <8adb0a00-7443-a480-30b5-45f9ecce3d35@linaro.org>
Date:   Mon, 22 Mar 2021 15:02:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312003318.3273536-5-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/11/21 6:33 PM, Bjorn Andersson wrote:
> The WLAN NV firmware blob differs between platforms, and possibly
> devices, so add support in the wcnss_ctrl driver for reading the path of
> this file from DT in order to allow these files to live in a generic
> file system (or linux-firmware).
> 
> The new property is optional and the code falls back to the old filename
> if the property isn't specified.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Aníbal Limón <anibal.limon@linaro.org>
> ---
>   drivers/soc/qcom/wcnss_ctrl.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/qcom/wcnss_ctrl.c b/drivers/soc/qcom/wcnss_ctrl.c
> index 358526b9de06..2a06d631e415 100644
> --- a/drivers/soc/qcom/wcnss_ctrl.c
> +++ b/drivers/soc/qcom/wcnss_ctrl.c
> @@ -200,6 +200,7 @@ static int wcnss_download_nv(struct wcnss_ctrl *wcnss, bool *expect_cbc)
>   	struct wcnss_download_nv_req *req;
>   	const struct firmware *fw;
>   	struct device *dev = wcnss->dev;
> +	const char *nvbin = NVBIN_FILE;
>   	const void *data;
>   	ssize_t left;
>   	int ret;
> @@ -208,10 +209,13 @@ static int wcnss_download_nv(struct wcnss_ctrl *wcnss, bool *expect_cbc)
>   	if (!req)
>   		return -ENOMEM;
>   
> -	ret = request_firmware(&fw, NVBIN_FILE, dev);
> +	ret = of_property_read_string(dev->of_node, "firmware-name", &nvbin);
> +	if (ret < 0 && ret != -EINVAL)
> +		goto free_req;
> +
> +	ret = request_firmware(&fw, nvbin, dev);
>   	if (ret < 0) {
> -		dev_err(dev, "Failed to load nv file %s: %d\n",
> -			NVBIN_FILE, ret);
> +		dev_err(dev, "Failed to load nv file %s: %d\n", nvbin, ret);
>   		goto free_req;
>   	}
>   
> 
