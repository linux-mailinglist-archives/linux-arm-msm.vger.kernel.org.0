Return-Path: <linux-arm-msm+bounces-57947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3EAAB7518
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:05:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCC61170114
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78D728C5C0;
	Wed, 14 May 2025 19:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E464yPX2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595CA22318
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747249536; cv=none; b=eWBZGfIxpZD/zywvlMXgY8TTFCBNzo5QaRsbi5NtmSAv72fDDdxdDcYved+j2D8aOwRcs8yd+OBbtLotajIkDVZCt2se7MBhQKi7QkF5i/76JqQAzLj8Iq2ncsRRZxKKR/vjcdQe2vHn2iVFEqEaD/51n0FAUAD2XN6ejLe+k8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747249536; c=relaxed/simple;
	bh=yUdYH9OrXaddZ8qfFOzEvGbXdetQrQZedioCTo4Z/Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejTL3ASeGBd8pVuIdvXavBZyrBO/xLHWlNK5wU/JNgxEXvC6U8FpHd8IiD9/2gA5pPoeauw5eMOa0hNIVTogU6+I8wAU0o/2NhpIRsA9E3ikJhtK3xi/M8i2/8+dqbStBDRkAKidfhaZ3JRlZV6xbnWGnFas/Hnvi5Hlk7d0++4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E464yPX2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuwu5025415
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ywYtj0jJCUfwAnlUn+KfhCG1
	HPC+N0krcot5RSineC4=; b=E464yPX28jlgQe3n5SUSqJIb7FKLpRL3y3uvX299
	3aORlz1ybgZA3Up+TgQFUwiWZgEL+f4z/eurMb6+4iSN9WWtaUdiOvHeJOb9GcUZ
	T9hqBhHJ6SPe4OA457ZuEagma2U/HtpKpVuonLR86vH7EeixbF/0dnjiozkWLNEC
	sHy3LSjNnI0YfE1TuN5rbPWZ3DJLH3FKOFfB6gx44A/9SbD8Sstjf0IBadgAWU6e
	bbR+4RIhIYKZUgDO0LwarnTe8bN8beyymbSxYBtqxPXH5kdhZwkxsRfamEcpxjMt
	t9RKqnS1OVFszZUYO4N0FuiYT1Sn79SuaUHp1MH+odHrhA==
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew3qq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:05:33 +0000 (GMT)
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85b4dc23f03so13436739f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 12:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747249533; x=1747854333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywYtj0jJCUfwAnlUn+KfhCG1HPC+N0krcot5RSineC4=;
        b=qJoAd5yD3CTagYPNfTUj7yZA17s5wxxMbFW5WejIIhekcjtlYUE9A061t4+MbSXipI
         DdHGEI4MI2JxVjuOgXwYYTIU2YMFMMtZMQPAEdp6DzudrDgEUJzf3/8XnAwi61vLdAX2
         3IRw889BB8aEQgS9h/a7Zp99fm4014o2WlnpfgJNrle9fbFWFCN/3+LHH/7H5+5X69vf
         6n4D6ybQygk9bvKOa64N+sIRKQE0lDqRLlqcxeXUcgCoupgoPRIUbSieInOsxsjam2fh
         s5W9Y4jw3WWKlV/4F0wsYk3d9KOmxkhQa3aHAqY+RK8l5cYFP6lkgy6Ibzp1zl0qHPFX
         hsmA==
X-Forwarded-Encrypted: i=1; AJvYcCXReBIqxYIPyhyRI9TYErDrs/Ed0ri6Hpv2TxL+56/KzCaYCVuSUoEens6nntkQZuAft3iKVSGBftviG/Tg@vger.kernel.org
X-Gm-Message-State: AOJu0YzD950HUpIH4TZuQUPDpMbr72EB0sQHzI0+f5oqopKN8SA0/Xyq
	2wiFYyo0C2AlEJbnakFMjFmd0ADkEzzeVsaqujjzpmftXMa4QaVmGVceUKJsD7XXbIXPQwe3EvP
	R5BdE+qT59vwSXf3ILF/BnTgUZW+vxk+EDUt/YVWpJB7hfdwD6OgqM2iuYNJK5/rw
X-Gm-Gg: ASbGnct1Iw4mRDkWhL8Q1hw4oY9ZoVNphXy9R9H22ZNWpxrAMN6sGe4yG4G399DVaqj
	XVb732HJXCCoPSG7dtVS5LvS+0VLK0i+2McpYTeSyk8NvxSU+cy42FKd23j5EfHNNoIRRCOHhUn
	xUIwevI22EEamYE4cfxNE60gpXj88Y+nhN8l3jNXYH7DzRcai/1i6ikxDE8XtS+7A4OHfud1m/G
	AOsaosu4OT+wSyVoKewiPz0GwhH9IeRl1HOptfRg3yVXCQRDKjRtdAFTidZLET6RKFyr96D0pzW
	HG+BwFFPppPGsv5mWPBQ1Dg9UZIK3fzAy43IrAy4DfVVHMHUmErjTQbLPfNcP97zlVL4btk+cow
	=
X-Received: by 2002:a92:cda4:0:b0:3d9:6485:39f0 with SMTP id e9e14a558f8ab-3db6f7a5a65mr52467165ab.9.1747249532528;
        Wed, 14 May 2025 12:05:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgYTQv4QXSnMN9YVJaEI3JUAXQjoi8ESN5pboKgw0mTBEWnrDUyYQEekWZqNeBYQdzQK0Khw==
X-Received: by 2002:a92:cda4:0:b0:3d9:6485:39f0 with SMTP id e9e14a558f8ab-3db6f7a5a65mr52466645ab.9.1747249532072;
        Wed, 14 May 2025 12:05:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6bbesm2340443e87.154.2025.05.14.12.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:05:31 -0700 (PDT)
Date: Wed, 14 May 2025 22:05:29 +0300
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
Subject: Re: [PATCH RFT v2 03/15] drm/msm: Use the central UBWC config
 database
Message-ID: <g654eiekiyqfjt65dtueowx4tqdg2tqs2xoik7xoun7dzz634f@ikftorfburay>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-3-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-3-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-GUID: fvl8IxCE8wm-wdqLCbKuzpLeHL0JWStD
X-Proofpoint-ORIG-GUID: fvl8IxCE8wm-wdqLCbKuzpLeHL0JWStD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3MyBTYWx0ZWRfX13WxVrQt89AC
 hFPrMZ9cNL5O7YZPVopdBODQZS1VK3UFkz3IUonPYkHJ6HMtutnx+/6/XkaqRa37fDFGn0KJ+Wb
 lsJ6+VkfpaEecdkdIpoCBWZjy0xvqTHTVwxGyOjcc88zp1yc0ive2yqUL/i2OmS5aK9cfU3hfay
 rKj1hf9DQktY6qSFKrnuYApsZ14HoVsQQWRcxZbNnaYU9Vj44haEQDVQAOCjMwpVD8Ncs8u8HUc
 Wh7enp++/E2qesky4fARN7liUrgLKSD61jh2W8CE7ndPK2bSq8ehAj89FzhexskshqlXwHn27NQ
 64xGOCl1ZDWMq7ZeDinu1IKlMqkhLRdNngYladjYIfvE3jhdJ+WzZRzP2383wF2vUHzIniE49+Z
 8P3xTtaF30LfC5zgpsCYEqPrzDEkQFowWqTPw6G/AWDw37PboQLzA97YdsOAyey8s5TkOCMH
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=6824e97e cx=c_pps
 a=x6q9Wowz3da5qcMoR2tSzg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=2JnZN4u0TTcLH5SyeT4A:9 a=CjuIK1q_8ugA:10
 a=TsFzuV67ciA61D7d30EA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140173

On Wed, May 14, 2025 at 05:10:23PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> As discussed a lot in the past, the UBWC config must be coherent across
> a number of IP blocks (currently display and GPU, but it also may/will
> concern camera/video as the drivers evolve).
> 
> So far, we've been trying to keep the values reasonable in each of the
> two drivers separately, but it really make sense to do so centrally,
> especially given certain fields (e.g. HBB) may need to be gathered
> dynamically.
> 
> To reduce room for error, move to fetching the config from a central
> source, so that the data programmed into the hardware is consistent
> across all multimedia blocks that request it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Kconfig                 |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |   6 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |   4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |   7 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |   2 +-
>  drivers/gpu/drm/msm/msm_mdss.c              | 327 +++++-----------------------
>  drivers/gpu/drm/msm/msm_mdss.h              |  28 ---
>  10 files changed, 73 insertions(+), 309 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

