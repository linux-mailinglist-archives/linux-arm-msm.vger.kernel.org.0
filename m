Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3FCE1EFA34
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2020 16:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727997AbgFEOPX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jun 2020 10:15:23 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:13057 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726553AbgFEOPX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jun 2020 10:15:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591366522; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wedy4cKwLDkJueE39OQ5A/Ljrp4rU5VxwwQZUZ2wqrI=;
 b=S5RhCFTcPDu5JHXDWAWEqra7azVv6aOWEuKfzOHnFTAWVSB2/zX2xyJJSu+K1u5L72oEymNY
 BN7ZpKCmYEB/MIeGL9vYLetqb7PDXXP1BX0LSZBDrpfebkL+F50RnmAY0ZMA0heoWoFtd69u
 Rxb0mZ2p/nEhaME9jdCgKWH1GF0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-east-1.postgun.com with SMTP id
 5eda5368ea0dfa490ee91cc6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Jun 2020 14:15:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 00B07C43391; Fri,  5 Jun 2020 14:15:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4ECBBC433CA;
        Fri,  5 Jun 2020 14:15:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 05 Jun 2020 19:45:03 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree-owner@vger.kernel.org
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm8150: add apps_smmu node
In-Reply-To: <d35d2d1b64622ae83ffd9a963aadcad4@codeaurora.org>
References: <20200524023815.21789-1-jonathan@marek.ca>
 <20200524023815.21789-2-jonathan@marek.ca>
 <d35d2d1b64622ae83ffd9a963aadcad4@codeaurora.org>
Message-ID: <66453e142fb3798b86159a5d473efabb@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-05-25 15:07, Sai Prakash Ranjan wrote:
> Hi Jonathan,
> 
> On 2020-05-24 08:08, Jonathan Marek wrote:
>> Add the apps_smmu node for sm8150. Note that adding the iommus field 
>> for
>> UFS is required because initializing the iommu removes the bypass 
>> mapping
>> that created by the bootloader.
>> 
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 91 
>> ++++++++++++++++++++++++++++
>>  1 file changed, 91 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> index a36512d1f6a1..acb839427b12 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> @@ -442,6 +442,8 @@ ufs_mem_hc: ufshc@1d84000 {
>>  			resets = <&gcc GCC_UFS_PHY_BCR>;
>>  			reset-names = "rst";
>> 
>> +			iommus = <&apps_smmu 0x300 0>;
>> +
>>  			clock-names =
>>  				"core_clk",
>>  				"bus_aggr_clk",
>> @@ -706,6 +708,7 @@ usb_1_dwc3: dwc3@a600000 {
>>  				compatible = "snps,dwc3";
>>  				reg = <0 0x0a600000 0 0xcd00>;
>>  				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
>> +				iommus = <&apps_smmu 0x140 0>;
>>  				snps,dis_u2_susphy_quirk;
>>  				snps,dis_enblslpm_quirk;
>>  				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
>> @@ -742,6 +745,94 @@ spmi_bus: spmi@c440000 {
>>  			cell-index = <0>;
>>  		};
>> 
>> +		apps_smmu: iommu@15000000 {
>> +			compatible = "qcom,sdm845-smmu-500", "arm,mmu-500";
> 
> This should be qcom,sm8150-smmu-500 and also you need to update the 
> arm-smmu
> binding with this compatible in a separate patch.
> 

I tested out this series with my coresight patches for enabling SMMU 
translation
for ETR on SM8150, it works fine. With this above comment addressed and 
with
Bjorn's comments on commit description addressed,

Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
