Return-Path: <linux-arm-msm+bounces-80110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E9823C2C019
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 14:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B1B2A4F0C5C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 13:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88B530E852;
	Mon,  3 Nov 2025 13:04:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422E820FAAB;
	Mon,  3 Nov 2025 13:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762175078; cv=none; b=ZOv4fWkD/pQGXEqNsLXGxkTdpAwKLfTNq10GxAJXeVu3gE0lIglEN269LP7Jar5kwI+IpUWnqd1omVEbpbvCBjgg7aoclfDJvolTCRp+FbKa7GseXMWW2o4LOpsZrC7ArbDtslr2OKW0ibOXV0lZlkaFxcoeOrpZKz/6YL08KtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762175078; c=relaxed/simple;
	bh=U7VXK26M3CFidPtxyRUTxL+HYeVuaMlnUnS7womQ2GY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QKkyznaPDJsdr2pWpI31XITzbZ4ENN+6EGaxCeP0JnRJzV+NDIVxuWwiGi8fzvZXw70KIpWaWJjWHBpZhQJeEVyP1gY20G7c8vKQqgPfe2U5PH5oXtKSTxK8I6NWtrdNVYjARc0h/07OQCZENf7rL8S/Ri9s86ikKqYow1NW0dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip4t1762175061t40720ad0
X-QQ-Originating-IP: zd9Ko0ji1GTrANJeO0DRJSujnJNJp4OF3RAcLpp0rC4=
Received: from [127.0.0.1] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Nov 2025 21:04:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8018792282653507215
Message-ID: <C33391CA9466C163+e15aef57-454f-4c83-abed-542e62890087@radxa.com>
Date: Mon, 3 Nov 2025 21:04:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v2 3/5] arm64: dts: qcom: qcs6490-radxa-dragon-q6a:
 Enable all available QUP SEs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
 Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
References: <20250914-radxa-dragon-q6a-v2-0-045f7e92b3bb@radxa.com>
 <20250914-radxa-dragon-q6a-v2-3-045f7e92b3bb@radxa.com>
 <1d4ac08e-ccfe-4b6a-8f77-e97836171310@oss.qualcomm.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <1d4ac08e-ccfe-4b6a-8f77-e97836171310@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MJ1My1DaufChbd1n7x0s55dxn1gGaQJXcOTma4k04W1O0l1GP4+NRx4E
	IP+8bmLHSy5TA8nwT1TGeo9fHUupvjA1vWdJ2zPdZh9sgJkd6GWrDbF+JyHa8FhgllWstNF
	Ghl7S1oZKAdrmHRj1MtbxuPk+SXPnQ5d7dMRqKYwbn7B3uvfLIxJeMSYtyHksKjjrOZer+d
	VRK1ltBs3MEmzVJ7+QU48rrh/7HKQmK3V/aatCF2rn6n9xbODA9PRXC38CC7UgI1FW/hq4U
	XIfrA1TI31wjli/c/zrd0tjdrjaf1jN0Wg/3BkIA/h866Rkr0R6FwF16w3QvKH+M7qgQXry
	h6YOIBCWBaeJeDSgm1kIeO5RAAj9an65OV9748ICJuTR32c0dtT34U6MAd2LsnD0hNp80iC
	FhxD70pvOdJnyGngHhckgv3Jve+TjYk/1PnXP5fghxiNgWstYgtXIdqKcsey5C4oFFytMuu
	Y6KZgEj4q5nK7toOqYLVJ/22TtEyRgWA5BTftjyBs8C7P+K/gozrzhfuMw78/fgTZ3sdHiJ
	b+hfo6BpxnvxkcYRfCCrU8LV2rIy0iceqFBL5yP1iaZ0Nbm6904uQserGY7ADDkmQWgnFN5
	YIqaHR/MSkBqxY2u4fMW/wz+xmOdOQY8ICe/Hbl1oQTqqh0466a0qbh7zgEvJqPwWhYQp8T
	KTM3vhNtYLJhjC9mtxRWtWveUrKmYY0yanwC8vwywn2wBAAqjvmO9SvZy2G8Az59J4QKmkh
	8lHTYgkJlPMrlJ6JzTNoq3Cyc232q4H3pg9U2wrFqhZe3mBFeYpqLpXlGkSUIbb1hQUZI2u
	zd0l8sVewbSX5lM75HsJTlHSFvXq/66Kzz8+pP4o4Hs5jc5feW4qIj+XW1bW7kQhG9o1Q5d
	bXR1OkUHebquojvFFc6X5KAeoORifpOQucAID5bNFaeH9yRiYHWOyBee58yAH6bY4Oz6l+d
	AWxPFDhaXzGn59+FvVSKYV8Us9SMHm1x0ppbZk8Clrm3eWTxxhHC2dS29MRtAnIyCqF6DZB
	cKfcpxEH9ykqrlp6E0uFLuq56LP6TeHKt2dsHSSw8ViZ9qGEMrozPlGaTGjZfOVH0zGJv/2
	Q==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

On 11/3/2025 8:57 PM, Konrad Dybcio wrote:
> On 9/14/25 5:57 PM, Xilin Wu wrote:
>> Add and enable all available QUP SEs on this board, allowing I2C, SPI and
>> UART functions from the 40-Pin GPIO header to work.
>>
>> Signed-off-by: Xilin Wu <sophon@radxa.com>
>>
>> ---
>>
>> This change depends on the following patch series:
>> https://lore.kernel.org/all/20250911043256.3523057-1-viken.dadhaniya@oss.qualcomm.com/
> 
> You should be good to go resending this change now

Thanks for the reminder. I added the QUP parts in v4 of my patch series, 
and it's already merged :)

https://lore.kernel.org/all/20250929-radxa-dragon-q6a-v5-2-aa96ffc352f8@radxa.com/


-- 
Best regards,
Xilin Wu <sophon@radxa.com>


