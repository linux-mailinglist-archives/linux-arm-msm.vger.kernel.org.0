Return-Path: <linux-arm-msm+bounces-82110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F067FC64511
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 14:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id ACE1028AB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 13:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FCE8331224;
	Mon, 17 Nov 2025 13:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="npchoSXv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SBiuEzkp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD32F33122A
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 13:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763385460; cv=none; b=ZbRrDwVsmALvQKKg+9lCHt/EigftY1wqkzsh/Jz7TSwR/mcp+TFlrwISpdfSz4klRxzWH3CuFaYk4WMBThajp9/ULs5Wa5WlAH4+iY7yP1wdm3DnxhwvnnV+U+HNIA45ygo4skA58xCAv53R3NHBZD2kTWTgvnvN/Y9quF8d99c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763385460; c=relaxed/simple;
	bh=z4ZROab1mYkAYQld7RzOsFvzNp7oO5KlNsbMZyjCVeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N1mkvAK4emhr6+7lckCj1ZFCdKArqPYoXjPUoRoKOnjtcGQ9mKvkbCX0InVb4mk+rNU4q2cGzhiInJs6NUsdRu/9Ht1Ac5yym9zte9uuD0lPFEGgOcleJjjkLOaOFH/N6ToRP6/xWTJpHQruFnG/Pc0qcRi3BSej/+ITZCJNr+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=npchoSXv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SBiuEzkp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB79qX3040296
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 13:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j44ylhKuuAPOnY9WEvRElr6a7/um9df0rTaBqhJeGYQ=; b=npchoSXvsP1Otf1F
	pf5aboAcPUbQ1z27kgDdF7/HjxVU1GmMWb88CJOFCbRD23oXfkoQ14kQugtewmpT
	sVxXDuZqLkEdLuXVhWABourEVj0CZABA6XJ2zd1E1IpyQbmvws/I9e+fjMDFJ9fC
	PBQQweeN/fcpbD/x5gDcSge/oi6ccIKdMT25ElhvnC5vkhU9qHH5wgdS3RcTprVE
	CqhvYG3fEzvI772acukr2CqqgZFhgxQ0hOIDJoUhsxR/xlE4WQORH4j4kbUFiVq6
	+OGOZ/qsuFysLzlMf24ewANr56mQNpeh45wWf6S5FOo0wawQpypDhtOfX/oP39SJ
	4GxDqQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejh04tqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 13:17:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee07f794fcso6332461cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 05:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763385456; x=1763990256; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j44ylhKuuAPOnY9WEvRElr6a7/um9df0rTaBqhJeGYQ=;
        b=SBiuEzkpbyP1uUT3uatldIjzSNPZywwW92X9ZK0SOVt149J5bNcv5fAEKDjx/USyls
         SrOTjHlJ/F8YpiaBzTVehhH73IuVE93KVvvL7ZAed6+KsH4B4MdD66etZ86S1+OJmDrp
         Stgtp+HDCXe8g97hbO7K042J2Xh0B4r2H4j2crAr0daWfpN9ICUZxQiYASmmIlRCNm+l
         KnCZnOPdMqQnS6SO7wYNI1H6Bh0e4/VVy0DBu7EBcM56EAuZt42T17rTZGLoQWjZlv/8
         mg/2vwREkKscQvSZ8ghz2qbQp0oqzaHgwolw3rm+1jMkNF+Yhs/nIG/3gisIQzC0SNzF
         /ffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763385456; x=1763990256;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j44ylhKuuAPOnY9WEvRElr6a7/um9df0rTaBqhJeGYQ=;
        b=f/0fc8fAnVWCqJALLVPrH3zZk0Xw01c+Tb9EJho6CjGJNWlHSiwl/d4fybsxaqT1rT
         HzZ1parO5jOthFtV7kZ2G40Pnsao+Nj+xqQWkhH7qJMeIPfDDV+Ps4wS+JWovEllfipj
         lUe1PM8PanvcUHBA5SjZFzYgS6R1GRNe/Cig2SIIxco8Brxt+Bvu7HsaXPt+V/2uIoGE
         i9YrvVLzX1y6PZNBB//MSm4FHNA7vv/Ko2ZCQYHdWMLrCY3Si2m76xjXWHaXi/Zm7c3g
         riY6GPYYJm/f4aj5uZUbhfqYUmOMhSzlxFSnSAcoj7No8YnYnvVJBjYcxNGVJf7dTkBI
         Bhjw==
X-Gm-Message-State: AOJu0YxKdjlAVc+z1S2e1SrlcQnbCFmczVTY97B8AdaeeQan5mvr1v+7
	cT44OOICpteBpvDPyBi1cXuLcfd7CZjEIxuWJkLa3JHRO8N01eSFfQWEnR3KLRLnB1oy1I/vDzB
	ivJVdhUeyVtyFZFdE61LseVkApt+NyWGoOvheWJ3b3DQrUctHJZv/XRms3OGtkhLP4gjc
