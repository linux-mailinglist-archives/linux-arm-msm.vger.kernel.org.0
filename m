Return-Path: <linux-arm-msm+bounces-108066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBKgFcIHCmqNwAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:24:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FB556311F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3990E302FB67
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 18:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ACA13C7E13;
	Sun, 17 May 2026 18:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d50m7Nhv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VsoIctWP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA6A3BFE31
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779042098; cv=none; b=j2oW3oUfG510GuJLYaGbXyc3aoVLA+ytNSR3inzauLJ8wlTL4A0BarsGp0mkHe/neg1iPAxORc0xuGLx10D+Vnqnl0bhNCmMHehnb5GLUeVI+k5+Fq0dKRPZVxJL73hYPWiTsPGP0oP/9jmU8F5yK2e6CGtEPXlVXTnxZdYGS2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779042098; c=relaxed/simple;
	bh=QLRmnAmXmBxtEPAZKCGiRo1OmutoBrU2oBUCOucKahA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dulNi4VTMFXQ5Z1L6svncUzFFIow2KJNkgVpdQc/Xal2xNhQQbSsj05Pr61aTlTjsBHnFOIowD21CwihBHpu8kqEKZwebN+YseeHpf+LKkB7nhOMWATWR3+0afweDjss+R15ah7oCPOARgn1xTlMg+ACvlMuCAbsf5QWChiV+Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d50m7Nhv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VsoIctWP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GMeCIu1867294
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LoX2V7qBQutb0MAbEsVo9ahJ
	MEdN0hI3xKZwjM9Qtvo=; b=d50m7Nhv0DHivtAL8V+B8kh/pauK58uVs7AKkwJ5
	aUK9ru0m8toL20Qku0fo0MqljHp8n+Hrc7oyW+BmWKpFF0XIRzWHtCdsPSoWTRF3
	5afhUtW1Me4tx2iiL45UuFgVJCgaZ13xmyoN2e5gfvXKQzTWIFbVDLsl69K7NCWZ
	l+NoScNu/fF1pwhtWl4Hip6DlKZRlzDlex3C85PAzx496/jltEWGh2SBCfv5mAve
	ObBEF4qSw0eRQw7y/vAUw1V2myWaa2BeNlMVtlqxMVzV4NWmkxV9pDuBk9+cqCCn
	eiYwJNUMp0k+VAYAqBsF86y0YWKCKiw253NwJ7XEltRZ8Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gyw3bqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:21:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514b673c8f1so1259631cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 11:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779042095; x=1779646895; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LoX2V7qBQutb0MAbEsVo9ahJMEdN0hI3xKZwjM9Qtvo=;
        b=VsoIctWP8H5hfN1wWdknm4hlvCL+nqh4SgRZtz6adq5rPesButSTkDqSOvfZnmC6W3
         MBZWNo2XnuFK8DteJ2QzgzG7eOYQGI+QpDLr2ZwPKgXP2buztkPqdK96dp0LCNXk6okx
         eLw/R0yKvcfjRiu6P+BDM2LHAdWeFCXhKEJwQcOp05OB9h9DkyInWzLm5C+DtKXUbLxl
         6tLGFAEPFrw7WQQx03fi6yiE5oq59zn2+0Pe8OnI1OH6tOcIVaz4hej28q/kU3vPXQ3X
         BBRwIu2XYkfgfVVkYtFEYQO6HNxW0+WTJecfcyQ1sLN0Zhq32ULLuBaVXphxwV0JA8dx
         mqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779042095; x=1779646895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LoX2V7qBQutb0MAbEsVo9ahJMEdN0hI3xKZwjM9Qtvo=;
        b=HAA6Wy/xS8wjY3rcC02urcpgurjGA9jvRXhJCm41EtblPui5Ukkc+ruAawZp0ApvHR
         zgBeZN2WBg1T4Pr0iNhEfXzadVB2MkMFifrw1WzJ62THCAP/I1c8ykuUzKEJQxy2hwCQ
         fIRjRVXbC/yGs2tttDzVYED7IOYdswrXt7Ca2bAYyj/McikYnfN81jAeXvaUfVZlgeuh
         XO/uC/wxhQ0nYmi0VaVFz1YkOrIcjQ/jN1Kdf5e6cZy3yf3fzfve24GsTfV02Lq44LPd
         HKExHlnq/ZnmcR1307M1Gbya1FkDQR47mTtmhDAxhMwzjZj4h9isDJqQ9Y4iK1mb6Uct
         rZ6w==
X-Forwarded-Encrypted: i=1; AFNElJ/l/Dvi10zGFhnKqnppwL+PsReViweowkNScENWIGgPOs5DU6gSbJViyQOVsX2ResKcclj2QzMEbnrwjKTI@vger.kernel.org
X-Gm-Message-State: AOJu0YytRZ3r7NFBOPStRBZeD3Fq3sVLWAh0DDTEWKX26YyLeobhTbEq
	nyk95NiKQH3JQPMLcElnmwhzqILBI+4VTq4ENAEPJc8S5rSlGHnOkWctj+PqL8w2ueHS8vybsR5
	w92RcmjMkGV8ZBUKtwjIp5k2pbjgs8ocfxA/3xEfZEBUZ3fvlZbiJboRztzb0ZmgJtlQX
