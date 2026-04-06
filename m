Return-Path: <linux-arm-msm+bounces-101948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGxfC/uf02lVjwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 13:58:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B37E3A32A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 13:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61C553004C84
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 11:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49ED0333725;
	Mon,  6 Apr 2026 11:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6LSHNcf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i8kmUcg8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9C3333440
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 11:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775476725; cv=none; b=U23Plcx4onDCmr02Sp+t4hvwxXEF1al/t8omIzprILhQYp1wiIhQgAXHlwgwalU9TkQtJs2Xffhf5sl9yRapEHw11t7o5/biPJ+hU74lrln2vuvg6xHhwyOEovD3acww9Zr3Y3XN9m7EDZkMqguy7ChEbclEE8M3QRaK61QS/4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775476725; c=relaxed/simple;
	bh=sdulTfIZGIJEqWel6l2jvDouPMlgJ9AyuDVKH+29ZOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n0OwQbqGSYOlGLYqLYkgfSx5IpQxMEN7YXyCeQkZ0YvtypOsVDBLAq5BD78KB730RvvrpQyawvZKgcJ2Hlxes0i6jjcYhPJtWdZkM8LNz5kpfVNFTAz4LcLxUhKLynz4w1HOgriNJ1g9j5QdSz6YyrbMRB3aHXqMbgxOUd/67a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d6LSHNcf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i8kmUcg8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6369K55N3457449
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 11:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FN5ZDjiy2FKrMXgecdzRkxCIor0XyXBcB50swAm+tV8=; b=d6LSHNcf5MechMlj
	hbUY4xanFyVAIBTK1y1NipuQ21zvyafftD5BWhVkJ8qJfrwcAX5gII7hW7R5c1Fi
	Fi+pGiX+mtD3olTjIyVGrf3sBXohRPBm21iYEksTmPrMes6lshgiI9SSSkpZcAXH
	60XKjTwEsDam8LU/zOhEQ5/VkPlWuLpUJZrQ3B1b1d6LrhawplxFIf4PbKx4QGo5
	U5Bfvi4Zw4dwF5UTzHfqWlHUHB2QqkjFSpNm6YRbsrMLbJPIdwnwS91+5P+z6DHw
	obvCqCrY7AqFzvWWgvC7o4VIrUnMD+O3j17aL9YpnCERr29jk0NCU/vp+QcFqVCq
	ShWwlw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daskrn6dt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 11:58:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82a80fb4566so996142b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 04:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775476722; x=1776081522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FN5ZDjiy2FKrMXgecdzRkxCIor0XyXBcB50swAm+tV8=;
        b=i8kmUcg88kYmLqDmoY5Ha5L5VyAYHqJK8yHENG3jp8ql4pw6qYHNiNAFXQUi0W/Q5g
         dgEsEi6bsim4lIbsEmaOVsAfKep8UnxTntdvRd383JFBkxOjicaDhjE3+XtAOeKKeONm
         e2Wuhdq/fRB4ktF6bOOlakagTBBMi13X5RTecnmdxIePmdwTeemq//3Fk8hHhwgXl0C4
         /OZQ9TpiMEgXCzs9e0G8klCdUOMaCHr/PQqpz5VEveV1fEx4fklaJHjpfr2cWaNWH2W4
         luTsAU5wLe1DQdQpJYMDv+KpsIzsE7CByL/N2maHrmyy9vF1/sDGgKq8Viz15E62M+u5
         wHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775476722; x=1776081522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FN5ZDjiy2FKrMXgecdzRkxCIor0XyXBcB50swAm+tV8=;
        b=MTpGaW8JE22G2VIe1OdDEl4qv+YvLTULu5HiKBKJAAYcDvrvfH3YzL+sYCffw0yvm5
         DqJCAzfkaPmUF+ScWxwaqFKwsdtf0PeW2R5R7zXWp5ALJTt+MBWzct8bzwOaCRCcSrPc
         OslG+71LhvFtDoKNOdDBjyIMRV00fKO4qpK2iAnQBScIjAY42Y64rRCURnsF7JjU56XW
         Z9XARhh0Qy85jpkRyy7wN57VwZG/uSPbcB5VmxLQLF8QZmuOO2sIta3+tl+jN3VJRlS4
         pqignqlrrWMKn/1jOI76PtjLLcQh/xLJE/3OEio/aXZ7f4eMh5KI7juBGa6VsANsHtxs
         wknQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfKz/MRdcyhDvzZKxANw6zSstbzoPsnkSqbC+QOEwM0fSQagqpH1sEYKEFbe0SUo5U2th8cTWRKA569vnp@vger.kernel.org
