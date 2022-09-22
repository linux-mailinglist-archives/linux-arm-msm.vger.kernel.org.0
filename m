Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 119BD5E62B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 14:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231516AbiIVMqt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 08:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231530AbiIVMqR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 08:46:17 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A41E9E11DC
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 05:46:04 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id cc5so15371359wrb.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 05:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=iW/HmlkUSePa8U4fkh6njA33HFa+ZhXmwd5ivDrMRoU=;
        b=n3Yq/b/KU0qnX4YnUfFJHBn46tzBINYgtWGSjwMmQECl3BWgVWyWG7bykS0AUPFSF0
         gyI5AqX090PsVSgoQvNZ/1reyu1Vvf2pbJXg6/VJhAeBsCp7xLCYz2KavFr4cEtZhpje
         WFjiIpLeYYve+5r6fy8N8pj4AajgIlNDH8i85hxpUCBs+o3lfSPuU6CcCh70cSUPzWA3
         su3uUbUrp5h0zBbVWoz6u3jFpYXsyKmZH598VNWd6Jv5i+ydAH5iXqHeveBC9546Hzwn
         rKUfftYJRosEBQg939F7O2r4j4c7cA7t3QZJUDzlZtg6T5ypDfww9q8XXonJUPBONZqg
         7VkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=iW/HmlkUSePa8U4fkh6njA33HFa+ZhXmwd5ivDrMRoU=;
        b=2uLTQOUBgUL02X6Mt6IviF1zyMxuuYEn2lDHXU22d85qkG8ADY6AKMCC3tswTYVD6z
         Z5lAnhqsjThCyLHUDbODIWB+wp+jBTrzWTG8b6HxyzoHgzv6mRc6lcc/qmAu0l/plr3c
         q2PKXnaHlSAH8ZtSt2ZuUzkA+1nQE4Fv0/cn+DcnJCZ8RlM36Wf+0sXY6yUa/31WPSlc
         tijtK6iAgKLviF6mxcNcbWu3drMlTVsFgWpLpf9/0sPDUDUetIDXTxC2GmW5bQhqMMTA
         b9I0J6q0fci/5Gteytt2N+v1b8gp5mbfS36K74KuqgQBkJFWA0qty8Rf8fX4BNOFS6bK
         s5mw==
X-Gm-Message-State: ACrzQf2n4WZR3+KWgAUNT5J9WQ7w7g2FQUo/zo6WcPd8JJsbiZXPZt/d
        sZVRUBw7UsSOyRoDnfF/EwfLXQ==
X-Google-Smtp-Source: AMsMyM5EBo1A+iTQ10BNdY10ujdRavbZQbwvvjhBxT5y9f3EoZrEEvsu647FSv8jr0Ikn81niZaIiA==
X-Received: by 2002:a5d:408b:0:b0:228:9c95:3b66 with SMTP id o11-20020a5d408b000000b002289c953b66mr2023616wrp.90.1663850763172;
        Thu, 22 Sep 2022 05:46:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:6aa5:ee77:c3d6:a9d6? ([2a01:e0a:982:cbb0:6aa5:ee77:c3d6:a9d6])
        by smtp.gmail.com with ESMTPSA id v16-20020a5d6790000000b00228dd80d78asm4960470wru.86.2022.09.22.05.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 05:46:02 -0700 (PDT)
Message-ID: <161594d3-be69-c55f-09ae-314c377e0ca3@linaro.org>
Date:   Thu, 22 Sep 2022 14:46:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/7] phy: qcom-qmp-pcie: Use dev_err_probe() to simplify
 code
Content-Language: en-US
To:     Yuan Can <yuancan@huawei.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org, kishon@ti.com,
        vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20220922111228.36355-1-yuancan@huawei.com>
 <20220922111228.36355-4-yuancan@huawei.com>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220922111228.36355-4-yuancan@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/09/2022 13:12, Yuan Can wrote:
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs.
> 
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index 2923977b205a..6bbfaeb23672 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -2458,12 +2458,9 @@ static int qmp_pcie_probe(struct platform_device *pdev)
>   		return ret;
>   
>   	ret = qmp_pcie_vreg_init(dev, cfg);
> -	if (ret) {
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "failed to get regulator supplies: %d\n",
> -				ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to get regulator supplies\n");
>   
>   	num = of_get_available_child_count(dev->of_node);
>   	/* do we have a rogue child node ? */

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
