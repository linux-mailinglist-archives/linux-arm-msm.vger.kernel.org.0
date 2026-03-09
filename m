Return-Path: <linux-arm-msm+bounces-96347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EA+cOqAor2nHOwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:08:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B690240A5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:08:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 708FF302255D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 20:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703A92EC553;
	Mon,  9 Mar 2026 20:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pORC1Vps";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kJaIK8P1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D83364926
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 20:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773086729; cv=none; b=a5dmROk5ABF0LxWCLVYpS3x7iNajnxoSexB/maZlcUHluGss/1Cseu9HCULG3YIoOGR/5Y46HnxDrrHg8K/dZS7zzIzr8QSNLq1hfNOfyRit5y87ElghwLz7TD/POLLaFX3LFnqWek57hoS53iF5AxEs9OEdwIaMVgh0ztFhxvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773086729; c=relaxed/simple;
	bh=q8dO/NQFKexI0qXT9fHN0CstjQWXf36wBbNmfe7FV4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzBzvmj6AaUgC9Az4uRCnuQmJkB0sDm2t4VIksPpzU/0Ozmr8uPC8JDLYhaHPywuY3e0HHsAossR2mHUnCVAqh4ZVRplFrCMuUt1Vdul4Dg3XBLGu1JM1P9cswiFkvWLSOqsnRSJei4QCKC/MTsEAGMAyTxlXVjQ2pvBIZY3y3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pORC1Vps; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kJaIK8P1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBnkO1920907
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 20:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xeRzbPs3nephiBgwqlRT3QBj
	ZxWsr0RY9H3pBHGUHLw=; b=pORC1VpsYJow+k8nceiN6xk6S7lHffHF74xQ82xc
	+I+Hvf2GgZl83etUxxWD8Lh2aNOQUc+5IMPqm8YzfJSDrP9PtEEI4ywcm9woLmhC
	ZvNs8dKeqRlQ1mkA7ayVSbVkHV5vIxMOJR+/vOq8O72K9ouEvBXceLIVZAKJEGZu
	868tCyxAqoEgOuLPTaw2fA6WPgYOgybaGCdxdKbWyztOd+u8SKQfJsLfV/SqZ0ew
	GKEUbkyc0TosSEJ+5q2UOOMB4ZXoanmZVJ5rnYTz4nzY5Pkwvb+Xmf2GjY30yYCY
	+MdTiTQZeITmikXPS8U8jk9RHyEVggtn3+LAJefbhJLDrw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csxy81e02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:05:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7a25c5a9so1125770085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 13:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773086726; x=1773691526; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xeRzbPs3nephiBgwqlRT3QBjZxWsr0RY9H3pBHGUHLw=;
        b=kJaIK8P1W3RaMcnRfEVWHQkxax9buUiBglqolwrHgELN58kpZIzlG9ReddWYfXwm9G
         SpiJTTxvaJvq3zVG15y0rP9px3cCZcFq5I6v4AKZ45cAazvvP2ExBpjh7+oxdG4skzk6
         gpjcDZsZTmkfJ6Kz3XswsoOzMTpdlMxKeWQM54YTvRFFxkiKHPQQfdZnmx8z4vCsWqEk
         dzuglBbtgk68kKKMc/5gOW1j47ALNJlhiVu8csbXzH1SUIeWkvfMZcabX7C79qkwTkDl
         9+eVjqBS7LUuoeoGoBWV5yjRbwfecx9+8S9NHiaXw+voFUgt2lLm0BhoqEQmpxbLqUDm
         ox4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773086726; x=1773691526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xeRzbPs3nephiBgwqlRT3QBjZxWsr0RY9H3pBHGUHLw=;
        b=RocUFFmfgH3R2sgmNtt1+Jl3GcCDde7ICH0SDDz5f1IXFGpjD+unTm/XBATgOW9jGI
         jK9xg4O8X87B50DJTvcuvKjF8Xkf9gVzX3vaXTZP6NU9QhFf3aphXljnNcF6XzfCNJHS
         EVYVJlSHK38Cq0M0MOsOp/4y9MXvgQ6R/HsXtjSK2RSWL0j2mWE1b2KaOFGBJYh+Ve+J
         yZt7K/Q6A2WbWdQL9yXcDZM01EDz2xbK1WtKAbs7LJig2LnZj9zpvI0gxF5ZRIZabWBl
         Aj1GPIKm0JFjPWiS5tYBNkap2C+dDp8dqbE6vhm9GxbrrIGv5Eqk8kQOvRtRj4Ql9HQv
         cF3w==
X-Forwarded-Encrypted: i=1; AJvYcCV6gio34eVIVwzVMM34ag+XUwKVkTmzGX0OYZ/TGm9Mz5e7N225L7sVpelCC2V+6DEnihZUiFYy1D99ASOm@vger.kernel.org
X-Gm-Message-State: AOJu0YwpxgO/7Q1AKw6hhQFcNB4DnWQ0sokZiFVs0vowA/MVBTBhnY8w
	d71KRDGLxMUzcTT/8EAmCenJRrhM3DL/pAb4YoYUkkqpWCC0tFultq4gEH8tmgK9WMB2Yne8P9J
	GtVAUwMfWGaDUmeFK33+rNDqWIAMKtRrGH3b2DP7f2N+iFPkM9Gdmo/uU70yGbwO3Spr9
X-Gm-Gg: ATEYQzyrIXxJr45+upD86NHyACQ50Bui/PLXZcB5daHl79BLtzIt4GUtVwvYBYLYliT
	pWdvGrZrvTmYNlfUucLEr6AoxIgnR8lUtBXCcJeFJ9XjH3IlD8wC00j8/17kduxonGEbSE+oyok
	2DFpM561Tm1k+tsV06xICJJhgPXOSndWtdF5vEmQvowW16ayH1K41rtySOJH15TiuJ9rG8kL3DT
	X6QfmF6dxBf71zgn3q1/N5sfeU2YlRtNR/M4b8bxH18xaJayMyVDO5fTGkYgzN7KDmNBR336dS7
	8d80QbU1t8o2+cqgVywgbP/OMN2iFilvUFNtqQaWKdoCTB3HnkTsXVA5lHKxX5FZvzew7RgmydV
	9EAok/973+ojkXJ3mgnw0rrp/V5RFWLPGRHT8imJZTDsc+XxR2Vvszyvf2A1J83K0PvdPkUTTHD
	lSOJ9Q0wnUc/blV/d+tvTqvDQWnCG09kG44h4=
X-Received: by 2002:a05:620a:290a:b0:8cd:8f18:d1c0 with SMTP id af79cd13be357-8cd8f18d44dmr335251285a.27.1773086726386;
        Mon, 09 Mar 2026 13:05:26 -0700 (PDT)
X-Received: by 2002:a05:620a:290a:b0:8cd:8f18:d1c0 with SMTP id af79cd13be357-8cd8f18d44dmr335247985a.27.1773086725969;
        Mon, 09 Mar 2026 13:05:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5d045f5esm984971fa.29.2026.03.09.13.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:05:23 -0700 (PDT)
Date: Mon, 9 Mar 2026 22:05:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] clk: qcom: gcc-sc8180x: Add missing GDSCs
Message-ID: <2s6wvutzb6ovsmjigaugpzapfgtt5enq6tf5gilf3fk5r23sgl@nmg2kprbknch>
References: <20260309010214.224621-1-val@packett.cool>
 <20260309010214.224621-3-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309010214.224621-3-val@packett.cool>
X-Authority-Analysis: v=2.4 cv=SvmdKfO0 c=1 sm=1 tr=0 ts=69af2807 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=OQaGSiDE6uMd9YZWTaoA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: eBXlVlHzfR-xfCpmtYJu82fIQv168gjp
X-Proofpoint-ORIG-GUID: eBXlVlHzfR-xfCpmtYJu82fIQv168gjp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE3OCBTYWx0ZWRfX0wmCeuyEl3VR
 rDQ5UqSaDJbTqi74GoWNOF66Bw+AdIjN8PxWSnHWApiyZPIf83GF4nowE0ZhmB/ZcM8UdW6IC6V
 /dvHg1L3IgMmEbmzAgekPCV5FyW8LFJhKQNFSCBukB8zaXK2prO3rnWIM5e1yYbNnGj02Kfy6hr
 4wdfdTdWE+PCGjpp51W04dpvuQl8Zi4b9bgyA5zDVTnyfvWqtfMt8P3loveXKjv6jlzriA2rqOD
 k9nwH1K85BU9UtSIjTm5/n3ERcknEa7L4WiNATTTHGmwJq+ukZ+2rBPrhSuH7mP2SPXIePvKkII
 mYvOrg8+IMxrhAIwSjlx60L0/ugT/uOjhtpZQuzxtE3A7RHc/zA27tGwQzt7F41kZRyFFzXyX5k
 C1vaGyzHdvZ+P3abn3pDUkOSLMhjYe3y/darj9EJnIEHIoQ68M2PWuz26+ApoyESSphhonADIAU
 X3AFkU4z7Uc//QKwrGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090178
X-Rspamd-Queue-Id: 6B690240A5F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96347-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,packett.cool:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 10:00:24PM -0300, Val Packett wrote:
> There are 5 more GDSCs that we were ignoring and not putting to sleep,
> which are listed in downstream DTS. Add them.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/gcc-sc8180x.c | 50 ++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

