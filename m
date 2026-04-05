Return-Path: <linux-arm-msm+bounces-101830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LFVICfE0WnINAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 04:08:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FC539D0D6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 04:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAE66300A3B7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 02:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47663264ED;
	Sun,  5 Apr 2026 02:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHS5l1IT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="En9P8Jg/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EED11A3029
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Apr 2026 02:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775354916; cv=none; b=XcEqDNI673l5zlgKEzyEE5zsLSEKp/o8jLzUKj5xelztDGGzOnn+aQOvg73Laqo+N0EGIVFHHx1XXziNu3TzSx897t/nFUfYkjxJilPZv3Qnp8zHWCoamuAN5fG+nqrx46XSAqII1gOWe/HOANL+L3N8kZJMzHZMJU5G2KguFlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775354916; c=relaxed/simple;
	bh=UZR6ZgaB/UQAWvVOjh2YYmG1g3SH8G2W2hRAX2qTbHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVHaHz4Rqo4460q3PCD/7tUQ4Ig5StTI2m08Rzbd3lEn5Mftz8DFwchq3jYEHE4Lt6aKoEhfOB3hMGmf+5Y4eBtxggFCPYt9VoJDiHPt24g3rqmIVNQZVXgofGbpz+pGxeW6GrEt1QhnJhuKpigdEgKuma01eI8brCk8fOD8w0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nHS5l1IT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=En9P8Jg/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6351nHCj2775409
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Apr 2026 02:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FQ+C8B2+GVFz9XgKRp+WYhAw
	NEfDJtAsm9FbCzmQGDQ=; b=nHS5l1ITFHZKIKuI0GmPZcrEMbMnkXpdrj9oMD2G
	kIXbsvtUqT82Qs5C/TymXJ1Fyie1F33ms1HB5FNJYBj4gvEXAzvBYB5+pJeaR2Ce
	xgfbLVd3owA5Gt3rjQAOYa+eWVrdAkpQrgqEnrI2jovouKz05dFSWINLJiWVrTcK
	ZHwrpdEk+fkVswwhH0g7YsOrZBLgnkfOYhXmHjDMAw3F+Ok9xZ9LS6jVzkVwMnYY
	zrFA6hVFoLlcfjfhyH04jAQ32r6gZcM2XOTQKvshB/6qyLgMdmHsOtX/rzpKxtYq
	jNeD20cpe46TShbSCrMsQvHV+O2e4wrAU0QuoGKuzc1yZg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasn5sx34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 02:08:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d76f460b2so34371391cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 19:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775354914; x=1775959714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FQ+C8B2+GVFz9XgKRp+WYhAwNEfDJtAsm9FbCzmQGDQ=;
        b=En9P8Jg/LkpLsqVcdZqb4H65ikLz8g88Hy6w+4wnGYUNXZI54gC4FTbGIjyQQdntjJ
         HkZxl2M96s2JEpNqQRhdSbeWAitUk4isHy+B+XLOByBddyAtw3ENaaC6bIhGJX931Wzo
         BdVVHFnnwRxQd0RrBUtiw5Uox6BSA/5Ryjji/dkW4a8lCEHr27UBwxFYPf+JVmmAtFSt
         hNSnCqipy5VOrYFWmXw97y/kJrvFACWVPk/6VHutBKEw3xq2V+7Ivyf2NR35EjNbV7dy
         rm1QKRYr0ttfnzZOgu1uF9k7ryJ3f4Cc67AnASUYwnqdfrJYIKyFWhZhBBqxmMuAz7K8
         bUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775354914; x=1775959714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQ+C8B2+GVFz9XgKRp+WYhAwNEfDJtAsm9FbCzmQGDQ=;
        b=BfqAldiROz6bM3283ANd7kIK/6J8zMEWl4T/ykbWuZH6R8L0HG9lf1gJ36iGLywUWj
         M3cEGXFCNWsrECFY40K31BK8JIfaBARdgTUtogsNDBCEA3lSaKRbQKrYe+wYWGeptPYm
         FXTg4kZ9PwtzGE+Nm84KMknzYM1fyViQy/VhT5wfKutwP4Bppj77eB9QgQS/JtfjfuCG
         TwT3/cyuhCUZHIlpWzauxWxDQxYD6sUlRmGjgpM+3s22P/ntEHxRRUlvVkvXZ5ns5fnX
         /U5F5IiLylaf9f5A+2Zys4a8/x1c1BVHlNDS7pHnNtJgHhWPIyKx6Hxzp0oM6z2Le0fb
         qEDw==
