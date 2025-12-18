Return-Path: <linux-arm-msm+bounces-85687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BFFCCBCE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 13:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 476BD3021758
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 12:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8DE9320A33;
	Thu, 18 Dec 2025 12:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i5WubbSa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TvmLKRR1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73EF33033A
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766061413; cv=none; b=MdMQQiaPR//dEmlj8ZEwsU79R5rgoFaUXyBMEi0lN1+klou86V88IrnPemsWxKGDBqfCw2iAFkoGXC56MPcnUEsazCqUUtpuUys2E5LuRFUQ5V1NUM+TDvVvT0JFBpg1RkZRbutdUFoT6bPaGdKKpEBqWOEGDLkgnivu0+SQUl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766061413; c=relaxed/simple;
	bh=QnSNkHZMqSocCnOOSd2hbilQvo79VjEjtlT9JqsJZxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cVIex9nPT5mF1L5KAjxqXA4/JQ2Djpx1op9JaBVD6NuIeItdKcvthoSFJJKRvYA5iUFSrHrmPqtMv6NkhmYvRg9eH4dvQI8o7wwZMY9ZlHsWSfhVHc9QTVjqzfFzOcc3oUPC285NFI0uOwoPorYA4PQcS2fi8HeOTH9gPGFXkdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i5WubbSa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TvmLKRR1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI98geD4057276
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CeX7zdkTKzUgYrUHEXvo1kAjNi9I0TyGt1y+5V+nf5A=; b=i5WubbSa44riyiyl
	9Cr7zftRPg0APa58lJPGyB3kZhakWN8hPhnLrAfeAtESdi12ku0Im9fs5tSHGAcw
	mlypYhdThrD++/Rwkd78eUMroJrwudGs4C3oxvHmJ3urkhwpRDWiVu5Nh98c48/6
	hf9IX2GAGhBClL1nbnmLzTvfjNJE6EvKtHC93nkSwtYikMFH9iILehx+tntQhGRa
	pJHCZ/yxV9Tv0ithUDFwqoPbLGWOz0jM2ChKFP/Pc4noli3JpzrjRmeefdM+hqQn
	EizDmsCzK4RpeRnTxS6JfCmWSXHJ2JLLNRDcyOu6xUCebviJUSpRH+BJYraqR+tU
	6ycJNQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3xr5bk64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:36:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ede0bd2154so1327721cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 04:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766061410; x=1766666210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CeX7zdkTKzUgYrUHEXvo1kAjNi9I0TyGt1y+5V+nf5A=;
        b=TvmLKRR1IBwYbVC5KJ2iEPPEKstu66d/3Jpt6jqDQ2MGHOZu3jEZJgYjAgqTYdrh4p
         WiDJQyMdtiOtwvR+7WZFHDAWKFB9uy73NoBaaoq/m0nWRTfELQSAD+d7IJ9aidnFOPP2
         hik2pwjs2LCv52KV911rJovbyx/qTG8g7ny8Q5oUiTEw87/+UVf0OKXL9COIaao8LF7v
         wB1FTWb3Fagkvu7Skovb4kgT4gZrMZqh8FnKqv7NA/HV8vxmwtThF3NPjjgqqa9OV1Q5
         3+M0Vpq8I1TtK7iceIlyRpcuKIJXNHmUCWXEkXF1nU1Hw1NC4hYl5lMP67Z75MxjBAe0
         jTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766061410; x=1766666210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CeX7zdkTKzUgYrUHEXvo1kAjNi9I0TyGt1y+5V+nf5A=;
        b=covBqMqvLDqbHh3f+RdRg5KCE2kMf0kCVDhm+ZWSKpHWW5RjC2HitYVES37C00q41b
         DFkjvTHtKAdYnXjGRwwH7IX+tBpf4IHxcVPSoXqT9YEvNfd3KrF8M/90Khi/6FPbb2ux
         V2lhfSJNGce0N6Gz5a2WJqj/uADFlA9FFQIsg0goPJtMrIBCSHxHSHdlBJ0kKwFRyIdw
         xmEL/pDHfzUpCMRrA4Fjx3koL3p0L85Rg3zfPhtVdkYEPpsCmAw5ncNbBgtgNlo8Vv6c
         5oow4BN01MnBG/DhDM56+iDJrhgztsL481BUhmEWquFYqkga+Ugbm+w8c+h8z8VnaGCB
         pjKw==
