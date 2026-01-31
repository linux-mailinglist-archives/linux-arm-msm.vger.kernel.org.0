Return-Path: <linux-arm-msm+bounces-91361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJygHSq/fWkATgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 09:36:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF8BC1480
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 09:36:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 82F103002308
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 08:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD1F2E7657;
	Sat, 31 Jan 2026 08:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jz8lh9ei";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZIyy8cse"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A5A2FD1A5
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 08:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769848615; cv=none; b=ZCJp2lQk81jDskfZFaNAEnCkwzXBp+juguymbYkjntg1bDxeRk3hTZ5892iFKt1K+DPdtyYBE4YgpD84R2tCvxjV0d/jd6CKCJXRoSOJM8CojZLfXeN9lV3OipXwa0O841Hk4db/Dl2MWlG9ydr85l5IymGF5es0EJjBfCe3KJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769848615; c=relaxed/simple;
	bh=Qtf8JaHO+oJMBuTXs5dZFYcnzP5xq/rQ2iJ5sksiFnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUBEqIhnIVAVPjSdMmIjHL96gZD5ix8TKC84fXSPPrl7tz9XDlp8I1sEXxFV4FPDQ6utayIbS51M26wy1OZ498ykU7zHsPqW6szIulTvRjPM+7Uz/QXdF2VhAxsfVOw8VRfcMALftqS2w4C9KmkEb8w1k6N4DLRwnnLWFwbsKCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jz8lh9ei; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZIyy8cse; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4U2j7447972
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 08:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XC2TPSUzWPcQTzNqmQCvXpWj
	+IbAM0Jw8/jSDMDyfkk=; b=jz8lh9eigTiUTQ12dHtnHHgZJme/cGSVjFXigD7W
	lhAl8gg8omKrbR8U9eD2NqfMazIo6s2dj6lit+90YIUYjFiILVmG+IyQSWJRH5bv
	VHSJ7bOXlk7nqtl2M4fuO90pmIXwisNxHQFTTWUiXncYBUuquglIMWQyvicYayHa
	xfa4jZk+OVZrtWjNPzQdNwhWC84XyHgX2IisG3V0jdlmIz6vbuAeiJ+KAjwQ5+Yj
	vqsbN0rAablBVoXwHZSch98l2TJ0F7dnyO6clg1OwUoKBDJT2T63KXZxpW/jANzA
	DaUHdxxNbmZ1CuiQXGqAfSuCf0yfJ9hfds/VT/96YwSYng==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as0rghn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 08:36:52 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5662bf5094cso8587705e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 00:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769848612; x=1770453412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XC2TPSUzWPcQTzNqmQCvXpWj+IbAM0Jw8/jSDMDyfkk=;
        b=ZIyy8cseeucD0Yx0UBLrz79BM04h8kW8LkVeKAcVHk9g3m0hSpKeKsKb0IQTQb0sOj
         zBxO4k8QB0ahoqbLQNrSRbQOH1beSlX4UqqYkmrE6NaHGpo4y+YDHazg2oL9fuEYmrmb
         48CdKFLPdNL2zuaBS1ocRgVVOxESiwnfbpb0KStve4968lJiYYfN40KCpnW8rJcVJY9c
         hHxfcPJZ/+y7ucH0RzFJWruNHRhpbjteljPtw+9EqppIcFKZUdeukvPH4PuCG9deB67A
         TuDr9STBeZKnBLEWJmQgq3TJY93HWthQockDuivgas7gGRlR5MeCNk+ObJgUdmwttpYs
         RLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769848612; x=1770453412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XC2TPSUzWPcQTzNqmQCvXpWj+IbAM0Jw8/jSDMDyfkk=;
        b=AtlzqFhiL7VfE3jYOy/JsaHs/+kRgc2EWHJOYOpDWqjkeCeqhbCqI0uX5e+mzgq6+I
         Bc6m6XbhMc/rkDY3uHevrWXm5Ay1vJT/GHYDMZk+Kj005kv4fgiugvxGkovKQBqsHQyu
         Li+nK9b9wnN5QCP+UXl4Yecdh9ComiIel3sutqAooSi3T4K4Og37vn3Y/QzVoTv5Zafc
         At4rSbuicS9upr/e+L/P23vpY5f7B6IKR3D1Vvh/j5vvcsSadDMODs+fbG3Eit7Y56V/
         xR7BDgQmWK3wGYLKFSqTXzbmGoJ7RAHjPP3ioeySsLZqnxcc9vASP2M19Xvz9T6D2A8t
         waTA==
X-Forwarded-Encrypted: i=1; AJvYcCWV9jcOivHpXBoE45PYL5kOU9U9fnXtHQ8H6NIZmPR8TKhtBWiQBUZ4N76tsnIrhsxPnrnD8rMzXVaKBaNJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwFvXWimwQ8Xm7DNAnbXRN73rln5TL7SgA5TD64sx1qLt+DtQSZ
	3Sc1OEzrC0QOK4kbZ4/fQro3klf0BxXu7PLHu9coMJKcuD9BuUCCHmrmPV/xYz7w9bvG1hJz291
	UlzUZjisDnhuyWmIONc1iJGhzfXjArNbvzvSfvywV5+h1EY9+vFxbWzzrudLjn4XU+WwM
