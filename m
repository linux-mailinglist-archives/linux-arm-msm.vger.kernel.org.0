Return-Path: <linux-arm-msm+bounces-110255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFLHL7F0GWogwwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 13:12:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CEE601630
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 13:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26D07304E317
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 11:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 422DC3B8127;
	Fri, 29 May 2026 11:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WIL3Gdzx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A17333067C;
	Fri, 29 May 2026 11:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780053030; cv=none; b=ZlCFzUOjOjmr32V1uyDDSJFgfpflq91S4e7EyvlhpoCQ+6zLrDr2IBKgV5Gs8kpLucrWQ7dMk8ay2jOiu7IilKYVy361XIRIsMuNEAkECYUcUUco5s/UQX8RprmnTH4F6bLFpHKTTUahjfLL4zjyQK/66e5KHlb0pRkizJWhc2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780053030; c=relaxed/simple;
	bh=ANtpuVqE9Cwp87X1vN7zPmC9cfnxtdTbe9wBuu1OjwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r8AAh6WBoOAh10J4ECtuUVcyQXSLWpbEqW6yQHvcFh2rI2r9YasR+pzSjNp2+k8S9sGiuv97OnsVmnxhzUlv5kQ1yEqp1Nm5j152n1TzhWmfAb1RoAALimEEo74BHBoLBkra+d40UK3Y5XrWFYY77qYJOZB1YrWAOWA+8/p9mQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WIL3Gdzx; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 797CB2247;
	Fri, 29 May 2026 04:10:22 -0700 (PDT)
Received: from [10.57.24.26] (unknown [10.57.24.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49F6B3F905;
	Fri, 29 May 2026 04:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780053027; bh=ANtpuVqE9Cwp87X1vN7zPmC9cfnxtdTbe9wBuu1OjwY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WIL3GdzxBxmJSnUDNqMsnouS28X6VxiafbOsL1XT/1nMLBXyH4p5s/tjvjFCKjPti
	 145U2ZMaKHi33IcJARgrRtXXnkgdfsFigQxuAPsCDW7lm4zMC9EfCNyPpqAIaSIk5/
	 Fi/pXCCD64ZanA55UaMsCGT6fzrmxnEwGiYUC0VA=
Message-ID: <6b7294a1-8c13-42aa-9f64-5b5c9af0b41f@arm.com>
Date: Fri, 29 May 2026 12:10:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Enable CTCU and ETR devices for multiple QCOM
 platforms
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
 <545b4ebb-2c7e-480d-80bb-5e08dd3c52a7@arm.com>
 <f2f23d0a-dc24-4a06-948d-56df913994ba@oss.qualcomm.com>
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <f2f23d0a-dc24-4a06-948d-56df913994ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110255-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suzuki.poulose@arm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 22CEE601630
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 29/05/2026 11:26, Jie Gan wrote:
> 
> 
> On 2/27/2026 6:10 PM, Suzuki K Poulose wrote:
>> Hello,
>>
>>
>> On 04/02/2026 02:22, Jie Gan wrote:
>>> The DT‑binding patch adds platform‑specific compatibles for the
>>> CTCU device, and the following Qualcomm platforms are included:
>>> Kaanapali
>>> Pakala(sm8750)
>>> Hamoa(x1e80100)
>>> Glymur
>>
>> Given this is predominantly DTS changes, and there is very low chances
>> of a conflict with the binding yaml change, I would recommend this to go
>> via soc or the qcom platform tree.
>>
>> For the series:
>>
>> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Hi Suzuki,
> 
> May I ask is there a chance this patch series could go through the 
> CoreSight tree?

Like I said, it is mostly Qcom platform changes. So, I would leave it to
the appropriate channel

Suzuki


> 
> Thanks a lot.
> Jie
> 
>>
>>
>>>
>>> Since the base Coresight DT patches for the Kaanapali and Glymur
>>> platforms have not yet been applied, I created DT patches only
>>> for the Pakala and Hamoa platforms. I will submit the Kaanapali
>>> and Glymur patches once their corresponding base Coresight DT patches
>>> are merged.
>>>
>>> The Hamoa‑related patches were posted in a separate email, and I
>>> have included them in the current patch series.
>>>
>>> Link to the previous Hamoa patch series:
>>> https://lore.kernel.org/all/20251106-enable-etr-and-ctcu-for-hamoa- 
>>> v2-0-cdb3a18753aa@oss.qualcomm.com/
>>>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>> Changes in v3:
>>> - change back to the numeric compatible from hamoa to x1e80100.
>>> - Link to v2: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr- 
>>> v2-0-aacc7bd7eccb@oss.qualcomm.com
>>>
>>> Changes in v2:
>>> - change back to the numeric compatible from pakala to sm8750.
>>> - Link to v1: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr- 
>>> v1-0-a5371a2ec2b8@oss.qualcomm.com
>>>
>>> ---
>>> Jie Gan (3):
>>>        dt-binding: document QCOM platforms for CTCU device
>>>        arm64: dts: qcom: hamoa: enable ETR and CTCU devices
>>>        arm64: dts: qcom: sm8750: enable ETR and CTCU devices
>>>
>>>   .../bindings/arm/qcom,coresight-ctcu.yaml          |   4 +
>>>   arch/arm64/boot/dts/qcom/hamoa.dtsi                | 160 ++++++++++ 
>>> + +++++++-
>>>   arch/arm64/boot/dts/qcom/sm8750.dtsi               | 177 ++++++++++ 
>>> + ++++++++++
>>>   3 files changed, 340 insertions(+), 1 deletion(-)
>>> ---
>>> base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
>>> change-id: 20260203-enable-ctcu-and-etr-31f9e9d1088d
>>>
>>> Best regards,
>>
> 


