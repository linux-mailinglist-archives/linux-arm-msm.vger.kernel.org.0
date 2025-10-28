Return-Path: <linux-arm-msm+bounces-79291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB645C1701E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 22:31:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADBCB1A219C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 21:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3FC3563C9;
	Tue, 28 Oct 2025 21:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DmSI8K4O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CZOjNjCE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE182D7814
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761686673; cv=none; b=Kwc0TyKrmFHpdxAAixb3pe/vJtuWW+ahituFFlKOmTkZO7mI30OtXrWyUrUQQ4rxhXspK6jRSGsGSavUfMMXNXxldYftIgTmUjUiaK6KMFj1yu04G2r1tgmQKacK6UNObAIUyOgiY+eH6KwQ/i8UJcjpLptKB2DyHk2hMn+WjO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761686673; c=relaxed/simple;
	bh=020c66iB5+y76ZpPyIScn5I1clx+uQ9g19ghiNqRlrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3CU8P3vvxWd7tvK+8nBKW3Jzimkvbuv6kBrm8Wd7pOLJIDfVubEdLr1BqUJzetbJ4XVbzl6lUipHTs78UEO2fJql7bSgi+KfY/PHNFwC/p4ugYCzyjZLHRDHPPBFolCW9Dbyj/EQd7ZnJVei3py8FhPac1cL3r0jQrJQbRglls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DmSI8K4O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZOjNjCE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlLOR2575179
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5bCRTQJFB2jbiTAQ3zVXCAwQ
	bMubibaIIePdt5viwpw=; b=DmSI8K4O+klfJJd0zhAhhLGDaPEn8oddq2IUfYrT
	xMlsqPVmIQlMF6WLM/k/t9He7ORjoZGFZGkMpOPiKXzCAvtUML51/8yFjP/QxoRf
	7dgAAqQ7Y6Xyi+kUcVCO5WjI+x/s8WAZbZQiChB58tmdZy+H6cHhq2ig8GGpFxk6
	GKE72zBgfsEliGBirgDvigZyYWamL/NWuH+iSnay65YEH73ykIyK4FPguQctPjTm
	5P7QMHEMYuwmdKpjBUhi5up5mYwOq69CvYzzwhUKELSiz/Y08U9wZmlYVfUpivD7
	GxQiSUY1/arwbrQOsaE0RzHXJ7d8TlZeLVn9/9d08pCtgw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a207h1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:24:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4eb7853480dso204140341cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 14:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761686670; x=1762291470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5bCRTQJFB2jbiTAQ3zVXCAwQbMubibaIIePdt5viwpw=;
        b=CZOjNjCEgBDZRu40mqZTLcHiOWbdb52pJxm1WSr3PPzMlYLSbGrqwxYPyCtp8Tu7U4
         kY5LHVU3LJARNipOzh1cFUp4gcMRHNuswZD7/mUXluDYnDQ+1xunugJWqoe0w4daedYj
         ntoEW7RBt8wy+I06jwmHTus2YLcpfdBa53MH5vBFA+qFL3to4gHfgKgHpzgpdVJWlZAe
         iK7xxlJxd9dFsKBcbS10NFHIjlyxKCtN2e6hLbcs7Ci/7YFGxA6Rizs3Bumupc8LVCh/
         A04DIsjN/sETvPePMhJeI9RBiSK2awF8rH9TY2A+uUhmszZ3Jf0xvMBp20d6GDcMrYqJ
         5TQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761686670; x=1762291470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bCRTQJFB2jbiTAQ3zVXCAwQbMubibaIIePdt5viwpw=;
        b=YCYEWB7Q3AgvFAehNZVQ7EqX/Q2RwpCcUNfcwtv3Scv+zIONUNfrIHpXMY3UytPFMk
         sjlmerSeZTXBdn7fkvt7WLr9IzEYuiRB0yXtfiwdCF+tLqkpjublLliZ4tqivA8iztmn
         Uw7bB1tcnQfLZA7jG/e5VizQXpxPIJSqvGF6WMuRvIOrbQimC0JYpaItmsBb0ISZJomv
         AZIEfLTpiNVSyLYL1QlP+L813fABNDxIFQVMdTbdkK7d24Y8/HklY/+R9k2C0yIXE7RQ
         fIQSk+vu6YqVJ6xCQAOrc01FBkJd01h1bQbCV0JBHh2HnvnwrFEjfsxVSOb2OFRXX0j+
         eeXA==
X-Forwarded-Encrypted: i=1; AJvYcCWN0UaHIVgq3B80jn5YYGY6abD6wG2EtshW1kBlEiQ/6VACcTwzk7q/OehVQRDTrcvdbfF3ZxUUwc6onNJ+@vger.kernel.org
X-Gm-Message-State: AOJu0YwWCDFS2QTE5wAsazoz2IMd5QrgDXVuHi/J1sF/emK9PNy/3HvT
	nG8jBoOOL6jz1ZPATCRZjb8IYuYe+OKsXxX1RehutS6G0wLKyV53bQT9ENil4X3eVUceOjEf+1p
	ZP2cKQOpkDmcUEKObvP8vrgCNeYAiZTIPBPZhB0nv37CH+lRC048oRCsDV/RrUOlgFzM8
