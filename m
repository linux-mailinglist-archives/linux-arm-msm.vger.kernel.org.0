Return-Path: <linux-arm-msm+bounces-84207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0396FC9ED11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 12:10:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B05563A2801
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 11:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D5762F12DA;
	Wed,  3 Dec 2025 11:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XYuZeCjy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gMF4PgVg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50992E3B15
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 11:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764760206; cv=none; b=XAoxcTEk+Tmq2oFXh86BUw5F3zKNtKd99VaAOA2UP/iAgWcRybhjCPuPu2Fyw+0CtUX/jUgBmvxDXJ7qrTLiyswn2MrzNxEDnzlJqRNkmOA+uOgTPvF3LCJ50QiTlLVo1yNluxNX+vOb93mfPk974+Jrt+fDGeXAAc40lNgj0Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764760206; c=relaxed/simple;
	bh=26dELx7hQJ81iqDVRsFJB+FLqmQjo9QAECziSzZ+Du8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fSvHOA1L1vpBV+GaxtJcJ4ug2HqoqzxBP+zVVhJOpT/evVsT9EdixteN9VXiiPp8xpNcahG/NVeZ4CSMO0bcRDERfbGMmUUTn1rjzsapEPonxZ1w+VQjQCva2MrPiwAgml2WrJPzJgZh8iXkSyrYe5ST/qmzq3+sPR6XmacEw18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XYuZeCjy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gMF4PgVg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3B3CgS1374502
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 11:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K0Ebiq12IvMA/z2CnFnJdLML6o1k+DWMI304jn0rS2o=; b=XYuZeCjy8AlNk+5X
	EpqDDMNdeGO/O1XtP1OfTw43BEOManYrBbUkYm6qcA2k9w5bE7wpSn4ARe+FjERJ
	zN864ANDy2Vd8GnoA6feJ0Y5Hs799QSgJGIicOGQEKylVUh2LhLNyWOEcIfn0ctC
	8cHeM1yNc+boOrVwiPhBwQyWxMBkLYgAcNHr6dlqWTvY4kPeWqAL26FBK5R8jLSh
	Lr1IGIuTRyiV6ibGRp/gMgSVYfyScqXFc5qM/DLwnlajACV1Gie0o/rq6uPhB9lY
	JiCbux6i0q9oxiEKECFxMaYBGQ/9WYgHdFY59qlP66bDIfE6TbSeheG4M9NtjdgW
	JXllmw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm0b80rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 11:10:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b1be0fdfe1so199807485a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 03:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764760203; x=1765365003; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K0Ebiq12IvMA/z2CnFnJdLML6o1k+DWMI304jn0rS2o=;
        b=gMF4PgVgNLAZVbmh9UUiLDAivAD5SSQWorKYYGI0E9PE1UiItuRXE+m+RTHspKVfSC
         wK0QQoO4Fu4d7PFQgUH971q1olm+oBW6uRLt/omubhqbQLMMN0ueUHFpwgQMKYQXseYl
         c7ytL8mixs+QBaMK7TrJ32aNSdO4JgCpgLVQmUFkc08+5mX8OpeK9WraLdpu/LYGZb/V
         0KqrNh4pwDTD7H5+uxSMfJ9gqB5yHNLhmmV5q96JZ0JcKh0ADkbpbM1Oc1d68DtITikj
         k6SMc23tGST6CxNMjpZy5wa+Qvdz6KIvLQlbB5jlTlq5gBGnktROwcqgyH4aDSfkMM8n
         AtJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764760203; x=1765365003;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K0Ebiq12IvMA/z2CnFnJdLML6o1k+DWMI304jn0rS2o=;
        b=H9CN3krZFqmwpBNowtOzNEWiQ0Wl+J2p3DbLL3jXxB+argKycs16yjWwd7C7DvGsA+
         P8/5aFzn2DyGq4TobNS4ASePkUp5mPofWrztJBwgqdprZO8Ly7xJOrmSKgpYyef1uj3D
         e0VrEFKfUmdvMUDv/VZk9gypEl+4guKyEBhs3aWNZ1E1yR3qVsy107xsXjpLDR/kq/ox
         03cAPkhcE78dl/KYTEjT+isW0QHpN7L8/X4SF2s625C2oRCTaUPxci29kaZfp20AK6bt
         3l1E8m+xRuIlAQ3eGIR1tb2sZnl7NwqtL1RGdEmMDbFHApJp3HK/00kfAMk9Qd79d7St
         PFlw==