X-Gm-Gg: ASbGncvVru8hAGZnP2FlDzFa65Amy9Vj+Dix9FVtGTpbeTnNNBTZdMquXIoZFqjdAVI
	JKi/iMk8i5DXqaYJJYncDL7T1pVvBjLv4lOkeB1bj3IF1PQg3CtYFJh1XbytOhQyXhv1MI3nGiR
	qtUj578pXFBdWCZANhl7PpbfJ9daH309Z6i4Cy+w9zjBk6obOj1EW3RUaLxa9YlrP50/YeGQHp3
	/POZE5Ew3V920tX58i4Wn/kHG1gbfHH2Jf5fuSpVGAOFoKr884gxW8qJWQFFIuNFT8z1qdpO1ri
	DIpZOuY2R/PjfGpWYjo/3XywE1etQv7Far6KiqpofmDlrv03WQ2f+iSmE1WUCljX+aH+ZSHRkJf
	x+qiRkBcuojPllOpGyerTxsyx46Qdb+TfkzKWzfd7oWpdh8jzOJ9O4jSz
X-Received: by 2002:a05:622a:508:b0:4ee:2339:a056 with SMTP id d75a77b69052e-4ee2339a1b0mr23977881cf.2.1763385456056;
        Mon, 17 Nov 2025 05:17:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhq5xYRIF/dlx5FG74BJMXsqCZt1aKaaavlwANc+WTo4SqeiTk8R+b9G2v9EGU3U5jc9UZdg==
X-Received: by 2002:a05:622a:508:b0:4ee:2339:a056 with SMTP id d75a77b69052e-4ee2339a1b0mr23977401cf.2.1763385455463;
        Mon, 17 Nov 2025 05:17:35 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa80e3fsm1096422766b.2.2025.11.17.05.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 05:17:35 -0800 (PST)
Message-ID: <3c0e994c-7484-432f-b3b1-bc7523d27242@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 14:17:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] pinctrl: qcom: sa8775p-lpass-lpi: Add SA8775P
 LPASS pinctrl
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        ravi.hothi@oss.qualcomm.com
References: <20251116171656.3105461-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20251116171656.3105461-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251116171656.3105461-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W9U1lBWk c=1 sm=1 tr=0 ts=691b2070 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WETcAnRWB3L6IxRwBe8A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: xM0Yc_MMpVUOnO1KjUZwFXr9w88ytenT
X-Proofpoint-ORIG-GUID: xM0Yc_MMpVUOnO1KjUZwFXr9w88ytenT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExMyBTYWx0ZWRfX3lSi/IeJp9QC
 YhpQr5Nm17/7gwNd7egTLAlKQlyWhYK/WX7uvTbX5L+1sIuR8z7Y+RDDhNci0zraFBFgoetTkE3
 j1B/fpjySubD4vqClGcbHUrUI5ix3QL34vBDFSa5puWhiMscEkbqZ/j7FKaPGJa5uXXdQjDfI6K
 o4uXRYGRwaK7oPEszHUIblZIqXmxxhIxRHAsLq5Y3whBNvXZ3z8zGVQh6el5QobpMOAvPirFSu1
 Ogfcgile1DGF9t2bSQ+YoaxNd+wNarMLJdMhF2GAZDRVJ4JWMEfuMzM8sqrrXMflESQ2v7X12d7
 iCk0skMEblb7WwohY/u6Hvd93lAvfVEtuLBNsNnOmBMKWa8MwzjRR5LrZ3fR3XGVmi8AkadI0hJ
 GA/1FRsGkq5E/p27yMfuYAX2g+ij3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170113

On 11/16/25 6:16 PM, Mohammad Rafi Shaik wrote:
> Add pin control support for Low Power Audio SubSystem (LPASS)
> of Qualcomm SA8775P SoC.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

[...]


> +static const struct lpi_pingroup sa8775p_groups[] = {
> +	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
> +	LPI_PINGROUP(1, 2, swr_tx_data, qua_mi2s_ws, _, _),
> +	LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
> +	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
> +	LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
> +	LPI_PINGROUP(5, 12, swr_rx_data, ext_mclk1_c, qua_mi2s_data, _),
> +	LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _, _),
> +	LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
> +	LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
> +	LPI_PINGROUP(9, LPI_NO_SLEW, dmic2_data, i2s1_data, ext_mclk1_b, _),
> +	LPI_PINGROUP(10, 16, i2s2_clk, wsa_swr_clk, _, _),
> +	LPI_PINGROUP(11, 18, i2s2_ws, wsa_swr_data, _, _),
> +	LPI_PINGROUP(12, LPI_NO_SLEW, dmic3_clk, i2s4_clk, _, _),
> +	LPI_PINGROUP(13, LPI_NO_SLEW, dmic3_data, i2s4_ws, ext_mclk1_a, _),
> +	LPI_PINGROUP(14, 6, swr_tx_data, ext_mclk1_d, _, _),
> +	LPI_PINGROUP(15, 20, i2s2_data, wsa2_swr_clk, _, _),
> +	LPI_PINGROUP(16, 21, i2s2_data, wsa2_swr_data, _, _),

The max slew rate value (shift) here defined in the register map is 18 for
this platform

Konrad

