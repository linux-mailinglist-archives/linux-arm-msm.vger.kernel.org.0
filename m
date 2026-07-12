Return-Path: <linux-arm-msm+bounces-118553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MXRvArZ6U2ocbQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:29:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF8374481F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:29:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YrgdK+nk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=J2V1S3n8;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118553-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118553-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04956300A8CC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 11:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E3830E82D;
	Sun, 12 Jul 2026 11:29:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B2623183C
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:29:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783855794; cv=none; b=k08HlSF0TTxBd8Mjfk1hINxKW6TYDccRpNXHL0Vg4v3euBGcibPRJd0FQoyaYoaNHjawyFpKJEYupzNyJOKN8HoF1rq5j8Lk/w0YBuO2N7zwl8DdOKNUj0LF7ucOcaUP7RSwuA+V31sY9IRUj+6iKl28oYSapE+phZYOT3MV2ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783855794; c=relaxed/simple;
	bh=p2D85zpmafUe792tW1Hshd7CAMJrvOkO65pS0AxrT+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dhArzWBquWyd4KC3gTa/kVGGTKa4nCy6NggDfz2eJOCnVGvGIiwK0aoxgldjvkmGRBZSQrDC6Iq2QADn/9GZ1cHfD1PrKaTuXNdx97WyUYfXqxBBsFEivOpvDxCG4ZrlycQGjAqY7LJMj3Q2muwwAZ5qMja3RVpZSZC00dcmbhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YrgdK+nk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J2V1S3n8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CAd8Ge2372588
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NJqKheitt0CbJtV6HD5tfRQh
	VctqIRlGE8KiPOVCuY4=; b=YrgdK+nk+ilyfj9si/Aw10u2AiG+SHly7TF3/A5Y
	54ZSLK8fCB+rPt49q0lq5G6Sto1EqNE2DMruG3x6mbqZstWzxLv/+mSCRYiv/wqL
	Sawftbz4/KSw2DcFk4+n3lx3Hj8KLl5GG3R/0CwGhPSDTaXAI9wKYJRkOC0NNIpW
	mgQbyjGE+LsTlXhbzJILs9pEX4PIuYGab14gQcYhWdi+kwmVS9F6ynIQ5XdlA5Kt
	WOIFuVMBPSDq6AXQwh2NVruJ6ioD3j5NSndgaEC6uFnhkKlRi4VlujkDqWVFktyA
	eUtLs4ia/7DRgJVY/getj7Pc1CfEUjTe4Kfvsh580hdz4Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbebr2kd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:29:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0ab07320so25209261cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 04:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783855791; x=1784460591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NJqKheitt0CbJtV6HD5tfRQhVctqIRlGE8KiPOVCuY4=;
        b=J2V1S3n8CHkAZcDwyMzSU2c5KmtV6+gQ6QXjcMs5RzqrRfwyyE5vUjSWRExHaLX2TL
         bdrn3Mrfk1KlGsDqsZaMMs9P+n0vgPxxUQMohfEq75/vuznPSlzL9SWhazgi9Lmo9idB
         GqIkV89vlPgnXAM3ztLzQN0j6kE31zSHBQIi8YyXXa0x7IxxFtrlHFrJGlNLzeHjAJrD
         yRvPxVwmtdPPtAm6UmRO8Hb2EFcjILWcwC/zCQsax+aOEUeTCe0E1oFqO7qGm+IqGbzf
         Df7OPAYJAAJ3imhyVyv8eaPC0O0hTAUtRo/N0TDat3j0GnQC6sO19yrGByYlrTr6hOEt
         GAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783855791; x=1784460591;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NJqKheitt0CbJtV6HD5tfRQhVctqIRlGE8KiPOVCuY4=;
        b=sR43aBdb0Db8bTLTNyeO2J3lAYgUzok7lO6QaOxA2yzRZR+MQFh03xe6BRZ7wwCDjb
         xDYqf6eeXLERIL1TPd+ySnvYLb/AGIA3OEiwsdiw4K3lU66intBNe/ob9s7ZWVP0RKs5
         OlWs6soAOQhzsUhW2m+aE+oO+c/zW7Y1sgCIs1j2Xd8d45AM6ZJ1kkyF/rby0MBimibw
         zipZExXsP2EiScRJzBeqAGVM6jFC+fwZ2mlxFeRE+CHSitHsXZcQSUtCcy+EiwLkJ9Er
         eQVy04ceQDrxMWqoaBhgINiu5BGdH+FKewDBYdGlWCk4vInnVWnj0d6ICWPrRMSPOX+h
         KZpg==
