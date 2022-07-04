Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3375A565C61
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 18:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235020AbiGDQs7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 12:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234687AbiGDQq5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 12:46:57 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE428DEBB
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 09:46:55 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id b12-20020a17090a6acc00b001ec2b181c98so14292298pjm.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 09:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=RpYZ3Ou70Uup6jdKhyCwJIqhjuf3Pe97OFqnlcezrtI=;
        b=VjtBhcJOCdOFqSr9KXGeKKtTVPPRFg/IQtSWO+fEIy7aB5ZhvplNhn2U3vTBmI0+8E
         gqBGBICwIEDIpzby0yeUCZ3qqg0q+WUek+ZPMCteVta69PJMQOLto1fl6/PQj9eg6h4y
         9fD6n/LXjCIF39PjpEHvU9KBpBnpUAhFUt/Xz0YzC498g4i62jQmz//dicsARcIhZ4wg
         aZLUDvcE3MNh4PTqbE7p6yJpA0h10wozCxywHh4aVrIcrnwstc0EIOrmySVbGZgoQFMa
         m4K54SoNoaBJnRIwr9AjapPzl9Zxuz6QqWpR1szCfl8+k3nNO+r3GkUfIC3r9J4Nages
         J2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=RpYZ3Ou70Uup6jdKhyCwJIqhjuf3Pe97OFqnlcezrtI=;
        b=tiKTEClwjv3zQhMJtmy+2NQl6hcz5CmXf7Qsh2XEHunKjcvFhSgaMpKOvse8pJyJ2c
         WAHcWS0W0myuaeN98oN0YiT7GXU3Lc3chZDEbMnV1oaObscs0xSZU1Oa9AuujdL2ljkZ
         QjOmaof1aEiOxujBYy88XCsIJG5/igbhmu2Q1WOF1iu/EpmmpaR4AlFMTtqRtVoZwaLL
         z92yXVlFNliwXUnRqqcdB58BlwjMzaSPicWjNh2VLPd83bwV9qT3ART0zMTg31mk8dk0
         AA9TtQB15F9xHtYwA9DyFmM5wWi31z60Nr5kszmKTUh+jNcgjJzW7tDWZNHXa9qRxwDe
         x55Q==
X-Gm-Message-State: AJIora/zhSVhN2o3T67pC5IY/BuXC43gKu0y5RkOl6UOT8YT/yHjoeJn
        SCZbvU+I495knIIghjMm4bKK
X-Google-Smtp-Source: AGRyM1sk3kVBnqzGiKLdviH8FkLTPtYwStCtukHA1McfxyXXES2CmttjE8rjOii5H9nfdFwtSs7HCw==
X-Received: by 2002:a17:902:c2d5:b0:16a:1263:9313 with SMTP id c21-20020a170902c2d500b0016a12639313mr37728814pla.138.1656953215367;
        Mon, 04 Jul 2022 09:46:55 -0700 (PDT)
Received: from thinkpad ([220.158.158.244])
        by smtp.gmail.com with ESMTPSA id a3-20020a1709027e4300b0016b8b35d725sm14632820pln.95.2022.07.04.09.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 09:46:55 -0700 (PDT)
Date:   Mon, 4 Jul 2022 22:16:48 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        Johan Hovold <johan@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v16 6/6] arm64: dts: qcom: sm8250: provide additional MSI
 interrupts
Message-ID: <20220704164648.GI6560@thinkpad>
References: <20220704152746.807550-1-dmitry.baryshkov@linaro.org>
 <20220704152746.807550-7-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220704152746.807550-7-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 04, 2022 at 06:27:46PM +0300, Dmitry Baryshkov wrote:
> On SM8250 each group of MSI interrupts is mapped to the separate host
> interrupt. Describe each of interrupts in the device tree for PCIe0
> host.
> 
> Tested on Qualcomm RB5 platform with first group of MSI interrupts being
> used by the PME and attached ath11k WiFi chip using second group of MSI
> interrupts.
> 
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 43c2d04b226f..3d7bfcb80ea0 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -1810,8 +1810,16 @@ pcie0: pci@1c00000 {
>  			ranges = <0x01000000 0x0 0x60200000 0 0x60200000 0x0 0x100000>,
>  				 <0x02000000 0x0 0x60300000 0 0x60300000 0x0 0x3d00000>;
>  
> -			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "msi";
> +			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi0", "msi1", "msi2", "msi3",
> +					  "msi4", "msi5", "msi6", "msi7";
>  			#interrupt-cells = <1>;
>  			interrupt-map-mask = <0 0 0 0x7>;
>  			interrupt-map = <0 0 0 1 &intc 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
> -- 
> 2.35.1
> 

-- 
மணிவண்ணன் சதாசிவம்
