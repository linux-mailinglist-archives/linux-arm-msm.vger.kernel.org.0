Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB0FD5E9B9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 10:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233574AbiIZIGj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 04:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233241AbiIZIGO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 04:06:14 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ABC12644
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 01:03:46 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id n40-20020a05600c3ba800b003b49aefc35fso3240707wms.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 01:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=s1GDsk/KtoTE59u0rYU4aKY4t7QMGjP0CyyjigpbcZw=;
        b=sid3k+0HnjhqHkStn6TpoHVSP2SNvoyIt77MkwA/le0AROpXtk75s1MW+L+Yj66KEQ
         Cl10tanKlY2ZjlIPX+YwtwDOzKR714vIa7PZeCYAcTKJ83n7CbUaD85PQH8c6TFGN1rY
         dq3pFn9YrZIvl4zdlXLu+CjMh6uog604xE4KMeYm5xy0t+9YfUG/F2kQC5Xv8+zV4zQ9
         LT0S/27aRUCze7grdKFD4ApXbXjkZle+WvYbDCdzWmfRsBMMV5SQcpIjVfR1cY8D+bO9
         CD6GLsVulf8ign9872vNqVsg9HsOyHKh6J7unYy5Qs9n01QIlxY+iw0pmX16M9WM/E3i
         dl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=s1GDsk/KtoTE59u0rYU4aKY4t7QMGjP0CyyjigpbcZw=;
        b=j2/3yj6XTC171jyTLkTbDUDVeR76u6+fJSPg6einBxamLtr/hUnROqtyNVcplByPde
         0sUVhrILV55hVgifEt7dWco/BTgV4rsXpLHGSKLyh4PdhSiLOXE5YYxVgvgk29c5mi2q
         Y1jLoBeCn5AL8AyrQEvSkeS4hRzSrFYYujXy5j36LzArDxnhpUFqRoPCVRcB0F1ObKIu
         Re+TLBZWk0RUoCYwpRNU7QWEYJCwH78ZjGxVlsbSwyCULXn3Ty3ocCl+tMiAnSumcBvx
         UNnIcgs51zDIO5/tQu9KYfQJs0lJbAW1ioeSShAE48aaTcGmGt4QCSsret/CAE1LQtlF
         VsKQ==
X-Gm-Message-State: ACrzQf3TE+iTLcsrGGEQ31zj4ncZcUfpfMzJ1a/Pu/vPI7c0TJnLhkLY
        WLo3zSI4nylDB0L38rnmszmVag==
X-Google-Smtp-Source: AMsMyM43qYcB+JuoInA8MkWG+06M+titsDaKBTncBaaGoxvbpayvSx4rhBSH8L3N4GbbHNcI9OMGWw==
X-Received: by 2002:a1c:7c03:0:b0:3b4:7647:ccd8 with SMTP id x3-20020a1c7c03000000b003b47647ccd8mr14091264wmc.10.1664179424704;
        Mon, 26 Sep 2022 01:03:44 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id w10-20020a05600c474a00b003b4ac05a8a4sm12743612wmo.27.2022.09.26.01.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 01:03:44 -0700 (PDT)
Message-ID: <3c69b64e-8dcf-91e5-6863-198120c31065@linaro.org>
Date:   Mon, 26 Sep 2022 10:03:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/5] slimbus: qcom-ctrl: use
 devm_platform_ioremap_resource_byname()
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
References: <20220923155740.422411-1-krzysztof.kozlowski@linaro.org>
 <20220923155740.422411-3-krzysztof.kozlowski@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220923155740.422411-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/09/2022 17:57, Krzysztof Kozlowski wrote:
> Simplify the code with devm_platform_ioremap_resource_byname().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/slimbus/qcom-ctrl.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
> index bb106eab8ae2..400b7b385a44 100644
> --- a/drivers/slimbus/qcom-ctrl.c
> +++ b/drivers/slimbus/qcom-ctrl.c
> @@ -488,7 +488,6 @@ static int qcom_slim_probe(struct platform_device *pdev)
>   {
>   	struct qcom_slim_ctrl *ctrl;
>   	struct slim_controller *sctrl;
> -	struct resource *slim_mem;
>   	int ret, ver;
>   
>   	ctrl = devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
> @@ -519,8 +518,7 @@ static int qcom_slim_probe(struct platform_device *pdev)
>   	platform_set_drvdata(pdev, ctrl);
>   	dev_set_drvdata(ctrl->dev, ctrl);
>   
> -	slim_mem = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ctrl");
> -	ctrl->base = devm_ioremap_resource(ctrl->dev, slim_mem);
> +	ctrl->base = devm_platform_ioremap_resource_byname(pdev, "ctrl");
>   	if (IS_ERR(ctrl->base))
>   		return PTR_ERR(ctrl->base);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
