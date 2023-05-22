Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87FB070C3DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 19:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230497AbjEVRBu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 13:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbjEVRBp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 13:01:45 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C9CFFE
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 10:01:39 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2af2b74d258so34644141fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 10:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684774897; x=1687366897;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MRSgd5LIYbOrDG8MxtSTtsdQ1s+8dQfmS9AzHFzNqEI=;
        b=xgC5xTgUSRPAeY9WjQcHu35r7Zmnwz+/w7TofcdaoKKyr+7NX2CC1nzwCXose+7Q8K
         8QmXMVPITJa0irY+KER5XTD4ltIejIMhmzLbdQdTqQqIYZd+agOrDH/rwZtLkvegEEP/
         vzSPG7zpS5X2KOp2kTybev/4nu6uN2vPs0TzstGf8oicb+nHkLr9mkOyiS+0IIzQcVlu
         lKh9nk/LL/p4hFzEzXK/wmPxGScD4s8G2rvzpDtQV2k0acd7zlS5vKYgU60icdYMP+fZ
         /ttOi840B8i4slfn8GSKUEhVFd19Lo2Y7SR+xxdaOLpO14hnRAYi6LVtLOS+8kEvZOWS
         TspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684774897; x=1687366897;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MRSgd5LIYbOrDG8MxtSTtsdQ1s+8dQfmS9AzHFzNqEI=;
        b=GQHjhB/Nxo+nCnm5BwSr2JaDhr1zkqVO2LgekeDgNRFt5EMo1mm9bGont3lTRCouOB
         yU/eeYPrf/+XJtrPizF6QIO9pRpaU7WHH+uD4LlXke71DTt7zqdN7qHPH4On4u0wQ5jQ
         SoMlNv8xcrZy5T8cBWyVEqXnr3xgPVLReq2KsGONhtmvrQh2F4pkcR/Y4TN/JR/7eZ3X
         DruvUa9et9recYDNLM70Vcvhhd44vFrc8mU0g7sLYn3Ya4K/l8u7+7HbVhn/DSZvyNej
         NKDUQBPoLr4ay7rnOasZkDCaPQV4m1K1T6mG91DXzoKAcUbaTyfKGW1Oa3worGD4Y8ia
         YODw==
X-Gm-Message-State: AC+VfDyYkH31+vDZPXO1BBkE2yW7yc+7geLLCr6dHKE97m46VgePCYT0
        wXNQ/jDBLTSLN3bKkm3QwQBggw==
X-Google-Smtp-Source: ACHHUZ549HYmkyodDpSAMCm9/Hgdg0rXlSvPpGiw1lU9uMFSsyTcoU0OrA3JfzyxR0nnJ8t/zsD2mg==
X-Received: by 2002:ac2:5581:0:b0:4f3:aaf0:f672 with SMTP id v1-20020ac25581000000b004f3aaf0f672mr4195852lfg.45.1684774897452;
        Mon, 22 May 2023 10:01:37 -0700 (PDT)
Received: from [192.168.1.101] (abyk97.neoplus.adsl.tpnet.pl. [83.9.30.97])
        by smtp.gmail.com with ESMTPSA id x14-20020ac259ce000000b004f13bd73419sm1046097lfn.38.2023.05.22.10.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 10:01:37 -0700 (PDT)
Message-ID: <6c80902b-85ac-c6d2-67c8-41928b320f77@linaro.org>
Date:   Mon, 22 May 2023 19:01:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 09/11] arm64: dts: qcom: sm8250: switch UFS QMP PHY to
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
        devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>
References: <20230521203834.22566-1-dmitry.baryshkov@linaro.org>
 <20230521203834.22566-10-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230521203834.22566-10-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 21.05.2023 22:38, Dmitry Baryshkov wrote:
> Change the UFS QMP PHY to use newer style of QMP PHY bindings (single
> resource region, no per-PHY subnodes).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index a260e4a7305b..4e94fb3bd0bc 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -2166,7 +2166,7 @@ ufs_mem_hc: ufshc@1d84000 {
>  				     "jedec,ufs-2.0";
>  			reg = <0 0x01d84000 0 0x3000>;
>  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> -			phys = <&ufs_mem_phy_lanes>;
> +			phys = <&ufs_mem_phy>;
>  			phy-names = "ufsphy";
>  			lanes-per-direction = <2>;
>  			#reset-cells = <1>;
> @@ -2210,10 +2210,8 @@ ufs_mem_hc: ufshc@1d84000 {
>  
>  		ufs_mem_phy: phy@1d87000 {
>  			compatible = "qcom,sm8250-qmp-ufs-phy";
> -			reg = <0 0x01d87000 0 0x1c0>;
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> -			ranges;
> +			reg = <0 0x01d87000 0 0x1000>;
> +
>  			clock-names = "ref",
>  				      "ref_aux";
>  			clocks = <&rpmhcc RPMH_CXO_CLK>,
> @@ -2221,16 +2219,10 @@ ufs_mem_phy: phy@1d87000 {
>  
>  			resets = <&ufs_mem_hc 0>;
>  			reset-names = "ufsphy";
> -			status = "disabled";
>  
> -			ufs_mem_phy_lanes: phy@1d87400 {
> -				reg = <0 0x01d87400 0 0x16c>,
> -				      <0 0x01d87600 0 0x200>,
> -				      <0 0x01d87c00 0 0x200>,
> -				      <0 0x01d87800 0 0x16c>,
> -				      <0 0x01d87a00 0 0x200>;
> -				#phy-cells = <0>;
> -			};
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
>  		};
>  
>  		tcsr_mutex: hwlock@1f40000 {
