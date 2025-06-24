Return-Path: <linux-arm-msm+bounces-62135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C2FAE59EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 04:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E8141899DCE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 02:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F793238C26;
	Tue, 24 Jun 2025 02:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RjxEtyAJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6221FFC45
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 02:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750731790; cv=none; b=eQ/sgP9lCxtDImXbClQgtBkLVKPL6R4B5yTtiuSpXMevT4NeRXaPmS4zKj5tntfG+LkN3V2O0DetF66gtVRqcm1hWIn7J8Hab2U1xqysbgr1z2RG9D6d0ROJGmKDvFDiAmOpITJdDvP8hhxDjvyM7dy3ir++YuOOq4ZsPO5HpGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750731790; c=relaxed/simple;
	bh=QYoCyqAmLLMb5Rq1x6IEWblU/9cQxXc178wCyGoQFJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ldeuzgAlTz1/oPLBpPomwDRDixhJ+4Si5Nu1YtVp7L6kk+pSGDs2XzoYbu2o0RHkJgJoP60HPQiOyo/RIUFnpJgvtMgzxIM/4l2SuWqKHJa+FByqKxGdRF3QmFNgzWDjN+wUha3n4UIyuQRpXU+YF1tPSHKXgSClWnKm1O7UF3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RjxEtyAJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NHnMSt013850
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 02:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6rU5RVHRmopMQn44WoHUeWY0
	jhRfCw1+v2AKpZBxabM=; b=RjxEtyAJuamwhozVhZJ7cHBTKRyPDdnahjjITDyr
	OYcLXMNYITJxicgmJQKq0mxIT1FVWjh/td6iV4I086xdyuqSIIxAVBmSkKIfagZr
	gwARejgQl9eTUMYoRvmAEZDt6b9bhMu0RuMU7UnXoHeg/MR2P/d62G7nShZr2NVE
	eAPRGT6vBhIWBgJO/BQlGEAzhorQGYy6TJvcQflokzPaMayE+0enft9jNm4OGktR
	HxUJiT02+gSPg2f2ZPlf4kdcz4htr19I3aCgKy8DLvf4LSdHMt070tQ0Ntpcqwwc
	e3i6C1+GJOm3RxCjECJe1jdqb2eMYKYPNF7Mmsx3doefmw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4kuhw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 02:23:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d15c975968so745858585a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 19:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750731785; x=1751336585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rU5RVHRmopMQn44WoHUeWY0jhRfCw1+v2AKpZBxabM=;
        b=TPmiOe+8JA54fLnrRiFpn7m2+ASc4XZm9WLzYzjEDgajFA1v9xXeXOgV5VnX7Q+JDU
         Q+zlcfbmOnjoejbEDvJ9cqg9ADPGJLILM2sm1SN5loDR+2NKLuYRK+RTFu8OPVMieftp
         lQxnJyzL17ifFG81KAaohqlHxV0/72phMmu4fKNGcvtItaAsM7rJzIecYB7JHjEE9qve
         mOtsybkZHkSw+xe8mdi9oOlgPmokcokRoEKAxj3gbNFdSnVxeP39miqLGqrH7S0GuOzt
         7tpq2hocTGNI144xcwWovqy3ib0cHu5SRZ3kqPkwPa6sGMiQaaKqPAoeJyQElUk7O4pT
         9qZw==
X-Forwarded-Encrypted: i=1; AJvYcCVan3xAbUseB7TGBi91v/vQI5GaiU0QJGoCGCaamRsuQcImpoS8f3z0CpSzK0hpHWSQf+ti7HXh7fpjYMJE@vger.kernel.org
X-Gm-Message-State: AOJu0YymGUXsoW0WK5VsPlaZG+F54iq/jowbd6khsoX2E0NCAtTQuIrB
	UYHAhC75LzblMpYpvy87p52fGA1zDNEzcljNTsIDrQ6dTtc6LMGi+Zb2ZEef0u5CThzzgCoLkBO
	vNFtHHqh2+BoziQ5SsfIwLnhXyKA9pNMAHzzE8dGhdSvygaBrA3AGFYxR4RsKDOytdHwL
