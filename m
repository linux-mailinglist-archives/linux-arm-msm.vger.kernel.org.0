Return-Path: <linux-arm-msm+bounces-68159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8ABB1F2C2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 09:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 325E6561B78
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 07:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0BD922579E;
	Sat,  9 Aug 2025 07:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VOvv5hT9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5565B202F65
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 07:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754723434; cv=none; b=m6WAxoVTNKa6oXTzhN23+93HxscUvOsoV7L5g8o3WQeg/A9IH/trySXPOJNS/wSEaeUCymA4fXognFzbnnNCDjVeJNOwWLGKDytzgDUCVdAG0x10+7rBlqZBp2oYq2I7PDPO6F6CpRCX0hhfWl33wuNTyzDxi6H94CVlQRCgnIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754723434; c=relaxed/simple;
	bh=VSlk9CbaXe7iLpE73Vs5c8bTyeM0TolS33K/bOG9ko8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I5SK19WWrgv68HLppouftoOtDU+fK23hJ2d7zJYaRdWlw0QrpG2v3W1eiKDU+MrL9rFh9pUAmkFdNkXgKSpKjBBRHrFmCYDtoZ+OUSU09cXugwgT360rTEj1q+OBIsFwBf7UwUJQUHjzasU9kGFI99UZ3avHRwWQXu2fNaY+pdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VOvv5hT9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793VPtx012882
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 07:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lGIoJPjVaweh6fzYPRiYjwF1
	gDXSBBuomIgkEtxpmgc=; b=VOvv5hT9xA6M62f5MM1zOyfhwAmy9+7nRw7qqBEn
	K5YHfyVMcX8uqXXsFj24oIpbM9eaRa/X7tLbke90A42h2tyoeP/N3+NG8/ClM8OU
	dwKi6sdSEH6Jb/TptdXr8mXCcnM1SADPEQITkwy8N2RAiasyJjXAbRAn5gpCuVMh
	tYw/xdbOHz1AqiA+EAj+Og6dUu1+zjlisXCNZTbVOdw0cMkYwsx1yGFG1JBWSCgI
	vZCcIvSYDEdu88QNVqCs87SRP64C9jOGebb8HWfHtj32yKGEPVWzEneRKwL3hMVH
	HJnMvCu7XBZAZAZGJ7w0LGW3YMbckvwgDmZT6XSRPi4S4w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dwngra6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 07:10:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b06a73b580so41052711cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 00:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754723431; x=1755328231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGIoJPjVaweh6fzYPRiYjwF1gDXSBBuomIgkEtxpmgc=;
        b=fMn+5EDqPARCrd34Lj9+LvPdSq0dz1nB7UW7KOc2bzH3mQKO7EbWe9wEvLDKszdfYS
         TFPst5M9N7HCSSPCfsjaAVaIrDVarPo41EU03HxZKQioDsh3FO27fIffL2oQyLYbwStT
         LnKh7aYX8m99BSunsgio6pFyEhrHF6ctLjeSN41100veyaoouRAwVPvtk1fFZUKjmLsN
         ccOZJjyJXFjj+fVU5S+LufHqB+zf6o5PUPChODk0JFzCTAiuAvMG1rx3EvD3xRu3Ellb
         x0MuUNFcbUtuDqStQy82I+F57AQ4EkgdTsjl3mZsjnrhwC6clwEVxpzk5bXYhar3/SIY
         O+ow==
X-Forwarded-Encrypted: i=1; AJvYcCUBDFbWgoSGUI2zRUbWpfXggS0zV0YWwDn0T7LZxpsRwT6HzLokvfZqsiic9ECFYPiSGnvdZOJLnDyyZGlW@vger.kernel.org
X-Gm-Message-State: AOJu0YzgAgP9EL9zHTr94YEUHzITj0bqIyfAM8K4EehV9WldujygOT6w
	BpoRvFxuQIH6pELZFmLwbGz0H91348S/IOF9V3bCERAB4deMozyVKvrZQz/9yFQAeMEtXI63la5
	qQP9eSNRrSq411ImNTfFsRquvI9WNt4CG6ajag0TjMliN7vE6RO9ykHg/vLwdbavspN3m
