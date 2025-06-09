Return-Path: <linux-arm-msm+bounces-60661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3274AAD21F4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 17:11:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F8903B171B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 15:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5A01E3DDB;
	Mon,  9 Jun 2025 15:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvYQepXI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E281A2872
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 15:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481300; cv=none; b=lWFXFqLXltqy9cKVyOKM4a0Ig468t8f1y8HSOlHhJwfexthBT9dKNUixQkHqbMxkPOV4SZa9y153oE3Ar6NBNDgEA7N0zsskRP8p1iWlXSo1ZD53OYB6NmRH1gazXo0BVyn/vSI5iNrveStHC/Gz0DupT6iCiAY1dOJizPnuwYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481300; c=relaxed/simple;
	bh=nDTdaX68kkk0ETbUzMRtOvX7XWAta9uFpsel/G+Mdtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLiH+n+rAd6APps170WueQ6j4+1DHxqBhIHHXIRSeZIH3In2qZDqnsz7cXH9CDUZCUb9Jb1oGg5E3ewbdaQceyqqjl8S1kqk32MRAKwSzU/Me1DlGuByVvgFQ41IlSR78lKkziIZ48C/CMnCheCGYBvZC4yS/swi+3sBlbwjRA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvYQepXI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5598OxuV003399
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 15:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eeZOilRRCfOoW7ivyBUSV/3B
	oCRgS1D3Yx7wgvq5hHw=; b=lvYQepXI4nKWo2BFshP/lyWx27i3MIHxl5bxwxfq
	REhRIDK6coQmM/cQT9WPUnEZhgiMF9KnoyM9CQiF4p7lX2QlNwm/ys9HgZXpmUPy
	Ibc/uJU0BJUlFSIBQ/G0URsv83Q+IdbrCvWbNmkF1Rhw9CKRgZ0N3e/Bpluz7P/1
	G/tMK4v8CtKr3qkMvJiShjbuClv6cRtYVa4QJupiv48Yiolh2wMgQt+U3GNPznEa
	V6qSeMvSZGtD/31/B/pt+gDkBZZB63eR8daTXFhA3YJpMaXv+zXgwcSRyIA/eONV
	iZXCYuDg2PjvVpKunDpKjlRRkgv/ajflrz10sirbfr47oA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y1539-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 15:01:38 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-60d3f6ca90eso3261431eaf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 08:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481297; x=1750086097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eeZOilRRCfOoW7ivyBUSV/3BoCRgS1D3Yx7wgvq5hHw=;
        b=J/xp/rBUWZqtpFe5YW+oJzBiBw1B8rRv3cZbagAsgEvbRDdzbbIe1/nv6tP50mL70y
         azFR6sfXr/JFOVkPFvwUFIizWhzf2xaiKhq+OZd7hGOuALn3WTQuwTRSqJMjSZXA83Vb
         xAZExPqD3IyWGHjDyAfocp6NHqSBLVTJaPRaF1o4BF6ApDg3O24gYdsQWn7ybhSIUxUO
         MEBhMS+MBS+Uu10OZBuASkj6jgJz/bhbBuqb3GXBJceOsPDBuAOpuwuL75Ww4VlCOVDG
         M7YD1A6LrYs7h5nh+99Woo2RSs64lzQVrkmXQJNRu57R3UFGDupqrskhJ3EYo0LmE0xC
         lhgw==
X-Forwarded-Encrypted: i=1; AJvYcCUGq83xR4E0YQUTVkea3tvgoJOimV7hH+9D7EuWvHsDjaWwvdU0CdOsY3IwhM6NZQen2eMIqQ8oVXKKGiVp@vger.kernel.org
X-Gm-Message-State: AOJu0YwQvqZ1u4FZADfNX+d/CxgDHSZQqAbvD1QOsTtzF//Kp9/JTgWt
	KcQlLTPNoOisXUYO0L5cUg1K6y3eRK9EvgTAKbDiMibO70QqBgTlupXjzsFTeDukJoExwVAtwWo
	/DOW26bNaEKi/WzMeOOfrTjcak9n+dTwG9idiuIO/WpnpwdaYcvS8zV0LnHdNKf+tWbvf
