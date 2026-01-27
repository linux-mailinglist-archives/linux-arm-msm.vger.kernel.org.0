Return-Path: <linux-arm-msm+bounces-90701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKGNBTiVeGnmrAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:36:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A27492E2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49C05303E4AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CF2341AD8;
	Tue, 27 Jan 2026 10:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KDiQp0N5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xjvp5I07"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F007341AB0
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 10:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510082; cv=none; b=JWTVqH8dGa72DaYc0S+D4lH1Vkf54A1Ek/VNyfD87FWhodmsuP04gfHP0RxT91jAR7GLbs5j8DKKLwAPwcVXMvj66x1la1hl2hFolWlrOP43Rf+PZaGEoxLa71amuunffEdPfUof2hr58sF4zW6EKPE24QqrFbHjqKJWn5S/lUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510082; c=relaxed/simple;
	bh=xBBOA/A4vzP5lzIlhj/8u72/dcve6wRax9Ox1z8CKI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NjWE5r/rIRQUcUJYTjWEgK7k/3Sp3CXwJRt1qpqdrerHMnJ9jCZOKSaQpnHU6pmM14kd6sW1XlJadVQeq3clx+JgXKDOA7qx2z0wqNSGduWC1eu3ya+yI6goQpwikkO2Ml+9HiJIdOCM7wEkc2totZShP+rfqjvfUCl/WqlQKVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KDiQp0N5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xjvp5I07; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAMtPd184760
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 10:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pSe6m9bpQlKGAyhQeVQfwUOr
	nWUJ9Hu2tKR1AdBPD6I=; b=KDiQp0N5T5oo4vxAdnjXwTA9yxewWrg/BwPHIizi
	WtoZRo4fhTiF6BrPcuoImB3rE7bXgwSrMLBirk8662FK86+UlkMAMU9CZGLSHGBS
	iPiviSG7ijibW3Uj8VbxLEoOVKK7bxGZbuOM24SdeOtQVERgvoAVtU7v9KLCjHMF
	wIy4k2l7+rvXQryz0XYpC20DMcAnhCSUEqrKzHRJeYpfeaKwntxonGQkB+7xGaeR
	P8pcKSL/G6geZCAITJ//T+/aR+wyZa/i3fQdEYKMOOTRufDbLrZB/22S6F2d6IBY
	RnuVABbDh569TfLh5S3Iw3qMTLawRuJXqY43N5gM3Ma5rQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv9jpty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 10:34:38 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5f535184cc5so5114865137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 02:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769510078; x=1770114878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pSe6m9bpQlKGAyhQeVQfwUOrnWUJ9Hu2tKR1AdBPD6I=;
        b=Xjvp5I07FMMPljEuTWPCkutEBhdjfLpNL8J6UeCvG729G7bgIn+q/3mFvuyKqY7g/q
         p9MMVP+JeKP5Rtnshv0AlRwnLerezC8NDu+jIB2C2zmePM154aYqcaHNLr278Q0S6VS9
         DI249hQtt8OX+pfpD+s/5NCzOH6BRe3FW4JxwG4YJ27/F2KIBF15DgTCZBtmpuY4Mb5X
         SEYR1D+x5SmTDbqvAiM3LZNKyvsI80yRKfx61Beh8xwV2hl7yEqtY/1DOfoCToprMiyx
         OGlkUOyQvJB6F+gxOZdEiQpM5q4ZQEBP7zE4qLpIgh8MQUVzBHxWEws75rXTCONv4etp
         C/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769510078; x=1770114878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pSe6m9bpQlKGAyhQeVQfwUOrnWUJ9Hu2tKR1AdBPD6I=;
        b=ftrL6bvC1/iQ4GziSSVvnU/7wBso1GqqugBx1vGPVzFmEioZFNJ3o4IoldX9VbBIGN
         FXqcJIrAzNYsjfF26pbWpaUYFSr+Z47j3g3H8tHT5WWr9OxwbDz/ZboGY7ud+8W+uQc2
         EXVPI81u/Ty+X2/VMVm555cNH7CpkJwbMukwhtNsRh2UvkdSm5J2hKYq4VLsdTDQVc6q
         ITjNRVs8v6qrFNH1PkJqALd6welWf1MQ3upu04CHEsR8c74JnhtXh5Z3FUCZmyTRkTSN
         DFR3kgISASP6GFyr1x0c8Nwme3LAv8p56tWmGXUvQSZfjqPpYXcWN/5XkiFjSTb+9spY
         yuyw==
X-Forwarded-Encrypted: i=1; AJvYcCU0E6rgOYIoxPyJagXg2pvi7/ipyxg5HUJkZeNqND/VMDgZd102pYBvw7y3RXeqSMyFyh7frI+xgwnYU8o+@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlkp4hXnFSNYHeWlMYSk/TvA1t8w6tJP0Crrk1dCErCHjrkvvS
	xNLBSEntk2hmIvPPppnIjveBT81pVN+rCjmKwcKKAEsv1q04qG8Q4BA9E9NSqmwFJUVxbTk5X68
	16EsoI2P0MG514x1YPmD0l5uRO6N0ksWOOuwqU1Ki2ydDNykLEDgSp1Yd7kCg3I5zrIQB
