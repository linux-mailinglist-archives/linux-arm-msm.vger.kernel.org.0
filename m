Return-Path: <linux-arm-msm+bounces-106081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGLvEf4A+2kbVQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 10:51:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBF14D81AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 10:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8D01C301F28F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 08:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F683E5589;
	Wed,  6 May 2026 08:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nmhLMP/y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VfWxnkKU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124633CF68B
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 08:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057374; cv=none; b=uFyL9kgg+hTBthetO7HRj5emxlYXaj4Td5nz3+WZeHqvO641BBS2RLSxw2tuc3qC34jGuGGeIPXHtDELiMubu7PHgXVWAMHsF40mmXe/7mnwqktWvuD2/PETOBUGiKj5xMkmesJF96iwD99B3H92Sv/ecobSVph31NZ9Xpf3Ktk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057374; c=relaxed/simple;
	bh=eWYUYSqjEvr/QMLT2YP/YpMa6s4scjiSIzUTffaAKkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lKJJFtH6pfW2dvbMQpVyCZrHB7+9k+Sbh+bWyPe1MaJ4/8NZz1umGkQRIkaKSyYwFfcJfOMDPz7WbBKN978xhog6VJio5IZE7WzK68qjt48HkgI5NK3ACs44NI6/56it/BRiSxGLNRpbjGmrZsLiOm3v7prWaMwf+QjKuCii5bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nmhLMP/y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VfWxnkKU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6466IFFq3501578
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 08:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YH4OPVhdNQZCgKS3VbLo+nyuFWSjcm8vt56FMlPc0L0=; b=nmhLMP/ykkPgHoPY
	6fq7dTjcMeENgamh6y+u0mSScFGAucg172BWIDP8CLcEv05NdYwsOa/7BWFi51q6
	vLV1cveXf7SEvRg4Wa5f5HkzmTUXTKHC2RXI57GG7yIXYVrbpYeg3BCp8ocP/OT6
	sFJ6//pI9SvGpATg9EEAfbTEqfBt+Tklz6IdNEDVs0bX/V56I+oKmmoQZRpGsJrx
	+Wty6irZGiwRfet4EnPWLMosDvgwMuIq3rvJlq4NGmvdbCraFxKiXuSFTdBBIDbn
	5VAtkOC+oO8vYwioarlmf5UBWlQv6NlSnbVzELfyWqmMmvdKWy94EOw36AfWDO5W
	WHrBfQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyhqfc0vq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 08:49:30 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-573ac60fcc2so578450e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 01:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778057370; x=1778662170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YH4OPVhdNQZCgKS3VbLo+nyuFWSjcm8vt56FMlPc0L0=;
        b=VfWxnkKUDPPg0XGH3V7PtkggN6qX6vVQxvxaCciKQxnJ4V/QpHpKT17jQBAnNaXqAi
         XiKz0hZVTCJ4XW9JJ3gibLBym+ET+r+h5ggdSbj8O2G9MQVg+s2fvF8UwMDxclzfo+WK
         k/Aka7gK129QOQRkNXp8uIU4QqfqfXS54YGG8Iwka4e3ytyzV+Q5vxZ2LC1sWFKWfDHX
         RixEOT+ADlJ3eKL9wBTh1W2L2MOqm9WPdvFgFXCDpjW+RqzVhpPneCXq2Q+AjGE2YCe0
         jfksdn+68rwJ0MejzJQwIEvNrRMJgsI6qud3c7icQy/97PaXqHwrEZYE0SlHTfjj1yiY
         i+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778057370; x=1778662170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YH4OPVhdNQZCgKS3VbLo+nyuFWSjcm8vt56FMlPc0L0=;
        b=i01XeoHbp887R4IBSXWiEaDmmLViv+fLmUoGMUdPTcOUUUAuLkq3WSzppTSWYse8vH
         Tv31N+52VqWJCP9kjfCRH1irt+KUAJ/a2mXIzrw6Jm41RnM+hJhFk27gfZmeZ23EV+c7
         Yx1VhYNucZLO+M9bjefTlP0ZRYT5wVPrSlUdmK5n7x2+oEqAYxgZXEUC2IFO+63rWaIN
         K0nBp1Z51R5Bs87JkGnmTSTe7ZyDdjuHsuyUrxNIFcWVydGDq8UA/dpGJzcWiNInYFym
         dKN2qmYxBp5bjqBV/FxAuSlayadzqgFpUpu1KWRHfnjQcsOTyHKBQzNMNcKoiWwPPoFf
         Gemw==
X-Forwarded-Encrypted: i=1; AFNElJ+X5uNGnrHBvZoRzJXlDDVYkxhRuyfmwWHJgbQlUOA/XNghEIRzhunlebY7N6i3SIiMH1OuPiH3594qqnHR@vger.kernel.org
X-Gm-Message-State: AOJu0YzBkAC2twNjp9m7X9AN8WM7/2PsDs2ZJLI4PxK8/6C2lW7k/2Eb
	0lG5veykZDGobo//pHQ2pf2tbehh81jpyabcmK+USVMcHVYba3kJlk5diHfpRxjAhPwkDg3WPK+
	aNDcTYQzAEdUOMRj3nEbmZVttLh7/DERnDV8JjCHU3nsKcVDQKAytwQiCk1SPFhpNA9+D
