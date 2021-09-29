Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91DB841C652
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 16:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245480AbhI2OIu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Sep 2021 10:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245396AbhI2OIs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Sep 2021 10:08:48 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F27DBC061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 07:07:06 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id d21so4454854wra.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 07:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nfEwGjgggAw3RC5PjtAlfM1IIPoHD22gcfe9Wxip+W4=;
        b=vlEcJVIE2drS5FUj2os8Q6I6RHJy+sLfslE4hVThyUrlkUyZNKbyCS7VrO9nonp4OA
         4AedMORen+4vtoyZLSSn1Mt0l2IJ8mxEyfxB22ilo6Byd0AgNjaoSFY/y/p6bnbbp1vC
         icAGmkWfHHj4rCUaVAufKqAHRtx/pt9EWjDI5ILj8F/POYe5D3T98/eSq5YMMa3lrwWD
         pju8Vm7Rj0d8rOIdA8eBftUbRTqolRTe4wQ+1gHPaS2Ui/tVu+e0uACvgf1tyBlqwQVH
         Fcz5RbXAGcX1npqMW36hwbJiQR3BUXFghiWO371sNa1d0R6+Cl3cNAYqR3A0pm1xnWOs
         ifeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nfEwGjgggAw3RC5PjtAlfM1IIPoHD22gcfe9Wxip+W4=;
        b=1mX5sOqcO9yUYZDbYBG3JMBMZEdF/L1LWAZr7OtaJ7lCVTTjLUVa/JR9AA/BXFZUkv
         jrwpTDg+1csbss8lxGWRQYQsmQcGRdRncudXHNuv13aarvM7Uh93SA+GA48ssX9ZYTLC
         LX5UJCEBLqOD+5d+gtqECWdLwMoVGHKi1Wo1QGW+ZqVzb3uo0VEvCqcXB0ODt9J6TDXS
         FTeYcxLmAgqxWBzJteq/AkJiRd4UQi7hPbOjA6+r6QgA4DYMFd0Gf3wIQZ8h8//Uzpkv
         9dEbbMlQHZsHr7WPT+xvpywxClMn/1DrkPBMhZZCFjRmUnrF190xxf7bhyyY4zk41HTc
         pmhg==
X-Gm-Message-State: AOAM530Uje78z2Lv3kaiyReYZOeRXjsNOXkflP/SK/NZAmdEU/ntWgD/
        ye29CFE7TyUAR3eouZQk8ttlPg==
X-Google-Smtp-Source: ABdhPJwwynp1FW1I18RUwsni4hD08eGrpgV9tDjqycmnTkkXw7MfjAxGPNXhKzMB+ZsrH3n87wVFag==
X-Received: by 2002:adf:d1b3:: with SMTP id w19mr23794wrc.152.1632924424787;
        Wed, 29 Sep 2021 07:07:04 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id n68sm1774875wmn.13.2021.09.29.07.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 07:07:03 -0700 (PDT)
Subject: Re: [PATCH 3/4] misc: fastrpc: Set channel as secure
To:     Jeya R <jeyr@codeaurora.org>, linux-arm-msm@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        fastrpc.upstream@qti.qualcomm.com
References: <1632485951-13473-1-git-send-email-jeyr@codeaurora.org>
 <1632485951-13473-4-git-send-email-jeyr@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <1ec4cd1a-8e73-6c6f-da70-1ce01212269e@linaro.org>
Date:   Wed, 29 Sep 2021 15:07:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1632485951-13473-4-git-send-email-jeyr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 24/09/2021 13:19, Jeya R wrote:
> Set channel as secure based on domain ID and secure domain DT property.
> All DSP domains other than CDSP are set as secure by default and for
> CDSP domain, secure flag is set if property is added to DT file.
> 
> Signed-off-by: Jeya R <jeyr@codeaurora.org>
> ---
>   drivers/misc/fastrpc.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 07c41a5..631713d 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -216,6 +216,7 @@ struct fastrpc_channel_ctx {
>   	struct miscdevice miscdev;
>   	struct miscdevice securedev;
>   	struct kref refcount;
> +	bool secure;
>   };
>   
>   struct fastrpc_user {
> @@ -1646,6 +1647,12 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>   	if (!data)
>   		return -ENOMEM;
>   
> +	if (domain_id != CDSP_DOMAIN_ID)
> +		data->secure = true;
> +	else
> +		data->secure = of_property_read_bool(rdev->of_node,
> +				"qcom,secure-domain");
> +

This whole logic of marking domains secured based on dsp type needs some 
explanation.

--srini


>   	data->miscdev.minor = MISC_DYNAMIC_MINOR;
>   	data->miscdev.name = devm_kasprintf(rdev, GFP_KERNEL, "fastrpc-%s",
>   					    domains[domain_id]);
> 
