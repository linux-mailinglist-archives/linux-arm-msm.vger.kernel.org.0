Return-Path: <linux-arm-msm+bounces-95153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UH5hEZHtpmlKaQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 15:17:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FFC1F1474
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 15:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BA4430FE8CB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 14:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C6137189F;
	Tue,  3 Mar 2026 14:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="odY8+8Q7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IadU4h/a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C944372EE7
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 14:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772546942; cv=none; b=FAVyUwHIkmat2BjT4ms3ZrltfFQTcLY5wNthXydVIXpXOK2fNTdNDJNwR98+X9jqlseS3Sh7xYdr92oxety/rsJO/Za9awVwU/EHnlSN6py4k4MnCXcVPAWpvwYzkI8KOBHkhh6Kuq7WcwgnP6IRcfran+dEhjwBX0GCdPjPZYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772546942; c=relaxed/simple;
	bh=faSDHhihodhAAZapBzc9nwRgrgfGpD/hsFZnLwRBdd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6Qg9qjOHXfsQ4RhPHrgFATglQSYc5XZMRWil6mv9OZOU8DjPVpXMV1QrTToGu+16ENcpGy0JSOQ0O94YT7JpBSu4fO746Rt1mLFR/hw3vr9rB80xLEIK7CUp0mDPLpvXtnc9DoJHNAjNOp/ETKwXSrKfjKB9TZgFDxcDPeqL6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=odY8+8Q7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IadU4h/a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239nL9a324031
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 14:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vA9LhWu4c+RxWCGc7dLNVetf
	L2EcqY9KkAYh6iDyUdc=; b=odY8+8Q7h6mFBSbGzMyefsQSplK4vPQHDTdhEeZu
	hNC+DfHogEfH8Kmi3tphAeAOvbwvzNJh5AbBoMdzLIUJCBSefcy4vR/LYu/dwdZQ
	Ud2Ks3G0Dn9yGzWghEUUPDAkd4gZO5Jg2ZnCu6PpEhWDhbDznco0Pqu8rJ9yHxSZ
	wfA7Ewkp9KuOr+U94Zpz1e0qO8oXCRcrE5oVEogCUI46pNammtq6BmPM3i1Lao5y
	Ew+vW7tY807G7K8Ale978o57ZT7zZyXEI07Y2sOLqd4ShWr59eDyK59R+dtIUjn9
	8EAjLDmcmTZCqMmQ3VVMt4VgOlqJIXF6Tc1qn7fCfWmdEQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cncmfvb24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 14:09:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb0595def4so4809300485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 06:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772546939; x=1773151739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vA9LhWu4c+RxWCGc7dLNVetfL2EcqY9KkAYh6iDyUdc=;
        b=IadU4h/aKaMrs2wrJ21WczDfdg9Ze2d4kBlBiPvRQKJI5P4p1BK5DuJursBZBblxLf
         jdTT+8TDHd0cxAxA+MkGEKCX2CA8GciSNdE+HlmhbJXnWVJthWSiZxhwcTMA5QOsCTWQ
         80PzwQxDGY3ZWoskB2SNpM9dq9GUIQxfWpIo5btS7xAW8lw3GwzLXmge8jqgUydSDjZM
         Ia+D6ebF6VC+XAylOX+1/Y9T6VTeDye0zlmcHVXCMtglpW7Z2RSyQnGz4SCr3xmBnkh+
         6LWJDyeekTbdHw/DR8AujF5tVPfUOX8f0WnrujHZdVWPnHI/efCEP99yb0eYkejIegL7
         es+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772546939; x=1773151739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vA9LhWu4c+RxWCGc7dLNVetfL2EcqY9KkAYh6iDyUdc=;
        b=lIjuL8HJqYPPBUbAilS259eFB4IB9KDT9Y7u0enAuHSKhZYBfWXAt55G8OM/y27DLA
         GUaS5SmeNsaansrkAGKKsazN4N5OhKSeTV5BP16Q1qZ5O0/DnjV8I9PtGGObxTATjsqf
         XNe8K1teCUm2KPFe1uyHj/BzUs3GMmm6FO0xIckJh5jLE+Ne/LxQMZkBM/zmJ5MWCHXg
         z5LldpZVbz0uVrDkHiNZVA25p9GAO6J26kliW/iFZOK5OIM+AUc0+5OuS54O9zG4pxLw
         Bmt88eNcB+RGog4H7xwg8/x9j4qXZl53uNNGG1r2Y7R7/v7egTZ4EX55ovX67bm7D6JY
         Bw4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWiIdvuAZwLOC8IVrt0KgIsEdqKKeRVrJK/rj/ZdGX6vU9ccxciDhEZsgRfcb3eCyRDpkCfrJJNLxkkj0p8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5lbIII7I3KbTsXFs+Wkpwgx7rGvRyIAK5J7qYcJ0kPw12LrQO
	712d7Qbi553zfE8J5ZOwwPY4LYpGxMzzQp9FHp9Bg79oLLb7rIevkgAP20frLxY0Yj5UkBYQn+x
	z8s6hZmyQA0BOMwMVPDUVIbEi8D2Z0/9fHwoR0ABBflONYjir82nAPb0xvcBgwa309r+P
