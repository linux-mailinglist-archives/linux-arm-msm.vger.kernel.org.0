Return-Path: <linux-arm-msm+bounces-88419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC07D1017D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 23:43:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68A46304DB50
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 22:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3AED2D5C7A;
	Sun, 11 Jan 2026 22:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NfhwuijR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SwQ8FH2b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D3E2D5412
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 22:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768171404; cv=none; b=haF8f9Y96swfi2JqdLMwUb84UaKlKk+k2eTAbSPh19vQKwbFicw2TpoBVUqcc6BPA9SDYgRVm8djWciJ7Xjz4r7DpGpHGMxOCZlwG7tpkpkXT0nInvDprQzRPDsBgIAGZOq+fi5JqB241zpD3c2DnloMZEPoFfMJw51lueu0DXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768171404; c=relaxed/simple;
	bh=1HpYROarVFg9MsHjtZFtlcOhuGaRKSkmhm94t91U9Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8IhDabvSbJQMgMHUgmsN+EWWd0S7/cOG2AnhYeHvu0/9jknppray3OmRdUoMnM8hb9VsO/xQsZTMjdo6uVVcD9UdY/eL6YyN45D/AEFc+B6Xn1NTgBEhWhFUhygdFVcjZjCyid2UJIQQgcCvRKjOrlFOBOHqXIr3hgmFu6Xwjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NfhwuijR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SwQ8FH2b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BMBn6T3118447
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 22:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Faru6CUzvpC9D3oH/nq2pvSx
	ZQHDpHYFbWCOcDMAIcw=; b=NfhwuijRI/XJ10J2lfnowsT0HnkzmKrQr4/eLW3K
	UEGbDBUdOrbBaIke78lJcRxR8Vab02tAYfESSoyuynOQfcq3f51SEu7VoVh9lADD
	BLkv+zAfGWrkWW1WDjsAIhVQKe3mLBIbnk9nzMRExQwsltfQB+bHYROLb1QW081b
	751Datk9nEAPJyaDnO9/iZJxsjdzRp4cum5E4CfY1vtNAWMnXK5f0nWFGhMZdCIs
	zlPuLkfRMNrdksvZntSj4Vky3TrwNr0IINQUjqD13elBSZJzI0OwG4W2fqElyuKj
	/tjuG/bSZ2LO4ugmGTKGE9I1sny4KIpHRMclT9B290YgGg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkntujae3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 22:43:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a366fa140so171690106d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 14:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768171402; x=1768776202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Faru6CUzvpC9D3oH/nq2pvSxZQHDpHYFbWCOcDMAIcw=;
        b=SwQ8FH2b3gqFaCatfqm6SdFWL3V1Cpid4MoDKn/RHgRNDsLFuVwfC/cfhGXVtIIZ6n
         K8Ney8mQKdiImN3HtL6KJxLZU87riqiTkpgomkj3UbfH3lqioRS7rO0xflTMl+ratowf
         6kjZoDgaN24C8oJCatF9X60f35KSCXyP+7X8XpgAheiblrMWoHBtTBENsTSEWHmwGUgG
         8uq5DfY3UqbPmkG+mLXQ/B9AmvdrxmY2L5q7qfDXz/Ue0Rgd1zwvg2JKB0teGhDzna1T
         pzloglXYp4rtYf9TgppviJqTSLQUzfIUBb4FveuFer6A4Pu72/vNsd29QGnSNqw6cHV7
         82Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768171402; x=1768776202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Faru6CUzvpC9D3oH/nq2pvSxZQHDpHYFbWCOcDMAIcw=;
        b=qa76D9EZcMgDa91dxYlE//JfmyY7C2KKJignXCfTeLEo6Wel3SlGL6aJrGlCMUJBCM
         HD+35MHvzkMPavB9nsdN5cv2DImsvgyK/cS9zM99fa+7lDTDHoRb5f4AqMdEXq3JqDW3
         w2tHvTH7HRBnQrzAb3Q50lwzv3B/8kjtM64plC5nJQ/Dep2v0YRTQ/9vOHvof8h4kVdS
         l7wYWwgJpGlqr0C3mar04c1paHr7/EZrirW825kzWUX3iLLVwJyMmyhYOjuavTTSWMGa
         WBX73S9jTI2sC34dP1z8HStYxVnipas29i30HOwkkUP4RM0cH/bMpxtl01OhKMuX3J+X
         dkrA==
X-Forwarded-Encrypted: i=1; AJvYcCWUjtlMGkyMWxnQArL34NMBXkJnVU3OAj5bXCsUBbJKumKAlc/GrfftyLFKfCCDR0kCJkH8tona6HE2CmfY@vger.kernel.org
X-Gm-Message-State: AOJu0YwEJHjPd8kX9+bFEJjRlpeeFnzi5sN/K7DZ+5oeY/bSpBrZbRQe
	NWUcbgtX3OYHajqnPvJ6KV5wsT/E/cgViHEDi/rvlrMteumPPOeH/EmjUJpAECfc+ty8RGklPSR
	B8goHaVR2pcgI/KJvuk77p9PMBKpTR8MJCUF8b6Lxyq70fAFEd7jDs4aUOgu4ZiUsnbCR
