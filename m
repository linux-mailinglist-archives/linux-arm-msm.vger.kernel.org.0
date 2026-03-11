Return-Path: <linux-arm-msm+bounces-97010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEnuH/J2sWk2vgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 15:06:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 801DC265125
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 15:06:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 848A73010218
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7EB5274B42;
	Wed, 11 Mar 2026 14:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K8e6qE+j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZiCGWbOk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DB9363C5B
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 14:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773237704; cv=none; b=e6aaCXhFfTPmDGY4o6YmEB0crqyd+kkFgR16RjlDe1LBsL3r2Xtv0eFogMwuSuFsmwk1ZbBVxgh2AywPLiwyPRr0S+MElmqajhd4zUpLo4y9s6joHyhHXVOQvhY13AU7r+FwsUATh6s+dk3upr/5HRXRA+MRRzDySCyJGlZXkJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773237704; c=relaxed/simple;
	bh=Jbtw2Uk8eiOeHgDdNnXiRm/CuTyoldDGbU0naB1H24U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R4mwdk6EM38Qyjvd4EJU8v3Xe1kk3PbzMHs8zVkK0K37eEeBy5bTCA3o40r/QB/I+glYvf80Ub7I5ahS3ggAr75HLT8qcTSfTNfKFZyJlBolwlFBNWg08zRTBS9xaEPvFUEuzBHifSn7RYThhba3k84r6/92EiJJKwZXJX66AFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K8e6qE+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZiCGWbOk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BBfN8O1439761
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 14:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uVrGHBg9vd9p0galQ9QMrbdXo/eNjVOq2v7DmbRYaCY=; b=K8e6qE+ju59THJeA
	J7CePapMUu/mw1+j/TXTspVaDiS6PguUmGY6NaQYxPPv+cN2vDf3ZbcPw34zg58R
	1oOIAT7F1Eo+n5AW3f+Rsi+2yTeUu7jQS5IOfeiXI96I2kmz6YZLdgo0EVFN0rBr
	w3CK28ltEtrpmGIGvc+fslWgTQLtz+hOt0vGnLLgEpDYfaCeHRpPEj4FJhx6gnP+
	hLLDwZKZ+xDpIKqcTek9522l2IZ/bKOsgkWVX/W4RidvsRp0JZOIe4s1g2m+BzgH
	xyOnqGwdr1xIQcSEm3m6o2/HIaZug+NaTEjLfOzBS+YFqUhuhZoqxP34yEtYX4og
	2fl/Lw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu38yhkpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 14:01:42 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4172bafc368so3837710fac.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 07:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773237701; x=1773842501; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uVrGHBg9vd9p0galQ9QMrbdXo/eNjVOq2v7DmbRYaCY=;
        b=ZiCGWbOkPakHqcNvLzWuDMYPAx39Y6RkZt136HZvPxJrx8yPldOdD4Rq9N0M6UbcQM
         Iw4d5IA/lO9i/xgDQrZnHvtz1a2sCMqgnYx85O7hMefhaBb6sPjBsuMcgPbVtaqyyfj2
         NjhuQlnfu68lkYFSohBy9BF4NQywtC9MoLr7PePKBmBU/kdDMOOKGSD4Wyp5Bo2XGNCP
         bb7QSHBTBh0fBBTMjRFYMKu5E1Xm3DNuQyrDEohoUCBj7lmZ/GN2A6ZD5iIEg1qlMC8o
         QLxRqe60WMKP8Ptqe6WRR1/5MPS3c2vwCA8zx8LJqM3TjcgvdW6oA6Ytgoi59DhhdQAk
         Tvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773237701; x=1773842501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uVrGHBg9vd9p0galQ9QMrbdXo/eNjVOq2v7DmbRYaCY=;
        b=D1Bp9eMoHlfav+3xUK5Gq1wDvv5PUvbZZ4NgaPwMOZtVXOGFFpeH43F2WELVpzMJte
         d1MYb5cPNNCyGUiUV67aJwykHKgLWfwd62nE0W1F4625MB+kMTaqazR6M/vEC/DTu7le
         3QgQ7OSkHmDhxuJP61hmiApgQGEZ0aqYWbqgXsL99ouvwwHt5ko2ElXiTc3tZSA6JKmR
         VinGshRszO8JMoT6LrUVd7eaUoWKJCzei2vHKcxb4sgwNr1HOvbOaJY51LF8O8z7pKm2
         RaTsWavGBMhYT9nCROn9V5BZy+cGHQPb1BB+1BIJPKQwaBjVtJnfELhL9wYKF9qgtAU4
         gpBw==
