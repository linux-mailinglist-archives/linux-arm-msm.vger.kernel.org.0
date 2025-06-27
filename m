Return-Path: <linux-arm-msm+bounces-62808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C74AEBA61
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 16:51:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B1447AABB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 14:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24BC62E7F20;
	Fri, 27 Jun 2025 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="epyDyZSz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809A62E719E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 14:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751035869; cv=none; b=ecGasyGF9otBZBeBeGQjt1fjDYTDllHtEUAdbvOV/YHvv21tPIFFVuNuF2u34eFnhKpQncflN4YkN6wnGVfjWLSQHTn+58t6sMz58tp/J0Q4ZVoYHSWSyknTqMFZIRuZ5QamG433vOTrML9e7qVqPLp/LqSiOiplSzXEULRCvGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751035869; c=relaxed/simple;
	bh=7rtraUnuZEglIw9bM3jvt7JTU0MMScfXHqqtKcchIKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iqKY1y5pbKWNOkdzVS5M3hR3BXW73qcPdpMYTax1fZm6C16qGH7htKyM0c8qKySsCFgW5c7lvZEPq7m7jIfBS7N9PUL1LC4p5sZFk8biJKbLRbHpE51FTCu0110aqWBQe38SdAwoZdhC3Yu1tBCXI0Wqti2ombR6/ej3CuNSUH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=epyDyZSz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCIo3q028698
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 14:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7rtraUnuZEglIw9bM3jvt7JTU0MMScfXHqqtKcchIKk=; b=epyDyZSzyFl+MJZf
	VvTrWRZwWi+CJrg4dBLVr8AGET00Udrlwr5ChES4CENzsHTPyZdBKPD4JsXXglmR
	/AfeHOHbg3nAmIBV60ucOmyWysINbAAXOUgbzaqM6duhGmOnqvL+wdCyG4Y2Q8ca
	pSHmEJk8SB6igGgoCBHNAx/E2cUHluoxLCpq3i+XjGSdhv6AkpLSmFfkl/cV4zwz
	eA7jJgsde/V/c0JrgcIqqtXogfhc4gmStUQl0mIxDgeGYa1S4OtPIvuMkmneYunO
	GnIDkBuG3WaVPtHMK/oYmOGt17T5FQRzBeTK34DC5nIvdiC4L9W2y+bfMWDgXFTx
	Eu7mQA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa50gea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 14:51:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3ba561898so24400485a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 07:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751035865; x=1751640665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7rtraUnuZEglIw9bM3jvt7JTU0MMScfXHqqtKcchIKk=;
        b=VnEZQhu0XBAPdA9yMcysv6yI3fkRW9W9ImWmkh0flLrqy1HBn//trN/p5U8RXrZzDC
         MtuzOxyQg/e1mq58EFGEMJiJE9zi4b8Kbrp4HRzUXO3BTin5GvQyth46NwcLnpbkZnwG
         ffjR3lfKG/cSrENLqUnIKLM46iuudSsh3/ciPjzZxaNAAvJzEGXULl3OKqY5w7WnlU2/
         SSs5Ovamjdi88f26t+zSbXKyS6IziMNASDJX4n+uoTPu3GfVjoWAftKg1NVr4FyhbXR3
         Qy4HazEa55xdpidswiAn13plZDO7nz6kvTd0vICTDhfx4aoracIXME74+CxR+yQC1Uqi
         phIA==
X-Gm-Message-State: AOJu0YwB4J0TAZ3YyahQqBdeSv3nIVenZM/hHMRLDhoQP7iCmeybpI+B
	eSCzgZymKunOIjmxxwVJzbOO/J0vYPIssklj5PUGJ/CO2PVc/vp/uwXab+fMFZjJFcLgR9/lyG6
	i05Y859BDb9KoZntxYg3MOPaRaQEqjiGtipgmMKQcHmMn19xvETU0Unbcvbp0eF4zteES
