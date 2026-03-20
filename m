Return-Path: <linux-arm-msm+bounces-98927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOSpHEBHvWlr8gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 14:10:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A422DABC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 14:10:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2883E313BC55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 13:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5412F3B7B92;
	Fri, 20 Mar 2026 13:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xv4oQ79y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jl3wSHZ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3DB3AB27C
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 13:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774012006; cv=none; b=gT68lGs0HnTCgQ8RDcBfv+DGGQjsfQR/6loM1aOaJxXK1AEg24W00IaLFjtzJ5881MR5zocUyZUCk8CQmLMOzbCvMgaCJiskoHgtncCTPucmgD5lwqdWe++ikBJ9rnbRb6cTniGbq4JI1XL4WcApOuX6Sh4QF+FhFAzMO3CNVVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774012006; c=relaxed/simple;
	bh=ChfAIEi+2pWqQ4Lzw0Ij1w/fjms4raZ9oD1jzECP4JM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o31RX5SLsh+MeUsiljGY0Bews7bZzTRXfYZDPa92geI55fyWezxJmkqtUlWUT8PuSutAY+6HbMu+88BTZagdrFJuKw/FKdNGLD0cwISzkAMCvaYl66aMiWznP+DPSQCDnHENnLjr8bnDh4FAnxeTqeCQppHs19O5FaC1KTTqSRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xv4oQ79y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jl3wSHZ/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K94WAS700973
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 13:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GEj9UHhLvaK+ebnYW0UfI7jc7cKQ+chi4rWPJEcsFuQ=; b=Xv4oQ79ydw4opY0s
	ub4LwOZ+nh+qypPKrpQOIdo9JdD9jWFGajdXT2bajBTImHTk+GO5uMgthzTXdxvB
	k5wVmEcGn/47dgJOWKfO7xdKpQnRZ/p2l6SFcu+VE1aawOQ8N2hF5ehjizoLynUN
	L5H5BcHsyMXA9cLwfdjQhRmWNMqCF48Y53Ono/y/ZdpQwBrLN81klvM/cwcvVSRh
	zUap77/Z0c3k6nGztVabtHmqQK0EV7ury52mdp3wt7lQyTV8WRuLV16gKREUUTqy
	RnMNpSMD5jaT+1RvurGuGoNwG65fFpE9M4NuBr5EEA93H0IbZSjtvZjql4QK+Qtb
	AauyPg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d139q0h7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 13:06:43 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-67c211a0a07so8804829eaf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 06:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774012003; x=1774616803; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GEj9UHhLvaK+ebnYW0UfI7jc7cKQ+chi4rWPJEcsFuQ=;
        b=Jl3wSHZ/tUbnE332lk+KZXE8fyaAq3KwKF+FYsHLJVYEauLDo67w5urkoNewjBDeA8
         7Xdzkt6VJFpkhbzg5v9RrY8spQDBXEgXzgJ+2e1OzKsmnIbiL0JwIeLBWElLNdYJ+TiB
         WMFyJzBqHGPppK5aXOfeA68AqObpiusM63FfGeLg0rQCpTgzkGI2jALRd52vxyPqEf5S
         R2YtrqUmZvPOB6K/dpYaNQU++5w9BT3vo1yAh9gkEpJm+QV4pBj3mxlaxpusShP5Omnd
         0cyFitMqKBMzqx5rWK9qWRGAmrgPGlwHwbObhkfdqxgSZarYyazURTx7d2wS2Nqb9hao
         KH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774012003; x=1774616803;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GEj9UHhLvaK+ebnYW0UfI7jc7cKQ+chi4rWPJEcsFuQ=;
        b=ZuHMJnI1vQj1OfrrouxZEI1Isvc1tkINFlCwVdy0t9wg49sw87KjhilZY3RrDSLw0L
         mV21E0JjkXTZUonQEOoy/xtlt6SNOAFOTrk2QNhJxcCJnBXhd4Rb/kkmv0rTnouYsOKO
         5ZYvCTW7LyvVaDjcvHRucX2TpQMnJOWMriXHHSWH7PuldJmrGYcoylj33r7cYSMAcUHM
         h1XK51sTXG/g5a3eejLckFazGT1Lo1/nbTlm/2mcoAUZHMB4hjgMcyry9mYLsPC2c7J7
         TvSIhOMBbR0U+rpXGxFq1KcMla+o4WERHt2E04+jgrUUG5yNfZqN6cCE5miUCFI+DTQt
         8puw==