X-Gm-Gg: ASbGncu6P4fayzjDrkzTI1bRGLAerIIal44W0lcgOe8liy5eBK94VEhx8Emlu1fUydH
	4uPQmehkW+nR4oxA5JgfxT9TwlXkIIo3h6Qq1b22t98dobatQMhHw4sDU+St2w65QfdaT3gthm3
	eDKGKyYucBdWQaD1SLrcM5q2GckpoNpyYXX1/obJ9PLjM0stJxlMpspVuoj6CerMfLPB49gwOQo
	TjXLmKYQ1ME5kwdjmmBdv8YOx9Oi/xcnoSmzRcuc6XWQtuQq1H7zTt67VwIqWmjec0rFOOkzvd5
	or4uBidojDrZ85gVs1HkSkmGXVAQNwiLEdP5WZdChloieJczGawajg68ye8Ie8MXY5YGr4ALysR
	Z8yw+EfnNB+Hmh8Rn1IXQyaXGHuKsP63nK8eObHcs8K+5g/Hv3j8FBGz1j8b8WRARUVTeOxz2PC
	o6cwGU8ybdfvSQ
X-Received: by 2002:a05:622a:a10:b0:4e8:a464:1083 with SMTP id d75a77b69052e-4ed15bebdd1mr11272861cf.54.1761686670462;
        Tue, 28 Oct 2025 14:24:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhLEma2o8DN4JeaTECNRsXH69AeLPm0uhZSZqLEEuM6h5foWAcfY/1Wv1k1KF+xWA3zvGPcw==
X-Received: by 2002:a05:622a:a10:b0:4e8:a464:1083 with SMTP id d75a77b69052e-4ed15bebdd1mr11272461cf.54.1761686670038;
        Tue, 28 Oct 2025 14:24:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59303f54e6fsm2934578e87.94.2025.10.28.14.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 14:24:29 -0700 (PDT)
Date: Tue, 28 Oct 2025 23:24:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] drm/msm/dpu: Propagate error from
 dpu_assign_plane_resources
Message-ID: <t4muz37yg2n56pdai3rzslunnsgq555yb5hnpnvjwyavtaneyd@7b3eofc5afex>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
 <20251017-b4-dpu-fixes-v1-2-40ce5993eeb6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-b4-dpu-fixes-v1-2-40ce5993eeb6@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE4MCBTYWx0ZWRfX7N/it3ImBCbS
 xgxKNdFiqWT+PhMCzNSsdL8sGVWAzwUpkndNF3BVd9ZYdajo5j6hLnWROUwhjn5EVBW0WqePFtu
 vZBq4BSjHMVWmcC3F91pq493OOi2AJUwA/9inaFtP1F07l2cuVMGyVS1olGOfv4rNhxXkMu4tJm
 4ZJyMv5p2AZGkXUFOGBDh6YdVz9ztkuFw9fvI8URj/r1lQ3h4lDxsBeIajOLTLbW+HmHyoOPx3y
 A/n7CzBPjB1ppwfV/RkbAh4l6LDvzXJRdCpQy7rX3vWcnQ89fbNA1kKjjnBxjBe3i5aM6fSIspH
 /7LFoA++F9zRtl+AcuaN6xYQ9NzlfTlBuDRwGuZBK3mBwU1tJWLIOAfiqntTWxi/TZPeODV53P7
 4B+A2euX5zgMxdhJsHp2NIxVmS1OBQ==
X-Authority-Analysis: v=2.4 cv=V5ZwEOni c=1 sm=1 tr=0 ts=6901348f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1xg4ZLFJ8Ga65Luw_zUA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: IO-MXs7v-r3A-4WbkZ23zWiftRtn5ufT
X-Proofpoint-ORIG-GUID: IO-MXs7v-r3A-4WbkZ23zWiftRtn5ufT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510280180

On Fri, Oct 17, 2025 at 07:58:36PM +0000, Vladimir Lypak wrote:
> The dpu_plane_virtual_assign_resources function might fail if there is
> no suitable SSPP(s) for the plane. This leaves sspp field in plane
> state uninitialized and later leads to NULL dereference during commit:
> 
> Call trace:
>  _dpu_crtc_blend_setup+0x194/0x620 [msm] (P)
>  dpu_crtc_atomic_begin+0xe4/0x240 [msm]
>  drm_atomic_helper_commit_planes+0x88/0x358
>  msm_atomic_commit_tail+0x1b4/0x8b8 [msm]
>  commit_tail+0xa8/0x1b0
>  drm_atomic_helper_commit+0x180/0x1a0
>  drm_atomic_commit+0x94/0xe0
>  drm_mode_atomic_ioctl+0xa88/0xd60
>  drm_ioctl_kernel+0xc4/0x138
>  drm_ioctl+0x364/0x4f0
>  __arm64_sys_ioctl+0xac/0x108
>  invoke_syscall.constprop.0+0x48/0x100
>  el0_svc_common.constprop.0+0x40/0xe8
>  do_el0_svc+0x24/0x38
>  el0_svc+0x30/0xe0
>  el0t_64_sync_handler+0xa0/0xe8
>  el0t_64_sync+0x198/0x1a0
> 
> Fixes: 3ed12a3664b3 ("drm/msm/dpu: allow sharing SSPP between planes")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