X-Gm-Gg: ASbGnctP96/FTa68f8FCR1bDisNJuW+XeDLJo9SVzN4U+MGxlGq4jCLLvVufjar2uia
	fGbXHTw2ld9tUr5Rj9JaV9kFLlET5FdejQ50IjBt1q6XgEBHoDNQNM3T1c6+cXO3I5blWtIDNAf
	+BPTBU4WUCDurEDyboXeN5MfyNDx0OnPeORbqV/6mqYP8kPLBGJu2nBiXAwlZyEVZ7+uZzjJHri
	dWHzZX3O54fU2n25XWYufvMACzhG+2ne37TgKtjbYARDL72/ga74+8UyCa/9t8dII3MBjF64Qj7
	OfUZVkPCoIQhRXGH8cMFZRu5KwYbYbIMBGyTkP5DHJ54fk8zBujzhuIN6kWzsbkuVcbRjhG06mO
	6mNWtBr35+I/VEwgul9xhMQ83w66M+6KGJxM=
X-Received: by 2002:a05:620a:448c:b0:7d0:a16a:4c7c with SMTP id af79cd13be357-7d3f995269amr1959053585a.46.1750731785046;
        Mon, 23 Jun 2025 19:23:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvirql2XLDma9IdoxjWUc2Yo9Oo5zM03/72H1GEWUIWTzmVc//QLdRiK/ccO0WeTWvWYjxhg==
X-Received: by 2002:a05:620a:448c:b0:7d0:a16a:4c7c with SMTP id af79cd13be357-7d3f995269amr1959052585a.46.1750731784655;
        Mon, 23 Jun 2025 19:23:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41bbc36sm1621583e87.94.2025.06.23.19.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 19:23:03 -0700 (PDT)
Date: Tue, 24 Jun 2025 05:23:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: x1-asus-zenbook: fixup GPU nodes
Message-ID: <zzcog42hu5fnxbhbxoe4tyyawg3fn6uhk2x3nrnvy5ujvfpaqr@x6kapd7v6vpt>
References: <20250623113709.21184-1-alex.vinarskis@gmail.com>
 <20250623113709.21184-2-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623113709.21184-2-alex.vinarskis@gmail.com>
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685a0c0b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=kxFBVqErRWOHaCLb2-MA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: LClc4MTANoGO1N5LDjN0PPaWd1ibXoA3
X-Proofpoint-ORIG-GUID: LClc4MTANoGO1N5LDjN0PPaWd1ibXoA3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDAxOCBTYWx0ZWRfX9vUcKG+y95Sb
 dUmYd0GYS/wL/Xmx2zCpPazp1eBRneMM//m/NWIKEUw9AlFbzwuI96Hb54UnHv6flHlx0huZys/
 BFNi4rMTF+kxooE4uvwIfmgW4wGLwPmCfeleoX+0B1YutvGA+9MSTbpUT6Pqo/Bz1zX8g8ho54n
 1CZXyt5LVnZOM7GhbtxI8Jd6B+/SBAyN4+h8ysPaBU5NySKdA8heDaiSnP4VOVfgH4+Hscoz2oP
 ZKHFx4griUduQBgJer4+XupxjmjeXSk5QxCcezTUW6V6JPJ/vXYL1syzV0QD23oO9gQib8a+uf4
 o76NqNr9TqPN0n+P9NgZ+HhirLmanA3Y6gmUcNWiLWovW3DAovhyuYg7dHQMGp2U4+6syHyZcf8
 abxfppKm8hAz1b7/UWPO3nCjc7ojfa+NrLc0a9VezhMc7V9KWTDlO7RQRt6AotAeAWF9supu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240018

On Mon, Jun 23, 2025 at 01:36:13PM +0200, Aleksandrs Vinarskis wrote:
> It appears not the latest version of the patch was merged. Align with
> latest upstreamed version by correcting GPU enable location and typo
> in GPU firmware path for x1p42100 variant.
> 
> Fixes: 6516961352a1 ("arm64: dts: qcom: Add support for X1-based Asus Zenbook A14")
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi      | 4 ----
>  arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts | 4 ++++
>  arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts | 6 +++++-
>  3 files changed, 9 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

