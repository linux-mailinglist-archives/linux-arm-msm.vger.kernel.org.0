Return-Path: <linux-arm-msm+bounces-57971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC9CAB7592
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5456116E158
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70A2634EC;
	Wed, 14 May 2025 19:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lns3HHti"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF782AF10
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250176; cv=none; b=slvQKiflVpuG93GJArek9orSrMm8iSVEugicHC/MOyfWJUF+3Q4gr0JIvWp5c9qhVart7JgYRSmALqlFUx0JWN6h9jR/l36w3335vWTKd7xLIsMvegMwn88/XLDpn4CWfoLdKktpoVxywQa8BSH6GM6YkY+4G7Pot7+mVmTUWPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250176; c=relaxed/simple;
	bh=sWxwoINTiUROD4lu7fI1DNevVivaJ7bCBhxrqTdtQKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ackPamT3Z0CJE7M3nmkB47sbarRAFDAtMMd0eHGKq05vkaAkQofMG3Ksk1s+V10eFyV9VVdR0sYgfBzmBMoisvUxqemV3g2/CXA+4TZnvgA4jxpgysDjeyaY8MomaUS6dIGYeIpFqkZkRTx/kaXywN/FCH6pRAcdUOOzc9eBMTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lns3HHti; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuotC012639
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=minyAMejHL/JFJSA+xnqXanR
	0wPcS9nRnV+dThvhjwE=; b=Lns3HHtiVUtP/NGibWUj+J6urosA2DXc5wZXE29E
	WVsS8lufGfsD95s6JIg7kr4Q88QfY0i71mZO3BE2c8SLk8JHX4ey2BYJiIPPhbww
	t845x1xlxtpI102dL1j05C+927cduWGj/S4HLVV2KfsEQYEia0QCVYr5emZSBT9B
	BenrRNn0ROazfBZiHajZCUmPm7o7XCOk4eWkwpdllVtDginRxEd0EXVtyrkuWJ0o
	nhRkmuGlT9iym4iq5rggruV+YEknguQC1A5wQrawfcXMvF4XfX3NnYelfZtLCW7L
	XooLD23kpBlhYX4HdWtM496ctZGJA2jvjn1L5R2LILLY9g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcykvpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:16:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f6f2c41eddso3549636d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 12:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250173; x=1747854973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=minyAMejHL/JFJSA+xnqXanR0wPcS9nRnV+dThvhjwE=;
        b=gjD/sarS33Ppdl3naFFu7SMcibgzlI+H4gwIbjDDpWuHzOyKt50qvHDXaxXdHxRYTP
         CoPk7kPPT5bys2pohinnprEf5bBtqHzRhb6G58LeBlt/SVqparGYdLGTpcawq5jM6hR4
         qddT7Kx0d89lIjF1C9zP7A1JkCYVBSjE/0NlHBwwtKvbSwoisMi/aAy+1J3AXCyTsBMf
         e4qN/H3l92bDddmDAQUyB17L1DaUw56axK/xJtt4kVW2PXOWe7MDwEXRRrYTPnZ/Vz1/
         w02xytguzkKgD2kxBwPVdisJf6y8CNSmOYlM/RDRVL1vpBeahzJQd517RXUqMU2n9xRd
         Od4Q==
X-Forwarded-Encrypted: i=1; AJvYcCULaU0RGvL/ZtOaWTm08jV97waGGMaLjCH2gwBF6fZwNdOro2OPM0vpN7XZHUA1q8w6FSk7B6i5pXcJblYz@vger.kernel.org
X-Gm-Message-State: AOJu0YxHITjYqo/r4mMTBlg4yq0ciORvW68L65hCELI5e4O9cUGxTirl
	paehYinZkv0GnUC6xJUksrDL9Zj0Bu0aDIu4Mr2g5bDQCIXhTQXR6w6A/ViMfzX5ia6rpsYJs71
	WiYJmGzyYEI7JJHXKCxEd9MuGnLf8YO6ytzYnWwrchJXK/grQOAOTRxTummTPfIHVcwQ76T5m
X-Gm-Gg: ASbGncurdH1e0TqKanyopSpw1TXh9cGjfaOV1FaN4NvJeCHz8VXLO9ZWxX0AIMO395N
	stt4DoLb4EN1JRGeoXl88KFX7zTnC9w2mg1D787meJmVthzPD1blr/uLOE3NZFrRopmZXnsdS5j
	zBuaRHbEAk93G1F08M5UfjEAnPVskl24I0XCyLw+hX6iSRso07nhPUuorYzERHbSfgB4+EgL1kX
	11c/hdT6jE3lOojQVonkP6ytKh7CFUY8+UhYIDEzkOHuTdVzlCV+Jo64C5Jm6pWnCE1BjPM4Ylr
	beLAtT43EGUoFzP2htyW6OgEK3E2XR9QaNCpU11XpQv5oSJjjv5iKqoWluC8RPXwkLT8Tewr3eU
	=
X-Received: by 2002:a05:6214:5014:b0:6e8:e828:820d with SMTP id 6a1803df08f44-6f896ed0844mr92860966d6.36.1747250170767;
        Wed, 14 May 2025 12:16:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi4OASQm4gJGGxeccfV1ldsNxSDl4KQOG6jMf/3jYLWvcUhPLkhO6KcplkBwZ0Dv0kasxkIQ==
X-Received: by 2002:a05:6214:5014:b0:6e8:e828:820d with SMTP id 6a1803df08f44-6f896ed0844mr92857286d6.36.1747250167947;
        Wed, 14 May 2025 12:16:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64beae2sm2343713e87.161.2025.05.14.12.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:16:07 -0700 (PDT)
Date: Wed, 14 May 2025 22:16:05 +0300
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
Subject: Re: [PATCH RFT v2 05/15] drm/msm/a6xx: Resolve the meaning of AMSBC
Message-ID: <bkcbfzkgypyghmugpg2lopxyp2wfsogrclaqxfwrflcceimj3l@lhv3dv6mfrw6>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-5-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-5-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-GUID: E3LiXZAnqHvbXiSzSYC9_j70I8L5uyHh
X-Proofpoint-ORIG-GUID: E3LiXZAnqHvbXiSzSYC9_j70I8L5uyHh
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=6824ebfe cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=UiqBTq1rjkrdqcEHUKQA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NSBTYWx0ZWRfX0zKyFo7+uGzT
 J2NNjoMVOZ9ZbkdU6fqACsFRLMEqLR4xhvgnQr8t3riox8/tx/kXGZ7/ex4FeHiqw0An88jBTVM
 TMRvYMEPA3SdgO3D3uD08TGdSmVg4ukcx2bDJo0RP7ePhKZQncI3tyYSyAT/lIIqtHoTyNpALFx
 r/GjpO5wIJ3kQahe6uKUK9SR1LoPCHh1PDAzz0wEBbuuEIZ+d4aRM1wP9Ve58zOQU0M8GjeCU58
 dGUaXX3P13oHj+5LxM0MKOVRNAxZU4ajXzzif4FxdoeSWdmffiTgQ3g+M8Uh7gFudga8eNILfou
 pjC6flivutFEsP8iECUDh90rMob1WEVHQa4VpLxUNyp2Rau06nziBjdRn/c35j4OdUP+3tWQfzl
 A29zA7mrUuh2s96siEzvL6ZxfEozUjEQO7tBL/mnl63eiTolhY381+b7ZihO3qCkt9jAU8z6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=767 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140175

On Wed, May 14, 2025 at 05:10:25PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The bit must be set to 1 if the UBWC encoder version is >= 3.0, drop it
> as a separate field.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

