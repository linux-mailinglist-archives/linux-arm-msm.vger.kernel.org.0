Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC0E345153
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Mar 2021 22:02:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhCVVCG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 17:02:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbhCVVBw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 17:01:52 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 093B1C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 14:01:52 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id i81so13112150oif.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 14:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=WCINTJgt4zFYUYMaB4kxoZ7C6Ls9cVHM007EhAjKFvU=;
        b=LkziIeQgdzhq+bea+RBqN/G+NpNxoRBHEzLsmujS81qctj3SCYIOEq70bL71kpZnii
         sRSt0TOYLgtNSaBfraWmoecKYAKQK6UP2mLGjokU8UL29zjQBrItiwxDvKQ1gww97rr6
         9ODziEjCjqx/wQaPL9GEdyqbVvRsl+RuNFUO7mh4g/R9xB6WiRVNIeyPjSUkSlRqAwd2
         wLcdrKREa26+AXRNeW7z64iY0DWV1CLK++Y/YvdVmNlulrb14XPO0QlkR28H0+ifGlJZ
         RBOC1AdJVgZ9Gu7mdwlgvILp6yWUrwfmDWmaoAl9jNDZhIxyfOJdqMxYOUEXqcA7jg+i
         VcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WCINTJgt4zFYUYMaB4kxoZ7C6Ls9cVHM007EhAjKFvU=;
        b=NiutPvqq9qSQHf4yG9ge9GZnDqh9oHSi0usjKBRH4e50CfaJHG0SZDNrBij39m2wt9
         CWiYKKGAugfROiu2gxmq57NDILlgWKMDsIK99nn/3LutzqbrLMYpYzzh0+tqFXp/3E8L
         Noq40V5xR16Ux50GKOJiZNuJ2IZ1kaBMEgdbHDZbVGYaRGQsETyXhpYpdpQ+yoRWBwND
         /u8JIFWJuas8htz/UtMwIRA9fcb2uSaXaOIc66AfwQow7X9pdKP56R3fSiyrxCYnXZ3d
         fNa1IU9bshVTz1NnZrny0dKlwjsKarhuO6Lq5x8WUSpaPz5Hg9jfOL25ihu0eMW6H5EM
         u8Pw==
X-Gm-Message-State: AOAM532hyLgCYuL9xQ8JuBqFEdaNaG/NzH4UJ9Z54uYA3s1wlAHefs1O
        fZ0mGE+0xTfGqWEQ7xkRDg8RdAzBbQDVKm9j
X-Google-Smtp-Source: ABdhPJzTm38FfTWkv40h3qvkuteKec0G8RbglOX1XMFradAU3YCm3413euOpvHyQ+lvtNAETNnV4UQ==
X-Received: by 2002:aca:a8c9:: with SMTP id r192mr685501oie.15.1616446911440;
        Mon, 22 Mar 2021 14:01:51 -0700 (PDT)
Received: from ?IPv6:2806:10b7:2:e880:2c32:cfff:fe8e:de1f? ([2806:10b7:2:e880:2c32:cfff:fe8e:de1f])
        by smtp.gmail.com with ESMTPSA id h17sm3594870otj.38.2021.03.22.14.01.50
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 14:01:51 -0700 (PDT)
Subject: Re: [PATCH 3/5] soc: qcom: wcnss_ctrl: Introduce local variable "dev"
To:     linux-arm-msm@vger.kernel.org
References: <20210312003318.3273536-1-bjorn.andersson@linaro.org>
 <20210312003318.3273536-4-bjorn.andersson@linaro.org>
From:   Anibal Limon <anibal.limon@linaro.org>
Message-ID: <7972761a-d5a7-1502-896d-489c875521fa@linaro.org>
Date:   Mon, 22 Mar 2021 15:01:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312003318.3273536-4-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/11/21 6:33 PM, Bjorn Andersson wrote:
> Introduce a local variable to carry the struct device *, to reduce the
> line lengths in the next patch.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Aníbal Limón <anibal.limon@linaro.org>
> ---
>   drivers/soc/qcom/wcnss_ctrl.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/qcom/wcnss_ctrl.c b/drivers/soc/qcom/wcnss_ctrl.c
> index 32bed249f90e..358526b9de06 100644
> --- a/drivers/soc/qcom/wcnss_ctrl.c
> +++ b/drivers/soc/qcom/wcnss_ctrl.c
> @@ -199,6 +199,7 @@ static int wcnss_download_nv(struct wcnss_ctrl *wcnss, bool *expect_cbc)
>   {
>   	struct wcnss_download_nv_req *req;
>   	const struct firmware *fw;
> +	struct device *dev = wcnss->dev;
>   	const void *data;
>   	ssize_t left;
>   	int ret;
> @@ -207,9 +208,9 @@ static int wcnss_download_nv(struct wcnss_ctrl *wcnss, bool *expect_cbc)
>   	if (!req)
>   		return -ENOMEM;
>   
> -	ret = request_firmware(&fw, NVBIN_FILE, wcnss->dev);
> +	ret = request_firmware(&fw, NVBIN_FILE, dev);
>   	if (ret < 0) {
> -		dev_err(wcnss->dev, "Failed to load nv file %s: %d\n",
> +		dev_err(dev, "Failed to load nv file %s: %d\n",
>   			NVBIN_FILE, ret);
>   		goto free_req;
>   	}
> @@ -235,7 +236,7 @@ static int wcnss_download_nv(struct wcnss_ctrl *wcnss, bool *expect_cbc)
>   
>   		ret = rpmsg_send(wcnss->channel, req, req->hdr.len);
>   		if (ret < 0) {
> -			dev_err(wcnss->dev, "failed to send smd packet\n");
> +			dev_err(dev, "failed to send smd packet\n");
>   			goto release_fw;
>   		}
>   
> @@ -248,7 +249,7 @@ static int wcnss_download_nv(struct wcnss_ctrl *wcnss, bool *expect_cbc)
>   
>   	ret = wait_for_completion_timeout(&wcnss->ack, WCNSS_REQUEST_TIMEOUT);
>   	if (!ret) {
> -		dev_err(wcnss->dev, "timeout waiting for nv upload ack\n");
> +		dev_err(dev, "timeout waiting for nv upload ack\n");
>   		ret = -ETIMEDOUT;
>   	} else {
>   		*expect_cbc = wcnss->ack_status == WCNSS_ACK_COLD_BOOTING;
> 
