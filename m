Return-Path: <linux-arm-msm+bounces-102802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGu8Nt6F2mkO3ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 19:33:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D493E10DE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 19:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 521BB301ECE4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 17:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1103921FA;
	Sat, 11 Apr 2026 17:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lYYlS5lf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MKEsT7c1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F813859C3
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775928787; cv=none; b=Plvb3hlzxpcsH9qOBuW3Y48ku7tK0gBjWm0dUNcvqxqf5DEgOehmYLuunP07YMNy3lB2OK1iUdMp+w6NasL2XW1SAvHk4qw1AhLw1szpEjPsByRKkju2eM+2fKHildiD489bgNoVNBsr3gl84T4F4DfME6ASMg2pu89XLI0UaWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775928787; c=relaxed/simple;
	bh=KERZvmec0o1+1X1W4CGPj0iLD3MtHWLj9Ef+DC0T+QA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s8zkg/dYqNizMBmuu9dTPHUHb1RF79qtPRywe8qfRi/AtG4nr7I89LfXualGvwBqYVF7+YOZXuhtzTC27ZZJ6a2rPG3hRmscHArce7k5MdJWm3ZMNLUm7KSjJZ5k9aqUHplXr3kjJ37BIktjJzoXlrgArFcMC/aX64UEr8Q4ooc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lYYlS5lf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MKEsT7c1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BGc3Ad972363
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7DahCnk19xtw/u9xAJUqbYe0
	2Y+jNxBzIhH9lPu8qaY=; b=lYYlS5lfXcSEYenbjqSgaAmOG4oF2HlgZPtPl51P
	tiw+FIqup3mcZa6kBwGTvFo/xV9StWbOIH160BJk3vO/cF73niWm4C/MT0K5y4au
	Arn3BKn2PMy973IvD6bvrPmmr1FHMsi9cZB4hR5BzwRMvB30T1GHk+ZD4GAbDQKW
	F/kQCyKA8JwPTss6H640eVLHkok59VCJUYr5N7DSCaGMUkZFSm9aXBZT++EireqB
	SOFJEEZsTlTldWauFsV0qcpahNdnui3SAdd8QXbhIKOx0SgEAKLi3+ivUsG3Dgz1
	66WI3FVSbGce1DyAztDxGuNFNvq/f7zTKtlkIWmwjgkkDw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffb0h30j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:33:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d9d52ad9aso10801021cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 10:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775928785; x=1776533585; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7DahCnk19xtw/u9xAJUqbYe02Y+jNxBzIhH9lPu8qaY=;
        b=MKEsT7c1R/BkrUzKIM85T0TGykizyl8T3SRCae82nad49WHhXJN6PSh3uy6CQR/rlc
         sGeF7040YEUxJMLOK5Kz5bEx9iRy0oWrBIyzy3sjaQ+Lnkcn3JxXbQlWFVVrgfuS+M8E
         owFbBorno8te9n7W1TkUm8tPBBag6m995VgkoPZMCn2FEFgy13U0JSZYu8imd7oBdyc1
         ndlc2PEnPJ33wT5lZFP8R/WxB9gKPFABmbVbnMep9aoOpifCmwGM8eZWVMig0Si1chIP
         aSsoeq/2O3HsvnCsF/Hu4Gtby/x2v/x9VGKqJxKPO5Kk3zZ3IzM2Ked+K332eleYTyNh
         5huQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775928785; x=1776533585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7DahCnk19xtw/u9xAJUqbYe02Y+jNxBzIhH9lPu8qaY=;
        b=CGUom7VfoX3PAkfTPqO9mJt+A+E0kqoOgRQNsy+M1gDKXOJsEm/dLk/yJratT7X8hk
         W5T28dempYSHAfFLX5H1O3JzrVnr8vkv29vx8gHnAc9dXNBLeQGy6vEM8iq0isCt3wCv
         XKYKcdLpFkOyT1TYPxrvD3Gi/iEOffIFvqEs/sUW3amxoxh9tE7t9LvHl5h3lWDCoTdM
         WjJL5grETgyPBhAPye+Xqxpt9BChFJT7ZZdiqB6NwzpmlTaLUu9Qu1YZklSSpzpFnNQD
         huOC+lGdEm3aPMUhUitqAt/eXLT8u78+qGmDd/tC7cmA64SE03SRB1Au6cCWGADuroab
         o6Ew==
