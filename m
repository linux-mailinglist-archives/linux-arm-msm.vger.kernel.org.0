Return-Path: <linux-arm-msm+bounces-108620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KP9SCBBBDWprvAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 07:05:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 713D9587AFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 07:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54185303A8D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 05:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD97234041E;
	Wed, 20 May 2026 05:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AGxCSdId";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fBT6J5w8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B378C33B6C9
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 05:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779253473; cv=none; b=Ehj8TUTwOcNUY2+vI5HSb5a0Ok/ppMQ462dw91H3aY29MKyrCv31+6hBWp0G3Z1Vx9gOhsOP09ldBD+RrsUf+OGMHKWKDNYIiUvCVRqV8XRIwiWY+bF8Qd2RExgL23U5fZtz6du73QiL/qPW5VWLyz7TG58ajFr81V5WrLK5JOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779253473; c=relaxed/simple;
	bh=GBw4sTQ51qv3RHbSz6bJbjqhdBcQ63A9uBz66nhSXZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eTbMyHPLhLxhR3d5ElN0t4SJDzQkxIl80NpCGRoZRBK9SvkizLJm8F1WwfCI779gWStv6oCgCZGdcjv84Y3+8C1YAXPyeDuFUwoLnaCgIUfHJF3y1lXLJhOCTY1LP7ow22PMEwnfpaKzVVUeQgnSNf9MSKuOeJjsaWDXFSF4s5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AGxCSdId; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fBT6J5w8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JM0O7B1725401
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 05:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OmSQknuukmFtpHIF3IEi2WKgAfnolG31trNYBiHuO94=; b=AGxCSdIdhznPmytD
	r5V/e9lDrCuH3/0gRJtb8HQ1SX6d/D4TTxqd452zKW/4bVNVhKdIOtWoTy7rkUtz
	oaHp51iBf5NigPanwjK9HgCS1hdYtLEI9UqckFlx/NNqSrCGnFInTO6ibecveqO8
	by2G3adovXR4GpPtgBxlOAlBCIQNRTTOrWK0Kr1FrGr4Hr+cmXpnt1mDNd8jfAm5
	qThdm3DxJPNVxI8uZV/X+ZlYS64CfDduc/Cps0PSv3bvVO6u9PrbDFSLQbHgcsvV
	ei7VuDKkJjQP7E0DGy/2l/GoktWqN2/s+cHPdy68a/MxslOAhMj3ikC6biXtdyQQ
	sv3Q7w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qk1au-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 05:04:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba0c548e6aso8866025ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 22:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779253470; x=1779858270; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OmSQknuukmFtpHIF3IEi2WKgAfnolG31trNYBiHuO94=;
        b=fBT6J5w8af8boljQ5ifhwwhAbnTAWqATRGdNUqLM8Y9FhLKSdleIFHBnFIB/FWD/Vo
         +go76bZLayzU4nR3N0md5WCf08Wdm0dYRISSGbcwkj52Kr/2yDvLoyNUdOcMdnepgMnk
         HLzNC+MGVRRnTt3DV2dJPYhYNFH8aZOjdGUsTEUMfporaS6LuCUGeCWi285UaeI5EpSk
         5ZRiD+bDmdwjFa+Ftmxt8H3t1glbX7geBQiQG60rpcughej9yjyHgKSyBwR9AV7vrnB9
         i5qqQkgCHt9KOlH6ooADj46+haK3OvYiKtQPiRiMrr+tIYjugBd33+mogn65miNAKipr
         REEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779253470; x=1779858270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OmSQknuukmFtpHIF3IEi2WKgAfnolG31trNYBiHuO94=;
        b=VBsZMgTe8TDRJk+g+jLCxH47KC/mgwkgOPKs9cerXNWs262FOQM15JAQQK0hft5KNL
         CtdNaS2hnGVhKELg8ZPw/yU3aNcFti7re4ZevaoPnjB992+IWwW9u7rkjhCR+vvVZMab
         rBtvjIa+Sm08Z5itCHyWAr9QNqvfx7TgSKnAYUOIB8hYDyyZtgtWZjVP8yQcCZ3NylLr
         f11+l4YPMZYo21wRnHRWIMAjs56OEZ2klNEBnfwnHxvUtB5OnvWFA8GmXKSFGOk9E+w9
         olfDYSsGUNAneIonPbNBUP6s//xbCZ5YJ1SiNh37Au8E2drG4TL2xy3gNdkgXAjd1Qop
         auDA==
X-Gm-Message-State: AOJu0YwASUW9mVmB6rCUWqEdNg3RjmWkniHh/UIXKd/RZhI+RBDBYQ47
	8jZYD7nzAsDsbb9L691wsNdIPvE/wQO6SbcGrR61J0GkmfvwsSIJDG+j9gX1UiCOxXzvikr/7Ge
	R8ICRMdB6QEMkHRuTV1jOBq5FoVufaBjfv5LYA75wKl96xa+J4WtZgbGpooYa9T2jzN0r
