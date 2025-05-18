Return-Path: <linux-arm-msm+bounces-58312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5D2ABAF1B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 11:49:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DAE5171265
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 09:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2A315B135;
	Sun, 18 May 2025 09:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZJskLuk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75DE42A8C
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 09:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747561756; cv=none; b=caCM1qEE4QU/Udq5uab16nvNaIdbkNfG55Jz39JRkP6GPNHORlj3A6qCZnH7KtoY+6+ZYqhorNd4L+RRUOP8U+r2hrqscaxffUhgqKLsSb5AK/37UzhlNQpvSso1BsSSZ3+yQgjr5PBg1R3k3USCaV/HCNE7B2LgCdqcqR9hiAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747561756; c=relaxed/simple;
	bh=r1V0tWeq5DjXIfQxjDdeZCv9giZY0qneW+xe8LaZiWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9tQm2iT+xaC8omT8VazBgHHIEbfQYwPj26FnsR5+sfMswjVRVRjLRazXyNoee+OHdQm4z4VGeOgH55saiAk7UQYuEjjLVf1TXCHUK0LM1tcIUc1dlwBbipPJSj2hOyAK16nKPkUXntJ6KFfGNpAaK+qXsSfiMrSn3bY/b9RBIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZJskLuk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I4CfrT022425
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 09:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uk3XmHMtZKL9KyAJ7vLCOFV9
	j3YnYGhoaY7wPOpdmB0=; b=SZJskLuk3du1Dr5b9j+Qx/OL/HjANFbrFfMOvLM+
	MjZBpkNAfkD9uYjoiNuhUK3h84+nOZMc1L7apJUbwMCHEZgYYr1dqz7sb1HoW510
	buGK5tnwdDMPLgJutpw+xW3X2S753YuP0xmpgyTRkFLrvok9kf6oLNi0ErF40cx6
	Ayp6ro+LHOtpCC5yahNK2umqdiONQBThK8Kn2gVivkhJ5igg2QyzvHiDUozfcgrI
	t8m9pIX0PVVlM6zmCPnxLgnbr0pROpTpkyKpAKWoKbmR96P+t6eNSlikNFeoVKvR
	rbXnMx2ucGqRZOj3wK2uwBdz7C8pRnUNZYrZyTvVng7ypg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjmessvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 09:49:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8aaba2f62so61509226d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 02:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747561753; x=1748166553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uk3XmHMtZKL9KyAJ7vLCOFV9j3YnYGhoaY7wPOpdmB0=;
        b=M63g9fVsYX7RfMSfsYtVIK7smEA8329lR1DTZH9SzhFGV/hDllYOyJmq8fvlXAq+9v
         LeZyO+S8LlfMbNrg4+Ok6zowXB4ZPjtSuU/xOk0Ul7DnKLBLfNnVFiggwaOh4KCv2Zpu
         BSOXPhJQWfRyOkBw6TKXE0jDAVmK2nHh+CJlruhXNK8zTVutACdU71FyI6t8gR5hQS5T
         TSNeAsH1TrraxbBg2tuK8GXP/zijOyXDoGgA6FXZhz+hZhk7Ix9yx52LxesbhPwk1Uzv
         fPsjJ41awt4K+gjeuVvTxvps65csm3na4jKI0MWTzzyXDMMiqOwYnxnypldAsc8vgz/O
         b7Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVwugJnI6ihg9AU2ozoh0lJmpIh/ii3S4wKvSX5SH61xiYS+uhkUu9kCPuyLNis5B2x30jQhbkUMlAVJvFY@vger.kernel.org
X-Gm-Message-State: AOJu0YwVRoxy2f+MrHsTEw5WOqPFBaNSAomubyu7IGrtMIcx1KuMCtMz
	OzAfwLlgz5WpjjH5vrjnv02BpxZwYkky49Pg4d0YFN9jdTfRRYco8BHECFMCgNlkJMJfu8meuY/
	PssdCnBQerZI5Ln6zMTHtrYyXuU32DbgR0WmFFykofATJoBMJC8KRb724niUj9KSkigL7
