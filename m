Return-Path: <linux-arm-msm+bounces-76085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DBCBBE637
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 16:46:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC3323B2DE3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 14:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B922D5C97;
	Mon,  6 Oct 2025 14:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h1Ky1CZZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF981C6B4
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 14:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759762002; cv=none; b=iE7fatvG49rUZozGbudbTEuD+fdongnPQdIlApn+aCGxPVDel069z0lppQaV+h8Hk9puMuNYOqwn0JVgmnJYJqyeA53Cep4q+a614kyB+UMVUW3R1oifZ7wpfscWuhsVvFih72Lim7vsmK22Vd3DQpOId6Fu17Eh4K3wrbl8ZVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759762002; c=relaxed/simple;
	bh=0SjfYUn+LCJtD0uklCJCg4enUtxBtyoQ8WI40LJdw0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YxkvoYi0hSE8/hn2xSokVN14st6awHLwH/SPVkDuOjRMiBa+HwNEcHi6mWqA0zWQbWVrpoYy93BNS5IWHmS32PjGW/zSW7yL5XVZBuc1dHrJKSjT9fXSb6d9goCfK++DGsWiqxCD5PMPtqTq7MDf9sgkmyKpX9rXc/Xy+UZ6XK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h1Ky1CZZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5960XVtJ002188
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 14:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6k8/Nl9l0oEKhW7IAR62snQP4zksIlUAzpUwmdh3B9c=; b=h1Ky1CZZGQ8Jocws
	SjigahduATYPCpJIoCBvDjaQmdcLVgTgm6/Ui9U2rMHSnK0lPHeVUyevBA7a0zcz
	I25Lf5WTGac3yWJMQXqjqjSO83/OS7osr6ug1Jtv2wH1rYD2ugmM+F42feaz3ydc
	i0bQP6fkJtE6s3c+rsfu0dGAPMuBPBYOzr6pSi9J7uiY9dTizhjT3Ugc4CTP9Lgk
	wy7WDlY+L4BJWz0j+YC9TA55VuY/NgJJNXyqSxJueVGWsrtRmVriSCXcDycNJj+r
	w+ECqNRTd6BpsJO+5duhzKVpwQNrBP7S5pF9koopr0JhtT2VasgtsXqT8wJXSsQB
	jcg81w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jthpv95v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 14:46:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e4b4e6f75fso14944321cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 07:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759761999; x=1760366799;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6k8/Nl9l0oEKhW7IAR62snQP4zksIlUAzpUwmdh3B9c=;
        b=SundsWuuHvTWtwqjbCi2dPVqpA37pQkPhVzlJlSPgvLUGX8zDcJJ3+iN8jwU3JRACt
         BeSlkpYl6J+0d7dt7rDR6z30BuNkS4nsDgp0+fWENAawWKqLRK6pdglDTqxeadkbIQ8N
         x5/RCk5Z/bB+q5CvfxYxtcd5MRt3pfhSciUn61VNNGiJp3wFsi5gZl6v8EVigG2qsmG1
         eFvEYM1ZIF42PUYOGJ50f4bS7ACpeHbJaL5d57sFOlrVYoL2mhPRlqsUXKWWxXDbWTW7
         ghDkIoRGEs2YY2j5PnqQ1V6skmgF1Zut3VxjWi1sluS97mkU8Bs6MF8TOzyuirWabZqs
         FF2g==
X-Forwarded-Encrypted: i=1; AJvYcCWZXpY5iaoX6pxif3Ih2RwrVpRKYDaYIMHtLHl3MzHtDd91ncWxgfcqbrrg6nHp+7mus4NarheZbTF3iUEL@vger.kernel.org
X-Gm-Message-State: AOJu0YzY0yfJ8rsP70axHq2js9hXNScV/siLbKSO47tS8bSs8GWnAqTT
	RixJFkAEV9vicsXCNJGdP0is9khHcICvUvMW3gdXgbNq3KU8DF/yRLR0flt0N9bVAk1fgWyv92B
	0rPi1wYGqF/bmsNoz68xpteKBFX9QCjvD2ZZgDnvgZDO2115CjSvsbPXdyJ1hEdZmlvEf
