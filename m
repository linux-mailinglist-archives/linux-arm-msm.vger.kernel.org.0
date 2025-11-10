Return-Path: <linux-arm-msm+bounces-81098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF12C48639
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 18:41:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0A7B3AC12C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 17:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C7C2DE1E6;
	Mon, 10 Nov 2025 17:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b02Tkkty";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a65FVDfD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AD12DAFD7
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 17:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762796490; cv=none; b=HO7E8nC5zPKEwon/nDCpsnptZ6UmSWGRnY5q+GHMZFRwlB/AnoGALxsg9cWxpO1q8e+PH/3Xleo/cWbDV/wYyBI5avGFI3T4rBsxJUv7kVHTTL5hsRlZ8JhKx7gJ0G/gSBYboODu+dvU5hpfH6hEZe2C//qsPWlmxBXpsumwEKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762796490; c=relaxed/simple;
	bh=9Le+paz4qi0KOoccQ1CPvXK1zLkPjp6aQajuPiFqnnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kaE+LqbLsJXNQi9n1eWuJyosDsA5bTv8I5ExHxwZz6p6LkkTMP3lGAUXgoOHK8tWoyM34CdU/8HSh1bayzA6g5kUwKX2MKYXA2XVI/V4n3Ib9IaAFs2B/WwijvCgHRJUdWB4PSV/PaOP7cpTMQo8XoTpi9QD5D9kw9HPfXubd8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b02Tkkty; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a65FVDfD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAGYMG64070681
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 17:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mah6C/CRdzUeB5dh6iBvU8j/VCs5HqFST+oAymfAr+U=; b=b02TkktyNg8o/kxr
	bjmsfHfAkrPVGAfNwqKk3vsoIjEXZbQTbaMvjUVxneIP6EbZdz7FlQEeo/J4CHYS
	KBUlBRvF0BmcxQJ00X9cZ26AekzHurzKHEZltAv7dqZgv5OsLnCggPFsm6//3vA1
	Ms6+6SRmgXLU2vj+w3RR3luRKOYnKAJKlHHiuBFGq0/s/FRmNzZ5F9qPlXNztwyS
	GUvB3TcBUrPN2cDAtOyHxwJozboeLDUP651wZRThTv21TI/KvkLxlXJ1vtlPSgpX
	W3LonqSrtW2nOjyWmr5X6wSODg3iBsERo57PsxKSPo4+ZyCjsKbQw+zuntie+LN7
	qj8z2A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abkpj87fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 17:41:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edb3eeae67so56376961cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 09:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762796486; x=1763401286; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mah6C/CRdzUeB5dh6iBvU8j/VCs5HqFST+oAymfAr+U=;
        b=a65FVDfDcPnqqfHlbIlfCvQrwIpT+8oB2/7NH2S33ZDzxFfk2bpmWtTcFITJIWvh2I
         p/hcu00wxu3bB7t7j16S99mvumdYKfrDwL9L7Et2P5dy2VDw4spzVViy4vS0LpgjW6TM
         ZrVSF4HhztHrPKDeE5YqLFDrrj+g4T+WFw3wQhQcKTiODzxTReC5q+MjObfghtHA9gNi
         IT1wCRwCM0P0E1gtk+SYly1WVW8VCP0ShwcCiY8wytXZl/bRPo+ZsTIw0pU0M0zbOl57
         wFfLFXAFSo49aUyQR39eJLa2d8TAnqfKPgPpM/+easji61i5EpdxY5ru7AgNp+AEIH/f
         703w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762796486; x=1763401286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mah6C/CRdzUeB5dh6iBvU8j/VCs5HqFST+oAymfAr+U=;
        b=OR/oIs2ADwbSzZi/bGgymWp5jJ18AL/LE6pmbKAO92x2XBJNKZ+KLmIOnahtziEb2X
         amlyC/szVhSmm85XCamJk021nd+3BA/abj6HznmjVkqSUzOM0k7Yaf04mvfMRx9Wu1K7
         FXcKbfvSpmrI1BR4p18/fLyrFoJRMQuBxhGu+3kOb+ZSBd/+qhWzMwSmUTVn2W3jK+av
         DfZtFCrwaOcDWCGKMuHyNmM846yM9VARJQLfhXPTPCzphyxDyKmRlnOkP7gZrRykuATd
         xAqg5Yr6KqDAOi+JEIDWFlAJfHz18sgTQ+iiGP3kzpSshotHv0yUZR4Krq1YbLPKVqdN
         1HCg==
X-Gm-Message-State: AOJu0YxAIKrnhjlHTIZp8XnScKnW9P8ZeiOKwroLs8oGAF9n//lbEpoZ
	E5O3IgfUJGsq9YbQKHmzv+TPEaVnj4jPU2HCkFWZ3baxMYtVn+rnapo/+nnc7DuzRu/HoZSw7GL
	TFBd9vL0G1t0qXpkMxcyEtv3IEX4L53orCWSrxKddc6ZrD7tM5YE5Jz7byozTaF2wdmuh
X-Gm-Gg: ASbGnct40dPvvQVGD7NuL66NCEJdVI7pGE7rtCjuwE8DG/beqNTLGr5n1q+m8ylCWsF
	h7rkZxPmGA6+wJ7LsufzEUsQeeHDz6SxnclqjbfsRuMFZsw4IfE7DYCcSI5XfsUMenD0bFoIy1Y
	jZ4Wj2r4BAdpnW60NrfHm2uuP6GWU0U2oRLdLIVOj7kA4llBMMPI2px3NCG3N95sjVpSPsNK/o7
	3jHP6ZfsYLmE5ct4i9Qsn/tLPBU5MTBvBSZXDKiYpRSAjmfCrdQLr2DM2fPjdoPi0bdYKQPbHMC
	T68TekftJozZq2IEXOx07AFFEdqyiONdh9YjgchiYWDZK10WgFXsaKginH5tTUK/BS7RIx739mR
	g0nSCbiEp+3jynDzFytctwZE5mg==
