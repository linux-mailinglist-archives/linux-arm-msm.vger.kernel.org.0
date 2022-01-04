Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E414B48491A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jan 2022 21:10:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232220AbiADUKj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jan 2022 15:10:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbiADUKh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jan 2022 15:10:37 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C822C061761
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jan 2022 12:10:36 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id o12so84243464lfk.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jan 2022 12:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lzCOrsbgW0w9jAWs1oFFi9F+wrommK8KfX+OSG3gj2Y=;
        b=az+EHXY9pTBZJoKv3IoGnqtUAJV5GsLJIoTWL6S1Q/0c3EaksAoN51sjzqRkkl8Hg7
         d89EeYJZ3TlzAe67tTKe/lqff9DKHpqVyRbBP7eQLfFa+9h/3ikMTEHRrIGSoIZE7get
         XjsWQyPKnIx5C0pgdKlZlLjaajfjPRFdXhE5wbhSBjhiqoKexqNdTRUbfVTsC7PgCeE6
         OvNYMjub08si8/ZCmDySpDd9gsgowtg9m1tP70BzBKejFLeqUFpplLYlxN3sqvFOGOp1
         Pa6nqksfwV4EZ5IKh3Uu/ygkeWhEd+7lfVPdB+5TPjOsFYU/7PQ4uknQRMRiICNDwE3O
         iqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lzCOrsbgW0w9jAWs1oFFi9F+wrommK8KfX+OSG3gj2Y=;
        b=WrMuFGydE7lkDD1+PYtODChwt6PefW3gYWT8ENpF7H4CdJ3NIPcJJnQdOJJINrJOEf
         68cfnFXXoy6SG8YBP7GvJpR5qWoahHy5TpnrOLwunMLJRVUBIbN2FSORl84e8UZi8d7o
         ySsjYVfQZtPfkUxSfignKCUMNiCVekonzZvskYPV4bu7SkrYy4BU2jWaeCYtJmEhyM0F
         CeTV9itDpPOTcyddbmn/Jz+lfUGkmkXm4aSb9sSkeKg0RiF3C5U1WhLSmHqJFJk6dhyi
         RKCLcjFDMMwfbYjZoj+HR2+11+GVtCavwdPbv+Yh3adyDwX9E8SgxsFeYfMkjrELZiW1
         wbHQ==
X-Gm-Message-State: AOAM531SytTIvUTRJ4y7JUu8ZUDSDCOEaSNjvDv2u1oJdH1QTqaewUAF
        GLDglR6G8fAadOFs8MoKWtdBoA==
X-Google-Smtp-Source: ABdhPJyCqZjQ+77g2R70TLcVSxo1SSCvL/Ne2NzxACJ5jd1EOGM9lscIxxPn4F+khfJnmhacyXgg4g==
X-Received: by 2002:a05:6512:3f9f:: with SMTP id x31mr16806849lfa.391.1641327034373;
        Tue, 04 Jan 2022 12:10:34 -0800 (PST)
Received: from [192.168.1.102] (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id i12sm1098644lfr.119.2022.01.04.12.10.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jan 2022 12:10:34 -0800 (PST)
Subject: Re: [PATCH] usb: dwc3: dwc3-qcom: Add missing platform_device_put()
 in dwc3_qcom_acpi_register_core
To:     Miaoqian Lin <linmq006@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211231113641.31474-1-linmq006@gmail.com>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <83d55401-d8b3-f709-c77a-fa0e09fda27f@linaro.org>
Date:   Tue, 4 Jan 2022 22:10:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20211231113641.31474-1-linmq006@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/31/21 1:36 PM, Miaoqian Lin wrote:
> Add the missing platform_device_put() before return from
> dwc3_qcom_acpi_register_core in the error handling case.
> 

The discovered issue is valid.

Fixes: 2bc02355f8ba ("usb: dwc3: qcom: Add support for booting with ACPI")

> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>   drivers/usb/dwc3/dwc3-qcom.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 3cb01cdd02c2..5257783f17b0 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -598,8 +598,10 @@ static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
>   	qcom->dwc3->dev.coherent_dma_mask = dev->coherent_dma_mask;
>   
>   	child_res = kcalloc(2, sizeof(*child_res), GFP_KERNEL);
> -	if (!child_res)
> +	if (!child_res) {
> +		platform_device_put(qcom->dwc3);
>   		return -ENOMEM;

Please do it in a unified way along all checks:

		ret = -ENOMEM;
		goto out;

kfree(NULL) is legit, please utilize it.

> +	}
>   
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   	if (!res) {
> @@ -637,9 +639,13 @@ static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
>   	if (ret) {
>   		dev_err(&pdev->dev, "failed to add device\n");
>   		device_remove_software_node(&qcom->dwc3->dev);
> +		goto out;
>   	}

Please add a blank line here after the closing curly bracket.

> +	kfree(child_res);
> +	return 0;
>   
>   out:
> +	platform_device_put(qcom->dwc3);
>   	kfree(child_res);
>   	return ret;
>   }
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir
