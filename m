Return-Path: <linux-arm-msm+bounces-108001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Gt+BC9WCGowkAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 13:34:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A705D55B760
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 13:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0014630078B7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 11:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8076C3CBE88;
	Sat, 16 May 2026 11:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YsYbrPfn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WExY0isn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CC638F629
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 11:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778931243; cv=none; b=gpQZu5bhfiOpahSMPzrwxCUXv190O2rpZVYXnMRlvSg2qZoh6JEnJNL8Yqq1Au1jC2AFm0AkQbt8dR5mAKklupqfmRe8jIbYIrxuRIjmE32grJSv6CvCcuk0XvnBHMzGelZe1sAgGk0vZ906C9tWS6HurCI4HBTnXBdIlZuKlNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778931243; c=relaxed/simple;
	bh=/1084GdrjxMNjpdESns+CgLgxwX+AJAAmN/1saYu63c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iJEqHbw9BcF7Fyz8S/9NsIhTB4QF8nzBjunGWxZDhTlJUSHS/cYQHoqxkYX2xssTxbdlbsSjAJ3r31SRNtsldjvUT9yDkrcz+IOBZqPaRc9MFqQqw9fHHUcSGLvcpcCfTdqfgu9jauRygOR6UTRbOlCedUF92+nbf9ohOwI0zKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YsYbrPfn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WExY0isn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G8uAJC190082
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 11:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EGAbnTi4v8/K8BXWQ8fTbV4x
	t9A1k5FW2Sg09trRd5c=; b=YsYbrPfn1bZCXumJC9ISc2eSa0f38KNA4pyqjLE8
	Xwb3JLCQl7mqGcMCshOofXZsQAQfc5fg/swBJlkt32JBzllgmi87kfjKjVTdmaVF
	g0eVJ4RzJhL3N5WOZbOVGN/gJ8J8gKBOf3eLhi9pSmPLqB1uL2dRuY2+Xdl5k4xP
	HzVsIE1QoahKBNMMRRXV26LwY/ZMovTj2Sl9El77VN5nIR4JLtd46bBaeQ746i0K
	frI5/HIXEGyqIevDXyJeGoJ+dSmbroCMVnv5r6Oc1ZVj5yUQr+99sz0LFCfidbw/
	wp8Qd3PyeqJ5bddDe5Lc0iYVuQ9466Gq2zC1Hyc7jsJ2Aw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gx6rqt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 11:34:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50faf575af4so25228501cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 04:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778931240; x=1779536040; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EGAbnTi4v8/K8BXWQ8fTbV4xt9A1k5FW2Sg09trRd5c=;
        b=WExY0isnGIKNowe9EJkUrT/UXuvvI5OIBj9y3Qf6IMPCQtTAyHx4YMzur8NWf8JHO6
         PjhMBsnaciMSaWSOScgM02LjChYGpHL2cE1W0nouKxTAuywISausrinPedTPMSi46JCd
         oZ6XnTcu+4aKTNc0jRFNVpgF421hSkOD1B0Es4NSp9HIL08pbVeHGhZ77z/WYiUWTYdO
         E5hpXxYChDGrDLDgBtI0bx/XQ+nU4VsqEzGsSLlXKTH/yQt7tc79Cal15w4m3urydxO3
         EPa//hURusypYmZWFPBuurzHeJhyGfdpqq+S68Ey7J0jXW5iJzro6Z/h0tlL9cGQmg+y
         n3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778931240; x=1779536040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGAbnTi4v8/K8BXWQ8fTbV4xt9A1k5FW2Sg09trRd5c=;
        b=JoxJx6Ev/WAmSmef7Oopdjjs5JYvF2FBiiODxf+2MwkEEE7QsNbUneMONde821o33x
         df8KBCqzL9WC5GOcr9rWj0CedCErLDGl/E/hZAksZJeAW1KantFdhC2iBckbqaqoYXnC
         YcF88ie046xm74v0jNamDRfFA5/3nkgKfJj4p5o91/TUhahKTl6cuPJ0nwWsYHcg3qaa
         7Ri9dxzO9ZoY9htyykGPv5nomVbaAyMXo0x+JhqgKkDeAHVYd3OgGCbWdxTarWne4GX6
         Dj2o8WCnCnAhFrG8cBouH8eNd5KtsuqyGgBeS+4qNlXTS4Ga21Iv5776Y0C0G+tx29wo
         GAQw==
X-Gm-Message-State: AOJu0Yy9Hs6ZMIEmxFCg2sm7339z4XkcxyrJcPyyaZhQ1jFo4x/sX6qN
	POhdVGqK9qzhr+2+xJVD995uBvvHKUOo++WSiNAuIJTNakcq++xBESDC8r5vbWuIr9BY0eHA4Ss
	unik6at3jY+6ZxDC50/IUnRFQVEtk0tInad6+vazD8ulsQPzEbDmUoEH7c9e5boKDDjxM
X-Gm-Gg: Acq92OEEkkh4jDwJ61OdNm1Z4CTz0wFbACBtKhPokeFMlkRAMVClEsxgbaFJiWeBs3m
	fYJF7Zj6XiU30hb3ZA4saB81JXq/2EX37hjL3lLpv9ZEVmyK02s4LlHhznXkDjmmng7Y8l0wpLY
	mI89AxNPCj4iJCEHhKxaAhyjFSAB5kQDOKjne7CxsaoQnqvZ+61Sb3hR22sgKaYR1rgrEksqaSY
	aWFHWvr1ZJmthsZ+JtCM+Xc1GFF1H4mVCCFRa+v91zXH42eblIUfua8JHDaIF3Th2AkHcDz2gU9
	mwXMSwzMJ4aEL6lWivbiivYEfrOskhc6IM06CeFOD56USwr4Q03HAGpCfsjFiGkabAK4ZLXNnjg
	nw4BSHlE4FDQa9tKIHL9QpNXeho00RfyEl6QMHdUPL6Jkc/+41WN+LYaVKT4f41LL21XXDdkwPb
	dYzXrH4bH+MVHO5W5qwKgJFlqLQ/6//eynQDY=
X-Received: by 2002:a05:622a:428d:b0:514:6667:73b8 with SMTP id d75a77b69052e-5165a1db12bmr100939311cf.37.1778931240427;
        Sat, 16 May 2026 04:34:00 -0700 (PDT)
X-Received: by 2002:a05:622a:428d:b0:514:6667:73b8 with SMTP id d75a77b69052e-5165a1db12bmr100938941cf.37.1778931239947;
        Sat, 16 May 2026 04:33:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945cab4a48sm22255751fa.26.2026.05.16.04.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:33:58 -0700 (PDT)
Date: Sat, 16 May 2026 14:33:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Salendarsingh Gaud <sgaud@qti.qualcomm.com>
Subject: Re: [PATCH] drm/msm/snapshot: fix dumping of the unaligned regions
Message-ID: <hx4wermsrgbnnzukzj565subelf6hjireabjvszfbc4ataptnu@t2pk3hqrvsk6>
References: <20260516-msm-fix-dsi-dump-2-v1-1-43928094d25b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516-msm-fix-dsi-dump-2-v1-1-43928094d25b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: CkImMmbRaXwwR4FBekkX8oAtc3BjZ5DW
X-Authority-Analysis: v=2.4 cv=f614wuyM c=1 sm=1 tr=0 ts=6a085629 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=cBU2fVVTaiHfvuHJ6MQA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: CkImMmbRaXwwR4FBekkX8oAtc3BjZ5DW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDExMyBTYWx0ZWRfX4S5qmzea4s+0
 rZd+XUzhujtMTBtQw5FTMtudDHz5+I3pksC5+2VsOzZftp5ZuJiZGAl1ux4bLd27wk2UyJYihel
 1aV4FpjmJaTocuaKzVN2Sq780xC/J8VfjXHvAjONYBdd7x5KMgT23Opl3q5ydqdfTHz1jFsSEpg
 zshw99JkXUMvOZju85hqfy5txJUtjx25Dmigjow2brBWKt+LX7oPuEWPGRWbYwSQsaI8WNF1RVI
 Fr4CQHdRgi5P6Rx/l8PYF4iPhE8Iq+TmyBBeJcnJ16UNsnarEw9BiHIzvQo2baP5vIdbsrGrzVZ
 2B/xM3G+tmsAL9itTH6kySJK2ji7eaZ09tXF6YZxNnFyIOMU5WsO0V2O95nwfMJ9/VSes482rl9
 XsTHjBNijfNUTW5im9uJ6Ucs3F5fIguPsEfT35HTWdRD+uHUJZ3I4qHKRghaz5ENSJya5XcaFJv
 Fp9ektkGu5ks8mpKoWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605160113
X-Rspamd-Queue-Id: A705D55B760
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108001-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, May 16, 2026 at 12:40:10AM +0300, Dmitry Baryshkov wrote:
> The snapshotting code internally aligns data segment to 16 bytes. This
> works fine for DPU code (where most of the regions are aligned), but
> fails for snapshotting of the DSI data (because DSI data region is
> shifted by 4 bytes). Fix the code by removing length alignment and by
> accurately printing last registers in the region. While reworking the
> code also fix the 16x memory overallocation in
> msm_disp_state_dump_regs().
> 
> Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
> Reported-by: Salendarsingh Gaud <sgaud@qti.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 27 ++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 6 deletions(-)
> 
> @@ -172,6 +184,9 @@ void msm_disp_snapshot_add_block(struct msm_disp_state *disp_state, u32 len,
>  	struct va_format vaf;
>  	va_list va;
>  
> +	if (strcmp(fmt, "dsi%d_ctrl"))
> +		return;
> +

And this is a debugging change, which I forgot to remove. I'll send v2.

>  	new_blk = kzalloc_obj(struct msm_disp_state_block);
>  	if (!new_blk)
>  		return;

-- 
With best wishes
Dmitry