X-Forwarded-Encrypted: i=1; AJvYcCVPd/ZOzQubFEqbBNKqtYsQekxHyVB+jsTH+UiHEmkcY0KUvBh0E75VOYpFOfVpWbbs2gvEuqKVAvOJy7i7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3sp5Xmt4Ywr2ujNWHeOM0zdi2bIOMoAG34NIJzyjDcCncDLdF
	2hJ4+Y6bMa70bXwF3jCzMPONEh9g3cR3t8X6S5I54FZsk3Xgm11S1etgcV/ujq+79v+Go3eUtMJ
	0AxGvh6r0bGFT9CsZJCNZR4dcOoK29VcT923NGVWZnniRaqk0PxQBqL3E6go+7PweFFPf
X-Gm-Gg: AeBDievBGh76hzdPrNq9mrWw7QVZsm1JTC0IEOn8/e26kAk3Lenr1Aw9DV2Imq/zJzh
	cJrYUnZjDbZQ6ycpQeE+pR3O4E6ryqZhspXvsapVQw2JTyRw35ER3rIMd6SWEMw/FumKDqe3JRb
	s+O0bpOlrL1kD3C3JsPfVodBlaGl1Kn93NtcT/1SBr+RYI0SdXeBaC8AlAa06cXn8LBoXaB3Bcc
	YZdEReW97Lo3BrrfnVEVeFXF12qROsRAGR9nlM9TplbJ+Cb7XjS1yAemlsr4hWs+igCaEU78WL1
	pSlAJ4yri85dpb6ICp9r22FqUMReUKGjo/5nW2D/qJ45Y5ssRSSj7o0kcWuT4QPiw2mBJ6ZlT25
	yx3SxqzvB8MhyXf7WHFFMIpMG3WJB3VdCPhJsYnRkD6NH7NTV5BUKugnq7vxqQGKy0yWPV7/CDn
	s241uMCFIu/OaEsT44omZwkJ769OXGUZ3gxr4=
X-Received: by 2002:a05:622a:241:b0:50d:857d:7ad5 with SMTP id d75a77b69052e-50dd5c4345emr120722871cf.59.1775928784562;
        Sat, 11 Apr 2026 10:33:04 -0700 (PDT)
X-Received: by 2002:a05:622a:241:b0:50d:857d:7ad5 with SMTP id d75a77b69052e-50dd5c4345emr120722201cf.59.1775928784064;
        Sat, 11 Apr 2026 10:33:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeee1253sm1536396e87.39.2026.04.11.10.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 10:33:02 -0700 (PDT)
Date: Sat, 11 Apr 2026 20:33:00 +0300
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
Subject: Re: [PATCH v4 03/39] drm/msm/dp: break up dp_display_enable into two
 parts
Message-ID: <xno7ng57gpsgakop3ftpzcytdcxgkg4ik5u6t4bvok5a3zdngk@qcsth4ves4nd>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-3-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-3-b20518dea8de@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YfmNIQRf c=1 sm=1 tr=0 ts=69da85d1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=TcIZSSvsLDlm5hOJxbQA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDE1NCBTYWx0ZWRfXz/neLBkCrCMC
 4WZ6TDNXlqosb1HpJqXNaAfokyP182WmmBCNi0z0z3nLa72wkDAVMKOp1h0yCyUymmaiRU7K77p
 C0PWbu2NYf75qB4dvXMrKFqpV7IssGuNHvVH3oixCAgRLErZIr8qUUTIthLw0KdTiMymbmB+VfG
 rYuHYKdHGRqCV0sSufbgEPMHvBnbPYuThBC5NsiiDImpQEKZJyWcV6p4a+CSunLDeoitHOeMX9I
 1AUPglmPRRq64OXA9/uNe61efMzPsduFcNCwMo3h8nec7aoFvWx+2Cj0fHmoTeGh/ScWHo2vDEq
 0Y5iEhcWxD+r+gMSxXJIwkjCU6gq+MXu7XD3/autlUiH6u4+mufSGf/pM9ds3q28LiX4X6fD2eA
 MwGtrzzSXtKCrluR0VGvi1tBs9paNxKjpCRFCuZcpmagGZhm+Xob+3fC+RVH8C9+UWgp70EALWD
 wwS9PWoBTe+yGefc3kw==
X-Proofpoint-ORIG-GUID: 2GlpVSPTAs1dYnPPC3FzR-TqowGeFjjl
X-Proofpoint-GUID: 2GlpVSPTAs1dYnPPC3FzR-TqowGeFjjl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110154
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102802-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,quicinc.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 44D493E10DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:33:38PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> dp_display_enable() currently re-trains the link if needed and then
> enables the pixel clock, programs the controller to start sending the
> pixel stream. Split these two parts into prepare/enable APIs, to support
> MST bridges_enable insert the MST payloads funcs between enable
> stream_clks and program register.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  54 ++++++++++++-------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |   3 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 105 +++++++++++++++++++++++-------------
>  3 files changed, 106 insertions(+), 56 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

