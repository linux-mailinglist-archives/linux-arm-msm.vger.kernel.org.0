Return-Path: <linux-arm-msm+bounces-53902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9283FA84D03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 21:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DBCC8A72A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 19:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61AEA20469E;
	Thu, 10 Apr 2025 19:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TV4G4NM3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EC620370A
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 19:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744313300; cv=none; b=JM1rE5grFWdhYxL3sECkZOm4q6VizVWOK2jg0GeCWDL310/A77RLq0QeDnq2x91rfbfKeE0KvowaLbXiJ817g2OyLMkKViDhi6VAQCEIhxyrIIGTh90oYWrkXQiOGkK6VI+R9aW1IiiBMx6bRKiE5GmBk6DKvqld6rgnmqZzetI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744313300; c=relaxed/simple;
	bh=H80J0sRow3qRWLG6y5ih4tYqVF9/9Fl34cj+U7stddw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uBN3rnca2Wu9lDHyIkS/4suNb1T4Q3b2WUioopVXIwsZmBUHMC7mlvYDU4c3qux8agTs8SGeP5iYU03cPCPKir39KJmYvDz57VstrRbC1JILqtBDsR/oCaMqfUBm2sHqoCjT4N4Fu9IHb/4eQWeYTpSCwqHHH9Cx9psUPuE3i1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TV4G4NM3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFoU46019634
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 19:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qh0Ep6gRYMgrzLkSqX3dxAeXJYkCyrxkcSbtorndPrE=; b=TV4G4NM312v9HVjc
	4D+iftoKVsdsS1L546pNBCtLGMuaUjOi1i+2q/Rc99W3Gy+RKhX/da/xJqB9aZjP
	veEcWjCTpQi3x6EUD+9YUCNH6qpCMRDPD3UvOx5BixWbOrjSUK6D6ReErtp/I72r
	+lcckd1McY3/c5+PLVPa5IGTLerXSEHtzfPhXFotyqtAtbQ7Qj2MoZjjw7IbCqbm
	vfeAHOLFn5A3x2LyofkyAPTArhTS922s/mpEbwNoYRrmJx80ytRVpzOIgedLLfat
	PvWxdArk3gO6xLndoArp9e/BlpUY5sYu4V9p2ILWk5y4j99w5BkcMBk1ePzeAMj1
	g2UdGg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrr9g9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 19:28:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c790dc38b4so208103085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 12:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744313294; x=1744918094;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qh0Ep6gRYMgrzLkSqX3dxAeXJYkCyrxkcSbtorndPrE=;
        b=n93IISm7Cx/dMLK/zX32NfavI17hPoGu80vlhdS8gbo9HqWdp5aZ/S2lMAkLhm+ixh
         PmcSR1aYRehPdhm3q2I4f20Ree95s1K4KdEh8nyyC4pC0LYmcAhLHoEiXcMRPAHnMgSN
         yYV932HRG4c1CWh0CWMIqW3Nq0a/gvgTbB7qmwBn91v1yUnF7t+htAoF45HT1Z5lczha
         I9zwarAXDvExUBH6OGYxKTldxAGtY44VM2M78gZz4SGBrwDwVv/4ZGGAVdb6elv7xhGK
         o4dwv86Mv3SaCAgQiVch+YDv5jRgZkuDros8562U9i1VkATHM0O+Z71l05BiZ4Fkubye
         K5IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaiy8PiYDCiJDukArO8Ok++MuowZVJ7+DjVdqPoNXQFfavHjB3/eh5++4F1yyhIDPSQveSVrlpcB8Q0Z7o@vger.kernel.org
X-Gm-Message-State: AOJu0YwjHecVrPjME2iu0sHReF0gJYA3c/1mmZMHlp6ToJi80sm4K/N4
	kokSnWI3/rsI6iQmyps7zSMpCS2atQEFr7YtHyei9Q8JNUF3JWHTxN4AeOhLCrrnVNG04qvKMkH
	u2qdcPxN5yh144D6kGmQBRbH6UDCZOYZTmNPF2d8rF38xRatjxOLMoeMJVfIBHj1bLxclAJAc
X-Gm-Gg: ASbGncvHH8OvzJzzG3uXnl7sZ6X0I3hZT0J+/4+sc63o4XwboSjB7//MkZzqGYlV37L
	yZlFIqZaZX09o0weqe7f1wKB1puFshyNwvNwu+G+Ps+dcKCBjOpB6MT2d/AkNWZD+k45W1RpWOa
	odctBU08XMUemh0IrUgG7i/lDCcPFtSWyKFVXQ6YeCuvZ+2CEgU7o46Oj0YXnd7mESKlqMT9/CS
	HR/8RpJrZr4brUajYJr/+601BudB2ju0HfvXbjKwQGpv6e4RvMeBju0buyr4r+Zr6Ah7aMOmwQ7
	Ya497cl3qsdyimFVEZvXFxql+yj51RvHuAnrOJcLCcd1mCLRJJcvPUpxTSNad1eSJ4HGw8iI3YY
	=
X-Received: by 2002:a05:620a:390a:b0:7c2:3f1f:1a15 with SMTP id af79cd13be357-7c7a765e51dmr560004885a.8.1744313294003;
        Thu, 10 Apr 2025 12:28:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSpgRoH6+EQN77MiLX+UVvWsFRwqYiRJvK45u6T/7sV2nB5QKrHoRaFMSU86+dK9p42cd08g==
X-Received: by 2002:a05:620a:390a:b0:7c2:3f1f:1a15 with SMTP id af79cd13be357-7c7a765e51dmr560001585a.8.1744313293707;
        Thu, 10 Apr 2025 12:28:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d502654sm227020e87.111.2025.04.10.12.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 12:28:12 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:28:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 15/19] drm/msm: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Message-ID: <ljqytcjityeqrek5ik72duv3oblcapm7sqysminnknud34x2v6@gmjngn7odejm>
References: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
 <20250410163218.15130-16-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410163218.15130-16-ville.syrjala@linux.intel.com>
X-Proofpoint-ORIG-GUID: E2xGLappEWyHItXMkFqTLFfCaX1lkr9T
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f81bcf cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=XR8D0OoHHMoA:10 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=tVI0ZWmoAAAA:8
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=2eKwwukf-V9ccoo5c-0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: E2xGLappEWyHItXMkFqTLFfCaX1lkr9T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=891 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100141

On Thu, Apr 10, 2025 at 07:32:14PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Plumb the format info from .fb_create() all the way to
> drm_helper_mode_fill_fb_struct() to avoid the redundant
> lookups.
> 
> For the fbdev case a manual drm_get_format_info() lookup
> is needed.
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/msm/msm_fb.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

