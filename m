Return-Path: <linux-arm-msm+bounces-35926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4339B0BA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 19:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60E311C21B53
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 17:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6EE216E0C;
	Fri, 25 Oct 2024 17:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="laH1Psab"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526D0216DFB
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 17:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729877035; cv=none; b=SJet/jkqz4pYQ9hbxY4X1QJakdnEVv0x3PrpaZH1Gk7dUbWcm9+/hB4j0+x14c47WDW8kefGkMWv/sJpT8ghP/7gt2Sul8il2quHejR2vizuKjs/8up/HenmaRHA66L08TmU1LerIL9qsQmckEzGqFJAaZ98T3YPJ0KCu3FGrp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729877035; c=relaxed/simple;
	bh=tVjMxkeuoLbNCiz5dienRRdA3e+jQoW27GPSNdliseI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WGqLbbVWUoK6t8Rn71tZcd7aNF6/Uu7Cywje4tbKdJ7sIkSMCLW+p81NMVqqfdJNh7gkgsekF+ab4tJfBRChXtQqeXn9xGndI1kI/p39lahQj4BxlGyRQvi+tfZZlRUMiXzah8PtjJY37mp7CwGayjnzg2/m5e3SbhR+NkBbCzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=laH1Psab; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P9tG8P029632
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 17:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GGGNwzfw/zAdzm6vw+C/U7FiUNzebOvXXpb5oeva9SA=; b=laH1Psab+pd3c+Is
	GjA3b8PJlx5Er7rrp2hfX0czFl40XQ+JB48hwxHL//i+CwwLJ0WNJ9VGvhY27moD
	CqVgcF51dp/WWSJx2f6mB5X/TcQY7OF4py3/t6gbpF9M3/mfkUgn7v/UpIw9IvkU
	crtQHDD9jAcWtEmHdX1Wi3mKWKzRF/R66bhg/9mmTJhYTHlm8azZ89MP5Ch/VooT
	Ac3dTTKCv1sZq65nor5kM3GOoouhK21auwz2tGXX5hMPKj+9tcM6w3CVV+3X8tKZ
	k9gzosK7kBnzr+R+g2L4xt6ZdqwKfldUWhZxj932rhRjlAlW4roY7dd9Yin2c+h1
	aGefnw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3w9xwk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 17:23:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b148e9776bso38405685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 10:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729877030; x=1730481830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GGGNwzfw/zAdzm6vw+C/U7FiUNzebOvXXpb5oeva9SA=;
        b=qoHjYSp7h72tusjk/YeRfSkoE+HzB3yTSO4q0usJ/07/C6iqarB1n7dxem6muHR40I
         7SyJlsHSEtUNkrQASWxT8h9DWrACPdVhtv7tHsZnJ6CbqZDlQGPe/9iO+1twSmzQaT/r
         hG1myXS3SjUtNdKyFC0kNoXX2smLejAexc5jpaRlDuJ2T1YB8tb2gKIPPi0jdNab6k6Z
         9rc6jd8+WP12GvR0hvIs/d8PMzVGVVWiDEPreXuhj1d8A2VvWhISvPwmYeSm4at/mvnD
         sKQ9SrQIHBMr1BX2D9oEWYxHR8AyAw+Gp4VJ7e3EKd7kqkSWx6j+0ysbxZF19M9so+l+
         hbvw==
X-Forwarded-Encrypted: i=1; AJvYcCURkTDA3KS1TxTFDjMDFcpdGkLOERDtMQ/7po33kTSIsh+EGaq9h+mMQJxGGPmR0UqFxQ6JyJFupEGO89/m@vger.kernel.org
X-Gm-Message-State: AOJu0YwwUw+TyTvRbaTN3h5uIiaGMJRpetx+KFr58BKUhWhugvF3XEQU
	Q76nOL6h2AJhd3//uab2gdYlozfQJ0RTwI265unWki9YzHHPAtfCRhuXY3Md95t/GzSgnGR/8cJ
	ZtU98+39wWJE4ki82ZXKTcAHuTEzOtoqBMTG2cUikYbPDlX6wJWaBBZjwfJ+C9bAY
X-Received: by 2002:ad4:5aa8:0:b0:6cb:fabd:b12 with SMTP id 6a1803df08f44-6d18558937fmr1708576d6.0.1729877030742;
        Fri, 25 Oct 2024 10:23:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHJ1YuapeN8DAQSsD35vOkggkedO7s53T5L+XAzO7S8IU6jnNiaULiNK0DQhzH4JNwso1Sfw==
X-Received: by 2002:ad4:5aa8:0:b0:6cb:fabd:b12 with SMTP id 6a1803df08f44-6d18558937fmr1708376d6.0.1729877030371;
        Fri, 25 Oct 2024 10:23:50 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dec818bsm93040666b.17.2024.10.25.10.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 10:23:50 -0700 (PDT)
Message-ID: <7620b929-dbf0-47f1-bedc-1ce87bf6e988@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 19:23:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sc8280xp-x13s: Drop redundant
 clock-lanes from camera@10
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Depeng Shao <quic_depengs@quicinc.com>,
        Vikram Sharma <quic_vikramsa@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-0-cdff2f1a5792@linaro.org>
 <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-3-cdff2f1a5792@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-3-cdff2f1a5792@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mgRC6oEo89BR-Mj8Hm8gh32oWg9nLMOw
X-Proofpoint-GUID: mgRC6oEo89BR-Mj8Hm8gh32oWg9nLMOw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=861
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250133

On 25.10.2024 5:43 PM, Bryan O'Donoghue wrote:
> clock-lanes does nothing here - the sensor doesn't care about this
> property, remove it.
> 
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x13s
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

drivers/media/platform/qcom/camss/camss.c : camss_of_parse_endpoint_node()

seems to reference it and pass it on to the PHY drivers

Konrad

