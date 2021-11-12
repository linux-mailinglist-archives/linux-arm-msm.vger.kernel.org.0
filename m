Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69B1A44E4C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 11:42:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231173AbhKLKpl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 05:45:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233619AbhKLKpl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 05:45:41 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A83ADC06127A
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Nov 2021 02:42:50 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id b1so15406596lfs.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Nov 2021 02:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7EZ9QdgsdMAEVS3fE4SgINpNgX5xY0FsGu/mWvtIiQI=;
        b=IyfkYPacfZPnzhtulkfztchRIHnAT3Pu34SkkJh/8WnLOSqJHfCuK65VikFPNLJv9R
         /ZzsDa85wBpTIYScMQ7gsFDW126gMmxhPpx+V06SXgrLVOc3sblbJR4N8kyNdNsB5eZi
         GmBTKJoHiGnldBugYnYVEN2lqQUUUDhIGiuLTFEJ4xjIfozdoeeSQ0V0n+8FW7CxH73U
         Qx1HeN0sOO4TeWmADhQdhYqw4iNZnk6JWiycGHU4chYRg8dP2t5kC/xczz+RXs3fKXMu
         e+q8u7dA3vP1d/5Se3np6X69hBPadoeqJWfx9LQpZ9EeEl3ELuHX05w4hGKkDPkoY3x/
         4hgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7EZ9QdgsdMAEVS3fE4SgINpNgX5xY0FsGu/mWvtIiQI=;
        b=dqs1McoWK7ZBaydHsq8PsnlkLXwpqOveeGMOfOpU2DouvL+wu9qkIHN+SBXr2Mw6Sm
         3IJsy3iVjGAnv7XtI2bOOmWL/wWOoHfoS2mfxXRFvHAmKp8wjotuSUVWLaZfPP6arO8k
         zDhe/0CzJALhDjFJp4IoyaA/KbDYxI+fJVbne7m0uh3wb0t6+1Df9cBhjZVZewfZepg1
         HGuf4D/KUWxVTi/a3b1dOmaqUj7iYWfbcPS+pbmtjXd7//Vi5ERfK+OJMIWGys9Ysvqd
         2BFBKUFE0waAMk6mb1sCGmDMU5/ryX19GwIqDrbwx+a88rZ5HFaDnJ2doR8WaOasRZzw
         57XA==
X-Gm-Message-State: AOAM531ORmJl0liK06wyrFUpqcgJSqbukXfE6eIQlT+liBzNydbLrb6j
        kPK50w82BYaPnEkEjt6eHIAY1w==
X-Google-Smtp-Source: ABdhPJxc3CpcqYaTYVf/JJGUSc6lfqaDL4QcpqKBIaKsyDpKTEvakzYd+ikLWV0ZlWpi6tUbRfVkQg==
X-Received: by 2002:ac2:5f0d:: with SMTP id 13mr13334331lfq.334.1636713768917;
        Fri, 12 Nov 2021 02:42:48 -0800 (PST)
Received: from [192.168.1.102] (62-248-207-242.elisa-laajakaista.fi. [62.248.207.242])
        by smtp.gmail.com with ESMTPSA id x27sm529171lfq.192.2021.11.12.02.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 02:42:48 -0800 (PST)
Subject: Re: [PATCH v5 17/22] crypto: qce: Print a failure msg in case probe()
 fails
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        stephan@gerhold.net, Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thara Gopinath <thara.gopinath@linaro.org>
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
 <20211110105922.217895-18-bhupesh.sharma@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <5b8d5f23-e766-5b9c-986c-ef70fae9119e@linaro.org>
Date:   Fri, 12 Nov 2021 12:42:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20211110105922.217895-18-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bhupesh,

On 11/10/21 12:59 PM, Bhupesh Sharma wrote:
> Print a failure message (dev_err) in case the qcom qce crypto
> driver probe() fails.
> 
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Reviewed-by: Thara Gopinath <thara.gopinath@linaro.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>   drivers/crypto/qce/core.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index 98784d63d78c..7c90401a2ef1 100644
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c
> @@ -280,6 +280,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
>   err_mem_path_disable:
>   	icc_set_bw(qce->mem_path, 0, 0);
>   err:
> +	dev_err(dev, "%s failed : %d\n", __func__, ret);
>   	return ret;
>   }
>   
> 

in my opinion expressed earlier this change is not needed, but I'll recede,
if somebody thinks that the change is useful in any way.

--
Best wishes,
Vladimir
