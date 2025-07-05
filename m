Return-Path: <linux-arm-msm+bounces-63826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E12ABAFA0B4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 17:45:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97EA07AB0B0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 15:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A156C1E501C;
	Sat,  5 Jul 2025 15:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ddY1/DNz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0591813AF2
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jul 2025 15:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751730336; cv=none; b=CfpYtvm0S1D4RKhQjl92ssrL3rLGK3ORLD4Sgmb6KJoBhz7QC7QeEmWFpgU8c+9uFbQNIpYPOs9oPPVFNSASqWOFLsXm2Y1wf1vCR1EEAf33In6ewNd+WLXVqwjiuVlf/zOaYJraQfVhY79uevbCuYroEQhTHaNSxQTLcftR4Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751730336; c=relaxed/simple;
	bh=yWWPchJDOEJzNKI7PhnMnFOZ0GZ0ne8vIao2wtvARc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNu/WswI0Gp2Vz/3aYY4JfgY9gf+y+pNZjN92uqyGicZ/mop/hBmlPaGEpIxZz9nvRx577qYdys2KwN0yY8A/+ldRko+eM5Fsjb3fEP52pQPctFdf8rsJSbuPc02qgR1C3jweAMID82NKtoBHaFs2cSYsrLCzFS7uNxEkteF3+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ddY1/DNz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5651THFL007989
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Jul 2025 15:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RqPSWAF8btgqGQx2RmoN6IKt
	lOrg2Ps03GpJ9+btV+k=; b=ddY1/DNzQl+wCtYQrNwLVGwgZKGibGWLuLHgpgUg
	vAviCZV+Kl4Nnl73SxPBrU6VXauvAQkVXiCAWAZa16BdkWOuWTKjUOSVESTeSOBc
	8/68GsYyq5LD5aXe8fVCZLq1Y9A7fdV17Wfss1Jr5ZdsW/SFEE2M8gRSs9BqT/Ai
	jhoy0eAwc/W3kkXpo2hqf0NXuHa4MTMbX7s1EEIdC/jUD+8NY+GfGiV8fraupkFX
	IWP3sDVQ3M9ar7ebLaZ7MuVH6Y40xf2zRNemdVs8YlMw0FsNjCJHrZeau03UUngr
	8tWrkDCQi0BqvKzTIhtDGRFi9X678el1ZbDFDZUYoHhTzQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdq9kne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 15:45:33 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb5f70b93bso26303176d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 08:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751730333; x=1752335133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqPSWAF8btgqGQx2RmoN6IKtlOrg2Ps03GpJ9+btV+k=;
        b=c1FWafKGenAdEbNw4R0R2UdZ3ooMMMSWd+6egAomvP+5mUoBozytLvhhaizY2lZX/b
         Yg6ATYqU8obbEAtGdAlovqsb7Hgbv7iJM+SsuoT08vEkKDpqKH5gr9ZGhTcmjHm+HTLs
         dDhpzVLO+XJB8ZTc4OFIft0HxodtNY0Ky9sWDqJYNDTuHSseR+US8qg7V4cgkn7ZJBWn
         /zTNGlYkiHzjluI6FVIBCpLN39D8+xfGPFfr75ro4tw/CWTv/0frNCpkVdrUupvmVHV6
         Sfkiv3NpRg5ArArPAwpRefvHoB3HDoTHJM/Gdvadup8finTbVgLibVeqP+yuYYKJkccS
         MJgg==
X-Forwarded-Encrypted: i=1; AJvYcCVqQUD/5lCPvXpnf5bBmklkdK6iAC4QuX5IeKypEm/FPpm2WZHGZSeqAUSBP4ep5wJ+ZsIKLkCK6eQuMu6m@vger.kernel.org
X-Gm-Message-State: AOJu0Yye8W0Bz7zyLx5gA3lQe9OgIRWzHtnwJAb9i2wpE890z5qUvOAd
	BU57GLCyT75k1VFn3kHT6QRpBBaykpQE6CBOI4r6JqvZraBZxQ0A0hL/75HhehyXILoOETE0zhm
	MggGRZKwXQ9hjKg7X2Ewvz85Gp9ZEcElagqgpUhPbmhifRRihjyGtzAl9kl6HtipLEBoo
