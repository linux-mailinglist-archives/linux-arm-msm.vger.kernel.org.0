Return-Path: <linux-arm-msm+bounces-96243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJM8GKGzrmkSHwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:48:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DBD23829A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 22662301CC9A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 11:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493E53A7855;
	Mon,  9 Mar 2026 11:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nh/djnMY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GmkzfSk2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD1D3A7829
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 11:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773056925; cv=none; b=u6y1/olccdx0teYsqqfxPa7fh/eaVGZJR54tsx4NQDwsTMsybRpgVR6H9bOv69LCmqe80stBUhxPuEhaG99e7dg1deFUgvu+iyNP+ornhNqlMWsjXNcYdC+I1eqseznC7pOMkZoI10522/JmhsoWm1+M987J0dLFZhjhP+OlrhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773056925; c=relaxed/simple;
	bh=PSAtaabDHOBf7+GnO4Oo5se4Ft7UAUwgseGnnqtgjZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MqT6IkeroCRaojMRA+YkhjaSP3pp/f/Le1tNtwPafdfCWGAbDOodtnN2lsqI++as9I3Vj61pcHKaaBYxuyK9eZD+osEIftClxbL27E+TSYTMtyzI2NbJBZjqM8xzxMX7StuWWQ0b3uKQRN/2cfRvtZt4pYaYfGSDKK+2zRZ+tU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nh/djnMY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GmkzfSk2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298WBuZ3773182
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 11:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4plS8DiT8nd8Y8ivbbOmNRR2e17OUs340VYiwNRUAU8=; b=nh/djnMYrVI/XTG3
	8jglzIziPGZDErYJLD5mVwRS9GyvjMQO7Qo99zb3ox+/6+xYKkD3lnZdNX9ypGfk
	g+zS84wA9qyhzCb4JU95SPDxThFD1tXYUdN+HFNh9b/XduwQq1WucC+24mJ9X4EW
	ud9iJCssKGnim6qb2FZUA51vvkJbJbZGl7bgvI0MJJn0GtU5YewtQBUMTqyGAXxI
	tdFHgu2cDYlOISs5hw4vEkc9PvXjdNVBbako45JUH2uxmkQgVlcUC21AY0gbVmne
	vQprZwxUXdZf2FN5iSL+9CNPmckrlLNlIiTOPwVlLD+7cdxLp7bdB+rDlrWAi9Qh
	PG+LUQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsa8nyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 11:48:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a063277f7so38319936d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 04:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773056919; x=1773661719; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4plS8DiT8nd8Y8ivbbOmNRR2e17OUs340VYiwNRUAU8=;
        b=GmkzfSk2FtDBVFp3Md4375MezWWHx7khnHCrdwPnkBOree5ydWh9JxyZWB+sCrEnhG
         Z7stqiVciOQZDe1e92z6p1Z0HUxMEqc8yLJxiAcJqkbmzqW14OttQY8BopIdzJ8t1eJX
         Ti1f+EVQvs9eAYKYFYNN6SfxGjYazBhHM7xulc6Q5FsTJaAibF9dN/Xv5k3vPE/tmte3
         4UkIlfMJzJJmSxJQgYUzOknn0f2rJ+WqghX8MlhPaMO74BM73sh7AwP6mLf1Iyuaj+Ba
         hHk8s0Jxaceh561do9Xg1YfqZKzAFtUpl6vtcmDc6nMxIVpgbc1Y9coxRUzrBdEFJbBt
         QXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773056919; x=1773661719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4plS8DiT8nd8Y8ivbbOmNRR2e17OUs340VYiwNRUAU8=;
        b=nJpAzRMDEPs4iFFMYA5hFoGVSwzfRdz4sKULDbZxBsKDdNj+syaNKi7syq3P1d7aez
         XRxyRgk1fDxbhIxd3CRWSMa3/sQ34VkDkDABrSQuN8Wn7jcH9xOdNyshjiWEP/Q+jImv
         vqF8PdGL+ZDzrI9goDLyOrt0Ff5CWi5jDTUr49wuo4gjT/VNqLFbIjfQm072oi4ZhGmY
         7JtjT3iHPNeQT6sWt7wS1Eq9eULTBZEiWtJ0kXZ/Q/jO62KFLiG3qxCtMqcp0fj5zn6M
         RdpJx0Da0BLp2U726Qg77OAxOp4gIqbCw0Jvotg67XFVXfHyghmYKSoHEHYv/WtQLlQ/
         R/Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWmc01Pdgipe0b/hNQygKtlmYfZ448r8LyELb+gegBY6GOqptGYDQPwpNKC7u5sy+YIXAPO3LVHrk+9BotG@vger.kernel.org