X-Received: by 2002:a05:622a:1354:b0:4ed:2164:5018 with SMTP id d75a77b69052e-4eda4ff3014mr115756931cf.80.1762796485726;
        Mon, 10 Nov 2025 09:41:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBDppgSdzr6FUv3e8RZ2+x7huTFbm7O1GvcAnVaSz7ySOqdi82vnRrM1dsCoHtV2ZgDo/42g==
X-Received: by 2002:a05:622a:1354:b0:4ed:2164:5018 with SMTP id d75a77b69052e-4eda4ff3014mr115756511cf.80.1762796485263;
        Mon, 10 Nov 2025 09:41:25 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42b2b08a91esm17816756f8f.2.2025.11.10.09.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 09:41:24 -0800 (PST)
Message-ID: <d17548bb-ddce-4d60-8dc4-2c0633989299@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 17:41:22 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sdm630/660: Add CDSP-related
 nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-0-895ffe50ab5f@mainlining.org>
 <20251023-qcom-sdm660-cdsp-adsp-dts-v2-1-895ffe50ab5f@mainlining.org>
 <07066c46-4121-48da-846a-3a180d245589@oss.qualcomm.com>
 <47b40a91-8365-4431-9fd9-1e48fad2a4e1@mainlining.org>
 <a3cb6633-1595-41e7-8e87-ca48a98f822c@mainlining.org>
 <83c3aea5-764e-4e60-8b16-67b474f19357@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <83c3aea5-764e-4e60-8b16-67b474f19357@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: g-0hX5Jli3AKlH03lqAd7tHl698rIC6R
X-Authority-Analysis: v=2.4 cv=GZoaXAXL c=1 sm=1 tr=0 ts=691223c6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=cjWOPvm4Lta6hPSZL2YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: g-0hX5Jli3AKlH03lqAd7tHl698rIC6R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE1MCBTYWx0ZWRfX54up/2BZFRjg
 GObBJapu/XPe2NARogkkO2XfPnPP7M4EbkJWBGf8H9L6++f0+iIhQV1U6oNRnETD3cwr+8vSBWW
 VBgY+OwIqTRMUwDHmdBYhNnh0u2doGf7fNCOoHGFto30EvGJTGsrXlLqZdV2rBwTmy+RG9ZCmpr
 ylkuyugLzn23hZPCFLFDcPfv1IlhPEDJEw2K3wmKjspASq9SuwJH7vRCuVXC2TDcxyWrm3vRqds
 X95SOJ4M5KS57PpZdz23mF0xsDP2cmcPhrEYA10bX1IWmPuNa2zmKfdsAR8TENxW5xIsocYX6T2
 ruP4bqyWQOU3YwKMiJqb9BlWHMmjXQElhFaxBd10sXshAAur1PHP9trgDzpJcsrJRJ0xtERGFV6
 7hhI4uK6WSMPcFeMP48joaAY8twZGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100150

On 11/3/25 12:52 PM, Konrad Dybcio wrote:
> On 10/31/25 12:30 PM, Nickolay Goppen wrote:
>>
>> 24.10.2025 16:58, Nickolay Goppen пишет:
>>>
>>> 24.10.2025 11:28, Konrad Dybcio пишет:
>>>> On 10/23/25 9:51 PM, Nickolay Goppen wrote:
>>>>> In order to enable CDSP support for SDM660 SoC:
>>>>>   * add shared memory p2p nodes for CDSP
>>>>>   * add CDSP-specific smmu node
>>>>>   * add CDSP peripheral image loader node
>>>>>
>>>>> Memory region for CDSP in SDM660 occupies the same spot as
>>>>> TZ buffer mem defined in sdm630.dtsi (which does not have CDSP).
>>>>> In sdm660.dtsi replace buffer_mem inherited from SDM630 with
>>>>> cdsp_region, which is also larger in size.
>>>>>
>>>>> SDM636 also doesn't have CDSP, so remove inherited from sdm660.dtsi
>>>>> related nodes and add buffer_mem back.
>>>>>
>>>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>>>> ---
>>>> [...]
>>>>
>>>>> +            label = "turing";
>>>> "cdsp"
>>> Ok, I'll change this in the next revision.
>>>>> +            mboxes = <&apcs_glb 29>;
>>>>> +            qcom,remote-pid = <5>;
>>>>> +
>>>>> +            fastrpc {
>>>>> +                compatible = "qcom,fastrpc";
>>>>> +                qcom,glink-channels = "fastrpcglink-apps-dsp";
>>>>> +                label = "cdsp";
>>>>> +                qcom,non-secure-domain;
>>>> This shouldn't matter, both a secure and a non-secure device is
>>>> created for CDSP
>>> I've added this property, because it is used in other SoC's, such as SDM845 and SM6115 for both ADSP and CDSP
>> Is this property not neccessary anymore?
> 
> +Srini?

That is true, we do not require this for CDSP, as CDSP allows both
unsigned and signed loading, we create both secured and non-secure node
by default. May be we can provide that clarity in yaml bindings so that
it gets caught during dtb checks.


However in ADSP case, we only support singed modules, due to historical
reasons how this driver evolved over years, we have this flag to allow
compatiblity for such users.


--srini>
> Konrad


