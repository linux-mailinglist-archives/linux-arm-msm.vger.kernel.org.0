Return-Path: <linux-arm-msm+bounces-99805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eK3tI2iTw2ncrgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 08:48:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC58320EA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 08:48:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8AC773098A23
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 07:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2DA38757D;
	Wed, 25 Mar 2026 07:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eTJ7x9sQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VewxxH7L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0497379EFF
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 07:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774424841; cv=none; b=oMjyCTxH9xSO8jo//Pj+lPDdq/WswJ6vk8ZJxCbofUiSaVOFRpPMt85YiDAfwlaEBJdkTUSIvXIx/mTSkT/UKjt51OdHVkzXWsQAAtnz1wC6LCqVKeoRKD8nDNWSoPzJPGcWhtDNl3KfHP+S15gdROKZWhLbuGJV5i0TpV7e3zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774424841; c=relaxed/simple;
	bh=6O2BAi5CJp7g+xXTVbS/p0p/D7tqGCrUl8T1Qww5fD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S3m+34kDDoixoSJOimoINjSHrXUVfPAy61JYkGnzJhraa14Ph6TDvrWMXasrQQOyrVR4PUwr++paVDEEJSBYsB6DIVjmZWeQSsB/Yn6UHgB7cKxvOJ4Rilmolo7JymG+hGrKC/QA1dqy6TrA6Dozt461kFhYdd9fQq/nXj1j+d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eTJ7x9sQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VewxxH7L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P3xQMS919830
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 07:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jbmWobzZxEkWqGh44BpBynlL
	LpPaqHanh5XtZddkKA8=; b=eTJ7x9sQFm/PvYzoR84aHo2WzU2a3JA5/VU2PwGp
	dKHXrfYznOlhvX6P77J1TfW8rw233jn8A5RiqJQKn7N0syjZSGosGWrTLQ7Uwedb
	l4MVwo3NNpzAwez1Bd/RnwdrTWIZKv2TFK7uth0w5slkRnSzOfO4XypeJ+WZVNE5
	9Fq8F+yl39ATHEiHngXMfeD6wfMrC+iH5mg4vP0hXPHrMRWi9GRQX2UxgElYVmpF
	JYEbjd7o9gkiqD6zOExvjGmQsvBkBs/tEI3XKj3zY5bRnC3MVPbdUsRqzGtm+JXl
	8tqBZM8nXFMuagOqpbjCjNyAZ0djxs8YEbjkQEtiUcyGYg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489mgqrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 07:47:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091327215dso24723921cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 00:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774424833; x=1775029633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jbmWobzZxEkWqGh44BpBynlLLpPaqHanh5XtZddkKA8=;
        b=VewxxH7LLW870TeLPcIAWLqpQSTPzzSRSfk2xdAmt9Sq+ivHxa4dzQHOZ4AbKA5qHj
         AWD0/owQHGx6qkHN4TPAmL1vYtLD14BOb+5t5Kx6CNZosvLdo/atIa5PzSx9dok6m9Lk
         KFynC+f5HyEKX6TDTkEeVN18bzF5LZWphrFDi0p6hDw8sydUSOOEzhRmV3Tfi+WvAJfz
         znvVcs/4GD6YHej0k9r1HOUPe6U6+QSc3yyB2ZE9terXlUvxIstbz3YsZhK6fRXGA38h
         hk8E4sIKh2V2biiHKO8ipKmNR1O+XK6ZSjYTlp8B/j8WjtAx2MDHbMrjDQvtUuCdJrWx
         +jCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774424833; x=1775029633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jbmWobzZxEkWqGh44BpBynlLLpPaqHanh5XtZddkKA8=;
        b=Rs3PkuJjadfuCrBh2VFfLqDYDXqkl3cOjfiIciCHrQW/zBJ84c0yO7KPzsB5t6j9gv
         ETdXpx4a83lGvHMLbiSJhWwNEbb/vq/qJTjO8ehLgbS1KBUBD+JZLUzzycgAaFeuRn4x
         d4JQX919WL4Z5hMG4jvcDRMFbc925C2fh9hMgD6u+rMnPdaDcVriatxtAaaLmfaV0GvA
         XqsbBM0v92p8mRNfz+GaAMT3m+5xp7LZHDIPYp56Aj5m0rUwIyzgqSanAKlvtdusaORp
         DhKMaVoWKzrsLZ3CC6KprLuN3y61j3SaDHALvVwg+HuRrIC3Uycw7Dr7bxRfONmUG4xe
         XMmA==
X-Forwarded-Encrypted: i=1; AJvYcCWiejAUTmFjsYqZpyFyJAi9I78fji9S6/uCEa+YddHHiqhkcNHxPU8W8ySb2axtUDeJNJL44MpYg3HlrngE@vger.kernel.org
X-Gm-Message-State: AOJu0YwEEytxwSQMiYI98Do5Sn1PQ+/veGGqZVXY5mrdTmfFATHU/Dvi
	l61SpJYZR8jOKIAQtx2gIsWlyVwNDkbMfb+oFzEYfAExwBuU4QDywMmONUuFQ1fzhHH8ZF/PMte
	AW0ntX7PUqBMXYOc7iv+khRR8nuvOh5tyTJpx4hVhur9OzltykJiiGjqqjt5tkj+8A0+G
