Return-Path: <linux-arm-msm+bounces-68161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D57EB1F2DB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 09:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB386189B31D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 07:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7968327CCCD;
	Sat,  9 Aug 2025 07:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bRNFMl9k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E34727A928
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 07:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754724616; cv=none; b=ux9UGbPRLnhQFScojK2rdbOc9/mBAOcXHSYClzfGUZezUfEc6Ki1Uwb0OxTbZEZJf2DS7zEtdKp83vO7MQ6g8a2uXyRsPOLxY+LMg81wit/1Dwsq3/+7rL4cQy9rmMil1c+guJwdBX3djD7O3Jopa4nlUlwsXgGcSdKvM0ezDpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754724616; c=relaxed/simple;
	bh=l8z2N3VCZM6RQchSw+3RLf4E55Fhb8eHOiRzLOSfIUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kEcFjdwr3nWhwrdLf5h84gJ9WVDlLlXZoVm74lhmINFj6WrZZY48c/bdJ1Tw09pLWAgYyHst82HoJwcoarqIjGKitAEInLYhS0hxh/4pK9VMe9EICMPWfuphqIGVnpZplgVZyoSSUELbpjZ1eAD2FmO6A5UaLrG7BaaPRJSFvt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bRNFMl9k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5794dlG4009287
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 07:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6cdLO8eSlr9RJYCTskzMuxsJ
	U7OJLCh7xxZyeqOV+Z8=; b=bRNFMl9k01cPZ27SnLt5YRi+YNY8iZx2Se8sUBfr
	wkdGbCG5I/c7d0fecxzy1YDdtmf+DSwdfngbzNbhspvgYn0ZNPTX3L91KwEDJnTp
	UoWPDv1/CbWaNsndJoF1V409sON0wUz/g5xk46o0jIB7AICMPIOAglezeszcjO7p
	fOhMZIgqUQfzDNuztLwhzG2UOuk/yW3DfmE24ft6+62CZ3rSD+Pt/7eyE14NI46L
	Zgn572YM7oVKOsyTrrXHKhA3TNVjGJKU1VI5rVT9w+ZRDgbtj/XqW7m9gK6zyUAk
	ClZnZPvEXUooZeSFfN957vlS28mPZLSqQHsAFYlkIRR/ZQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygm867e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 07:30:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b08898f776so67285441cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 00:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754724613; x=1755329413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cdLO8eSlr9RJYCTskzMuxsJU7OJLCh7xxZyeqOV+Z8=;
        b=JqZgmdshNVOKCdYgUHGbFIwuJgZR+rv0t84QjrJtD6CCS90QGgbG38V6/dLt/6s7U3
         DhSOzQkvWmbAcb+1/EtIVfZT6lBEVA0c2URlj7jL6MDk57tHQxHScO288tuLLmyi3SUo
         WGtgam+w1FXFULo99ugUGAROG3flyXKXiBEVkt8i8tqrPM9jOh7+TgQ29J5MkCMo4sQS
         RDbvI/KOYILnxshM/fB67RDa0mtD4wc1MktxBLz9l71ab7tf7wdWBsExiFPff0o6iOKS
         z6j9lBrvy/UR/5MzpuizYrKYJ//iV4gMqD/ZIWwXQ8TmCpJQk54tEKUIDER1kE3IU5/1
         ik5A==
X-Forwarded-Encrypted: i=1; AJvYcCUagGlHJNGb2QHWxPksnmNXNin60RS6+FN9rJxCkWNTPkGN8C3sYsaDhLyObvrvFyD37Fyw66Lq5daYiH4o@vger.kernel.org
X-Gm-Message-State: AOJu0YzmAlEkTXZ0aC/BPfQCUO+5gANoMBiQoPO+q4n9GGLeOutgjTxb
	TRhE4qJsuaX64BwBTYKd2SAjIvFCsf69M1Xng7H3uVQIX8p6gIEliKJHBU1Uo5ehQ+otvpHDRrr
	Hp7DdIiOCYuil2et37HwKScIE+F4pbMGQ6HaeGBwCP3fheh4Vgzuzv0fLYMrfQzpjEkno
