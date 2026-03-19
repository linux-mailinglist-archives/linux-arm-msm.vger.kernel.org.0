Return-Path: <linux-arm-msm+bounces-98810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCEmOK5FvGkJwQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 19:51:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9714A2D15AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 19:51:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6018C3028E9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 18:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8732C324D;
	Thu, 19 Mar 2026 18:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U1wjO0Xq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LVuUh5Q2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90D0336EF1
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 18:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773946243; cv=none; b=dsegNMTOEuqvyxyNerukqBSRl6Xh2FU1jlkclmzJvJdR+G3AfHCmnCuTAEU7fBsudsTEd+41zLuVQ0ydwoTbaWY4XNiuXHbykuh+7I4rxBAnDErhtCVbsCzRzmyDuLsxB4O/69ag5AeXwdfwqEQDnqKxB/0BAqrzdfeE8Ov6fho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773946243; c=relaxed/simple;
	bh=T4R/PLQQiivICuyfjyy/BsZdms8J2ghwAqjKy0JzB8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHPAAB3ZE6vD8KFVfDHTS79yx8hGqKS6jrkxpIbQrE6u+DnWPRyaKhMvsWDE4pZzw/gHNuHJLWcz8zPn8AVxTFzEmM9Gjdg1TpLQFGXorfBH29q7V2fUTAtNHNk4lV9zXyWJhsBhdpAv/YWpwUc9DzEY7der4cY+CMiTKXVC080=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U1wjO0Xq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LVuUh5Q2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JEJNsw4156081
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 18:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AEKbVxq0+305him7b5F35pLy
	V0Tx3nZX024zP7gNeRc=; b=U1wjO0XqmefWjli51IOwKGrJNCZnutIHN9VAmyyo
	f4xjAzusFjDmap4aPMe+qrCDvqiVRtNCDcJqn395O4OeKZcWdlXJOL5pvUe6BpBu
	RT221xIlfXeJx9XM4ZlufdvGAynl4wlozp/fYIayDWrrOijeqOdYbBQHmwaJRww3
	3gpqSrUtcn8pk+L0tBCoHTl9fZhQxYY3ugkGsrqTsvvytpGIPYaBd5GbGn3UgvkI
	/J0fXc1ErtgB/TJ0vW6JzkOs+P65ToRzZnnse0Njn0M1GLaEjkedsjYCs+AXSBub
	HyyUHtJapi3azFBIHilmCFdHeLSn4ggJqd/C/lyqMeehQA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0jt910dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 18:50:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509114d7418so15453351cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 11:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773946241; x=1774551041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AEKbVxq0+305him7b5F35pLyV0Tx3nZX024zP7gNeRc=;
        b=LVuUh5Q2LIEkyaPO/155zc1T99kJaYICmcrDL0R0INbKgxEx1fSSUqj/HLHSSA8I5D
         Z/37i4QBixZ7EHlXkvmiBy0CFfuCbivFIFGQdfMgs7O50r55VkCYfF8UScVy/zAtffcH
         hDr4X36OHduZZJxqkvppjDCvJxU3ISW8RKdzZUKnzzPJ8p7dF6ipN03/Cvx0+h1+oPNA
         rVmOLFAAFPSljPQO/V2kED9vEGUhHsKljXqVPd/qD/vvLHycGp9Qe72t3EpPbXHeRLWM
         zzmQkxRG515YthcLrprdXnBSlj3axz9w61IHd40qaO8xthXYQE3qtrPLT24oPMzOIKNw
         A/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773946241; x=1774551041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AEKbVxq0+305him7b5F35pLyV0Tx3nZX024zP7gNeRc=;
        b=mZjpvdIiNPW7oMn8fiGZMU61CSHXxI/Sg8oD6t301KrkX1VK0fxetYZV/6o1kSWjeX
         J5S5+rZbVcPoYE2vVsJJ1Zc5Q6AeLGZ4GKeV2XSfOyIw9OrxZn1SAb+WY4F0ga3OguNg
         2585dFLk8T0chM3S3GY37LR+lfOIM+0ZP9ZQo0qxPoQWH1v4ObWRMG1OIgVqyOyn5xgD
         B9SnCZR47SYZBij2mup2uDcrXwwr2MSd1fmchDy43LC4AQa0qGR+ZUPuIfkaNuoWqjI2
         /a2y1Qoa5xPogi5kaUwuHlQa9TXNUjOAOoQBXEkh+rFJfaLGPwHKA0QRlOfjpFjKpLrV
         x6uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTlKJj97kbiIKe5WcAOx4zXvA15+JIbZ9xIclmwg8sjzeMdX3Tpz9NZax2cBkpIaqAerEsrWFkTlMyTdA4@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc4B7rJjx5Qn2C008DUINSRdwfJblSEQTGZsede3PHl1QLU5F8
	j+wfyUg74o1TfSaZdu8faQcklOoCoi6MkcfHPPZNBtIA6xj3yY2DqcV639i9xmjFvkc6aRYnzde
	YaANrCc7JdpNTgisiTZK2C2hcsz++DUTnkJ7OKacZep7M7eFnyJ7zFYs85JNhIX/Go0Ab
