Return-Path: <linux-arm-msm+bounces-95660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIrNDNWXqWlKAgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 15:48:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C081213D28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 15:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD878327512D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 14:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98954387570;
	Thu,  5 Mar 2026 14:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dBxqYvA9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bFN55yuQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721BA3A6EE9
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 14:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772721139; cv=none; b=Ov+jEQ7fSYyDwS1g8qk0nqCk3m/l9f/wx5jOAtpOck8iTmy+eMGgrpdJwuJgWkc7d3+vPXrljz2dNJ22n8PyfFxWQhX3fcCyVyuELRC52BJ31VI0ksPqk47SDS6tZQKCycTiIM9Du/JPBLzVY2qvXvYwcJu3JUrLeT5y82bmkd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772721139; c=relaxed/simple;
	bh=XWHn+1ZPDu0FcapTL44ctzL2aOejDqiTvMTJMwQPAtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aKltFXMDEg/ZpNKh5tBNf/bSSxantFKENyGUYxMNUCRuDOb8L0Tvv7JUr95muNUTcFk3lNHoNdsx5LUZSV5u88EID7LuF31kHTf2MSSvy/k4VFdXxgNmqUDoFXRft6Zx59mlMGrgk54/46vbN12+PqE45lpfhQUDIBDA8vjJZb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dBxqYvA9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bFN55yuQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFpsW861642
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 14:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z9t7wjwaSPH7MTmoJHEvGf2G
	IFWMJMag1Lhetr+FOmc=; b=dBxqYvA9e1DoQUi6qOJNdncGEpxiiTsPE9Syg08Q
	bbyR0WngQzLWCYNZB34JATCS8+MgaxS+p0ODRlF7yMDi8FGmtbbm3jZTaUFhlk8h
	+MIsHiNZGiY+k+c1OkHBKy4jJ3bLoH9rHXl2I8/dZQ87an4SMMkmaI9ZDq+E/PE1
	f61/fNg/Cd7WcBWsZSNRb7Ziz2pGlA2vaylzVLZ6XmV+jS5sIbbWtEIJRpF2Qcoi
	GHt8uk2gLRGLRMggO9p0JvlZTuHNVANXBsvtedmhrtz1Qme8TOPPPlhga/vC2VqK
	Yo43iSycI8fIdr4JtpryUPbc5GxaCDG0TdF9WWKhNGvSLA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wbks5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 14:32:17 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56aa4c99c9cso50749686e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 06:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772721137; x=1773325937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9t7wjwaSPH7MTmoJHEvGf2GIFWMJMag1Lhetr+FOmc=;
        b=bFN55yuQ/2mNoOmhBd+D/TKaRr6ia4cQRZz+VfjqJN0D8Vq1AGfR6BEmAc0DDmfEhW
         cGe36iGFB+OMECIvsFCtSIVcgcls3DNifdp+WukhIhRGmDBGmPrFw7IGdSME8GiNPgJd
         DlRqNaLEhphvlu5+mEo7t7lfwvvJvUjicau9VSZGdeYbyoBT5mbq8eMSRMr6E0aYm5la
         v8IEzub0V5nQRgv6tlOg4abtYNdak3VCqnWzahaTP7SlP9kCPva5BNY3Sekce3W6Dka8
         W7qtNnuYp7eh4Z6sdEbYeWc7XhldMnaiznJE/PKIVwHcCg8SMiwQh2uUaZZnJQFdaPay
         e1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772721137; x=1773325937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9t7wjwaSPH7MTmoJHEvGf2GIFWMJMag1Lhetr+FOmc=;
        b=WKsZQfZiio/DQYdktf69Rt6b0QW1kUpi5QEotGuvNhaB8WjMl2ayKkcHM/MQUuFBr9
         bbWoE44VRLLbwd73FrdYram9QVFJJd7bbzPxYyNdde+yZnZ9xzq0YJXo4WvxbwXT9V9Z
         NZwDSEHl1T+kge9f/azQ7SPmKR3i6lZo1G4mp1MB4FP372y7RB6sv82dDGLdfFoBrtJ/
         xTWargxhZHMXa1XBdwa7nzMrvv8mZd2YjrXmYDHmL+eTscsQjgH1lfBxRQ3Oz9n/irDs
         yq7mx5LyPHCNaO797PSazO4LB2iAsVvQMwm+q9JB4G+LDiqdBRSy5EPiP1uD/IY58Nat
         Mp1w==
X-Forwarded-Encrypted: i=1; AJvYcCWCahmHC07lCgkxQZ5GQ1Mm2aM/taXO45zAVoLpBQnyV7KvWbxHCprMcXMcBsyOSV7vyqPtKBB6Fzd73qZJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzAKMv1DcaHq3vKNpIqUcE5MEjp0CsZJe6YH4mXlyUk6DM+hRrj
	ZrbRJtaKodkAZrGN/Ph0Um/Xo/5XYSWjziweaNVhqdTIsGIGUngN5KAMqPWrDu7yvLboRneyDAG
	tat85paVhbtTYraPrg9zAZ4U32zjL8fDGmKX0U5kHN9or5WV6pSKA0jK8fYjpNautvPw/
