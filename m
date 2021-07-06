Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 769533BC86D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 11:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbhGFJWY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 05:22:24 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:23822 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231190AbhGFJWY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 05:22:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625563186; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=tVNox5UxH1mduv7g7ycIOmhCnRCLc2A4EM1ABCiryh8=;
 b=rNH8jSctzmSgWp6PnYx3k89sH86/EnvY1Irh7BhPDDIctyb8SMArqFqkIwVRgp/p4sXAQ0MV
 AQXFaSUrrch8VggkqKMrYAL6+bPsIiG9uxqQA++JfcQMPN6CudahT8ucOwSle+E/QmehYFM/
 LCdhjZjuyxnx8i3VpxNjH3w9KNU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60e42020c4cc543602c3521d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 06 Jul 2021 09:19:28
 GMT
Sender: rojay=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D5EF9C433D3; Tue,  6 Jul 2021 09:19:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rojay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5C752C433F1;
        Tue,  6 Jul 2021 09:19:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 06 Jul 2021 14:49:27 +0530
From:   rojay@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V3 1/3] arm64: dts: sc7280: Add QSPI node
In-Reply-To: <98befc79fc039496b0c12d7983319c92@codeaurora.org>
References: <20210604135439.19119-1-rojay@codeaurora.org>
 <20210604135439.19119-2-rojay@codeaurora.org> <YLxHTDxVcSvVxsd5@builder.lan>
 <98befc79fc039496b0c12d7983319c92@codeaurora.org>
Message-ID: <2ad7a00924b5065bf61c47e8b6d24339@codeaurora.org>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-08 13:37, rojay@codeaurora.org wrote:
> On 2021-06-06 09:25, Bjorn Andersson wrote:
>> On Fri 04 Jun 08:54 CDT 2021, Roja Rani Yarubandi wrote:
>> 
>>> Add QSPI DT node for SC7280 SoC.
>>> 
>>> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
>>> ---
>>> Changes in V3:
>>>  - Broken the huge V2 patch into 3 smaller patches.
>>>    1. QSPI DT nodes
>>>    2. QUP wrapper_0 DT nodes
>>>    3. QUP wrapper_1 DT nodes
>>> 
>>> Changes in V2:
>>>  - As per Doug's comments removed pinmux/pinconf subnodes.
>>>  - As per Doug's comments split of SPI, UART nodes has been done.
>>>  - Moved QSPI node before aps_smmu as per the order.
>>> 
>>>  arch/arm64/boot/dts/qcom/sc7280-idp.dts | 29 ++++++++++++
>>>  arch/arm64/boot/dts/qcom/sc7280.dtsi    | 61 
>>> +++++++++++++++++++++++++
>>>  2 files changed, 90 insertions(+)
>>> 
>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts 
>>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>>> index 3900cfc09562..d0edffc15736 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>>> @@ -268,6 +268,22 @@ pmr735b_die_temp {
>>>  		};
>>>  };
>>> 
>>> +&qspi {
>>> +	status = "okay";
>>> +	pinctrl-names = "default";
>>> +	pinctrl-0 = <&qspi_clk>, <&qspi_cs0>, <&qspi_data01>;
>>> +
>>> +	flash@0 {
>>> +		compatible = "jedec,spi-nor";
>>> +		reg = <0>;
>>> +
>>> +		/* TODO: Increase frequency after testing */
>>> +		spi-max-frequency = <25000000>;
>>> +		spi-tx-bus-width = <2>;
>>> +		spi-rx-bus-width = <2>;
>>> +	};
>>> +};
>>> +
>>>  &qupv3_id_0 {
>>>  	status = "okay";
>>>  };
>>> @@ -278,6 +294,19 @@ &uart5 {
>>> 
>>>  /* PINCTRL - additions to nodes defined in sc7280.dtsi */
>>> 
>>> +&qspi_cs0 {
>>> +	bias-disable;
>>> +};
>>> +
>>> +&qspi_clk {
>>> +	bias-disable;
>>> +};
>>> +
>>> +&qspi_data01 {
>>> +	/* High-Z when no transfers; nice to park the lines */
>>> +	bias-pull-up;
>>> +};
>>> +
>>>  &qup_uart5_default {
>>>  	tx {
>>>  		pins = "gpio46";
>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>> index 6c9d5eb93f93..3047ab802cd2 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>> @@ -1061,6 +1061,42 @@ apss_merge_funnel_in: endpoint {
>>>  			};
>>>  		};
>>> 
>>> +		qspi_opp_table: qspi-opp-table {
>> 
>> This node doesn't represents anything on the mmio bus, so it shouldn't
>> live in in /soc. Can't you move it into &qspi?
>> 
>> Regards,
>> Bjorn
>> 
> 
> Sure, will move it into qspi node.
> 
> Thanks,
> Roja
> 

Hi Bjorn,

Moving "qspi_opp_table" inside &qspi node causing this warning:
arch/arm64/boot/dts/qcom/sc7280.dtsi:1055.35-1072.6: Warning 
(spi_bus_reg): /soc@0/spi@88dc000/qspi-opp-table: missing or empty reg 
property

Shall I keep the qspi-opp-table out of &qspi node?

Thanks,
Roja

>>> +			compatible = "operating-points-v2";
>>> +
>>> +			opp-75000000 {
>>> +				opp-hz = /bits/ 64 <75000000>;
>>> +				required-opps = <&rpmhpd_opp_low_svs>;
>>> +			};
>>> +
>>> +			opp-150000000 {
>>> +				opp-hz = /bits/ 64 <150000000>;
>>> +				required-opps = <&rpmhpd_opp_svs>;
>>> +			};
>>> +
>>> +			opp-300000000 {
>>> +				opp-hz = /bits/ 64 <300000000>;
>>> +				required-opps = <&rpmhpd_opp_nom>;
>>> +			};
>>> +		};
>>> +
>>> +		qspi: spi@88dc000 {
>>> +			compatible = "qcom,qspi-v1";
>>> +			reg = <0 0x088dc000 0 0x1000>;
>>> +			#address-cells = <1>;
>>> +			#size-cells = <0>;
>>> +			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
>>> +			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
>>> +				 <&gcc GCC_QSPI_CORE_CLK>;
>>> +			clock-names = "iface", "core";
>>> +			interconnects = <&gem_noc MASTER_APPSS_PROC 0
>>> +					&cnoc2 SLAVE_QSPI_0 0>;
>>> +			interconnect-names = "qspi-config";
>>> +			power-domains = <&rpmhpd SC7280_CX>;
>>> +			operating-points-v2 = <&qspi_opp_table>;
>>> +			status = "disabled";
>>> +		};