X-Gm-Message-State: AOJu0YyIOmXaZ/ty1IX9FUYatIVzORm64tsDtS0k/SVL9YOju3FzujKh
	CqUS/h2i0ZZBgzE7Eom6AVuHAjCuuZZVtmmRd8G0KjdAnxFJV2u9WVwSc6ZtsunNmrnJAj9Iwlt
	eY5CM4v32vzEfJU0fdIlzjqAieCoFr8ARuPqjs/YRjJPY69CLMjlUbHXSs0zSZyMA1cPW
X-Gm-Gg: ATEYQzxh6g1d8WydNJn4tC0zB7xESfiC3zewAe6VAt5+k/autrTzZJbf2lLo7T/4qfN
	kzKvl5rXHsXTtWMoK11yl8+lzbY201Ey+ewCTne9Zui9PNhBZNvGcsNC15CgJ23lEpBjrMzxBzt
	EV9o2IETa5rzTKoZ6V/G9c8CNgzJ2bFO6u/nkAjDk2E0T7KFisp8Eq3clxu64I0/PN49nUsEJ+L
	oUG1xKqfSwCPiSrMYNb1N0AWmv5mGTfPdTHUlfwTe5jkk8IdLwmNXuVGSfVLN88e3musSmEwh33
	wxBUr3NDjnzyUOLtdrqynlfTx3F1DG2wI2qwtOX0t7+DQU8zWZU981jSsPHhHxe/csIEk6U78O0
	LjBJRLbcVCCzGVMvRFNpjfLq70PjnYXwOhcmDTUmtVbIb0uoKGAZR2VB+vcQI4VCQu+Nd393nMe
	a3NwA=
X-Received: by 2002:a05:6214:4413:b0:89a:44d7:6591 with SMTP id 6a1803df08f44-89a44d76b9fmr59337486d6.4.1773056919224;
        Mon, 09 Mar 2026 04:48:39 -0700 (PDT)
X-Received: by 2002:a05:6214:4413:b0:89a:44d7:6591 with SMTP id 6a1803df08f44-89a44d76b9fmr59337136d6.4.1773056918803;
        Mon, 09 Mar 2026 04:48:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8a861sm361026366b.16.2026.03.09.04.48.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 04:48:37 -0700 (PDT)
Message-ID: <6fb8cc16-d339-4913-b1d7-5d114f0a1ed6@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 12:48:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/5] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
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
 <ad3485df-5570-4631-9d6e-2f0b90a47235@oss.qualcomm.com>
 <441a72fc-b81b-4fb6-b032-867752b3c773@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <441a72fc-b81b-4fb6-b032-867752b3c773@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sl7OZe2Ql0aOCdPV6_aOKpozeu436oqd
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69aeb397 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=CZwadPU-L3mGcov22fYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwOCBTYWx0ZWRfX+Lgz2WTmYjvX
 4wsGT+AmBY0OXo0OhEoHvRkhP1qzrLx4G2AiV820UatMjUNY/3pzhzZ141ppi366mUrd9atj8Qi
 zSKAbI3i87Q0st01vnHyxCujVLBs/6Xqmme+1HEB5gvIyPmDsrT3Xt16QWeXdaGjydkbMY9bz7w
 dW5mM5ij+OEatePNTR8Kz23XcboaiRFQcEb5PFIgqwq5mWLROUx7g5X9wBQ/EHMAzrvUnEdlNlw
 701j9uXjIXxdTll1c59cPlwXdnZWG4Z2s+FpKizuGWfSD8MtZo/pLMqEDK0VgzI5CBdQpnr1yvW
 +saRi+wxUGs+vmDPppNMGgkLDNDHzT3JlYH7OEn095NrfMSSYXqI/OSNjiVlXLH8AjPoe0dp7kl
 46vKZQxDbLysCTkXdAI+g+nC59cZSUJMm3fS52JY5N7A8KXJZEN1Hg+WyW3wI9z7HoHz03+NMEp
 l0RQ8C0egKVnJZL0bTw==