X-Gm-Gg: ASbGncu27YG6rn5g24DMSwaCG6SCphz5D/tix6rawms+OiUa1W4Fcdj7eZOE59/HSCT
	aE6cW94gdqabKbFUxpjFgW3kcW/h5hv8F0AJgDGifFrZREi4LUZiAZnladFk3cMu2ra6n/RWGP7
	ED5290a/+A8HafHeRa25DRUlL72c4JHuSWwNekCHMzDB99r6xgoCUm1z25Jsu8EspPUbPALDCFd
	s0GHiFSIsQhIgr54o1Gc7vHeJfsT8USU5k2piAJmKHXIgTFbhu0k82QNl+NTt2qyo9/337YbAD3
	SI8yFAsBz/DdJGYd5OF1p+xPcw5rxy1TsS94599G7HQFntQ6w3Hgni8+DeK4gVX8PRrjeKFZor4
	2/V5l+ucpID7V0uBxvfF/wDvT6n9i0+l+dKuskH0CIlheelQ3Uap9
X-Received: by 2002:a05:622a:1aa0:b0:4ab:640d:414e with SMTP id d75a77b69052e-4b0a06eedfdmr151125961cf.3.1754723431200;
        Sat, 09 Aug 2025 00:10:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEV6uIbGHBTb/R1Jt3TX1bc0j6npBwpC0efjKBnU0qNU5KhhatLsSTXZdchZFM7R1iG73Hy5w==
X-Received: by 2002:a05:622a:1aa0:b0:4ab:640d:414e with SMTP id d75a77b69052e-4b0a06eedfdmr151125621cf.3.1754723430746;
        Sat, 09 Aug 2025 00:10:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88cb7c4dsm3320058e87.170.2025.08.09.00.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 00:10:28 -0700 (PDT)
Date: Sat, 9 Aug 2025 10:10:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 09/12] drm/msm/dp: remove redundant checks related to
 ST_DISPLAY_OFF in plug handler
Message-ID: <45shie2h45zmrrgtkt5k4v5hb7cjspjkdfugy3mvsjsbeggrm5@mfyhk5ntwmqe>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
 <20250808-hpd-refactor-v2-9-7f4e1e741aa3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808-hpd-refactor-v2-9-7f4e1e741aa3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: BDAzHPIgYnngS_a-Wt9LQDWT9veeQbuN
X-Authority-Analysis: v=2.4 cv=RunFLDmK c=1 sm=1 tr=0 ts=6896f468 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=S3fc_xTQ5om5qnv2m30A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: BDAzHPIgYnngS_a-Wt9LQDWT9veeQbuN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxOCBTYWx0ZWRfXxMZAaA3NYxAo
 LZCJyMLQmenXtAe3tXGZpQU5CA7PdNvus40cAoAvJ5/lHyM3j/aP1y8PRi/LMGLGeruxJNj6Zjv
 sAUoEAKjlB2bet8BhABYqjYauZCzNf3TxZ9GqjmyYeRGh1OcYnfeBGa7O/cl3F8r5BcmyHj5HzP
 elgyNASFVX6iuqGaQ6XgUHueSXbUTAcaYt4wxpoeswvZEs5/deQ4LYvxL4sEWceKoNIY7BfMElH
 Pup1kv0AH2ijhFRutnbua6waag3gVE1o60oHROTQmiPyUvpVJ/kuYYo4ELtpNfm5LNVpMXkqVkE
 t5HynOPXO46lWGdjvfBRece4pJ+AhvAdjNCnW4jAYZmp1OI8T02k+gnDECRuBKv3i8H5zQXEQPL
 Gyra/dDy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090018

On Fri, Aug 08, 2025 at 05:35:21PM -0700, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> In commit 8ede2ecc3e5ee ("drm/msm/dp: Add DP compliance tests on Snapdragon
> Chipsets"), checks were introduced to avoid handling any plug event in
> ST_DISPLAY_OFF state.
> 
> Even if we do get hpd events, after the bridge was disabled,
> it should get handled. Moreover, its unclear under what circumstances
> these events will fire because ST_DISPLAY_OFF means that the link was
> still connected but only the bridge was disabled. If the link was
> untouched, then interrupts shouldn't fire.
> 
> Even in the case of the DP compliance equipment, it should be raising these
> interrupts during the start of the test which is usually accompanied with
> either a HPD pulse or a IRQ HPD but after the bridge is disabled it should
> be fine to handle these anyway. In the absence of a better reason to keep
> these checks, drop these and if any other issues do arise, it should be
> handled in a different way.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
> Note: Taken from https://patchwork.freedesktop.org/series/142010/
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 3 ---
>  1 file changed, 3 deletions(-)

I think this patch and the next one should be folded into the 'drop the
HPD state machine' patch. It would be easier to review.

> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index eabd6e6981fb..dd3fdeaacc91 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -495,9 +495,6 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
>  	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
>  			dp->msm_dp_display.connector_type, state);
>  
> -	if (state == ST_DISPLAY_OFF)
> -		return 0;
> -
>  	if (state == ST_MAINLINK_READY || state == ST_CONNECTED)
>  		return 0;
>  
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry

