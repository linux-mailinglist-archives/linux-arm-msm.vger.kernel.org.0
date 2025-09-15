Return-Path: <linux-arm-msm+bounces-73469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A64CBB56DCD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 03:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9B5B3AD195
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 01:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D2B16A956;
	Mon, 15 Sep 2025 01:20:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9EF1A3A80;
	Mon, 15 Sep 2025 01:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757899226; cv=none; b=s8vs7xEuqGPf647uRc6MxaWTyZa1Ad3j1Y/rn2ZjMCcy45bKmQ/anSg2oKOIYuOPkugnKxVJGSDrTOdqtU+wz4Q7/+jN0HMNhOGtDNyiSIPwlgymxHBGA7ODM0audYGfA29XdJCxuAQxTJvuN4jn1HGhjgNQEd2pnVK0HxS9vek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757899226; c=relaxed/simple;
	bh=g3fFszN1wF+8kkafQjiUfTS78eYYMkkB/v6GcJcC4+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NTzudhmMuwc6GnxyXow1z+9aITfXByDaEMqYwDHv9iWUCQqH+CeNKhrn/cf/tny4oAMgvA+MdLAgpVyHFo/6I2HFioKmWKCzkh8LKIBMPh+S73r/viQaiF2g5PNzjeY/NR5rlyGkBmXaO+CEjdbRR05VvFnTS4LEPFizfK/+c2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip3t1757899213t7e8e3d04
X-QQ-Originating-IP: o72403twT4VAPzPCyV7I15D0CquOdYIpzxdtfrfqVIQ=
Received: from [127.0.0.1] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 15 Sep 2025 09:20:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10215418604633446482
Message-ID: <7B118B34491945E2+c5440518-0874-405a-841c-7d9e43b51d1d@radxa.com>
Date: Mon, 15 Sep 2025 09:20:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: qcs6490: Introduce Radxa Dragon
 Q6A
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
 Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250914-radxa-dragon-q6a-v2-0-045f7e92b3bb@radxa.com>
 <20250914-radxa-dragon-q6a-v2-2-045f7e92b3bb@radxa.com>
 <c9fad3b5-dc9e-425c-b48b-f6481eb14e90@kernel.org>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <c9fad3b5-dc9e-425c-b48b-f6481eb14e90@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OccmtviHNKX2V5L0kGxpjlH/zG9tfcXtYB1IjU8SbhE0XqAe4iyaLDO6
	ZpPaQc5QfydBCU1M8iNAl+oHocIRw77Swd/WNym1IpyGKFh4AqOuWITqT6f3VB24Fg+/DDO
	CcJhBDdNvtNVUHU0H9arr750o/4vYLdn9U+GDUkTH4LKHx1V/1iO5T5PnVOU6vyf1vMUM3w
	zHQhwIGuWN24uQCMtZtoJgLZahwBtkR0i2vlzkA4SfjQCVofdQH9+xjWpXAc7QH1A78Uy+W
	T3hh7l98aVVWpd/igx8RovZ9/koPiUarpBBVXz8kf7Fat3DjkisqMzB+Bli5Aieb2FdRHpk
	vUEF0wnBpYy41R/I+W/Q75BxLr+YSP75VSAQOXxhvnwMuPoHScS2j/TsOFPvUAh6bYBYQWT
	4pS4TkdwgMKeqFWOeWtZHO4H7svc9XKk3Qjch+69l47hmLEjU/bJIud+kPmy4/KT8gG64Nc
	pjGE9pTx0JMDjosQD7Ld/1cqWBDDNDRT9pwd9WNd28Ft0gLSVmWqiCj9P2aZNYzVRG6VRcJ
	Z5ro8lm1K5TEI4KvDdFow3q1crnUSS/ZxVNsKNr0r6CYKWZej17yJaoXHd0UsQ+56P6ERMP
	iFIuOMMls9oV+XDeOESVp7ktYqMB8b96D6aSCfjsMW3Ou1fxPwjlTRiVm74BP9MmtPVix1c
	abiyCt9zQ7AO51CnJNrQRKVnxh2amb2u6zQKA3dV4ry4GPBqDEtUz7A7sXalcbrxNVOOU1Z
	WLG8rw/MMlx293ZyAjT7FLETz+92lYE3QYBe0Wg9GFGt0RW7G8tcDXg+2OhplbmFuR4bKxz
	bYdPFze1x93EQYWe31Wti7KhUdpEYNM0bXK50XADZ3ozqF+yWpE5aCaGLEi2Uk5ZquXmOaq
	3RLOMlVePb6RtoTklkpQhTZ1Itd/uWNCt+jBGovgAp1Igtlm8dPIpWnR32wafN0itBdr6xJ
	J6D3IU3SIpmAxPd7YHPNPX52U4Ltg0zarhwuMIexoGURv+xI/JoK0Rr42ALWVjK4Zg64=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

On 9/15/2025 1:39 AM, Krzysztof Kozlowski wrote:
> On 14/09/2025 17:57, Xilin Wu wrote:
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
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> I see huge diff, like 200-300 lines being changed against v1 and you
> claim that I reviewed this one?
> 
> No, that's not true. Please read submitting patches - if you change
> significantly the patch, you must drop the tag and explain the reason.
> 
> NAK, unreviewed.
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof,

Thanks for your detailed review and clear feedback. My apologies for 
misusing the Reviewed-by tag on a modified patch and for incorrectly 
declaring dependencies in the DTS patches. I will address the issues in 
the next series.

Thanks again for your guidance.

-- 
Best regards,
Xilin Wu <sophon@radxa.com>

