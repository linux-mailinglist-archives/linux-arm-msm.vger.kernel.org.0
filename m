Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9625D70E2E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 19:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237747AbjEWRfC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 13:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238313AbjEWRe6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 13:34:58 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C6D97
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 10:34:36 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f3b39cea1eso151468e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 10:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684863275; x=1687455275;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wXYu+n3wOzx5mnc23vQbudrU14khD7dWQ2iCC1H/1X0=;
        b=xKGjbhNzzoHJ+Kv7/aGEdrer0zvedup4VYpkIinbULPQ1BMAg+CIuOP9voh+U6Wh1Z
         p6kjeDVpYTdhyYi7Ol+ngLsA+JnPWZ1KV1jeC5TEdQYm0n4IS7FJEpRRrY+y5ZSpPPpc
         VUAnBs+bHDmEMTqIZ2odgVv4CTAPMWyx8oUk/qdTDA81wTDkNahfIbDZc4QzsWWSIAZD
         9MEvh8YIiYgdmbW9TDSb/+oMHk9r3SJK7e4icidiQPMvRo8LFkasSe5auhihrZrjaGJ+
         vEChcqngmGL+mQrPRN8cZgolmyaovo1hMdB1qRf37BzY9GlIMqsI7MkcQM133DsZyzAV
         Em4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684863275; x=1687455275;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wXYu+n3wOzx5mnc23vQbudrU14khD7dWQ2iCC1H/1X0=;
        b=b3FhgSFJhYjmIDDhtpcAisJAk9H1lc8OO5Uoa0ODp2e75KQsevTSMPddLhr4rH1zyR
         6pFO72/VwnC/F84ev4CQdcWiynoikXgoYpcRPWCK1OP38RTkLx7hCaZyz1bmMy7eKgpN
         3Yv3dME7uG+NKIjjJ2vLs1//bFq1fD41cvoDLkbK+0/2DAfHHU7x8PCC8MOQfKx9LIbP
         bRjfnvADe3nJ888GPVcoJcRlzvkbjzp7mnGNgqiNyzUkwagYh4kbEtyjVe7QHzB098f+
         tNJpz92+yl83UFQ1UCuHnAv7Dla/IhiUK/wZrSwfd7toogyKQ/eMSjDdgrl5eSLg+Gfj
         G+hw==
X-Gm-Message-State: AC+VfDyqklPf7OEvtfftDnGZMjPCChdGlVhLd1kYAJ9FgJ491tz27eou
        2PYNrG8cRVautIICLyrEq2WKzg==
X-Google-Smtp-Source: ACHHUZ7HQfYbICMPQ73nraI6xxhfDAQvR17E3iGhtjz+pQ6BPGOT2xgSpaXddbgUODIHDtZb314s6A==
X-Received: by 2002:ac2:491a:0:b0:4f3:a55a:bad6 with SMTP id n26-20020ac2491a000000b004f3a55abad6mr4999914lfi.20.1684863275060;
        Tue, 23 May 2023 10:34:35 -0700 (PDT)
Received: from [192.168.1.101] (abyk138.neoplus.adsl.tpnet.pl. [83.9.30.138])
        by smtp.gmail.com with ESMTPSA id d27-20020ac24c9b000000b004f00d3d9df9sm1408152lfl.188.2023.05.23.10.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 10:34:34 -0700 (PDT)
Message-ID: <dbdec4af-8c28-5ddb-c382-3e3515fb0358@linaro.org>
Date:   Tue, 23 May 2023 19:34:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 05/11] arm64: dts: qcom: sdm845: switch UFS QMP PHY to
 new style of bindings
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20230523140622.265692-1-dmitry.baryshkov@linaro.org>
 <20230523140622.265692-6-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230523140622.265692-6-dmitry.baryshkov@linaro.org>
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



On 23.05.2023 16:06, Dmitry Baryshkov wrote:
> Change the UFS QMP PHY to use newer style of QMP PHY bindings (single
> resource region, no per-PHY subnodes).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 90424442bb4a..68660d532afa 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -2565,7 +2565,7 @@ ufs_mem_hc: ufshc@1d84000 {
>  			      <0 0x01d90000 0 0x8000>;
>  			reg-names = "std", "ice";
>  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> -			phys = <&ufs_mem_phy_lanes>;
> +			phys = <&ufs_mem_phy>;
>  			phy-names = "ufsphy";
>  			lanes-per-direction = <2>;
>  			power-domains = <&gcc UFS_PHY_GDSC>;
> @@ -2611,10 +2611,8 @@ ufs_mem_hc: ufshc@1d84000 {
>  
>  		ufs_mem_phy: phy@1d87000 {
>  			compatible = "qcom,sdm845-qmp-ufs-phy";
> -			reg = <0 0x01d87000 0 0x18c>;
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> -			ranges;
> +			reg = <0 0x01d87000 0 0x1000>;
> +
>  			clock-names = "ref",
>  				      "ref_aux";
>  			clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
> @@ -2622,16 +2620,9 @@ ufs_mem_phy: phy@1d87000 {
>  
>  			resets = <&ufs_mem_hc 0>;
>  			reset-names = "ufsphy";
> -			status = "disabled";
>  
> -			ufs_mem_phy_lanes: phy@1d87400 {
> -				reg = <0 0x01d87400 0 0x108>,
> -				      <0 0x01d87600 0 0x1e0>,
> -				      <0 0x01d87c00 0 0x1dc>,
> -				      <0 0x01d87800 0 0x108>,
> -				      <0 0x01d87a00 0 0x1e0>;
> -				#phy-cells = <0>;
> -			};
> +			#phy-cells = <0>;
> +			status = "disabled";
>  		};
>  
>  		cryptobam: dma-controller@1dc4000 {
