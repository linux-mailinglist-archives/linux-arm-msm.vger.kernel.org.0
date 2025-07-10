Return-Path: <linux-arm-msm+bounces-64373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC78B00202
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 14:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 041094A2C95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 12:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DDA627055C;
	Thu, 10 Jul 2025 12:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GvAHkV1D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7372571B3
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 12:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752150628; cv=none; b=p33SJyeD756ogBhPrNK072fCO+8kFAJSXvtMIbyUYDvta8KvQe8g6FVcDaPIUKEr4Q55onm4v7lNU39nXli+08fV3bdi6gP/mmoTr1VdQobGAQv+KQDZfaW39dYkQWwwOLsSkP1hP2DxkVw7oBSYN/xT9TlahiiEAnwM9OpJqtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752150628; c=relaxed/simple;
	bh=WUgGtb3FaJy2c6fVmMZ8K9Seh3fLz4hey9Em2827A1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nDgVC4gPism1QV4XvZnjZeFBt58Ry6Oic68HEJYDAMsN4osAGE1OimeajEbYW42wP7DF/AlJNpcuL/a3n+Cp+TQpf6FDVDFndUuC33CkGRON48ijJ1W6PyXKIG8rb9NgFAZN2DEw3FYcZ2TeTkeixUmVbaL08P6WDoa6a2HxkDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GvAHkV1D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9MJKI002667
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 12:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	15LoABqpDtCIfi1It9cCfUAX1KivEg4wXRkHbkRQbuY=; b=GvAHkV1DbISamq3D
	SKvn1J+QmP0su7Bxm4EJlhWwxpZXQUxUz8hd6Whpr1uBSbNjFoEi7KjHbfG544mT
	OYY9q0MrKi+MF7QoSSz8/JlWKufKbJZe9qRWt2UzP51aSsf37eztDP7DtCehT95F
	LXYsE5ENzw6zBK9LK+CEjqkiJUrCNeGtXHgy2VeQL0Q5dIwiKN6BN2WYVU6rxeLu
	7b/TN2LfiFNmCSlbMLaVKxJfS4xJbO2d64tcx6EVujoV1qGT4bCyXmpoysOKLMQJ
	P+nVEvgTbX7elXBzS7nRRizVw6Z/uk4BkcC7jlEZkcO4iDkujZwKBgKXmQKgcdPt
	DiT1KQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2bg6wf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 12:30:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7cfb7ee97c5so16092185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 05:30:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752150625; x=1752755425;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15LoABqpDtCIfi1It9cCfUAX1KivEg4wXRkHbkRQbuY=;
        b=RF5ShykVHojcuNdoDDS/c4q43MbH8Nq2QMDY5+s+rU9uKtHPaAjtoQtdrE4z+mqo6U
         mRuOY5qPRtdgVxqmmJ9Ot+99oY9XgdO43t7VUkTJ+5JGia9rQ/RoeTnWyIC1WpD4BLrn
         3ycEtyTLQ2smDLNPt+oyDe1iYfKI5zAC1uHZ2DcBv1UCYmJ0nL4iUOUwx55J8UiJ87RU
         8D/RWwqRMcetw0e3Hgf/q0ZIxmOw0gxuezfxx1Y54EyVQJvQWYvfnEZFWxe7fO4OcmwB
         Bn7Drh63IvuqTR38E7Qk3zA2PPVw8Optb2nMvIkeZKQEqb2MaU2EYz8teqMSKPAOKv0t
         mcag==
X-Gm-Message-State: AOJu0YwWZQHlhOWs91mgsh8Ki4Z4s+eZjQMS2xle9ZzwFlZCMsUbBoXo
	klG3noiwQcfLOOnwxQE3MAXJWf5Ik0VcmiKeqXDKklIt46WP62D0XqOxbuSiU5PleMjDVnATkxB
	dFrAJD9kB3ACqY3u5nx8f4VlejEvoHWh9Z9/W4rk/+Fd7pwq7E0uuSTBpqyrHVsOkarzU
