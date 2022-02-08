Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 827A04AE36A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Feb 2022 23:23:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386391AbiBHWWH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Feb 2022 17:22:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386314AbiBHUF7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Feb 2022 15:05:59 -0500
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C4FC0612C0;
        Tue,  8 Feb 2022 12:05:58 -0800 (PST)
Received: by mail-oo1-f48.google.com with SMTP id q145-20020a4a3397000000b002e85c7234b1so18936486ooq.8;
        Tue, 08 Feb 2022 12:05:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZlLkbIp+P5s81zfXbnVyCYgSjTbo7KDo2PcGmOpWyPk=;
        b=RQDMWnNgrL/E61RxwBw23Ji8GtuoOFzYwdkqnja1rFuGCrpfSDBAciamv3Xa7h1ZzV
         x5+RQjC5Wcv9DrYpY0p6c7TeUjyQMytn390nLJjn2as4ZbhS/kwBkYzYq4TYdgOBvkzj
         skSXhp02JdOWxLfIsTViLVIKeHcbnZprcGg6mDJyq/czqdUTbbYR9zoUwCwDAvCGVjiV
         +xt3y5RtAP4hrvW/UJlI3JIq7k441J68bE79qsTFm8HEA2GU14HnnEEnqs2Fa9ZD6tFS
         qad4QG5IzWO35pZzKK8N2Ag7s742VilGYuG/7AKtotskKwF4we6qMl30B304OBUEAdt0
         jPBA==
X-Gm-Message-State: AOAM532fvKfowNmCNRM899sYb4jDqpHO2jkLCZOiCv/oEDrD491cIJZY
        aUCYkHvmJ07nr6iwZbC31wV8tAorhw==
X-Google-Smtp-Source: ABdhPJw0MeGqUiN76spt6cATUI2ZuYwbsMyNCwyGn7FZ15ScEooyZ7X9RWMe5ZDYdS2j1C5SPGRl6A==
X-Received: by 2002:a4a:5547:: with SMTP id e68mr2435568oob.16.1644350758064;
        Tue, 08 Feb 2022 12:05:58 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id i21sm6384154oao.35.2022.02.08.12.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 12:05:57 -0800 (PST)
Received: (nullmailer pid 2919698 invoked by uid 1000);
        Tue, 08 Feb 2022 20:05:56 -0000
Date:   Tue, 8 Feb 2022 14:05:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [RFD]: Solving qcom unique unit address warnings
Message-ID: <YgLNJPpyVgFYuB45@robh.at.kernel.org>
References: <YerolYU7Ih3GW/zP@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YerolYU7Ih3GW/zP@matsya>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 21, 2022 at 10:38:37PM +0530, Vinod Koul wrote:
> Hi Rob,
> 
> On all Qualcomm SoCs there exists QUP serial engine. These engines are
> loaded with a firmware by bootloader and can support a specific protocol
> like I2C/SPI/uart etc.
> 
> Since the serial engine can support different protocols we end up
> describing all the supported ones for this, as illustrated below from
> sdm845 dts upstream:
> 
> 		qupv3_id_0: geniqup@8c0000 {
> 			compatible = "qcom,geni-se-qup";
> 			reg = <0 0x008c0000 0 0x6000>;
> 			clock-names = "m-ahb", "s-ahb";
> 			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
> 				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
> 			iommus = <&apps_smmu 0x3 0x0>;
> 			#address-cells = <2>;
> 			#size-cells = <2>;
> 			ranges;
> 			interconnects = <&aggre1_noc MASTER_QUP_1 0 &config_noc SLAVE_BLSP_1 0>;
> 			interconnect-names = "qup-core";
> 			status = "disabled";
> 
> 			i2c0: i2c@880000 {
> 				compatible = "qcom,geni-i2c";
> 				reg = <0 0x00880000 0 0x4000>;
> 				clock-names = "se";
> 				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
> 				pinctrl-names = "default";
> 				pinctrl-0 = <&qup_i2c0_default>;
> 				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
> 				#address-cells = <1>;
> 				#size-cells = <0>;
> 				power-domains = <&rpmhpd SDM845_CX>;
> 				operating-points-v2 = <&qup_opp_table>;
> 				interconnects = <&aggre1_noc MASTER_QUP_1 0 &config_noc SLAVE_BLSP_1 0>,
> 						<&gladiator_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_BLSP_1 0>,
> 						<&aggre1_noc MASTER_QUP_1 0 &mem_noc SLAVE_EBI1 0>;
> 				interconnect-names = "qup-core", "qup-config", "qup-memory";
> 				status = "disabled";
> 			};
> 
> 			spi0: spi@880000 {
> 				compatible = "qcom,geni-spi";
> 				reg = <0 0x00880000 0 0x4000>;
> 				clock-names = "se";
> 				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
> 				pinctrl-names = "default";
> 				pinctrl-0 = <&qup_spi0_default>;
> 				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
> 				#address-cells = <1>;
> 				#size-cells = <0>;
> 				interconnects = <&aggre1_noc MASTER_QUP_1 0 &config_noc SLAVE_BLSP_1 0>,
> 						<&gladiator_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_BLSP_1 0>;
> 				interconnect-names = "qup-core", "qup-config";
> 				status = "disabled";
> 			};
> 
> 			uart0: serial@880000 {
> 				compatible = "qcom,geni-uart";
> 				reg = <0 0x00880000 0 0x4000>;
> 				clock-names = "se";
> 				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
> 				pinctrl-names = "default";
> 				pinctrl-0 = <&qup_uart0_default>;
> 				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
> 				power-domains = <&rpmhpd SDM845_CX>;
> 				operating-points-v2 = <&qup_opp_table>;
> 				interconnects = <&aggre1_noc MASTER_QUP_1 0 &config_noc SLAVE_BLSP_1 0>,
> 						<&gladiator_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_BLSP_1 0>;
> 				interconnect-names = "qup-core", "qup-config";
> 				status = "disabled";
> 			};
> 
> 
> The problem comes with all these nodes having same unit addresses. This
> is adding to ~2K warning for unique_unit_address upstream.

This is with W=1, right? 
 
> So to solve this we thought of creating a qup se node and then query the
> protocol supported from the firmware on boot and create a child
> auxillary_device. The problem with that approach is another warning
> "node name for SPI buses should be 'spi'"! So that would not help
> 
> Now, I cant think of any better idea here, except maybe move these to
> respective board dts and perhaps keep them commented here for
> documentation.
> 
> Do we have any better idea to solve this problem?

There is another dtc warning option called 
unique_unit_address_if_enabled which we could enable under W=1 instead 
of unique_unit_address. Even that option has too many warnings to enable 
by default.

Rob

