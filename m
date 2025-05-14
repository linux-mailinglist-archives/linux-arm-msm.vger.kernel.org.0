Return-Path: <linux-arm-msm+bounces-57970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2439AB7590
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AAA8188CB7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE905537F8;
	Wed, 14 May 2025 19:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XWhQUa+V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC4C1DB363
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250159; cv=none; b=fvLeLTgPjhuh2izrQUANcxEx1xtpvYoYQL+L9Yt/yxHn4pTdwjmehvP4OVk9gdX8g76bTq7iI1iIQPICkvAB+IMk1TL8Q/zBl9jUrAZ47VyI/ZopiJQxtkAIowCgO8bhHuGYukcugAX8L5kwjknxNY27KvAaig5hcLL9TSOYYSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250159; c=relaxed/simple;
	bh=yGq0oWYOZL4p7OWYU2T+E/IR3DXTkh+/Q1gAyQq8y2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBqsVSQPAHkiS7ze0jfQjCjiqg8slr5+yVp/pkDEBDGw85X7NYAZyKu7tEM6fE6vGRT8jJzn6puESd3N77G/AvzzgbaS//4uF96gnalnptTI8wlO1y4DXRrVxW/xQ72n5pFj+x9OnJ7/nRjFLN9iI6DNJNgdSLjEH7Z6iwrZn98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XWhQUa+V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAv7D1016744
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CSXJafEBndEZ4eDNGwf9CSLO
	amluuCqjk3lNWaZUCTs=; b=XWhQUa+V6rN2CsgxftM/tNuwyqZIhh8kyre0Sm98
	fmFSfoT33+sOOKx2N1rtffKE450g9zKSMuezD3zxgx9vFLHlUVzwsbR40vxb6CFX
	vXWyEVBhbwIQkVhMmEhjsLFZ2V84ru3hR6v2Wx4Cmx3fOAoOPusOT6mU1r5GwfM9
	3FNRyCQggbDrFHRtbJK5/Tgzz58H7T+j8IMFrgKQx3yIQ4svKaamvPptHW6tYSg/
	YDYxuHqaXYmeoJoexQVRi5cl7uDntwhiyO3MebE47dcw1GpL5FfQevN7oAEhzCyn
	0hMoBRue/7NUAGNZHfHp+jsK6hOIdS+SEm1DdBefDvKgdw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr3qsj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:15:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5b9333642so10542085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 12:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250156; x=1747854956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSXJafEBndEZ4eDNGwf9CSLOamluuCqjk3lNWaZUCTs=;
        b=M2T4fqZNfeY2R4P8LM9QOOvg5yEA7g3ocBB4LkIHQMovIZu9ZeUArG9qfxihI1LGx4
         FHDsD3x1siaWb/95Yli5+HIJpfoglC1hT2X+JISLqWjB08eIutHub2p7Uceaikybp6Vs
         brWxuf9+uwrV6kwxco3/rFWLaQWhGOqhmWzj8LbWRuwb97Rp/MYPA03f6Dxko98ZeNLE
         cuUxc42tcOGg8fy0TsKnV5zrr+6sucjsV6TTf6s0QOPUcZELxtsrj/IPv7o3q4kHPdmI
         dWoNBz7P97PqUgCYdWym6BIRp36FByQ9Fi7hHgiNZFRnAPmql3Tqwj0z8QuguROplkKQ
         JNJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6MVCkKk7jOVHmUj0pVtk5LWznbyZmECFx3E9M4wckW1e1vxGeYVPgoKGRlthhgr09BMgbYN+2vfwz6I2f@vger.kernel.org
X-Gm-Message-State: AOJu0YyOXhtpdz+52UxD4o69A0mZ5my6J2npR5flottNVIi1Jyg7V9mY
	E3MqYxJP3XbGFAui0loRXPX2O/uhPNxkd8TFZdsht6OmDfL9EEN3r8Z/2ozUHscZxJPEzbidxME
	94gNuYnI96AnFaBelXjzmqeqShnmI72V4GMyOGcv7cZtkI66X+9e2rihrKpeFPhaD
X-Gm-Gg: ASbGncv6YufH+5vIQOEsm4C0K7fL+ADEH+vQLlGgB2oBVcCCdPW/5i5h5TEOVBzmAaB
	6dWfqcFPBq7YQpXxhPP5ZyYdwlNmntr5Hjj5OOqWQpCWF9n4tcOmHBegMC4le+Y1/Dbfdh9vzCv
	c74Qw7LrMeGkZRxD+0gOa3M7YVw7JDY/U4ylzuwgYx/icIsgQ3xttg25+YwoJ4nTa1F6NI8VAHO
	S6gizSrApl8YaixAXdpqWfuia73qHEeus2EW1fRpRo0pK4WQRsuIxHsRhYpCb65Z+8DdevHBAFH
	AoLSIv+QRdg4F0Hv8RMHE+4vi9juhFMjwQ4BZ0ZTie61WWexzErY1BicJLOQQpFZmN74ZO/WYA0
	=
X-Received: by 2002:a05:620a:191a:b0:7c5:49ee:86aa with SMTP id af79cd13be357-7cd287f8f48mr580084985a.4.1747250155810;
        Wed, 14 May 2025 12:15:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+lsR3EGAqk/P0sGN2G8T8thDbUtAJQH3vvzCa+2jovpUXOQ2pgDytWPOHkOaAfe49pPOW3A==
X-Received: by 2002:a05:620a:191a:b0:7c5:49ee:86aa with SMTP id af79cd13be357-7cd287f8f48mr580080185a.4.1747250155227;
        Wed, 14 May 2025 12:15:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64ccb9csm2355737e87.234.2025.05.14.12.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:15:54 -0700 (PDT)
Date: Wed, 14 May 2025 22:15:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v2 09/15] drm/msm/a6xx: Resolve the meaning of
 rgb565_predicator
Message-ID: <3btixgw42sg6qm63znc46msxeyzvutitokb6zxbxwftxyyuyw3@22rlivbf4gvn>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-9-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-9-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 0TJkh3NabEPYcZ2u1rz5mcrP3pZJBRD0
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=6824ebec cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=pZ1cKns8_n0M6c_4lVMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 0TJkh3NabEPYcZ2u1rz5mcrP3pZJBRD0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NSBTYWx0ZWRfXwmnHcFejBqua
 uiXGAh3V9REa74pjHTsJdtISBl03bWa81ORWY7bVLiNMQZrrRK1mOoT9cpW+OahznUPy2e+QDb4
 fYTwheQE2QRyMkPGtlsBPmjwm+yL5E9WBnWB7at5JcHDUI8vEVwvAqf8A3uciZ27iPuE72iNrJJ
 7zrFJ3eAYum1bdHpJAfp1Eht2fm0H3kp//+JskYWvzDNqEVd2aL7x2hPOHDkeGXeOOIUDthMz50
 eoF3WNRIBeVxp2bL2BSe7glRUHV6hHjneOpy+3ebsS04BGUvpnrO8obT7/qAQ563MKOL9kfhFep
 T79VAd18lC57HHm0foxc9+RCY/mqM8ZxkAyf3JspwgjTBMV5zibYJSMy6tx4ZfHB62j4v+fJpyv
 m5dzKJkHlmRvGD4/98Ni1TgsOjT8Hdnm3J30iXParhRBWQ4iSfN+Mv3qgZq8CRE0SSCqPxJa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=764
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140175

On Wed, May 14, 2025 at 05:10:29PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> It's supposed to be on when the UBWC encoder version is >= 4.0.
> Drop the per-GPU assignments.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