X-Gm-Gg: ASbGncudfYtMPLcpzx3+Fp8zMLrPkS4QzoGhBMWU5AXUvpl2Ky/qvb0Iy6h/N+Eq4rM
	WO25SJal0naQf2JV3Q7MzYDEvWObBquxLFnfDH0+ymrOz8QoiyoEI8Htqz2CptcjlQX1CkSUkv9
	iN2Bqri72SiSINnlENWqkazRCoFWozBaEgIIIlcaAqbOZPOd6NgE00S35/qWSolSne61+g/2NzQ
	oPKP+AH/KvX4W5e//C6nGHRfB2lspCOZRXPyH3FqtIMsnrxObTrvtRFmiIQYZqq1uxFnxy67r0y
	p3TTUd7sdeNgW5CiCNevETff1ShPWr9nvbzYTXVdQ+sM+7lnamAQ3dciKwtJ0BUg1rxk48ljVH1
	mXMQ=
X-Received: by 2002:a05:620a:2991:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7db7b32643dmr353142985a.3.1752150624632;
        Thu, 10 Jul 2025 05:30:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsy/uwC8lYDsPl33xS2aWjef2zzPFzxubl0Sd+4pv/iDw2dT0HSHhNS3QAIS3hF+0xe82zKw==
X-Received: by 2002:a05:620a:2991:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7db7b32643dmr353139185a.3.1752150624050;
        Thu, 10 Jul 2025 05:30:24 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8291bbesm121349866b.126.2025.07.10.05.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 05:30:23 -0700 (PDT)
Message-ID: <3604f025-d04b-4d40-9d7d-1f9ce147c5db@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:30:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] arm64: dts: qcom: x1-hp-x14: Add support for
 X1P42100 HP Omnibook X14
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250710-hp-x14-x1p-v7-0-19c10c81713a@oldschoolsolutions.biz>
 <20250710-hp-x14-x1p-v7-3-19c10c81713a@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-hp-x14-x1p-v7-3-19c10c81713a@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEwNyBTYWx0ZWRfXwJxFEO3bDG95
 PHvYjJ078JAGSTUvS1FaogPyW56nUkfjromirlqtxeZF3aoffwSNv0KpAmG+7ytHFfk67n9+Ky3
 NrC8OpiCTnsOk/vFmDUXUP+Kc4YY9ADVVMYsb05AN86J0AvpC3E0i8LzNsbHFhKRnq+0Gd6DDb8
 DHHFOW21H/o7THvA1ebl5SWtVW7xppbTa5ieZlNgti0uBWKVSddUwwg66T+upSZ7JA2iWVdW+/l
 TSgr9myDZQfllpafsGw3zpqnfIonPxoGY4NsY8bAthJiG0Y0sxb6BLKykEOHEbmsJp19hCMWb7R
 I+tCrWV5vMfmQRfllPXBF42SCabTbc5jBbU1wwp+f9+RfPl77l0KNxFjE3sXh9CO5Tm2g68T1tj
 7XAl0QE4z1fMmyHm/EzD9/BGMCJEOoE3W3Ri4jFq0MvDtO/9wHMOukVa7y8OavZFDCmuVllZ
X-Proofpoint-ORIG-GUID: DDi5BB0LAUKp2uITn9aw6ByBGd_icga_
X-Proofpoint-GUID: DDi5BB0LAUKp2uITn9aw6ByBGd_icga_
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686fb261 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=cH6R9-kdAAAA:8 a=gxl3bz0cAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=co6Q_9sMOBM-pvAMSzgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=kiRiLd-pWN9FGgpmzFdl:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=896 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100107

On 7/10/25 12:50 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> These laptops are the same as the already known 14-fe0xxx models, but
> with a Purwa SoC, SKU number 14-fe1xxx. [1]
> 
> The supported features are the same as for the original Omnibook X14:
> 
> - Keyboard (no function keys though)
> - Display
> - PWM brightness control
> - Touchpad
> - Touchscreen
> - PCIe ports (pcie4, pcie6a)
> - USB type-c, type-a
> - WCN6855 Wifi-6E
> - WCN6855 Bluetooth
> - ADSP and CDSP
> - X1 GPU
> - GPIO Keys (Lid switch)
> - Audio definition (works via USB and with internal speakers)
> 
> [1]: https://www.hp.com/us-en/shop/pdp/hp-omnibook-x-laptop-next-gen-ai-pc-14-fe100-14-a4nd1av-1#techSpecs
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

