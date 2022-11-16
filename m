Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E867462BE52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 13:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233550AbiKPMim (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 07:38:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233574AbiKPMiU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 07:38:20 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE28332BA4
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:37:38 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id bj12so43657500ejb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sG8aXwwXTrlTiireQd/5Nkj9uhT107ZgWJJJycGU3AE=;
        b=TH3tUkEdmg1uHSwBV1pgw2U5d9r9XG3uQS8x6DgVsjcd8CmwAS2xO+YY7H2UMlE0c6
         0dcLHmZcrJK5o9XUJf5uDr02asp3DyySsu3h93Kw+mmx00e63eh696MWS0WDYXqY99uJ
         DQJ4xF6Yfw8PTsOQQ7kkI9QiIXY5824lCDwfPeP8yeff+fLGfeiArz9cGvv9aaAnnxd2
         lBIXLeTzRPGFzbdqTu0A4EFJmGvWGuATEwCPv69zddJi406vQvLCgt0Esidv6MHGsrYb
         Z+AMWS31/IDdclq83nejuBNxUZgHeIjt9Xq896IUSSIjoYyRTe2Qgb0RTg+zjqWBJ+Su
         P2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sG8aXwwXTrlTiireQd/5Nkj9uhT107ZgWJJJycGU3AE=;
        b=6fMz/kAOxntbYESQuazqbd92fYkCsNqIvkdolIA4oycm4ZBvn3YmI8fnxIgPzgv6RF
         16B702jHSsYdOcdNrleG9nLTH9G/lu+wXyaed3nsy7VEwPKEybFYctgWDO8p2lCgSJPs
         biZ2pbhJ5E1s3LGdcPGi102+poRiCHoKdCNInRY7/mbEEqlyPG0oi3bzRX6hcIXxrt/5
         xBVW4YRqQLdjX5o6O+hJCXjJaOpuakRN2fwbeYDbZ6cXYyr5YtD0A3URTnWxpE1TZbHl
         3Z0ahU3i4Lv5cv2Dscpywx/SpmQx+mPLIrQdcZvJ7qOKA5GPxErhhrjckJsSeExNBHCz
         sGwA==
X-Gm-Message-State: ANoB5pkUeLXlLyexSICTHY66JV3kgAq2NT9v/jPwy9oFG8PSH0FOScUV
        hoYdCAqTdlCDwzjhEvyf4teLfQ==
X-Google-Smtp-Source: AA0mqf5W9ovV9Nz22Di4u2kR0NrvDSBgZ0VGms3FIWeDcppWEDAF5peTHSI8BFQsKpudz9q9CDC59A==
X-Received: by 2002:a17:907:7672:b0:7ad:c35a:ad76 with SMTP id kk18-20020a170907767200b007adc35aad76mr17761284ejc.705.1668602256869;
        Wed, 16 Nov 2022 04:37:36 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id lb17-20020a170907785100b00734bfab4d59sm6930763ejc.170.2022.11.16.04.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 04:37:36 -0800 (PST)
Message-ID: <6205c5eb-5f16-1a43-ac32-a1da61c99e50@linaro.org>
Date:   Wed, 16 Nov 2022 13:37:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] pci: dwc: pcie-qcom: Add support for SM8550 PCIEs
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, kw@linux.com,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20221116123505.2760397-1-abel.vesa@linaro.org>
 <20221116123505.2760397-2-abel.vesa@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221116123505.2760397-2-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 16/11/2022 13:35, Abel Vesa wrote:
> Add compatibles for both PCIe G4 and G3 found on SM8550.
> Also add the cnoc_pcie_sf_axi clock needed by the SM8550.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   drivers/pci/controller/dwc/pcie-qcom.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 6ac28ea8d67d..4a62b2500c1d 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -181,7 +181,7 @@ struct qcom_pcie_resources_2_3_3 {
>   
>   /* 6 clocks typically, 7 for sm8250 */
>   struct qcom_pcie_resources_2_7_0 {
> -	struct clk_bulk_data clks[12];
> +	struct clk_bulk_data clks[13];
>   	int num_clks;
>   	struct regulator_bulk_data supplies[2];
>   	struct reset_control *pci_reset;
> @@ -1206,6 +1206,7 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
>   	res->clks[idx++].id = "noc_aggr_4";
>   	res->clks[idx++].id = "noc_aggr_south_sf";
>   	res->clks[idx++].id = "cnoc_qx";
> +	res->clks[idx++].id = "cnoc_pcie_sf_axi";
>   
>   	num_opt_clks = idx - num_clks;
>   	res->num_clks = idx;
> @@ -1752,6 +1753,8 @@ static const struct of_device_id qcom_pcie_match[] = {
>   	{ .compatible = "qcom,pcie-sm8250", .data = &cfg_1_9_0 },
>   	{ .compatible = "qcom,pcie-sm8450-pcie0", .data = &cfg_1_9_0 },
>   	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &cfg_1_9_0 },
> +	{ .compatible = "qcom,pcie-sm8550-pcie0", .data = &cfg_1_9_0 },
> +	{ .compatible = "qcom,pcie-sm8550-pcie1", .data = &cfg_1_9_0 },
>   	{ }
>   };
>   