X-Gm-Gg: Acq92OEn42f7bjJe1D+8IM3wGrFyvX9LLMWPjpbuPA6176Hr81/EnFFYZ5nBNMOPyUj
	xmdL9D7JrjDF2aqfCPSgEjCJ4dywqRnmCCgSF3TqlwAIORUH0NT5YzlkFv3i+FGsg0rWfPf3dGV
	k5uvfHZ9SR39SXY210TXsqjhvY5KnJWMxDftCMqluzVmqoaPi0JnMo8AO/XaFuD0baO+kxl7+4i
	v4ma/fZDzJ0ppEzRAiiy9kG0Ep5uSRscBiqCYgUXyc0+V9M5WU+iaTR913gQMUe+psf+SFuEjgM
	qJtVGenjnA0UpHGtMOpVGDHGCF45fVhAGN/iWCeMdaLK6MfnjgesVNX59RmVWJx7wldihsazXoJ
	AHcfZCnYCl09QdPbHJwLEMUR7s3r2FTxLD3OZcxitOfuWqF03vdmePCeoQVyR12cUJBf7FxXFQR
	H7F8C2HA==
X-Received: by 2002:a17:903:3c6e:b0:2bc:cb8f:c286 with SMTP id d9443c01a7336-2bd7e8cfe0cmr139206275ad.7.1779253470278;
        Tue, 19 May 2026 22:04:30 -0700 (PDT)
X-Received: by 2002:a17:903:3c6e:b0:2bc:cb8f:c286 with SMTP id d9443c01a7336-2bd7e8cfe0cmr139206045ad.7.1779253469796;
        Tue, 19 May 2026 22:04:29 -0700 (PDT)
Received: from ?IPV6:2406:b400:b5:60e5:312a:8741:b738:744? ([2406:b400:b5:60e5:312a:8741:b738:744])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f287sm270216785ad.24.2026.05.19.22.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 22:04:29 -0700 (PDT)
Message-ID: <55470717-3e9e-4548-b12a-8e2a2e1f6c63@oss.qualcomm.com>
Date: Wed, 20 May 2026 10:34:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: dts: qcom: monaco: add AEST error nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
 <20260505-aest-devicetree-support-v1-8-d5d6ffacf0a5@oss.qualcomm.com>
 <71eee892-1c0b-49e7-a82d-9016c56e8592@oss.qualcomm.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <71eee892-1c0b-49e7-a82d-9016c56e8592@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA0NiBTYWx0ZWRfX9Yy/ikRdL+Nv
 pFvJH0ltYtWWWrznhDbXokij60d6zbdWTdXWPejcgrftgBn3YOW8jKFCWib2w7MFievEnrYKV3M
 ZTMx9g1zjZCKLixgGs2kQ0E/UJzO8ASpEHnS2uDPQ6OAh7+ATPcuO02fP7VRmdvHPRjwQ3Yu7n/
 10yybYw/AiWGy8h6OgtkxHIhCD3xRukvSOu0/9B4/x2+j3vuJ/KEJaGljzUj38IZRPrcVkMQnqt
 RUt9vndY/ZcIyc5tD3stulbtqXlvB8uOQS0tmYg4hwsDi27pAsrj7Ge7vFX9q2XFjmAncgO6DwN
 /2tmpQpc6Rh9BSnsuKNl47oQaherNEpgBI1h0pKNONalCWDKjeJQQ9WyYC9XL0WqT7dfapYraTg
 AIC8dRnBKb/acNuqU8njmDLyV+iyC0tzWgIRtzrlGL40x70yiX9c9r0o4lz5DeSrn7HPJ0q84LZ
 HH/iQZZ3B19J+mWurNQ==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0d40de cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=8C-fUGBXRnHmYMWNGq8A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: jYTEcBEHDCWxbJEr_KmtSRRaZohD1U1C
X-Proofpoint-ORIG-GUID: jYTEcBEHDCWxbJEr_KmtSRRaZohD1U1C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200046
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108620-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 713D9587AFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/12/2026 4:58 PM, Konrad Dybcio wrote:
> On 5/5/26 2:23 PM, Umang Chheda wrote:
>> Add AEST RAS error source nodes for the Monaco SoC.
>>
>> The DT describes a processor error source covering all CPU cores and a
>> shared L3 cache error source for the cluster. These nodes model the
>> hardware error reporting blocks and associated interrupts as required
>> by the Arm AEST specification.
>>
>> Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
>> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/monaco.dtsi | 41 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 41 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> index 7b1d57460f1e..8e43ceed7d84 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> @@ -3,6 +3,7 @@
>>   * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>   */
>>  
>> +#include <dt-bindings/arm/aest.h>
>>  #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
>>  #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
>>  #include <dt-bindings/clock/qcom,rpmh.h>
>> @@ -29,6 +30,46 @@ / {
>>  	#address-cells = <2>;
>>  	#size-cells = <2>;
>>  
>> +	aest {
>> +		compatible = "arm,aest";
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
> 
> These 3 properties aren't necessary if none of the subnodes have a
> 'reg' property
Ack

> 
> Konrad

Thanks,
Umang

