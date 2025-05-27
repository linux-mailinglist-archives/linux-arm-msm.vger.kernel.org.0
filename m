Return-Path: <linux-arm-msm+bounces-59551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DEEAC4F15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 15:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D197017E60A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 13:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35213271447;
	Tue, 27 May 2025 13:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="elKXw6UU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E9026FD9F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 13:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748350819; cv=none; b=s7rBvHQpSoGApMv4vlcVLa1lQmrZ9/XW+0whadCiJ2bx5X+RsvWjSc+0K3iCfJtHpMbD+lg0Ud5ZSycYpAjmReoejsrZeNydihT7Nwhoj6/qiq49X0DEhi8rbb7iOKkBMB8pYQCbY76TRYSPA45wx2hj5mbGyv7GJggW+xodhvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748350819; c=relaxed/simple;
	bh=Y0H3toatZSjcnlATqS0M3QpJEqMRrCp0mypi2ETlKLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sAfZ+OTxuHB6TU4HShqdiXlsO7zY8vUbbixnyfH6Qup27CnsTmaI6rTbSjNJeTMSw1DRWQJFq/g7NnIdd8SIqVshGhkVZmKH6favy1oAquqAs+PdgFZiyW/mtqdYcDZWgzWzVvHkDkM9gEmUr0kRkq52sbslASWr7UdxMKXoqLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=elKXw6UU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R9YJId001582
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 13:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/oAvyIsOigZeM/MFTaz+sIwKKluMAfH5ZvZ5sMUBPa0=; b=elKXw6UUbTgCao0N
	UdkLZJzsBbkvErTMRRAkzVqqVKOicmIDKZKkDkCW/wsGfzxvzgQh8FMGXLEzBHvq
	FkyYwpf1w2/cxQZ7kB6CnU3uhzRgCJGma8ALzkl+uDplTdg/zJGJBnQM0gTO7ZpD
	o2tAOGI2DgLn75Fc6V8pOZ+vEIK13WnvoI7AOrkE0zST7HHv6DfP44rD1dV3cnLh
	PuiCgCvQB0XJpr+LnM1hIAFWTmlvgLO0bBkpdwVpH++waRQ/DxLqi2m3Ylfm5y/3
	i8hvlD9B1B+2bkZUGvaaNNjYRtnwyMf4ly/wzs51KPcXFWmWFYLTk2xSFVwJWlEd
	U4jm2Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavkrmar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 13:00:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6faa8342503so3545896d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 06:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748350814; x=1748955614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/oAvyIsOigZeM/MFTaz+sIwKKluMAfH5ZvZ5sMUBPa0=;
        b=rK0Cv0wxTeZSQeCy3DDPFTage5DVgpzIlU0aXkoD8bATy+AQf+ZpTRPpyTKnYSmxSu
         IDD8iAGZYbxjfCxN5b69b8aFIJCr7FBO19SEcmfUvcxGwomgbjoJLAgVMSlG4UgZ4uT8
         6gmUTd0Ti+sfpb67sCJfcO6mHp4jZe05LVHTezNe5RHtAjsArCtkXgqmZR3iEKJ+qkvp
         rZRMVMwuuClqqn9YVASlU9asuSGcwPPUZjpSw9fw8jnpC1hiC7kNZTncLNxbZy63Oz5x
         feSw5jJ0iONVB9EN82Jm0M5vkCjMh+L7Ibyqj3UJGGoi7jbXHmBbto0mrHCg3svY50jx
         5ASQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh1yyk1bNShoWCLOjDU40qwT4jwE9bkO83NH3z0pu5poRwc2uv/h5sOvwrMLu2UXCYo+PfClRqxHObX6dZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb3otoZtMvfb/2HyOB2WAcxYCOfHRDpHW+zfaVffG+pop9HScp
	BAumepaD5m5UOcIOgIm2BEgstbI2uZDudnhSvyo52ahclabkkEQj+rPqXOXou6VfQXOHpxffpFK
	1PY4+5LXS04FohpEMr3yYoilQIbOXTanmEEWOLmBhYedJHsvh+z5IC9lc7qjxFMOGjKYN
