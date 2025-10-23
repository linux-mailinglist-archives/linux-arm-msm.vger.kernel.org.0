Return-Path: <linux-arm-msm+bounces-78585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DFFC00F53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 14:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9B7CA34A392
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3102972639;
	Thu, 23 Oct 2025 12:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ek4YFsd9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D992FE045
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 12:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761220993; cv=none; b=Tq8ttADQrsvJExZmm9cSfvk3+dRi3Gqxk4Ru4p79jhogsEzDikJYKljc1CwEY1A3r2fkSdZHeOfiNwfLEOGNgJDSXPMJbrK1rWufAS/DgwVY4YB9pT/xI2Eb/CRTMRyqNo8KpBtdA+xd4yTTfnEW+XyoAHQotCWheTIQVNlXsFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761220993; c=relaxed/simple;
	bh=J93UWrskigf/yWa/7D8kaxnKuSVyaZx4r26DdZCXwRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sZAx8GVKBPsB49DjzADsYNQfeG1rLZm5SBCMNboSD49aQ98KSwO45xzJkHQOdgOHXYlA1rxmqCp9Ng2bWcEpZlbmeAyK8PwHWrEdRKEVgdyOFiKfmjS1oOoyjVRXKUYJlgzTQqJ3ERjoGB0H2ASt2zFuP8gJKMPDupShWeipwHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ek4YFsd9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7CKh1006702
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 12:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M81zeVL5vCT2BNHUGaKZfq7O
	ZSW446AfEB/X68ESVy4=; b=Ek4YFsd9WhBLUNX1u/ZkUa1H2LUhmwgQN02YkkRd
	DQVoXLd4/qTfR9ulGVsYZWj+fDOB2ZLUeLzmg/fFciUgkNc3dGDtmCorw3YrlCq7
	uVTMofWObMsEhTabwKctqFnEtFzNG98Ps5wTG1Gev3hseyR82tsxPj/mkqfEfzcH
	6PLAzLnuWE3L6u/0l8WpZ2DiG0XtSJ0r/eg6rhgvREEWwbkU8x8CYjhBIBoQD2Gu
	RYHA8fOuEQT+Am2W2HfXNYfhe/dmAbNrTkKyWnDBQ7u9MR8x87XZOQKfsBXK6Pub
	oEZT1B9hEL6sGHxTYH84mK7Tve4wBRgQ9qDHcVm7hKLb1w==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j87ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 12:03:09 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-554e68b14cbso353258e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 05:03:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761220988; x=1761825788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M81zeVL5vCT2BNHUGaKZfq7OZSW446AfEB/X68ESVy4=;
        b=YIy08nlqeNsfmtcN1NnIA0hB13oQp6j3+1/P76Sag640gY5w/xvtEJndHvmflvG3fY
         vmakH6pHqX7G0KNfr4Jw1ZTWUXFZUG2IO8jm1ECcO/Xp8rKvBG20j+FihiAkVWF7luZ7
         x6lIhyj6ouU7k5jys5yMKkBtEmWZSms214ZJDpKVxeeymA+ApBEXnai2uICIqqH+kZBx
         6JqiRf4Q+ew5xnHhWsxRQmrRF4e7VL5UsuG0Ak/c50GKj7n5iokqZmmChfIItrTyVDy3
         GC8WtubQKSDPVqp94LbO28TF8FVcBQ1iDsMBnKUsomXcK/G0DCQrAluAJGhFCn9vqZ0d
         NB9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5Hppa4kk1bfJCXVnmV/aHxWAn+6AZRBOURmDsMYRYvLubYUm+kLPdfsOTkMVqGEw6t3lm7Sp3nrv9ELS7@vger.kernel.org
X-Gm-Message-State: AOJu0YxG700s3odwYkDSN3UevTdCPb9j+NAkTrc9eJYAlEuuis044gNA
	By0QITxY9VAXa4xewpkZGQjnnZwl7jtIRBMbmIbjVHdXFIUi136DJXtxi55pvtfCCcvyob6Z8FP
	hyJCFt7nh7wCFLuNe4kN2uzMb+1PHLLRtuJG+/TSsyQPNX/1BBux2dRQ+j0S70ED4ktDq
