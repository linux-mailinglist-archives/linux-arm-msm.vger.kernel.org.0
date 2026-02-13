Return-Path: <linux-arm-msm+bounces-92775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIAmFmgRj2nAHgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 12:56:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D07135E26
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 12:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77B97303C506
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 11:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E7C358D2C;
	Fri, 13 Feb 2026 11:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1ctEyYB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H6VtfIqH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D9D35D602
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 11:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770983780; cv=none; b=oyGnerAAOSuESLaOMrOBAStYs/O/rn/5Bjof5AiLNtQ4OZMFytssUe06oqE/bXoxSZl857WEH7VsTx9LreTaSzc5Yj4pZxNbrW6mZ94cnMca4Ah+uCJ8+X4MCKjM9MujgNbBI/xdaY/oHgjzUFGt66I2KQmhK26VlvnX9/xPrdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770983780; c=relaxed/simple;
	bh=Qf09cyzNftZFPMVLBU+uctujGDODkYY0pIFa+fPXXhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mixuj1cPC6wtn1OgKwhbpPvG7nfub14Z07ZSEgzoei2xEKjRqC9CXtH4T5Ebbr7c6RjLc07/CNTB+rjK5PnLxloC0x59+WYpN5YvbIhQJLcCUfPMsGLyS4LZvRke76VRtl9+TbtjSF5JA8Ot4MPo/vbudsj5HR/KaZZuvQBVzGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1ctEyYB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H6VtfIqH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D7Zpup652733
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 11:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yl1lkFZl9wuYREqqBtZV8Q7h+eZLlSgHrU4R6n9gPjY=; b=J1ctEyYBueCOjTEy
	2saiddyi85RMIVQcgKCkGKHNYRqTSs0ltthu9/c8C09gndfk5WhAUdUt6azrR5D1
	EYy4q1Fi93wa1o0D/HX0Vm4w6Vkzp8+lsjLwVIcp283FJYndztijp1ewdmjsdG8Z
	yKn0AqLcTP74q6/KGggZdYUKbLAEt6fssKIQEmlkYhIkgQWaYKvY/j8eq47pVbuw
	JsG/6naCSH81VBelzZTzTNPtV6dz3bBdJQ0919q1Zax7YunFEl72SjxJtwcUhgPC
	I0Yt9gmObMv9PYret9XRK5AL1R23mKGB+Y/d7SfOxUTr77LEUIfy/Ahz1p4mP4BA
	8eY73w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9gbbm93b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 11:56:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35626b11c51so753066a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 03:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770983777; x=1771588577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yl1lkFZl9wuYREqqBtZV8Q7h+eZLlSgHrU4R6n9gPjY=;
        b=H6VtfIqHp/MOZ0dHiTTUKMWsJd4JX1J9f4Eo2YdphGamo3w8r7bGjZsYpHpXnDNsNH
         beH+YlLKsJMrpjKvVgdl+SrHeeeaiN0CkHBzHlwGQMl62FV9fsmbGZ6xxWhPw0MV/4IP
         dVjszx2og7UDvlYrtowjzGiN8vWrSZdgFTXsDZpkhn+nEC/W9iS8QEh6l3IPGPUeecVC
         UfnQK6MxQPvdrOviv3ZW0Z4SNk/n46zQWWZR+OBBQo+9lW9WOTR1GV63CF7VsoDE5JXK
         hdM6GE9TNtgvvkh2fmEhbNkvUXfE8WjSdZbsxMmGYeOEvEFSq2L3sk6/CavF/lbdcXRG
         GHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770983777; x=1771588577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yl1lkFZl9wuYREqqBtZV8Q7h+eZLlSgHrU4R6n9gPjY=;
        b=V03zAQW7RPfbvPVgdNZHuluX1+xeGdm0ciATZUfMueWcLKvVXL4T9WAmxFopLt49tr
         aHvZBqFLdKw4M+oxCHG4xJskHyMliUgvhTaNcrKgL3aauTW7FUZuNUT83X9vn9LPE2J5
         T18Ck+N5F8Dxi15vJFLLDEp2o0GTPE7PxHSfwHw3/9U8fUaLjhq3sr0w0KF9+OpJCWLg
         gQ/N3ibnb9hpqWHO+sWic866XB/edyEMBBJ+FPf+Bg2rAfWLhgYQ7dZ0G8JNzBXFgmMY
         5OjoFU6mfPkbORss8/ZY9/esMH7rDE6ETNzFrrtStkyrXo5b4qWx43tlgojs/5G5g4j/
         rRtw==
X-Forwarded-Encrypted: i=1; AJvYcCWw1y/GBALKwaURzvBvpBeBNW2brT4nDZbZuu0dQcUJd6O1VOAi1fla6XM3qy9k6GPH+VhykRO6XJfc6/lL@vger.kernel.org
X-Gm-Message-State: AOJu0YxW2FJzhhwSayLOt7OggAMOWrsexVCmRFMy8JjdwzxASxITzagB
	aYVEyBkago72mX4AsGw1I3PwJnWiFd3zR6jniYqFlDKcpsAlhYtjWKaUYYjMbTH8eiaf8NwQ5iv
	s/b7U7MtX0t3+f+Akzmv85IcMjoSMe6wqSueoZSRVFbf5rIUyZ8g8GvjGirvgsV3Zm7A8
X-Gm-Gg: AZuq6aLRNmHMwADL844+0QVVVKP4+ntJFif1niVTrCI8YWJa8VcmH8CAElFT2mN3edU
	uKxJptzL033GuwZqgKxlFOhqnPPDxAzTbt29qG+RAWBr8XU2VutliXZ5hpT06q4Wn0aP5XHSLBO
	D2eKiNusWldU06voFU1e6/Bmelt7j1RGVLMb/KciJnZnUuji+uQf/hBTZ7UELduuwKohUEAClEx
	DhgUtgmYvHOSWZrx7fci1gZKTaNDWSp4UXBacQwCQYr4E/AjWdOYoNQs51KNVJtlGOMjW/CeTdX
	Lwq/PlO6Ny/xgr+8kD1WVAmOcrgtlhZB5DwZ1JS1ThvROK9Za5D7KqQ7D2E+XyrbUpQDSrwEL7P
	8m2/8wdGs7Kvw9OtDCTQrK9dPx0uv/5whCYQ3DN7uaRwEJgNdSgy3ppwn9A==
X-Received: by 2002:a17:90b:2c8d:b0:356:2fc5:30d9 with SMTP id 98e67ed59e1d1-356aabe522cmr1338172a91.10.1770983777049;
        Fri, 13 Feb 2026 03:56:17 -0800 (PST)
X-Received: by 2002:a17:90b:2c8d:b0:356:2fc5:30d9 with SMTP id 98e67ed59e1d1-356aabe522cmr1338151a91.10.1770983776462;
        Fri, 13 Feb 2026 03:56:16 -0800 (PST)
Received: from [10.217.198.130] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567e9dff38sm7864552a91.7.2026.02.13.03.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 03:56:16 -0800 (PST)
Message-ID: <eb559791-b8b5-4836-ade0-db927b9fe830@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 17:26:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: pm7250b: Enable Qualcomm BCL device
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-3-7b426f0b77a1@oss.qualcomm.com>
 <c1a9aec2-0389-4a24-bc28-75be04cc91d8@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <c1a9aec2-0389-4a24-bc28-75be04cc91d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA5MiBTYWx0ZWRfX9hlq2WziCNuv
 FC6GD2YHguE8N+JD0b+Gt1HYZZMoSKRkql1gfpxpD5UX1hZTRbk6OQG9FQdVRLqETD7TKKMrsBT
 I+1PuyYR512G4fvDowd3U872sfj6fCEHBYCiG2KFTJMyBc5C1xfasKYOAqUedZaJWlfaYSM7zoW
 AOzVOFeAtTrIsVlKXU8lhJmZR1qRx9cQK2wZ+DD/2KoSxov79jXieaiIuKm0ixGZ1HZiZKD+5dh
 2EeNbEPqlQKlcn5IJSFdjhqxXTGZAbjWh4ZIZdKLGe4NLRtgnp/SjzLLiLLXt/n349A+in4rYUR
 ucxEYRhwN5/jXRJvN96sOKiMJu7h101CKW0JiyZArEsPbpJ9l5eogYT/n0ux7B/KyHxrTaSBscv
 tCLT7lRASHmt42XPub73P3Bf+4b7LqJ8XfbgK1uGB4NVIZC+KiwEq5GWUPVpDufYFP31C5OXXR1
 3TbqnixHpAf1aLhaLXA==
X-Authority-Analysis: v=2.4 cv=a849NESF c=1 sm=1 tr=0 ts=698f1161 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=VnUY3c1hKrMq6ITwzwAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: UC0tJ24u7lXHFo7FLrJG0rESY4i-VYLt
X-Proofpoint-ORIG-GUID: UC0tJ24u7lXHFo7FLrJG0rESY4i-VYLt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_02,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602130092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92775-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C3D07135E26
X-Rspamd-Action: no action

Hi Konrad,


On 2/6/2026 2:41 PM, Konrad Dybcio wrote:
> On 2/5/26 10:14 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> Enable Qualcomm BCL hardware devicetree binding configuration
>> for pm7250b.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/pm7250b.dtsi | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>> index 0761e6b5fd8d..69ad76831cde 100644
>> --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>> @@ -202,6 +202,16 @@ pm7250b_gpios: gpio@c000 {
>>   			interrupt-controller;
>>   			#interrupt-cells = <2>;
>>   		};
>> +
>> +		bcl@1d00 {
> This should be higher up (the node above is 0xc000, this one is 0x1d00)
Ack
>
> Konrad

