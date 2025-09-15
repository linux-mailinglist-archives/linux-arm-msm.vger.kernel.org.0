Return-Path: <linux-arm-msm+bounces-73548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DEAB576DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 12:45:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 266314E03B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 10:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF7C2FD7A4;
	Mon, 15 Sep 2025 10:44:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597642ED846;
	Mon, 15 Sep 2025 10:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757933075; cv=none; b=Nn/WL/GwSB5SI2DMtCWQzI8vl9qQZW1g39LtrtYxpu8s8dG3YSWiVCoyDAXeLKeKNopTE+n+K8RLrVeeNCT3YjHY4uyH7QfF+waxyn58eqiTVJ2vmB/9Qx93c3qJaS+K1La3WCD4TXwefzLM/1or4pnz/7lUaNzUv0ZsDaH/lXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757933075; c=relaxed/simple;
	bh=wa0cYI+ah+AvN0/sbzMdeoYPO/F+uIM6PMekhf9HdDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R/AHqgBD742AKbznB3MlXIcXCg6dumZm2eIiH07of6CR7zq1RN6JeN55SAUsJzi9MKF2YEyMCUsM+6xXeuk4shaZWqNksQacq2YcK23Y2gjkB+UL/MJh/c7PWgB7tmsvqIOsXw1ZnqK0B05V0Ta+IzCCUjYCSGlte6OCFg736NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1757933031t384558d8
X-QQ-Originating-IP: ViO3qK2xPauEngfgGmycWiarTOARoV3EHoXmRla6+7M=
Received: from [127.0.0.1] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 15 Sep 2025 18:43:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15059840297681885872
Message-ID: <B3EFC6A5E09F74FB+a67c9b82-a7c5-4dbb-9486-90a6df55ed13@radxa.com>
Date: Mon, 15 Sep 2025 18:43:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs6490: Introduce Radxa Dragon
 Q6A
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250915-radxa-dragon-q6a-v3-0-a6c32d988ed7@radxa.com>
 <20250915-radxa-dragon-q6a-v3-2-a6c32d988ed7@radxa.com>
 <33vm6uzxqbs5bukswpzdkrn3ronl7mp2q5d3j772t7lqcnvqvg@5or7jxglcynf>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <33vm6uzxqbs5bukswpzdkrn3ronl7mp2q5d3j772t7lqcnvqvg@5or7jxglcynf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N+/GyfuFbcLi9vKdZlDTi25HexHBa35Ey17B5e5fSmkMASF/2oUDfY7O
	2ok6oEMt8Xvgh8u8QEb6qfdXS300sjPJuznCEQd+tSkmNZkrOQwjYeIN6NiaQwR4jw+1gnt
	ziQIYlvo6pznesj1xctEl6MuA5C3jnPOXSkuF6s+IPEh8SlO/mKcBwHecd3nu0D1FHWR7MH
	XWqsDR2OJ2rTI1aSbCbnB00OF/gy5SNnJ5hAi0r3m+9h/ye3eh4wMdF0P/2HbI2h+Un1ouI
	maDAAjL6hVHSxTw9EBSHEESw+KAMdYJ1AyxiHH3h+QWxFu/MO9NyvtkgTjboxw8WTsFsSaM
	t4R5fRzjz1Zn1jNR9fTPXJDkGIRjsIIPFuIyiRLCHOMNfbi5pOGAN3R4pNXcNjVery1gEAc
	GfkB7882YnvnOdF0v/CNIw1km1H5BN8+U+98T/NguQoM2KkpUQmDrVUuVzJIhZLzLhdv4wB
	NPT320CPzR9vqb8xVDlRpgaEaii3F7g9K1jvmmmOPj/nT9xs5gCY16yccz9XdDyAdSykDuC
	uqV9JBf7yvzFp7M9skNrJhkv5/DsgJDeDx8PEDqMJdMdJEfQFie0voik1GvPJ6gBP9b2Zde
	FlTuhMSWhZBvmZskGU8W+fmiZU7fTNT4J6hZscD01J0unLN+4qrQkrMH1sFIv65nyZazrw4
	+mCt9rrFmyt+7Zue69Z2L6VFjfdyBAaOjmq3rErB4ZD9UsgcksNqYn9W8m+DZi5tM1PLq/Y
	xjDomGPaWacNdlp1bOdyHx8Yfgcx1NyLRDjwIBd////gTrLxIczvyTZFkV8TA9bsHXRs4OE
	nvxcbVhXEhzERTyxNpqinAAuEgkiaG5CTl90jX480YXaV8m17N3Nbt3PBt85kTWKhqgsf9G
	r0dUKu2oY4LJ1frJMW+Ai8KBWzfDLfRh8vPVaM85y5ZHtZkwDyESvcnz0ZxTGVyRAkfHiM/
	23PkuPrbfE3eRfyBMftGFroxH4U5A+aw2CoHot1Ss3m1BaxxGrnXY9iL6b9eXnb4xUMueSl
	J3cGJ/03S3k/6KZDc7
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

On 9/15/2025 6:10 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 15, 2025 at 09:31:44AM +0800, Xilin Wu wrote:
>> Radxa Dragon Q6A is a single board computer, based on the Qualcomm
>> QCS6490 platform.
>>
>> Features enabled and working:
>>
>> - Three USB-A 2.0 ports
>> - RTL8111K Ethernet connected to PCIe0
>> - eMMC module
>> - SD card
>> - M.2 M-Key 2230 PCIe 3.0 x2
>> - Headphone jack
>> - Onboard thermal sensors
>> - QSPI controller for updating boot firmware
>> - ADSP remoteproc (Type-C and charging features disabled in firmware)
>> - CDSP remoteproc (for AI applications using QNN)
>> - Venus video encode and decode accelerator
>>
>> Signed-off-by: Xilin Wu <sophon@radxa.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>>   .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 961 +++++++++++++++++++++
>>   2 files changed, 962 insertions(+)
>>
> 
>> +
>> +&gpu_zap_shader {
>> +	firmware-name = "qcom/qcs6490/a660_zap.mbn";
> 
> Is the device fused to reject standard qcs6490 firmware? If not, can we
> point it to the existing files (maybe except the ADSP)? Anyway, could
> you please submit the required set of files to the linux-firmware repo?

No, the device is not fused. So it can use firmware from linux-firmware 
repo, except ADSP and Audioreach topology.

Sure, I can submit the ADSP firmware and Audioreach topology file to 
linux-firmware.> >> +
>> +&usb_2 {
>> +	dr_mode = "host";
> 
> As Konrad has asked, please describe the onboard hub and the USB ports.
> This will ensure that corresponding ports are correctly marked as
> hotplug in sysfs.
> 

Sure, will describe them in v4.

>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_2_hsphy {
>> +	status = "okay";
>> +
>> +	vdda-pll-supply = <&vreg_l10c_0p88>;
>> +	vdda33-supply = <&vreg_l2b_3p072>;
>> +	vdda18-supply = <&vreg_l1c_1p8>;
>> +};
>> +
>> +&venus {
>> +	status = "okay";
> 
> No separate firmware?
> 

The one from linux-firmware works.>


-- 
Best regards,
Xilin Wu <sophon@radxa.com>


