Return-Path: <linux-arm-msm+bounces-99299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGRGMkpPwWmhSAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:33:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 695CA2F4BDD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:33:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5717630C722B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E0036F414;
	Mon, 23 Mar 2026 14:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V7m6fhkh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ctsmWKx0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C031FFC48
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774275734; cv=none; b=WtyBW6thvqAjeQfTeR8fzpv3prYU/pCYFZpf1zsbPsl5acdo4+6WOzdJ+r8nZvNALTXdE8PJYEB+ZR3dYdLJvTtd0nQE8xI0GctGTPXPgRfChbqYkQQFY5XTKXTo6JdXXwobKoq6AZW+at07Kxz5iosnIaW/N0QNKAV6gBGmNqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774275734; c=relaxed/simple;
	bh=ZIwcBR08KQRI3Bbl9QkLiCLGBKt1gOJpWAfzxrEQMF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A51bFx54yv3csr5O99fnWBzrFtnw8n//SJsqvsr72JZo3SLQfxeDJ3I0F5pVqZys0qjIMbFN0V9d46W8/cB0HrJmjJGxCI8r+JaR6tugb+txtA77mGBLdWuLpWvoMNJ7VggQdfh9T577PrZdiv2fdrfaY9npZlnaDlksfIZP2EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V7m6fhkh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ctsmWKx0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NDTdkX1176062
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y8geuoF5cnxZsGhRX8VDQUP1Hp5X4OKz0d1AP/2GTWQ=; b=V7m6fhkhD5tRCWik
	FgC7GqTkAB8bbjQluvuwiqeT/u6a2LjsthH0gYgHRRqtaZ3UtIO+i039dOj7ZKo0
	xABzbvJo4V5rkwS0A+evTD+kcUyYNb3qO+OE+oNh7/omq1iO40/W82uh7cC5+iBf
	wm3BraqTaz3sUxpMYpR/A++26hZkT75zpkmtBIWHX7jUIzYoofIaRO74w7/k73x7
	N4TeXKc2EwiLvlCOUPyeE7afxo7Dxdhvss6RrL9NMdrFK850JKk+CemW0rDxuuAk
	/NeCvEkQvQW9JYbqyFKsl3daMQoJuTDyfODsGgEGxZYUuMHPmzRDguEsPqaxCvRm
	t7Rv0Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f086k5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:22:12 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ffd797184eso416908137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774275731; x=1774880531; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y8geuoF5cnxZsGhRX8VDQUP1Hp5X4OKz0d1AP/2GTWQ=;
        b=ctsmWKx0RhzRDwnzs9x7IC9TYYAArIyTliGTkjekRFT7i7nwWJjd+5Zc7H0nwYNiYk
         B5ymlJwTwiFp9WZ2a+zcRka3Pkso2X8ATNvKB0wlloKObU5+QPtuEJ6SnY7SpDALRJ4M
         25MzEnSrPdjs3DNY93hh0FQoYueZhtHJUYsMuk/yDNUMgI4Wn7bGMqgpM5PIA96oZdn3
         Lei98U0mBOKGClhd1G7epV7cAiq3dLD0l9Ir97W6l1pZn0cvDWdm7fDDz165W2FAs10s
         T0m0opD3MvTnxokRMV4QHtuBEfNs4FtNdZGrM+jYdV3jKNw4CELE3WX9j+DNcLfoiPh4
         GAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774275731; x=1774880531;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y8geuoF5cnxZsGhRX8VDQUP1Hp5X4OKz0d1AP/2GTWQ=;
        b=KulggH3qiwhTrIFSL68iSpCaGVaRuu5PRVLnlmOWIMMSf7b3SdGyY2Z1rHGIPj4ugQ
         InUuA2ITsPpD8nJbe72aZmqAj4J7/1JGrtsEi2l/nkFNN2bdoxKqkgyslGhsVZpIFMAT
         Fhi0iLte9yR68eK2iP069Ql8kEVf8J5tzDYkzwzqN78jbh6RZpHfJwF4qp66QpLcLeki
         3JehcznbJLlCWNx9ZjMcEchAOskO7L737mfpG9usJ2MoXt6Y9cctQdjxhiauwtOxEleP
         0IGKjI4EpvE5HmEceKi8eGALxI2LDhguE/4Lkqa/ZOHhabzeQ/7HS9PZCgeVqJa6jVhT
         AMRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzUZRk0A0ZOwtmAsCJKUVp1jKGTLkTRPwlUgCsjkwrGq6mU2DEZG8L2glVqj/5srTKPQsKlThIjX/X35gv@vger.kernel.org
X-Gm-Message-State: AOJu0YzXgxWq6AtiZbVRwgtv/i2a+8P6tjbOU2FMEdWEWSVKnJx/lMik
	uXK2NQ5ctg5FGOfMWn8pMN3RWN/jqD4oiqbsZ/XQKKAZ22CMd3HR8EKBQXWv6Qv/S85DMR899YM
	Cd1ln+aLkErePfBRMAo1xWWv02qCyqW/ZxredBF+IFMR/au/oj7annxpBpf2ZmeHnm19+