X-Gm-Gg: ASbGncvFCCnN5W1b8im3PFfGtt7CkNdNCfxGMlhpRNPyBhoq11eDgQ0VoLrLyqjBcq8
	iOJzso7UVTqg58xdMwUqdSKDrpIaybmn9x2bI/aOaQZ4aDth2dZps7zr9geV0HwfxtQLxCk3XMs
	guI7Tfm485g7V/OG9llyp5+015T9CigQ25/LDR8QL3sM8uKT4Owr9PWhYMXFixeLGIJu+6fOkEg
	AeLKhce4O8VQ+D/n0a/4ICN0UMWi+elgWrjTup9y3c4dDWBOuVA8Xgnx30nxi98GXGNM9mhtwZ9
	bDZSy0yPfNA+aM60+NZhrCI3fuftbERMpEqOHM4lB30TOHkgIk6dnRLleoullrSCdA==
X-Received: by 2002:a05:6214:2482:b0:6f8:b4aa:2a52 with SMTP id 6a1803df08f44-6fa9d270dd0mr69690926d6.4.1748350812433;
        Tue, 27 May 2025 06:00:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsd45p7MtHnd0C230nLnbPXANMtphnUoIk2oXFWcsvu53O2hU8bd9xH0/suRkdQCrBpP7nMg==
X-Received: by 2002:a05:6214:2482:b0:6f8:b4aa:2a52 with SMTP id 6a1803df08f44-6fa9d270dd0mr69690556d6.4.1748350811908;
        Tue, 27 May 2025 06:00:11 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-603f71534bbsm4671679a12.37.2025.05.27.06.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 06:00:11 -0700 (PDT)
Message-ID: <7d8c3a31-cba3-40b9-8cba-52d782e5cf00@oss.qualcomm.com>
Date: Tue, 27 May 2025 15:00:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: net: qca,ar803x: Add IPQ5018 Internal GE
 PHY support
To: George Moussalem <george.moussalem@outlook.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
 <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
 <20250525-ipq5018-ge-phy-v1-1-ddab8854e253@outlook.com>
 <aa3b2d08-f2aa-4349-9d22-905bbe12f673@kernel.org>
 <DS7PR19MB888328937A1954DF856C150B9D65A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <9e00f85e-c000-40c8-b1b3-4ac085e5b9d1@kernel.org>
 <df414979-bdd2-41dc-b78b-b76395d5aa35@oss.qualcomm.com>
 <DS7PR19MB88834D9D5ADB9351E40EBE5A9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <82484d59-df1c-4d0a-b626-2320d4f63c7e@oss.qualcomm.com>
 <DS7PR19MB88838F05ADDD3BDF9B08076C9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DS7PR19MB88838F05ADDD3BDF9B08076C9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PnPp4o8_ncahb208f1W2P2qdUwQY9AbX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDEwNiBTYWx0ZWRfX+NuCAqXcZ4wK
 VFwIuK1RDURPfypAZsZrhMEsh6aDggZ0Ms1CYXjWW4QKrs5oRTkr7N0zj5TYtKzAPTM5mPY1NJR
 X6cNHl9TKbnDVnmXiavPkv3S8Kr6FkO6qFSqVhtSU148bf1Lgoo9aypbz9VrdUhWBXHfeaePxN+
 f2f4RUzWzikK1bbljtR3wSb6TgJVItGf1653JdCUA54IDiddcmunLSMJrlF6UeMsq40hs/Mi+l7
 qM+wzVr7KoCZ2FndJkuE0Xu0WWnn21Gf3vcIJ6a1USLXMle38koRpGbQ5zPqLvEiPmM91b9PiUe
 o+PRcFSOvFZGFxZAcRzykRIS3rwZ0g6h1eEnIDGsYQOoQXJ3sozOGVpBeFI6/wSRlM3tOzCeySQ
 nA6uJ5pF7xiSNmmaoEsZdROZkIyxZ9dxnXkXgMkyrV8SRfdUtt6FIkmbA6c9xUWqrESKP0It
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=6835b75f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=kxBOdmaUou3VQMwD0a8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: PnPp4o8_ncahb208f1W2P2qdUwQY9AbX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270106

