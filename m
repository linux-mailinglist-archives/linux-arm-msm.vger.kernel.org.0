Return-Path: <linux-arm-msm+bounces-75211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 608C4BA1B13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 23:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1171F3861AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37806275844;
	Thu, 25 Sep 2025 21:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lbaTtvra"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C431325EF81
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758837258; cv=none; b=kiOZp9vhew+BBCxmYdPFELASmxKTO40tTss9sd9meS2j/hKqxIfMCFI3UkuNgNM3t/6ULgcO79mkqXTEzy5vB02ie83dG/p2hBJ+mR7OrBYTzIq5qqfEqnqlCR9rpVGtLyWF+tdwfzNSWwSXFuq/muDp9h18OFcO2ozDLD4uKiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758837258; c=relaxed/simple;
	bh=QeCnORvLJZs/1yAIK5MJvGXh77e73NS4/ETlZdo7tfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpR/izl3WsGlIpTr2LSkT6x8E0yNUzDqDhucZ8jDZqtTfMSb5ru7K5/upylPxlkn+Vlpx61Z6v3wCGZySy2b+xFvMBf8hMLXDLKc0tl6ChjY5KEN67d1l59DKa4i+tQbDswzpbaI/VSn+5Jmrx+5pbBQesj7NIeLqioLDZ6mUoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lbaTtvra; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPns6027798
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V77Z5Ho34wRfniMvExHw0L93
	ufuCYBEpuq3QobQDp/w=; b=lbaTtvraUQayXHdkdf/MuJVtN5609Gsu2GmI7Hb5
	gcfmYkWM5XUxTaHzt5TGMeg62HIZfX/rsZsKHXsV+bvLp7/Lg1NzvLWH+A2qr5a3
	Te/HCFlvsOOpdA17HBEgzTCWJs8/NVckMd0WiTCBqWQmt1KAbOgqMFik0OrlorwN
	9JdyOiLjKtR6nuxbgY79eRKQcWfD4m1SPJSpAUT1xz+cRfWkhxo9Vds/RVO+cVkv
	0Hac2LP0/f7c8CiSClOfSAPsGWkfn9/u9UEExcTMjLHFu4ooSlo3VQXYwQL4AAgf
	kctlhSr8mP/DTa4Hhv14X6I99W9gLs451RIRgfumhDJ/7A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q0gap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:54:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4dd6887656cso2613521cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 14:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758837254; x=1759442054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V77Z5Ho34wRfniMvExHw0L93ufuCYBEpuq3QobQDp/w=;
        b=fQGmUngwJ54BaMHrV9Be+Z9bKXd0L2hBjiLNMiCe63hzxmnxz68R6IYhH2M8ZPUx6V
         iiiv7+InMd/7eE29VPbzRTSTFKhufb49qnGIHagUulmjV8AtMEIn+sz6bM5k+QxjRT0N
         1iy/yBQkN03Th4iGtYZCywqC0vpiL8cOnIQClvBb4Q+/uzHSZj/wtLfusylPr2e2/ZHZ
         h/r8AClC7KMM/TADoB7W+Y2Mo4r4KXWLr5YcgnhUq5fPJlk69sMXL+alqW+QWHUiskKI
         20FLYNbf5hxa5ZytLjgabvUs8nutyaTI/UweF13+NvaNhp6z4Eizz+49pWpxrM96+LHG
         M7DA==
X-Forwarded-Encrypted: i=1; AJvYcCWlQ0qy7UceiAKHDcHV1U5lXALuwMQHbd/VugDijS04TvvCJZTEE4n8N8u7J4xR/xbX/tRsYPVefw1+DXhn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+UKoKNM2mnB/FPXKxjQXEuIKchXGayqP+5/5Kq10TBLh/pVgF
	sTYC00BGW4+i28S1m52EaFGQtzMo7Ttb2ETb3EQM8N3ORyWTr4b/jaKlDaaR+wWmD1ukOhqYZEJ
	dR2pPvIz1dJDGF+gqKYLF/sYNhZMypypvsn8uIpmB/Ni35dCccweo1nLAE1LqTaS7iY7x