X-Gm-Gg: AZuq6aKuZSJv2yxtaVrpBl+O5UC9r/6AvR2uBEm/q4KBDpD2OiE7SuPVbNxWPRrjx2L
	5DH/WRHEoueN0FufMs/RQGVApa4ryMBmrkCyaX8OTgIJ3xfk9wAEPq9dmBpieEgescpIVSEo0tc
	+cUwHAz0W7K2ij61qFNJxikFvBvzkWPwxs7gOrveDyVfJEafaLieLSLMNGXx7kCBkeiceO00Bmj
	kNR9ZFGlT0zEPk/i34OUFP2yl8IGgP+3RSi/goSSbmj3z0jeHQWzOx6fQYO9QtimIra9P74xTAT
	oTUslydcc/sERB6nMk2ISs2IzbxZs1r4l94NC2s+9wUz7D0NBw7JaE+S/zae4U5N3G2owVeqNlh
	XGw+zepsHpamLz/F7jNXNLapc45yyI1yle/fSDlCaKWs/VshC6wwdvOqh5QiV+MRLOq7EkBKv7m
	G4okRNFDe4E2JcfA217zvf4kY=
X-Received: by 2002:a05:6102:dd1:b0:5f5:5c93:8733 with SMTP id ada2fe7eead31-5f8e246ea45mr1636983137.6.1769848611967;
        Sat, 31 Jan 2026 00:36:51 -0800 (PST)
X-Received: by 2002:a05:6102:dd1:b0:5f5:5c93:8733 with SMTP id ada2fe7eead31-5f8e246ea45mr1636975137.6.1769848611592;
        Sat, 31 Jan 2026 00:36:51 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b2e9bsm2241641e87.54.2026.01.31.00.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 00:36:49 -0800 (PST)
Date: Sat, 31 Jan 2026 10:36:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sunliming@linux.dev
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
        simona@ffwll.ch, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        sunliming <sunliming@kylinos.cn>, kernel test robot <lkp@intel.com>,
        Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Fix smatch warnings about variable
 dereferenced before check
Message-ID: <lji2aqv3hqrhbacnugbawzft7t4o5dvvh6fwbc2sydapqfk22c@bfcauuyklstm>
References: <20260130053615.24886-1-sunliming@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130053615.24886-1-sunliming@linux.dev>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA3MCBTYWx0ZWRfX0BVvbpGlR3je
 Pdu+xRSfy2TT0CnUaEHCJ5cYnhwPOzgGfbyKfD4tqaisQwT6rPkPvbonWsCSoS2tLwOITkPN22n
 vrNuwiHAbgVEnBVvaQ82iTzXBNfxjHoIrL7XnBKTThU1FCGl0ZJx7GJzfUuHUBtU8MuYT3XaXRM
 Z3z9f7IGRUbKHo9pEjvtCE51XrLA+CMqHrIaafOg3/rzrDWGbYrVavl6K+cJi+eev0QQqPjAWeC
 wFITvjVUsqSdEVniNnQKwQ92Nt7Hsd9i1dQkB8Sw0GJOalvSmSTv2GLXX+rhbISVMA2T8/6gt2a
 D0qm2wJDWjI76UVOtPbXgYccT2NOEm7elGfGfwgqE+1itSCg5N5mCppsfnBUn8Yll4vGccsZIF5
 qEsbaDFkIeAACvgQZLvhu/hJ8FSgSonMAeY7D1W4Gv43k0iUkialIVvqrx0hnOY+kRj4O70D1PH
 OnVXSy6pO15BFDHOT6w==
X-Proofpoint-ORIG-GUID: 1VPf7pVTeGjVjWEyhB6s6SUZ9RuaYTxn
X-Proofpoint-GUID: 1VPf7pVTeGjVjWEyhB6s6SUZ9RuaYTxn
X-Authority-Analysis: v=2.4 cv=MYthep/f c=1 sm=1 tr=0 ts=697dbf24 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=zk_b8o_FbLgx-YkRIm4A:9
 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310070
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91361-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org,kylinos.cn,intel.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,kylinos.cn:email,linux.dev:email,intel.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1AF8BC1480
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 01:36:15PM +0800, sunliming@linux.dev wrote:
> From: sunliming <sunliming@kylinos.cn>
> 
> Fix below smatch warnings:
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_config_v13()
> warn: variable dereferenced before check 'ctx' (see line 159)
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/
> Signed-off-by: sunliming <sunliming@kylinos.cn>
> ---
> v2: Fix error code

Which error code?

> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> index e65f1fc026fd..312ee6597ab1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> @@ -156,11 +156,13 @@ static void dpu_hw_sspp_setup_pe_config_v13(struct dpu_hw_sspp *ctx,
>  	u8 color;
>  	u32 lr_pe[4], tb_pe[4];
>  	const u32 bytemask = 0xff;
> -	u32 offset = ctx->cap->sblk->sspp_rec0_blk.base;
> +	u32 offset;
>  
>  	if (!ctx || !pe_ext)
>  		return;
>  
> +	offset = ctx->cap->sblk->sspp_rec0_blk.base;
> +
>  	c = &ctx->hw;
>  	/* program SW pixel extension override for all pipes*/
>  	for (color = 0; color < DPU_MAX_PLANES; color++) {
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