On 5/27/25 2:13 PM, George Moussalem wrote:
> 
> 
> On 5/27/25 15:31, Konrad Dybcio wrote:
>> On 5/27/25 1:28 PM, George Moussalem wrote:
>>> Hi Konrad,
>>>
>>> On 5/27/25 14:59, Konrad Dybcio wrote:
>>>> On 5/26/25 2:55 PM, Krzysztof Kozlowski wrote:
>>>>> On 26/05/2025 08:43, George Moussalem wrote:
>>>>>>>> +  qca,dac:
>>>>>>>> +    description:
>>>>>>>> +      Values for MDAC and EDAC to adjust amplitude, bias current settings,
>>>>>>>> +      and error detection and correction algorithm. Only set in a PHY to PHY
>>>>>>>> +      link architecture to accommodate for short cable length.
>>>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>>>>>> +    items:
>>>>>>>> +      - items:
>>>>>>>> +          - description: value for MDAC. Expected 0x10, if set
>>>>>>>> +          - description: value for EDAC. Expected 0x10, if set
>>>>>>>
>>>>>>> If this is fixed to 0x10, then this is fully deducible from compatible.
>>>>>>> Drop entire property.
>>>>>>
>>>>>> as mentioned to Andrew, I can move the required values to the driver
>>>>>> itself, but a property would still be required to indicate that this PHY
>>>>>> is connected to an external PHY (ex. qca8337 switch). In that case, the
>>>>>> values need to be set. Otherwise, not..
>>>>>>
>>>>>> Would qcom,phy-to-phy-dac (boolean) do?
>>>>>
>>>>> Seems fine to me.
>>>>
>>>> Can the driver instead check for a phy reference?
>>>
>>> Do you mean using the existing phy-handle DT property or create a new DT property called 'qcom,phy-reference'? Either way, can add it for v2.
>>
>> I'm not sure how this is all wired up. Do you have an example of a DT
>> with both configurations you described in your reply to Andrew?
> 
> Sure, for IPQ5018 GE PHY connected to a QCA8337 switch (phy to phy):
> Link: https://github.com/openwrt/openwrt/blob/main/target/linux/qualcommax/files/arch/arm64/boot/dts/qcom/ipq5018-spnmx56.dts
> In this scenario, the IPQ5018 single UNIPHY is freed up and can be used with an external PHY such as QCA8081 to offer up to 2.5 gbps connectivity, see diagram below:
> 
> * =================================================================
> *     _______________________             _______________________
> *    |        IPQ5018        |           |        QCA8337        |
> *    | +------+   +--------+ |           | +--------+   +------+ |
> *    | | MAC0 |---| GE Phy |-+--- MDI ---+ | Phy4   |---| MAC5 | |
> *    | +------+   +--------+ |           | +--------+   +------+ |
> *    |                       |           |_______________________|
> *    |                       |            _______________________
> *    |                       |           |        QCA8081        |
> *    | +------+   +--------+ |           | +--------+   +------+ |
> *    | | MAC1 |---| Uniphy |-+-- SGMII+--+ | Phy    |---| RJ45 | |
> *    | +------+   +--------+ |           | +--------+   +------+ |
> *    |_______________________|           |_______________________|
> *
> * =================================================================
> 
> The other use case is when an external switch or PHY, if any, is connected to the IPQ5018 UNIPHY over SGMII(+), freeing up the GE PHY which can optionally be connected to an RJ45 connector. I haven't worked on such board yet where the GE PHY is directly connected to RJ45, but I believe the Linksys MX6200 has this architecture (which I'll look into soon).
> 
> * =================================================================
> *     _______________________             ____________
> *    |        IPQ5018        |           |            |
> *    | +------+   +--------+ |           | +--------+ |
> *    | | MAC0 |---| GE Phy |-+--- MDI ---+ | RJ45   | +
> *    | +------+   +--------+ |           | +--------+ |
> *    |                       |           |____________|
> *    |                       |            _______________________
> *    |                       |           |      QCA8081 Phy      |
> *    | +------+   +--------+ |           | +--------+   +------+ |
> *    | | MAC1 |---| Uniphy |-+-- SGMII+--+ | Phy    |---| RJ45 | |
> *    | +------+   +--------+ |           | +--------+   +------+ |
> *    |_______________________|           |_______________________|
> *
> * =================================================================

So - with keeping in mind that I'm not a big networking guy - can we test
for whether there's an ethernet-switch present under the MDIO host and
decide based on that?

Konrad

