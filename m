Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 155593104DE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 07:11:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbhBEGKt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 01:10:49 -0500
Received: from so15.mailgun.net ([198.61.254.15]:49189 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230366AbhBEGKr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 01:10:47 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612505427; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=4P2pIqrzxl9M50olLzLc0I1wxDxpfpzDB4id+jGUKbs=;
 b=v0ZPVOwO+RUtRfLJUe5G+Ssu1JScDouViQf5+EUWH4gW2Cjmqxu+yUdgt5QfMAYdYodTobwk
 XM1kHqmsdAhMBuXo14jysoIl/wRidrojmHidKO8vca53oA3nc+u5JW/fuBRc4KLn1Vc/zw86
 cAJDrsAa9C2EIdcZijNspLQKHm0=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 601ce12af112b7872c393646 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Feb 2021 06:09:46
 GMT
Sender: kathirav=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0DECFC433CA; Fri,  5 Feb 2021 06:09:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D0FCDC433C6;
        Fri,  5 Feb 2021 06:09:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 05 Feb 2021 11:39:44 +0530
From:   Kathiravan T <kathirav@codeaurora.org>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64: dts: ipq6018: enable USB2 support
In-Reply-To: <59a0d43f34b69406cd320f16edc4e7fabe022bfd.1611756920.git.baruch@tkos.co.il>
References: <cover.1611756920.git.baruch@tkos.co.il>
 <59a0d43f34b69406cd320f16edc4e7fabe022bfd.1611756920.git.baruch@tkos.co.il>
Message-ID: <ebdc1f5c424968a8e1b5463b29f616cf@codeaurora.org>
X-Sender: kathirav@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-01-27 19:50, Baruch Siach wrote:
> From: Kathiravan T <kathirav@codeaurora.org>
> 
> Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
> [baruch: adjust regs address/size; drop binding updates;
>  drop unsupported quirk properties]
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts |  8 ++++
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi        | 48 ++++++++++++++++++++
>  2 files changed, 56 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> index 99cefe88f6f2..5aec18308712 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> @@ -78,3 +78,11 @@ nand@0 {
>  		nand-bus-width = <8>;
>  	};
>  };
> +
> +&qusb_phy_1 {
> +	status = "ok";
> +};
> +
> +&usb2 {
> +	status = "ok";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index 9fa5b028e4f3..d4a3d4e4a7e9 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -524,6 +524,54 @@ qrtr_requests {
>  			};
>  		};
> 
> +		qusb_phy_1: qusb@59000 {
> +			compatible = "qcom,ipq6018-qusb2-phy";
> +			reg = <0x0 0x059000 0x0 0x180>;
> +			#phy-cells = <0>;
> +
> +			clocks = <&gcc GCC_USB1_PHY_CFG_AHB_CLK>,
> +				 <&xo>;
> +			clock-names = "cfg_ahb", "ref";

As per the bindings, ref clock should be 19.2MHz where the XO in IPQ60xx 
is 24MHz. Did the USB enumerated successfully and able to perform read / 
write operations?

Thanks,
Kathiravan T.


> +
> +			resets = <&gcc GCC_QUSB2_1_PHY_BCR>;
> +			status = "disabled";
> +		};
> +
> +		usb2: usb2@7000000 {
> +			compatible = "qcom,ipq6018-dwc3", "qcom,dwc3";
> +			reg = <0x0 0x070F8800 0x0 0x400>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			clocks = <&gcc GCC_USB1_MASTER_CLK>,
> +				 <&gcc GCC_USB1_SLEEP_CLK>,
> +				 <&gcc GCC_USB1_MOCK_UTMI_CLK>;
> +			clock-names = "master",
> +				      "sleep",
> +				      "mock_utmi";
> +
> +			assigned-clocks = <&gcc GCC_USB1_MASTER_CLK>,
> +					  <&gcc GCC_USB1_MOCK_UTMI_CLK>;
> +			assigned-clock-rates = <133330000>,
> +					       <24000000>;
> +			resets = <&gcc GCC_USB1_BCR>;
> +			status = "disabled";
> +
> +			dwc_1: dwc3@7000000 {
> +			       compatible = "snps,dwc3";
> +			       reg = <0x0 0x7000000 0x0 0xcd00>;
> +			       interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
> +			       phys = <&qusb_phy_1>;
> +			       phy-names = "usb2-phy";
> +			       tx-fifo-resize;
> +			       snps,is-utmi-l1-suspend;
> +			       snps,hird-threshold = /bits/ 8 <0x0>;
> +			       snps,dis_u2_susphy_quirk;
> +			       snps,dis_u3_susphy_quirk;
> +			       dr_mode = "host";
> +			};
> +		};
> +
>  	};
> 
>  	wcss: wcss-smp2p {

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member of Code Aurora Forum, hosted by The Linux Foundation
