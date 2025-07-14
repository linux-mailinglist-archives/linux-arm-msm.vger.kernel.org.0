Return-Path: <linux-arm-msm+bounces-64845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15256B04407
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 17:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 874911673ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 15:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26D525DAEA;
	Mon, 14 Jul 2025 15:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p7U+IPM9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632E6258CED
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 15:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752506778; cv=none; b=lSQbQ33MFJa0EkIeNzSOxzVDh0DGX/JmSlO6m+RcRm73cAG7L3jjBSECj40Wr5WOP1cYM+HaDSk1el+5o+yVmjLywukjaEKi6PmNnASl3S/bW2RhqSuG3f9s0sHCQT/a2o4mcCGh/eb0p0/Nyy7BuPh1iCUq/61TZetS7Akqm9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752506778; c=relaxed/simple;
	bh=vF+3oIvR9G4hKNt5aFVVvJYF/1g2cRUpSfW7rhM775U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jYEvccZtRbIATot//KTgpozuUexJoM2T2twAIHyZFvOiTzRWKGaW7E0yV4IsQP/ETlnCJ+U1G8CSiVuRJNG1I9NK4crM4cm/rJZJGKDQanVOToyru7fiJIDlJD4iKDtjbaOisbil7vU4VWBGs4tE1qB+hBU/FiUdnzHcMbWOGgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p7U+IPM9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E9iaCt000723
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 15:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P0KRc7GaMj1tOTzPOduI20ILL8jxHWMuo/B1S/LPmPY=; b=p7U+IPM9yFev0Ztr
	7fs7/0q1vy3dqA4l6r/cM7wp+gal5U++3vS2iDY0/d3oK4ipsOnMvheV5Jwh6XKL
	iehvLY6jz88N79HW+sbrvn4tV2Z20MGCCcQ2VOgH5OnO+e423lm7Xt2pD9M9ZnNa
	zuz6bDDtey1v4Y8x1CDFwlta6y4+s1ZK0G7Idk+nnKe7UTpwOe7oky7Gu9yOJ+8y
	XDGCKnNq1PM0pm3lyUYRHPW5WrAsnZsOdfIWXDnSVdApEqjW3IH0dV4SxhwlDUs1
	MsDJVEUReZzX4o6qgKyPFwDkiTDnGU2gpmed3RvB2iYqO8IDzts7dD5o/71u1RwW
	XlV/Vw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ugvmw3jx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 15:26:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fabbaa1937so15743326d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 08:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752506775; x=1753111575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P0KRc7GaMj1tOTzPOduI20ILL8jxHWMuo/B1S/LPmPY=;
        b=T+VUJW5fsZhTwl+UPEkqaiv4/nPpJXZiBjYpj56skFvcIjoh7MxqZJPmA62Y9upDIi
         TovcR5VlSzhWnzx/y7LifdHTmD7VUhV8SmtBjqOFT9lFnffgQqf6SYHYNh49nxclaRKX
         jBEp7j21hLSBLLpuGVH/7YUSCM7lrkKnRIXnNZyR7NUBkuECBumULseZUIzZlcTm8ZL2
         0+1dsY056WieTOJ4lpWO5qefXjVyMOB52fa2wlf3y97z+ClyYDqJKbrYXZ6RGPDGKCO1
         /bDMxhhGcJ4sLO5wN3dXTp3F5AxLlwf+3qdWkLmjEtFvwuNHe7LSgKXcLajCR8w+rWVR
         WNsg==
X-Forwarded-Encrypted: i=1; AJvYcCVKXaN5QqP/vPR6mUyTJe7aI1Pu0k4/l9CIqtOo2UTyZVk8JOvu965jg8Z6Hl22f4LZi+4EA6Hm0tXxFkvY@vger.kernel.org
X-Gm-Message-State: AOJu0YzSIyBdnQf4WrO1Z/F5kXaZPRUK52maietjy8fjHPumtS1aPYXh
	LtLCkDRi6URGLMZ2TieH7R4ArW2EuEzzwb3BdC8cnlJpWqhEXWnnoX3Gmb8fjS2lGLJ0+R5+LYd
	zYNJ1E5cLEVsnezXYebMtQ4Bn+GvdlssNqYA/+SrUE4Y/FvR4SnouJSN2FgVG2yexJn+U