X-Gm-Gg: ATEYQzwY67pe3W2EISTT1TI83fDKk5YinbXKiw+4/PobnUnbm5ubq2uA17XV83Lnvuv
	WEH+NQtaV9lCBf7KpJKGIcFsapdWlLW9oqG4hHtgnps9ek24UyJpEQj7Q+sNPMJTjF7J3x1ftlo
	08xU+OBsyNmbAdEJfRelBUVbB4o6IXXiq7Ih3qaGXXpr09UuFN8OTdCyLVOegzJrdG7vm6gas+l
	HCbDiGs2KzEGxIpwtONrMTsAv1PU2ENGQiRmh8/dARRLmtB8nD4SP6gO5+jguTzANDDn2vXYouR
	4KNSBo7mhac0k5JaFM2745QI9FOgrNbDbLY1zBygiOMPYL9kttGOXFlwo92dxxTIi4T93E6K1wh
	iwOXatg56bsqQp186eMU1EUvvmFf8uvUvq6XPXeVSulkzp4COJRuTeQbZA+fXgg/LZDaXz7ioDh
	/cGaPEnlJIgOiq9GxDUX3BPtUdmG+6tLTiVac=
X-Received: by 2002:a05:620a:400a:b0:8cb:5c90:dd6f with SMTP id af79cd13be357-8cd50bc2f3fmr245466685a.32.1772546939322;
        Tue, 03 Mar 2026 06:08:59 -0800 (PST)
X-Received: by 2002:a05:620a:400a:b0:8cb:5c90:dd6f with SMTP id af79cd13be357-8cd50bc2f3fmr245459985a.32.1772546938750;
        Tue, 03 Mar 2026 06:08:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2ffe01fsm32041621fa.26.2026.03.03.06.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 06:08:56 -0800 (PST)
Date: Tue, 3 Mar 2026 16:08:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 7/8] drm/msm/dpu: Add support for Eliza SoC
Message-ID: <tybhaz76xj6spq3kw3dys24ynx3unpvyimb2skmz2djofxr72d@rw5l475xjkth>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
 <20260303-drm-display-eliza-v1-7-814121dbb2bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-drm-display-eliza-v1-7-814121dbb2bf@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Br+QAIX5 c=1 sm=1 tr=0 ts=69a6eb7c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=zHWNXANJRpzq94LBRZAA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: s6W5xxKozASws2nxYg_d8UwAxu8ls2Cs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDExMiBTYWx0ZWRfXzIEjvjLGkkf7
 sKyqq816Cpr2ECadUOg4IzyCf4iX/mbkhW5zwKRLmMjxz01OBWSCdY6cXtD4Kw1VNGPNn6Dem+D
 Lb0TGCUrlw/U4DNcQgjoncW+QEui67XT3/W9lGP98MCvzEwuO4zzFVr5E1ltjD2JeLsV0GwsCXp
 ElldUVcHL+5Jl3bYaQ3k8otbl7Lr52FTdoJk2U+6PI+NPTrl1xBTPn6jYgCdEvw1JSmcTzxfhZo
 kGXgQo/ZvaIRqj0B7y3f1tNvXUD62NjRpetgn8s63CpVAEUpasLTU+wrRdtazHqabveqJHYbfZb
 MGDeoS69PGbKKD/03HoA9mCOoJE/iGopCuPwcsbtHirVBmkOHrjwfPG3P7sSdqvBIvrveRjb4Cl
 Gp3znTdL/WALix/7ZJnHTefqCF9HvKn2hbkVOaMBI6NhpY3x/curFIgwejwp/GQB/XYsKA25BUf
 ZfvGH/IKWrPVT+7rY1w==
X-Proofpoint-GUID: s6W5xxKozASws2nxYg_d8UwAxu8ls2Cs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030112
X-Rspamd-Queue-Id: D8FFC1F1474
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	TAGGED_FROM(0.00)[bounces-95153-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 02:07:57PM +0100, Krzysztof Kozlowski wrote:
> Add support for DPU (v12.4) on Qualcomm Eliza SoC, with one
> incomplete/skipped part: HDMI interface (INT_4).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h | 365 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 368 insertions(+)
> 
> +
> +static const struct dpu_mdp_cfg eliza_mdp = {
> +	.name = "top_0",
> +	.base = 0, .len = 0x494, // not verified

This is very weird to read, coming from Qualcomm employee. Were the rest
of data verified?

> +	.clk_ctrls = {
> +		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
> +	},
> +};
> +

-- 
With best wishes
Dmitry

