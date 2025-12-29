Return-Path: <linux-arm-msm+bounces-86847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B583CE6C48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 13:52:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26BB83008E94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E5431D732;
	Mon, 29 Dec 2025 12:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RX4s5zm+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gYRTlDHS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9E431D726
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767012771; cv=none; b=N/yYSVaTPGsyXh78/I8nsiISH9UhlDbz/GrcBjWpDXJHihsITmqSeigoxedLiHyqh0P4eWu1hBJalLD6I7d7bSMAySm0rr+nMFz1TI0AN7PWCadop1+NeE6Jh7j4CZ4DRIRIYlt48naC9ONeQhYgB7tWH/uTtyXfOpBEDpkhYl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767012771; c=relaxed/simple;
	bh=FX2S+9y1O7EhQdbxL8Xp9bmOb57m7OK+YQg26vpKzM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=THffjGI0bfCNfRGFPbY2qzTfPDINhXx76Mt5aII3NMoygiN9UpLMtDZmb8/Chsxxi283sAKkpKHXWAWjPmmn+7liJws+bDM3exoCMlubUnByPZyWSsDWXn3PuduxDBwIJT7qHVVYuZ/nhjcHT/53hrOg1FnOwBkt1Cs/Wa7+pd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RX4s5zm+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gYRTlDHS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTB3rJ43815374
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z5YZGzk9nZ7tIhY+QltZRyj910ujiwNOIKohSHdOipU=; b=RX4s5zm+rAFVKvwZ
	sFVP6qQAdvq4MaKXpDOTQ1U0XB9OoosudqVOQ3LbMYBqIxtX/Db5qu+Z4zBTYgf0
	XA53l6Rm8nrow6EwDlNoLj+Lyd8HcI+KWdXI1gPw6ThIBJIBpDPzDbVA2Id8yZgs
	GxKkd4yRL1RSU54PsY+xKvtNGV7XtC33hijTrLvjK1y7ezY3U59t/m/b+mzynSjt
	tNQw4Ansa+WQWJsGO+Koyz9bUr8dDA2M38Cem8cD7szhnmylASRsx1ftlFKIdeWc
	AdLx5QUSnsezU3bJOfrFuUFHXif4dbYBibNqmI8idc/bSe105fH/y+ch05oRy5XG
	kROejw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbc8yskrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:52:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f357ab5757so41548921cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767012768; x=1767617568; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z5YZGzk9nZ7tIhY+QltZRyj910ujiwNOIKohSHdOipU=;
        b=gYRTlDHSYbK850tMN7yEYaGk6ztIA7alQ74U8PgeE+7wSOnGUa0V5XIX/pWsA+VR1j
         svtudmJhiijG7q0qXW+MKj2+azDL8BJB+D2TRQJiIahmqSYWkAB1M2cInHJioqrx+DHq
         kko9AHLfi7BOldlCfjIEFCpG3vKNeVRGV4XdnX3qazo3CrxzpYHvVGnOD37e3GOAI7da
         0a2phNIU5sdJC+Vbj/HMmUzicSFAqQYU1Jr7Zwof3GanbqUlNtvF0DJ4urI3y6/1Dq1a
         Qb2XnzhqzCLaJVHZIBkcZRSpOE90uxCBdE24lpFclJruXqBmXRZ1P3BfAnDByBIJUsTR
         QjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767012768; x=1767617568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z5YZGzk9nZ7tIhY+QltZRyj910ujiwNOIKohSHdOipU=;
        b=c4bc6JV8fLR0ySZ28+C9XaMjUwTYTv/m4SKWllFF7RV3OOlmBSL1tWyskbBYXLxjz1
         02FbdHdEqsvYo0Crzo1gPGnVpiiHgZK86wy8QwKrxSLyMwix1fBhFh11wFa0LUBlICX+
         oI/KjpIm9QAbZa6w8MJbF5XFwN0cnch+037+IFh8fk9YgyBqm5gpg6Hg7n59773ynBbl
         Q2wUPXBjIUxVzpAvqalzkbVZZtf8MUKjJxdGZ4Of6TMV6uFXob6dUjG6mMwR/6dMUmkL
         PuKTmTAJPv9KMOoj+IBouzauex2keFMp5MVBDe4T49SaGkmJl9dxs4zr7g/AzPgJg5O6
         V9rg==
X-Gm-Message-State: AOJu0Ywj15hBO+KWdjEOpdSwDZ5gugMn64LocFREVGiaC7v85bLLRGvO
	RwIQEZitRbmV0YNM4k4Dk1m0deFPXUDHjlkBMvxw/qW5LWCNTyD3N4HwnvlapL6vne54K24cb9Z
	Ou6HQIrpROax8wRAabegburlub5BI9HppchNUhKcjpZ9kxwK5uRI8kzEmU6xQzReiR4xx