X-Forwarded-Encrypted: i=1; AJvYcCUbIikgbGPGulhamexphaneFRj3E6p8PFPwX5f2HF6nuhf6h/r/AefEdDeARyIsgT8XWn/PN2zDiGEdFA+m@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8nLB5sMSkVMAr4hgrsUnkkeymdamSIZJOFceasecx/9s7UlEp
	+7NVPmBn7rQ2tKjLjmerhnQ2lzDA5y0xw1HUw8w/pCXB608tsxhiojxGJc14EbZxNy4zul73Ffw
	4UpOxcPHFah0GPzmFydAIMhCAggv9UXqwtRJ60CsJVLbAxMMw/cY2Y4AHb+JruGmUynO3QLp9H5
	Rb
X-Gm-Gg: ATEYQzzOo6lRq0QED749BfoJvf1ux9wPandj9UoP8iQE8GnyN9+JAoBrVBJ0AvjRAek
	zMJ/unuuhvSX/+O13wqnhsxtJqaDRRuaOW5faOBt6kaOZx4HAOp0woTt8iic70/33hY+gVKuP7k
	H2sldADQW2DFGPp7P24rjK1nJkzKnhzbh4eix5RtDqEbvzH0GhmxZl4cX13rz/HhudxaPirVeLv
	xTKdkovhFiwx52ZVBBbBqfMVpj0+2Wr5vVdsvcVgHqVZUIr+w5dQCWCgdYNQeUXfgbqdyeyOByc
	5naN4fsg/MHUTuqN+s2+/Kw/+YX3P1FXYzdfAyJoHk6Ttpu8kj5b+qQw4BRZ/FRC3AKCwp0rdog
	cC9KAupUDm+4oPtfCRzTgxvZDp7Uwi3MSdTGEWBsjBoXZL4SZKOWShKPDkIuEgV9uzjMfqb0Uex
	C5LYU=
X-Received: by 2002:a05:6871:3504:b0:417:3387:7fe3 with SMTP id 586e51a60fabf-4177c44be64mr1314227fac.0.1773237700298;
        Wed, 11 Mar 2026 07:01:40 -0700 (PDT)
X-Received: by 2002:a05:6871:3504:b0:417:3387:7fe3 with SMTP id 586e51a60fabf-4177c44be64mr1314151fac.0.1773237699289;
        Wed, 11 Mar 2026 07:01:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972e14c2d6sm57645666b.32.2026.03.11.07.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 07:01:38 -0700 (PDT)
