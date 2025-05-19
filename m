Return-Path: <linux-arm-msm+bounces-58434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DF5ABBBC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 13:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A699F17CF1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 11:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68385274651;
	Mon, 19 May 2025 10:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h+1Xs1jY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E569275852
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652339; cv=none; b=d78pddSnmltzNwjdyxD2EFpGiNTKD7OMQPJ6g1SVeIg5H1ydWt/4uNz5yen0iPGsyJV/8X+7xF+biu7t2pY9foLxl1WoAKyP/80fHFdPUIwIh2opee8/nvYHp7jNBbKPZpaVUAqP2975GV8EwGoYbsaAv7Ig6ENjsuj+Iotx8uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652339; c=relaxed/simple;
	bh=mxTI29ncxsslT5tqzVqzF6esCQbl4MQEJnMKnvcIrjY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sxfzFGHqcZbBi0vbTsxGryR6mesFSqSqrc04L+uvD9xWr8ZTWhNBkQgMBbpJOyR1+Y/c4/jafncUlnWpHRQT4P3Tu/sVfxy6ORFxnUJh3ydioidhqSNIPH19JsrLvhkgvLvIJL/NR0yVaDgyMdDD6Fkd+TSKIAjfLchrZR4GAKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h+1Xs1jY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9ukrf003168
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z4Q4oxnerkJx95uYsxiAX3sxi06TpYgZRYzGCnLdyRY=; b=h+1Xs1jY2T0dXP5c
	PH93mDwWyiXLp+X5kuCwCNvDVFbpwLUZ0zJpLFzBX4NaUZ6Sf/AhbYW4n46ewIcv
	63JxMuERXRUDU+2TpBCH83onhVjK9ZZoHM0P9swGgZW4y3ouDXPUkK6aHGGHzK/7
	ecCnwVy5ZRNjgdfczbOA970GvZ65icievAqVZSFM+KUVFU3jAWKAIVcUtxvfOaWq
	KqskdRMPr9o30y6rC4JAITwqBzIkK8UEInzXq3gleLh4uiJtjZANB253NniK7GRd
	gYTkj/NzlCTCU7nLyacBduzQ1wv9sgTuYUGFkS0XwH+rTHCg96jheJZERIf9IT/O
	cRHwkw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4m23w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c9305d29abso832380085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 03:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652323; x=1748257123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4Q4oxnerkJx95uYsxiAX3sxi06TpYgZRYzGCnLdyRY=;
        b=elaZexvLEvg/HDSD04rCjqb83pJn+r/SWbMBy5QPdswPFwE97WeKTSisfxAiHnyaw/
         B8qpLBqIUYvYaY2cVY13WgwUxOSaAodKoJ/1BaDsjBrh6zdv8VS/OLHW0Wd1ipzGThQP
         s/cJj5jh+c9IvPzGoFSkafeENNN2D0ukXiUOd8JOUxfDBxLZ+5l8r3JTfFkdN3QIJ8id
         pg9YCWA5bGJ8CwrasFRwNl6ptkAzGmXvtEu63bz2NHV8Zu+oNzOViCGR+c+oz+PkwznA
         tplSpn/Me1csBMfbKdSsmdmzWItYz3KArm8knVpgsv8PL0T6cJv/w4JC/dcEAD3rEXaQ
         59NQ==
X-Gm-Message-State: AOJu0Yx1KHZAzH1fruidu593ltAvHt/dvUrRVZipMHHxOVjVZxOYhl8U
	eOPhDxJQFvM6DDrIide0qgGP+bnD/5N/KBn252Ska4yvceLJgVcXgeLg7f9aDIpc62IbLea3e8P
	x/CoVIw/9Oe23pFVsgQCXzJ4wkZ5K+XXiBbvLEaShwaVNlhGIRGmNd5vfXOIqUHL/x1Ra
X-Gm-Gg: ASbGncss7fp3lOX3m74zn/qAyH8KCLzsiMkhHw0v7GTB01eJTyT7XDvWOv1Algzt9Zg
	38OKOxbr/Izyv9dWCE4is0Q6gSCd9pRXmAUsWqGqvc29smnZefxcDfJ3osjz2LU8ntFg1AjqmTA
	+FPngpyL+aOC0IK+413PnoXf5C3IQ2eaeTa9cDhvaLTdCFGceAepnSrQnOhY2c9lf63Ig6Dw/0n
	RQPNdqe0r3XmlrGx9WBb4lsxkP8oIHJIOMZUlwrNFqebHCvWSO0dcrufB3oZL1n970jVPgl7naW
	oaCsC+hxBqbBovxLQ7T76JqwbweVa/AXrn2KO9dE/9iYPHAz/NB16yw8GH1XbrVrbExYE3G6SST
	KTNtbvH+BzUpxKH3rEma67Ci4
X-Received: by 2002:a05:620a:444d:b0:7c5:5f19:c64f with SMTP id af79cd13be357-7cd46708138mr1880483485a.4.1747652322893;
        Mon, 19 May 2025 03:58:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHlC42Wf+KXtGz5HPa63U8GwHGvVVcZg4hklaSY7uoLCUJYftUKkMonRSvLuBDCGCogzpW0A==
X-Received: by 2002:a05:620a:444d:b0:7c5:5f19:c64f with SMTP id af79cd13be357-7cd46708138mr1880480785a.4.1747652322512;
        Mon, 19 May 2025 03:58:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:58:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] drm/msm/dpu: disable DSC on some of old DPU models
Date: Mon, 19 May 2025 13:58:30 +0300
Message-Id: <174637445760.1385605.8148657144550211301.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
References: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vCZWzP3rTo2IcBksmJce_pfXsxAeUgXm
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682b0eef cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=FEuYHSLItigONA-XwN0A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: vCZWzP3rTo2IcBksmJce_pfXsxAeUgXm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX0+GkHjbT0d8o
 S+cGMhe/EPXc1H+ItCtmCzPsB/bbj9xJLWMp8XaBDZ3FvMbAkLz8r0jr9+2k1aP0fCZdXqYG+Sl
 +xU5EesY9ULv9z4A9eAEqLlMa5EPMzrLvPZqejMSzJJKa5ohX8gFEvkkv79dTGDolJP6bTM/dwi
 bFBN2/uTCHyxlp1h/0NJgl5PGZDNpXLJYf6Q1B9+WTBAt7GPvUIQYjZj3v3baKqGZ5qyPaxhpHO
 4DCGwBDrCpWDA9RMak72bCk2/1EMXLVwQeBp/AbKiGzr5e5ycNt91kIrAPUVtt0E1JOfk///kXZ
 pKwiOxrKQ1xX3TUYneOQ9IGEZk6MEeGBc62UaI8nugIb6W3d7lEEru6WuKrBX8pDAbNUMtQwu9E
 7C/PEXMvFSzP3unbhLdA6yan/9Cet1cq6K2WbnUx9VpDlo62s3IsgRGeXRjB47+gGBoxWZOU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=576 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104


On Sat, 01 Mar 2025 11:24:53 +0200, Dmitry Baryshkov wrote:
> During one of the chats Abhinav pointed out that in the 1.x generation
> most of the DPU/MDP5 instances didn't have DSC support. Also SDM630
> didn't provide DSC support. Disable DSC on those platforms.
> 
> 

Applied, thanks!

[1/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8937
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b43c524134e0
[2/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8917
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5be98120115c
[3/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8953
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5232a29ebc74
[4/5] drm/msm/dpu: drop TE2 definitions
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e1fbb0d78e86
[5/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on SDM630
      https://gitlab.freedesktop.org/lumag/msm/-/commit/075667e986f3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

