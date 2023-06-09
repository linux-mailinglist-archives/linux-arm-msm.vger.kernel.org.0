Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D94F729B8A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 15:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241008AbjFINYG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 09:24:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240418AbjFINYE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 09:24:04 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9185D30CD
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jun 2023 06:24:02 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b1a7e31dcaso19412041fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jun 2023 06:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686317041; x=1688909041;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oxKvNxSUUmtV5IlqPy/tts+L3dFs3BAIjBbwSPjXSi4=;
        b=E0LaWqx3J5Qd4fYNy558AUnnmEoceF1QWBxBOwEEQsO+jXlp3TLlEI2ULIcz1JEnnz
         +i/TSzWjktOc+D36gpd7c8MGcK0rAzs45vzzDVxqhsyFMHW38B/Mnaa4BZnknGL3jOrW
         sa6rPoK1BcwGszIkGhL5zwialsIYCdyvSRU7B7UBkGJvxDkHyves5V81mk/RFhDMwT+P
         KqQ6d4o9cE9yxEm0Th1zOZYmoSTBiXTEYASqdPmieOP2iqXUGMFIuFTe2FqjWlIOUVS3
         1E/wT+MF+XLZ/5jiWUuxfWrLALlQtZDYQ3xs46jH4I1+By4OahDfkJaoC7o+6ebqejgg
         K9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686317041; x=1688909041;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oxKvNxSUUmtV5IlqPy/tts+L3dFs3BAIjBbwSPjXSi4=;
        b=YoHVlpQw1bnE/v8yLWLPMGXW6QuCKuFspFmmWMpSyv0gFp9SMusc2kN2F2gALMtqUO
         gyyW+6IhhZAaWQVKd6POwIGr790Htrnnc17pqC/0fvT/8qdx6DTNcSTaFF5kV5EZ0DBf
         TckPnyTtzChSuBQUGAhfutG3gUtDk/X7h2MnTFi2GNrvajGljHuKURtk967y746MTRQR
         vN5dCCWr9qqfQN1QnUofsiuBPo0VM5Zqan7Lf4w3bvuRwkdQ+6++JEqGSi37aHzmppcV
         vxg6UccJBwAyghb95HKGGTD+k3xQd5KCxYbNqrnoG2gDByw2d2rOKbmMSA1AnTOWkt+C
         bdgQ==
X-Gm-Message-State: AC+VfDym4mnD1Wcnf1Rq1Jndr+i9tzGBsTQWhe3ghuPP0zQSnQo4MdBe
        m+y/nVN7Alk6mBE2HNyqnmzkrw==
X-Google-Smtp-Source: ACHHUZ7Fp9jSHspFeJrUnKFN9+oHtUhodm16Rqr4dpqTnu0/V29JiV+8ZpWRMVvekkQ1+KcEDfqONQ==
X-Received: by 2002:a2e:b162:0:b0:2af:30d8:527f with SMTP id a2-20020a2eb162000000b002af30d8527fmr1099809ljm.19.1686317040664;
        Fri, 09 Jun 2023 06:24:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id z6-20020a1709060ac600b009745ecf5438sm1280197ejf.193.2023.06.09.06.23.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 06:24:00 -0700 (PDT)
Message-ID: <8a128520-ef46-78c8-f25e-53c4d76a7d45@linaro.org>
Date:   Fri, 9 Jun 2023 15:23:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sa8775p: Add interconnect to PCIe
 SMMU
Content-Language: en-US
To:     Parikshit Pareek <quic_ppareek@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Adam Skladowski <a39.skl@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        "linux-kernel @ vger . kernel . org Prasanna Kumar" 
        <quic_kprasan@quicinc.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>
References: <20230609054141.18938-1-quic_ppareek@quicinc.com>
 <20230609054141.18938-3-quic_ppareek@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230609054141.18938-3-quic_ppareek@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/06/2023 07:41, Parikshit Pareek wrote:
> Introduce the interconnect, connecting PCIe SMMU to the memory. This
> is accessed during memory mapped IO access of smmu registers, and
> during page table walks.
> 
> Reported-by: Eric Chanudet <echanude@redhat.com>
> Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index b130136acffe..ea3c37019c46 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -2137,6 +2137,10 @@
>  				     <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH>;
> +			interconnects = <&pcie_anoc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
> +					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "tbu_mc";
> +			icc_bw = <250>;

Why 250? Why it cannot change during system run depending on the needs?


Best regards,
Krzysztof