X-Forwarded-Encrypted: i=1; AJvYcCXfs0G6l9eo3A2TX8XMhoaV/sTGBZj1wjbcj2xEnlZGVUi/xtS720056Y/S5wWcz+87tXXX3vkxjdujTgy6@vger.kernel.org
X-Gm-Message-State: AOJu0YwvgxlXi+TpGM7bZth8F/JwPNuw4FlhPKw1OUt/MjwcytYvaO3q
	DQnTkvXHMFirqcExO/O5olwpt3dYmdMD/iYpKE/mdylPtmOVzVFGJV+dOqbLx/lzQSHZNZQcN0c
	RHeWQwr7TEBKOUmJUbQQfQmeLt5wbTbKRlxGFL+eM7AnHlXv4r2kvsbh+hgTC7UJs/Ex7
X-Gm-Gg: AeBDieusfN29rQPSyIckxoqLBpn5lkyP7IfjE3ZJmc2zIlr16L7DZ1syKARTA2RVJUp
	zJUfGrV4/72LXDAoxsZWrBctY7sAp5KQ2YFMXM3rgRe9NThESCvOGAFoC/lWn8Tg0+I45GNj9dJ
	RPr2KV/G4XcA9KUbT/UICKJ1A1CBfAjD75cbiNnIx4oo30JB0PS2DAsQZPlG+Fg4rFMrPMR5h49
	YDSpX8EvF59wEPNrcqzh17LHqPE55GZbRsFy0gufF9jBY2PYqHD6nSF6nxFbAl9CuPQmTibAHYy
	LIOWVpcCK4+Eus7XstjMnUoACulBXOVYbDfHxWUpBkTW8zs+icbw3q77cz1JNX7UWNo6OporDX9
	jKhhyM+lOB2ADcTSRFC+loD547lGSvDW37qlFGe5Zn4wwHAmFCK3rfvAhVKapYksA5nOaCwL6c+
	qQLWykW5PfGzFS0QcI3p46MLlWU8QICqB5/PM=
X-Received: by 2002:a05:622a:1f97:b0:509:2b5a:7ff with SMTP id d75a77b69052e-50d625009c0mr131779481cf.10.1775354913904;
        Sat, 04 Apr 2026 19:08:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1f97:b0:509:2b5a:7ff with SMTP id d75a77b69052e-50d625009c0mr131779061cf.10.1775354913454;
        Sat, 04 Apr 2026 19:08:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccca2dsm2426269e87.60.2026.04.04.19.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 19:08:30 -0700 (PDT)
Date: Sun, 5 Apr 2026 05:08:29 +0300
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
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm8750: Correct and complete DP
 address spaces
Message-ID: <wg45gdnnkqulbmo7ip4drddksmd27ronqen4mftspbs7tjjuwt@2ymjmymxnfrn>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
 <20260402-dts-qcom-display-regs-v1-6-daa54ab448a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-dts-qcom-display-regs-v1-6-daa54ab448a3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDAxOSBTYWx0ZWRfX9RLB1tZbOMjC
 TtHmeHHXBxQISSrMmKBxOoveA2lKzZukZAxHXornuGAqoKxG3/FAjG+rd/zT2AWnknY3qR4o9Lx
 R7dZ47aQtU5YN+w9NQdYloOyxHlx9ShFBR9dbqyFWP42y2sQDjvPuU5dt4kS890jw0m7Xi9ItD6
 OZcDSVnpYxbBpkRDTzmmg3IpVZWcMH47EZkWnIbM0ZokXSb9lnh84xFkRfAmUj64ScuoEPXQXVj
 syiaJdpE1+lRUWO7eKG+ARZLN8Vbbsxqzkev/bdFJ3CoqFq+ZI6AY+rfFQCxQg2kCXl2REDT1bC
 trtQll8ml83ITUJ6bswy1i73q9uLrr41QStUK+RuMhuucDermcGv7GtFuAnJnEwNQa6f936sJu3
 8GWy0H/OOsi/iolOI5EMkwllW4WhUevkFVVIhN2GwzkayUhQhB1x0bUrfEpS2KxpP6xSCo170ED
 2HcVxhMoXrE9zbCxM8A==
X-Proofpoint-ORIG-GUID: 0LPLHzO1HQwtZw171lo32CbCftPBEQw_
X-Authority-Analysis: v=2.4 cv=K9wv3iWI c=1 sm=1 tr=0 ts=69d1c422 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=EqZgH2Tm9vfPv3d_J88A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 0LPLHzO1HQwtZw171lo32CbCftPBEQw_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604050019
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-101830-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 19FC539D0D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 01:45:17PM +0200, Krzysztof Kozlowski wrote:
> DisplayPort block on Qualcomm SM8750 has few too short address space
> ranges and misses four more spaces.  Complete the hardware description,
> which in the future might be important for full feature support.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> dtbs_check success depends on the binding change (first commit).
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

