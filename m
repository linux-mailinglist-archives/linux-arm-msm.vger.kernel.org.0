Return-Path: <linux-arm-msm+bounces-107226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mB7JAjYPBGoMDAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 07:42:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0746452DA53
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 07:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0C498300B293
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 05:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A444C3A640B;
	Wed, 13 May 2026 05:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E9mxK0iJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NJIuMxX+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB0D38736A
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778650926; cv=none; b=hUVfLUvC+yLTNXhXgFisLBMF+146WgR+ZYCKur3ccLr0l6m2zK/VKl7VQ3pWB5m+nOrUFyY2Pzv3XYaIGlEOtkmB+aEK60AkZIUcCb/Rcsii4C+E3c+/yHTDq/cZ8LIhdwQeh0oSnIg6OhVm++OCp8UZFDIMWm6RSCUqe+v76fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778650926; c=relaxed/simple;
	bh=Yvx/GJLyuNctRjFuIyxBpEkjF0OTn6GbcCDFx7zapM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P8ijStUYhpdN4f61xfM7kelE69mERrhM5RR0MLTHDfzVgSQCbYgBce9BxY+iM+CuM0gwktZ65MIOFffN0tTR2Vo8DDyJKSp4IMclHZNVCYfUauX8uYfwg5LZDsPeQVMEAfmG6/COV4SEUNJXB+YCh97MfcIp88J33d9M/j6DU8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E9mxK0iJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NJIuMxX+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4pW5c3136880
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IgM8gcz2SKfXvL/L07c+vZde
	l0N9q5supOksnstbB2A=; b=E9mxK0iJnh4Wt5wk8jWpZaCTi7xk8K6SL1yc6GpJ
	YcIHcTCiCYyJ3TNaY0fQLRYcUZ6CDHqM0d87yk+WUeO8TuwyQM9fcHiAJB6+4J0u
	9pJ4zcbFryfEpVsB95oD0R3YcaiwT/G/ezIuzaQH3QprQT8sfawnk9MuYMVNWLjQ
	rkJd4AEprOiCDwpha/6BOwp5MQ7mZ2OiUdjcbhwWeUKraqDK1kVS2GukHVwkU8SN
	YkP15PhowlZ7RaWudmN/FpAWMh0TkcCXhyuvuY1qm6TLxf0sb/ZpoTQxSg86Z/yV
	hIFT3cbpSGee69zWEGZEgM5tkrBwpy+579s9pu/+6aH3BQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e42rhuwsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:42:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d9a6a853bso121668981cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 22:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778650923; x=1779255723; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IgM8gcz2SKfXvL/L07c+vZdel0N9q5supOksnstbB2A=;
        b=NJIuMxX+GbI2LanFWP1bgBap/64pmJYtVXELbwcmyTc359e2PCYc3wEqiTG8mqcGY0
         RGSKND2yn7ekeEKCcUGaEnDyTsWDGZs+xk0F2sRWGdpdgpsujnvjgmVZTFSPPfV17KOU
         hh0G8733lnrTkCa+2K9vyQPWpF4Ls0L7ilpIY1iNsHP82zsJTvPiODH5mm2TJn75bg4p
         epjMrEoUWe+YU+bJTr3MZJshkBkrLEbhRGMFFMPKJK1EpMAAmmFJ+VU2Jyj4svXSMuaC
         zfvl9bGdcAq/84QnifIOgKPOYyQoDeJ26lEBNloh6Y9YYktDTNRq35IwY8hLDpYSo+2/
         phlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778650923; x=1779255723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgM8gcz2SKfXvL/L07c+vZdel0N9q5supOksnstbB2A=;
        b=igOjUKckD8oY0Y97zc9MXbAkbx0HkjRJGKusc/5RY2bc62YpD7ndqjLEp0pg5Xoysd
         PdEeLvE6o80nTGchbKsB6ismGgP0xbGjCJ198Qg6MZ2aecjys8slG8w2gYw0oLZh0jjy
         2IrYm9zgaBqCxc5/V8FUK6yvYMhq494jK8bHW+CmwFBYaI+fhhnUWjWPVdBgtcIewAtm
         /7p8F/2Krcdf/2o00tX8B1kCCmr6bLLQOXfFLEQcg6En5bF0tvkLuoKUztP1rX5bowSV
         pZekZk9yx/e2wZ11T0JeGUrhBrtLFI+XQ7AXNhjIsAnLsX0AMxtY9DOtXBELlmlKsnz7
         ihqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gpS72yxEQP5Lecn0Whn9cASm+PHq70GaBYI4eyk6fPS5FM9zseFqnzcTh8HoSUKW47xBUQNbUHDbsQyVG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Sa9SLVtCKn7l0krw3wCom8PWaXaD6Tgu594zyfX2y3oyK7ek
	Ng/Ihh17J/HkNWILgbDh+iNUOp6DjbmM1wu4fYWRZOUBubmRDSVRlewei0rdjkMr4t8+7r42BsM
	Bh32Sz6pJeMyR6BW3xTkvrcq55N/Vrxlnw8k2sLNoeU/6KYvjvUtOwm71mGaY9niCsmpA
