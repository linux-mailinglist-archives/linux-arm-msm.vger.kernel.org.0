Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E89355BE78D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 15:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbiITNvA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 09:51:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbiITNu7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 09:50:59 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 725533C8C2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 06:50:55 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id r7so4447615wrm.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 06:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=CbKXSMhGoIdUXKKG3TZBq6GRFHHVVvN4hfEgNhxeRUU=;
        b=NJBcwu/xo84A6nBJReIsw2am8S9BExcX0AgN2T5LEjBZBBr0X9WKOc1rekrO8O0JMB
         V1aqNgEy2l941VmoYSSZdTlG74ijVl0AFxvYzsyJ1FhldoZWEMNyLcQ2AFthJWICl8C0
         aT9Fn/zIJ+hR/qJsYf62PrHU9TkgPeHky2OwCEvGPdVbXkjG5nL8D5CYyRXzk/xdYbwq
         LCz+SpEu8cF1lzqgvezUHita+ggTpkn2fUTDs2+Bah+uZUdXda3V9iiNsp0ale2dCOoE
         UMBehsVcyxigAFZdCvhAAai49+Shkqwnm9ShXi+99lpyaXYVTlwkbvZ5lihv8i0CFs6e
         boXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=CbKXSMhGoIdUXKKG3TZBq6GRFHHVVvN4hfEgNhxeRUU=;
        b=Q8BTetpmKm5+iZMZyPg8andXEv3dQOxBAvOM10HxNk6nW+lOJ4J6stJNu4xYvXMaCd
         2MpD4VnnpjwRgOGmiIlG2N5NPvG9WRjV3QdtVQJhbOSQo6arLGmMUYiGdmoDhzlzZnFT
         ZSqK+w23kiOGX+fkcvcExMF3HIoB6ZTCKOjCR10p/jkBpTWmAqP3WobU1BEiYu4AX+Q6
         j/HZ+nd/iMabUCBKNBMYU5t4Hi6dV8EnthjdGqN3h77gOE7PUP2WtQV8+W6x3KN0k74G
         1JXA7UD4OOPWTVGEq/dxJEDJrlGZcsC+NdCHHqgT60EW0wilFUTwiYIK/qbtvFIpndcX
         xUiA==
X-Gm-Message-State: ACrzQf27Vt/A2LupVVoT/WOtu6wtNgtz0Ooquyp9GIflMFgvpnLjIOIE
        bfJr3CDC7Ts7hH0zXTQ6A4kozg==
X-Google-Smtp-Source: AMsMyM49ReXkJSaj7Utvpzsjs5n47S+5Kucp5dP3mK4Lp+F//s6VKT7btkuJMNpSsfVniDJf3/h+lg==
X-Received: by 2002:adf:fb10:0:b0:22a:f1d8:18d2 with SMTP id c16-20020adffb10000000b0022af1d818d2mr9863141wrr.483.1663681853966;
        Tue, 20 Sep 2022 06:50:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7e10:f0f:43b2:9b5e? ([2a01:e0a:982:cbb0:7e10:f0f:43b2:9b5e])
        by smtp.gmail.com with ESMTPSA id bg7-20020a05600c3c8700b003b47b913901sm392805wmb.1.2022.09.20.06.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 06:50:53 -0700 (PDT)
Message-ID: <cb19364a-7c38-9025-3335-1832ed3d8799@linaro.org>
Date:   Tue, 20 Sep 2022 15:50:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 01/17] phy: qcom-qmp-pcie: drop unused type from config
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220920073826.20811-1-johan+linaro@kernel.org>
 <20220920073826.20811-2-johan+linaro@kernel.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro
In-Reply-To: <20220920073826.20811-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/09/2022 09:38, Johan Hovold wrote:
> The configuration PHY type is no longer used since the QMP driver split
> so drop it from the configurations.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 14 --------------
>   1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index 4939edcd8cb1..d25f9215b86f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -1304,8 +1304,6 @@ struct qmp_phy;
>   
>   /* struct qmp_phy_cfg - per-PHY initialization config */
>   struct qmp_phy_cfg {
> -	/* phy-type - PCIE/UFS/USB */
> -	unsigned int type;
>   	/* number of lanes provided by phy */
>   	int nlanes;
>   
> @@ -1470,7 +1468,6 @@ static const char * const sdm845_pciephy_reset_l[] = {
>   };
>   
>   static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
> -	.type			= PHY_TYPE_PCIE,
>   	.nlanes			= 1,
>   
>   	.serdes_tbl		= ipq8074_pcie_serdes_tbl,
> @@ -1499,7 +1496,6 @@ static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
>   };
>   
>   static const struct qmp_phy_cfg ipq8074_pciephy_gen3_cfg = {
> -	.type			= PHY_TYPE_PCIE,
>   	.nlanes			= 1,
>   
>   	.serdes_tbl		= ipq8074_pcie_gen3_serdes_tbl,
> @@ -1529,7 +1525,6 @@ static const struct qmp_phy_cfg ipq8074_pciephy_gen3_cfg = {
>   };
>   
>   static const struct qmp_phy_cfg ipq6018_pciephy_cfg = {
> -	.type			= PHY_TYPE_PCIE,
>   	.nlanes			= 1,
>   
>   	.serdes_tbl		= ipq6018_pcie_serdes_tbl,
> @@ -1559,7 +1554,6 @@ static const struct qmp_phy_cfg ipq6018_pciephy_cfg = {
>   };
>   
>   static const struct qmp_phy_cfg sdm845_qmp_pciephy_cfg = {
> -	.type = PHY_TYPE_PCIE,
>   	.nlanes = 1,
>   
>   	.serdes_tbl		= sdm845_qmp_pcie_serdes_tbl,
> @@ -1590,7 +1584,6 @@ static const struct qmp_phy_cfg sdm845_qmp_pciephy_cfg = {
>   };
>   
>   static const struct qmp_phy_cfg sdm845_qhp_pciephy_cfg = {
> -	.type = PHY_TYPE_PCIE,
>   	.nlanes = 1,
>   
>   	.serdes_tbl		= sdm845_qhp_pcie_serdes_tbl,
> @@ -1619,7 +1612,6 @@ static const struct qmp_phy_cfg sdm845_qhp_pciephy_cfg = {
>   };
>   
>   static const struct qmp_phy_cfg sm8250_qmp_gen3x1_pciephy_cfg = {
> -	.type = PHY_TYPE_PCIE,
>   	.nlanes = 1,
>   
>   	.serdes_tbl		= sm8250_qmp_pcie_serdes_tbl,
> @@ -1658,7 +1650,6 @@ static const struct qmp_phy_cfg sm8250_qmp_gen3x1_pciephy_cfg = {
>   };
>   
>   static const struct qmp_phy_cfg sm8250_qmp_gen3x2_pciephy_cfg = {
> -	.type = PHY_TYPE_PCIE,
>   	.nlanes = 2,
>   
>   	.serdes_tbl		= sm8250_qmp_pcie_serdes_tbl,
> @@ -1698,7 +1689,6 @@ static const struct qmp_phy_cfg sm8250_qmp_gen3x2_pciephy_cfg = {
>   };
>   
>   static const struct qmp_phy_cfg msm8998_pciephy_cfg = {
> -	.type			= PHY_TYPE_PCIE,
>   	.nlanes			= 1,
>   
>   	.serdes_tbl		= msm8998_pcie_serdes_tbl,
> @@ -1723,7 +1713,6 @@ static const struct qmp_phy_cfg msm8998_pciephy_cfg = {
>   };
>   
>   static const struct qmp_phy_cfg sc8180x_pciephy_cfg = {
> -	.type = PHY_TYPE_PCIE,
>   	.nlanes = 1,
>   
>   	.serdes_tbl		= sc8180x_qmp_pcie_serdes_tbl,
> @@ -1753,7 +1742,6 @@ static const struct qmp_phy_cfg sc8180x_pciephy_cfg = {
>   };
>   
>   static const struct qmp_phy_cfg sdx55_qmp_pciephy_cfg = {
> -	.type = PHY_TYPE_PCIE,
>   	.nlanes = 2,
>   
>   	.serdes_tbl		= sdx55_qmp_pcie_serdes_tbl,
> @@ -1785,7 +1773,6 @@ static const struct qmp_phy_cfg sdx55_qmp_pciephy_cfg = {
>   };
>   
>   static const struct qmp_phy_cfg sm8450_qmp_gen3x1_pciephy_cfg = {
> -	.type = PHY_TYPE_PCIE,
>   	.nlanes = 1,
>   
>   	.serdes_tbl		= sm8450_qmp_gen3x1_pcie_serdes_tbl,
> @@ -1816,7 +1803,6 @@ static const struct qmp_phy_cfg sm8450_qmp_gen3x1_pciephy_cfg = {
>   };
>   
>   static const struct qmp_phy_cfg sm8450_qmp_gen4x2_pciephy_cfg = {
> -	.type = PHY_TYPE_PCIE,
>   	.nlanes = 2,
>   
>   	.serdes_tbl		= sm8450_qmp_gen4x2_pcie_serdes_tbl,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