X-Gm-Gg: ASbGncuirn61ql32EF1MlQKSW9Ui4J+KgaspZGTl1C2Yq1dvcvSgOgelQAIN4soSa3g
	s93BsICPDoaSDznIaO+AdM86x3ywf0zkmgnb+Pnzx9W6Go46mmk7FJjhsPNOuFhB5nq21+RsK/t
	Rob6iIZWbooEtNIYxysmo4PpuDWY4A3eHWilCTtG2PhusiT2D9bGXlNxzwZTCQ8KAW7ciU7D7kF
	1d0eeyKxkaajVerYg754EC8JNDgynVjr2okcNb2nQyd4PAr8JzneQWMtmUsOtF4AgGFaajAfzvL
	sixkbXgTXDi5Fw1OEeLnvi1v3K4Vr2bZJm9O7LmLYMJmzE2qDc2qoO4ZTdEGAgEDkHr1vnl4pHm
	mqsJcA8ZFXw==
X-Received: by 2002:a05:6820:3102:b0:60b:9d5b:e94b with SMTP id 006d021491bc7-60f3cf05b30mr7498262eaf.4.1749481296093;
        Mon, 09 Jun 2025 08:01:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1Fi8e/8Pp5oI9faNSYkOSpVjhnJdV9bwjYCbtPXM4Szgyw5KA89jfNLN1bkno5QUfOc4AOg==
X-Received: by 2002:a05:6820:3102:b0:60b:9d5b:e94b with SMTP id 006d021491bc7-60f3cf05b30mr7498206eaf.4.1749481295529;
        Mon, 09 Jun 2025 08:01:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553677385desm1186686e87.251.2025.06.09.08.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:01:33 -0700 (PDT)
Date: Mon, 9 Jun 2025 18:01:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 30/38] drm/msm/dp: add HPD callback for dp MST
Message-ID: <arfmbusro2nh7axnyqn26v4rjwfmop4q4oxu45ad76jubijnbn@3twddambhtum>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-30-a54d8902a23d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-30-a54d8902a23d@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDExMSBTYWx0ZWRfX8kOD/dhWpJpY
 O/Hj5sp/gQhVUZFWtAdxPdhhMuwyemR7UJyHsHcFtvN5IV2mH1QsRy7FV8LBwfTPDCaJLNuInj9
 Fnz/xiYamg63+4w1kIIFCcal6L5YGBUwTneZD/HjUmHgwr6p2tpt/m+vqhSEDAS7bT9ImuOmm/6
 snMdW/zHxddHyPmEPa0Zp4XpxMaKgzlrCMmRcP0R9rtviWX7PGuSE7AAIiROk8nKYBVogB6wmS5
 JXzkXpenNChGmBSUjS9u+dsmrCohqEoSRHlcq6ahbsfMu0Z53r1Zq/PXsNgL4tPAZyYxrFeYWyA
 b22gMERRhRENMY/WGDu19j7ICS5iBAEsIhwK551EqV6s/lu/ySxOlcmC2ghicGukUjKRExeu03e
 dEnT2ZKqQlqD7M5aDbmXrxNzIlY41ah6QPBByiZoa7g2yfo+b1MnnQsPmhq2gkqbNwdgNXCu
X-Proofpoint-GUID: en3Lj018cjwatTCUh3T2PaZgNJG086ha
X-Proofpoint-ORIG-GUID: en3Lj018cjwatTCUh3T2PaZgNJG086ha
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=6846f752 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=kZwT76mLgBx3J5xcvQgA:9 a=CjuIK1q_8ugA:10
 a=rBiNkAWo9uy_4UTK5NWh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=715 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090111

On Mon, Jun 09, 2025 at 08:21:49PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add HPD callback for the MST module which shall be invoked from the
> dp_display's HPD handler to perform MST specific operations in case
> of HPD. In MST case, route the HPD messages to MST module.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Missing SoB

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 20 ++++++++++++++------
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 34 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h |  2 ++

-- 
With best wishes
Dmitry