X-Gm-Gg: ASbGnctaoQFW0VbuyAbgyOJnOxp9Uoihg+yCHCI6yCKH+xW7WGJQ6WXa2Uu0U8mULoz
	O0o71Igt7dhlPf3YtLunQ+W53bx7+Dgj/93skTLDWC453rS/NDUouDI1fELQqnmso/6ntf8s1PG
	T+D06zVqMaRPH0EeGkkVHRF4mEa/AQaW8LbD4IbwYXMsvyxHhaYtxT4rjzpvPGRHnBskn0c/Jug
	e6juUxw5s9/YyQ0TpcV0adNE0m13byQaK2RyI9RU+bJVop4OFFWAL3FLzSJRMDcpIPxxvsmEpS/
	AemXEcf844YcZJ1lVui17FT9FfTyyO+VBVBYWuBBXIA+VzvXm32LETgVcnfiehigbPDKxnEeFTo
	yu8O7SkYxp4oszXutH/0KL2xB2yi6NyWZM4Y=
X-Received: by 2002:a05:620a:4150:b0:7d3:f3e1:b8db with SMTP id af79cd13be357-7d5f10fa23amr305355685a.31.1751730332701;
        Sat, 05 Jul 2025 08:45:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdQQO9z80uLLq2RxC8dU/JD4SNPSo1XPiRPBeKRm/HHhGqxbe1NBor478/kV8KQ2/9nkaUcA==
X-Received: by 2002:a05:620a:4150:b0:7d3:f3e1:b8db with SMTP id af79cd13be357-7d5f10fa23amr305352485a.31.1751730332313;
        Sat, 05 Jul 2025 08:45:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55638494f06sm609028e87.121.2025.07.05.08.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 08:45:31 -0700 (PDT)
Date: Sat, 5 Jul 2025 18:45:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/msm: Take the ioctls away from the KMS-only
 driver
Message-ID: <g7vusfodm52goeid27twl7ocspyf6zfl3zsxfo3jolhjgh4nng@oz5m3xmlj3pp>
References: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
 <20250705145242.781821-3-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705145242.781821-3-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=6869489d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Ff70caK0HrvyZWHSuAMA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: JBaMpS4HQS1oXyVg83E_TcfKtR1UrXdi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEwNCBTYWx0ZWRfXxywAiQyvMHxz
 AuRIn9Bzl9wsII2y5oZDk+pc3uKdd2G2o8h3j5QAZw4g9F1txzTCQ5kJHrSq82eu+yLYoxgqh5d
 ybpdp6jMDMWcE0uFIVELgvRXMASC3rah92t4/4Bf+qjIyDGbcsEzxBtHxyUanF9mzQjPl63LFsv
 Ot8MFAv0gPiJ8yhzRrCvX63HSW1fU1T8URwR3C7D7JB0pr07tNs/YWBAqplT35/VxgniyNvPiMu
 G5KRl32n5TvC4nIgUTb/JtFzTJB2TywSJULvITlVANkGsl+/szgE2hbi+dwZ4QUYMUEK22422/o
 eq2UH0yMp7KTU5TBvWMqbGbHPgfg4W6TeB9mNzV7Gs8J7YSCBBr/aRQUF6R+bLTuSrVW/R8Dn+j
 6npLCWcaeiNfjZv8qqwd/tVGL/+3hiHO61eQCkkoCG09rHN0Fs0IfaKSz+V9xFy0wDoBXsQ4
X-Proofpoint-GUID: JBaMpS4HQS1oXyVg83E_TcfKtR1UrXdi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=685 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050104

On Sat, Jul 05, 2025 at 07:52:41AM -0700, Rob Clark wrote:
> KMS-only drivers should only allocate dumb buffers.  The driver custom
> ioctls are only meant for the usermode gpu driver (mesa), and not for
> general consumption, so they don't make sense for standalone KMS
> drivers.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 2 --
>  1 file changed, 2 deletions(-)
> 

If we need GEM IOCTLs for the KMS node, we can think about it later.
Let's remove them for now.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

