Return-Path: <linux-arm-msm+bounces-73924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2463DB7F685
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 189E63B2546
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 13:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F593043C4;
	Wed, 17 Sep 2025 13:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAuYzaPm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AABF2253AB
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758115907; cv=none; b=rY57VXdwEQC+mS1+Vm+fdstBLL/wRbTMqOUmL3RuucOLaR8+EOZVPMvv2Jv1b/B57sCxRQ6AzzketzpGc6t/f1pHIf+6sCKv5pd7ZAlY+/0I6/h/wYtvES4nagUENs6kiK7RTiEg13PzPsRoz7FjxnhYWGfi5lIWwCNeEdpGwNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758115907; c=relaxed/simple;
	bh=sSu/tvhqvGYLoATR4KdHdgOpDxsSaCXZAjYdozBlY0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQOt+2a5FdLum1XvvydSNp5P7BtkCgoUcdbFfcKyGhCZgzcy1w2v5zQWtjcX6p0wwwsUQzKhhNfbx/hE8xeO71pn4Zk3KIARe5RwaUGmaoAQfxrNS+w0rrPfsrm/2UmfhjyButOlYY77NYzlINZYkvKXgYvPn4X4/mq5UKDRLbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAuYzaPm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XZa3032419
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5i5EojwIc6UENkuaiTfVkmrr
	3rtqFyYb9QKR6qLAEmY=; b=ZAuYzaPmgQTm3NKy0jOaa/j/83FSQcTPNMOoC7o/
	G3pYVlkcAC7ke1zx+ByEiFljza24bkUZ/WZ+gZRNDfh9x/h0N7PkGYRfq2tuJbbK
	24y+oKCMX/0ce2j7ljlaW+lTzkRCJkBYRk4BBjIppWerbCkRziGmhX1unAk8mzJl
	qZTlIRaXKWU64ayFRaoKb38ahaN8izH2jYOiPiR9+PQJNnRyvyGciGmNi9D4phK2
	QyMitmiM6KoOy9jlbXrHUnQTv5IhhwTIi2X2af6U2e80/KEStcJF+SwxYxnFXLrb
	wc5JRuWWq/+KUoEILKGeACQ4ojesmUdc02il4mY75EPLBA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxyjh13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:31:45 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-54a636b786dso162773e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 06:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758115904; x=1758720704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5i5EojwIc6UENkuaiTfVkmrr3rtqFyYb9QKR6qLAEmY=;
        b=RvVaeQeq7cOUU5hdk1rv6xnccPCXBVJ28SeENbDqNKC6wVRHZMn4xFS5Yoas3Nsqg1
         vjshZ6bkCeliCvsUxYtLQg3aYMckPjFprMC7OaKPICAnqdbDJqwfxsIXO3t5hq2ktzVW
         xEAELeCXdifGJjZkvR7mFwfmG/x1nOXpYDJo1TJ9p7TjCO5v4tku/znPYM2IVSyUebuF
         g77wzBBUHMGogrF7z/NglcYVkgUcfogQyRvfcrYPvKjSTj2duWkFaDQ8DYfxERBoOzud
         UTh8gYS01scRl6beoK6AMd+9tW9jqTWhUIVqaH5hec9Yv5R9+SKi1z4dDPSJ6R9ixJVK
         KwZw==
X-Forwarded-Encrypted: i=1; AJvYcCVsDFl3BGnGEMoA1kfIz/0v+jUYI8bmep++Gef+IY/hXcKjSUFYrxAe4D4VfqGphjENZoEdM864H3knAEjk@vger.kernel.org
X-Gm-Message-State: AOJu0YyGOZEJebsh4kx9BRWju6jhTjL0pkV2voKbwMGmCFPUM76eHWQy
	fcNpbECxxWhekI6xZBFUfM/tDvaAcOhJtSKMo0/eoU0bPfYF3QA7+pMTCiPIUdFV03IHjBWfGva
	RrZuZQiK2N8r1xspmQvLOzhCxmnYBgMGEekcbtc1O7k/jKSp46VWeyTPZO/kA7Epwr2SBDpC6O5
	1W
