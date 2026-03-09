Return-Path: <linux-arm-msm+bounces-96203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOn/GlamrmkFHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:52:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D787D237634
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41E20302AF3E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 10:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C538364056;
	Mon,  9 Mar 2026 10:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O7fq2pYT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eUFudLs0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD6DAD5A
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 10:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773053520; cv=none; b=oMmnHYAxgXodrBPvHAVOuDeJWUayl8PIre6m3x4CQOnZ47RfbYj3oNMdw0Cbj3WexqBO7IPtzNnSmVUbsrqogvK89bC8lq7/t2RPVXYVgZpYgQRha2re1/5yPY6iIoLhnv3+5VPVwq7Y0erWUG9MR3Lwr/l/FFmX9+O2dORqHZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773053520; c=relaxed/simple;
	bh=Uyatg7jYdLH+dz9BKcMrBo73IYn9xt/IAQZ4UWxi8ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=omvg0SooDYPV6vDDiavbUmi0fqePRK8Z0G7PQhZTpkDbf4lhWvzAsLiYKAbmuB7HflBGlDW/TuBoNzkb9DK1sNt8x091qTXZ1C/Q1Q9UfjbjcQfMcqf9Yc6kuvqwMpK6LrBurPPCZs59rmOhDzlcZkquhU7b5+moStOgo/lqwY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O7fq2pYT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eUFudLs0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298WGBk3773410
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 10:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4mKFMEgxGg2tAs5QNXTAVvhLuUyFSnfWBYIFIYGINQ4=; b=O7fq2pYTp0/nngie
	bm+8nlA2wDVptpio5ybsAK4s4AahMyxrgqRHo0xaz1oT4IpDQtqKQpi4OdjI+1BF
	jrciEFefEPXxvvhNGHIk7vEbjL7QAc/p9J8tPtU95bEJidOlLtOglfI+eKz1ZphY
	ASTUkYKqbQeaVxN3soiie2TUi2UuQ5IFMAZ+2A7M9HJscJpArx0Fmr6UUiiADpoH
	wB1r3HMpipMvjEpjLbWdAZY4RjzTSb6DmrqSR9FbHLKA6X5A7xLBSlKlGGuKTmGQ
	egbZOcNtZSPuvu0p0Y5kOJHArMYOUki3R4LNCpzi898PJ9OPxuO11U9pXRMjfxSc
	9esuxg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsa8gdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 10:51:57 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7385e8fa73so2656524a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 03:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773053517; x=1773658317; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4mKFMEgxGg2tAs5QNXTAVvhLuUyFSnfWBYIFIYGINQ4=;
        b=eUFudLs0Ut/ynoq5JFbkTHmxsnZG9j4IYmM+g/vlRIRb+8OxQc1OMh0gSnWV6c1NiK
         JLXMWylTREShQwJBiENWSq+Aq+7vcxmHgbOhbKubEH+9+xn6acWqWmpOiLSnLJ5fPnUu
         ryDvJKQ0iuQQJZrI3/mNb0fPLMhCJVpQgPMnIYnjUAqSqo4SXVj96+k4tA24IE1jBLhV
         eNHJYVECeDE1yLvwJWtNTJkdkjRnhSd0F2PN7l5kwBGGzmK7mwk6cW5E94jWd6s6lrIM
         VqAywDLisZhN3H2V29hZ+pnh6wKjycNY8cWiA6jb2Fh/sjI8KEben3vlrdBsNacbp4tU
         WsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773053517; x=1773658317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mKFMEgxGg2tAs5QNXTAVvhLuUyFSnfWBYIFIYGINQ4=;
        b=fZOhDeRcgYp38zbQXbIGuq4N3YR006PEL8wuyS40sZEDBTXAp0SpBnvdPhcdcUIIw0
         5cmDTJFRzqi/VyBwatrDlJ4X9PTV2pnc9A7jxpo32VU2Bm9Lm0kcwYOu3Lkn3JMs6Nxr
         QyWE5xe7ybeWbzcRT1+SFWF5CaT6qCxWxQSfI5VFlY9jOFINsXfu3phLvDtiqxLESCzl
         9imfESnjf8I92sxFOTbtkgz2rvc0HIwLrQeMkjTDV9osyCPmaOFmTBp2EAYcfjkrhhep
         wRJmRCnYR4N7kB7kp1VQekvYguzP8O76+49pzfHtFuUlVfPZPeNx4GJuSNvVybJwUPDi
         eVfA==
X-Forwarded-Encrypted: i=1; AJvYcCX10TdiGW9J0dqgGLi7mR/wRFc5xbbW6VgpB0Kn7R9AFLdvc+rq6QI0YSvKAikf2RgmlGtpgr+13oB/DYd1@vger.kernel.org
X-Gm-Message-State: AOJu0Ywydqb/aSO/B6bMDojvVOuEJpMAAGpm7NguyylD5QbVaFo3kj0I
	yOwitO5/TGYzvIwsi6mIBRqjygqYM3FNcX2zotOfALlZZqV396voSdaGND61zrT6idiw1oDV2+P
	tvbWL2JfcNcewhz+WLMJW0Fl6iO4yN25XttQ5cnZcyYtAWHQ/QWOtImR2lhBekvBBW6jJ