X-Gm-Gg: ASbGnctDCJJMb6P3ot3faGKm5SuauSFrpLt1XrQHOq5A2mDMvbeVNYKF0Hruh9EQ6SD
	wYJ8UZ9niWks5XVODkfawbuZzxvDLdmL3vym7GF1pqBcA4D4tAqWY9sKrWV8+7kbRHXgywfP0+T
	nVAwtlF1sbD1Si95cqFZsrLSgYQGpxaDzsJYWHZ+qBZP+2yy0yY7l+fEL+ncSkohWBA7NGTupWa
	XeGg58r/H+WD74JlD5BZVeN02uomJn5sXZT6ul1OJuUMZ7EfntU75Peu0cslpIcxr8osetbgN+j
	xWH5PWRcy860PMwnF/UrZJfWrsrskVuC4p0JOf6UojCL5kPQg6SV0SenwB2IsqAy4asdAwl7GeS
	xbgAVW2FUQAPxrAAWRJ86/MOjM14XOr/UtlhaGBjEdju6wB2kf29QKeN2t9TKEsM3U/wMVvXoTq
	SQdWh/rnNEN5N/
X-Received: by 2002:a05:6122:d8e:b0:544:9a46:7c85 with SMTP id 71dfb90a1353d-5564edaa58bmr7102782e0c.4.1761220943391;
        Thu, 23 Oct 2025 05:02:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeYf4cRCjfFBuC8sO6FcOxLi7vaZ8cGTF8QrhwklAMfIk2LsC1fPJF0Hqf+fYEtQZaBheqJA==
X-Received: by 2002:a05:6122:d8e:b0:544:9a46:7c85 with SMTP id 71dfb90a1353d-5564edaa58bmr7096044e0c.4.1761220913364;
        Thu, 23 Oct 2025 05:01:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378d67097casm4150311fa.22.2025.10.23.05.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 05:01:51 -0700 (PDT)
Date: Thu, 23 Oct 2025 15:01:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 05/12] drm/msm/dsi: Add support for Kaanapali
Message-ID: <trkt26sv7tpucjzgguv6ww24jsbs37ppimppyvhqvy4drtqtj6@uf3m3rcmrg46>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-6-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023075401.1148-6-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX4X1zD1HnDqxR
 7OHP8sqEj7paOxi39ez9aRyi5MiX2WypWAc3ycuj+6MVvvKzkayqnwuNtWvN5wowDWCIbWKAwlU
 YecHmdaQwtyOguE4CjcU8PGDzC7rc3EzLRA7rqnNyoK41JjbCXfdpEebK/DNNvLQNOqtdCRRgIU
 4rdWgIO+9WGsEQutAvHtfODVG6ik9M1tX1YA3iQ7Z20ZK/iNsPUiFh0aJlQI3P4hjVNsdCCqcI+
 I/0FpxbYqNe1RSqcO/yJEXFIThelvPEN1Y2x/BP8hCOUShIq2QpsGp6/g8si5GWGoMpN1GwQFv1
 nJsyThUSJtvydVpcibRo1jIjn+Y2sY33wQLP2U/6vYG5QL8XAUo9jlFqEhLBM9XKMpPP4DnguiQ
 pgBrmJ+WX9Gn3w3VNxD9Z7HJhxsQ9g==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68fa197d cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=A-_Rx2uNxy_47QfWGsAA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: rqV9x1oEGQk0VY2kcUebYfLuvfYa_FU5
X-Proofpoint-ORIG-GUID: rqV9x1oEGQk0VY2kcUebYfLuvfYa_FU5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

On Thu, Oct 23, 2025 at 03:53:54PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add DSI Controller version 2.10.0 support for DSI on Qualcomm
> Kaanapali SoC.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 13 +++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
>  2 files changed, 14 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

