Return-Path: <linux-arm-msm+bounces-56469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B49AA6EE3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 12:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B25DE9C0271
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 10:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42625224B03;
	Fri,  2 May 2025 10:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5QNqvAp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0AD22D7B3
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 10:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180595; cv=none; b=atoNFsNaWEf7Wgr3i08OG5q7UwJ/BjFTPAYyOWAAG2iwrCPEfBS+yDRY/DEE/YofeIq+u/+RuSeBy7Tf86x88qa6HUvRZxIaUJ2V9Nih69Pt69ZQlWvWtr3mScvJKa4fnjQOz7Szx7m3eWLvvOUZyBKNsp0np9gK48O63UIjXOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180595; c=relaxed/simple;
	bh=qlMVNMkQHxK+iWBIahZTo088WtpDWSN9kcDQ7wvfYsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQgACDUDsSyN4UeOy04nCPjfNA27QH/Nk4o+SBxUuCo/dyJNoEVG38qJAlt6nKAAqKjFeNiJxCaiBZzMbNX+F51MBn2ke95KCUl1oku90j5tO66qzdrUHsy+N4mwVODdW128T7MP6K5gZLkMDifZnUdE1rLSgZjFJq6TVm7xtVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5QNqvAp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421NHlZ010367
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 May 2025 10:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eGb1DlUbL3NjKY/kTW9b+ae2
	nxS0xZx64n5ndmQSd6c=; b=A5QNqvAp5jkwLT+0EyVxkW5mulaAL90Je2+xwzeM
	qyBWdXFm0tbRwy54j3HeK1MpiN1rita+E4lQKTJIt7Iu49/UToqQxANcpBRy7K/K
	I3P1L23ExvE1bH/vDER3dlrchk16s0vq/EU3ThgSHe8KSnR+3UUloULe1V8+SCP2
	iesFZIeyB7x/OhRWuhkjLuUPXguVqWzveeu6f0fVzDsgS1/WZLdJzmXWnNiSJ9JD
	pIgpkyg6LGKOk5CdrvfXWsmCLRHg64M/rgsO00jJLikmiZ3rTWHw1tBdXLDpS8AD
	Xfq/3SNCExOlmrkl6RD19f6H9eX8r2NEDhcXe1iQeMPVhw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubqyxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 10:09:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-478f78ff9beso60458991cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 03:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180591; x=1746785391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGb1DlUbL3NjKY/kTW9b+ae2nxS0xZx64n5ndmQSd6c=;
        b=Fr8VxMxIyuGuWkNwEZhZHuiLwEuzP7PfOEpjqMMy1qh5tR3ZwMR9EGSLppwygp6VnM
         Db4CwF/JgQ1H57IHdPpcO8p+0vHyswVSkhvYVv5CuZBjYVZ0cTlFEH2IVxlmqijbKYS7
         5+ulrjcdToh/54rr3vsUmE3qAWV8Hev3gRpf7iivCUSelkLw6by1ZU6P3W0Hpj204xZP
         PTMwg8jy3YLKw5wV3Kx0KmlSqW2d4cofhd4OweRBwEl6L2M0l6p++ryyBBKlS4jZo4lZ
         xOtYkz11HAl3e3CRhYDm7uOvO0I81IWaMiYg9ErBTsOH5k+LASBBwa8skptDQ6mV5O4W
         bdAw==
X-Forwarded-Encrypted: i=1; AJvYcCWnWzKDNUEcu8IP5hCNQX8+0Z1H8xB6+imMkRMYZWGqAbg6cVlLsPIVPiAkPQV9v7A1oJrosOBngBDGy6Z1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0QxQO+JMAMfZSyYIUb6DoT+fCiRiwkw3/K9ut/U0lN580ysrJ
	AIeSuU2PlbusB/Ff3EKPWUQfVfVyqsLrJJXf+Lgqhvon9NlDuR6WR+5Eu5iry015qDmg8UYVM4s
	fyuEyciDEloFmguJbIPBuxFPg5em07qoaFaivGWS1JMc5f4qf8Tf6d2BfmRmuHYvO
X-Gm-Gg: ASbGnctW/eVfaOYhuY5ehh/tsatJWcq4vghuwqIpToGSM8gVkeEoQtzDHQD3Wdo8eCH
	L5B+33D1IRPK6Wd0EBIQufRpskZnLFw3rA2BDfBR5rozFntCy/eEjr1AtLfW5ZCqzHlosBLEX9K
	bK3fRI6df7YnkMR6Q+PEdnGQQT1Nc2nDCdx+4xXF9vTALTgYbrqoh3j+65sxuz3zLyjvOcUAxf/
	4Af/dcklwMPFFYwLhmC6RF3Y2X/ZaxvXwNI2qXZ77UJKWt7LkrGWkSye3lg2xcRLWRo7qOBXMEH
	lN6JPyySK8DoIIoV7MQX8C2Yjrkk5vYkaRuaZkrHvpaW3fHecvAHOGAW/NK1AGPoSr72n4vXkr8
	=
