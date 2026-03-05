Return-Path: <linux-arm-msm+bounces-95662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEWAEcWYqWm7AgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 15:52:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9903F213E17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 15:52:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3483530F6CEA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 14:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B30246782;
	Thu,  5 Mar 2026 14:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PRAe/0Eq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bFR/H0x8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707FF223702
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 14:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772721407; cv=none; b=VF3Hk9sCZTxM5bRuEVcEiAH+Hpl6HShWrstdZ4JlP0aoceTw7dyc+tobSLGC3ei97l6tageYNYVziWa8s1P0KsQUyCG3Ad0+zVbnOk6hvASihr78kiHFgGmFCnpjoRylrafKe7jsyjvK9k7R6WEVmqEC53sZmkaxdai+5CjqA8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772721407; c=relaxed/simple;
	bh=W7LcSJDO+SmcI9iBgRwPWOz/I3O0rsjVjXKttw3Rl4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jat+b1Jcy4+NV6Mrr3+AyLUA+NE41qvimP8nuIwk0aJO5R0z6YH8/tajwL5EzNSxMAcrOLVGUmpAJJXeqVlx8Qn2PJnw4jHJXJE1jRhBYizD+XRmqtdaescErGqdO4e6hQv3WtfA5jl2uNWW5eOfFvFmeDFgJ6+DwY+GYzT5fUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PRAe/0Eq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bFR/H0x8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFfIE2922564
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 14:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M9kOZ2oA46DkDMvPSWIl1WyV
	VW6X0vR4sjQ/X/1ot3U=; b=PRAe/0EqEiMjUGnh75oi1rvpcTT0bLSMo3s9Mvxc
	zmQo3yUTTpMYkV+Qnv3XTcQsEV3nq/TqKC2oJCwnbWvi996MpDVwUpc2p+VGUX8d
	bPZikNWVwBCyiT6dpp9QvGWuKlBTRq36joBp/7+CAlOZ7xU6y+n3ERgQ7S/zrHkJ
	574GukIy8tl90hWjHr47GEEw4USQGd4A3Trh9LIbmvgXWQc5hPK+fsZDo+hrqy27
	fOv+tmtvWyYT+qT5BC24UpTdG9vJXz2YqEMWvex2MVwkRPN2OEcr1vKnUDioRQdp
	cGnmlVXHFBmw6zL7YTTNr5cCx1sUb+fUgoju7D9Hb7MVHQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq2q81xn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 14:36:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71655aa11so6832794885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 06:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772721405; x=1773326205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M9kOZ2oA46DkDMvPSWIl1WyVVW6X0vR4sjQ/X/1ot3U=;
        b=bFR/H0x8hoMoJ5A2WqrfD/3OrdIP8ZOGC1U5BPnysmfmpj9mnpHLyrvihi8qvvJFy5
         eXUUGAQM71WWSSoFpqoY0KW/fMhveL1dj9I3NTBAo+/WYIyA17lf55BUZ+CouR7Jq1jE
         JMABFM6H/zvdWBZaxdVcRT93VC4h2GzafqxrXuHsXblI42OUB43RmMaXf8mNjIorLr10
         U1RQhpV+hzhaOiwJMh0bXdISDSoQVcJu2zuXd+b3kzOvpfutvuf5MV0sKsLraRYcbH9E
         7aBaNr1OqCJc+VNRdVqbpcOt+Zy7ZC161fa1X+Hl4KRCgwaG/4hEunYz6GHGaRauRTZ0
         XdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772721405; x=1773326205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9kOZ2oA46DkDMvPSWIl1WyVVW6X0vR4sjQ/X/1ot3U=;
        b=NewJpTSPfLXpspmMhNTKPQnRUKmMHBOcHzTbQwtHBJz3kBKHaW9Xwsd8Ygy9QNh7Ke
         PyPIxmLgNjbtLEdMLZPg6hyWaL4AXoUHVJ2CgoJizcJL6vTG+ZdwQsIAE25uJND2R+Ps
         h5IkjIBvpbtbD2xJBFx1E2KU4pcgOhXZFopY+Ptr+BkLUBxCGms1vqACqvBsAGIm2l6r
         FfYVkBTLdpKiQ9jxNZJBsf9P9H8bP8uXWYo/Z1o0GiM6P2evv3aE5ttbXXLgeimPRD8b
         LcDpYSnuF2ofMv13VwAfPft1bYMyAVBMsCj22KQ3JwFF0qTd357H736VhEPmvOspv1Ll
         U8Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUingC8FDqqnGKcXGuZ9fMopH7+BHn3b2WAYHemMD4j+04F3BCQw4dQ/ZVmlP/ZvVc0lUxIzHuMB7LNkGaq@vger.kernel.org
