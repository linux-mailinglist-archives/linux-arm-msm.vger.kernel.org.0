Return-Path: <linux-arm-msm+bounces-94730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDa2GtkvpGmBaAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 13:23:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5F01CF923
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 13:23:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEBCA300FED8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 12:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C5728640B;
	Sun,  1 Mar 2026 12:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B+i/Ng1D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UlYrU7uz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3347F19EED3
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Mar 2026 12:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772367827; cv=none; b=PB9Rf5FxTiK09kV/5XKLVtdPd+bAgIeXQSJQgFbRe6esz3SDNvZusggNrvhxi34ftpVcG276V9zxPf6sr6xOl/8uT6b3ilyM/wbGkP5DRFf/YEMoGggJMKVGCrgjGgObasB/oCATuE8hY/LXDeNG8p9rpIURCw7YJWsYGHdrrNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772367827; c=relaxed/simple;
	bh=ULhh3aXM9rl0PUpUMJ4YtP47GGxMWftUTBvlYlQYMf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2DfQHWPXg7Nx1vY9WoZejlD0bo9U+Bg/Z5/cewsNVVkOrkcBhgL0jtbeYvefagHF22LibQM71ZxCKwpP20dWZCKL4bjZvgZmxlbcFNDMDPjLfHP2qYB3ImS1bY3OpjGp7+GfekGQzTGNySYN184s8rAA7s4dzCwfEU/h17BXiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B+i/Ng1D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UlYrU7uz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6218ihAM1322657
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Mar 2026 12:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1d0h/Uwo1zhNWczg072b8+Bm
	Yb6n6+VhKt9sy84aK1s=; b=B+i/Ng1DlEgCjReLm8Fiwu8AW0yj2WgE6gsvdO4+
	FHurx2foSnpryzKHl9enYZgeMvhcLXZiHDWVlycEH2Gqbmtts1mVzORQuUbD3vDx
	gn4Zt5xWCpExAYsUMdBmLj5498hqai5n73kdmmWbD8ORstdd0j3lpimovTFyYel4
	0inMGKPuJhDQdWMfemUEtNDUAWN9LkJ6BCE+uUDYHIai9/FZLzJOwKHLv837463M
	R4tmXKHWRT/g0r3XVtN6BY+SiYRrHyDYa9I8tHhcxYFyvCrXJou70O/WiOjdYmSW
	/WbbH6s8+arMGHAyVfb9Ka97rbiBehP/j9rg8giOqv7bIA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshd2pqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 12:23:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb6291d95aso4408315785a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 04:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772367824; x=1772972624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1d0h/Uwo1zhNWczg072b8+BmYb6n6+VhKt9sy84aK1s=;
        b=UlYrU7uzvPIKO4u8jYEaHJ1qmsZj89TuhV4Zz2WS6m4US98MvEUhoSRDkfxpZ8RoZo
         N0AfY4AnvYLuwRPt+8KuUMFLY0qkhIrRq8LV49F8qRHXjeWdombA0KNOJmzqBCRXhF1Q
         k/BNEG+LOsxzdIEK0ql3K811j8u1GVXmbvHG7tzxkKXsf7BaaO9oj+3Q0eOJ/k/DZsDm
         U15mRL5aXyqHshqTY+kw3hry5UJRxXSChzws6tgvVaunKzoNW8DZwTiAKoRMP+IGxEzR
         P7nEWXLaWA0qt3NgPcS87dl4LnQRD2erw5XMeWSkjIFd7hg5jtooAMlOa+6lkImOIoKG
         jg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772367824; x=1772972624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1d0h/Uwo1zhNWczg072b8+BmYb6n6+VhKt9sy84aK1s=;
        b=Bjq2HQd+uqR5+EoFa7fAHyQI755Yuv0A/bwZ17VWvfkP5B0mPbvAIaPRuWJPGodGic
         IC2fPvrcF+os9QpMKSvylWtDwvx292rP6ENtLzOQz+XBxoVDCqbfmSLwJ5PNYRL9bDRI
         e2Uil/zjNSIuyGol0Upxx5DhCl085ArLEwPC19FBn9LE1zKEJqLKkZtj3Y2ZTGAbMKvF
         jO4LfI49qwwvQssGvFJpznjVgRT13vqnQ6Km63bSpLgubLMqJkNz7zU96vkEyNUDcTTu
         W7+nl9ePeD+m9t3fdStMyhLjEfZatEpOHrYc463Ba0cyuq3it3A+1LUI+oeOjiCF6HrZ
         VvjA==
X-Forwarded-Encrypted: i=1; AJvYcCUhWsR6n5XbuGP7vASxXF8mQPBCJWR2AbH3990HzJTYm57TSHd7eQ9HRbY6E0AypCmoNjTzUgsU4vvq9SEZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxYMpzZpbtYHePAx2qDtSuyHY3QACss01sr4UK1eBk+S9nIxkPr
	kMjNhX2c709fM3utYDrIF/wsSv77onj/Hb2mLUbjga6NKSCzFZhJ+o4PtZEMA9Owy3eztY4wYBf
	wy16fbAgF4NCxwoZ7fWka2IHSwu5vjtFAXxJ+syDXZQmYlxanIYbb1tjxSKviWqn/lciX
X-Gm-Gg: ATEYQzxlIpdOvI6i8BDcoYL65qF/vEogbipC7Kaipb4gZ4aH//YLv26m4U/p3m7t1Cp
	tgMc1csK6+Go32M8asVYuj9eh/hfD0ABpWn3baDvp0vOgYjOa9xjO09UAb/z1UwmAECU7EF3mwl
	9E0TiOhZAQ8a3DvU/9qv67hKaJgZeh8a/l09+NMikpwvVQB6OLE8SQLMeEf/puBsQckWMFSxWcT
	+qyh712Ph3BKyy1bcvuRotPYF5RW7kgCJ5uqgQoeov64wOFxjhJWH7SbIJtW8VHbT/y97qQ1PSJ
	lkTjWjravEQ+6AoVsCl+bOXcM9EFdyHvW13qVp8gTFKzBnoRzSh93IvSbPZD8jhB7qGgpKQpCWG
	SauC++KAjxmXbDJsEN7ERzMUVD7UdlNUqvq4HVF0Jtl2qxz37ZJQXzZYaJxtpEJnjm6OUXF+kge
	RnKuS9ib5nTMkYgz1nQrEVDHGXCToI2pJvaS0=
X-Received: by 2002:a05:620a:d89:b0:8cb:b062:c2f1 with SMTP id af79cd13be357-8cbc8dee51emr1128486585a.29.1772367824385;
        Sun, 01 Mar 2026 04:23:44 -0800 (PST)
X-Received: by 2002:a05:620a:d89:b0:8cb:b062:c2f1 with SMTP id af79cd13be357-8cbc8dee51emr1128483785a.29.1772367823944;
        Sun, 01 Mar 2026 04:23:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bd5a7csm1030134e87.37.2026.03.01.04.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 04:23:41 -0800 (PST)
Date: Sun, 1 Mar 2026 14:23:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
        helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
        lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
        guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
        valentine.burley@collabora.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drm/ci: add sc7180-trogdor-wormdingler-rev1-boe
