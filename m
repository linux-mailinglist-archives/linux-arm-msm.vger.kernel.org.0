Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07F0B1E733F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 05:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390276AbgE2DB5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 23:01:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390221AbgE2DBu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 23:01:50 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FFFDC08C5C7
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 20:01:50 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id x29so860263qtv.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 20:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vCLQVJ0rHf+dyT5VdkzM3xis443r7UJvYGZFswqKoWc=;
        b=xI21Ip/5b9bIaHLFnLLaru/mvE7C+/Fb8ke1w2Ygc1G0FX2I43/Jy4MYvOD2dcyB8X
         XLKV1fT+A2HEycxVBOcR6lmb7crugBjxEBFGhe1TPuo0kc5Jo/vM5141GvO2mpjDe4ZX
         JypOY3fGacPNB++2m+9xkqenk7t0hZ/JDPbGdYTwH/L27r2O+Yjd6qFk9vAUitffNB79
         Urf3dPT5K9sZ1hC0u+L2oDvQXvqDx9p9MLPWy56QXB0y60Po8APQNxQ9sonago2ZZ+qf
         LYRD1cnWSP1389HcwR3uArgMcRB/LF4c+ugN+vy8xTMO94k/EvxNo9qIWXWedtmmWj+o
         s63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vCLQVJ0rHf+dyT5VdkzM3xis443r7UJvYGZFswqKoWc=;
        b=dHOwudi9eQfl0pS0rWmvLUPhS9uYEo7ZVZ1i8h8Gc03la4oG5l3XdQuyIIAYEsm7DD
         mESjS7zSAKUCufvEE9lcARnmmf+FlRGeMwBHNE7bKzMzP0sdjsGR57aJ5CM70WRRLHIY
         lGwC9LsyhXeZtFZgrntAOLtoEX3u3CwABhoc6E0FcvlfqhXcxiqNCEGO8kEa1cc6tU1B
         GbxuP/hJMgkKkGeQQ2liQlPDHH0aW5PJQhe3aExhiAP7XR4F5f9cuxneqJlln8leiWMl
         aYcHfQQkSWT08QYyMecA0IK5M8XkuBBTM6fA3DWTZ0lX6igavDlB9cKuEuCDlF7OahiE
         JXsA==
X-Gm-Message-State: AOAM5318MvXwcdTb8MbDOpSMpNXoUKoZWJZGx3/jTmuF9+o1QTSlzxF1
        lPksiNMgV+BpGqoPtY0Q7jlrxQ==
X-Google-Smtp-Source: ABdhPJwyxoe6WZnjGWg2iYWLeuX2CykgYE4ERKXJmYTXT2UAXr4C9xPZMphkItC1D0dyNDS8M+fpZw==
X-Received: by 2002:ac8:35f4:: with SMTP id l49mr6266772qtb.98.1590721309821;
        Thu, 28 May 2020 20:01:49 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id q24sm7367428qtc.0.2020.05.28.20.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 20:01:49 -0700 (PDT)
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm8150: add apps_smmu node
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200524023815.21789-1-jonathan@marek.ca>
 <20200524023815.21789-2-jonathan@marek.ca>
 <20200529025246.GV279327@builder.lan>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <d0908f34-a698-3449-35b9-7a98e9641295@marek.ca>
Date:   Thu, 28 May 2020 23:02:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200529025246.GV279327@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/28/20 10:52 PM, Bjorn Andersson wrote:
> On Sat 23 May 19:38 PDT 2020, Jonathan Marek wrote:
> 
>> Add the apps_smmu node for sm8150. Note that adding the iommus field for
>> UFS is required because initializing the iommu removes the bypass mapping
>> that created by the bootloader.
>>
> 
> Unrelated to the patch itself; how do you disable the splash screen on
> 8150? "fastboot oem select-display-panel none" doesn't seem to work for
> me on the MTP - and hence this would prevent my device from booting.
> 
> Thanks,
> Bjorn
> 

I don't have a MTP, but on HDK855, "fastboot oem select-display-panel 
none" combined with setting the physical switch to HDMI mode (which 
switches off the 1440x2560 panel) gets it to not setup the display at 
all (just the fastboot command isn't enough).

With HDK865 though that doesn't work and I have a hack to work around it 
(writing 0 to INTF_TIMING_ENGINE_EN early on in boot will stop video 
mode scanout and it won't crash).

>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8150.dtsi | 91 ++++++++++++++++++++++++++++
>>   1 file changed, 91 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> index a36512d1f6a1..acb839427b12 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> @@ -442,6 +442,8 @@ ufs_mem_hc: ufshc@1d84000 {
>>   			resets = <&gcc GCC_UFS_PHY_BCR>;
>>   			reset-names = "rst";
>>   
>> +			iommus = <&apps_smmu 0x300 0>;
>> +
>>   			clock-names =
>>   				"core_clk",
>>   				"bus_aggr_clk",
>> @@ -706,6 +708,7 @@ usb_1_dwc3: dwc3@a600000 {
>>   				compatible = "snps,dwc3";
>>   				reg = <0 0x0a600000 0 0xcd00>;
>>   				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
>> +				iommus = <&apps_smmu 0x140 0>;
>>   				snps,dis_u2_susphy_quirk;
>>   				snps,dis_enblslpm_quirk;
>>   				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
>> @@ -742,6 +745,94 @@ spmi_bus: spmi@c440000 {
>>   			cell-index = <0>;
>>   		};
>>   
>> +		apps_smmu: iommu@15000000 {
>> +			compatible = "qcom,sdm845-smmu-500", "arm,mmu-500";
>> +			reg = <0 0x15000000 0 0x100000>;
>> +			#iommu-cells = <2>;
>> +			#global-interrupts = <1>;
>> +			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>;
>> +		};
>> +
>>   		remoteproc_adsp: remoteproc@17300000 {
>>   			compatible = "qcom,sm8150-adsp-pas";
>>   			reg = <0x0 0x17300000 0x0 0x4040>;
>> -- 
>> 2.26.1
>>