X-Forwarded-Encrypted: i=1; AJvYcCVLRzABRD0yLrla492XWTWVeGLR9giSnAeMc+Nk+VSNsNrJG+S9dv7+M2a2/YWfUTeCgCBtG+OsPMbxvoLc@vger.kernel.org
X-Gm-Message-State: AOJu0YxzwCfAGiDALeBT6A2GRSUklpx/oSBL4smNR9EHRlbRHiOBYfmX
	X4hjOIa43XZpmRG4czOta/lOUMKB0SZOaQswnKzWVWp109sXw8ovpVrCHI2VNXRd/cHxw22B+zf
	/3BQMl8Oh/BhaaLzFTHxizb9jNvwOUZqQpPTW8Qb39IAuE8m/jtfVnxq+D60TbY3pwvz7
X-Gm-Gg: ATEYQzyHn1jO3nAtaxBH6Z8Ynpy6j1NaVsJV0XjxPcrYY7Gk0yuoOVaggrU97qX+mFQ
	rwhrIpbSatpmP25npY0mbJBbhfQry1vhZFFmY5yU6UVKG7PS09vJD4RsrIJl/IYKoZnmb7hDjHr
	vTXYOa/+uBTW60eZUp5ERJ0tysyYIIV3zNwL6dQCwA3BpnbnA0yVznx9D9IkXkYuQAg/qzQizTv
	1RtlGIlWmtqU363lnE8CE/KXi+OD6XuLH2GUiFfGDUh2beYbpCU1J9UEF15tEu+zPE0u99EKNdF
	YpqdPUvl01Tr2nlUMh5OejV1zRgf6+Uch3ZuEMS8C719c74w4RDaVNiVXHaKq2fItIy1V0NTm0h
	mDXMCkfdT/cBuYnThPpUJ0lzz8PfYckznnpo6SuQT9bGQQdpCXPbJcPirunQgPU+t8h87e4wEfd
	3Zd9lAJN0/v98KckHVzzKzo7JkTQ80K8U7OeY=
X-Received: by 2002:a05:6820:1886:b0:67c:2c83:ad02 with SMTP id 006d021491bc7-67c2c83b70bmr429580eaf.58.1774012002713;
        Fri, 20 Mar 2026 06:06:42 -0700 (PDT)
X-Received: by 2002:a05:6820:1886:b0:67c:2c83:ad02 with SMTP id 006d021491bc7-67c2c83b70bmr429564eaf.58.1774012002231;
        Fri, 20 Mar 2026 06:06:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285305eefsm516187e87.70.2026.03.20.06.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 06:06:41 -0700 (PDT)
Date: Fri, 20 Mar 2026 15:06:39 +0200
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
Message-ID: <5vqqcoggq3mrwc567jhrondk6m7vfpth57wu3gyvyjjkezfmnl@mqzlarjlsgcx>
References: <20260311-dsi-dsc-regresses-again-v1-1-6a422141eeea@somainline.org>
 <CAH2e8h4qnF3UxWFrU59BrStWMDc-=Vz9ZNmuq8Q3smhHeUzxyw@mail.gmail.com>
 <a2xtesu626vmfetdoykojm33at44h7zxgvo6ytf2txlg6gn7ls@34jctkwswjnk>
 <CAH2e8h4p4fyoPXTcjbhSXVgWEm54PH_=yCWiCGWOsDaMZu1bvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH2e8h4p4fyoPXTcjbhSXVgWEm54PH_=yCWiCGWOsDaMZu1bvw@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDEwNCBTYWx0ZWRfX5RllBinsEx3D
 a5duu6lAQVPI1+3hOuOorsWARYamb/nhNTpx4H+4bFH3zlKWRYA0tOK6ItAsfS6jjPKmtqmo67D
 hjO+RwoJPI45qD2pjiQsr+45j0ILCTHz0u0tgMcxoxyiPvMo/yaOyazmalcrHee2WLWMspajEke
 UNpi0FTagqCrz8ti+Lafx5vErNyGIOi3Q6V4tG8cqZ+ZSZk9cK+kct+MAyeKXaOSZ7K+ifqHy3j
 xuPmVxE6FuMxt/G67Q+0Ej8jR78n7kix6KfkvoYV2aW+t2912jk5Lfpr6derweRlU7VL4F/LY9k
 JV+uoktOvtLKWyd6iphDC2viEJ/+Vk/rZSSnBmv7sHowuwOUFeYhgfoExPuNCEMnuajwx45rZ22
 WAPUA/C5khVV7hsINGc8jjn3iACmBm+TI4lC+eGAez3a9NSvEFCbWQ/p5wEB73pPq+7IwWGaUES
 rxeNDhtiQpJ9Kx6kAVQ==