X-Gm-Gg: AY/fxX40K5E//dCa5sB//p7YNW3P8nIPuI4A69WEYnDGVB/ajdg2pO6BmJBM1XH/oLg
	4i9b4AfdVNzvK1y1v/4jpm+Ky+oFdXF6PZ5TpwsjGCIY3aW9/QAiUm7E9EHNyzeFvrkC8TEiLNx
	873J3urnU+/abVDlMLjAFB7y6Mky0unP3ZQIFiHQw27+BEhd19V4I8Dni33WqfGgNLVt++DYBUj
	g/FNdKAVqfxdC+ehS8MAKnj007iSVT4oqJz0oxv9l8RtK6UW2uU6PwdVILtiLXEftC38yTNcK0o
	5dbFqfPE7qBYhinPU7zLxSQ7ET0cK3nhgZAFc+js/FRggGPXHD6Hj7/WQJw7Iby14kqbwLbEcSM
	dcRKhAJ6ZozD2Jk7K4BwYEy55dDKSElV9aRBJigR07F6ZMoYHhSqNIc7KJiVr2QjAqQ==
X-Received: by 2002:ac8:66c7:0:b0:4f4:b373:ebf with SMTP id d75a77b69052e-4f4b3730f72mr232508121cf.8.1767012767993;
        Mon, 29 Dec 2025 04:52:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUB2DUA7lWOGGEW4CKNL5AYC1HMXOq4ESJD3j+I+j9wxhWMR3MOwm+gFw0UaUlHEMU9MFbwg==
X-Received: by 2002:ac8:66c7:0:b0:4f4:b373:ebf with SMTP id d75a77b69052e-4f4b3730f72mr232507871cf.8.1767012767498;
        Mon, 29 Dec 2025 04:52:47 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad8577sm3311144366b.24.2025.12.29.04.52.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 04:52:47 -0800 (PST)
Message-ID: <96f178d6-d772-481b-862b-95580f7bbab2@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 13:52:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: monaco: add QCrypto node
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251224-enable-qualcomm-crypto-engine-for-monaco-v3-1-6073430bbc13@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251224-enable-qualcomm-crypto-engine-for-monaco-v3-1-6073430bbc13@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDExOSBTYWx0ZWRfX2sF0aYZMf9Tc
 Ds3hUFR9r3D90Adb6iwiU4L/0gxiO0EEOE+qIySCHT12qPha+2GsU2GMxUKIPmrpBZLflFn0J7D
 YeDT1zAWWQlBext4UIoR/Kq3rWg0X74A4/Fn3dKze12Q/MDHP1RDRYiAeeyAYhkgkka5P7BjcPO
 KBcMI/nVaDupHRtvkN29rQ8A/uYm2/WrIceFU7NbKduLvebeaehZZ3IRDjkjIodrjSff7wG6XJO
 QOL0EI8p8HQsIJdmqx9OE+psuDqB+xGBpqWM1Bl1+kbSqcV23IN95ABxxci6EHK/T0ERVG0vGIe
 uusvbz0rf0M3YAw7PLNFRVEquALUdzgtDkzmw7PojXHVl4ChQiROlA0Xm9Tz4wKSvKMvsHoDCZC
 nfU3/TxNQnZw5tAC5YBJvjJCkGroh7JWJHP/JMIm/Lyc6Dzloaxk+Sll6GrYYsehOJHYR5YeleS
 hgL1PvBlzDVK4nJpECQ==
X-Authority-Analysis: v=2.4 cv=cP7tc1eN c=1 sm=1 tr=0 ts=695279a0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=AmZ0NeF3L2w1T0tVz1kA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: XWYZQJlVy12pkPH5Lq0KsD-4aE91U2nC
X-Proofpoint-GUID: XWYZQJlVy12pkPH5Lq0KsD-4aE91U2nC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290119

On 12/24/25 9:33 AM, Abhinaba Rakshit wrote:
> Add Qualcomm Crypto Engine device node for Monaco platform.
> 
> QCE and Crypto DMA nodes patch was applied as part of
> commit a86d84409947 ("arm64: dts: qcom: qcs8300: add QCrypto nodes"),
> however was partially reverted by commit cdc117c40537 ("arm64: dts: qcom:
> qcs8300: Partially revert "arm64: dts: qcom: qcs8300: add QCrypto nodes"")
> due to compatible string being mismatched against schema.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