X-Gm-Gg: ATEYQzxCUmgZRU79fy/O6ZyiN3iVRs540fQyIdAenQAC8EcCZp1Ao5WmtSNLOhbQxXF
	58ZLh0ETzCdvdik+W7k10G6ETVT6EdyKq5GKvYUrMP317OVC5KDG+bErE/jJa/17kxNQXqNkXAd
	SjBDgfdj79NuxlPG/LPM0IYbu34mnZXjKpmJtEbpbzgon1xkU70LKVEit6/PN81+0e0soM4Mvny
	j6ufbAG/4bgHodiMv39lbwqPmxDr7i1aXvq/8iSzja9bzXuRhB2nonjdlu//hf7yFLZ92kbpmLZ
	crJRlFopIj3LvGpp/Mieqw5jMIswuIBeISGxRmdcS4w01s6y6h0s3OYIiOGpvAaX76rXxgR+026
	ROU7meB0hDdMJzlFMmuPAO8LPkNpxSYBjCF645gprFYC+fKSAszHRelf0JiSjJf7DbuInLzKf8G
	V7a9IYevmsXkEDs0Z+hxIXuaUyBU232A5LlgE=
X-Received: by 2002:a05:622a:5b95:b0:509:2448:41a with SMTP id d75a77b69052e-50b80de0052mr34310171cf.42.1774424833620;
        Wed, 25 Mar 2026 00:47:13 -0700 (PDT)
X-Received: by 2002:a05:622a:5b95:b0:509:2448:41a with SMTP id d75a77b69052e-50b80de0052mr34309991cf.42.1774424833214;
        Wed, 25 Mar 2026 00:47:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285206f73sm3623553e87.54.2026.03.25.00.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:47:11 -0700 (PDT)
Date: Wed, 25 Mar 2026 09:47:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v19 4/4] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
Message-ID: <o43ppkmsdrg4c3tz4zhg2y2mszuryjxxyaowaw7l6ldhzjyzn4@omf7wa5yboy7>
References: <20260312-msm-next-quad-pipe-split-v19-0-4ffa2b06c996@linaro.org>
 <20260312-msm-next-quad-pipe-split-v19-4-4ffa2b06c996@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-msm-next-quad-pipe-split-v19-4-4ffa2b06c996@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA1NCBTYWx0ZWRfX33abjik0gJcP
 M4qGmkRtgsPkHg3sTVHXEWwppQjZkx+iOBi0+N10FxvWwq78TldYQIebzKn2Iu24sgW9vj3PwLb
 NxguWqnviLgj9CS63Ccow/FOF6xof24qSpO++Doj8/YWBrcB7q+f5z1vFBZxetvZ8oO63prfzuf
 pE5CnbF/FQB5hf5bWTGNLjE7wpOT8AvBFL0+7PZ44d68/VSDD79urS84mOiUuaGEMItBMOdXI6T
 v63TDLjX2Bhrk4Gqy+4CYgT3xU9aa0N1XZpWDksu9eZgXvjyRGBapERYANJBl5sXtEQSC8cHYgC
 LAC2P3ieRY0Ian0Bsw9yUKh+IBFQ3qURpyXsVMMV3HMFrNbxj97MbsKHeqk1sO0OaW4tke4Hb7Q
 gXp+9rbJCE78HlXkICssb3/a/4fO/BkGllMKXZ89FH/5m5sUHBBBEgZP/bVmuV4+2CpM8T3n8v0
 HcxFhPU7zpXXCFSb3dQ==
X-Proofpoint-GUID: nhMoQYz2nx5j2JCyP1SFi_bq5f68KUmD
X-Proofpoint-ORIG-GUID: nhMoQYz2nx5j2JCyP1SFi_bq5f68KUmD
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=69c39302 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=qWzgL6TmHCyCF3KwFOUA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250054
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99805-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,linaro.org:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0EC58320EA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 04:28:13PM +0800, Jun Nie wrote:
> To support high-resolution cases that exceed the width constrain
> or scenarios that surpass the maximum MDP clock rate, additional
> pipes are necessary to enable parallel data processing within
> the width constraints and MDP clock rate.
> 
> Expand pipe array size to 4. Request 4 mixers and 4 DSCs for
> high-resolution cases where dual interfaces are enabled for virtual
> plane case. More use cases can be incorporated later if quad-pipe
> capabilities are required.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Patchwork: https://patchwork.freedesktop.org/patch/675418/
> Link: https://lore.kernel.org/r/20250918-v6-16-rc2-quad-pipe-upstream-4-v16-10-ff6232e3472f@linaro.org
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 48 ++++++++++++++++--------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 29 +++++---------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
>  6 files changed, 47 insertions(+), 42 deletions(-)
> 

This patch can no longer be applied due to the conflict. I will try
picking up other three patches from the series.

-- 
With best wishes
Dmitry