X-Gm-Gg: ATEYQzy0oadfVMGQ82mpAXwnkH3bEvPPxrZJTVRjznz6WXIVO3qRHww567CimQlsMqe
	bxN66c168MwLocgnMIGx/1lI0Vw4EZtBbNiWA2SWzNZcG9ipLZRvXw0fdNnKht1ghsZe7QgBja6
	V93elVg5JBw3UTHuad/L1tlsYa0i7sOTXpmLXr4hSjFnN3Fy4w1wUI/4RDdvhE7Lqf3lS6ub2Ap
	NiBkooItKuKrWFoiWb7Plm48NMENbBUXIi4Y2BKzpgljRJQPy5QT7Rzr43P5ijNnc5dr2tRllOo
	uQM6CpSod4nm6Vp4rSC03VrM+raqEUQlnBPzcZ/qPdomh8TRVffZNJR5odpSLkhjLs0LS8ofyYh
	w/83p5wpCUAnVAfA4NIImvXid/GZBMe2vM0q40nikzI+4aKvBmtwoBMQJcRcXjAyow1K9wcaoad
	apYhUd0iPNqomhQJWdrFwLaPYegH0PvDWBKbY=
X-Received: by 2002:a05:622a:424b:b0:509:1e69:9843 with SMTP id d75a77b69052e-50b37460c7cmr4402101cf.31.1773946240688;
        Thu, 19 Mar 2026 11:50:40 -0700 (PDT)
X-Received: by 2002:a05:622a:424b:b0:509:1e69:9843 with SMTP id d75a77b69052e-50b37460c7cmr4401631cf.31.1773946240049;
        Thu, 19 Mar 2026 11:50:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207449sm68555e87.44.2026.03.19.11.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:50:37 -0700 (PDT)
Date: Thu, 19 Mar 2026 20:50:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 2/4] drm/msm/dsi: add DSI version >= comparison helper
Message-ID: <xq4kzhi3eatjnrpcb3oy46lt76hlv4zxo4bopt4emzctlmm4dp@ke2onr24eha3>
References: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me>
 <20260319-dsi-rgb101010-support-v3-2-85b99df2d090@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-dsi-rgb101010-support-v3-2-85b99df2d090@pm.me>
X-Proofpoint-GUID: n7NSK3jsVZuEkMjKCZCw6Fy8Q3uqpsfb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDE1MSBTYWx0ZWRfX3+XMGzy2Honm
 uq68ammF0u3T2TyGSuFLgXEAKVeDJpKjvk+gdZhe5SLsgG5IW8rtTiMPb0OjLdlf7catsraaiHa
 UBCxKgATrZmKJdWmHJ7DPT8LiUpi2UnLVJpzdI6+5fQWCiIQZplR7z70vdBrAiNjSqVWOWVT1Uw
 TG0qG6M46pxL7eKl06nui7IXvzc+FDEb4VCHQS3/IBH75KfoJK43NtWIihEz8iRUPpoEroZRxv7
 tSdMK5j1yxCA1ougyx2VnBCHzrJP5w+p2WQq+Ox5GfewNL4x55ho6vBc7payx5FjQmxe3SyocgL
 gapL0vEAs+erklHqRF2eTsrTLbwphdmYKyX0pdeTDc5+36mL/qcMUeWZyVodBVYP4As1gZdFStX
 aDTo6bEd9trT2juG9nG9H+tI1HY3ABj5hxIM85lUCTZiqQH74TTj7ZvmWfrLkD6n2I4Ze0Qq3wB
 zgeqtV6Ixul15puki0w==
X-Proofpoint-ORIG-GUID: n7NSK3jsVZuEkMjKCZCw6Fy8Q3uqpsfb
X-Authority-Analysis: v=2.4 cv=FKMWBuos c=1 sm=1 tr=0 ts=69bc4582 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=5JqAs6KO3f-WYDA_-g0A:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_03,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190151
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98810-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.978];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9714A2D15AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 11:57:52AM +0000, Alexander Koskovich wrote:
> Add a helper for checking if the DSI hardware version is greater
> than or equal to a given version, for use in a future change.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

