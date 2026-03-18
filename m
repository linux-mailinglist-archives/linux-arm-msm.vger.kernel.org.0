Return-Path: <linux-arm-msm+bounces-98401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NunJn1/ummTWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:33:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9052B9F51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:33:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AD255300E5A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F9F37D12C;
	Wed, 18 Mar 2026 10:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T+31vjTN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VyHqYQpP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289D8368268
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773830003; cv=none; b=ZSX3WwtOV8PzIkjWQnXY1zjExHQqrxgu/244TJeu3CmRXokHCZRG/S2j1gODfTG0E3VQ+G5TSdLyubux9DvcN1H31A8veZBk9q8t5b2sToQHcG7l2qqMdplTRmV49+B3pYTPgtUNp6/GERdzld2Q/GsEBIQCvQwpGYQyEhNUFzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773830003; c=relaxed/simple;
	bh=jMhoYVy7d251DCb9pk1mNjgeGeNewTlVnKkv9Gj55Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HnIvtj6iN0HfIxqoX82hig3fzC4xCIMKZfdSVy9pNrvZ2hTYio7zNYEdrB/RuoftAUPaBNGXDdJbX5ixzhyYHzuxzPSAsUjdoYzg72JQeO0tKPc42WH9FAnkaQbzNCB2aDuHbIF0s3a8d/0YCuFmGYhartd14uNtiVP0nk7PPJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T+31vjTN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VyHqYQpP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8RSG42789334
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fWLzgEvejqGVEZGku9WVSoRg
	A2RFcsMHbrkalg+j/Dg=; b=T+31vjTNEvnXwl8KgH4SaE18eAGRW02ns+Di28GQ
	kai4hsO0X/AoLIClJDd+AgDUbTUUPD+eNDX8Q81EDakIQikklY7Vix56fh2VFGu9
	6Jj8LALCPXI8PCBxdnbQSRli/lvSKtJOlzgbLdCVLtsyMbWXqY6UhQO2FNoyEHE9
	8fi+qC95sUMVb71L2/hn+vwDozERreKUY4k9+vyQqi2GDcwoQR8muZKwrbII6t0z
	Cv4HtNNSnQYthhWnaLNuJMnkEZJPEJYnp+zrDUbXZSIdByCQ3wC+qKqrUNnAXnEf
	jZJcXS2kfqAUaXGY8tagSzxymWEJXiVoWuYukvy4TxYzcQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4g248x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:33:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50920055f0aso49487411cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 03:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773830000; x=1774434800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fWLzgEvejqGVEZGku9WVSoRgA2RFcsMHbrkalg+j/Dg=;
        b=VyHqYQpPBetqlJB1guJUjyfyYpySx0sqy26FC/drfVxNvb5YaNCARyCrRvGiQeFBU4
         XutVw8qdJlLvD/wiJJxoESfRJnKMWlPnXrZwAoIdWuPnHeaJaDPDTWdn1DygTIRY4KLf
         g2e0tvr2nOCmlErnuSlDHET+8dYIMTZ5sVVCDSEy8NQRtuJSPJuDnMGzXU1oXQkYdine
         osPPou1vb+1nFWe4nzLnvjjHe/ttGKCZ+aDz4aA9Fyn2Ibt+IksSbk1sBxzK8rXayzBf
         astv+Y/GlSLti72o0B6oZMEETdgr/KGdzpMBmMnVnT90bGl1zok9Mv9w7m4i4HfIUq/r
         +/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773830000; x=1774434800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWLzgEvejqGVEZGku9WVSoRgA2RFcsMHbrkalg+j/Dg=;
        b=laqmxpIYG126g446gkz5j5fu55HzwmnIaKffvTGWmQwue8Unmhzisbo5Nq6vGCbNp4
         3lg54J5r4YTkPWvKqDSmDU19NZd6LrKf0QTgX2HkxBf3yMbzKXEPmTQ4xCykkWBsD4YQ
         EIOf6USufzFGU0yDEIMBIcR5MIZqvPE1Bx6qHVEwOQCfL/XbGgqrjUAxuv2e/YbXn5XP
         MwZ1NVUdyCRi9bxQgDS8mLxFpuRVE1hnWiBbts4NVMEh43tDmbiEe1z4+IdhUVOK54Mt
         S5HluvmSiJRpPXgnwv3pgSjQ25G6lM0P57SJrWmE+oJJS6JiS+bms5a/3SRAo/8hSpN1
         STvw==
X-Forwarded-Encrypted: i=1; AJvYcCXrqYBjwVJTsNAjympVnwCSJZC0RZRRRfbfH3l5Bj5F95Sgwz3h8ckuLS/qDtAtVVfMljLo24xf3SaUUd+O@vger.kernel.org
X-Gm-Message-State: AOJu0YwvNTC1XNj7V7rN4V2ABq+OLHNxWEiEg9T8fd9Ii6Ifb1ucuxNs
	O+Cq/V3cG1nm7COSI9w2D1L/zEjkQEZ6N3YPblmb/kBBOGX9oY1Fe1xjObFofCmpclJauuFQEP4
	drB34L/WC6BIyqFNi5trBpQUX9figWHBVd+3dhXuo5iY9DyAHBlJRqILM57gFel1a7+S0
