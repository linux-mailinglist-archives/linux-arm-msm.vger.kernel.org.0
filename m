Return-Path: <linux-arm-msm+bounces-70392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6724B31697
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 13:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02887A04BE0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB842FABE2;
	Fri, 22 Aug 2025 11:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OiaUG0Bt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620EF2F9988
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755862952; cv=none; b=sQMHPWffUIZAEa14KQeO7tr23VU3qmGvPcOsI1CGCMXtIaQVNRpJohk5Jnnlj3zJAKGdezg+o31au/pf1ZGUzAQcN7TcHZWtBmlc+EopDHiBn2JCXM27z1NslTCQmK2Mwt7y+ynhYUTNiRyYOwmjooyoqQ2WQEJbbxlHzRH6lpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755862952; c=relaxed/simple;
	bh=3o+FmQxfh3Vqu+734KWY67K1eSRB0PrsBChmW5BJDQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brbR3ymhqKVpaAHkZVwBUY8DEJksGBOq08//BJleX9PNWd4yWJOaa9YvitIMbc8Dyo2Kjmo3jAMefK19G45SJOHskpVk/9fIx79rWdU/2ZLkoeTWxO19uA9rvV91wJDZoF9whEMi6yzrBXo2qRHvO+Tk4UdEUxCEJ8LfeWIjThg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OiaUG0Bt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UMQS011136
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KAhSD2vjv/ePHUmD+gzyEEp4
	2L2WxYKoMwQm05Sn2Yc=; b=OiaUG0Btg4yL0nRWgSNlhwZClARkvbc61cx7zd60
	ACHg8wc7y11jD3eOM/32pUXH+TVk8km+31XcXZjI9FSulMPjp+t2vo5CuE1EPTc/
	XJVsEUCoRTaafNgdnv/eSPRvzLpVkMczXOoMoj4hZARV8yJOGV/AZL8F63otkVpA
	z0DppPkqHX413v8iMPvxF2ZqVDGWZ9nwDGzC1E5Zm20V4bz8r113YK4RrDj7VChB
	jpte2SnZs5FytqPkJObC0CkPcLRz30JurOImTJv4Bz0bwS2OcshjVku77l+H8s5s
	RXbqlJ4FYde8yKvsJ7zOnzJCullQPwo+FJdEU03xA+rPDw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngt8evg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:42:30 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70d93f57c42so21418656d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 04:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755862947; x=1756467747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAhSD2vjv/ePHUmD+gzyEEp42L2WxYKoMwQm05Sn2Yc=;
        b=FRz2f+TT7wxvzlSj9WJ3jbWgkg+a/2IkrU3XgFbzWNw+maeLWUeB4kl0bo9UrNxy25
         jDp2gkclzwcdBBUN1OZ5zTc51uVdoqhkDlYtxlRJJAnFS2xirAKv6fER49T2U154FeDS
         +WfIT+6GZIXzocQzXH7L5r0fpibQagdlaZlICOL0PHo4N8+3aRoER7OJW8/iqZdo5Nwu
         k2mFkjBtyYnJ1Cw66QI5VaAOJcHKNp8VcH7W2WANlHP/DYEOWTUNetlqa4rUOvIpbapf
         txwvqEgz2KkQ79uTcoBHh9dhDrH1B9J72tZvMnJhM/KKZjJDXJY45jYmpfsTxw5qOp3j
         pqOA==
X-Forwarded-Encrypted: i=1; AJvYcCVphZrmjTvIVqxCDhu52Y7ohIlbMK92n0+GMNu0JSUJh6bL8j2YI1VoK3J0lIcLg6lbKUsqyc0hHVfIVfMW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4t2Zi2PhEffFNrE0ziU0ogQ/om8/45HDPjwT0XMB6TC5+x7ss
	xCMifhIHNfsM9/xqzeuE6oAVPFjRihN+Wkm2WQZ32cBDmJdZzpDDTvxeosP9zlt8yE0QrvoxDYu
	7Rr8EnoXsij09ltQPo6JrQLz8qn9eyV0WtW43ToQt5Yl0r0wAaL2jNWx4CvByMllAIorB
