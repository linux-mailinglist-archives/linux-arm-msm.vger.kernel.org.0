Return-Path: <linux-arm-msm+bounces-101822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HpdHxGL0WmALAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 00:05:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3DD39CB67
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 00:05:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA53F300A11B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 22:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153E0366072;
	Sat,  4 Apr 2026 22:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j4kv9ThK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ug9y7LKu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F5A36604B
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 22:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775340280; cv=none; b=YwgLbmA/p8Y3g4SCZ1cyxRKuJ4Yb+sUoyuE08cTWuACrD+/yInI4VToqXQ0T3CwWR3zm7lC1PDmwncZGy05MO/Bxf8IXG03IKYwlHa9awlRWAJQ5b0PnsgyafYPtrmde3BC4COWeo7BOblPj8vuy9Taq1D6RZonxyFzH2v8kfJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775340280; c=relaxed/simple;
	bh=Mnenjn84goxGc+F9hR03yqfMbnySvASBDwsNf1LA+m4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hrU6WWEOQmmygOcRBE2JZf7QR0FSVOf8aYsOJXCPWhdMPt93WiVHwQiGQ8PnGl8kqvxs1s0DiD6wWrkPKc2FUNjayAbwaEgiCWvlL7WazkijPfc3Zue6H92Zm1TRNtrx2oAV90HkrDK64gT5jHteSpN0TMZRIT91cTuXxDzfrlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j4kv9ThK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ug9y7LKu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634GtS0M1234272
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 22:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dUW0RwB9Q/zSV2QNFW4FlByk
	kVTIFbYnaBQQuw6cd1k=; b=j4kv9ThKsVHyPQD0xJtUDSegpJ7WEFA+Fi+DGRIz
	2zROxRvor8BfJJKnEUdUvkErQxbwIbKlttGOZh+XtyEfYeLRqGniuJf7lBrJcinv
	jZ0YWyqhXLi61BqtykR9UJYfqJR1FtquEIACdqcqc2HNBV7tkMWqanmNYfXoZV0l
	v+30h3ZGlJsI+KRhPA/yBphQ3pH4r/E39TgEbswMtXfoDO6EK+Dmlcwje9x5l4C+
	2Lhm/XGJWBdbgN4ilwXkRSSC6a1tzqTFVnzZXFeFPQtd4GI/pOOmdUiJlRCPZulq
	+jR4p2BGL0pMOEJVXpPz6qhxWC6DWhydj9bW7KLVr+yKHQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daudd1fgh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 22:04:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d6bf346adso33192991cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 15:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775340277; x=1775945077; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dUW0RwB9Q/zSV2QNFW4FlBykkVTIFbYnaBQQuw6cd1k=;
        b=Ug9y7LKu+cn/69aY/V3zHCowg2KgRjSp7BewurXBtQu8Fxj0oONlDH5BrsOlaaLrY6
         g1wmdk8fY9ODzzPzMIJ4CzHUdSGAb0NTtJEcrYh6zTui6SIXXOOxW2ZcAxhu0XOwkNUd
         SrOaYCVgOmtPBdD5AMplYQVo+1y1cy4Bh3OCC7dWb7FLHc3RunOSq/yxEZ8vw3wRCoj0
         Y+b8ZqDBU7zYi+r116x5ZwUCHePa626LkofOlqacC0SJGtaoz0RnrZPpO2Cn14DZHw9R
         S7s7YqgKZWLKAu9Umv/Y4uJ1uEbsvFlNbrX+7x2TYaPeZ+rLxaFCiD/4O8KWVddzvXGD
         rNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775340277; x=1775945077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dUW0RwB9Q/zSV2QNFW4FlBykkVTIFbYnaBQQuw6cd1k=;
        b=s39NCt0UDpNJ4E1Q4mhOhu18wCU/605668Sp/Vv1TL6bgi8mf0PsLZtuKxL3Y3BwBo
         W+pPA818B9NNlgAPIBMn61Tw8ykBfychjbUc9leTjDYouY3ZbilbQdiZSdpi6EYe7K6G
         5cU0+l3Cb2+1PXlgYkUjWQvRd3so+T3R7U+uIS1iBHJiUItxIdpV1PLeIzDvT2nkncId
         UbnaOatvuVAiILj4OlYvW0Igl8L8SIqRvCIH7KZWgEtZFpcTPENN5+UNhyHl5DQlZ/6c
         KLZeQxpA8VahkjMMk+eqYxl/lzSaDNJbUQcHVNBiwqwQOOXnXLJWZjU7X0C3mKN018dg
         A9wQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOmbAN/CcGxgvcws7zbWLCeCCdnEUPK08Uy2KtFon5aXtlGRyitfuuXRuRC+BC4EMm//GTXzMaYRE0N/6k@vger.kernel.org
