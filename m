Return-Path: <linux-arm-msm+bounces-110216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4J5jHfgpGWp/rQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 07:54:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB35B5FDA55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 07:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EA573026155
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 05:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C52E3A4F5F;
	Fri, 29 May 2026 05:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FasfBma5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvfMJzb4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9AD3A5443
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 05:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780033754; cv=none; b=uN/LaaaTi8ga8KBC51pgD/IzBqJ7y6WnHGNqx7pLv+YKgLg9F0MSf9/Tgu30EMYpcAOY+ZkrainowkTnpfLf+8JcaIdPDSrmBcPircweOG2kj/l71QwrS690Pol03UGeVo9zkU+ZDsRigs+rx799TA/btlsltF9JN1zc2tH27Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780033754; c=relaxed/simple;
	bh=tYZePMpCGaJ+dVgmzUM0MImFSqwW7e8yccJKslZhe94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i4DcediSV7JWKNf1Co/9FHy+0oRTeuxl3o1vuTzcgY2Vwoz4hFBstP07buYjDZmeoDJro9gerhFVyOIT+YbtwSavaYFM0HwTVwWMyZ8VVycXYcx3QhqZSeDlsSj2+9aVp9YQ/TeDxO68JxrwPGOw5j6mV1NJ47ue9nF71DhOCT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FasfBma5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvfMJzb4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SKkgQM1386679
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 05:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	srDM5VhRCyyRRsRBH7zxAS69uDyeKrznoeTqCStR/fE=; b=FasfBma5Sybsz2d0
	nvw0mgjgrUj8toLwVUc0fxdMMMjPCuPChZpjhe2MgFvwolCLIroyjMkU4ZYRYmiC
	whYz0N7CzBFNgBGlPzldslIqS51LudL0s/zYZAJUwwUzZNMwy6eut0gYaL01Bg2e
	NpQ6+cSRCrStpxQ6ldW/YT+rYKzyD4Y1StuQw9Ii4M6d1c8gpB7hicioysINwslv
	VGOifOznDheBGBv2LED5JvZp3wPlJ5OXlL4/e3TZzul9W9Avw21zZX2UnoMl4Rm9
	++Vv9JOJcHKzT6E47NgL/kVhtAhYfw34KI2eqDAqGpIifRfWnLXYxVTYGhkIMCIr
	ULF4kA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevumsw4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 05:49:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36642d2f4deso25734792a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 22:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780033750; x=1780638550; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=srDM5VhRCyyRRsRBH7zxAS69uDyeKrznoeTqCStR/fE=;
        b=cvfMJzb4TD9EF2jG0sLw8xjrZmBFR3RP9asf0emqXa9ZlqiV63p2Ba8Wt+23T0EoVB
         ImE049LA5oPgUyWAh6S7lgk2cS5/DTpq1FsPV8UAtsDA9lJGWtYYwekSOiSXY3Xsdhft
         QqFZOJsb+6028rqaeqk4ecr7nNXCHGfN6/moilvjAl4KQsq2QVODTQyRXcEvEmhSU5mQ
         ibB0afrxzBUk7y5pGmXfanASaUhtEjegX+8WQ7iTakim1Mf2TIQfY7avvtaLTdkfi4hc
         klZKayen4/9tm/7yf69uXc3wpkOOl+7HEOYbr9jhvBLBWYVRomwCCj4dz1qyPLzy/vx9
         T/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780033750; x=1780638550;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=srDM5VhRCyyRRsRBH7zxAS69uDyeKrznoeTqCStR/fE=;
        b=LrjZbnUAUqpO8hU0vrEQkpy6N+7HjGEggW/8hT7R3rym4Jv4gK+5gm7jNYwRSRuZh4
         8uwwodXab/e2rzycABrmnTFELDvzi4HJsJXIfo/E6codM+GJkkyIvOXR/olFqOr07FAT
         REFm+4fy19tzPKfjvbeBx7kRAZ5g/dI1xx6AmxvfzREN40Wad4yvSXAqwIiBGd5M2BKi
         AWW2kqCNZyG/7pvKIT3ZZM15Jvr8O2xbc98QRcSYMGBTbuECzVEVSaTugFgHKgUQ0bBS
         PISjFHKnemfWzgBesXqCba0P08cLH9+sVl+1i38JAFcV5UxaqL4/M04VZxdjzh1O0iDI
         ULSg==