X-Gm-Message-State: AOJu0Yx723promMkxoLNBFxkBQooTVscSI1/f138ckQnyxt0YEUj279m
	2fN4Eg5qdU8nIHCSeqvE9lTxOTbi2HXOhokEBy94wdaBoRjGX3ImOKfc4l9/2fiNogn4L12y9/N
	4E1MMC7SnozBTwHNyWiPpUpw87qnG6VuOcGyqjXzSVPLpj1mZGWcz9TMD0HIqYQQTI2s9
X-Gm-Gg: AeBDieuP73h3uV8CwMYMdzKTXiBzqlNcGZPuTyjH0S6FdKBRFvH6LXwT5RNP5+HExP4
	kF4u8vVCNrJ/bID+4xUvK6libiJbhtU/F+eVgGVbCS3fBQZD3QVwbMTim57IR8OVZIJTMTqcgYC
	qvMrkDo2QFieuotmk+2UzwOE95lCYEyV3TBdZfdSM2+uURYMBXVvUsbxj5Rb/O5I6l4xEoPa67B
	lie+eR1HTcML4lTyUtDy9GsXZc/I9YpAZ9fP9lLz+N3HwfsxKaMcm3D5dPS72J6K/Xr65+8qDsS
	OoH8Y+6JMWNRpxpWEWUYfWQghrhm8fYkOXsVsTPhBDzX0NkHVCTerxvVOeYwFZYw7qZttklgIfJ
	+wUUzCErFEJGtRFpcaSQoABNU4NURJBOnEyflSirAuL4Kgygy7Q==
X-Received: by 2002:a05:6a00:6ca8:b0:824:3b85:ef89 with SMTP id d2e1a72fcca58-82d0dbb0736mr7001324b3a.5.1775476722511;
        Mon, 06 Apr 2026 04:58:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:6ca8:b0:824:3b85:ef89 with SMTP id d2e1a72fcca58-82d0dbb0736mr7001311b3a.5.1775476722026;
        Mon, 06 Apr 2026 04:58:42 -0700 (PDT)
Received: from [10.218.41.33] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c4387esm14889588b3a.31.2026.04.06.04.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 04:58:41 -0700 (PDT)
Message-ID: <8f79000d-ccbb-403c-871c-7a36423c9eee@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 17:28:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add monaco-evk-ac support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260401-monaco-evk-ac-sku-v2-0-27b5f702cfba@oss.qualcomm.com>
 <20260401-monaco-evk-ac-sku-v2-1-27b5f702cfba@oss.qualcomm.com>
 <7baeajhlqv6ujiqzmknjw3h6qr4mdw6qdywhaczm3c42pzjiue@nsgcbd4jsba5>
 <0f2612b8-5c44-4934-a625-27a66eeb7bdd@oss.qualcomm.com>
 <zyarcaimg67uivssnm4uxqiwc2jadolf5kx6moycwlbzhg4gmv@xa75wcpotzpr>
 <4d32e86f-353c-4951-89ca-46aa49d60f76@oss.qualcomm.com>
 <7r6373fo56alzqa4e2zzdnsgwfhgdkmbhxe4cvdo4p7fg3zren@eyiml4uedfbn>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <7r6373fo56alzqa4e2zzdnsgwfhgdkmbhxe4cvdo4p7fg3zren@eyiml4uedfbn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Xpv3+FF9 c=1 sm=1 tr=0 ts=69d39ff3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XEdbQUFsqSG1udmAHCAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: NKPspxiRSIKdLnKlqk_5fNVszNtPzDaR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDExOCBTYWx0ZWRfX9zCmWXMGLopj
 mOw4Q4BYlzwB8nLi9hWXdCMEdLQUEtX0G3mj7HbwbV2gJOAIPzbno+g4BcvMb8OlH8oNJzeHSF7
 Q6Y8b1dsMw2st5sBJoTelN+ebfBwRHnHmPE6UOWBwIDiRAmLep/nkCnKc16nu2Jl0eKs89kCRbl
 er7wVn0Lad/hCppQJEX7btZmdLQ4hiA+YWe+vRoc0W108R4U5oDAwmHUAYOxKe+S4ip28Ejy9Ry
 XL468QYaGYMQB4T44RwPyY4S8ixCD5tYsPTOeuHLcYmJbCCkg1Q/VvHo6hfxtyzndEh2BNmKVZp
 NHqxKmInN+GK2NvnYFRr9ssDMt3l2264fWINQ0Fv/7X0pn1Si2hqAEnYcqI9JI7H7pfd66gsykc
 QEpzPHPYJwsg5JT7LeOo+fpYLqRwkOaU6sdpg+tprR5ME0wsnTq22Uqpa+IMWp3+XNrReGRtSvq
 Lg3c7pCR3YmfDAb35mg==
