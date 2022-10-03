Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8DEA5F337B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 18:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbiJCQZ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 12:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbiJCQZM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 12:25:12 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB8FF13F58
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 09:25:10 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 130-20020a1c0288000000b003b494ffc00bso8828802wmc.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 09:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=iTQSjwcHAAEhqrgw0lNU38R0QIkTGwEkbLRZPeUytP0=;
        b=mYg1TnovK3HttHNFQnF5V2n5loXNJMWKNLJE7CgmuQdxmF+4F4liRbtysyLB7JnwSL
         C5RNhipeMhinmD5CUNEtOcuoFSy6ArRDIhn2PLjQi5AQSh0UVN/r5RMC9IJsWnewKf8h
         n2oXhb8Lsx6Y84qyeNnRVVrf2qtm31X3wTFqWLwZuupNBsEkJsddx0tWEdjXbOGLgfJX
         CvFDlUNl+zOqumlOOceWaeTiVbOqwCmhnlTBcqqByWsxVLDXjb9RLSE84a3jZQOGUfIF
         80hH2yNiRaFvepnTP9TV+n15IBzEEuw1gcQ3gixTxXwkocFS8Ilmw0PBKpcwzrZ5XZmN
         /oiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=iTQSjwcHAAEhqrgw0lNU38R0QIkTGwEkbLRZPeUytP0=;
        b=36JIE2yhHmyEf8IO4WMUyFbhDi09PmyrFyKy774LbETIM6iK5QM/QeB3Nvaa4azCqf
         HuRTlfwQ5AB3oGQCzzUnW8bHEtbTsip0tg/tKupfOFXlRB2Si0e4/zgw6TByva+zryMW
         TqBkYRrxsk+uhyiVojVHFV0Wkj8p6gRMNmtm2kBweA1FkI1Ag0GSE7+M6ecxXvr5IWmW
         qziPffPPCslCxSVj2N3T2ebvN7WXmy/rDVkJMEn50Rk6pBxH/RKDlBZMDpGU3+3Ubzez
         R95sJDmDc261wL+4g6j2n9ByigjgCAR/yaRJOE3ZxezGVB+rRWXOilEv88KAQwa3RGhh
         C9WQ==
X-Gm-Message-State: ACrzQf39d4OdRsEUg5yQHDazOIL9lIqLg9RESKFrfk8J8Y9jS9kKNnfH
        RaRoDLYgenXtgCP1+wNz/AbSgg==
X-Google-Smtp-Source: AMsMyM4CBzEmLFxjYCePobPk6HCHQkTAK70uBdVgNTPyEgRf1weqq8T+KfUaKW1kpRW+Uh3bHy6pVw==
X-Received: by 2002:a05:600c:1d83:b0:3b4:c0db:8683 with SMTP id p3-20020a05600c1d8300b003b4c0db8683mr7335182wms.102.1664814309441;
        Mon, 03 Oct 2022 09:25:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf? ([2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf])
        by smtp.gmail.com with ESMTPSA id x7-20020adfffc7000000b0022cbf4cda62sm10199517wrs.27.2022.10.03.09.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 09:25:09 -0700 (PDT)
Message-ID: <60bf9f72-944c-f07e-5374-f4efccfd7a65@linaro.org>
Date:   Mon, 3 Oct 2022 18:25:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 17/23] ARM: dts: qcom: msm8960: drop qcom, prefix from
 SSBI node name
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
 <20220930185236.867655-18-dmitry.baryshkov@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220930185236.867655-18-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/09/2022 20:52, Dmitry Baryshkov wrote:
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm/boot/dts/qcom-msm8960.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
> index 64a3dcb5176c..487ab9b8d23b 100644
> --- a/arch/arm/boot/dts/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
> @@ -247,7 +247,7 @@ gsbi5_serial: serial@16440000 {
>   			};
>   		};
>   
> -		qcom,ssbi@500000 {
> +		ssbi@500000 {
>   			compatible = "qcom,ssbi";
>   			reg = <0x500000 0x1000>;
>   			qcom,controller-type = "pmic-arbiter";

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