X-Gm-Gg: Acq92OF8tPD8Ky8E0ZyJ8GQH/ng6c6qgIJjJQhoPTrr/sL9tdNWiHG/Ip7KNaaeWQN2
	oJvUkUgDocttlnBKzLz37uEL3h8EbvX3JVRT4KFiTxiT3lD/8c0ii335ZsC7Up6DGeCzQ3Oc8UI
	lZQ9JDLGIXXAuI2aZ2hshEr/LT5X9vzaL14nTYUkuME5vzGfzMtUrDOtybz71wlQt0nFm2IHHY/
	u4hXMgjmX7h2JiptASrytFB/b07rEwJVBCedi8W5Cc0Oz/ORcJ1DLYX79wbQXM7SelXC8GBNc09
	tK4vpMVlO9pP1OJJD/uAVyUz0aobLqcWXXNWdkC4RypIv41c5CTx1Gtm+mAn6ccJdcUO08GixEA
	/lrpoJWi/QHb+omrKP20OTtnZ8b4fe7+c3/SJR6WQkx/GGpBIeolca4pk4C25v33KxzKblxkgNr
	4vYN5ijI/v8nuDf9nISTFxiofjiNa+KOn3JtI=
X-Received: by 2002:a05:622a:7c8c:b0:516:3183:c1fe with SMTP id d75a77b69052e-5163183cademr9783021cf.52.1778650923464;
        Tue, 12 May 2026 22:42:03 -0700 (PDT)
X-Received: by 2002:a05:622a:7c8c:b0:516:3183:c1fe with SMTP id d75a77b69052e-5163183cademr9782821cf.52.1778650923009;
        Tue, 12 May 2026 22:42:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f6292993sm37660181fa.41.2026.05.12.22.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:42:00 -0700 (PDT)
Date: Wed, 13 May 2026 08:41:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT 2/5] drm/msm: Centralize the standalone drm device
 check for GPU
Message-ID: <roeaegvmg2nvzt6j5yhmsv6p5vzhvsglzkmtvbnw7yq7u6bqqm@lo27u5mwsrwv>
References: <20260513-gmu-sync-state-fix-v1-0-6e33e6aa9b4f@oss.qualcomm.com>
 <20260513-gmu-sync-state-fix-v1-2-6e33e6aa9b4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-gmu-sync-state-fix-v1-2-6e33e6aa9b4f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA1NSBTYWx0ZWRfX8PjqBWliqZg/
 KPA6REmDfglSavgsLld89lX2qy8/7iZIgiMd4f0Q7dIQExT22UEfYizuU1S/TGBJxJWL/wh0XcU
 S9evJb0b1SpCi+GrWjXNM5boBswCD8OHFWvLXTD3HBWUSiFpQsHw5OVHJUassV9SqHn1ktllEfX
 RTuLQmurPjCkL8tFkn/XEVZF4VqU2dRJpI8NiNOGpdd/hKIW9OMRQjlpSQc8W5dwe8D7IgtdcMs
 qprTLZsF33Pt6Rr2vGw4dNPrfkciJajYzKtipTFe4ua9slSvuj09TSFzA5r1P33pwSx7BkzMfEs
 JTf6Me4Bb/oOUFvIavmP8BUURelXajQ3GFfp5NBrEEUuJhE+rGQXUpJ3h6ZDF4Cm5IVA/VsGkd6
 qi6WKfoinXD29hXqK/pRUixS/WWijaREaQCs3taxEZeR2ML//+P1hFUJ6VcDxPD273k52L4DXCi
 SOPLzqR59YgM2zMkLPg==
X-Proofpoint-GUID: mIZsbvxJB8MID-W2d8fSw1devqhp9AnI
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a040f2c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=MqZai44AJBDnTZDtKi0A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: mIZsbvxJB8MID-W2d8fSw1devqhp9AnI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130055
X-Rspamd-Queue-Id: 0746452DA53
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107226-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 02:22:57AM +0530, Akhil P Oommen wrote:
> Replace msm_gpu_no_components() with msm_gpu_use_separate_drm_dev() and
> move the platform-specific check for "amd,imageon" into the helper so the
> policy is centralized and reused by both the core driver and adreno probe
> path. No functional change intended.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c |  3 +--
>  drivers/gpu/drm/msm/msm_drv.c              | 11 +++++++----
>  drivers/gpu/drm/msm/msm_drv.h              |  2 +-
>  3 files changed, 9 insertions(+), 7 deletions(-)

For the next iteration please swap this and the next patches (yes,
introducing some code duplication). It's generally not recommended to
have fixes which depend on a non-fix patches.


-- 
With best wishes
Dmitry