X-Gm-Gg: ASbGncuDHPUcT4nqpqWK+7Ik3Eqt9futZX7VRFINQebATNFkppz54gc6lFSa/YUx2qu
	ThSktasZxs+GZW2kEzE7hsv1SUQv6s1Xcch1yDkzYjOIOgMzWqYW+n/MJ5GMLl1gXJ1jGIFyfIH
	vE9Jm2QMh3EAJGTyzbiwiLKJTLyGXab3lQKdu8vnQW9gn2dXtqB6rvZi3VijmQUUppOaAlcMiFU
	bDrd36DGzQ92xP7XEm1heiZoV+w9nXiPc0AmNEvuFwBm4RFCAwSnmhwEnft/NzVCfgqIuXThJOt
	lvDQdxN32DhOKMkw9KWQ2D41bdrEQxx4z47aXAiBxhDeSU5pIZIEh/KUOHA53A/j9FtEziwUiB7
	H6Ga1JBeY4pW/9Sle4tLlvbGFwqyiI1G3Uj99vH8Jcf9th5U9Fcr7
X-Received: by 2002:a05:6214:628:b0:70d:47a7:72cf with SMTP id 6a1803df08f44-70d97124af1mr30644946d6.24.1755862946612;
        Fri, 22 Aug 2025 04:42:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDtB7Zynj/rf/xXI0GvnluKkqYde7D50ORiC0miS2xPMWbtzXkTpNJzvnsT5Gfpb6b73VP8g==
X-Received: by 2002:a05:6214:628:b0:70d:47a7:72cf with SMTP id 6a1803df08f44-70d97124af1mr30644576d6.24.1755862946133;
        Fri, 22 Aug 2025 04:42:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55e033fc2e8sm1537277e87.59.2025.08.22.04.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 04:42:25 -0700 (PDT)
Date: Fri, 22 Aug 2025 14:42:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/6] drm/msm/adreno: Add speedbins for A663 GPU
Message-ID: <atomptaspsr7cfmqs4v3lr4lgeufbwq7jqz3lf72r2rxhv6emg@uhx443xvylz7>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-1-97d26bb2144e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-a663-gpu-support-v4-1-97d26bb2144e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNCBTYWx0ZWRfX1cTct3wXZy6/
 D7bGueJKAJnP9TkiRloSKYhvbbv4vPExuawOgU2jYh0YuUMmy/bNHsZwACV2KbYVHHP3Ns/mZQ9
 jFmAcibcOMsZQKXWvSYGbujuTnynf3OaF+kOCnVhvG+PUOjG0zNPsMuaCkv/tbZVF2QcNdkfND8
 cS0MtExIKOkjAy4Zuo3AzUbHaX+gZuWRwb2dlusVb59v2w6UIGI0dlWB3EQU4If3XaOVaRtQzK8
 OT9BbGbzzD/ke79OCb6kP0Hg9A7BnnFKjPlWhM82qOH94cQKAd+cdYx/GRwN6PwVX+MNfbC+XQK
 PNjRZVhvr5OFk2z0W7eo6P9koIqU90DmuWqLOUHF9kIS9Ihxss9tw/7e1boj8vrA7A3HkPRvtax
 YIvZHZn4RH1+7p0jBCnWBwKRBx/gEg==
X-Authority-Analysis: v=2.4 cv=c/fygR9l c=1 sm=1 tr=0 ts=68a857a6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=EbwLtv1J8F1BF5yYxN8A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: gO6UHSVlt6B2DXTvcW0rSceSUreq9vZ5
X-Proofpoint-ORIG-GUID: gO6UHSVlt6B2DXTvcW0rSceSUreq9vZ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200134

On Fri, Aug 22, 2025 at 12:25:26AM +0530, Akhil P Oommen wrote:
> Add speedbin mappings for A663 GPU.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