X-Forwarded-Encrypted: i=1; AHgh+RqEqnYBtnWwJi5fSrcFTDYTCMLdOVhEGJwCG3s4bgbXNXFleORFdad5e0/w/zSWW0ZKJt67oCJzY3Hv45Wb@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw4WyyUi2nERgG3XO6sQBXFnPq6ruL88WeMEPUrLWwpVBPslYP
	pHiZofxOW5BTKRVrSikPxoiMliLCcs35H/4r25gc/6FWWIScTzqyehmszmm3motnWVwipe1ctcr
	kzNkdrJ4nVrnlmm1vgA1tag2GP1V1JF9+R97IPD0Ge6gypVcQI/udqTrMYAfBlbInAyb4
X-Gm-Gg: AfdE7cnHDmTnzHbjd0PIxKmkIC4r7qg9cdtORk9WIub5jgdWcugV4IvLEVo1DHvx1hD
	UB9objHvZh6q+c8ou4gRS8W6pG+zHRicjX9pHXTtim3+QF7t9GRkN2wCGBS3UZfsHoHi4JXD2tk
	tBk9/amLjf/392NsZidwAOMrAo7aIrZ2VgdZIT0OxXlck0tYEAegygfr4xgPM0MCI9gscan1puI
	I8qDVu+xe7C+Nrv3l81QJaCBIBD53lTn2brzXjMz3zu9PC43kSxgTVfuwYIDUk/Mhpk2jvWW7EH
	+DiaTtHoQWdTgxpFGH9VxV5wTqsdV8E8cwkspfvmfQtJno5Q0aWk7Nl8JZDKit8xj8ckNdVYm2O
	tMvkKLPqZXaxGCqK7/zS1yquuUgnJ8OxX0a+WsBY3/aV+BilxGYCewIL2v8JMLPyaWDUFQA9Zg3
	V69WQ18LsUIQUzPuGTlQVgt3Ne
X-Received: by 2002:a05:622a:1e18:b0:51c:2075:afd5 with SMTP id d75a77b69052e-51cbf3953eamr52652971cf.72.1783855791111;
        Sun, 12 Jul 2026 04:29:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1e18:b0:51c:2075:afd5 with SMTP id d75a77b69052e-51cbf3953eamr52652671cf.72.1783855790642;
        Sun, 12 Jul 2026 04:29:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa66c0sm2061980e87.63.2026.07.12.04.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 04:29:48 -0700 (PDT)
Date: Sun, 12 Jul 2026 14:29:46 +0300
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
Subject: Re: [PATCH RESEND v5 04/25] drm/msm/dp: use stream_id to change
 offsets in dp_catalog
Message-ID: <bwfue53sy36k2alsozqyaqcibgx4kd5pvocpudx6lwdtn6bqka@nmd3lse72s4c>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
 <20260629-msm-dp-mst-v5-4-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-mst-v5-4-2ed6aee1867a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDExOSBTYWx0ZWRfXwqOimwwx//4x
 +WdpL62R0Yb32YpyGxAVss+EY9u6H6uXkFJQuSAvMh3UHPHMGJiWw8L1CO23tmh7qt7Pw8DkWW/
 P/0bRrgu+txFrUxB3RGvryT3CBeNXTw=
