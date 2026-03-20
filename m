Return-Path: <linux-arm-msm+bounces-98870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO6vDyOqvGmk1wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 03:00:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA11C2D4F51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 03:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5593930053A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 02:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B65B31197C;
	Fri, 20 Mar 2026 02:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RzfTU4yj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZZfyBgYJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B290F2FD68B
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 01:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773971999; cv=none; b=fiHouNxvnqhAXhtG8oQu6UwCctwtrX13W2MOftY0u19SVGB+wHwGn8I7Inq865khKdLXVuXmjETfq1PkSPAu6EsYghUmqBo9vmbVHXi1YgAAAGlKm2Lyt/QEjLzAvT15OAfAozQfyXFG1mGltwFOWamLbzWytbDZ6Rh2cItUAfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773971999; c=relaxed/simple;
	bh=nHgtDUbqQuQRUUwHYZJC7GED/8X6q1xVYKFFiZ5TVAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OoeZ8y7PEEO11V181i4T8YteD8W3To9S5cSQaCHzlTJ4UMyw1NuoWKInmEFL+ZZx+Pf1PxFtV5LTPQWxz38CNA87NTQos50e7ri+H9VVL/rZ2iZMDdrFPSEFdj1qvo2J+w//SBEKT6jePzZ9s4GHcX0XL0i4kkoaKt2ThZflSIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RzfTU4yj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZZfyBgYJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JMkAVV4144591
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 01:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1/eBnmi9iQCVvM7OEFm4LI9nJNI+Pese6YtcXwYE2SA=; b=RzfTU4yjO+s8ZwDd
	G0ovYTN6BMY9QZDiAYEuzKRvHky4h78mnHTVsdw29rcbcDgVkaTVveqROQmNz5T+
	W8scu5v0+PIu89rrzuQSlXoKz4w3/3KWJnHfVxWjONMEyiLGuBMJgSdc7XZIXsBy
	TxVHv2+XwTj9DrujO0UForgdhofIPC8949GUUd575zU2+vp55wWVOuBde78fczGM
	J5BtFDSX+f3Y+D1Q282W8Nx/e7JPiufsbYIYGzKaoKlipdVsJF/Hm/RHYhCIZCkq
	Uvvc5GVb4KsIja+t1zQvz2/Q/sJNMVE1WIILYlmUqnW3/XxfX7EVk/xAw9r1iEUe
	S8Scpg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0t7urckc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 01:59:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093787e2fdso25166841cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 18:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773971990; x=1774576790; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1/eBnmi9iQCVvM7OEFm4LI9nJNI+Pese6YtcXwYE2SA=;
        b=ZZfyBgYJ4yNW7pBAPEE7zHVPzfyiQOkrdnMKLPjtGZTt37u3NtDQXRys+nGxLJoAwV
         lIKMAxiHzNmVGVn2tx80+qMQKzSz1aOVGT/dmAqQA9vuIX3/fzAzs1omS6gItgiD6xbt
         wG91ACo4XrVFh/d+QCvbQu5JUzb0xKde46WLBljFmVbBarEpbbxtVHuUHej7FIotaves
         Bsy2WaDW71FwBc9pa+5FvvrLsqAXfnq27pqEVZLGah7Tmvi8M+VgAP/ejl3ldsb3NxgX
         8zhds+gi7w+KYIvJPgZvVQIxOwERPpsYMoBuYIbZSq19e2Y/uqmxbZoz++/Im69/w5az
         nVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773971990; x=1774576790;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1/eBnmi9iQCVvM7OEFm4LI9nJNI+Pese6YtcXwYE2SA=;
        b=Xmnw1YLWnctpZ9Jzhhi4aK1nQO7XG+nO3FfZMXdfhRIMyg2agpCyVNIirMW+/uw2Qd
         c5DfMWpqSh2GDG7oy7UsUKL3xctBBREotSl/wUuBY8StjHNfwDtBLGp9mSJ7fhLaDoeU
         VXnwXuf2bFTbzaUkrFLWkxQRHCmM1gxj1AnHNHhuv+W17JorN0sdu0CBHaG1ZTC/LlZF
         FMgOW6EBEr+tCx1l2wCnjbu7uBJ2JZv1Ds40kX6QHbfnJ7ItmIUeOJgqyre6L6XEXrt+
         f9m5cn+jkm+qWhnGPzDnuwt5Z9PwUU1sJOWapfH0wmIJkF4+6cOlIIt/JnjW4K/TooyD
         V10Q==
X-Forwarded-Encrypted: i=1; AJvYcCVe1vmuvctoVlfgAo23EpddYBKSlqZNOT6ME8FmcgxnlnClRumy/1cYfsV0H5ZrwBOTSA4ZBexfwzR3Nkba@vger.kernel.org
X-Gm-Message-State: AOJu0YwW3xR93TG77yjfye36LzL9C3/D8FoplNVQKkGpAlJiHQj+PaX3
	6w76+tiTFrH6FV1GPXupObq/8cV7hvYRF5f6qh59c34gA4xI1ul7fJZzS6cW+nyVElbPADYBkBB
	u2QM8uM/mSlc79B8IMXjhvzLIqQGMHsc4fDlj+lyoVpuCQCh7HlPXUxCGsTJ8AqXCfffJ
X-Gm-Gg: ATEYQzy7MkVXQ7HtbEMzJ45Y5bbM7JuNQsepyoZn29MRALb5IxCUXFT9aCyzB2b6Tss
	92sCi/F7SA3uhH7NvYPB7yqywIeWHGToDtSZ7IDA0th93SpKlH7ZcZ0hLb+j0oTJZ4OQvNZlF2d
	j1wUZGVfqORQwNvZ/GkytK8HV7mBBq0IZfhHq83HrVVacUzUufIyL4nDkJW9JatyAYay3CQE90B
	cKlWY99drxlyw5hW0flkCiMmPjJm9AgzjOARdFIGUyewWR4xfn6apQZTEJOfUbZhPlz+XzY8Mzv
	V7ysKBuGfVg/y+wlXdgqXRrK+M4WGVoee/KM1HeyLvvYGPKR9q8Fh2Ah8GvgVasPp3rpsOd4N3L
	cr1pssLls2uoyxEMST2ArmEfO1zgM+JWTm7SbmZE35HnzBPT3m2EGgw8XmiKzB3q/49E8W9+sq5
	z/GhcKCypwQ/Q/ZQwae6AhQsR50sFYqWEJRF8=
X-Received: by 2002:a05:622a:1249:b0:509:3098:819a with SMTP id d75a77b69052e-50b374e56a9mr22611271cf.44.1773971990494;
        Thu, 19 Mar 2026 18:59:50 -0700 (PDT)
X-Received: by 2002:a05:622a:1249:b0:509:3098:819a with SMTP id d75a77b69052e-50b374e56a9mr22611081cf.44.1773971990064;
        Thu, 19 Mar 2026 18:59:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf972b926sm2581181fa.1.2026.03.19.18.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:59:47 -0700 (PDT)
Date: Fri, 20 Mar 2026 03:59:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: Restore widebus calculation for CMDMode
 panels
Message-ID: <a2xtesu626vmfetdoykojm33at44h7zxgvo6ytf2txlg6gn7ls@34jctkwswjnk>
References: <20260311-dsi-dsc-regresses-again-v1-1-6a422141eeea@somainline.org>
 <CAH2e8h4qnF3UxWFrU59BrStWMDc-=Vz9ZNmuq8Q3smhHeUzxyw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH2e8h4qnF3UxWFrU59BrStWMDc-=Vz9ZNmuq8Q3smhHeUzxyw@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDAxMyBTYWx0ZWRfX4BxFBwwGRYe/
 PHy5llo4biySjiw4t73eRPsYVo+Bn7rfFcZmE205LiBVK5/SzrgekaAIb1zC+4kFT+R/Tlb8iiW
 Ypf3mRgBFxkOSi3CdrcDLKXGyooMJbE+MiL3ov81E8A29PGN5og3Ig0Z9niV9dV/JWSMblbgA/n
 Qy0h3ldgeZDXbpgq/vRJuiS7NMPY+wghcFZ+0kSNQixJ2kVtCsDkQ8BV+AV7GfeND63NocNiXGX
 1FPai+umNmDhl6VJdeKPI9cB+3LTi2iL7GFyZ1b+jqPBY5vrurngMi20t8iCq/fAV7fw38TVyhj
 QESJyPLYjzeqBHG6IHKYSmS6aXHvbwnzI9YbmIdC2A3OW7cYyETZ2hMpc101pTlMlaAAR0RFcg6
 Zpcbr308rrXVLXyOK7lWZlf109q8+L/LwuoBjreotTEIiDyWwDBHiSASo6WKjLJltGg1cgfWH9n
 gI9UAWjYyh7XAdO/qhQ==
X-Proofpoint-ORIG-GUID: RGWTXBz44BGuAZbIe1lYy41s0emroOMs
X-Proofpoint-GUID: RGWTXBz44BGuAZbIe1lYy41s0emroOMs
X-Authority-Analysis: v=2.4 cv=c/OmgB9l c=1 sm=1 tr=0 ts=69bcaa17 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8 a=BfWMck_JzIBwxaTteZ4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603200013
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98870-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[somainline.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,ffwll.ch,lists.sr.ht,collabora.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.992];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AA11C2D4F51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 01:10:07PM +0800, Pengyu Luo wrote:
> On Thu, Mar 12, 2026 at 6:31 AM Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> >
> > Commit ac47870fd795 ("drm/msm/dsi: fix hdisplay calculation when
> > programming dsi registers") makes a false and ungrounded statement that
> > "Since CMD mode does not use this, we can remove !(msm_host->mode_flags
> > & MIPI_DSI_MODE_VIDEO) safely." which isn't the case at all.
> > dsi_timing_setup() affects both command mode and video mode panels, and
> > by no longer having any path that sets bits_per_pclk = 48 (contrary to
> > the updated code-comment) all DSI DSC panels on SM8350 and above (i.e.
> > with widebus support) regress thanks to this patch.
> >
> > The entire reason that video mode was originally omitted from this code
> > path is because it was never tested before; any change that enables
> > widebus for video mode panels should not regress the command mode path.
> >
> > Thus add back the path allows 6 bytes or 48 bits to be sent per pclk
> > on command mode DSI panels with widebus, restoring the panel on devices
> > like the Sony Xperia 1 III and upwards.
> >
> > Fixes: ac47870fd795 ("drm/msm/dsi: fix hdisplay calculation when programming dsi registers")
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> 
> Apologies, I messed up, I had sent the same fixes days ago.
> https://lore.kernel.org/linux-arm-msm/20260307111250.105772-2-mitltlatltl@gmail.com/
> 
> > In addition I can't say I understand the original commit message
> > at all; it mentions a BPC=10 mode however the highest format that
> > mipi_dsi_pixel_format_to_bpp supports is RGB888 thus it won't
> > ever return anything above 24, which is the original amount the
> > non-command-mode path defaulted to (regardless of widebus)...  Was that
> > patch doing anything for video mode at all?
> >
> 
> RGB888 is the dst bpc, which is tied to qcom,mdss-dsi-bpp in the downstream.
> 
> Actually, we should use src bpc here, another fixe
> https://lore.kernel.org/linux-arm-msm/20260307111250.105772-1-mitltlatltl@gmail.com/

I'm really torn between your two patchsets here.

Marijn, Pengyu, what are your testing platforms and are you testing
video or command mode panels?

> > It feels like the conditional introduced here is only making things more
> > confusing, but I don't have enough input to confirm what the video-mode
> > path should be doing in widebus mode (multiply BPC by the number of
> > components and by 2 in case of widebus?).
> 
> I left a comment. For CMD mode, it consumes 6 bytes, for Video mode,
> 
>   * DPU sends 3 bytes per pclk cycle to DSI. If widebus is
> - * enabled, bus width is extended to 6 bytes.
> + * enabled, MDP always sends out 48-bit compressed data per
> + * pclk and on average, DSI consumes an amount of compressed
> + * data equivalent to the uncompressed pixel depth per pclk.

I think this comment more or less matches what I see in the docs.

-- 
With best wishes
Dmitry