X-Gm-Gg: ATEYQzzjMWAW68Q7+0jd1iecLcTqeYvuyyoT5WMZQE8qSifOTDt6jnNH2ZcCDtizkfu
	nRl2RIHhAIwXHme6KBTH+BXDrdMU4tZRyufey24ra+/dfl4Rz6rNtxOJV/Yn2L1EaJIr4NtMj2W
	DjV54cevl1rWB0SCYRLIls4CYxDXK55WIS4I9hU/oRk0/qXzjdI+OiUzyp5dAejJooBLTEK9oS8
	4Wdz9rWP2f3bsJbxlA5KLQrXtjB/iIdya86aZLNYK3hcQrEzcFpo+HQonhlXTbSa3v2C1tfq2Ov
	yMeUymldskkLe7MKwq3pdXzjJsYFLnS2KlWQupAVD46QGD4Hi6Xqvfxq6wuHISyhmgbu3VfIWJT
	k5Be9Lqmleqm4NeEwJNIC8mbCTKeT8fyrlyIzWOIwFWaWmtS1auz0NaeB4QRD//qQJgTgCKkVsS
	VbytopuJaytyKjC5ac+zoF+0N1cpbNIQS6cLo=
X-Received: by 2002:ac8:5e47:0:b0:509:13f7:6534 with SMTP id d75a77b69052e-50b1497327dmr33543111cf.61.1773830000339;
        Wed, 18 Mar 2026 03:33:20 -0700 (PDT)
X-Received: by 2002:ac8:5e47:0:b0:509:13f7:6534 with SMTP id d75a77b69052e-50b1497327dmr33542711cf.61.1773829999901;
        Wed, 18 Mar 2026 03:33:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd54d538bsm5512451fa.35.2026.03.18.03.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 03:33:18 -0700 (PDT)
Date: Wed, 18 Mar 2026 12:33:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v2 2/2] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
Message-ID: <rsmy3hiw7acx6jkz5tlqxwv7cnugmdcly2eti4mnzlr456aldf@axdmfqz4ix5p>
References: <20260318-dsi-dsc-slice-per-pkt-v2-0-0a1b316f8250@pm.me>
 <20260318-dsi-dsc-slice-per-pkt-v2-2-0a1b316f8250@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-dsi-dsc-slice-per-pkt-v2-2-0a1b316f8250@pm.me>
X-Authority-Analysis: v=2.4 cv=TPhIilla c=1 sm=1 tr=0 ts=69ba7f71 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=RAbU-raeAAAA:8
 a=EUspDBNiAAAA:8 a=a9twGay6vry5l8bUFcMA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-ORIG-GUID: sh3cOEB8S-PnUn1ufY-hkbFQFQrpSpLw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4OSBTYWx0ZWRfX5h3u+Uv640cg
 I32O65mVG4Hb/hsbxPKEZzb5Kai1QzBh7ayqcciRDxzaCUx6kIt4y03PyKXSGpTO90Lm0Gk8ZjC
 x5k/0ZshDCYMHrN3I//0aYZs2FFdUEvhhVUnbfPXrYw5Yrl89B+N10DDjs1vBTAOoq12fgzrql+
 p6HEkVKh6XmVqkEmN5ljnwCngML7mTTA36M9ML9jgt8+cqrGUT6gxOfiHx+UGwW6YRYAl3pwp/X
 KmHDDtV9rRdoNBl+sfMFTpPejDKblXcPchbcU6a52JIgtLux1Itaub1mUlkyaRbIgPCtLmNz+zi
 2GWKEkF8XQ6yalHCSPHkxRG31nbz7bko8jMatVB9j5m9CwHxw5YGOjTbfEWImQy9MuWD2A1096/
 MVfIFE3lyMdGm9uTlqENA87STodsKdrgRNf+o5PQNA4P8PesoHRVc4ONcd+tK2Pm8Gm+/+yO8fh
 vhmoU/ZDDEberJZ+eLw==
X-Proofpoint-GUID: sh3cOEB8S-PnUn1ufY-hkbFQFQrpSpLw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180089
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98401-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org,marek.ca];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,marek.ca:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,pm.me:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5E9052B9F51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 09:54:08AM +0000, Alexander Koskovich wrote:
> From: Jonathan Marek <jonathan@marek.ca>
> 
> Some panels support multiple slice to be sent in a single DSC packet and
> this feature is a must for specific panels, such as the JDI LPM026M648C.
> 
> Use the MIPI_DSI_MODE_DSC_ALL_SLICES_IN_PKT flag to derive slice_per_pkt
> from slice_count, note that most panels are expected to just work with
> just one slice per packet.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