X-Gm-Gg: ATEYQzwXErFnHFRzRa8qiwbl8p1JxVWIGinpuQzjxlmsIwH6QFiS0PPQ9wOUvF5uJ75
	v0EXw6PDnKGJjJgrARNjc0ejJaPGc51USGcLOg28/KvmJ4CCo6eVhYgSzwJHvhU3OvqWa+eX7hU
	3eKVt1syF4akRjDD0a6c8R1doFP9jaaTS43fEi8+9OWv5uI4AJWn0FZjr3p0UhGpBQyAKFq1YYd
	rT1Sbga4Aes8+KJ3u/s294lSTp4K3KZ9I13N2T321DG5l8lzJ+7z25G8GGAuFw6KXcEBIpY4sdD
	NSsAyKUEzFjTZ6uCnx58AI3Mjk/mMmSN31VDH0PiOk6iPhmbQm2ZQqmIXjUhcWcvH+2UbPKibJm
	9VLWSgGKyRtd3WT0jOSxiT6To1hOer4VnqbG+V2OXL33hz1OpEjn9qdshsN34CwmKSICQQqUMLB
	L036Pheikd9pz9lKw+SmZ9RNyDHbLv/zqx9gs=
X-Received: by 2002:a05:6122:ec7:b0:56a:92d8:785a with SMTP id 71dfb90a1353d-56ae77a2c83mr2575244e0c.15.1772721136791;
        Thu, 05 Mar 2026 06:32:16 -0800 (PST)
X-Received: by 2002:a05:6122:ec7:b0:56a:92d8:785a with SMTP id 71dfb90a1353d-56ae77a2c83mr2575192e0c.15.1772721136252;
        Thu, 05 Mar 2026 06:32:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a125c65f9csm1633905e87.86.2026.03.05.06.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 06:32:15 -0800 (PST)
Date: Thu, 5 Mar 2026 16:32:13 +0200
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
Message-ID: <anhregq3m6axyjozkrmcaeh3fkbmxxioypfq74gar3kl7l5vew@mmmh2fckulk2>
References: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
 <20260304-drm-display-eliza-v2-7-ea0579f62358@oss.qualcomm.com>
 <mo2fc5oalscfgagdrj67aa7xssnugsara4dartp4ycsdvoyvwv@swzmdnwtij6u>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mo2fc5oalscfgagdrj67aa7xssnugsara4dartp4ycsdvoyvwv@swzmdnwtij6u>
X-Proofpoint-GUID: DPy-e2Ei44k2ppYvYJC_3hAQoIl5HkMH
X-Authority-Analysis: v=2.4 cv=BNK+bVQG c=1 sm=1 tr=0 ts=69a993f1 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=RHq2fkPijMoWQiYS0DMA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExNiBTYWx0ZWRfX1yR8CPFKyEaN
 Saf2uWCf5mh05G2rLMhdUf+jm2cqJbsh2OgEmNkFithIWqJhM/8punUj5TjoEADKyLmLoJX34uN
 IDxkMIq6kJsK7NBaF7ckBCaxBDwlZsFbtyauGmGec71cVSCWp1c/6EopBshvZ6lIofWmhkcw1G9
 NgxaejBsw8rnmC05QbzWmgRLyqnsRctFoy3s1u2TJVzPUehQKqlLyFaXhpvCygEUsqUVmoTkm5g
 8gzpcYLtaakd8aJwFeYdUZ9rJd6rciosr/yKxTMrdYra7WxYYFz3nkcbNGqHOt7dvNG+P9YRMNF
 EJXminDlvyD1jsxOzWy03QcFyAhUbRMpM4blqasuHosy3ZiZ7txfD2YZ1vPuZdcWcZ+WsbSD8hw
 SRcXGorBC9+9ss/Dpz8ZDNup6G5YXRw3FIgtMBRkFHvR3il3lKkPA1NfkJHgaQxywYBool6nIu8
 lTA5yI5QS51/XqkiHVA==
X-Proofpoint-ORIG-GUID: DPy-e2Ei44k2ppYvYJC_3hAQoIl5HkMH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050116
X-Rspamd-Queue-Id: 7C081213D28
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
	TAGGED_FROM(0.00)[bounces-95660-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 04:29:43PM +0200, Dmitry Baryshkov wrote:
> On Wed, Mar 04, 2026 at 01:58:49PM +0100, Krzysztof Kozlowski wrote:
> > Add support for DPU (v12.4) on Qualcomm Eliza SoC, with one
> > incomplete/skipped part: HDMI interface (INT_4).
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > 
> > ---
> > 
> > Changes in v2:
> > 1. Drop stale comment
> > 2. Fix INTF_3 controller_id -> DP0 (Dmitry)
> > ---
> >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h | 365 +++++++++++++++++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
> >  4 files changed, 368 insertions(+)
> > 
> > +	}, {
> > +		.name = "intf_3", .id = INTF_3,
> > +		.base = 0x37000, .len = 0x4bc,
> > +		.type = INTF_DP,
> 
> This should be INTF_NONE until we support MST.

After checking more, this is fine.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> > +		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
> > +		.prog_fetch_lines_worst_case = 24,
> > +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> > +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
> > +	}
> > +};
> > +
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry

