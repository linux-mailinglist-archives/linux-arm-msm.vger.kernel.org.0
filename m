Return-Path: <linux-arm-msm+bounces-95349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPkRE0dHqGlOrwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 15:52:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7658201F62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 15:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0D63309521E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 14:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D48837474D;
	Wed,  4 Mar 2026 14:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJqCBfB0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gFS887cK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155A235CB6F
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 14:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772634590; cv=none; b=DERPoyjzEeOErELsGjpYESqQskgujFr0oRQcHJfjZwYDJR20YWolWpfHtFyiRNc8GqTezNOgE/dQLypCfcra5eZDBJI0ZEsl70H6BrVxK/nV+YosAr2xjeCBo3EpXSqSqtcl7iLaGIJ4KWd+YmYHO10TDQ9aixYjn7ciztSDzY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772634590; c=relaxed/simple;
	bh=Z2LC8PMWLBDnhyfICO9t+8ZqiBF2qp+Z2cmaj40hR/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=duylvYo/THrchck3SeZj8YnKxfhBrRcTP4PsFnuwu6Zqr9EDtAbV6ulgge4+iZI6O6Fsf8XJuNnbX6WVtV5/2GexNXR3cFrJOhvGuY4UZerjI/WdxqiizKXswndwtk461R/AQZvzcI9UCNGqaeg5L1N6ZItRQcMm3UW4BkXLdZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BJqCBfB0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gFS887cK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624E0XdW029304
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 14:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lAM0lLkLhAfZCHZbUwD7qSCj
	DT4hN9TPL8tFOeuxmUI=; b=BJqCBfB0qKdEQVsK/2X15m5IXjAdc5KRuN8e/Xo4
	vi4ro0xCEUv6OFDzLXDcsh1/STs1snGMX+15LLxHZfJxfwCf+TNzMMBTaiDxHx1B
	TyTnKVtkQB6vGH22fa1F/HJKKMbYOqdVCtv2UGs/6X4pbaFWVNwNnnjixMPy33dh
	DJdZ/gu968JpVuKUCi7gx4Xp4egHOMt7R1dwm9EbFD8PDogFutbUUeUY+yzch3WN
	wU42V9A6qitW259GdmZK1mSiugBRJuzZJOhjwUSnB75h9/KFV0Aus2FO4e/Aho7b
	7Y/xWiMlB+f2RsJZ++3MTqkdwnDaUXf8HZ23eqnDwYuK9g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpp4fg37a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 14:29:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899fa82ebb9so208952676d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 06:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772634587; x=1773239387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lAM0lLkLhAfZCHZbUwD7qSCjDT4hN9TPL8tFOeuxmUI=;
        b=gFS887cKCpSOpE9bh1Ss0lLhjfiH14eDNeOQkigQAO3kSZ3ulnszt0sP/8UsN7EkvD
         WlojCCCauQCDL5dUDSqYGDveoAH5+7UWCcA+zTDIO6gz6XW4V6eXnB00DrmDrWvLIWa5
         eQaWNUUitvNWmY9L2RFVSk8E8m/u+D8tWN24oSnvK9w2cLc1t5M3xD63QMCO77AwU5J5
         UDMbdHgb1LIHQHQWHa9BgXlxkadz1HPHVh3OJikhGYOGQQCZSMVnBvQ9DNnWHV2WMz8Y
         KQ1ui7R7/EoxV/Ib2jKPHGKRiWTCiqznBfaPsnScvZMtfx3OKf4j7HM0tG7mf4kGWXqR
         xTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772634587; x=1773239387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAM0lLkLhAfZCHZbUwD7qSCjDT4hN9TPL8tFOeuxmUI=;
        b=Nc/RfOH0Di+bHERIRUIPgzGK+phdI40/Pr8ZIM085sImEUAe5+Dtqy/9emFn4kFn2J
         3C36OFQc/O9jT5t/udWb+guisHDfPOph41mAzFdoqsuuF3a62w1oH8g7VJ7ESqH9ya+T
         orKvPTOi1C1alkbdps9bvuIOwWwHGBWf7dPw0rMzhQUeWPvwThPyaTTZ7GxPUVNZfK5w
         kREsHVH+VJzYl0wdkQbdnjszh2adjQBe5zjGnyzr3NntZQlcdz/yxvd4JsJuDJh+3Zcg
         6WFnYL+w3iz913D9wO3CdMsZpOb/mlzWnPJMpmem7hYQoOI8ENrcgsOSe1d8O93IzWRq
         Ndag==
X-Forwarded-Encrypted: i=1; AJvYcCX/85OsG1h/dNDSlyHL+dACLJLIMMbEqIA6xluHwNb6s9Wu5GtHNWlmvfN13fZg+ZL+VHiYpiO4shySiI05@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8GW+8LuDJ2i8eTyrGJrzxhzh8C1spCEPHnNIsngkEnse7MrYq
	g2KkG8+oH7/cCjKP0MVqFpkn1jfD5t0PRZaXiHz4/BEsNMSsjIf5gxNkBGVLBBo1LLv+8dXpb1W
	O2eWQIPKHF6MRjqGKoB8e0PJ+zUsDJOHRbeajNSMSmr/m4HNdm0n8Dg3JsS74CH69zFiP
