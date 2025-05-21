Return-Path: <linux-arm-msm+bounces-58927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 155F1ABF74A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 16:10:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BC454E7FBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 14:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589A519D897;
	Wed, 21 May 2025 14:09:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5754D19D06B;
	Wed, 21 May 2025 14:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836572; cv=none; b=mlqx/DTSPyBqj6B+9ZZyvvGByr9zXukrXklat2mnnQDujfgyEc6qzNOr5vVPKFnLzqhj2t+Qk/OOt+c6h7suY3Ndj9GDwiZW/l8RSZ+pJMYX+CEAn3CgJX4QFg0yqDt66m0yF6h2sye7eUhWKNoId5MCd6DyR9Dl8Cz3NU2ISmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836572; c=relaxed/simple;
	bh=NhjpZTkPhPhIrQ9k/incAERWtVY9D0LPB5ZiEn/hA6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pFI4p+jdVtjiduj5x96kJTqxddQyhS7xushcKNB5WsSaT9QiOsS30IZn/vFqLl5TLv79QBk/tRbFm+tX9veGQidv+oxOgx3pgC4+glAj0APFzx/ocXxySr+eAqk6Ui9dYLcuyji5QGHO1m4IV6Bn4IKlYkjz4tKeVsGOtfAeNjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpgz5t1747836536td19ba15c
X-QQ-Originating-IP: lMRuNaUER+yR3+yPL9cHT2Nx1jSAfpcXGKs3LlS4cbs=
Received: from [127.0.0.1] ( [116.237.87.141])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 21 May 2025 22:08:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8706304160307585850
Message-ID: <DAC123579553F487+1871efee-51e7-4049-8a15-9cf8bd286f03@radxa.com>
Date: Wed, 21 May 2025 22:08:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Mark FastRPC context banks as
 dma-coherent
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250416-sc7280-fastrpc-dma-v1-1-60ca91116b1e@radxa.com>
 <tqddtxx25bi6xb5jilpbgfccn7qz4qkonmstfbpz36rl3pnrwt@u4lv2tn46e5z>
From: Xilin Wu <sophon@radxa.com>
Content-Language: en-US
In-Reply-To: <tqddtxx25bi6xb5jilpbgfccn7qz4qkonmstfbpz36rl3pnrwt@u4lv2tn46e5z>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MhifFtfDPy2z3Tec2qFMgP3gAf8KrJL5QfqN44xshzrYMgpXoHWL8AhJ
	izKFZ/6jdshj0O8VcHhcFFo5OXwCsqsM97vPqAC3KE39zRXJVEt1ldew5TFNYdPBEZ3sdf6
	H8UK+ECpnmJmLhw6UI7JbZNTwn7lVrkCpGb6tTTVuvKnmrTjWX6cQjnjXi/eVUkDqsP8lz/
	6s67a/Jstloct3XGs+JFIrXczsSvu2N3wB/cs7Mo0+eFDXB+YU4Akfg9CfTna45QnJW4HVI
	g/KdoEfBfGkr/hIN+jxlFPPvlixkfdiERCE+zQKaPY/5MhSfYrQnN32cfTACdCWELkz6aHS
	/WiCAmwXHmjtFY6yENugls+IpLFR0QUybEhffiEiWwgrkFWP8ndDRAc94xJCilJiBeGJTBx
	i+3PtPkXqAOJ5ZuRylaGK1ijsQIh3gytWibRo7FgN8kJ/djVH6XPSNn1CqsoQuew2Or/tAE
	HHHOpsAvmTKd8B7vTkqtfRTWdcmYUxWz9V27efTZ7zg2P+c6+YdE8gqPXHoI9SwY/rPVTJk
	uOfM1lvazn0qC7pD8JMb7n7W+nFwNxuyiZV3dprFDNqFIfg+kVge7sW8n8rW82/rM0/5/zc
	czoC3tH8tx5bJREsMN9ahE+gEiPvrU+/cmfkDrLtJmLJb29idk8WxZf8w7BH1kNmK98p+TY
	i1zt2xttg7fLlFGCej7eGlXCg4oO0zgwhH60uIDnfUuPUeXU/Icxjtb1knyo08MBn49xr/Z
	E06JoFG1rv5viRG3QZV7Nz/HuHz8e79Ir91RdcdxEpvkEYWBfrOWHe9g6S4yV3A49H7bq/Z
	gHFzCPuUnEFkvdgxjX+XAITjiOCT9wNqTLYmYXw/GZiqeO89uCWyZNOI3zCr5s1eZsLBHjk
	kcyvW20O/UyeCOjm2/odTXSD9v7hFOF04S/QSujK5xYFqejN+dJ/OD+lGA4BqPU6AHnU9Er
	fu9TGF2D3XGHUdR2X4uQw+zB4kkL3hGFOU5yvzBMmbw3xtQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

On 2025/5/21 05:34:08, Dmitry Baryshkov wrote:
> On Wed, Apr 16, 2025 at 06:54:18PM +0800, Xilin Wu wrote:
>> The FastRPC context banks are DMA-coherent on sc7280 platform. Mark them
>> as such.
>>
>> This allows LLM inferencing on the CDSP using Qualcomm AI Engine Direct
>> SDK on the qcs6490 platform.
>>
>> Signed-off-by: Xilin Wu <sophon@radxa.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
> 
> Are context banks coherent on FP5? On Herobrine? Or Nothing Phone?
> 

Hi,

This was tested on an upcoming SBC (Radxa Dragon Q6A) with the Qualcomm 
Linux cdsp firmware. There would be an error in the LLM demo app without 
this patch.

I'm honestly not sure about the devices that you mentioned, since I 
don't have any other sc7280 devices to test.

-- 
Best regards,
Xilin Wu <sophon@radxa.com>