X-Gm-Gg: ASbGncvKY0UDQFt6QjzOar86Zgdi130jx8D3TrNUQbWcs8w20l+WqnRyu+RY10Yd6E7
	vSkTRUAjNYzlHH/E5avxTlzGXUvr2pAa9yXosy/5sOrHxIu0Zwc6vNSgMQw1tmBy7ez3zBULAUc
	FuwS/t+JW59W3IJQKC6DqG4wzGB1iuhIhzGgCiO/CTb1OJEp/vQ9QoYuD15PZhjOfWpocB2zDlN
	6ZADX2L0TojOyvqsld6EKleUDua7L+v323xGXRZrBkd96Ry41yvtE3CjbaJiTjLgIdjmbgERpsH
	92RpZIeunMMiTVx/+bpFF19F+ORpsOPgTQ+lf3jbXFDf4t+phQpJK7N6k1qc1y23i9NTXg0y/vX
	YXt6ZLdUl9oO63QJjP0O/sNZzaGc=
X-Received: by 2002:ac8:5fce:0:b0:4b5:e606:dc13 with SMTP id d75a77b69052e-4e576ae6a6bmr104989731cf.10.1759761999048;
        Mon, 06 Oct 2025 07:46:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGV4qtXsuroQqkzlZTq/F/Z7vHu5HpR6meIRrGUsREceJXJahZyUefmBMArcJ8DeNfcQay4eA==
X-Received: by 2002:ac8:5fce:0:b0:4b5:e606:dc13 with SMTP id d75a77b69052e-4e576ae6a6bmr104989291cf.10.1759761998335;
        Mon, 06 Oct 2025 07:46:38 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970a4bdsm1164471066b.49.2025.10.06.07.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 07:46:37 -0700 (PDT)
Message-ID: <d1a5fe84-69bd-4e94-a92e-640f35c8d013@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 16:46:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-longcheer-l8910: Add
 touchscreen
To: Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Albrieux <jonathan.albrieux@gmail.com>
References: <20250919-msm8916-l8910-touchscreen-v1-1-c46e56ec0a3b@gerhold.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250919-msm8916-l8910-touchscreen-v1-1-c46e56ec0a3b@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5M34vQB1DTlQlBx1oI0JamEf_NXearZy
X-Authority-Analysis: v=2.4 cv=N5gk1m9B c=1 sm=1 tr=0 ts=68e3d650 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=j8Cu_9a8AAAA:8
 a=EUspDBNiAAAA:8 a=JOwjkeT_cYTZ497o5dcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=A2jcf3dkIZPIRbEE90CI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNiBTYWx0ZWRfX2rG2Msyh43TR
 tvaGNHf2Lf9Nn8lPPmaEmNiXusnAQUCfknrxjIX7bPR1gaxZZyobpLpHTmcohMr1JC9su2NzJRO
 PgqO+S7GfRNUW5UFhYmfSQ/14dwKjJbec7UL/hmDwD/2sQbhWwtkcYo2tXXNAea0QQiKZVAM1pk
 zPAyot9ZoCn0gbo7Mq/r901f2vG9WqEURwmp94Soh/zPydoMiLz0SY0GMiv+Fg0ti+OYWojgwt1
 JqDO8l2HxFvez5/qcA8uHAfZR1TcsspECu+ege/aMyGbHxJvZ6ltIexo5LVUa1iy2enAkpROZWz
 ga1KlsL3XLJPPG2u/yjbPYWhM+xokTjjHwM/FKi+i2chFAq7KdEIrxAiNeveRCQtR/CoKyisNy9
 KilNJGaIpb7LYGMqyW3eLyvwd6SSjQ==
X-Proofpoint-ORIG-GUID: 5M34vQB1DTlQlBx1oI0JamEf_NXearZy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040016

On 9/19/25 4:49 PM, Stephan Gerhold wrote:
> From: Jonathan Albrieux <jonathan.albrieux@gmail.com>
> 
> The BQ Aquaris X5 (Longcheer L8910) has a Himax HX852x-ES touchscreen,
> which can now be described with the bindings recently added to linux-next.
> Add it to the device tree to allow using the touchscreen.
> 
> Signed-off-by: Jonathan Albrieux <jonathan.albrieux@gmail.com>
> Co-developed-by: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

