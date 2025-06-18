Return-Path: <linux-arm-msm+bounces-61763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FA0ADF731
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 21:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 434C24A37A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 19:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D2721A434;
	Wed, 18 Jun 2025 19:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hDnOKgRN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94243218EBA
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 19:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750276214; cv=none; b=PAjWozBokftFXxaNXVa5wQgKPhfTBp6stqdjOhPHT9hzMJ7SNctfUL9Q3LJyewgUQIwkLZ7glfon6L/O3fLXra7Sc6V+X95W1HuiQnM0kxuiy9W5txMS8Z62a2Y5eNOrrL66j1GRXKsWGeHyzmDPntFaQzGakEZU5J2sLuFUfnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750276214; c=relaxed/simple;
	bh=luoJ2EhFdNRnqQJG9cSh5+lCaNdS01/9QmmpcN3PjGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JJpi94iwXs1kqJTHiwsLU3X2h8WFLtULClRltPz0HZO/uPYpk+7Rl89ruDO3qzvSAklPMCQQP3lSgA6S1GmTcuU81h0pRtvyO5egAhKww0jMYOIjoZUVFJcBqqC6BAUwUzkfKzb7tayaw9P/9lg4J9U8zQonlQs330EC9zUOeA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDnOKgRN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IJ6Gv5022401
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 19:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eb0PR7MC8vATjVfhJQjNH3z5UBkyJTka8cUrPI6EnrQ=; b=hDnOKgRNDff/Lyaw
	quOkZ8IaI5VQYSbR6zgdrzmzL9ZzoMT3n9PDasulA3H8vuV9yVM9bDkjTutLKlIp
	cG4bra97nsK3EVP++Y2r9jhzwqHwGsR4/cYkni9bvcEhCg13DVs9DlDR6/7P3OZu
	wtBKcA/ojneNcgQLpnanKt605HR0zMGoQA3h/7Ig+mzgEfydcTA7vcmf5rp0FEXQ
	gRCVyZpgiVNbAsDnB/AQfD38TM6PuoWaha/4wVq/asD38Plw/yMT1CtUk5IVryHp
	0VLNfxQ4Pt1L8b/9GEm0mExQGcumVzVgtDiTRLrvOC02LF1EGjUlr7XMQQotDnqX
	gBpn6A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mndck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 19:50:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d21080c26fso1556985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 12:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750276209; x=1750881009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eb0PR7MC8vATjVfhJQjNH3z5UBkyJTka8cUrPI6EnrQ=;
        b=Bx++cK8roM2RL/oI1grwtTT14cvML27xG8JBi6fWBhTNa4ovR/9WP0s2suUQ8+VNQ7
         ILq7l9jdUxmi8Khs7g+Bln3cfsa/v51kyYQV2U8QfBKBkHZPmw+sUOFCQSzQbZRhuliy
         JXImOKIuUcuv2Tcn95U3B53xZ1RhdyUN7Pnjj1zAwq17AS9VCPkAdyRbSRDV7X03yac8
         3J8B+cc/rd8+bqhnVBj/GNwRkBFzzMgoimEJZdPx6h5d8U1qY3uZpo622Gmi0Br1t9nf
         gqVu8lxGIIw+Fev1qA97e7HkolumNmXbnNEVtquGJ1PFdZGczF6aWWEZ1x0Znf9r7+Hs
         7Tzw==
X-Gm-Message-State: AOJu0YzChKZAFB3SWoIfN7/xQcBx3GdVonSkCqkDZymjEfsIY+TvCk0b
	9lhkpWIn1ZtbkAxBrJw4Hr3DlNFrFOQF4xn2ky5MdDfE+E2Z4kDQXlGaImfzDYXuneQ9ChkC4Y7
	oSX6XjsexfrIfkK4tTwt3i85WwKuhg2m7Py1x1DlPhCk1hs6mtx+e0J/7ztoyfSY9iH44lqnloq
	QB
