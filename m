Return-Path: <linux-arm-msm+bounces-102807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDFJBi2I2mkO3ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 19:43:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3593E11BF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 19:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A64C301CD98
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 17:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2640B3B9D84;
	Sat, 11 Apr 2026 17:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EgHeNyWO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZB1CtFER"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B7723BD1B
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775929382; cv=none; b=Kra5kySVoewFWgX/cOn96Cz1bGpGW6eBmcT0djjXfHfI+8XPp3vdqfvE65SKN2d4yqx046gCi8szyznbxBsjTLkNOSnz5Td+uBDEfoMbrvrlgzvA01kZsbfXIAB5gZBEUHCESNSe2wo61OiNwJ3HG3N3MzmTF1FN6PKHuO8PvGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775929382; c=relaxed/simple;
	bh=C6k0oNsJWXQy6SItVXDu/pH7INS93UDR/67fBBUctXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F+m9m7iAk9yv+8IY06uZd1EOo6jT1fRJ+GfcSXnClU+7UM5H5knLe7lMGbldgbGcspQmDX5FoT6giOpmgIPs93QoqaGCAkO6UE0KYom4xy1M9m/1wVFU3u/r7mXtOC6vwYAsWFlIZ5OLU0vHdLdZsvMlWIGLWmuiEmhNSGVxRSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EgHeNyWO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZB1CtFER; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B4dtfP3873783
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WwzWxiUt4/2M239gINQNxhn2
	wjnC3PgXMcvjNc/k60A=; b=EgHeNyWOGS5+3ScPqYQCa1WXPqANGIgA8FubBivE
	hT7fcl2chqdy028vbBEY59yzmZcBDsCTgbx1/ZzXS/S70dOaPWafwIQsSI572cAZ
	X5sEHmxSFkxQtuFCrzm+mjt0nhu37vFyLGN9hyzGM1LwALTxIcLXNuBscuXgaCg0
	minHU1csMwK6cY4OxC/yYHiuw4J1CJ5sJZ7WBqywP2TgP2+brD/zwdkvUFovHQZp
	MJ2Mh4VV9SLLxIBzGh02ZCwSE/n7pYb0lGkvib66O3UX/sM+eeXfb60gv8M1Gt/X
	Fxsf3wrG73FoaRhm6Kd1t+My4sCCcAxD8i2wwGHbY93TbA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfffhs3g0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:42:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so61986431cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 10:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775929378; x=1776534178; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WwzWxiUt4/2M239gINQNxhn2wjnC3PgXMcvjNc/k60A=;
        b=ZB1CtFERIPFw6GSQFDkVdF22H2LTQT24+3ER6uBpGU7DrLRhSZgSxA0YSbCR51DJds
         JYLCaFBwuazpLyNs+JNZ5gRO67zE9qSKGgtjgPZs83LWjzMHPmzB5bIyvAA2R9e1rgWu
         uKB5lg79jVATLNsme8mAVSwdD4zqjfaM2qKBqt2cEy8OjCudH2SRnWi00bhYVNj45aNT
         rgMDBCy92pOpKYHIqiKe6grcMxOz1hOAdPHp5MYXqxIB8POQsImdL5nkwZblPkKKI34B
         8mcnH/zIUv05fSmAZQ1ueusXq/bFodu9PYNHptpW37iN2gu2wTSQlXZXrMZmCQwyoYbW
         LBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775929378; x=1776534178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WwzWxiUt4/2M239gINQNxhn2wjnC3PgXMcvjNc/k60A=;
        b=Vyov74o+vwBvuCnMQy2bg6ihw3ZxuTBWgeW49qQoIMs7IGQFwaM1yc3EP1dz6xAjdx
         smvnfe0GX61JUsXMcMmDFWoBST1F/EI3vo0wuab9ai2SQ5ZUS6IAoAO93myMhjeywVTf
         M8RXQQZSKNRxOTMMIFXKk8Otu6MxFX20KBC8qIfO3pfwr6QzK/W9Qksa5NYQ8qkD5Np5
         /+0/XEKAKJcC0/PJbOKQJRT0B8jE/81WD95hFYdtLO2fFj4xTrad86bWFZIxfdTkDLOb
         OfzHfBZn/BWvb5ToSwx/3LQR3hYtUjG6DbzhVrKcP0k47OFbrLbfbe6UDasuNE2rSNhX
         Ap4A==
X-Forwarded-Encrypted: i=1; AJvYcCURcMx5YFURN4N1DDBD20d62EPbHt5br6gFv7gAm3cjV21zyJHPrcaKdklrGveW5LFM1l1uMhaO+JoR+IQ0@vger.kernel.org
X-Gm-Message-State: AOJu0YwKSuaXSWJ89Bz9CDwfu+ZNEiGGMlFaLixCFGggiFB6OdoUapw/
	lqbUFIyL4aKKZ1bMb1q1gooevJ6feaABi58gl7dnpfjcQOsZzs+M+5B9dQEsQaDzRqEug7gBi2V
	V++yR8GukSG0SzCBl8Tclck6LMt9NwaWgnA6EaOMb2uwNUJxzkjE7JfIEOpmrAJ1UdyGG
X-Gm-Gg: AeBDieuWv1iQc691zVbjvvwXwzsoaFL0kiawjcscN+JR6v1bV5y4aCQCUZDd0QB6soT
	J/TwzDnaPzzBLgW3+u8vJkKDTt7cfIaU1onB9X6Vv4MA+sTdtxrX+18ZkT0x/aeKnJuVrv1Z6gP
	NiIOfbESfQE/kxhAO0rTmh6jKxtYzGLDu3iA3Lu8L+KHGWI/t2yRLiwzuvzHbDbjIkzRO+Se8Lo
	xmOtAdfU462TmsmiE63szZYH66//cmTyLYt9PmXKzz+ax3Yd28i4UEDbzaTprRx05XY7drXbp8k
	zB7mxnhza2bg5g6q2zIJJrDSmXVqO7L5mvzGC+igeJ0S63P/w0bPZNgJiT2kDC4us/BkU8HQITE
	jWhLDZGZTWqpNO9sWXnnM8HgY4RNNxknGysjfyby27bpHEDemeszRpwZDWJQOgJseQC7x0o12WT
	zx/cE4TGTz/QW7hvzAaDdmjlKNwJun/DNkNRI=
X-Received: by 2002:a05:622a:5e88:b0:50d:8074:f3e4 with SMTP id d75a77b69052e-50dd5baa698mr108826621cf.27.1775929378483;
        Sat, 11 Apr 2026 10:42:58 -0700 (PDT)
X-Received: by 2002:a05:622a:5e88:b0:50d:8074:f3e4 with SMTP id d75a77b69052e-50dd5baa698mr108826201cf.27.1775929378027;
        Sat, 11 Apr 2026 10:42:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeef6dafsm1550953e87.58.2026.04.11.10.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 10:42:57 -0700 (PDT)
Date: Sat, 11 Apr 2026 20:42:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v4 12/39] drm/msm/dp: separate dp_display_prepare() into
 its own API
Message-ID: <zm4kinj4ycohlvd6tib5osut47xwxq6n7g7upig6d6m37jbesu@t77oetfzma34>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-12-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-12-b20518dea8de@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDE1NSBTYWx0ZWRfXxRLJ6DzhXpVC
 FKGIpxKpFyRWj/pYzLN4QhJHXXW5ZAR0UIbBMuAZ46/wu8QdGnwyrSet1M64xG8iE7c5H2WaoHT
 iELlHpB/W9XFKETIYR/fpbkSj6YileEn47Jm/e8cHEuslF+6WI/R66+wtKnkbQ5Fb+1Bp6z8o3s
 zkwjJd8UlXO0nFsbyZTyy2hvxccohch//ocNqN6rLu97HHEd/bWBe65x3FuoHW81tcJxB7/lMUN
 zwYk9nsmtXxwvQR6AUENwbPx9ohv/to3T8JjqHn+rP9Vqx5fh09pO4H/f2NuxaN+rY2TgdypPGg
 9Ov2eldoGHU33sIFOTfNogyYy64FRSfkAPnaVgd9YB0DEJ4L3EBOrKRVzs1Rf7p8+NNBHzFT+kn
 6xcTsYZfJsBWQb/RWYOy9wiOVRzynJDBBA9d1xhvBIwTkPOR00s2dyfmU3CnkosBCYGWTm2g/rF
 7gJXEP+mMP8pb9CBoZw==
X-Proofpoint-ORIG-GUID: vDcdw8Mg2ebhk4Wkql7nd4V7ysI3gKPa
X-Authority-Analysis: v=2.4 cv=FOkrAeos c=1 sm=1 tr=0 ts=69da8823 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=lDQkouuo_yPg0JcN4GoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: vDcdw8Mg2ebhk4Wkql7nd4V7ysI3gKPa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110155
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102807-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
X-Rspamd-Queue-Id: CC3593E11BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:33:47PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> For MST, the link setup should only be done once when multiple sinks are
> enabled, while stream setup may run multiple times for each sink. Split
> the link-related preparation out of msm_dp_display_atomic_enable() so it
> can be called separately before the per-stream enable path.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 16 +++++++++++-----
>  drivers/gpu/drm/msm/dp/dp_display.h |  5 +++--
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  6 ++++--
>  3 files changed, 18 insertions(+), 9 deletions(-)
> 

In the hope that the atomic_prepare() function ends up being used as the
.atomic_prepare callback...

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