X-Gm-Gg: ATEYQzz/ZWNKaqzNzHBAS6Si4sDBKOwtihBF3XnMbQWEI4QaFARvthgkZWw7X3weEgk
	tP7Vzn4yXFFlrpMrRhKiEWlcOPw3s1zsCkbh7HagElvQ8oWrv4gwiIf2yLbgoT2+dEBbG9upcmD
	H2uR+8AX7ytpsNgdzPTcumw7kf0JBVKqqdD6ScVscxcggsZmjifp/dESvWI01rCVgFUCf0qzd6m
	Y0ZdSiTG3LPcYEk4grJOCzHeE0MwbApJE4/8V4jz2xtEHbmKP0bVBfcHNeZ2Ic/bwtembdiLxue
	NRvlsvHLu8F9euKjX01Rcg7t3Kav4uNGaEzwfdgrmjV+On4t9s8eRYH+pVGfe0GHT6k3imHQwgR
	BVQGSfcmQGMVOEeHVqEjRCIrQdMxQPjdTtoU5WkQzKK0ldCQboqd+GP0+5eJzlkaUm/VxYAwiVz
	deHcXCqjYwJoeJaB57nOCE9J1itw/8jAhjZ2Lv6kI=
X-Received: by 2002:a05:6a20:548d:b0:398:7a05:f0b7 with SMTP id adf61e73a8af0-3987a05f0d0mr5545667637.58.1773053516721;
        Mon, 09 Mar 2026 03:51:56 -0700 (PDT)
X-Received: by 2002:a05:6a20:548d:b0:398:7a05:f0b7 with SMTP id adf61e73a8af0-3987a05f0d0mr5545652637.58.1773053516239;
        Mon, 09 Mar 2026 03:51:56 -0700 (PDT)
Received: from [10.190.200.237] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e0acde5sm8494350a12.7.2026.03.09.03.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 03:51:55 -0700 (PDT)
Message-ID: <ad3485df-5570-4631-9d6e-2f0b90a47235@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 16:21:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/5] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        ilpo.jarvinen@linux.intel.com, hansg@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
 <20260308233646.2318676-5-sibi.sankar@oss.qualcomm.com>
 <20260309-festive-prudent-ibex-f8b601@quoll>
 <ff241b01-c7f4-433b-a822-c5cd14e3e696@oss.qualcomm.com>
 <3eaceb96-003b-47d2-9ae5-bb676dde0240@kernel.org>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <3eaceb96-003b-47d2-9ae5-bb676dde0240@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AEUUA0ZiwMbMW6DATs0-8XtdD5GwOdSH
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69aea64d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=J0bc_HPAM6LSsZCXcSwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5OSBTYWx0ZWRfX0yE3/mTHSdup
 gSourSpRtzUtpx11uhCmrHBi+dDYacmbSPXFo0CEOtZBl9qi0OSuspDJ3wTj+jSIOkrwaZ8NbOV
 WKtgm62KzMJAEa2GdrCZM0bWvH71hheM0LTtPWSX7rkqGJH4FBKNTMJriuQFWtmeF1VoytIclic
 xD+rUIPF5aRxhiNWSGbruD2Ob3FiA0wUlluj4rP0jLHgHStc0YSvH+BDxGIDn/vcsMxJNzABODU
 E/2jxBGc9y3Z4TYDFuHSRHOqAPIEDdzOLHGmA9AZ/uS6VhRaV/K6lmnW8Mk1UTSgqjAGNw133mC
 b17xrb3Y45rU92mmpQjEtNiuS3UsQ1pcdjdsfWZLikOWTj3OAyCIRjM+j7rcpeyADx4vI+QNPT5
 Q14zWVBKeTr5SYiyRa6HvJdiY+SO1zLylB7S0rK6ADc73XNjOuMayCkdvCZmQVj2DO+PBMailvj
 /re9rUFw+xZihnPjpNQ==
X-Proofpoint-ORIG-GUID: AEUUA0ZiwMbMW6DATs0-8XtdD5GwOdSH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090099
X-Rspamd-Queue-Id: D787D237634
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96203-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.76:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 3/9/2026 2:39 PM, Krzysztof Kozlowski wrote:
> On 09/03/2026 10:03, Sibi Sankar wrote:
>> On 3/9/2026 12:55 PM, Krzysztof Kozlowski wrote:
>>> On Mon, Mar 09, 2026 at 05:06:45AM +0530, Sibi Sankar wrote:
>>>> Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
>>>> temperature sensors, access to EC internal state changes and suspend
>>>> entry/exit notifications to the EC.
>>>>
>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
>>>>    1 file changed, 16 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>>>> index ded96fb43489..29a1aeb98353 100644
>>>> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>>>> @@ -1042,6 +1042,16 @@ eusb6_repeater: redriver@4f {
>>>>    
>>>>    		#phy-cells = <0>;
>>>>    	};
>>>> +
>>>> +	embedded-controller@76 {
>>>> +		compatible = "qcom,hamoa-it8987-ec", "qcom,hamoa-ec";
>>> I don't see updates to other x1e boards, thus my arguments from v2 stay
>>> valid. It's wrong to call it "hamoa-ec" since only one Hamoa board has
>>> it. All of other Hamoa boards apparently do not have it.
>>
>> Hey Krzysztof,
>> Thanks for taking time to review the series :)
>>
>> What other Hamoa boards are you referring to? The series
>> mentions that the driver and bindings is meant for Qualcomm
>> Hamoa/Purwa/Glymur "reference" devices, so it only covers
>> CRD and IOT-EVK. It definitely does not cover all Hamoa boards
>> boards like you are assuming.
> hamoa-ec compatible implies that and that's something I raised in v2
> already. You need a specific compatible.


Hamoa/Glymur reference devices can have different EC MCUs
depending on the SKU. This introduces the need to deal with
possibility of quirks and bugs introduced by these differences.
Hamoa/Purwa CRDs and IOT EVK runs on IT8987, while Glymur
reference devices run on NPCX498/488. This pretty much was
the rationale to make the MCU part of the compatible. Anyway
I can keep it as qcom,hamoa-ec and qcom,glymur-ec for now
and add specific compatibles when we upstream those boards?

>
>
> Best regards,
> Krzysztof

