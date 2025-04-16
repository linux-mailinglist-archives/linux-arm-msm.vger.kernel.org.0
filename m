Return-Path: <linux-arm-msm+bounces-54571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 070FDA90F76
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 01:19:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 648331907A87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 23:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE92524A066;
	Wed, 16 Apr 2025 23:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="isKcqbjP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB3E24BBF6
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 23:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744845556; cv=none; b=jY9VM76P0LTEnAHcozRXcTefa/SMtnsZeZCwgCT0OgplDg/DkDjlUzLB5LmtYBUR1MNq8Ayn3JynnTveSIzDrkEMD15J2ha3qflGObZa3pC8hysmc+WOdtiiAQGtrvGUA4Im3cG4lAffLDFaWs2uJo7LW0EY/H63Ra/1mOfux30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744845556; c=relaxed/simple;
	bh=9yqQJYjMCueMwbf5JSB+ALv5sxIVyPf0orvkUYx0qAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGSJa7l+Y0AYGS1+KE87OVFZy8EWwJ5r86kpuJ16WtdDMiINWjSg4Oea2/JQXC++v8C08jG4bHoNkgZn5vHJhtIHUPNqxXOsQNaNPJ3a+8jbasUnDq9U+aumasz+hGnLAUOOahP+PLD4P/Zv6AscbRoVaFInNVMDkR+PepgdlCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=isKcqbjP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLSFkt020861
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 23:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lPOdN2D2GxjUoOAn8DxazkVb
	UBcosChdPZCm0x/++yg=; b=isKcqbjPdj1B+U3d6/lwTNFGP7pNtzyZPMsbGmcD
	yBUwTkJY7ki5BxgIZMYogs7OG/XJIcAXu8EBRzPqbUaHpOzImMSDYDjE/vtbb7IJ
	emRBE+5c6emYTv34rLrqyUT50ihPKHl46Fs9/abXlvON6gIvspjeKZvSXyHV+1vl
	DN8DHfx3Fp+wyDmBFMkDD7XitKXHtejAmRPHQMsT0rEue5Bt0XvkWdrG2GpMoaDC
	Py17yvSHsFrEbw89ItXmgixhgVGA6ZjJweqac7Nwkx/mulIUNW5QA5sZ4UqpydGs
	6V4lDRYocK9z4l0/DV7ADFDUM/NOFfSZxNz60aacfdOx3A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wn1pp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 23:19:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6ead629f6c6so3636126d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 16:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744845553; x=1745450353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPOdN2D2GxjUoOAn8DxazkVbUBcosChdPZCm0x/++yg=;
        b=lIKLIw/+zxHT9Spc/R/TPAlKNMil1kXTDkIe5GqnEmefx98Wgme1w2C2NpoTQsR7GL
         0p37oWa4u7ll4hkHWcugCaIz0QB/udA1oc73U19eVtH2CdVnEoIA3M/ZhPdov11z6lyi
         hosvaTkxxwC6+INfdul1Qvk7U6rkuFTnHZMfBVB2hnumg4Uo1kNQa1VySy4m/SsLbYhP
         GafJ54emPWLxXSoBgGgmhOjv+ZY0TQKXgq88N01YpPM9SshVIwVgDOZpGVdS8z4zV8xY
         8MjobEXznkNFhzGcBaFi4frrQKrcjdEPKF8dGN0ZxYMRbk8E8ttmA87chAkvwZr8ho5y
         CMww==
X-Forwarded-Encrypted: i=1; AJvYcCWfvWxZUiPGfBeklQ9WH6eDJrhJQGcyUDM1yw+yqc8GcD0VAOhT4P/MQhHSBh5KnWYff5cSwKDDMGBkVkYv@vger.kernel.org
X-Gm-Message-State: AOJu0YxtPUz0t5VUGhwdD5lGXvzbFShqA6uvnuNxt8yedEcIbFXYJvtT
	58Yc8j4lcyNf8FWh+nD2x7lflgevauQNLzHQRDYmipa7urRXBirVuhLvjBHNEE/ZfTT7NON0aYL
	P0vsTbhPDqBkPo9Pnyp9kJkUo/Im/+5XcUMkzKIJRH52jvAM9BV9qiKwVJZLpquB3
X-Gm-Gg: ASbGnctY0paPfSQZVDYZ4Xu9xDpLH3WOQOjdHD0648U1Pn7Hkab/4vOhZ3CCUxFvrNY
	9YyQnj+h3Haev/0bfsgELevG7WY9JIH7+5Ebw83LXDSXuaAseafh7dP6FiZMCNcKZP8gPIt9KSn
	QljnlRtGovmJbpYphxWEcPqf1S2LJ0EMywOUdNEUrPyA8Y+d5RBT0mPU2Bhgbz3nM2Zs3d1cA4u
	NYVkNTD1wE/IwzCLmi+BAk+6qxz/D4REQiNnQRQOL61pL0Ks8JCjdcTOmFMTtNfMsZ3TeGUcmZk
	5oSd4vOTLZc9V9caVT8SG8RNEWeuNcPfmneu3MJnELkEkzKpNZ69k0nBD7TsromOzXP/zHdUkJg
	=
X-Received: by 2002:a05:6214:cc8:b0:6e8:eabf:fd55 with SMTP id 6a1803df08f44-6f2b305af6dmr55384166d6.39.1744845553043;
        Wed, 16 Apr 2025 16:19:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUGj8KXJI5k/hfuMcwByep+3dU/C//eMqavaVyCZMY9db41fx7/QT3SCEfUNFYr5xIkDR6KQ==
X-Received: by 2002:a05:6214:cc8:b0:6e8:eabf:fd55 with SMTP id 6a1803df08f44-6f2b305af6dmr55383796d6.39.1744845552643;
        Wed, 16 Apr 2025 16:19:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31080864bb2sm2487691fa.71.2025.04.16.16.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 16:19:11 -0700 (PDT)
Date: Thu, 17 Apr 2025 02:19:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 06/34] drm/msm: Improve msm_context comments
Message-ID: <3co4r3aj6rhydqzg23dxnh3e5asrny5zrkzchjg2dov22tzpho@qptuyivzqv4n>
References: <20250319145425.51935-1-robdclark@gmail.com>
 <20250319145425.51935-7-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319145425.51935-7-robdclark@gmail.com>
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=68003af1 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Xk0_UyW-TLBMhFL3eOIA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: U54bMRQp-ccWio0jiOzsdQnx8VExLmkS
X-Proofpoint-GUID: U54bMRQp-ccWio0jiOzsdQnx8VExLmkS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=679 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160186

On Wed, Mar 19, 2025 at 07:52:18AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Just some tidying up.

Probably there is nothing more to say.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu.h | 44 +++++++++++++++++++++++------------
>  1 file changed, 29 insertions(+), 15 deletions(-)
> 

-- 
With best wishes
Dmitry

