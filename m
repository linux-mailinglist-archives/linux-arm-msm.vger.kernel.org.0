Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54C6627E762
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Sep 2020 13:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgI3LFe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Sep 2020 07:05:34 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:57676 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725779AbgI3LFb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Sep 2020 07:05:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601463930; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=WPlpDhi/b2IDVMOaA97fK3b8AFsr8llioaaXDGmHhhU=;
 b=H9/VzzTGs1riFUkIxB9VTIYYSrfJmsfownYNeIEuYKQpi5WXLHofK7a4qWBGXgWd3EaMf5QN
 pwIc2AMyL77eNToov2at4Bwpt6fW9Jm0DiOdHs2GCfL1hboYOnRs1gRX2Us69Z8hCIuhUn7K
 qXQ4ppgqkkIIzaqiY2CxyA94640=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f746635bebf546dbb6173ec (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 30 Sep 2020 11:04:21
 GMT
Sender: gokulsri=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9779EC433CA; Wed, 30 Sep 2020 11:04:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: gokulsri)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 31CCFC433C8;
        Wed, 30 Sep 2020 11:04:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 30 Sep 2020 16:34:21 +0530
From:   gokulsri@codeaurora.org
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        sboyd@codeaurora.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sricharan@codeaurora.org
Subject: Re: [PATCH v2 3/3] arm64: dts: Enabled MHI device over PCIe
In-Reply-To: <20200806102623.GB2406@Mani-XPS-13-9360>
References: <1596706332-12957-1-git-send-email-gokulsri@codeaurora.org>
 <1596706332-12957-4-git-send-email-gokulsri@codeaurora.org>
 <20200806102623.GB2406@Mani-XPS-13-9360>
Message-ID: <d3b10e0842192eb7016ebc447e148378@codeaurora.org>
X-Sender: gokulsri@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-06 15:56, Manivannan Sadhasivam wrote:
> On Thu, Aug 06, 2020 at 03:02:12PM +0530, Gokul Sriram Palanisamy 
> wrote:
>> Enabled MHI device support over PCIe and added memory
>> reservation required for MHI enabled QCN9000 PCIe card.
>> 
> 
> There is no DT support exist for MHI as of now, so this is not going to 
> work.
> 
> Thanks,
> Mani
> 
Hi Mani,
The dt entries are to be used by the ath11k driver. Will remove 
mhi,max-channels and mhi,timeout
and post a new revision.

Thanks,
Gokul
>> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi | 58 
>> ++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/ipq8074.dtsi      |  8 +++++
>>  2 files changed, 66 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi 
>> b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
>> index 0827055..d201a7b 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
>> @@ -24,6 +24,22 @@
>>  		device_type = "memory";
>>  		reg = <0x0 0x40000000 0x0 0x20000000>;
>>  	};
>> +
>> +	reserved-memory {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +
>> +		qcn9000_pcie0: memory@50f00000 {
>> +			no-map;
>> +			reg = <0x0 0x50f00000 0x0 0x03700000>;
>> +		};
>> +
>> +		qcn9000_pcie1: memory@54600000 {
>> +			no-map;
>> +			reg = <0x0 0x54600000 0x0 0x03700000>;
>> +		};
>> +	};
>>  };
>> 
>>  &blsp1_spi1 {
>> @@ -74,3 +90,45 @@
>>  		nand-bus-width = <8>;
>>  	};
>>  };
>> +
>> +&pcie0_rp {
>> +	status = "ok";
>> +
>> +	mhi_0: qcom,mhi@0 {
>> +		reg = <0 0 0 0 0 >;
>> +		qrtr_instance_id = <0x20>;
>> +		#address-cells = <0x2>;
>> +		#size-cells = <0x2>;
>> +
>> +		base-addr = <0x50f00000>;
>> +		qcom,caldb-addr = <0x53E00000>;
>> +		qrtr_node_id = <0x27>;
>> +		mhi,max-channels = <30>;
>> +		mhi,timeout = <10000>;
>> +
>> +		pcie0_mhi: pcie0_mhi {
>> +			status = "ok";
>> +		};
>> +	};
>> +};
>> +
>> +&pcie1_rp {
>> +	status = "ok";
>> +
>> +	mhi_1: qcom,mhi@1 {
>> +		reg = <0 0 0 0 0 >;
>> +		qrtr_instance_id = <0x21>;
>> +		#address-cells = <0x2>;
>> +		#size-cells = <0x2>;
>> +
>> +		base-addr = <0x54600000>;
>> +		qcom,caldb-addr = <0x57500000>;
>> +		qrtr_node_id = <0x28>;
>> +		mhi,max-channels = <30>;
>> +		mhi,timeout = <10000>;
>> +
>> +		pcie1_mhi: pcie1_mhi {
>> +			status = "ok";
>> +		};
>> +	};
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi 
>> b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
>> index b651345..eef47c1 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
>> @@ -709,6 +709,10 @@
>>  				      "ahb",
>>  				      "axi_m_sticky";
>>  			status = "disabled";
>> +
>> +			pcie1_rp: pcie1_rp {
>> +				reg = <0 0 0 0 0>;
>> +			};
>>  		};
>> 
>>  		pcie0: pci@20000000 {
>> @@ -779,6 +783,10 @@
>>  				      "axi_m_sticky",
>>  				      "axi_s_sticky";
>>  			status = "disabled";
>> +
>> +			pcie0_rp: pcie0_rp {
>> +				reg = <0 0 0 0 0>;
>> +			};
>>  		};
>> 
>>  		tcsr_q6: syscon@1945000 {
>> --
>> 2.7.4
>> 
