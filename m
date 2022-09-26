Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 198495E9B9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 10:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233287AbiIZIGu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 04:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233001AbiIZIGZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 04:06:25 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02D3C248EC
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 01:04:02 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id k3-20020a05600c1c8300b003b4fa1a85f8so3245345wms.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 01:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=fjd/wwBnMeI0DV/PUi7MEDTvbPZrf3Ei8JLKkheRfIc=;
        b=jdPA8sqVYFN4kapZ9XAcbntn/UOQmmtt9Q+Ix4InstCcrd4Lo87awspNPQkUHuJ/aX
         z1TSZ6WOb7VGZF9iakxf4oJl2DCKpaLioonfOom/v1F+GqnT/Xvr8oGnT2eneJH7Rwy+
         yPpZMy7tv038H5QLCSibzBGjfCp/y9jrNb9kmGkz94lPFFzmveUkUfcvjlyGEQqIQFsn
         Nscxve0/nxRCFw0IXojHwqPLtzpPKMTN5OY+POdd8ejQVdaeWkISLa4UU+/X0o2rZUFN
         HlajCjmCUOz3Ut6HJVm0C6w27z+E634TsovhL3zt524BU6G3SqSKGQLOqI3w04XekjX/
         ZluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=fjd/wwBnMeI0DV/PUi7MEDTvbPZrf3Ei8JLKkheRfIc=;
        b=XLZ2e8SxBdrBf9n6w5u7hrUm8LPTdx5ocrUWIbwkLjjJUDuRsPhQ8VOJgzzwR7aM60
         fGe3HkW+a9QIsuzibqTp4cwFuFc4iFs2b/onknCtWN+26ILWqm4xnOIVvJFY2FYQ3PvU
         Jia28APfFYvuQtowqSye3DS2nhqZoN/OZb5NSgZylixEuI1JYtT8YzKuoGQb1pou6r+a
         KeKct1SnshVR6cfG7LWG4n98XrqEiQS+TSYmRVQMdY/zbWePyw5hrJa05EduMDvlkoAZ
         eVwUjOboM43CuI0Le6C4i0MhzdlRvPehNQaL+TVKdUutp1q/GkT4LjgWrhu1slZs4bn0
         s8Qw==
X-Gm-Message-State: ACrzQf2RBTdjgChr1kfc4D3k4IR72b+/VD5yg2PhG6mOXlZF7GEc/DcG
        db5dLdV6a4rNSiAuvSsjNI1TSg==
X-Google-Smtp-Source: AMsMyM70DMzNhDNFCtPndNtPp8Oq+HakIQwZKWmT0Z9fs2emPxZu2QV/cd/U3yk671w8cSR15AQB0g==
X-Received: by 2002:a05:600c:a49:b0:3a6:673a:2a9b with SMTP id c9-20020a05600c0a4900b003a6673a2a9bmr20581222wmq.3.1664179440497;
        Mon, 26 Sep 2022 01:04:00 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id c1-20020a5d5281000000b002287d99b455sm13421183wrv.15.2022.09.26.01.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 01:04:00 -0700 (PDT)
Message-ID: <a79e942e-64be-1584-41aa-17fe6275c562@linaro.org>
Date:   Mon, 26 Sep 2022 10:03:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/5] slimbus: qcom-ngd-ctrl: use
 devm_platform_get_and_ioremap_resource()
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
References: <20220923155740.422411-1-krzysztof.kozlowski@linaro.org>
 <20220923155740.422411-4-krzysztof.kozlowski@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220923155740.422411-4-krzysztof.kozlowski@linaro.org>
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
> Simplify the code with devm_platform_get_and_ioremap_resource().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/slimbus/qcom-ngd-ctrl.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index cec11aa106bf..548dd7661334 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1522,7 +1522,6 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct qcom_slim_ngd_ctrl *ctrl;
> -	struct resource *res;
>   	int ret;
>   	struct pdr_service *pds;
>   
> @@ -1532,8 +1531,7 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>   
>   	dev_set_drvdata(dev, ctrl);
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	ctrl->base = devm_ioremap_resource(dev, res);
> +	ctrl->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
>   	if (IS_ERR(ctrl->base))
>   		return PTR_ERR(ctrl->base);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