X-Proofpoint-ORIG-GUID: sl7OZe2Ql0aOCdPV6_aOKpozeu436oqd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090108
X-Rspamd-Queue-Id: 00DBD23829A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96243-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.76:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.975];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/9/26 11:53 AM, Krzysztof Kozlowski wrote:
> On 09/03/2026 11:51, Sibi Sankar wrote:
>>
>> On 3/9/2026 2:39 PM, Krzysztof Kozlowski wrote:
>>> On 09/03/2026 10:03, Sibi Sankar wrote:
>>>> On 3/9/2026 12:55 PM, Krzysztof Kozlowski wrote:
>>>>> On Mon, Mar 09, 2026 at 05:06:45AM +0530, Sibi Sankar wrote:
>>>>>> Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
>>>>>> temperature sensors, access to EC internal state changes and suspend
>>>>>> entry/exit notifications to the EC.
>>>>>>
>>>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>>>> ---
>>>>>>    arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
>>>>>>    1 file changed, 16 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>>>>>> index ded96fb43489..29a1aeb98353 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>>>>>> @@ -1042,6 +1042,16 @@ eusb6_repeater: redriver@4f {
>>>>>>    
>>>>>>    		#phy-cells = <0>;
>>>>>>    	};
>>>>>> +
>>>>>> +	embedded-controller@76 {
>>>>>> +		compatible = "qcom,hamoa-it8987-ec", "qcom,hamoa-ec";
>>>>> I don't see updates to other x1e boards, thus my arguments from v2 stay
>>>>> valid. It's wrong to call it "hamoa-ec" since only one Hamoa board has
>>>>> it. All of other Hamoa boards apparently do not have it.
>>>>
>>>> Hey Krzysztof,
>>>> Thanks for taking time to review the series :)
>>>>
>>>> What other Hamoa boards are you referring to? The series
>>>> mentions that the driver and bindings is meant for Qualcomm
>>>> Hamoa/Purwa/Glymur "reference" devices, so it only covers
>>>> CRD and IOT-EVK. It definitely does not cover all Hamoa boards
>>>> boards like you are assuming.
>>> hamoa-ec compatible implies that and that's something I raised in v2
>>> already. You need a specific compatible.
>>
>>
>> Hamoa/Glymur reference devices can have different EC MCUs
>> depending on the SKU. This introduces the need to deal with
>> possibility of quirks and bugs introduced by these differences.
>> Hamoa/Purwa CRDs and IOT EVK runs on IT8987, while Glymur
>> reference devices run on NPCX498/488. This pretty much was
> 
> None of these answer my comments from here and v2.
> 
>> the rationale to make the MCU part of the compatible. Anyway
>> I can keep it as qcom,hamoa-ec and qcom,glymur-ec for now
> 
> No. You cannot add a generic compatible when you claim it is not even
> correct - "different EC depending on the SKU".

I agree, this name isn't really the best. We don't really have a better
"official one" though. Perhaps something like "qcom,compute-ec"?

"qcom,reference-compute-ec-that-happens-to-be-found-on-boards-featuring-
hamoa-glymur-and-derivative-socs-running-windows-by-design"?

Konrad