X-Gm-Gg: ASbGnctyBint3uxJwKQlbCV9ATVEK4L5lkKwrm9+C/Sf3uX17LYpPE1ZYyvnM/OmHR2
	MfOi4A1n6XWZLEzXgnAuQARrz7cpXqwdIsjUGafTycTiXpj7NBlwtGG6/OEkY0xVXDsXjtrnuS3
	zAFUowJyJO3zcSIs+PTMKZAuqlDJI7HhzZkb4yY9Sp9+LevHGj3URuCbTUi4Xs5B21AGSrNov/M
	2wffMmB3lIZrncqpIQeRk3J9jw0BsUQ3DsCw/4zx/A+Ek0INuL92q5+vhYP+YtbfEB2yLvWrCi7
	urpwZOxpxM6HMslhu0BrDIpJIiRLjmBWkoOMB+trAPyiIamP14im7OBui08VIgbXqgl43cCbRAZ
	Fg0nwBBEXYPNJ2zGfu3lZqVARKVnxAzOPiRkn0y+Aia0YSODEcz2b
X-Received: by 2002:a05:622a:258b:b0:4b0:65cc:f64f with SMTP id d75a77b69052e-4b0aed7c945mr88513351cf.54.1754724612724;
        Sat, 09 Aug 2025 00:30:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHI6V+Z5+t3pF8WT1G/7aQiYdC2lbd+mLRd22M3GqlN6tzB0CFSCGVQ963LVGJWMyblECj+jQ==
X-Received: by 2002:a05:622a:258b:b0:4b0:65cc:f64f with SMTP id d75a77b69052e-4b0aed7c945mr88513091cf.54.1754724612236;
        Sat, 09 Aug 2025 00:30:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332382a9483sm30812911fa.23.2025.08.09.00.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 00:30:11 -0700 (PDT)
Date: Sat, 9 Aug 2025 10:30:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, mani@kernel.org, conor+dt@kernel.org,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V1 4/4] phy: qcom-qmp-ufs: read max-microamp values from
 device tree
Message-ID: <5nsglhsnqdx4l44r36zmxumcpbbwhns4432hm3lvttsgyjaknb@feobdhpzzo65>
References: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
 <20250806154340.20122-5-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806154340.20122-5-quic_nitirawa@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfXzgLDT08JN+o/
 Z6I9exU62qIfl370EuTHu3aWJ027w2meLRpl6Zcx9fjs0SBRuUEiwqdHS/qy2zGr3o0whoH/bsi
 AEYDlvhKXKrhfLzkyBBVg9TxZjO5Xd/2qR+JtMGKbWJiEjSAX3NABvJGel68lDB94DUs/Ig1SFo
 TjLvZQPM+MR4xq3jveKBRUd4Cl8b/2CDdmEeXPX/+qsmr0u5pS5IG+ae4djoedQHV8lXvfIPVns
 3ZvYrLJbBRjscO4rYAL9qi89Qm8eFB+aOj80YdBQ9qc92K630MFcQfn1nBeSoqxdaUstGGC+Ed5
 bn9gVGunwYNkJbpbah/IKbpwQvqp9ogAfUzsaiqizM1/QbV1/c00EZEZ5pFEfffLwFYcHmJ/kXg
 9uoie5yo
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=6896f906 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=eDCZef9bSGwXM37ZZ4wA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: raWguKaaFO4oEvMHfOkEYIQRWI5Z--x9
X-Proofpoint-ORIG-GUID: raWguKaaFO4oEvMHfOkEYIQRWI5Z--x9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035

On Wed, Aug 06, 2025 at 09:13:40PM +0530, Nitin Rawat wrote:
> Add support in QMP PHY driver to read optional vdda-phy-max-microamp
> and vdda-pll-max-microamp properties from the device tree.
> 
> These properties define the expected maximum current (in microamps) for
> each supply. The driver uses this information to configure regulators
> more accurately and ensure they operate in the correct mode based on
> client load requirements.

What defines those load values? Are they actually dependent on the
platform? On the SoC? On the board design? On the UFS gear?

> 
> If the property is not present, the driver defaults load to
> `QMP_VREG_UNUSED`.
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry

