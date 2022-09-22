Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A42B5E62BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 14:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbiIVMqv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 08:46:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231296AbiIVMqY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 08:46:24 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45AF1B276F
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 05:46:23 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id s14so13374567wro.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 05:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=olI7b5Ge4I5pDP0ro1CkQmQcdDvjVFooXcdgp3/TKnE=;
        b=R1sFjfsHnRXTCAmXwdmcjBuB2a2S6u9NS/QL/8voRobOHxqb1OQSOb7mDYhLNsa7Qu
         vF3dVeD+TNRfd0dfBQoSBqIrEiXJ603FcXHHM5/mUrqJS4mE7aGzipguPHCLc9WpOF6I
         zFKB4dCBHz0Hk0wuiYt1/C++jl6HhPeIJYD2YU5KC5e8NERxBJluTect+Rm9cKyvF7Ya
         ajzcHPLN49i7cxNWmsqBfvDdwG7syAFYLCiLWbP91jsVlDBQJbc+gn/oTjEOZGT4K/OB
         1+XidpE3NdYX1rHZMt4GYAQs+wG3Wl3G7ZuOOhrrIyuJY+BIu2mPKhbC8VZDjRCYyiV9
         iWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=olI7b5Ge4I5pDP0ro1CkQmQcdDvjVFooXcdgp3/TKnE=;
        b=UuT4epv4HJnXuF6F6vru1LOY+iVM/kC2y2dWmTt1BSeRLcKt6DqApo8H0p1+n/rCYO
         CIZyjaKdw9FY2cnJAcxPfiAFpJsSYzqzQhHnp0MQhHvkczfJLCQ70hs7Ta8FS08yWx7P
         Lfp0Jb4KQ/lyO+atv0IfNcV6OgXJOS5xfHdddHvlacZ1iNgyiHM0uBL5dK2dJrFfNVW8
         Y/BF/EeY9Nw45hkCyUd7k/3LfXO+tMQKaLdDSdGaUNzY7NbY7IVmF5UElCEwGngmw7PE
         vPTZPnyrd4t/9QKAUdTCW5hlxhgszprKoi62xz5Bc5IbmObSLR3yDIbMpRDbKrLEER0/
         PcYA==
X-Gm-Message-State: ACrzQf0pSThE3pGuvuF+O0xAjzGtDWLTVF5/PdmJq3h6DfNW48C0DkmS
        VUbdbVJKnvtBOaRCg3FwYJlA6A==
X-Google-Smtp-Source: AMsMyM6OKOZNESjdUhYEdSTyCimFaJmjy2hdZhxkKfSMpP545EHsExTK+its5/+pDoPSmx+ul05hrA==
X-Received: by 2002:a5d:574a:0:b0:228:b90c:e5ee with SMTP id q10-20020a5d574a000000b00228b90ce5eemr1939560wrw.328.1663850781834;
        Thu, 22 Sep 2022 05:46:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:6aa5:ee77:c3d6:a9d6? ([2a01:e0a:982:cbb0:6aa5:ee77:c3d6:a9d6])
        by smtp.gmail.com with ESMTPSA id l14-20020a5d410e000000b00228aea99efcsm5198877wrp.14.2022.09.22.05.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 05:46:21 -0700 (PDT)
Message-ID: <548bec54-c795-f500-39e2-970c3580198a@linaro.org>
Date:   Thu, 22 Sep 2022 14:46:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5/7] phy: qcom-qmp-usb: Use dev_err_probe() to simplify
 code
Content-Language: en-US
To:     Yuan Can <yuancan@huawei.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org, kishon@ti.com,
        vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20220922111228.36355-1-yuancan@huawei.com>
 <20220922111228.36355-6-yuancan@huawei.com>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220922111228.36355-6-yuancan@huawei.com>
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
>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> index fba8e40441cb..41f91829af17 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> @@ -2821,12 +2821,9 @@ static int qcom_qmp_phy_usb_probe(struct platform_device *pdev)
>   		return ret;
>   
>   	ret = qcom_qmp_phy_usb_vreg_init(dev, cfg);
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