X-Gm-Message-State: AOJu0YzPqDemTeEv0k9zPNqEyzWINpqI93UsG2MmqUKMcppMkSAFKpv+
	FlV7VAVRXe9WtoBe0ktN9euPDx7edfe2RBtOe/j+m8jA5nF1mKmQlyF3IRVM8gKzKN6Q9Fe7ywQ
	G7ObD3igLFlMM5+zAmh7rcJzYQ2dNTbQF87SMUSMCw9zOfoREUyjXCbYkO0OCIkJuVBOL
X-Gm-Gg: AeBDiet5pYL7BtMrlXyEsf3RRnrrBQEiDY55v8x7AHXmqEv8ox7/lSu0XMfp7NdbjeT
	12MfEkOp6Cf3aQm0XPY88bYJPW6G23sTYYQWnp5nTKpcFzrygDkhwUVkQ7rpt89LwwVoRTcF0g4
	Z6X9RigECwpT4qtCvvNWqlsdGck4H69pMMbgqZSsxItgFZwygFx+Y+3bkCIygQW9SgWMnhwueDv
	YkdFXtCjpsDDreBxJZ+T1D56rR025cYxqwuSrnskKrEfrx1FIZzqxWPhl2jCpWEBXZ8vzcml+aU
	c/v8ybMo76zGCzmTYviD8Xw0nMnLQ/Kxx5O/KCaLwFCxTv5/t9A+mFhq9pSf/BO2uyZf0fmlGC+
	mxZ0kPg5oAa9unVXtYyMb+JUu5+AAxFN2YTkCOPpBl/1b8nRr/TB5M60MNfR3x9kGP9twe3XbN3
	H/hppy5tM15leS77Yh70rog/nMZOizLP0x2FU=
X-Received: by 2002:a05:622a:586:b0:50d:8102:e9c3 with SMTP id d75a77b69052e-50d8102ed29mr36229141cf.57.1775340277231;
        Sat, 04 Apr 2026 15:04:37 -0700 (PDT)
X-Received: by 2002:a05:622a:586:b0:50d:8102:e9c3 with SMTP id d75a77b69052e-50d8102ed29mr36228611cf.57.1775340276788;
        Sat, 04 Apr 2026 15:04:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd212a940sm21365631fa.29.2026.04.04.15.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 15:04:34 -0700 (PDT)
Date: Sun, 5 Apr 2026 01:04:31 +0300
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
Subject: Re: [PATCH 3/7] dt-bindings: display/msm: sm8650: Correct VBIF range
 in example
Message-ID: <xsspzrpmlxtmfageptdvodf4bptbnd5msvelhr4tvjvj2bznjm@jicwkpbukm5o>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
 <20260402-dts-qcom-display-regs-v1-3-daa54ab448a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-dts-qcom-display-regs-v1-3-daa54ab448a3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3mZAWrpe-Bs3GjyTPfi0wR2jZn0wMG4X
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=69d18af6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=vvC85rtXJxrRrxXJzTYA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIxMCBTYWx0ZWRfX58j3K2oHhd0F
 kyrCMYOS5ZsGmd3y/QeEUSf/pwxPMwmy62gCUTZEZuzoPAVdWvdWbQaznw/pEIHq/vu4BELEYZA
 cAlAuP5huNr7OtwY1tn5yGwmtgRAgZPYXVF6Fk4/H9c2KGxpRqE89RkgTdbR4Wd4mf1N8wGpOel
 6wQL7eqO66B2/7LJ6feTcJ48nlWfnuxbqIjYcIyiBqXNuXJC5lHi46sZpwlEk2OvzMwWngKJSnw
 D18FIRfXmWL3U4mHrtdqSvNGdpXFl+4zyswAKi6Eld5c1C2cRmm2AnPnTTWgAjAzPA1FheveIfP
 nw2T1aps7bLl/AKSojvUzDVVUiCEwBNxcHtwCw6fCES/SI4ld+4bPzuVfR9R1m/XWioiQOa7woe
 IQx8wTRmLqpqRhOjM/SPHQ3S+qeg7DE0UqMkGoyeteDlcSJJJy8gGP+dsby9r/xg82RhEWKDLr/
 TDjFAmpi8OsfFb0dtrA==
X-Proofpoint-GUID: 3mZAWrpe-Bs3GjyTPfi0wR2jZn0wMG4X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040210
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
	TAGGED_FROM(0.00)[bounces-101822-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: DA3DD39CB67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 01:45:14PM +0200, Krzysztof Kozlowski wrote:
> VBIF register range is 0x3000 long, so correct the example.  No
> practical impact, except when existing code is being re-used in new
> contributions.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml  | 2 +-
>  Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

