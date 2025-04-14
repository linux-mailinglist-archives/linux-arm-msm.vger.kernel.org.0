Return-Path: <linux-arm-msm+bounces-54281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9228BA89023
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 01:25:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F04E7189BBBA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 23:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1883020125F;
	Mon, 14 Apr 2025 23:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CH/Jp3Zl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE675201017
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 23:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744673090; cv=none; b=F/K0FL+8/39c1a2DOTfGfvhbb1wZPZjNtYkEkahSKaoQ/36rHx7k9TXc4ujyePmT9BFszSOx5UwbAmJgsO+nJcXtQWVD8gMYFN1nOkJmYD0OefcxQW4CTFRnp+yK5ZiuAPcEp2bI1ZtDey47ZHnPJuXsvKAzU9Wr6zyj+G5vho8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744673090; c=relaxed/simple;
	bh=h2pvihb+r7IyXNDpZp7U3oD4Rj//hdL1D90IbYTHZEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YE4TQXuMzu8zXvqBmWVcD2kiKPufQGnuTzDPUVcg1j9UT4FHFFqjy2meh3TIIMxZoFnMkPw+03Xzu6I0N199ojB/wm3OOTbjw2Iga3oO7udW7uwPh7K4028LOsKZt5j4UukJFFXH4oI43anR9o7cMNod/lmZyAehvgiF8fOcPQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CH/Jp3Zl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EKdjc7011111
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 23:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	syhqoSLgiLKWoYixmoWsnuqaN8xZFF6IGsZlfy3D5A0=; b=CH/Jp3ZlxAsXNIyd
	OaYFKyz7rkikQgyuxvJJNnDkc5RUxsvlOXIXSrZeZdpjZuR5EX9O22TRIdaWix2t
	28bxFz2f9ExCKEpH8Yd7R2bUwF7gxgGHCpet+GfiJFZAsr9Vyox2lG84p1NMjAG1
	+kdp4O3KKsY7j5TJA5+ONm63RUxkiDFelubHeCueny1l6pV27G8RrsYa2kFgBaHo
	MGoVdsxv1zU0gw52qPCJfqlJZM3SSDav0fsE9lps60qXgMNQ+aHtAgfqjF36vEY5
	o7r/C8SQZ7LB3QzzksSiyM6gf+jhs5QQSf8ftnAbmxAg0gv96tfHgBZ16fFo+zj3
	FeqlbA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfcwxgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 23:24:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476718f9369so11120561cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 16:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744673086; x=1745277886;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=syhqoSLgiLKWoYixmoWsnuqaN8xZFF6IGsZlfy3D5A0=;
        b=OL6VrVWkFngqau+T0JkWWYnVP6caTWsC3iQHpWZfbkS6a57+dT7IoQXwLejmUPhuIq
         sG5HI9m3PzYFEETDnsvCHPBlRZ26DMcwGr8CQpKPV7AyEdNDSiOjg1hAAjjQNeu+5JJQ
         meGZuodZ7xPGNcmz8Y4uz8U1JO1zR5LXzmEvfszQ7U3fohjnrN3ztpzaaNbjPVQQAB9N
         6w1z0hcNdF3ptyagEtrQk5XuoAa1C4KX8ySKpKHAcvHfUaZ9nnXOKMaWt4MHqXAbt265
         X5pWY1wnadTVuoModXoMUHVOXq2AWBTlQ5nKpMzuLRDnEvjsm3GA7OLfWSXsC25L9eov
         Uj7w==
X-Gm-Message-State: AOJu0YwJU8Ju6hCpKnnVLkwWK0pd/SsJhgqoeP3sUjGxXvwXcd7SNtML
	7H3vs3/uKpR98XhyDbD4LKE5byOHEkKeRZSNZlERmPv899lf+tl8Bx38XOwDgMd1vetdoPFVCu3
	0uhvjLPaFkEmKkz/31T0WYsW7P2eQVhnXOjJwrAiGy+cX0WdXzM+juqLgVKV0rsYE
X-Gm-Gg: ASbGncuKqnW+7Wo7dnqLEGOrkvNX7Kembsectsv+m/k3OFwBp4+N6LDmruKjdacqyKj
	Xfh9SDhPnQraARIHb7QgFOLTYC3UvIjCS8e9FDFGKejzUu5W3tBMnURJZ0ly3oDSpZAKWCBfvom
	i8/MxW+b5NraRt+PShTViDG6NVxQ9GBXa/QLSxvCZi3i064/fSD9YFsOobaGZmj4fqJQ39YaxPD
	uD6SJJqS9+aZPPF0oKr4WOo8yczWp7hMVRoI2SfYgFhsieWRMFYDbUU0yMlo2t4WoZsmVRdekh/
	cUz74iRo3mUjMSA3HVzPl1Vlx0c9jjGMsTdPKZI3ZNjEEV5YQIMK+07HJYuBAWMj+A==
X-Received: by 2002:a05:620a:424f:b0:7c0:be0e:cb09 with SMTP id af79cd13be357-7c7af113653mr670670185a.7.1744673086245;
        Mon, 14 Apr 2025 16:24:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8PTRomTehXQkpJAD665EuLX7SUm59eGe5gjBmCc2IHLMBCvASYa1s8Eb5SDTMHqQU4Sc4Hw==
X-Received: by 2002:a05:620a:424f:b0:7c0:be0e:cb09 with SMTP id af79cd13be357-7c7af113653mr670669185a.7.1744673085863;
        Mon, 14 Apr 2025 16:24:45 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb2ed4sm994857166b.34.2025.04.14.16.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 16:24:45 -0700 (PDT)
Message-ID: <ac789ed9-da73-4a1b-8dd4-925441d62baa@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 01:24:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] soc: qcom: llcc-qcom: Add support for SM8750
To: Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250414-sm8750_llcc_master-v4-0-e007f035380c@oss.qualcomm.com>
 <20250414-sm8750_llcc_master-v4-3-e007f035380c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250414-sm8750_llcc_master-v4-3-e007f035380c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fd993f cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=DTz9NSAdtq1ik8-Tc7kA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 6ar6mxmjHD_yEBQJMjMxVnjjrpW4q0tQ
X-Proofpoint-ORIG-GUID: 6ar6mxmjHD_yEBQJMjMxVnjjrpW4q0tQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=582 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140168

On 4/15/25 1:21 AM, Melody Olvera wrote:
> Add system cache table and configs for SM8750 SoCs.
> 
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