X-Gm-Gg: ASbGncukNYzWN5cpXjrTZpjXgbeKO8pgQSQL2mxlCDLfRcPfdHyweEuP4RjdnwiI6Hk
	QFURT14dScH16Mn7MphMC6tofLpc4FWsh7WEMiA49HJCrd0qrgjmu05YTVeO279wWMzo0arsK7a
	hINkgkWqxZQ8EKQu/Vwuy9myiHHycSw9ZoP7qs6Gh1X1DdKOWhql/kDOpEf7iJh471CQx1rhtIj
	iZc0CZItC9ZbNcc9z0wwhREktU7xGBPfG9mVbDXNxtcTdN8nU/tcX6Dr4E0AdX2frC+4eczXSL5
	GuLQu0+BkaHTriKvdizjAjpOiuJ2jS2eRjHV5U3tsakpViV7CoJSnieg9ceASs5MEKA7R1zDage
	66Ny7obbpTtkmbP6HMZkmAWVpVhkWPVeEIRSJ8JE8pfeTo+xya4M2
X-Received: by 2002:a05:6122:88d:b0:53c:6d68:1cc9 with SMTP id 71dfb90a1353d-54a61017505mr680082e0c.15.1758115903902;
        Wed, 17 Sep 2025 06:31:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwq4q64y9pQGinUlifknWoYSXhEvB2/AvQo5VNejvkufcP3u8FaU2REsxspQMlZ5mlOaHufQ==
X-Received: by 2002:a05:6122:88d:b0:53c:6d68:1cc9 with SMTP id 71dfb90a1353d-54a61017505mr680052e0c.15.1758115903272;
        Wed, 17 Sep 2025 06:31:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63f61sm5088913e87.71.2025.09.17.06.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 06:31:42 -0700 (PDT)
Date: Wed, 17 Sep 2025 16:31:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Flatten usb controller nodes
Message-ID: <kqqaeyul4us4el7zog2gaob52o2gdji7eeiokozylgxk2gvnua@4gcprzdyhfty>
References: <20250917123827.671966-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917123827.671966-1-krishna.kurapati@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=e50GSbp/ c=1 sm=1 tr=0 ts=68cab841 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=J2N_nXOhfcilw9lcM9MA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: JNRskOkC7cP5j65RE_TwrWkk4BhnBAaR
X-Proofpoint-ORIG-GUID: JNRskOkC7cP5j65RE_TwrWkk4BhnBAaR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXw9qg59gYNMr4
 oNCYKJr/Y7rwDfae7d7Br+4ir9ZGbNdW+Em57+jmmijZVl+Y7ktrIT9NDHb5wpJnq+36HfQI7Hv
 G4/fjrfhnEeWKSRv6dch/VWxCJ46BHaxUWn2/stWSiYnr1/6bsHCnHHt83I4j5KfX04Bn7OmViz
 APdGoVaiq/MDZ1N2f1W5ljTKZpw5wVDmZkxO0UQ7M+UU8GY/mb1m6zV7CwZ+vzEjTJpl6HSrEEm
 HQkOTDF2esacnXjnEXsCa340cjPigIPr/sb3H9csF/+B+4AfACEIsyNQV7xHJhMH0QMswM6/2EI
 BR1pvkO8UvGVCkZd9F2SrudtMgNdRfVDQSYhjD40CMWRupv9wiI4FkRF5vafIusBtOWLe+9C1fY
 4axBlZc6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On Wed, Sep 17, 2025 at 06:08:27PM +0530, Krishna Kurapati wrote:
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach. Enumeration of ADB has been tested on EVK
> Platform.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts       |  6 +-
>  .../boot/dts/qcom/lemans-ride-common.dtsi     | 15 +--
>  arch/arm64/boot/dts/qcom/lemans.dtsi          | 96 ++++++++-----------
>  3 files changed, 44 insertions(+), 73 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

