Return-Path: <linux-arm-msm+bounces-93120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBqoNDJKlGn0BwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:00:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0424F14B166
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:00:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8524330074D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81ADB2D97AB;
	Tue, 17 Feb 2026 10:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ufbo8f4e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DIDvIXe1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD4A32B9B9
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771325956; cv=none; b=W7wUI+KaPDiCJSmERVcsd7WcXxecmYZ/awsmlEf/tegLVV4qzBSYBRurv8uHyAoKKwHBFC5wXiYPkevePjCjSSZ7tlAIwq2QZdhJ+SVCWQ6P2J/IDfnTHhP86mXq21IuBqniBY0Fhekq27XIdYJ/wV/+BinllkXfwcTYKCTjN+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771325956; c=relaxed/simple;
	bh=UdKBFZQUvbvqx3KpUPesANyIGJ53xywvDu1cMen63Xk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oy2aE2XPcXJt58y8kaxykfk7TOmfiL5er1HPTkYFWg78v9ov2VRCme2hCRqZVgnUQzgL/ff/MVIf8b1kpMeB+wm00/78WPiovZ0HuSEtL7zXy2RQl8tjYV9ktCiuVcT1Yl8liJWf2XOdx7WRyYdDwSRsHDmnLl5zwC5tgwmDGSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ufbo8f4e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DIDvIXe1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H9G078985312
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ae/FUPlzFi6j31KCGyLk8SnuPbjkQ8pLfCOaacXRabM=; b=Ufbo8f4ezp+nRk9s
	vHcBvmAAjfEXpLWVwhsAkOJTh2mfy9GrHdUR997/kyPtlYQ2m3qKUfLfJ6206QK0
	DLudh+l2OPDATbxcctzYT6olb+owdGdEUoqJ/Jsqhb/17YA3yuLn+6f0EIHFt4hT
	BiTT2vp8MnJhetCvuFKpP4obNnv4XKtKQ7m0tZNqL/p5Q1cenfQWbdssGMSg64OO
	v1v02Hu55EvpibVrUpaOBr1b80gR87uJIaBSbDHebwzJsx6u88S0dlBhZ/wQm3rs
	k8+plDSVQU+huh1oRB0PGxjMleFV2KT7ZDhhHs6w+W9vx7hds+skoSRjsaetol9B
	kDtYCQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ap1wsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:59:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50335116a0aso24748361cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 02:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771325954; x=1771930754; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ae/FUPlzFi6j31KCGyLk8SnuPbjkQ8pLfCOaacXRabM=;
        b=DIDvIXe1YzE2+vYezfh+ECigoYuDBXAcsEWZHmlu/7N9YSvRspBpxEFF1BWgTe2UzW
         DbeUPckt0SK4J7F6z90g8u+iVdO89uuB1JS1sTTuJ0xPjbEB6HpPBeKj4TF30t2dYSCN
         OpOauRKS/LivMMHePTyi1+RQqDseNw3hxEsaJHJr0s79Lz5mvnCM8x/8gNNeiuElCDI4
         LLxHaELA93mxx1jiy9K7TIS51H0Sgs30CxKC/73kYVoLU+CAin6mA780A2ls1NjqEUNH
         /Cijcggi2eLO2gT/NlgdDBsdSXHYjV3pqXddhIoo4JeC8GLkDf4O6CylzedWVtTgtJJa
         m3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771325954; x=1771930754;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ae/FUPlzFi6j31KCGyLk8SnuPbjkQ8pLfCOaacXRabM=;
        b=bzw7rWa69uI+fsIeCK7qJ//4wLsfBhKa69DD/i6e/19Ux1ONVYPeIr2M8PRpo9zPxu
         6v4moTWzwPwg7tnRoNTggLFVljXQbhN7innl3kFtFfTFzh69Y0TML8OU9ERe+HVM9JUq
         mi5fC37x1977YUCqiLCUyq790/zNSu+Ituf3JD1gOy/edlB/wD/edKG9wmJ7B7yMOpSI
         ZrV/n0+Zo67BeB7aShi/78ik1sZzQqs/g4zvt/fusD7K9Oxq0g/WjUVXTmqUkT8N03+9
         9CMsfJzzJBBj2zvFHmi7UJwtGrm+VDh/DxK7kNVDYFrcaZGR7llaxDof3A0XayMBopWz
         DzjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHLh39g6SKv+HXhTgSrD0ixcMJ/0QnW9DNmsssXhTmF0Ki3AzQd7UbQGa0THklBYlJfNBH74gME4iNwx8P@vger.kernel.org
X-Gm-Message-State: AOJu0YyhKFrbrvBQbS4vzQNWHq1o5oPQqDDvH8P3VOF8/yb663+mMYmw
	7kX/hpSlN3HG1f+gZ8zGCJPiSKSFoezjcSZkoV614lpaD/pU5hurasHZyMX8kWs5lueo4LSdebH
	aARqpHKJjVp/D6N69QpSG53g2B9ihWw3oDVmmc3/OH6WyIdtnB50JKynEpCQOuxtUvg+Z
