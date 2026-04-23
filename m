Return-Path: <linux-arm-msm+bounces-104330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMFULJMa6mkOuQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 15:11:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E342E4528A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 15:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D5A130479E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD783EE1F4;
	Thu, 23 Apr 2026 13:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="jLKXiqOD";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="R2PoBgNa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9082FE071;
	Thu, 23 Apr 2026 13:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776949570; cv=none; b=fD1e+U+adrMbtKiM4milxLxoV4wQFaBDBlXF+6M8KZzZW5XbwvxcYKSVeXtwaZ16Fli826fXHsLAAzWpWBYlcJvdymQ4y9zwA5+tn/f9B+8UUOl9ippRmujZlUoSjt8lh3AQWUEHrCIsrJ2+JTSTEL293Z/0o7ZWO6h+NJYBPmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776949570; c=relaxed/simple;
	bh=6O1QhDRdNSv/8Lj+UiyrHd6j66gKV0k/s7RGYRHUDTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bi4TWeR8uZ+eqqE9q8oNpuUjtibAkLGjaI1wquNKHJUk13AR0cV/3+GR68t9dPJkZdyMJ/HsW/J6q6utUJ6p1urX5wmRdKbu2tlFUvgiQ1fMeoxbXZBRVJNxX/sZa2IpUbUL+fyxnQkaBDjxoN0fgbUqwCwR2nn1ogZjPa5VmHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=jLKXiqOD; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=R2PoBgNa; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1776949566; bh=V1xXEa9KDJDSLsq8yDjfvJj
	Yo2udvILuK83Qq2MmLwQ=; b=jLKXiqODskiqJ4jUtIU7wFqnKlSmamKdf2G6JjKF7P6UXlB2jf
	cvb/BRjKJW+RJhJo+BijAFfogNwToyjZDZC2quJSGoxkIhjmFlP6foECFsTugQ7a1PDAizLnRUi
	n++ZoBLFv2I4wmnt8cuGYAvDoqO5SV8rjb476jCzmXPwiJFDcD+716v5+hD0nWeSeoVzeERIIUU
	T28q+SC2px+RDVZqFEQi4sO+EjIced4+lzA5EgKwJLhDan+XV7elhjkdsxY+0a+gEWTAqcVAJ6A
	CLhHTxXX8m1J0gNTMqCWeGuPwowFavqm4RULeJ1TnhoROgm3Z34SwQZ059hB7w7UK4Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1776949566; bh=V1xXEa9KDJDSLsq8yDjfvJj
	Yo2udvILuK83Qq2MmLwQ=; b=R2PoBgNa9KcsMWxaRLujVDMCt9okkQAbCfvErQWAFvb2+SHWxd
	yhgVdl2s2tQrYWklYD9g0ClpDtGioCAymqDg==;
Message-ID: <e0c2c127-9f27-4d8e-802f-bdf1acfa960c@mainlining.org>
Date: Thu, 23 Apr 2026 16:06:05 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sdm630: assign adsp_mem region
 to ADSP FastRPC node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-4-274ba3715db0@mainlining.org>
 <0d411167-caad-4f6e-b52b-de7caeaf2333@oss.qualcomm.com>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <0d411167-caad-4f6e-b52b-de7caeaf2333@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104330-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[setotau@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:email,mainlining.org:dkim,mainlining.org:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: E342E4528A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


23.04.2026 14:05, Konrad Dybcio пишет:
> On 4/22/26 5:39 PM, Nickolay Goppen wrote:
>> Downstream [1] ADSP FastRPC node has the adsp_mem region assigned, so
>> assign it to the ADSP FastRPC node.
>>
>> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1693
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>> index 36b419dea153..af2bc29ccdad 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>> @@ -2458,6 +2458,9 @@ fastrpc {
>>   					compatible = "qcom,fastrpc";
>>   					qcom,glink-channels = "fastrpcglink-apps-dsp";
>>   					label = "adsp";
>> +					memory-region = <&adsp_mem>;
>> +					qcom,vmids = <QCOM_SCM_VMID_LPASS
>> +						      QCOM_SCM_VMID_ADSP_HEAP>;
> Please double-check that, the VMID used to be different on
> older SoCs
Do you know how to check that?
>
> Konrad

-- 
Best regards,
Nickolay


