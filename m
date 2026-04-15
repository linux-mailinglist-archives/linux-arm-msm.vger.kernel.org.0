Return-Path: <linux-arm-msm+bounces-103272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UK9QD5li32mKSQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 12:04:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5A14031A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 12:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 096743021D36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 10:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45FAC332918;
	Wed, 15 Apr 2026 10:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="jxmAWKgU";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="4PcGopkm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D123290D9;
	Wed, 15 Apr 2026 10:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776247441; cv=none; b=qGrD6F2kixg2+l8yJM5O31eYH4XowWb6Fuwf+MwPgGygVrwUYfQVhgHoMXp1L02d1nyPE0wILGOAC4ir8+Nm949+ocAeyI4LKB2m8dnP4F1faLF9hKmPbpvcSdRFoQxDJH/0MyolpkH+xv4Sd8/MU+AWCFUE7zmqo2ntZo/W5ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776247441; c=relaxed/simple;
	bh=5yBTBGWlx6WJxLclL2VvWQ69gFKuMVjrjutE062FuGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NTrtGm9Wf05QaGTlWqap+zJPrxsKeep/8ojFJoPHdo2zTwqutbQUxt2PTyOPC124VukK4ULYaNgMOrCT2kyec6YrDVxbzTX/MWuwhmG1xrW+ZqY5r0BfC90DoXFTeSjSV0nFOBdlITiGAWBPowQANwhX90sycUYEsJ/zt4QuDyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=jxmAWKgU; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=4PcGopkm; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1776247435; bh=AWQZd7lMzwoEiIi2phJxA3k
	aflwasMW5lqDeJ5guP6g=; b=jxmAWKgU7o8UjN7kiHE5n1Fwl4QkudrHzS/2AOCYv3dqIAhghk
	fX0bprqbHsatIYQ/Gp1Y8jbBVmFaT18GPGHn8mnLHywN5PKikgoNY2yUKOcd+J3PfEM5i6QRmu+
	ZMynZJAexiOUaiAxbPqQg+7Ry0SFq5rHuYHcf+YGrK1mV9TEH1anHNUSpvFAiM9Jtt8hj4rKQN8
	qfnRlGcdjUimG/XsO3zBhLiE5edmBy0J3qyEISZL8cyEKfcwf42nu3POLLiz2fyCda2izoYuZjX
	vOo3wAwpR+7v3jy/HAnecPLxR67Lv79fnTPV5rY23H7PQi3mdMBDA4/RAflE5fRtp/A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1776247435; bh=AWQZd7lMzwoEiIi2phJxA3k
	aflwasMW5lqDeJ5guP6g=; b=4PcGopkmv3G2f8w3VvxC54UVJFEuhhSxIXhPdobCRphoT6i3SZ
	cTZ8voujRwfccvMl2RNdA84mp2N0VM7UV6Bw==;
Message-ID: <479f6176-8f72-48f6-9401-b5e0b81d668d@mainlining.org>
Date: Wed, 15 Apr 2026 13:03:54 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
 <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-3-03b475b29554@mainlining.org>
 <70d4dbe7-0e5b-4065-858e-b5a57bbf45e3@oss.qualcomm.com>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <70d4dbe7-0e5b-4065-858e-b5a57bbf45e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103272-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mainlining.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[setotau@mainlining.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:email,mainlining.org:dkim,mainlining.org:mid,f6000000:email,f6800000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,9f800000:email]
X-Rspamd-Queue-Id: AE5A14031A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


15.04.2026 12:52, Konrad Dybcio wrote:
> On 4/15/26 11:40 AM, Nickolay Goppen wrote:
>> Downstream [1] this region is marked as shared and reusable so
>> describe it that way.
>>
>> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448
>>
>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>> ---
> +Ekansh some insight, please?
>
> We're giving away that memory via qcom_scm_assign_mem() anyway
> and I would assume that making it not-"no-map" could introduce issues
> when the OS tries to access that region

I've made it as sdm845 done [1].

[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/sdm845.dtsi#n893

> Konrad
>
>
>>   arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>> index 4b47efdb57b2..13094b5e9339 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>> @@ -495,8 +495,9 @@ venus_region: venus@9f800000 {
>>   		};
>>   
>>   		adsp_mem: adsp-region@f6000000 {
>> +			compatible = "shared-dma-pool";
>>   			reg = <0x0 0xf6000000 0x0 0x800000>;
>> -			no-map;
>> +			reusable;
>>   		};
>>   
>>   		qseecom_mem: qseecom-region@f6800000 {
>>
-- 
Best regards,
Nickolay