X-Gm-Message-State: AOJu0YyBaGl4r+3HjkGavTTIgZevPH86+wE44tDCDHxFukNRWO+t9fq+
	bLPE2Q9NHbaTCtwPSUU/ptkqgBSGrI6uNEJyrgBk/y1o6OCE/UCrfIRbIDeqlaaM7cRMFsyVnft
	MTo7YgX1/4KyhoWezeF2ljDBrGkQrEDi3dMJ7NmtgbOgZNheBz2honiaxJAbbydea93Wj
X-Gm-Gg: ATEYQzxLQa//FgHwE2sbgzZdvGwiHrsCGcfXweOlkLPtZ2pb1LCDoIB83XIQde1OjqF
	sxkHHDbIv+7MT9LRcoTyrZiZVrqTrbTY4JLtKn89Ne8wju72q0sewyuOCGrKR3TT8kymC3DwXUB
	dnX+yK/QtbAlglxZjjcAP94a8cAY0jQvhmCsDL9lAJtlIjai+Pc2J+ZiMSLxAOlkxjMXitlBuB+
	1dqzNXT3phDeHpTgKpN9KLnQOcyYQPaJTmbB4/xQmwSsm/cXIVQ8gpVZwbMSRIR3FOAeFiHGfbs
	uSYs7XRcVO+AcTtm6kk05QDKyghDjZ5IGcC/M+ALnp5JVTN581ZseQq7p8ue4O6R7DCM81JF+GN
	3GZuSxQ7OqDfuzQ4jwQrvG+XXKLY78SBZ3zbZ2sK9Q3MqGNIlspVhhinbC9tzmIAtALtJ6dLk5y
	jcri7WKZBP+ya2mbSrXutAyutjWQ7WI0JGSGI=
X-Received: by 2002:a05:620a:3949:b0:8cb:678b:4877 with SMTP id af79cd13be357-8cd5afb739dmr742169985a.57.1772721404780;
        Thu, 05 Mar 2026 06:36:44 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8cb:678b:4877 with SMTP id af79cd13be357-8cd5afb739dmr742163685a.57.1772721404214;
        Thu, 05 Mar 2026 06:36:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2ffe02bsm41758591fa.27.2026.03.05.06.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 06:36:43 -0800 (PST)
Date: Thu, 5 Mar 2026 16:36:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, stable@vger.kernel.org
Subject: Re: [PATCH v5 2/2] drm/msm/dpu: Correct the SA8775P
 intr_underrun/intr_underrun index
Message-ID: <ulrmxcsncz5j7hbi446q33ngk63pfuja4pjvbg6zcg7c6kmn5c@ltguvvq6nsda>
References: <20260305-mdss_catalog-v5-0-06678ac39ac7@oss.qualcomm.com>
 <20260305-mdss_catalog-v5-2-06678ac39ac7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-mdss_catalog-v5-2-06678ac39ac7@oss.qualcomm.com>
X-Proofpoint-GUID: _LDJJaIYIi8gyL2D0toSSlo2mz3hICM_
X-Proofpoint-ORIG-GUID: _LDJJaIYIi8gyL2D0toSSlo2mz3hICM_
X-Authority-Analysis: v=2.4 cv=GecaXAXL c=1 sm=1 tr=0 ts=69a994fd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s80QRqCtEMuw_QvzVh8A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExNiBTYWx0ZWRfX1XJHb0RJfQoc
 9LrQXY4KNScc8O9IWGeAFf60tQqS9QwaE2dWwb9rAyCeVpsAsB4b1iS9oUrCrFy5m8uFGrSbKOt
 3W3Sss/QBxZUw87cZm8uUv98UHeli0u6D61Z4EO1LuEdgKbVTQoAFajBaHzul9SPa2jvKpQM8Ea
 Ajx3JfaQmCFzFSNq7b8FNQrENTrWIVSil9r3eX7QbRIwBs6uFJu8q8tg5f/tcRj2OFG1GnKDEIa
 wilGt839OqtmBJkrs5wV6FZWri/n0sH2bJZo9p1Np4HBYEedTnwe6tGAp0eX4i76JEYgM5i4r4z
 hRj4qLUx1hbYhus+aap2xN3xxnYouyq0ybdvFaQC1+FnzCB9ikjWBJPtTWJ4+MBf7kYN3ohci07
 DM3yT7IbyyBi9jxF2otdLGO8NG4rUoB6rOB4KUsVEI4CT7GNwDuYyi2zvdTG6St2WcuabvKb1s6
 OsoY7kebSRq0KKErh2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050116
X-Rspamd-Queue-Id: 9903F213E17
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
	TAGGED_FROM(0.00)[bounces-95662-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,quicinc.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 06:17:07PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> The intr_underrun and intr_vsync indices have been swapped, just simply
> corrects them.
> 
> Cc: stable@vger.kernel.org
> Fixes: b139c80d181c ("drm/msm/dpu: Add SA8775P support")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