X-Authority-Analysis: v=2.4 cv=FOAWBuos c=1 sm=1 tr=0 ts=69bd4663 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=tVI0ZWmoAAAA:8 a=FyIlvsOcNDrvurPcZs4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-GUID: BVQ1rxDG_sPf5Jt3G41LYALOuaUw39tV
X-Proofpoint-ORIG-GUID: BVQ1rxDG_sPf5Jt3G41LYALOuaUw39tV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200104
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98927-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[somainline.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,ffwll.ch,lists.sr.ht,collabora.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,somainline.org:email,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.989];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C4A422DABC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 07:26:22PM +0800, Pengyu Luo wrote:
> On Fri, Mar 20, 2026 at 9:59 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Thu, Mar 12, 2026 at 01:10:07PM +0800, Pengyu Luo wrote:
> > > On Thu, Mar 12, 2026 at 6:31 AM Marijn Suijten
> > > <marijn.suijten@somainline.org> wrote:
> > > >
> > > > Commit ac47870fd795 ("drm/msm/dsi: fix hdisplay calculation when
> > > > programming dsi registers") makes a false and ungrounded statement that
> > > > "Since CMD mode does not use this, we can remove !(msm_host->mode_flags
> > > > & MIPI_DSI_MODE_VIDEO) safely." which isn't the case at all.
> > > > dsi_timing_setup() affects both command mode and video mode panels, and
> > > > by no longer having any path that sets bits_per_pclk = 48 (contrary to
> > > > the updated code-comment) all DSI DSC panels on SM8350 and above (i.e.
> > > > with widebus support) regress thanks to this patch.
> > > >
> > > > The entire reason that video mode was originally omitted from this code
> > > > path is because it was never tested before; any change that enables
> > > > widebus for video mode panels should not regress the command mode path.
> > > >
> > > > Thus add back the path allows 6 bytes or 48 bits to be sent per pclk
> > > > on command mode DSI panels with widebus, restoring the panel on devices
> > > > like the Sony Xperia 1 III and upwards.
> > > >
> > > > Fixes: ac47870fd795 ("drm/msm/dsi: fix hdisplay calculation when programming dsi registers")
> > > > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > > ---
> > >
> > > Apologies, I messed up, I had sent the same fixes days ago.
> > > https://lore.kernel.org/linux-arm-msm/20260307111250.105772-2-mitltlatltl@gmail.com/
> > >
> > > > In addition I can't say I understand the original commit message
> > > > at all; it mentions a BPC=10 mode however the highest format that
> > > > mipi_dsi_pixel_format_to_bpp supports is RGB888 thus it won't
> > > > ever return anything above 24, which is the original amount the
> > > > non-command-mode path defaulted to (regardless of widebus)...  Was that
> > > > patch doing anything for video mode at all?
> > > >
> > >
> > > RGB888 is the dst bpc, which is tied to qcom,mdss-dsi-bpp in the downstream.
> > >
> > > Actually, we should use src bpc here, another fixe
> > > https://lore.kernel.org/linux-arm-msm/20260307111250.105772-1-mitltlatltl@gmail.com/
> >
> > I'm really torn between your two patchsets here.
> >
> > Marijn, Pengyu, what are your testing platforms and are you testing
> > video or command mode panels?
> >
> 
> SM8750, I am testing on a native 10-bit video mode panel.

Is the framerate correct for you?

> 
> My thoughts are we should restore 6 for the cmd panel, and we should
> fix video mode too.
> As I mentioned, I overlooked something, I thought the cmd panel didn't
> use the value, which
> made the value for the cmd panel wrong. So we can restore it for the
> cmd panel (though I can't say why 6).

2 (wide) x 24 (normal bus) / 8 (byte)

-- 
With best wishes
Dmitry