Message-ID: <f7b68467-493b-4794-9b9b-76cc9cfcd2df@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:01:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: spmi: qcom,x1e80100-spmi-pmic-arb:
 Document Eliza compatible
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260311-eliza-bindings-spmi-v2-1-12783c6759d9@oss.qualcomm.com>
 <9b8ea7a8-80bd-4aba-89c3-6dbe9d43c41d@oss.qualcomm.com>
 <mfwrqojtcrn5ayrlqety2or5pcyl2zbd6ykk6wtmdvdrnu4teg@egqdd3nwghbo>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <mfwrqojtcrn5ayrlqety2or5pcyl2zbd6ykk6wtmdvdrnu4teg@egqdd3nwghbo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDExOCBTYWx0ZWRfX5oDWtosN7X+B
 IsfKMkYqfdh2AC/jHRzG5c3lfxZEfmIODBr1ySEy07uNkhfrVau53DCti1JcR6KMmX3umsFpROs
 3NnEhz7002oete0CqpRHzaVmfFcVG9WgqXsYw40F59Xsz50hgoPgdZUi7fNWCivZtuohFyyaRfT
 xZSKH5e00uuf8AzWpXPpmHOuXs/uABiPIe1J00MrBrOdM4um/yUqRsMbzquJlJNtt8Cn15go5Q+
 oRMAfEedgl9gmG477cMuTnloaBQIGJUcASru9zA0A3I35SKvMn3cSXCkCBm6HFkc795Fm+toGGn
 VYTeO/0nstKasOMI1c6+Wsm/uRoTpVFYwSWamojL1ZE0lvy2GX247RWGcCL+ir+IWcyMrI4/md0
 VZ9jg4fHrEmeDoGF+6BT7mTe3r3EkWxFvyUJsanxON5DalbAuferQuvH76Ka8hGQ7aTrfP882D4
 Mmycco6dVywJsZaB0zg==
X-Proofpoint-GUID: V0Feq4_BQYsGF7Kitwc0HafUVDTOKJMM
X-Proofpoint-ORIG-GUID: V0Feq4_BQYsGF7Kitwc0HafUVDTOKJMM
X-Authority-Analysis: v=2.4 cv=Cq+ys34D c=1 sm=1 tr=0 ts=69b175c6 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=bLizU8iuE--O0T7lCBIA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110118
X-Rspamd-Queue-Id: 801DC265125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,msgid.link:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97010-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/11/26 2:57 PM, Abel Vesa wrote:
> On 26-03-11 14:43:27, Konrad Dybcio wrote:
>> On 3/11/26 2:29 PM, Abel Vesa wrote:
>>> The SPMI multi-master Arbiter found on Eliza is version 7.2.0, yet
>>> driver-wise, still compatible with the one featured on Hamoa (X1E80100),
>>> which is 7.0.1.
>>>
>>> So document the Eliza compatible and allow Hamoa one as fallback.
>>>
>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> ---
>>> Changes in v2:
>>> - Instead of reworking the whole oneOf for compatibles,
>>>   add Eliza similar to sar2130p.
>>> - Link to v1: https://patch.msgid.link/20260311-eliza-bindings-spmi-v1-1-1a20eec1179e@oss.qualcomm.com
>>> ---
>>>  .../devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml          | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
>>> index 08369fdd2161..4152469b3880 100644
>>> --- a/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
>>> +++ b/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
>>> @@ -23,6 +23,9 @@ allOf:
>>>  properties:
>>>    compatible:
>>>      oneOf:
>>> +      - items:
>>> +          - const: qcom,eliza-spmi-pmic-arb
>>> +          - const: qcom,x1e80100-spmi-pmic-arb
>>>        - items:
>>>            - const: qcom,sar2130p-spmi-pmic-arb
>>>            - const: qcom,x1e80100-spmi-pmic-arb
>>
>> I think Krzysztof's comment was meant to suggest you shouldn't add an
>> intermittent items: entry for a single const (lone-x1e compatible), instead
>> passing:
>>
>> oneOf:
>>  - items:
>>    - enum:
>>      - foo
>>      - bar
>>    - const: x1e
>>     ...
>>  - const: x1e
> 
> Oh, my bad then. You mean like this?
> 
> @@ -24,10 +24,9 @@ properties:
>    compatible:
>      oneOf:
>        - items:
> -          - const: qcom,eliza-spmi-pmic-arb
> -          - const: qcom,x1e80100-spmi-pmic-arb
> -      - items:
> -          - const: qcom,sar2130p-spmi-pmic-arb
> +          - enum:
> +              - qcom,eliza-spmi-pmic-arb
> +              - qcom,sar2130p-spmi-pmic-arb
>            - const: qcom,x1e80100-spmi-pmic-arb
>        - const: qcom,x1e80100-spmi-pmic-arb

Yes, but let's wait for krzk's response

Konrad