X-Authority-Analysis: v=2.4 cv=OK8XGyaB c=1 sm=1 tr=0 ts=6a537ab0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=DasGs9TxgNvWK3_s-EwA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tVrtu-LZROwukZm1fnEcHE1WBFXH-gYi
X-Proofpoint-ORIG-GUID: tVrtu-LZROwukZm1fnEcHE1WBFXH-gYi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDExOSBTYWx0ZWRfX5Z17kCjDy7xd
 EAhirssYTRgrmtPKrdCysCEjYBBvxrLi72DYeOS7lKgZkLjI1yG86ck+y82g1Qnf30eEL7scoAC
 MYtTfAGHW5CM11RF5pixESjgrxHLrrSVC+9M+1HCAu77BfWAMN/4oSTwKORsUxB3igTy9k4LA8H
 DdcyhkMgtBEv6zxdg/ZZQuHV/9pin4ahbXBFgTTLHwKknxhN2ci2FC4ZsiypYsS4bQcUg1dEOGO
 lWHRgMpwqo6QlR1FUr+nqPpMuCJbJQozJ0BZES2uvC0XKHcjP2BZ0JwrA2Vy01ydHyO3Cu3ss/c
 lp8gpygogUeamQDddgvcha9GAJqR6G1NlITjmd+kDT29xcXnDr0UgijbWUBBXEatY3CkX1Nzpaa
 xC7ENLQwTDku5BV9cqn+6t6+V4PTxmHBzM/09GE4AOcAdLR15YALFqhPTD5db2wsTeGQABWm3aX
 D6QzgQtuP+dccuNbpDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120119
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118553-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4EF8374481F

On Mon, Jun 29, 2026 at 10:14:25PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> In the DP MST architecture, stream 1 shares the same link clock as
> stream 0 but uses different register offsets within the same link
> register space. Use the dp_panel's stream_id to select the correct
> register offsets for stream 1 in dp_catalog. Also add stream 1
> register defines.
> 
> Streams 2 and 3 are not covered here, as they use separate link clocks
> and require separate handling.

I think, this is no longer true. I see them being handled here.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 78 ++++++++++++++++++++++++------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  4 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 24 +++++++++-
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 94 ++++++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  4 ++
>  drivers/gpu/drm/msm/dp/dp_reg.h     | 44 +++++++++++++++++
>  6 files changed, 229 insertions(+), 19 deletions(-)
> 
> @@ -397,7 +442,8 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
>  	/*
>  	 * RMW: Called from atomic_enable(). Serialized by the DRM atomic framework.
>  	 */
> -	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
> +	if (msm_dp_panel->stream_id == DP_STREAM_0)
> +		config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);

Why is it being done only for stream 0?

>  
>  	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
>  		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
> @@ -412,7 +458,7 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
>  
>  	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
>  
> -	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
> +	msm_dp_write_stream_link(ctrl, msm_dp_panel->stream_id, REG_DP_CONFIGURATION_CTRL, config);
>  }
>  
>  static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl,
> @@ -2514,7 +2560,7 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>  		nvid = temp;
>  	}
>  
> -	if (is_ycbcr_420)
> +	if (panel->msm_dp_mode.out_fmt_is_yuv_420)

Unrelated change.

>  		mvid /= 2;
>  
>  	if (link_rate_hbr2 == rate)
> @@ -2524,8 +2570,8 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>  		nvid *= 3;
>  
>  	drm_dbg_dp(ctrl->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
> -	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_MVID, mvid);
> -	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID, nvid);
> +	msm_dp_write_stream_link(ctrl, panel->stream_id, REG_DP_SOFTWARE_MVID, mvid);
> +	msm_dp_write_stream_link(ctrl, panel->stream_id, REG_DP_SOFTWARE_NVID, nvid);
>  }
>  
>  int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
> @@ -2597,14 +2643,14 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  
>  	msm_dp_ctrl_lane_mapping(ctrl);
>  	msm_dp_setup_peripheral_flush(ctrl);
> -	msm_dp_ctrl_config_ctrl_link(ctrl, panel);
> +	if (panel->stream_id == DP_STREAM_0)
> +		msm_dp_ctrl_config_ctrl_link(ctrl, panel);

Why is it only done for stream 0? Split all unrelated changes.

