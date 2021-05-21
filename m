Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC55538BC06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 03:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237901AbhEUB4g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 21:56:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237882AbhEUB4g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 21:56:36 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D1D6C0613CE
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 18:55:14 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id h24so2899358qtm.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 18:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fwiHAMDwaEBdHTRR64T2XvPf2rYlFu2icAvRI/d7T1I=;
        b=zMWi9VKDjUCoAvJ0fA7qzIu2MsoWVDeBz+toiOHCCNEYl9SRV1zn+HZZnTQlJBI6G3
         H9x8R3l+HXuAVaMlhZZOh8aYmsb/QychwpkNJ+rT/plAh//NKnTiwZ4JrG0EqT8Nrw3W
         5qhCILVe2T1zUGo3IqVLQ+YcnvzOCmmirl4TsX40HxjFf/qDMGA9pJQYGtne6ew+KnOv
         CfS79JurOQmmwHJ+WkkI40L4kRXC5mPgHY+rChSCAtOfir1ftsFCfRi2wYoHitQGbIAY
         5seRnAFc6wpT2/LSFXcCYq8DAnzEkA8iYJbIIDFDwarUSpt5GQiO0oC5mGaN6Ob5rWRF
         wopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fwiHAMDwaEBdHTRR64T2XvPf2rYlFu2icAvRI/d7T1I=;
        b=LWOyDtp/mgckX+kHc/FF4i4IQf5WyfdpNMmGtNgtpEgK0gwvImW8kcTw3lKI0HhM21
         SkXvtbA7GSWWIpBi8SwRLhQa2ly/IPId3g7BTnGylRnZ4Z4rQLwr00c0wWZc6xvINWn+
         7PpGqVWUJ23T1qEm8fvf4M0YxFsQqxkbthS6vKL+rvmpyxxwttoIYK5stweW+iaHjFsY
         vTmee+I9Q8XG0cryc1YBaGNO+QnGB1Yn9ld+U2c16yVtzihTiCggQly2q1g6lK3wJQPO
         egb+UatiWmiQO3+dnO0LUY2ee6BYcv+asUVQIQkIDDEH/sIcPG3xWXOh8EOu41d8EE/j
         R11A==
X-Gm-Message-State: AOAM531dy38dKbIiKzAwHhMyw5Mdlum2+BQqTAglk8zgQMDSsgEJE45+
        Med0EbrxDQXTwUlXNU86usd6eA==
X-Google-Smtp-Source: ABdhPJwaD9dTnZOk7H0JrFBWu4neTsWggW+sHCNqzVuNjKTsqrhNsiGX410biNoVKSQrHvE+ZvvSeA==
X-Received: by 2002:ac8:7d0c:: with SMTP id g12mr8974906qtb.224.1621562113144;
        Thu, 20 May 2021 18:55:13 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id t6sm3725006qkh.117.2021.05.20.18.55.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 May 2021 18:55:12 -0700 (PDT)
Subject: Re: [PATCH v3 14/17] crypto: qce: Print a failure msg in case probe()
 fails
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com
References: <20210519143700.27392-1-bhupesh.sharma@linaro.org>
 <20210519143700.27392-15-bhupesh.sharma@linaro.org>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <d3fb760c-5c18-8290-86d4-1b582d12b568@linaro.org>
Date:   Thu, 20 May 2021 21:55:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210519143700.27392-15-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/19/21 10:36 AM, Bhupesh Sharma wrote:
> Print a failure message (dev_err) in case the qcom qce crypto
> driver probe() fails.
> 
> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: David S. Miller <davem@davemloft.net>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: dmaengine@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-crypto@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: bhupesh.linux@gmail.com
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

I kind of felt you can club patch 14 and 15. But it is upto you..
FWIW,

Reviewed-by: Thara Gopinath <thara.gopinath@linaro.org>


Warm Regards
Thara

> ---
>   drivers/crypto/qce/core.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index 8c3c68ba579e..aecb2cdd79e5 100644
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c
> @@ -300,6 +300,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
>   err_clks_core:
>   	clk_disable_unprepare(qce->core);
>   err_out:
> +	dev_err(dev, "%s failed : %d\n", __func__, ret);
>   	return ret;
>   }
>   
> 