X-Gm-Gg: ASbGnctN2IukJyMkc7DKP+BG1KrSX/99K3qrN36M/QAAXscsHqnALuqpPbLRo6lfd/k
	3QejJ7jLvvBaiDqqzQq4ug495dOCppqXDDO5WVMiMOW33UaRLHsOMMkdBbJjSAmDjU23PN5jYIv
	qvnQT7zZbqklMsGO4VRXZcBgecxfTE7+hpom0hFaMkf9a2htBOAK7KDhWXiWYDqlj3jWILXumJS
	JUWq2CQ/rMv/UcE74ybVtMUAhfVY494o+A6BmqfflkZ2Aab4E51wk1WhLYgzSA5nFetqLitRCsc
	9AD5pFmVC5mRtCR7Su1XgAYrRhdEEy3Xw1TMG08wl7IhgYZA44PTfknAiQzNVJUWEMRAD7NAERc
	=
X-Received: by 2002:a05:6214:226d:b0:6f8:d035:7222 with SMTP id 6a1803df08f44-6f8d03572a0mr30939186d6.15.1747561752732;
        Sun, 18 May 2025 02:49:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB6cOXuCp6Ea8OwMdD+YYtA9uX4ETpwrWWSJ6+rASNTDgvLSfjQDY3rF29CklGqPF6j+ijsA==
X-Received: by 2002:a05:6214:226d:b0:6f8:d035:7222 with SMTP id 6a1803df08f44-6f8d03572a0mr30938976d6.15.1747561752424;
        Sun, 18 May 2025 02:49:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f16584sm1356425e87.44.2025.05.18.02.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 02:49:10 -0700 (PDT)
Date: Sun, 18 May 2025 12:49:08 +0300
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
Subject: Re: [PATCH RFT v3 09/14] drm/msm/a6xx: Resolve the meaning of
 rgb565_predicator
Message-ID: <6shba2twwvusoud4grdmagparzg7bostkhqnrohscqd6bik2iv@gvp6t6lklyk4>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-9-3c8465565f86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-9-3c8465565f86@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RoDFLDmK c=1 sm=1 tr=0 ts=6829ad19 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=pZ1cKns8_n0M6c_4lVMA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: vv_aMszj4S2npfM-t433DAwoF9FPIb9F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5MSBTYWx0ZWRfX3W/y1YxqMy6A
 XynuwMIDVHcWqYaaNJYkXB49SOKnTDwROy7mz2g0HSWu1m3KU+ieuUIlvsPxvFXLRwkczTYezPh
 h3kv9SaB2xI1Tv4xMXEFElIh9t5/LwnSI5luXoVRrCKpRxQRbitTbSPp5e037T8kBB3thO61xu5
 xUAa8wU1JfAAOP55S4KyA3QCuQH/iIHkQDNz0bwwAtwFZy2a4CS8mZYvvjfLwrIwm45rHWz5b4m
 KIByNmyPqfGBcTWM50BTZWKC44W+EUPMS6E/lUHgKDB8QxXTjGDrqriMPlVTCrDrGryVJgvMsT9
 MkMAnOSKfWxr1iwnBIXNRoD0sJ6I9flwxhubVUkRCM26j1txtB90kzIDy1cwajrtH8Pxy1peJLy
 WWubaBVcmYA3q+9J0VMT17xQaAbZMmGWAhvL+yNPZPU/NtUHYvLktlSX5tPMDW/YKUdi1sp5
X-Proofpoint-GUID: vv_aMszj4S2npfM-t433DAwoF9FPIb9F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=776
 phishscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180091

On Sat, May 17, 2025 at 07:32:43PM +0200, Konrad Dybcio wrote:
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