X-Forwarded-Encrypted: i=1; AFNElJ+pU34NF+DLbVNSAzvWpJmthmmFSPisUQvp92/4++ebAoDJguiJn9rhYE1RFxwgrqFnDVUpPXE1+ICzSjFn@vger.kernel.org
X-Gm-Message-State: AOJu0YwcIBzZC3C6ODwZwe6eHPdKG3SBGShYvg+lLohTg8LcceJqNHfU
	lMayU+tBv9p5CEcMWXCYjaKRVJu3/IpxuLDXV/HxYR9Bybyjy4bkzr6CvUiAnDcT/oJEA2NWzhf
	WR4DBQEf2yxd77yLPRPeWqiu0X6ZzhrtWm9Dhv1Mo1rtzBriNLd+MZKp+UVvp3gUBvsqX
X-Gm-Gg: Acq92OGUamEFvC2HL0cjs1bYu/A4pvbOn4Ros45smdd2eG9Pbx4kXE/3blI2Rpm6cVQ
	SxTg5sw07OBERxudOKycUV9CCgYTIpmiI1v3iB53lqGMWn+JYDybJEJ+7nud7vxMOvVzp1Kxlhh
	b42HpEdWYMNREjgitv/fh2jRjj6K54m3SPHaI/44dPVo6+oWgVORtcQ5+9iKp8/YPxzd8NYls0h
	ZoG6rm9Nu6k6xQciSO4L6rX6EJV6tj+j5WS5yzywQnSTxVwuwJorANdnOL5x7L6bH3VPNx99ypt
	cscJtb3IN4+tU0841+BZdgkwOEYW25s/icVR2VmHyL5KSyODONfA8P42pPVLoiOQ2UwIcxF16Nq
	x4zvSb0mt64UZP4/DXiZs3efSkMPrrFWSqvWV2ZKcnlbJoJMMWpoOEUypPd1R0qduHXaAoMEGpv
	LEKC6FW3zgZX834V2I7iN1B3psvfI=
X-Received: by 2002:a17:90b:6c4:b0:35c:30a8:330 with SMTP id 98e67ed59e1d1-36bbc58e632mr1843351a91.0.1780033750403;
        Thu, 28 May 2026 22:49:10 -0700 (PDT)
X-Received: by 2002:a17:90b:6c4:b0:35c:30a8:330 with SMTP id 98e67ed59e1d1-36bbc58e632mr1843296a91.0.1780033749938;
        Thu, 28 May 2026 22:49:09 -0700 (PDT)
Received: from [10.133.33.19] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc6a340b7sm600950a91.11.2026.05.28.22.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 22:49:09 -0700 (PDT)
Message-ID: <57f8c593-11b7-47bc-8e11-7ec1b97210f6@oss.qualcomm.com>
Date: Fri, 29 May 2026 13:49:03 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/16] arm64: dts: qcom: shikra: enable WiFi on EVK boards
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
 <20260525-shikra-dt-m1-v1-16-f51a9838dbaa@oss.qualcomm.com>
 <qhm4zgn3yiahv6dfucisu7uwcxddty4fvl3wwx6gk2zm5ggzlr@n3nqcpkkwxps>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <qhm4zgn3yiahv6dfucisu7uwcxddty4fvl3wwx6gk2zm5ggzlr@n3nqcpkkwxps>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: R4gWWhfoQ536LdIXPcJTbrBzYHnQTh3S
X-Proofpoint-ORIG-GUID: R4gWWhfoQ536LdIXPcJTbrBzYHnQTh3S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA1NCBTYWx0ZWRfX37b3uR/YY+N1
 VgyqQgTCZ5+/6i0WZEp7faLttYM3RNATqvzlDG3S7vGUxK5phUxirkUYKR+uMxjZYLHSncEL1SR
 DFty6jSWZgl6t211IPmVcLqWXw0B5cRwqwd2ii3f5i3Oi1gxLVj/owYDLgbvrogaLrrQyV0Vl7p
 I5plALQKXZ5LIis2Nw9vy51UzxEuvY3+el5zCOiOt735kLfBN+JzMLHry67Ig2ZgslnXZbEjiK1
 M/47I7a3bfqt9FTyxzeDdT27igv8lDnetl0jF9W6Fmbh9zZXg40A89gIsYZ1Hm/upIA4CWkCCLt
 N/N7KlfxA+9NxC8XL0pkenlhCOePU+/dDWeZTZg4H0iO0tu26iTyKavj9LrUHXn5AqmOKq779/i
 5i+s+sN+8HBUO+36ctikxeKZtKVLZrygTvPXEuAnCeNrWlDx5tziizpzUdMYCHyogVLN5/JXKO+
 6GSndR0dOIwR0ZPtlkg==