X-Forwarded-Encrypted: i=1; AJvYcCW127NOjbo2P3rgv+Sp9f2cBWrFLnjXOOs+7X1wcMA9Iad0W0L34Zsr0cRNmh21B11o3e4ya4Ht0Ag/sMHV@vger.kernel.org
X-Gm-Message-State: AOJu0YxXOnmprTgdUXtgVtuFqy3UvTJe6bKmCSVdQQsPi/WShMSyeexg
	7Qd8JQttCH4IId9ssUa3DvFSm7QEs7hEO31whOuuYBwaSRlSHw+Ygw39PGlCSmeftCXAkPh4tZY
	FbkGtX3oYBHjT+o9IqlxQhiu+p1+CmpK7B0MLoV1UTxXFdY8TC1bdG1r+yPtWxIs5S8qW7tv92A
	Ha
X-Gm-Gg: AY/fxX5vbHio+SNPed49Uo9OHs9jb/Z+r1WRzmk8FhxBUsBnmih8uN09mihRsabPaCG
	AqLUCQnlUslPf5AVa1vgBBl5UIvB5oL0uc6G4/KT5maK3Y5pc38QqrcUierw3SbMn31uq3JET2N
	s5aJnsT3wlT0Ok4TGvJ9QsrksjBxN3rx8pzO3qEcshnyh9wUp8Hfb0f9T7GZDcXZRIHp4Byp54c
	re2cjIOiDClfZufoB+r8IzkUcmAhpedU6YzpFktr4BvCj9XRZSjUtV6LjbZgrEsBs7QGaSS5hdr
	nZZfAIWyazTd4/31maG3PJBXHuV9czHxMnXYpbvhnht073R89dPrfF4d5+epUhxzhRvMkFDGF5g
	ffwbt+tatt+DIh/Rb+4SW+s+ebusf5Gm62spjMR57+2ddEwD9JoGcRG8VNzzeIU2TSg==
X-Received: by 2002:a05:622a:178f:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4f36108c9a5mr17884781cf.5.1766061410152;
        Thu, 18 Dec 2025 04:36:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQu2nnxqGUnQynFrRXz+BuL+HJmQqJQwR9k3URYcUz1hnRgEtf2TKddA/5Dpw/OBBUzx5W4w==
X-Received: by 2002:a05:622a:178f:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4f36108c9a5mr17884531cf.5.1766061409643;
        Thu, 18 Dec 2025 04:36:49 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8022f9530fsm223265666b.12.2025.12.18.04.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 04:36:48 -0800 (PST)
Message-ID: <69ac0e2b-82d5-43d2-816d-d3ac31963077@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 13:36:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: qcom: camcc: Add camera clock controller driver
 for SM8750 SoC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
 <20251202-sm8750_camcc-v1-3-b3f7ef6723f1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251202-sm8750_camcc-v1-3-b3f7ef6723f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KYmkMVukXgN1C3ZqTXMC5k8PyLi3pem2
X-Authority-Analysis: v=2.4 cv=DsBbOW/+ c=1 sm=1 tr=0 ts=6943f562 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_j3VNrtD_Kzz85i8SO4A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEwNCBTYWx0ZWRfXwU7/OcykSP3M
 Q6Rk2o2mL3LmrXzF97FcYqwMZzcnUucLw9R/3VNoNX3/mK/w2Hwn9Cjv6d7Ca7fLZuoZuJLf2f5
 xs+1NHvH3fQ0nCM2mY6m1Kid3agC/oHgYfVLWkp+LBq2xTibLlF7VpcBNpFKv/2TRwT+rE2VnmO
 J0Qw8VtDWFAvYEqcLQGjwQyotLF9Xicss7I4dKp9rSfUt3uoYDsGaaGLbj9keywbAjhy/SY65ZD
 UNiD/zvr2rEl1zUcBMx+y+xucTH17WmGBicsoPvX9OvasKLW5dAgUpwjpOlBNSwcGauMUHwlxoI
 PEJovOF4Gf6WmDknr5+vWEC7QAN6ZbhoVQg3csg9xUbsYmVK09y8ZUjCWzpeM20TaLEOhvR7lLi
 emBNI1Mqh27Q2T483z5Y/aR1V1akFg==
X-Proofpoint-ORIG-GUID: KYmkMVukXgN1C3ZqTXMC5k8PyLi3pem2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180104

On 12/2/25 11:26 AM, Taniya Das wrote:
> Add support for the Camera Clock Controller (CAMCC) on the SM8750
> platform.
> 
> The CAMCC block on SM8750 includes both the primary camera clock
> controller and the Camera BIST clock controller, which provides the
> functional MCLK required for camera operations.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