X-Gm-Gg: AY/fxX4yy/CGDNHvlibi+LffbGWcaFu9VXYDukKof96zEOWqs2FWZ0fIipFEz28yfzG
	HKccUQd0amzt5pMIpUBza4r571XshckTg/0Ewo0FpWFAbBYAWgTo3n402nwjrS1f40Q6nZq4+yD
	mudB7pd7d7M9cRtQ3iYPIR+VVOEp1xS17vHNwePjIejwW8dOAK8olbIXF0sBpJ5XeTLDvGnv9OD
	/GP/mci26yqaZx0C8rS7e6USydWJDXN5VfDIxp4Pd6b1JdJOYOnoR/gKQi/zCHOeHvBgV5EilEo
	akd/lO9GaUpNRvyKgqVbSSwY8MyKLP7GYfbPWEfxifsOHtrUiKhMZLYpGjpea6AGZZs9ot1yIO3
	mNha1LCFp56iW7CgFWyWCBXV1JZbKdNSMo7djTdzEaXdNczyOOM2UwCXqJVmcwf9Df2qQ6XS8iG
	PAmHuUzXPl2B+wLIrSidBCl0c=
X-Received: by 2002:a05:6214:234b:b0:88a:34dc:9933 with SMTP id 6a1803df08f44-890842aafeemr249835676d6.56.1768171401757;
        Sun, 11 Jan 2026 14:43:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEthh+n2T4dXkL7d0hv0bhD94TCKrGq5BGhzi1YhOggBEE5NkjcgeCy5QYeiQcAKszgoKM5pA==
X-Received: by 2002:a05:6214:234b:b0:88a:34dc:9933 with SMTP id 6a1803df08f44-890842aafeemr249835456d6.56.1768171401291;
        Sun, 11 Jan 2026 14:43:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b79e11154sm2643050e87.94.2026.01.11.14.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 14:43:19 -0800 (PST)
Date: Mon, 12 Jan 2026 00:43:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 04/11] media: iris: don't specify min_acc_length in the
 source code
Message-ID: <4cvcpvobzlcyaqzy7ewhgc3u5gqawt7pa25dz6jkhuwintbkxp@ffun7t4bot6a>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <i1eMEm9fSpXb30tw6zP_FKeXfJr4sD7bS88njLCMUniDy_QNsOiVn5w41aA0zXnLaVRNFLaLrHgr73Yo2XV5lQ==@protonmail.internalid>
 <20260110-iris-ubwc-v1-4-dd70494dcd7b@oss.qualcomm.com>
 <d8f6969f-a58c-4a02-a59d-f608e1a95ba7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8f6969f-a58c-4a02-a59d-f608e1a95ba7@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDIwOCBTYWx0ZWRfX7OlNWvSa7LzP
 E2CgunJbLtADiPPYJQxUYBT7SUbsZCSxcliwTZLsjpPoHwuaNqLet7mnA2pOP81AFAn46azeCiO
 9hEMiWSoFmwfh++udpFMWny63XdRDkrMeH73zkFaoz4ahbuHpp6uvJG2TPAwTR4wNjU//kP6aiS
 tQDgp61To26PpFAxNjI3J6/Y7w+wKA/TjTXgKS7qgOPiiqZTkZLziFbDP/YPSNQwcd45Qj+BlAR
 CAqnIKXI7EICxsBzOjkPfB96Yaa87oAprOWAcoulq1Hs0WfBu69aLQImXARorCSV/t2J1JpM1Ro
 7LBTGGiBAPom4fHDNl/B+WHgwKTYXll1PEmI7RJujRDbWkfwiEYp7Ez/Nk4YMltm1Vh5pD0uc9G
 geKtWAF1yAOXUvRanwTFSzK/Ly3sMg1slZA8YVzE41wK8Zvir894EMMkpnyUt73ws5v8vEP3NR/
 VBYFEHTot6Qo0pcs4sw==
X-Authority-Analysis: v=2.4 cv=R6AO2NRX c=1 sm=1 tr=0 ts=6964278a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=kMIBw9bMVBG50rZdcTUA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0vHC3X_MD_Hw3yOni2OG5L95bAttXTXO
X-Proofpoint-GUID: 0vHC3X_MD_Hw3yOni2OG5L95bAttXTXO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_08,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110208

On Sun, Jan 11, 2026 at 09:06:52PM +0000, Bryan O'Donoghue wrote:
> On 10/01/2026 19:37, Dmitry Baryshkov wrote:
> > The min_acc length can be calculated from the platform UBWC
> > configuration. Use the freshly introduced helper and calculate min_acc
> > length based on the platform UBWC configuration instead of specifying it
> > directly in the source.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 5 ++++-
> >   drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
> >   drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
> >   3 files changed, 4 insertions(+), 3 deletions(-)
> > 

> > @@ -146,7 +149,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
> >   				    &payload,
> >   				    sizeof(u32));
> > 
> > -	payload = core->iris_platform_data->ubwc_config->mal_length;
> > +	payload = qcom_ubwc_min_acc_length_64b(ubwc) ? 64 : 32;
> >   	iris_hfi_gen2_create_packet(hdr,
> >   				    HFI_PROP_UBWC_MAL_LENGTH,
> >   				    HFI_HOST_FLAGS_NONE,
> 
> This code is fine but, I still suggest changing the 64b postfix in
> qcom_ubwc_min_acc_length_64b and just having the function return the size
> for the platform as _that_ is the more sustainable way.

See how MAL is handled in the DRM patches. If the UBWC spec is extended
to allow 16 or 128 bytes, the drm/msm driver will need to be changed
anyway to cope with that: driver uses flags to pass the value instead of
passing the value as is.

> 
> Up to you.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> ---
> bod

-- 
With best wishes
Dmitry