X-Gm-Gg: ASbGncsGbeOFkOjaaz1wGmsGJSNthCCzKV4IU8f+iLdrIdsMuJ5s/lxyHJB37sAjN/8
	jnC6f+HiuVpAK41o4GIhi8/RR3WGTHwJNllxnl5FdImTqBWOPao6K9g4f/vDXvMIxrLEcx4nofp
	rMTWeaPBo+A2YWRaDDvXs6t/r5uck8Jn1+l0Ywt9tvecDNYeATIjlQOWRTorIXiBnSMO+4IXjqB
	YI5aJgxhbbudWJTwYabMQgDxxwRVoncsLgU2kkDbMk2gc//b6kuLj9tvZR2bsK8HWkdypID7Mf/
	0svgTiyTAQm1whiCxIdHHs3PRTqeek9G907QMXGTKad0z16qV0BaxyyQKVmLFAO/1v6eoy2dIx4
	5ZNbE418imeoSP9ieMXC5
X-Received: by 2002:a05:620a:4611:b0:7e3:3001:b055 with SMTP id af79cd13be357-7e33001b554mr110228885a.0.1752506775094;
        Mon, 14 Jul 2025 08:26:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX6IBsdWI9mVsEHLZqT+fwHbjjGKMDEgd6Hp1+Vyy78VGrEJC5/M7BkrDO1voksLgqSiIbnA==
X-Received: by 2002:a05:620a:4611:b0:7e3:3001:b055 with SMTP id af79cd13be357-7e33001b554mr110226885a.0.1752506774578;
        Mon, 14 Jul 2025 08:26:14 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294b7bsm838033166b.136.2025.07.14.08.26.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 08:26:14 -0700 (PDT)
Message-ID: <dd2754ee-ce89-4335-9974-6df4b612d3f7@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 17:26:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
 <11b573d5-ce4d-476c-b94c-216d427cd838@linaro.org>
 <08261aa4-689b-4d6b-bfd2-221c1976d254@linaro.org>
 <a7f64b31-4767-4281-b452-a2bc5351d745@mleia.com>
 <c93624bb-ee7b-45ac-8b53-b5391f11c9c9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c93624bb-ee7b-45ac-8b53-b5391f11c9c9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UC6JfPua6o54LmBFuuo3fyLUx-WpRBK9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA5MiBTYWx0ZWRfX5cMIzuonfqXJ
 9PorVFEGX9AKE5X66Wbik1XhjcC0spbgrKxYuGOUtES9rvPd3AIV8sD2Q9pW+5cAz7HxLZh/hSQ
 DpYC8vCYIPqNorKXsBfrclDSgO3eHeUi/W1gNRBhOKIsaXba3i0Qe+z5GYJy24Kj5ys58dsiCxX
 xHrJff5zW7CjX2i/lY9uqJQ5yKpeoQ/1B8JM9eN5HzlVbZ5nlL0/2Z3b9SC42XcOH8oOAlzHFKS
 fPd1Yl7gqzNZ9ubPjHER5GwGfSHgi6KKS4p+rfNgAfaKxlQiP7Exw4ac8uyVUwAeOFQLvIilivE
 c+MPjvFn5/lVTj/My5yGHEfACPX73ITV5W88hukpm2oy0gaVPIgjfY52yRaok3jEqMKL/JRWDJO
 NhUYI6B5ZM1LhTYbZUmCbf0vZZTLNk/0keAgnL7IHZCfJgJ6/U1wxX/zc5DcatXcFJ6+aU21
X-Proofpoint-ORIG-GUID: UC6JfPua6o54LmBFuuo3fyLUx-WpRBK9
X-Authority-Analysis: v=2.4 cv=C4fpyRP+ c=1 sm=1 tr=0 ts=68752198 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=IbGhK8io7uJmbBfgTJ0A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140092

On 7/14/25 5:17 PM, Bryan O'Donoghue wrote:
> On 14/07/2025 15:58, Vladimir Zapolskiy wrote:
>>
>> This proposed device node scheme does not solve the known and already
>> discussed technical issue expectedly, namely there is no given way
>> to describe a combo mode hardware configuration, when two independant
>> sensors are wired to the same CSIPHY. This is an unsolvable problem
>> with this design.
> 
> I think that is genuinely something we should handle in camss-csid.c maybe with some meta-data inside of the ports/endpoints..
> 
>>
>> Sensors are conneced to CSIPHY IP blocks, CSIPHY is connected to CSID.
> My understanding of best practice is data-endpoints go into the consumer not the PHY.

At least in the case of USB, the PHY's of_graph includes signals that go
through said PHY (so HS for HS phys, RXTX for SS PHYs)

Konrad

> 
> These are PHYs with their own SoC pins and voltage rails. They should look like other PHYs in qcom and across DT, IMO.
> 
> ---
> bod
> 