X-Gm-Gg: ASbGncslqTvjFgvB1V6yr5e7t6RVU1uqkOBD+I5mx4/ak1P/iMx3+Nv3Eoxhl/QvjLW
	Io2v0imJahA/UoS75lJLOv9wzNIWgD+FzJSSKE6djFmIkMlm2okJTzGyl/VuoOCS1GJJ03Vpn2p
	qFk3pOS7FFhBthfJ2/b9zCS5asstCS0ZW3T6APuOjHMxTcYYFsEAnyS791Rn7oNCohPq5a45Bhq
	bYc4EpYvArh2EgVfIht8PgBIwbRTTuBKoffCHPgUh5qqf6MAsUZOab6gUZ2m24aPL+KA5vHuN2G
	M2/Iij5Hn5eStWv6baa9ZSeRI4lO44elIGCR+YVnPTKMNsAX4ATPrEzmtQciZ4M4EhJ0ndbUKx7
	CNX4=
X-Received: by 2002:a05:620a:414a:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7d3dddd3dcamr452893985a.0.1750276209383;
        Wed, 18 Jun 2025 12:50:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFL3SJd4iFzCwT5g6MhwkHB+B/Bg64lwAFozgDBTuMDs9zJo+cDkA5jqPxifdTnFFGAD0h1eQ==
X-Received: by 2002:a05:620a:414a:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7d3dddd3dcamr452892985a.0.1750276208907;
        Wed, 18 Jun 2025 12:50:08 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c0135sm1090314466b.47.2025.06.18.12.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 12:50:08 -0700 (PDT)
Message-ID: <f2b806af-510c-4f33-a4be-9c84a37cd247@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 21:50:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sar2130p: use TAG_ALWAYS for MDSS's
 mdp0-mem path
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250618-sar2130p-fix-mdss-v1-0-78c2fb9e9fba@oss.qualcomm.com>
 <20250618-sar2130p-fix-mdss-v1-1-78c2fb9e9fba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250618-sar2130p-fix-mdss-v1-1-78c2fb9e9fba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE2OCBTYWx0ZWRfX6c1Mahz5okK4
 0HBM6AJkz9fsh4zsqK3T45v5qtKfgOW+hcuxmKE1+mUwzdO1cLO+UDAKzdABEudCubydrpHHfOV
 VmpAeKEbFsoESJImFSmGY9QjlznDfAMvYRQzlr8Vz8/RkoYMrRaKUAsvIPAccO01uEv7CV6Po3s
 hKR1DJnAKg/JFHh6zwjUfavCBSt+0Gd7cjSSelVYycIC73xpWQmQCBNGGXz6SBxEWwYBTBCnMm1
 X5muaxefpE0sj1/JUgMUKS3w7LjnYYKpOqE2lZmnhdNP3mpmQDMhxD/U/nOGqD8o3S61+zPGPNg
 w0/kt/5S3CijUviN/HgHBFx9o9SrE6nQLXCwBhVma6kdkGqrpz7qSULEMdJGNCqWSv5fymV5BhQ
 fwa14b/f2Zq1t7UBbuzFcoO/W6ZLUHsLMNoN85jfP2CIRBGAwwfLRXeL2Dw5dST9H6+5PKtg
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=68531872 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=LxG8ozSyjN6uvR1bqNQA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: b_bppjHrwRbetMhpeZGGtTP66SMaJ8ZJ
X-Proofpoint-ORIG-GUID: b_bppjHrwRbetMhpeZGGtTP66SMaJ8ZJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=761 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180168

On 6/18/25 7:49 PM, Dmitry Baryshkov wrote:
> Switch the main memory interconnect of the MDSS device to use
> QCOM_ICC_TAG_ALWAYS instead of _ACTIVE_ONLY.
> 
> Fixes: 541d0b2f4dcd ("arm64: dts: qcom: sar2130p: add display nodes")
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