X-Gm-Gg: ASbGncsCF2igGMpn5gmhHmYuqNoXp83Zmk/il6cdECRHQxdCbm96MGM6qcyKiUL4h+N
	olr4xLjTTwBXYsziMDwuguG4u/zTKoYVdipWDOVnFzvDE9nu2EstZpDMYQBlm4HY1SpxZ0o9Cej
	/UHHlVC/45WAfY30UMXyioyVXxNqU70Betqc0aGjkuUMLZjF0ZGO3AEPvKjQ7JKDoSc6i0Yedgn
	PcLB0sqDFipPj4uXgMKgs+F4n6v9qjmc6Wox2ebW6M5aU5hF83EClGvaAsMbdtpNXdd4m6gXN2P
	rfsMg7K75/0+ScCr5V/NOceyca7NrjGJenUlXm/MYQvlDyPN+qjLSC0coCKfnqh3MsLAAS68RR0
	R+66Vzmx+qDWLUzlm7Wmkbq7r0+uSta8DCeC88j/y7osxLJrUwy+H
X-Received: by 2002:a05:622a:1a0f:b0:4b0:da90:d7d with SMTP id d75a77b69052e-4da47a1a220mr67870361cf.3.1758837254468;
        Thu, 25 Sep 2025 14:54:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyFRxoSrrZVyL5ZFN8zm6WyGWU2qPELuXqbOoO1z14tsOOdtn0pbtF7AxjejfvrN1FriBxtQ==
X-Received: by 2002:a05:622a:1a0f:b0:4b0:da90:d7d with SMTP id d75a77b69052e-4da47a1a220mr67869871cf.3.1758837253974;
        Thu, 25 Sep 2025 14:54:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb4e38b04sm8222961fa.15.2025.09.25.14.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 14:54:11 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:54:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v6 05/14] phy: qcom: qmp-usbc: Move reset config into PHY
 cfg
Message-ID: <d72npzj56ng2lxsmbmu2l43ebag4cfyhou5322kbpsutn3nwwf@oi5ibgajlfos>
References: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
 <20250925-add-displayport-support-for-qcs615-platform-v6-5-419fe5963819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-add-displayport-support-for-qcs615-platform-v6-5-419fe5963819@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX4XR8Oq9kw4j3
 EKUPL/+i4Jn2Ok5e5AIhwa6jkvpqsUNZ4GJTW1Ua3uQ6AwAUeH/2dl9nndsayDs9873QGXgzDG0
 ZMq+Gbdoz76bsUWGcxNkFyP6l3Iv6/Xo0MZgOSRnD3hzZUEWJ7y8N85DGzxTcAE1ZLdCGxyA8p+
 Cki4EePNtO8GpRIAN7TCysg+PRXw5mLhh9z2mAFsDFWJzG0fgwwTjA6OyXgSiFAtaMnKX+j3gKY
 pkJeYXYyRtWMaiwA1X7c+JOJWnEBDfq0eIWcB7n7WTWXcaXWp1Y72DHr/NrgHOnmnaf4sXHm+pT
 3i+6CaVlbQKlZMcoanZOhbwYBwJ0+EZrNCAVHmF9ziY+pvhFdKTe7hgtJxNJ5pZVcOBvQdn2BD2
 KSX2j7BXF6aaNDT/CC2qbs4Q0haDOA==
X-Proofpoint-GUID: M0QdSRQCpP71p1AM-Ji1Y3KinPciSe6l
X-Proofpoint-ORIG-GUID: M0QdSRQCpP71p1AM-Ji1Y3KinPciSe6l
X-Authority-Analysis: v=2.4 cv=JsX8bc4C c=1 sm=1 tr=0 ts=68d5ba07 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VJ1vJixsNvIt-2Mg1ysA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Thu, Sep 25, 2025 at 03:04:51PM +0800, Xiangxu Yin wrote:
> The original reset list only works for USB-only PHYs. USB3DP PHYs require
> different reset names such as "dp_phy", so they need a separate list.
> 
> Moving reset configuration into qmp_phy_cfg allows per-PHY customization
> without adding special-case logic in DT parsing. The legacy DT path keeps
> using the old hardcoded list, while non-legacy paths use cfg->reset_list.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