X-Gm-Gg: ASbGncsFp5iC5uNlaVwtGI6omLQpcsU8rN36xuTxRrC5AZNBi9/4YaTou2ezX9R5nfZ
	fBzIXNxg+vSBSNg7HTY142pFX1IwUm2jSzKRxu/bvUngeRhcMcc72bt2DVMixD8EbFNokBe3wqr
	KAfH22vsn/HwnRp8zV0UJXqG2ifCOQrkl9LEWt2QLyZ0jKt/3eR0zrIB74HuDcBRMjK1n4CzBLf
	lmHnkvaj9FI6pxp/tGZbTRO8TU0/wGQ82017mTcLLbTBaGwZf40e+vXyT96muuwc6WfXVVE99ij
	SfHYpQEJEvHFYUMGDkskvyS97x30V6edqjw6tH+pBcCKQEpFxVH64I492/crqeSnJuYlsL+VlvO
	EUIA=
X-Received: by 2002:a05:620a:4390:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7d4438a5772mr187162485a.0.1751035865309;
        Fri, 27 Jun 2025 07:51:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNBrqmMSfnZF56yQ8HHV8zsPd591TqWYeI7+RBqNhUzZBbf8gF6QKBgxQqjSPo5Eech9fVsg==
X-Received: by 2002:a05:620a:4390:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7d4438a5772mr187150585a.0.1751035861886;
        Fri, 27 Jun 2025 07:51:01 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c011desm137341766b.101.2025.06.27.07.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 07:51:01 -0700 (PDT)
Message-ID: <25ddb70a-7442-4d63-9eff-d4c3ac509bbb@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 16:50:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sa8775p: remove aux clock from
 pcie phy
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jingoohan1@gmail.com, mani@kernel.org,
        lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
        johan+linaro@kernel.org, vkoul@kernel.org, kishon@kernel.org,
        neil.armstrong@linaro.org, abel.vesa@linaro.org, kw@linux.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, qiang.yu@oss.qualcomm.com,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
References: <20250625090048.624399-1-quic_ziyuzhan@quicinc.com>
 <20250625090048.624399-4-quic_ziyuzhan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625090048.624399-4-quic_ziyuzhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685eafda cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=flLoF9dUt9D-64fZ2z0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: BgrCrWBi_E4UBiaeYl7IJpdbNyZkdQL4
X-Proofpoint-ORIG-GUID: BgrCrWBi_E4UBiaeYl7IJpdbNyZkdQL4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyMSBTYWx0ZWRfX82IvbzDO47wD
 UuQKVYb9E8Y6iLfNn3O0xx/aO0E3yEKWwfZ/OX3VWjZxpJaRcFm7H+4t6hJZvZKcC1ZyKu1lMvT
 PuJ4DFVQk1uKRd2OV6JeSHHskJY7CxQpkkDKzf0YZbJMQHJMf7e39j7JXlF+tUKEgP8X7/tuCcM
 Gmywj5Eq3xpK5Jhx7t9+2uZ6h400fwxwwZer2nOi5G7KzDFCXLYbOncfAzw8Q/1KRYzOTYr1V55
 y+odDqJJU1uCm1w37WBqXW6qL26Thj18iL3XPtc432QDZuQS6iG9WrsXzz9sDn9OKxbcFEn76Jy
 pSBzpYjgRUqY8STsyy5ufwhhbxIpUi+UaICtcBIInUbdUOnd9Ae1U3haxhTTo5W1Py8Bijo7P8C
 xFBSpaPDVthS0+ZMejkfHPINpHTM8wnLdSPVEdTbN476PPWA9bVPUAyKbluJhADBI8wrFFYT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270121

On 6/25/25 11:00 AM, Ziyue Zhang wrote:
> gcc_aux_clk is used in PCIe RC and it is not required in pcie phy, in
> pcie phy it should be gcc_phy_aux_clk, so remove gcc_aux_clk and
> replace it with gcc_phy_aux_clk.

GCC_PCIE_n_PHY_AUX_CLK is a downstream of the PHY's output..
are you sure the PHY should be **consuming** it too?

Konrad