X-Gm-Gg: AZuq6aJkSfu/oq0wPezgE22+fYKCg8q9Nw/bps2z7L0lPU/qFH/AYytkMM/tw5VlNpV
	C9lSK/Wv5845SCblX8mu79tdLaOaLNiSUCLrnsKseFx2Pby0kTw8Ubenyqua10NAQJwQEIcrHrS
	oyDfAguhCBTsoS2LnD6HuP8q21B+n27m89IHItVkeQbIvXIrdmLLst5KMz290B16Wl8oOY9ciDO
	rX1LSRfSUEAw4CrmBhn6eFZituNewMP1bnLT+JTggmhHBTZ/O7JHgn4g1rEgypOOmRTFm25Z4wP
	ppb3I0n88GtZsVah7Mku7GFwuDFwZYMHQY3PTGBbZk7IYyxOdZ3NZj/4FU7H252BuiVZpupGBrD
	VsUPZMLDpJCCDYsqtxhlRlf3DcVc1WR3+jixUMXTMjwmL6e113K+NPG4T3+/u++WJp052yqySG6
	0YqAiDYqDAfIsTUxLS1IguiwA=
X-Received: by 2002:a05:6102:3052:b0:5db:3111:9330 with SMTP id ada2fe7eead31-5f72379c46dmr540407137.27.1769510077613;
        Tue, 27 Jan 2026 02:34:37 -0800 (PST)
X-Received: by 2002:a05:6102:3052:b0:5db:3111:9330 with SMTP id ada2fe7eead31-5f72379c46dmr540394137.27.1769510077057;
        Tue, 27 Jan 2026 02:34:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de48df625sm3295728e87.4.2026.01.27.02.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 02:34:36 -0800 (PST)
Date: Tue, 27 Jan 2026 12:34:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/msm/dpu: try reserving the DSPP-less LM first
Message-ID: <whko2yur7tgutr4qhlbqfrvpcdg7hkyw66koicqvpvfhk55c7z@saj2uxrduv4z>
References: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
 <20260115-dpu-fix-dspp-v1-2-b73152c147b3@oss.qualcomm.com>
 <33424a9d-10a6-4479-bba6-12f8ce60da1a@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33424a9d-10a6-4479-bba6-12f8ce60da1a@packett.cool>
X-Authority-Analysis: v=2.4 cv=OYOVzxTY c=1 sm=1 tr=0 ts=697894be cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KlTdY6ZzAAAA:8 a=EUspDBNiAAAA:8 a=Vj5JY3D4L5YBHjkz5HIA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=7M2I9cFuLl8dRdVq5wb9:22
X-Proofpoint-GUID: D5v1M4rWnv5RMWztDltkpeF_jrOZJP6k
X-Proofpoint-ORIG-GUID: D5v1M4rWnv5RMWztDltkpeF_jrOZJP6k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA4NiBTYWx0ZWRfXwzlb0NQn5L7j
 8IGAofrApSLArwlG+5d/yCbtAwg8loZXJ5m61psZ7XyCW36avgzi+dJ05zs1hJUvr5cZy2d4Wwy
 qi6GRRLBVuIWPfqlsvl9e6SL0mwVwVRITM+YH3uYtBkz9sVvui0IkN+EaFSRm0HQqj2IQix+rD6
 gA1aL811FT/p2LnwQSoe9Y3QakBgvIongxv9PIPX/Q/59Gk+OwybmHsTUZmouSW1ugh98tZECyx
 uXLUo/RNFR+ktsScy/TolX7gvADMaMFs1VlBOse8mYI1bpScYmyXzcxr6vlOA1objRKDmm0k3aP
 NZlJqyngnHF2VSDwZuNLRp6qFBfrLYyiOoZz1ihMePj0JXWNX9RTg1OS++dceYH8omTGmhNdZDJ
 I1Fy5m3jZtz4lPv3OgzgBSXQECgbz3FKtCZU3lL2fPi1YwoClNXBvY/gkTCcHnCLpG2nDJqam7H
 QoFawSzpB1VVY1nG0nA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270086
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-90701-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6A27492E2D
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 06:43:32AM -0300, Val Packett wrote:
> Hi,
> 
> On 1/15/26 5:05 PM, Dmitry Baryshkov wrote:
> > On most of the platforms only some mixers have connected DSPP blocks.
> > If DSPP is not required for the CRTC, try looking for the LM with no
> > DSSP block, leaving DSPP-enabled LMs to CRTCs which actually require
> > those.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 52 +++++++++++++++++++++++++---------
> >   1 file changed, 38 insertions(+), 14 deletions(-)
> 
> 
> this has massively broken things on my x1e device (latitude-7455):
> 
> - upon booting into gdm, the internal display is all dark blue
> - suspend-resume makes gdm appear fine, then logging in results in another
> blue screen, again bypassed by suspend-resume (vt switching back to gdm
> makes it appear fine but switching back to the session, it's still blue)
> - OR blindly logging in on the blue gdm makes the session appear
> - plugging in an external display makes the blue screen flash constantly
> over the contents, there is also a flashing vertical gap between 2 halves of
> the internal screen (amazing effect) and the external display doesn't
> actually refresh the contents under the blue
> (https://owo.packett.cool/dbg/dspp-lm-boom.webm)
> 
> Consistently across 3 reboots.
> 
> Reverted only this commit and it's back to normal, so I'm pretty sure it's
> this.

Interesting. Could you please capture the dri-state (only the last part,
resource mapping) with the external monitor attached and with this
commit reverted?

Also, could you please run another check:
 - revert this commit
 - comment out LM_2, LM_3 in the catalog
 - try the resulting kernel with the external monitor

> 
> /sys/kernel/debug/dri..: https://owo.packett.cool/dbg/bluewtf.dri
> 
> 
> ~val
> 

-- 
With best wishes
Dmitry

