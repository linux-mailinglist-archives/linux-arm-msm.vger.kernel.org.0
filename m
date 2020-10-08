Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BECB287B0A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Oct 2020 19:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729179AbgJHReB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Oct 2020 13:34:01 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:41282 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731239AbgJHRd5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Oct 2020 13:33:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602178436; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=g41gw1keqpIWi6VHsKLyBux61Knjs9TSn2qndwM+vvM=;
 b=fP2ec6dcHETSLhG4xbYL2cP+zWlyvuyiskD4W7uM7GhsxFFqBXpiMzSDPQro1yraXm3XeyQU
 SSedOeh9hxN2oMmn7659sIo83xLfgx/RtJXQIcwrl+ejjRE1tLR4VCht4fL7d6ORCVgVJCGP
 an0gVwDwvr3o/Kjmi/Ay4nGwqtA=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f7f4d78588858a30445e8b1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 08 Oct 2020 17:33:44
 GMT
Sender: gokulsri=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B17A0C433F1; Thu,  8 Oct 2020 17:33:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: gokulsri)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5E0BAC433CB;
        Thu,  8 Oct 2020 17:33:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 08 Oct 2020 23:03:42 +0530
From:   gokulsri@codeaurora.org
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     sboyd@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        sricharan@codeaurora.org
Subject: Re: [PATCH v3 3/3] arm64: dts: Enabled MHI device over PCIe
In-Reply-To: <20201008131115.GA23649@linux>
References: <1602160344-19586-1-git-send-email-gokulsri@codeaurora.org>
 <1602160344-19586-4-git-send-email-gokulsri@codeaurora.org>
 <20201008131115.GA23649@linux>
Message-ID: <7dd959fd2d9375d5529cf52e93aafda3@codeaurora.org>
X-Sender: gokulsri@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-08 18:41, Manivannan Sadhasivam wrote:
> Hi,
> 
> On Thu, Oct 08, 2020 at 06:02:24PM +0530, Gokul Sriram Palanisamy 
> wrote:
>> Enabled MHI device support over PCIe and added memory
>> reservation required for MHI enabled QCN9000 PCIe card.
>> 
>> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi | 47 
>> ++++++++++++++++++++++++++++++
>>  1 file changed, 47 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi 
>> b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
>> index 0827055..e5c1ec0 100644
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
>> @@ -45,11 +61,42 @@
>>  &pcie0 {
>>  	status = "ok";
>>  	perst-gpio = <&tlmm 58 0x1>;
>> +
>> +	pcie0_rp: pcie0_rp {
>> +		reg = <0 0 0 0 0>;
>> +
>> +		status = "ok";
>> +		mhi_0: qcom,mhi@0 {
> 
> MHI doesn't support devicetree as of now so how is this supposed to 
> work?
> Have you tested this series with mainline?
> 
> Thanks,
> Mani
> 

  Hi Mani,
  This node entries will be consumed by ath11k driver and is not supposed 
to be consumed by mhi driver.
  And yes, it is tested on Mainline.

  Regards,
  Gokul

>> +			reg = <0 0 0 0 0 >;
>> +
>> +			qrtr_instance_id = <0x20>;
>> +			base-addr = <0x50f00000>;
>> +			m3-dump-addr = <0x53c00000>;
>> +			etr-addr = <0x53d00000>;
>> +			qcom,caldb-addr = <0x53e00000>;
>> +		};
>> +	};
>>  };
>> 
>>  &pcie1 {
>>  	status = "ok";
>>  	perst-gpio = <&tlmm 61 0x1>;
>> +
>> +	pcie1_rp: pcie1_rp {
>> +		reg = <0 0 0 0 0>;
>> +
>> +		status = "ok";
>> +		mhi_1: qcom,mhi@1 {
>> +			reg = <0 0 0 0 0 >;
>> +
>> +			qrtr_instance_id = <0x21>;
>> +			base-addr = <0x54600000>;
>> +			m3-dump-addr = <0x57300000>;
>> +			etr-addr = <0x57400000>;
>> +			qcom,caldb-addr = <0x57500000>;
>> +			};
>> +		};
>> +	};
>>  };
>> 
>>  &qmp_pcie_phy0 {
>> --
>> 2.7.4
>> 