X-Gm-Gg: ATEYQzzyCT4rHrAIMzz3o+HcyW1pHL4GY0TpXbeUWsRhsQ8KQHVCIGQ5al7GCP9Hgcw
	AaS4eEhALMbpcS85fAO5tV5ML5iJ8Ti6Y+4KnvvT5JMJdzoq2TmNBq4+yypCw+qbsB75BGVM8wz
	DmwIjKZ99L0IobNncdiHNQI6xQgjy0+2GopG7zXo/KR5TTP6FWbe2sZenbmKGwHCt9lW0J/g3Uq
	Btbln4aylOujyezMANQ9+8MQ8LaqhhYhQH69juOOFMOb1+oqPT62rFP3i6YYKaFF7xLHLuBvY7H
	t2nYRw1pC07xGwNZ0JqmuNokTcGAJuRMAxcCQzNCo5U1LKB9OSnBc4ATvIPtaf2yDoqINZyS2Gc
	L9SzvgHcIeRpXx8shbdP2NGpLACmivkH6x4pB9CVCDen9s8ODmF169plUlyuc++d95H5tlud0kb
	8GP80=
X-Received: by 2002:a05:6102:214b:b0:5ff:1d91:a4bd with SMTP id ada2fe7eead31-602aed25467mr2030564137.8.1774275731360;
        Mon, 23 Mar 2026 07:22:11 -0700 (PDT)
X-Received: by 2002:a05:6102:214b:b0:5ff:1d91:a4bd with SMTP id ada2fe7eead31-602aed25467mr2030548137.8.1774275730725;
        Mon, 23 Mar 2026 07:22:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668cfdb4659sm3947962a12.13.2026.03.23.07.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:22:09 -0700 (PDT)
Message-ID: <4b1b5b79-df37-499e-99c4-1a965a9b2455@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 15:22:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
 <20260315-x1e-csi2-phy-v4-1-90c09203888d@linaro.org>
 <3VqSGUgMUKaCja5WYOrOP8nJ_mw_eDPdItA8d1CvqUg4ASPS5IUc_aT2E-XIo0YmnYo8QltXVw8_6NDxtdqGGw==@protonmail.internalid>
 <5705b48a-fc24-4c5f-aa6d-40952f0070d9@oss.qualcomm.com>
 <edf766b8-2664-4dac-b626-551807b3e5ef@kernel.org>
 <4afceefe-8053-4c10-8595-39dab9379aab@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4afceefe-8053-4c10-8595-39dab9379aab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c14c94 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=i5-LN24KizBMwyz_CxMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 35aIGqsvSJnxJAQu_uGa95K_8t0k2gCp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExMSBTYWx0ZWRfX9VmkfPbXumQ2
 5+u2RWITLX0V7xqipP6J/kr2H2moFzlefiIUKZT7z+ZPW0EAEokcW1Zy/bzAap6DonzgmocYc0G
 DylHDVGLNbKDB3b/o/7V5wa50+zlS03dXP8dYZlcJ3INynAyR3wN8b8Uy3bow439iaiINH2zJwx
 NXFMDl3hdmGJXN/t14mFIFg9C/kCWNatjDZOfvMl9lAdI5fXYGiHjU+f7dHxpxutL1GfjxbWCpW
 nSeaBbK1OHmtQhBFv4Zz3dHY6RadeXfim7jDoT+sikTtplhQV4UUWtFdYrhebV/qERsOz4oe0Ig
 E4+b9XCP1wR47HlSEN7FTHLK9ft9SSnJyPmSiQtQetM6GDMIocvyyWKEfhU7BIylBk/ye0D2OSZ
 0DsPBvBdJ+J84Is0VhV3npC6yw27aeZkRh0uVRpdKLv5CaJyEcdkeLXaY+n5KNTb1cYg0aq3jaf
 h4V0OXT9tBGi0o+tY1g==
X-Proofpoint-GUID: 35aIGqsvSJnxJAQu_uGa95K_8t0k2gCp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230111
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99299-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 695CA2F4BDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/17/26 9:25 PM, Vijay Kumar Tumati wrote:
> 
> 
> On 3/16/2026 10:26 PM, Bryan O'Donoghue wrote:
>> On 16/03/2026 21:31, Vijay Kumar Tumati wrote:
>>> Hi Bryan,
>>>
>>> On 3/15/2026 4:52 PM, Bryan O'Donoghue wrote:
>>>> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
>>>> PHY devices.
>>>>
>>>> The hardware can support both C-PHY and D-PHY modes. The CSIPHY devices
>>>> have their own pinouts on the SoC as well as their own individual voltage
>>>> rails.
>>>>
>>>> The need to model voltage rails on a per-PHY basis leads us to define
>>>> CSIPHY devices as individual nodes.
>>>>
>>>> Two nice outcomes in terms of schema and DT arise from this change.
>>>>
>>>> 1. The ability to define on a per-PHY basis voltage rails.
>>>> 2. The ability to require those voltage.
>>>>
>>>> We have had a complete bodge upstream for this where a single set of
>>>> voltage rail for all CSIPHYs has been buried inside of CAMSS.
>>>>
>>>> Much like the I2C bus which is dedicated to Camera sensors - the CCI bus in
>>>> CAMSS parlance, the CSIPHY devices should be individually modelled.
>>>>
>>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>> ---
>>>>    .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 133 +++++++++ ++++++++++++
>>>>    1 file changed, 133 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100- csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100- csi2-phy.yaml
>>>> new file mode 100644
>>>> index 0000000000000..b83c2d65ebc6e
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>>>> @@ -0,0 +1,133 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Qualcomm CSI2 PHY
>>>> +
>>>> +maintainers:
>>>> +  - Bryan O'Donoghue <bod@kernel.org>
>>>> +
>>>> +description:
>>>> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sensors
>>>> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PHY
>>>> +  modes.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: qcom,x1e80100-csi2-phy
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  "#phy-cells":
>>>> +    const: 1
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 4
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: csiphy
>>>> +      - const: csiphy_timer
>>>> +      - const: camnoc_axi
>>>> +      - const: cpas_ahb
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  operating-points-v2:
>>>> +    maxItems: 1
>>>> +
>>>> +  power-domains:
>>>> +    items:
>>>> +      - description: TITAN TOP GDSC
>>>> +      - description: MXC or MXA voltage rail
>>> Would it be better to provision MXA or MXC as an additional optional
>>> power domain? I see 'cam_cc_cphy_rx_clk_src', the parent of all CSIPHYx
>>> clocks, need all three power domains on this chipset.
>>
>> I don't think this should be optional. Have the dts point to an "mx" power-domain and then select which one is right for a PHY MX/MXA or MXC.
>>
>> Your worst case here is some future PHY which has more or fewer PDs which is then either a special case in this file or a whole new file for that compat.
>>
> I think it is the case on x1e* as well, Bryan.
>>>> +      - description: MMCX voltage rail
>>>> +
>>>> +  power-domain-names:
>>>> +    items:
>>>> +      - const: top
>>>> +      - const: mx
>>>> +      - const: mmcx
>>>> +
>>>> +  vdda-0p8-supply:
>>>> +    description: Phandle to a 0.8V regulator supply to a PHY.
>>>> +
>>>> +  vdda-1p2-supply:
>>>> +    description: Phandle to 1.2V regulator supply to a PHY.
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - "#phy-cells"
>>>> +  - clocks
>>>> +  - clock-names
>>>> +  - interrupts
>>>> +  - operating-points-v2
>>>> +  - power-domains
>>>> +  - power-domain-names
>>>> +  - vdda-0p8-supply
>>>> +  - vdda-1p2-supply
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>>>> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>>>> +    #include <dt-bindings/phy/phy.h>
>>>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>>>> +
>>>> +    csiphy@ace4000 {
>>>> +        compatible = "qcom,x1e80100-csi2-phy";
>>>> +        reg = <0x0ace4000 0x2000>;
>>>> +        #phy-cells = <1>;
>>>> +
>>>> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
>>>> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
>>>> +                 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
>>>> +                 <&camcc CAM_CC_CPAS_AHB_CLK>;
>>>> +        clock-names = "csiphy",
>>>> +                      "csiphy_timer",
>>>> +                      "camnoc_axi",
>>>> +                      "cpas_ahb";
>>> Although it's not a concern from my side, just want to be explicitly
>>> sure that everyone is happy with the clock names, just to avoid any
>>> changes later on when other modules are separated out.
>>
>> These are the names we already use in CAMSS so ... they're good enough to start from.
>>
> Sure, FYI: Dmitry, Konrad.

I'll admit I haven't yet read up on all of the background discussions that you
guys had on LKML, but *if* we're going to put the PHY under camss, the GDSC and
CPAS_AHB/CAMNOC_AXI_RT references should be unnecessary, given they're not
related strictly to this PHY itself, rather it sitting in a specific corner of
the subsystem that needs them to be active (see related:
https://lore.kernel.org/linux-arm-msm/cb2430f2-8601-4c72-af6b-10f1ff16c188@oss.qualcomm.com/
)

For the other names, I *think* we won't need to rely on them (i.e. only operate
the resources through PHY APIs from the V4L2 driver) and can come up with new
ones. And hence I think we can turn "csiphy" to "core" and "csiphy_timer" to
"timer" (because we really don't need to repeat the csiphy_ prefix)

Konrad