X-Received: by 2002:a05:622a:908:b0:476:7f5c:e303 with SMTP id d75a77b69052e-48c31c1393amr33914631cf.26.1746180591590;
        Fri, 02 May 2025 03:09:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEI+T+sdPnhpQgFYsQMx/i1P/XK7HsEdfcoW/C3AL1UBNlcOIoAgvN7TUEI2OJ5tLKMoKv/uQ==
X-Received: by 2002:a05:622a:908:b0:476:7f5c:e303 with SMTP id d75a77b69052e-48c31c1393amr33914241cf.26.1746180591064;
        Fri, 02 May 2025 03:09:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f680dsm309413e87.220.2025.05.02.03.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:09:49 -0700 (PDT)
Date: Fri, 2 May 2025 13:09:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] drm/msm: make it possible to disable KMS-related
 code.
Message-ID: <lyzp62vwvina435pdskwalcgjmejkbs6u6ozx3nn3epvyjyqo4@2o4w7uxrklp6>
References: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
 <20250413-msm-gpu-split-v1-3-1132f4b616c7@oss.qualcomm.com>
 <71594689-06f7-41cb-ba6c-65459388fd1d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71594689-06f7-41cb-ba6c-65459388fd1d@quicinc.com>
X-Proofpoint-GUID: 5IEmaAQXb8VPUxXiQb56XwfvlgtuKAwy
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=681499f0 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=CDNnaGQRe6Xf55pPQM8A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDA3OSBTYWx0ZWRfX/v0mfNfivtUt u/pLxWGbKq0Cv+VJ6rxu5VcejnKehgS2vRvtlX6I0uU6eSvSkC4mTJ8G0c0r2wNXpBbuG2DLzZi FG4p8tvBreVVVJohpIz/qLwnUkJ0+P+AoozVZ8meKEMm4Ir04q6xuUQp/ibQi6uMjB4wgakVzJ4
 f+2vamYZkjkSaMFrVibyk3DL/ZCl8soQS361MQV/zKn42QS6Xe65MurieaXmy/1N3srwpHDtGpu LOU6vMNCXjCl2DaoP0t3zuNTqaoTRx7NS6uxedzmEJWifMJXz9u+fIt63n7dOkyocpCuiF++4jN 2GbY20Qx3jTRtokbhZaQAsBmglM1ZyS7Rj5FxxnUloz0z8ebeNQwy12i+6SVfsSYMfHAwYSPhfB
 buQXDeuOU2LII/FZqe7p0DdKnbxpIjDW57abpjLb8rOZdGbeem43coztAe8j3Yq0YSbX13JX
X-Proofpoint-ORIG-GUID: 5IEmaAQXb8VPUxXiQb56XwfvlgtuKAwy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=770
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020079

On Wed, Apr 30, 2025 at 01:09:31PM -0700, Abhinav Kumar wrote:
> 
> 
> On 4/13/2025 9:32 AM, Dmitry Baryshkov wrote:
> > If the Adreno device is used in a headless mode, there is no need to
> > build all KMS components. Build corresponding parts conditionally, only
> > selecting them if modeset support is actually required.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/msm/Kconfig       | 14 ++++++
> >   drivers/gpu/drm/msm/Makefile      | 16 +++----
> >   drivers/gpu/drm/msm/dp/dp_debug.c |  4 ++
> >   drivers/gpu/drm/msm/msm_debugfs.c | 92 ++++++++++++++++++++++-----------------
> >   drivers/gpu/drm/msm/msm_drv.h     |  7 ++-
> >   drivers/gpu/drm/msm/msm_kms.h     | 23 ++++++++++
> >   6 files changed, 108 insertions(+), 48 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> > index a65077855201746c37ee742364b61116565f3794..5f4d3f050c1fde71c405a1ebf516f4f5a396cfc4 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.h
> > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > @@ -88,6 +88,7 @@ struct msm_drm_private {
> >   	/* subordinate devices, if present: */
> >   	struct platform_device *gpu_pdev;
> > +#ifdef CONFIG_DRM_MSM_KMS
> >   	/* possibly this should be in the kms component, but it is
> >   	 * shared by both mdp4 and mdp5..
> >   	 */
> 
> As the comment says, I am also thinking that this should be part of msm_kms
> struct, to avoid ifdefs. I didnt follow the second half of the comment that
> this is shared by both mdp4/mdp5. Why does that prevent it from being in the
> kms component?

Indeed, there are no such limitations nowadays.


-- 
With best wishes
Dmitry

