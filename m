Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D12A6BADBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 11:34:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232311AbjCOKeU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 06:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231964AbjCOKeS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 06:34:18 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F89C168B5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 03:34:17 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id g17so23684396lfv.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 03:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678876455;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JsuHq7iHHjQ3jFPF6GcwJ79KHomNFrn/dysoQR3stp8=;
        b=cCCrRUTf/4k1jyVpsGhlVSQFLORfCnW6uE4NbqpvMwRA5WSmH9MCMDgjjCHQLIswh7
         oC7a5yRlBkMzjqu4GWEZCpcqheULJVIjtXCE6hF3bjM9HCSI+WGGqcFhNMQfj4YMrnYh
         Sf/EUM8lds7e3Oj1FwMH8ACQkzTMAbQLfhOMqkUjrRUeoSm1CYorA+Fh/e6zuoi5GQJD
         DbE49RICJlafIr6YQwLT5ZD4bHLUoUacRKBXS2QuIxYvTR549134RvbSzcxs86jIv38E
         aboy1AwgPvwNUjpqkrYNJI9aVd4Q9WabYkc06H9pGcckxqNnhDLirdOnMHddIMXRTo5P
         oftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678876455;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JsuHq7iHHjQ3jFPF6GcwJ79KHomNFrn/dysoQR3stp8=;
        b=5okWfL51OC3DaK/f0GOi06/nP1tS3Vd32TWjP0pgatCz6MCeiTAH688bt0df57jwMA
         e6d6QYfPHgLRmh/VP1x7+5nbpL3jduuwrKeGFe4J52v02z/1KC+/5vh3flBLA0WO6Ou6
         /lArZWM8GnPEQgcTSGDpk8mIjd61YWETwmS7iR1YSNjDM11uPMd6TsImpiTRR3qg5RjU
         1s9TdSfxSNCsf2AqPkWEOx0Lz2XzR7HlblaCgVcIHxIXmWEV9lhHAqi1R6oeWw0EwqLU
         Fx1zWuBfKyPHGZw9F+i6RyVgtlbuNVXtodAhoY5PP3sLwh9dR5ZlcP54C12hWMPnOi7S
         /TpA==
X-Gm-Message-State: AO0yUKWeAdk6UiNlQaSUpbOJjxmtbiN7NEq/u6L/nOEu/oAFZPuDezun
        iRs4LKVSne2hLjWz2toq7e51nA==
X-Google-Smtp-Source: AK7set9aJ8vwEfmUPA6lRi4x4EjzCJ144z/024M6zRlacXaZx3IU1b71ssHRZ3pqm32VFZv4EBL/5A==
X-Received: by 2002:ac2:4191:0:b0:4e8:401a:3e2b with SMTP id z17-20020ac24191000000b004e8401a3e2bmr1691495lfh.5.1678876455433;
        Wed, 15 Mar 2023 03:34:15 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id o19-20020ac24353000000b004dc4c5149cfsm769586lfl.134.2023.03.15.03.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 03:34:15 -0700 (PDT)
Message-ID: <6425fcb2-2ce9-0986-ed28-64717dee240a@linaro.org>
Date:   Wed, 15 Mar 2023 11:34:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 05/18] PCI: qcom: Use lower case for hex
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        andersson@kernel.org, lpieralisi@kernel.org, kw@linux.com,
        krzysztof.kozlowski+dt@linaro.org, robh@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_srichara@quicinc.com
References: <20230315064255.15591-1-manivannan.sadhasivam@linaro.org>
 <20230315064255.15591-6-manivannan.sadhasivam@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230315064255.15591-6-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 15.03.2023 07:42, Manivannan Sadhasivam wrote:
> To maintain uniformity, let's use lower case for representing hexadecimal
> numbers.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
To be fair, preprocessor defines are the only place where uppercase
hex is widely used

Konrad
>  drivers/pci/controller/dwc/pcie-qcom.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 926a531fda3a..4179ac973147 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -39,17 +39,17 @@
>  #define PARF_PCS_DEEMPH				0x34
>  #define PARF_PCS_SWING				0x38
>  #define PARF_PHY_CTRL				0x40
> -#define PARF_PHY_REFCLK				0x4C
> +#define PARF_PHY_REFCLK				0x4c
>  #define PARF_CONFIG_BITS			0x50
>  #define PARF_DBI_BASE_ADDR			0x168
> -#define PARF_SLV_ADDR_SPACE_SIZE_2_3_3		0x16C /* Register offset specific to IP ver 2.3.3 */
> +#define PARF_SLV_ADDR_SPACE_SIZE_2_3_3		0x16c /* Register offset specific to IP ver 2.3.3 */
>  #define PARF_MHI_CLOCK_RESET_CTRL		0x174
>  #define PARF_AXI_MSTR_WR_ADDR_HALT		0x178
> -#define PARF_AXI_MSTR_WR_ADDR_HALT_V2		0x1A8
> -#define PARF_Q2A_FLUSH				0x1AC
> -#define PARF_LTSSM				0x1B0
> +#define PARF_AXI_MSTR_WR_ADDR_HALT_V2		0x1a8
> +#define PARF_Q2A_FLUSH				0x1ac
> +#define PARF_LTSSM				0x1b0
>  #define PARF_SID_OFFSET				0x234
> -#define PARF_BDF_TRANSLATE_CFG			0x24C
> +#define PARF_BDF_TRANSLATE_CFG			0x24c
>  #define PARF_SLV_ADDR_SPACE_SIZE		0x358
>  #define PARF_DEVICE_TYPE			0x1000
>  #define PARF_BDF_TO_SID_TABLE_N			0x2000
> @@ -60,7 +60,7 @@
>  /* DBI registers */
>  #define AXI_MSTR_RESP_COMP_CTRL0		0x818
>  #define AXI_MSTR_RESP_COMP_CTRL1		0x81c
> -#define MISC_CONTROL_1_REG			0x8BC
> +#define MISC_CONTROL_1_REG			0x8bc
>  
>  /* PARF_SYS_CTRL register fields */
>  #define MAC_PHY_POWERDOWN_IN_P2_D_MUX_EN	BIT(29)