X-Forwarded-Encrypted: i=1; AJvYcCXa1X5edN6/p4eMEJ1JRurt3NVoJ8MwOOtWZRy/wMYuA8YcOzmCSwBwZrEKloI5QugbJf9DPwbYDlkjpKSa@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp+Jy4gM/GpctSQSRyTSZZAlFUc878n/Ti/snw4spHj4xEzzen
	bDcUhBPnPMOsp1OOmG4IO4V2hOTyD3tEDmqtE++vFU7OQBNATxV24kOCD5eRVXv61ogan7z7d3K
	rxd28UEC+JRvhvgERnvDsqB2rqsvJ/ZfygOLdprJbdqlpQsqpbatA6I8way9v/5t2UsBA
X-Gm-Gg: ASbGncvSq+e9whUuWxCQzpq7ip97mpxvRpw+K6vntVXyOPv+yEGgeecdTSRvPyA6+Cl
	Xc7tabS+FicQbiFDz6nr6In4rrloJGyuM4M9G4cHlax7wvGsMhBPzShTdzvjiRMmBasCUqZbtRo
	gqP9EfRgdj6N8ivBHy7MPl4cu2PPREoC1SXQVw9MKjVgBC6uGlN3lsYnylLd+tF08efi1zQchvf
	3YlEG+ZbGs/29m3rA5PEL0ajvDE6F3DKo0+1b31OpxDwl7IgJviCRG+RDJ5cjByt7hrbPitPJeg
	qDHpbiIbv7Nuc6wWRF5hG1NyEmipOoJoCwdLlE95sEfM7S6crunHeVaEDr/Ltg1C+93Y5JOdS3c
	GrC2cY5xXO5TxewOy79bE2nQ2svVJdPKkB0BV+Bg6jx+Wl0kw2zVW1dDG+lZ0K1y6Pw==
X-Received: by 2002:a05:620a:7008:b0:8b2:5af3:7fce with SMTP id af79cd13be357-8b5f952bbb5mr69123385a.7.1764760202369;
        Wed, 03 Dec 2025 03:10:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQuWW5Ca9jqjFkOlfcYMS1YZxctEYcIqt1/v51R8Umb9p9NW8z2ejW4Ivouj2K8Ltze5CvHQ==
X-Received: by 2002:a05:620a:7008:b0:8b2:5af3:7fce with SMTP id af79cd13be357-8b5f952bbb5mr69121485a.7.1764760202010;
        Wed, 03 Dec 2025 03:10:02 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51c6c12sm1758718366b.29.2025.12.03.03.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 03:10:01 -0800 (PST)
Message-ID: <452419d5-3b02-4107-bdc7-2d866672f437@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 12:09:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sm8550-hdk-rear-camera-card: rename
 supply properties
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20251203040538.71119-1-vladimir.zapolskiy@linaro.org>
 <20251203040538.71119-5-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251203040538.71119-5-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=69301a8b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=O7eCob1Rr8zABwO4z4IA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: r_kQr4Hr_8ThMNpnEwosWishvFnIANtd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA4NyBTYWx0ZWRfX4A26wNlBbFSg
 GDXbMf/nHg4xvxz+HqFXmJka6qlfix52I7CT7XwGbRezNkBsFV2zRT1iTtyB3jLZdgkibCfIn4C
 IQ1IkJ2lPT3brIhvTos8Kys9Mum+NBEbBCReyyRAoIInPBYeIMLMeLqTjEFQdRFxgDLDB2TFsSE
 faQzmmzcrsNsuiHv4VUts66JU5BIAqsQjRi5BR9sEqSa04wxXTL5GBIVFILAmHwBrOlWrx+4Iv/
 ryUGZZMgWmokkUPizoWvvX68BvHLMMlUquM5zFjHwaBBENhs62mIiz5Ku77d0eArKdGyZlspvCo
 De+Gvr1hm6wkRS87Xm+cIt/AuiyHVSzdzggFrgi6CVkTWy4nuaJLo3mnNJre3WfcOnfx5UsdUZa
 v9SjWLgVOmHiCwqQErzHDu9Ctuvd3w==
X-Proofpoint-GUID: r_kQr4Hr_8ThMNpnEwosWishvFnIANtd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030087

On 12/3/25 5:05 AM, Vladimir Zapolskiy wrote:
> At first voltage supply properties of Samsung S5K3M5 image sensor got
> names following a pad name convention for Omnivision image sensors. Now
> the property names were corrected in the sensor dt bindings documentation,
> and it should be updated in the SM8550-HDK with the Rear Camera Card
> board dts file.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