>  
>  	msm_dp_ctrl_configure_source_params(ctrl, panel);
>  
>  	msm_dp_ctrl_config_msa(ctrl,
> -		ctrl->link->link_params.rate,
> -		pixel_rate_orig,
> -		panel->msm_dp_mode.out_fmt_is_yuv_420);
> +		panel, ctrl->link->link_params.rate,
> +		pixel_rate_orig);
>  
>  	msm_dp_panel_clear_dsc_dto(panel);
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 3689642b7fc0..310e5a1cc934 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -332,6 +332,50 @@
>  #define DP_TPG_VIDEO_CONFIG_BPP_8BIT		(0x00000001)
>  #define DP_TPG_VIDEO_CONFIG_RGB			(0x00000004)
>  
> +#define REG_DP1_CONFIGURATION_CTRL		(0x00000400)
> +#define REG_DP1_SOFTWARE_MVID			(0x00000414)
> +#define REG_DP1_SOFTWARE_NVID			(0x00000418)
> +#define REG_DP1_TOTAL_HOR_VER			(0x0000041C)

lowercase hex. Also are there no registers from the same register space?

> +#define REG_DP1_START_HOR_VER_FROM_SYNC		(0x00000420)
> +#define REG_DP1_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000424)
> +#define REG_DP1_ACTIVE_HOR_VER			(0x00000428)
> +#define REG_DP1_MISC1_MISC0			(0x0000042C)
> +#define MMSS_DP1_GENERIC0_0			(0x00000490)
> +#define MMSS_DP1_GENERIC0_1			(0x00000494)
> +#define MMSS_DP1_GENERIC0_2			(0x00000498)
> +#define MMSS_DP1_GENERIC0_3			(0x0000049C)
> +#define MMSS_DP1_GENERIC0_4			(0x000004A0)
> +#define MMSS_DP1_GENERIC0_5			(0x000004A4)
> +#define MMSS_DP1_GENERIC0_6			(0x000004A8)
> +#define MMSS_DP1_GENERIC0_7			(0x000004AC)
> +#define MMSS_DP1_GENERIC0_8			(0x000004B0)
> +#define MMSS_DP1_GENERIC0_9			(0x000004B4)
> +#define MMSS_DP1_SDP_CFG			(0x000004E0)
> +#define MMSS_DP1_SDP_CFG2			(0x000004E4)
> +#define MMSS_DP1_SDP_CFG3			(0x000004E8)
> +
> +#define REG_DP_MSTLINK_CONFIGURATION_CTRL	(0x00000034)
> +#define REG_MSTLINK_SOFTWARE_MVID		(0x00000040)
> +#define REG_MSTLINK_SOFTWARE_NVID		(0x00000044)

Why are they not REG_DP_MSTLINK?

> +#define REG_DP_MSTLINK_TOTAL_HOR_VER		(0x00000048)
> +#define REG_DP_MSTLINK_START_HOR_VER_FROM_SYNC	(0x0000004C)
> +#define REG_DP_MSTLINK_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000050)
> +#define REG_DP_MSTLINK_ACTIVE_HOR_VER		(0x00000054)
> +#define REG_DP_MSTLINK_MISC1_MISC0		(0x00000058)
> +#define MMSS_DP_MSTLINK_GENERIC0_0		(0x000000BC)
> +#define MMSS_DP_MSTLINK_GENERIC0_1		(0x000000C0)
> +#define MMSS_DP_MSTLINK_GENERIC0_2		(0x000000C4)
> +#define MMSS_DP_MSTLINK_GENERIC0_3		(0x000000C8)
> +#define MMSS_DP_MSTLINK_GENERIC0_4		(0x000000CC)
> +#define MMSS_DP_MSTLINK_GENERIC0_5		(0x000000D0)
> +#define MMSS_DP_MSTLINK_GENERIC0_6		(0x000000D4)
> +#define MMSS_DP_MSTLINK_GENERIC0_7		(0x000000D8)
> +#define MMSS_DP_MSTLINK_GENERIC0_8		(0x000000DC)
> +#define MMSS_DP_MSTLINK_GENERIC0_9		(0x000000E0)
> +#define MMSS_DP_MSTLINK_SDP_CFG			(0x0000010c)
> +#define MMSS_DP_MSTLINK_SDP_CFG2		(0x0000011c)
> +#define MMSS_DP_MSTLINK_SDP_CFG3		(0x00000114)
> +
>  #define MMSS_DP_ASYNC_FIFO_CONFIG		(0x00000088)
>  
>  #define REG_DP_PHY_AUX_INTERRUPT_CLEAR          (0x0000004C)
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