X-Gm-Gg: Acq92OGD3HIwXmbCgH5AjIOwDRDqqaBla4rDdUWrbbw+D4xOrCfek8cxPtljFIAnIJt
	5YXVHyORxsbi1OEpDD0UNlE8glSuyO1AMMiDlfh7tnMu5CSVE/kL9xluYk1/Nsad8qnFUlgkMOU
	b04NZ90eAX4qqPvVyZr5XjqJQqRxcvIMv17QQV4zOWLj6ZWvq89ZZl0amJv2SBPdGrL8dlK+pII
	2BX06JJboKxYVXhkABsLbzLOtXF49JHdWRDAi0vQWxnvFugS10WicFYEhOlEJOgnFAH+k9lUgFK
	mP3dwyA0okPBvcGchCkGWlyZfsghdZyCdpyltKz8zAha4gqyFekgfdp0zc5zEzs8kL9Akd6lWuN
	eGp1ur5dvAofh3BEB+yYoggH1qnXj73X/9/I2poH5JHtLeNIR55o863FMiX/6dxBuFZy9XXf4Uv
	Mxpl8j5UaVeTO0xTuu2j2QjKTeu4NUJGCOsN05/19ycSkHQw==
X-Received: by 2002:a05:622a:4d09:b0:509:2527:d789 with SMTP id d75a77b69052e-51659fde5ecmr182600411cf.6.1779042094834;
        Sun, 17 May 2026 11:21:34 -0700 (PDT)
X-Received: by 2002:a05:622a:4d09:b0:509:2527:d789 with SMTP id d75a77b69052e-51659fde5ecmr182600131cf.6.1779042094390;
        Sun, 17 May 2026 11:21:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39588281540sm6793811fa.1.2026.05.17.11.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:21:33 -0700 (PDT)
Date: Sun, 17 May 2026 21:21:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stanislav Zaikin <zstaseg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
Message-ID: <h33qy74eg74kjqetnq6vnd2zerg5szedxapsknfhndhqbwn6gk@q6ocp2teu66m>
References: <20260516090853.2873223-1-zstaseg@gmail.com>
 <20260516090853.2873223-3-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516090853.2873223-3-zstaseg@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE5NyBTYWx0ZWRfXzjWXRQIIjzW4
 /Z+y9xfuNNaANVL8zB4AUHTivqwE0y8/EiHH/7soMav4wClBLYwdtK1mk4V6TQoApLtjJxa09su
 6eQOpZI13UWNljkuNbgtyGt1CUPOlB2xqH3+T0xiFCvEC8utSFgRVf5RwQ7TmT6+PqPe+EY3qlb
 lMs8UXTvSM8zQo9CyLYF9+1gDksCsBRHhgDtb7ddLOPvcYA6stS9rOdYLT6oNjKUuX/q1Gw3wE7
 bu4nl9RPiXG+luaVZBF+XtCNZt14m6us2zzrDkm/mj3Mr7vWlJu6LSI+TsSoN04GDWv3zklnS5v
 YgOjJyGQU3BpEFbkG0Ic6u78sDq1upHmwCBU9iAv9xzdkyahkYkdgyAjMaBZqzOYT7Ev7DZ3GZc
 Lw+uCLCnbakVdHBwdHLZTatdFtFQD5sgamo+hOOdhXAyMUmr8RpNUPc6Xk/g8r1Uu5ff6ELcv1v
 2DOZ8UmK/JlgoiGztNQ==
X-Proofpoint-GUID: ocpSJlC34O26QcOLDj6I8aEnaku-PPgC
X-Proofpoint-ORIG-GUID: ocpSJlC34O26QcOLDj6I8aEnaku-PPgC
X-Authority-Analysis: v=2.4 cv=E5v9Y6dl c=1 sm=1 tr=0 ts=6a0a072f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=mRJwLWP_GvxiHzzCRQwA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170197
X-Rspamd-Queue-Id: E7FB556311F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108066-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, May 16, 2026 at 11:08:52AM +0200, Stanislav Zaikin wrote:
> Xiaomi 12 Lite 5G is a handset released in 2022
> 
> This commit has the following features working:
> - Display (with simple fb)
> - Touchscreen
> - UFS
> - Power and volume buttons
> - Pinctrl
> - RPM Regulators
> - Remoteprocs - wifi, bluetooth
> - USB (Device Mode)
> 
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    | 908 ++++++++++++++++++
>  2 files changed, 909 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
> 
> +
> +&usb_1 {
> +	/* USB 2.0 only */
> +	qcom,select-utmi-as-pipe-clk;
> +
> +	dr_mode = "otg";

This is default and can be dropped,

> +	usb-role-switch;

This is a part of kodiak.dtsi and can be dropped.

> +	maximum-speed = "high-speed";
> +	/* Remove USB3 phy */
> +	phys = <&usb_1_hsphy>;
> +	phy-names = "usb2-phy";
> +
> +	status = "okay";
> +};
> +

-- 
With best wishes
Dmitry