X-Gm-Gg: AeBDievL2Tgwh5oivH2mkDmjTHkIoVJaeP2mhZhCPMsVCommTvz4wEpHeE360hDe7wl
	uwlkXRdLkphElndyPKHQzsb1A75nsvu8RpRFuevJU/wtICNtUUaGU8Lc8eEdk7CHqiw+EX+AoW4
	mdjMB2Vgn/mj+0aWZ0tFAXYyTRBF8x5p3Y9YM7FaboEV3fK8lJF6TRS+BGSsAjUmE5CwJ2nlXFO
	Z6IOZo1DGUZRFg8CBqJ8kXV31leJv8/SijfsL3935aLehVXWR4LKpuzZ/j7ERHEZDHJY/+MTXlH
	BAa9nCg6QWQm8HpV2AGu73ioZEji7uBYszbtBJfxMtAHqRSaZ3nPCdUremZNpjBG68WhM5dX49b
	bCgmm2QPSOVY3yqVGaLLi5jSeY2HO4Hbe4Yau1AmKaMCfQHWi5c3sO0JaKsXPIep9a+MBQpES/m
	Ub7bICPkSXdsJGeQ==
X-Received: by 2002:a05:6122:2671:b0:56f:4a47:6c9e with SMTP id 71dfb90a1353d-5755b4125a5mr189676e0c.2.1778057370372;
        Wed, 06 May 2026 01:49:30 -0700 (PDT)
X-Received: by 2002:a05:6122:2671:b0:56f:4a47:6c9e with SMTP id 71dfb90a1353d-5755b4125a5mr189669e0c.2.1778057369976;
        Wed, 06 May 2026 01:49:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc55b590924sm56572066b.21.2026.05.06.01.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 01:49:29 -0700 (PDT)
Message-ID: <0028dd41-d039-4ef5-a9f7-deb730a05b0b@oss.qualcomm.com>
Date: Wed, 6 May 2026 10:49:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Document Eliza LLCC
 block
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260504-eliza-llcc-v1-0-d7006c899812@oss.qualcomm.com>
 <20260504-eliza-llcc-v1-1-d7006c899812@oss.qualcomm.com>
 <20260506-imported-emerald-quoll-fd1ef8@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260506-imported-emerald-quoll-fd1ef8@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA4NSBTYWx0ZWRfX/h1KRMupP/O2
 qPnkRlmSHy16MdZMtjydgKReTvKwXQivGYy1qIt4CU8PwspdnazuqDyz5trzrDk57Yz+qYunboN
 Hb1T83OU0hJve2rrUDvMaO4FQoKz/qjrieY4HL21LOQ1CNYCEmz93RuhDsga1A2vnCrXVEMd4up
 4rQUHl9EjqqC/BM0jx0OuYJAFYM77hvJajUrOhFapp/teczGRvSyHbDzBuLjpxWFNMEajuSVdSq
 kFyZGZqHoT/X4xktN57ykkO2BWmzXeMaiDzYa3f3wIBpyydLGNG562I5wa6tr6wcZQr9xyGEyVl
 yIWEs905nhYLrwsOcYTetqje2Mc6VTAayP+UNGrPu3fQxbpN027YMofOw9LX2OyEAoiaeashe6v
 rhpYe0Rk9K6+FEMgUcbvAojcx07COkdLOMdNr4GJOXbCsaCOidJaDC1a5/NZDo/ec+5AV2JsG4y
 keEUQZogYZ/tT3LHeoA==
X-Proofpoint-ORIG-GUID: C2BPoMf9WfTAHpvxb6B3QdljBkBP2UrW
X-Proofpoint-GUID: C2BPoMf9WfTAHpvxb6B3QdljBkBP2UrW
X-Authority-Analysis: v=2.4 cv=NPvlPU6g c=1 sm=1 tr=0 ts=69fb009b cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=R06K5KwXynI9bCKs9J4A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060085
X-Rspamd-Queue-Id: 4EBF14D81AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106081-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/6/26 10:25 AM, Krzysztof Kozlowski wrote:
> On Mon, May 04, 2026 at 01:00:07PM +0300, Abel Vesa wrote:
>> Document the Last Level Cache Controller on Eliza SoC. Eliza LLCC has 2
>> base register regions and an additional AND, OR broadcast region, total 4
>> register regions.
>>
>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/cache/qcom,llcc.yaml       | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>> index 995d57815781..90f5a54b76e3 100644
>> --- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>> +++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>> @@ -20,6 +20,7 @@ description: |
>>  properties:
>>    compatible:
>>      enum:
>> +      - qcom,eliza-llcc
>>        - qcom,glymur-llcc
>>        - qcom,ipq5424-llcc
>>        - qcom,kaanapali-llcc
>> @@ -341,6 +342,27 @@ allOf:
>>              - const: llcc_broadcast_base
>>              - const: llcc_broadcast_and_base
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,eliza-llcc
>> +    then:
>> +      properties:
>> +        reg:
>> +          items:
>> +            - description: LLCC0 base register region
>> +            - description: LLCC2 base register region
> 
> LLCC1?

Unfortunately not

Konrad

