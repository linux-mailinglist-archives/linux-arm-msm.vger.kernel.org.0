Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81D5B44E4B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 11:36:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234144AbhKLKjM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 05:39:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233441AbhKLKjM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 05:39:12 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59048C061766
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Nov 2021 02:36:21 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id n12so11610409lfe.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Nov 2021 02:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+ZekWpBm7nvoX5yGD/xw1EOH1c2Ekg7v4OjngJkSA8Q=;
        b=xDGqeWet/t2HP8OY1r7i+XyNKaxQnsEp7vRUBX+oS1if3CYBxiC/wn9JKGlC6xEOtp
         Q4M/w9aA1D1Q9FhWyLsRBF0jkoJJlywccNCNziudrdu52LnPFCt0zhDmEv+VqThwo25C
         r3XsxW9URW3GaztO1tv5hqg0eMQfRkKRGlNScM4WgJjQEbZ0nZSOFDZawmB8XrTccFxS
         B7GCOoQTx1MvjDVnU0oN7OZZ0DEKNjDxIkOYLtnlo7mGjHSr93uXsa4e4MR8pkxdGnHc
         XAH/SWnvZJaZ7vAConNPhi0FV6VLq2Knf+CfF12KVot4VRTa+D8G2JFl1q7XuNd86XVi
         dBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+ZekWpBm7nvoX5yGD/xw1EOH1c2Ekg7v4OjngJkSA8Q=;
        b=XK32wyACfh3lXEmbDwUSXiQ+08hTVW/eZjvjRLlTybM12Ji2J1yC1ZWoii5bfK644F
         YMDUSJ5psvBbOdBbIFe82ns6zhd/DubruOtXOw62mwF+K1cpy1ApWwCj+GM80GTUCQBq
         9ZgI4pbjZBLKBTn+M8+4m6YMPY4jSmwEA3nn5Hnh7nnhLmhoBXowXLc4BQDoij+E3Pjf
         a4bXW63aqeJtHLzi+v3L2SvreiYbaHYxbttp/vmqvG8PFCsSaUcK2Mi2dldLNB50oG/U
         nU9O6niw7rjb+jjkhxvV3y8CFiMjFvFbeFylhs/mh5QnQ3X4r17e9/tQlQHD1KKfJ7fm
         b6rA==
X-Gm-Message-State: AOAM532nuK0IvvcAHkz8Y1ZiSAYrkV2dXHqBEdMaxQ3oe6F/YX+HDmNL
        eEXaTOB/Gu3OCIy8Qc1zk8Y2sw==
X-Google-Smtp-Source: ABdhPJz3quEPlpLtMB6ie7ZzdpWRt1b1RS3VcaroVsV50tz5ZAP82kry1qyHYIaP+9ObqP4mjXn+bg==
X-Received: by 2002:a05:6512:1307:: with SMTP id x7mr12451124lfu.210.1636713379758;
        Fri, 12 Nov 2021 02:36:19 -0800 (PST)
Received: from [192.168.1.102] (62-248-207-242.elisa-laajakaista.fi. [62.248.207.242])
        by smtp.gmail.com with ESMTPSA id v14sm524851lfb.264.2021.11.12.02.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 02:36:19 -0800 (PST)
Subject: Re: [PATCH v5 15/22] crypto: qce: Add new compatibles for qce crypto
 driver
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        stephan@gerhold.net, Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
 <20211110105922.217895-16-bhupesh.sharma@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <f5b7c89c-3bdd-1e1e-772e-721aa5e95bbf@linaro.org>
Date:   Fri, 12 Nov 2021 12:36:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20211110105922.217895-16-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bhupesh,

On 11/10/21 12:59 PM, Bhupesh Sharma wrote:
> Since we decided to use soc specific compatibles for describing
> the qce crypto IP nodes in the device-trees, adapt the driver
> now to handle the same.
> 
> Keep the old deprecated compatible strings still in the driver,
> to ensure backward compatibility.
> 
> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>   drivers/crypto/qce/core.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index 89d9c01ba009..dd2604f5ce6a 100644
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c
> @@ -297,8 +297,12 @@ static int qce_crypto_remove(struct platform_device *pdev)
>   }
>   
>   static const struct of_device_id qce_crypto_of_match[] = {
> +	/* Following two entries are deprecated (kept only for backward compatibility) */
>   	{ .compatible = "qcom,crypto-v5.1", },
>   	{ .compatible = "qcom,crypto-v5.4", },
> +	/* Add compatible strings as per updated dt-bindings, here: */
> +	{ .compatible = "qcom,ipq6018-qce", },
> +	{ .compatible = "qcom,sdm845-qce", },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, qce_crypto_of_match);
> 

and two more compatibles should be added to the list, see my review
comment on v5 11/22.

--
Best wishes,
Vladimir