Message-ID: <hnlupswfdkrzv45y6jl5x5u25zp2k642z6ordzthqbdw4azhxb@6gz5hx4dcujc>
References: <20260224081036.220820-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224081036.220820-1-vignesh.raman@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDExMSBTYWx0ZWRfX8F3MkRa5OjG+
 aoIIpFE73Xvck4+Y9z0lVX/0Hi92xkzrpKgKO2wdTweKliPz1dwPtBYbfG3qIAAnxFhkh4bRRDi
 l8i+9Cxm2TB6irYUbsB+tuvuonYw9iIqBmHgnlRDH4DOIJjdNOPXcmDnhvJGbQvpsjQqOVB+wkv
 yK8Qb9JVU3KN99QN3yNqvIlSDg3NJuSkZ2D/nwsaRrX1l5VbhP4BJq4AFJnxeNgPRQZpnbFBQRm
 iZ25zzTDS7zCmrQ70iYRUav0ttbwB40D6SvKDYhOVHfiXDEAhuJjOVkwsDeUz6Mt64Q6W5hC8xg
 tsGUwa54hVD+V6fisQYGGbabKAJTy006rsfNfPSy5wOWP2OCZAGecyKuTRD15UJ4WOm+pE61eUq
 RhSnIlB4EmUFDVeT9wGeNmCkszQGVgQWDe5QC65ldKVcvVlNxQlcGFKmspL5je9Vwthi/5Vqztb
 apMpiPs3eihum5h7nog==
X-Proofpoint-ORIG-GUID: xmYaI3wP3sfD9bWlYPBHmGPBtm3z5vXa
X-Proofpoint-GUID: xmYaI3wP3sfD9bWlYPBHmGPBtm3z5vXa
X-Authority-Analysis: v=2.4 cv=COYnnBrD c=1 sm=1 tr=0 ts=69a42fd1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=DQB7qGAGv7oAOIdkHEkA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010111
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94730-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,collabora.com,gmail.com,ffwll.ch,kernel.org,oss.qualcomm.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB5F01CF923
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 01:40:34PM +0530, Vignesh Raman wrote:
> Add job that executes the IGT test suite for
> sc7180-trogdor-wormdingler-rev1-boe.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v1:
>   - https://gitlab.freedesktop.org/drm/msm/-/merge_requests/221
>   - Depends on https://lore.kernel.org/dri-devel/20260210071138.2256773-1-vignesh.raman@collabora.com/
> 
> ---
>  drivers/gpu/drm/ci/arm64.config               |  4 +++
>  drivers/gpu/drm/ci/build.sh                   |  1 +
>  drivers/gpu/drm/ci/test.yml                   | 10 +++++++
>  ...180-trogdor-wormdingler-rev1-boe-fails.txt | 23 ++++++++++++++
>  ...180-trogdor-wormdingler-rev1-boe-skips.txt | 30 +++++++++++++++++++
>  5 files changed, 68 insertions(+)
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-skips.txt
> 
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt
> new file mode 100644
> index 000000000000..4af93eeeaf99
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt
> @@ -0,0 +1,23 @@
> +core_setmaster@master-drop-set-user,Fail
> +kms_color@ctm-0-25,Fail
> +kms_color@ctm-0-50,Fail
> +kms_color@ctm-0-75,Fail
> +kms_color@ctm-blue-to-red,Fail
> +kms_color@ctm-green-to-red,Fail
> +kms_color@ctm-negative,Fail
> +kms_color@ctm-red-to-blue,Fail
> +kms_color@ctm-signed,Fail
> +kms_color@gamma,Fail
> +kms_color@legacy-gamma,Fail
> +kms_cursor_legacy@cursor-vs-flip-toggle,Fail
> +kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
> +kms_flip@flip-vs-modeset-vs-hang,Fail
> +kms_flip@flip-vs-panning-vs-hang,Fail
> +kms_invalid_mode@overflow-vrefresh,Fail

I don't see this failure in the logs. If it is removed, then all three
failure lists (and all three skip lists) are the same.

> +kms_lease@lease-uevent,Fail
> +kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
> +kms_plane@pixel-format,Fail
> +kms_plane@pixel-format-source-clamping,Fail
> +kms_plane_alpha_blend@alpha-7efc,Fail
> +kms_plane_alpha_blend@coverage-7efc,Fail
> +kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail

-- 
With best wishes
Dmitry