X-Proofpoint-GUID: NKPspxiRSIKdLnKlqk_5fNVszNtPzDaR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060118
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-101948-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3B37E3A32A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/5/2026 1:09 AM, Dmitry Baryshkov wrote:
> On Sat, Apr 04, 2026 at 04:15:54PM +0530, Umang Chheda wrote:
>>
>>
>> On 4/4/2026 1:58 AM, Dmitry Baryshkov wrote:
>>> On Fri, Apr 03, 2026 at 04:14:28PM +0530, Umang Chheda wrote:
>>>> Hello Dmitry,
>>>>
>>>> On 4/1/2026 5:06 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, Apr 01, 2026 at 12:14:42AM +0530, Umang Chheda wrote:
>>>>>> Introduce bindings for the monaco-evk-ac IoT board, which is
>>>>>> based on the monaco-ac (QCS8300-AC) SoC variant.
>>>>>
>>>>> If it is a different SoC SKU, should it be reflected in the SoC compat
>>>>> strings?
>>>>
>>>> Monaco‑AC does not introduce any S/W differences compared to Monaco SoC
>>>> -- All IP blocks and bindings remain identical from S/W PoV, Hence
>>>> haven't included the SoC SKU in the SoC compat strings.
>>>>
>>>> Hope this is okay ? Your view on this ?
>>>
>>> You are descibing -AC as the main difference between the kits, but then
>>> you say that -AC doesn't bring new software interfaces. What is the
>>> difference then between monako-evk and the -ac variant?
>>>
>>
>> The major difference between monaco-evk and monaco-ac-evk boards is that
>> of power grid. monaco-evk requires 4 PMICs (2x PM8650AU + Maxim MAX20018
>> + TI TPS6594) to support higher power requirements of monaco-AA variant
>> of SoC which supports upto 40 TOPS of NPU - whereas this board
>> "monaco-ac-evk" supports 20 TOPS of NPU and has lesser power
>> requirements hence 2 PMICs suffice the power requirements (2x PM8650AU).
> 
> Is that the only difference? Is the PCB the same? Should we have a
> single common file for those two variants?

Yes, the major differences b/w 2 boards are:
1. Monaco-AA version of SoC in monaco-evk v/s Monaco-AC version of SoC
in monaco-ac-evk board.
2. 4 PMICs (2x PM8650AU + Maxim MAX20018 + TI TPS6594) in monaco-evk
board v/s 2 PMICs (2x PM8650AU) in monaco-ac-evk board.

PCB is different for both of the boards.

Can I restructure as below to avoid code duplication ?

"monaco-evk-common.dtsi" --> This will add/enable all the common
peripherals of monaco-evk and monaco-ac-evk.

monaco-evk.dts --> Include "monaco-evk-common.dtsi" and enable
monaco-evk specific changes.

monaco-ac-evk.dts --> Include "monaco-evk-common.dtsi" and enable
monaco-ac specific changes

Does the above file re-structuring looks good ?

> 
>>
>>
>>> Also, from the naming point of view, it is monako-ac-evk, not the other
>>> way.
>>
>> Ack, will change this to "monaco-ac-evk" in the next version.
>>
>> Also, should I change DT name "monaco-ac-sku.dts" instead of current
>> "monaco-evk-ac-sku" ?
> 
> monako-ac-evk.dtsi.
> 
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>>>>> ---
>>>>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>>>>>  1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>>>> index ca880c105f3b..c76365a89687 100644
>>>>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>>>> @@ -918,6 +918,7 @@ properties:
>>>>>>            - enum:
>>>>>>                - arduino,monza
>>>>>>                - qcom,monaco-evk
>>>>>> +              - qcom,monaco-evk-ac
>>>>>>                - qcom,qcs8300-ride
>>>>>>            - const: qcom,qcs8300
>>>>>>  
>>>>>>
>>>>>> -- 
>>>>>> 2.34.1
>>>>>>
>>>>>
>>>>
>>>> Thanks,
>>>> Umang
>>>
>>
>> Thanks,
>> Umang
>>
>>
> 

Thanks,
Umang