X-Gm-Gg: ATEYQzwUvmKceecmnHM1t4CZPCSAf/jJu0ab2d/9WsVgLR3aQ4ecaJGUzSooH78DVE+
	jqJy5+l+NDqG1PbiCNa76lGhmQkqfsZpwKRTUal+bepu+hHwg2f6vvmY7HduP++mBnWZaMDYJam
	Pg2zTltBu1XHhoI3p8xGqw3y29c0pIntt8wkiJNVLFWn0JTP081MHDw+ZH0aL+nGaveo3yTlj2v
	TvP+rBYevxzsEfoLiR9oXj5tUVmmu29w1XMrCbdZ1Xq3refyiktlagkukWWzfRWJ7ZXqkdyY62/
	bxJp+eulYRKxe4sqJQOwcPFtAmPHXTARHMRjOLX0LZEgEEo8sQ7McQurV5o4Clir7LM8rlHOfCN
	uoTA3/p8FG0taUbL6UABaeGcAhdfulbZGlt+2Ofw1jDDSGI8bVM5dfse1DkLQUZyvYNL6SeMCjH
	aR5CESFItvrq13SN3/MM2CroyMmq/Gyf8kSXc=
X-Received: by 2002:a05:620a:28c6:b0:8b2:1ee9:dcfb with SMTP id af79cd13be357-8cd5aebf056mr239661485a.8.1772634587187;
        Wed, 04 Mar 2026 06:29:47 -0800 (PST)
X-Received: by 2002:a05:620a:28c6:b0:8b2:1ee9:dcfb with SMTP id af79cd13be357-8cd5aebf056mr239655185a.8.1772634586679;
        Wed, 04 Mar 2026 06:29:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f3016bf6sm36955351fa.32.2026.03.04.06.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:29:45 -0800 (PST)
Date: Wed, 4 Mar 2026 16:29:43 +0200
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
Subject: Re: [PATCH v2 7/8] drm/msm/dpu: Add support for Eliza SoC
Message-ID: <mo2fc5oalscfgagdrj67aa7xssnugsara4dartp4ycsdvoyvwv@swzmdnwtij6u>
References: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
 <20260304-drm-display-eliza-v2-7-ea0579f62358@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-drm-display-eliza-v2-7-ea0579f62358@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: X8cGgT8IIqwiISo3h8RyR7-C-bkyvdf4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExNyBTYWx0ZWRfX1R4L75f96zBv
 kgrioOEJ/p+pF9t9MBgrLnzLvNIygKR0PofMvtUFN/DWvQI+XRVvrTjpU8ttqvKoBONUr11AE9L
 iJnD7gK+iNF/CGg4UnYPeWPmCdJTlutAOuEsE0v4O3uYhjsNpjjBSpMHmgLdsqND9t1pC/QI33P
 erO0uAlfjAY4gV9FBjA8z443qhSKK5jt4jB61wEE5PWXA2M5IjlIAGn707UPzh2M9rUuWBloG78
 7iei0BTPj1SwiKU8pxlNNTYG6SAhAE7mVI4xBoNUQMEBQEAPnZbEsayjj4EKwz7E03lEJz9k+bB
 Qe0kNF3jryMbAkwnzI5FfqtHo71+mhMXbh1l7uixlouT0jrCaDdK7rzZcvINvuf2Io8AI5566Lt
 fA6iNKh9lGwnHSv/Eh6PGOgTktV+R1gP8Ffx4P53IqU+egw95aw21iuJyzAIIoGNwmRiHIjnfBT
 xbZD8TLGX74sJX4op7w==
X-Authority-Analysis: v=2.4 cv=CdMFJbrl c=1 sm=1 tr=0 ts=69a841dc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=QXpS1DXcpoi-XtrU5MQA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: X8cGgT8IIqwiISo3h8RyR7-C-bkyvdf4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040117
X-Rspamd-Queue-Id: E7658201F62
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95349-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 01:58:49PM +0100, Krzysztof Kozlowski wrote:
> Add support for DPU (v12.4) on Qualcomm Eliza SoC, with one
> incomplete/skipped part: HDMI interface (INT_4).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Drop stale comment
> 2. Fix INTF_3 controller_id -> DP0 (Dmitry)
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h | 365 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 368 insertions(+)
> 
> +	}, {
> +		.name = "intf_3", .id = INTF_3,
> +		.base = 0x37000, .len = 0x4bc,
> +		.type = INTF_DP,

This should be INTF_NONE until we support MST.

> +		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
> +	}
> +};
> +

-- 
With best wishes
Dmitry