X-Gm-Gg: AZuq6aKNPHO62zM7gwv47sioa46y4tnJdapHhKCRAhyI7EzgiTB4lmSlMWtCm+ARgRF
	T6KZEXWgAWaNdV7Bw2UCofVwTcQ0dl7O36x37hbtsSkoAfSxvIWBc5rRVVyQcFmkX4v9f1ZTSEl
	U+WnY7xMe3etixbKJK8/+1UP1qus5qi34YzUON/v74u6nSH7PKfxeoUKSx4f5vvpjynWwqG/GAw
	/PaG/umrTGhpX9lnGyTWWzsMFAbXzNGqybC055X66BK064OsMim24W8/5UBxMi53+yHbV3i8BLD
	DnWtHM+VWGVuhluuZFjo0tuNR9CZpAftOFrW5Rrn5F48pEra3H0BZselm2VFfd9dIW02GQI0LwD
	HyXeTHidAKl0id0I5equ6MCux4Pcyn8PkvLgDQFnoJ/GEHAjPYDNG6m2AmGIdbgoTpejLNmvEah
	+92Xg=
X-Received: by 2002:ac8:7d0f:0:b0:4f1:96c5:eb29 with SMTP id d75a77b69052e-506a6814447mr143961711cf.6.1771325953558;
        Tue, 17 Feb 2026 02:59:13 -0800 (PST)
X-Received: by 2002:ac8:7d0f:0:b0:4f1:96c5:eb29 with SMTP id d75a77b69052e-506a6814447mr143961581cf.6.1771325953193;
        Tue, 17 Feb 2026 02:59:13 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad19be01sm2447598a12.3.2026.02.17.02.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 02:59:12 -0800 (PST)
Message-ID: <bbe7bf3a-74fa-4e87-9c2a-0fee1a80f2d1@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 11:59:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: milos: Add WCN6750 WiFi node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-3-27b4fbb77e9c@fairphone.com>
 <5fe80f4a-ef5c-4008-88e2-60ad1f8c2a18@oss.qualcomm.com>
 <4u6yutdbpmsaz5t2rzjtttvvbf5onkckkdwxqma672pqnkre5w@zagnzqwl7ju5>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4u6yutdbpmsaz5t2rzjtttvvbf5onkckkdwxqma672pqnkre5w@zagnzqwl7ju5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5MCBTYWx0ZWRfX/tOzB879pXIO
 bUEIq183WGGndAWjNgYW2AiypJuDkd8ueRqLawjfbb6zXpxnxA+KX621Sq5BrXiR2+HD8nOsWDP
 P9AYK1wkbO33zhxXrST8MDuHa3LwF90scDS2eGmLL57NYr9RCPZJLixtpiPRGt+HKN8OTVreV8A
 KMuV6vttrTYiuzZwFWLV28AAc3AOZ36MuqO0PxyaxWMgRIsTHdo+ijZVvesxbTxG/eIiEQnkdzz
 vO+OzW976fqXL69TTY3m8+WmJEgbg4+inpRHnk+7UAEvpDZifEKawqNyNooXi/jMLp2955pFYRe
 iOFRPvwaI57i/LCiqZFNAxeM191sFEuvNIhvUMAnIn6jR+KWa3avrELuEii2JanPt49/ZQlz9XA
 T3KLLZXqj6mdgPNJ/Vn7apHLsGQoQHHTCckg5ueIucGnxzptelleQKFJNPZ8wXNu9dmCToDCGLk
 qy1EsNScH2qPtqawEbg==
X-Proofpoint-ORIG-GUID: BZgBEaF1yiPoCi4WrqMTXhJq3RJQTKEy
X-Proofpoint-GUID: BZgBEaF1yiPoCi4WrqMTXhJq3RJQTKEy
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=69944a02 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=6H0WHjuAAAAA:8 a=creFfYD69OIjy85eYnMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170090
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93120-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0424F14B166
X-Rspamd-Action: no action

On 2/13/26 3:31 PM, Dmitry Baryshkov wrote:
> On Tue, Jan 20, 2026 at 03:39:44PM +0100, Konrad Dybcio wrote:
>> On 1/16/26 3:50 PM, Luca Weiss wrote:
>>> Add a node for the WCN6750 WiFi found with the Milos SoC.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/milos.dtsi | 46 +++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 46 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
>>> index 024e1c9992fe..80feb3e9d3e2 100644
>>> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
>>> @@ -2043,6 +2043,52 @@ gic_its: msi-controller@17140000 {
>>>  			};
>>>  		};
>>>  
>>> +		wifi: wifi@17110040 {
>>> +			compatible = "qcom,wcn6750-wifi";
>>> +			reg = <0x0 0x17110040 0x0 0x0>;
>>
>> This reg doesn't.. sound.. very.. good..
>>
>> The size being 0 is of course wrong, but perhaps more interestingly
>> the base address is a register within the GIC..
>>
>>> +			iommus = <&apps_smmu 0x1400 0x1>;
>>
>> And this is a PCIe stream
>>
>> But I see kodiak has the exact same setup..
>>
>> After digging a little into the driver, that 'reg' is apparently
>> indeed consumed, as a base for PCI MSIs.. I feel like there should be
>> some better way to express this.. non-everyday setup
> 
> I wonder, why are we using it directly instead of relying on GIC? I
> guess it is because we need to map MSI registers over the PCIe IOMMU and
> then let the other side write to them. How is it being handled in the
> normal PCIe case?

Looking at the recent r3g2 patches with the second switch enabled on
PCIe1, it seems not to be an issue there

Konrad