X-Authority-Analysis: v=2.4 cv=cObQdFeN c=1 sm=1 tr=0 ts=6a1928d7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ahI4HeskZtu-GeTpWRYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1011 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290054
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail,oss.qualcomm.com:server fail,qualcomm.com:server fail];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-110216-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miaoqing.pan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB35B5FDA55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/25/2026 5:34 PM, Dmitry Baryshkov wrote:
> On Mon, May 25, 2026 at 01:19:20AM +0530, Komal Bajaj wrote:
>> From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>>
>> Enable WiFi support on Shikra CQS, CQM and IQS EVK variants.
>>
>> Provide board-specific WiFi configuration, including power supply
>> connections and calibration variant selection. The WiFi node is
>> enabled on each EVK according to the corresponding PMIC and board
>> design.
>>
>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 11 +++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 11 +++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 19 +++++++++++++++++++
> It makes me wonder... You've added DSPs in three patches, one per board,
> but BT and WiFi go together. Where is the logiic?
>
>>   3 files changed, 41 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> index 259032bd20af..15208e1abff6 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> @@ -69,3 +69,14 @@ bluetooth {
>>   		vddch0-supply = <&pm4125_l22>;
>>   	};
>>   };
>> +
>> +&wifi {
>> +	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
>> +	vdd-1.8-xo-supply = <&pm4125_l13>;
>> +	vdd-1.3-rfa-supply = <&pm4125_l10>;
>> +	vdd-3.3-ch0-supply = <&pm4125_l22>;
> Squash with the BT changes. Use the PMU-based bindings. Don't forget the
> swctrl GPIO.
WCN3990 does not rely on the PMU module; it is managed directly by 
ath10k, so the swctrl GPIO is not needed. The details are described in 
qcom,ath10k.yaml.


>
>> +	qcom,calibration-variant = "Shikra_EVK";
> Was this submitted to ath10k-firmware?
Not yet.

>
>> +	firmware-name = "cq2390";
>> +
>> +	status = "okay";
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> index 142cc8da53ce..51267c1a86b3 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> @@ -69,3 +69,14 @@ bluetooth {
>>   		vddch0-supply = <&pm4125_l22>;
>>   	};
>>   };
>> +
>> +&wifi {
>> +	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
>> +	vdd-1.8-xo-supply = <&pm4125_l13>;
>> +	vdd-1.3-rfa-supply = <&pm4125_l10>;
>> +	vdd-3.3-ch0-supply = <&pm4125_l22>;
>> +	qcom,calibration-variant = "Shikra_EVK";
>> +	firmware-name = "cq2390";
>> +
>> +	status = "okay";
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
>> index 9bf52030bcc5..f4e93cfb77e3 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
>> @@ -30,6 +30,14 @@ vreg_bt_3p3_dummy: regulator-bt-3p3-dummy {
>>   		regulator-max-microvolt = <3300000>;
>>   		regulator-always-on;
>>   	};
>> +
>> +	vreg_wlan_3p3_dummy: regulator-wlan-3p3-dummy {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "wlan_3p3_dummy";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-always-on;
> Why is it dummy? Is there no regulator on the board?

WCN3950_3P3_CHAIN0 :is powered by on Board 3rd Party Buck which is always ON, VREG_SYS is always on once the device is powered up.

>
>> +	};
>>   };
>>   
>>   &remoteproc_cdsp {
>> @@ -77,3 +85,14 @@ bluetooth {
>>   		vddch0-supply = <&vreg_bt_3p3_dummy>;
>>   	};
>>   };
>> +
>> +&wifi {
>> +	vdd-0.8-cx-mx-supply = <&pm8150_s4>;
>> +	vdd-1.8-xo-supply = <&pm8150_l12>;
>> +	vdd-1.3-rfa-supply = <&pm8150_l8>;
>> +	vdd-3.3-ch0-supply = <&vreg_wlan_3p3_dummy>;
>> +	qcom,calibration-variant = "Shikra_EVK";
>> +	firmware-name = "cq2390";
>> +
>> +	status = "okay";
>> +};
>>
>> -- 
>> 2.34.1
>>


