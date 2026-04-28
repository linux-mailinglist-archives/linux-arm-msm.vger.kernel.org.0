Return-Path: <linux-arm-msm+bounces-104974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMCKO+Wf8GkRWQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:54:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 524B048450C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DD233126723
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C3D3A75B7;
	Tue, 28 Apr 2026 11:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RXJFQtnv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oz9Fg+f8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4017A2D1931
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376140; cv=none; b=PHgiBFfXrRPqxHvqVZ71C1xWA4MZ2S9mO6zatBQikUsjY2mX/c0ZffhzJPeNn2Mch1xYt6YNJ0E+SSQ6KIDyJrGAgARcG6jcsM3vv/P4u3Gb+w5Y1Jcs09E46v5RE5L4AM8ZZ64bo4bjoIJZkIDH9UMrdn8P1SBJS2+o2ONLKGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376140; c=relaxed/simple;
	bh=8yVa4Oa7knh58HfnoK1YlarALUP0Pn3nUXpApc0Zn1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RnL7sftD06WHtrhrXVbDnk6Lv75YK+nzubXg1nzQ7ShD+xWWLxLPE3af2HYH4/6Ta9zcoQIF2z8Bx8+JnVfsoV0WAlZcni+Zddfz/HPFWxhyJhtSHWcPKrIfQclO0DY4nlrJ8aGNRS3nwg3hTI7OZg1klJxkAWUVCwgjsWtZGqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RXJFQtnv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oz9Fg+f8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S7vi1O1744717
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A/g1pLI4mNZbrwEdtyTJyNTg
	han7Qo9/UMcQy/830Ak=; b=RXJFQtnv/KelaOTf9xlTgDrRl4vxTD1C+QjtKDFg
	t3bEVbncOvp+pztncf9CvywwaGXy4sp5Hulg3c3+k53tJtQsU7WYEszNKwYCnXKU
	fIJq/e8V0/QDWHWrTlXrxOkl1bNu2Q/LTkq3nGOQjNvBsgBxLvichCTM7x/MEi5E
	hDNS17pgcNpgIri0xLr42lAw/S0ElEkmr9Dug21BqA2Etdz58eiak8Bswjo3kZJR
	Zz3bX0O1Hv6T+jvMLtB8CttFWeQBxFQDsdX6v+XparIxt0wwUP3UBkS1dtBxXATP
	J0fkWPOcVBnHjOiPure7+lvXHRVIqBC8UP/x/ohT7cCwsA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtryd8u3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:35:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb007bc36so6725531cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 04:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777376137; x=1777980937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A/g1pLI4mNZbrwEdtyTJyNTghan7Qo9/UMcQy/830Ak=;
        b=Oz9Fg+f856QcPJqVdXi3c/NxagLB5kb8LjLkpDddjDLn+Xa3OmhspWWq4KK4WlYUo9
         OrOU8+5fQ3DZelUx13Iq0OFAyxf/HNrAiOQ39Xa/9Y3wmHFx5y4meqs9HmX0ARyPmJYs
         itrPJ1SD2E55eNNZ3YeySoW5mCmwtm/Qog1/55NIadOsMYEKNRTpXCyKtUYmueEnrmJL
         4FbVhTrM0SlnTPNT4nAvGAKkAqtIsApOpnsuaqIV97DSBmmvY22y8llMz73ukOaOWMAP
         ryeAgNjixaBMemFkEhVvc/OFEjRp3iJ7x700/50nvaStIBIAXP/i0TbYUYQniIAzv6Va
         QxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376137; x=1777980937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/g1pLI4mNZbrwEdtyTJyNTghan7Qo9/UMcQy/830Ak=;
        b=FOeoAZ/7jrKPBcGpRDh+ni+PSokmp1smbe7ZINLvoxdxOR7Y6J9oduebXXqlRMRTi2
         E3+luTvlIkebyHgfeW0Oqa/ncJmNaGleuphda5TDiNWOHf841JI74u8Pm5PgzOHroX2h
         XHzdunSiDGIvOgZogFpLE0FsVFVCPZBsnIGFcyEX+OEiJSSwWtm5tNB9061dg3+bUKC6
         1kSOFSrA88sLVQVdakLpuEiIRe1AMby1mQGtEwQcVD3JC9qdR+2Zk4C39dTgyt8HyaMv
         czQfKCMBIs5bsK08Z8jiKE2ZhuFqSk+YMvfslikg6XgxFN87s7+83P5MFI39L30XQ3Ae
         xzBw==
X-Forwarded-Encrypted: i=1; AFNElJ86D1sZddVtxZfQUpMXiDCu8Kog8CnMDzLwSrGfjEz/ZVJNQUwGx459BzfOA88rUMVurdlinLwNcIBlWYFB@vger.kernel.org
X-Gm-Message-State: AOJu0YyWEBt2S4AN+Wn3Qc6iruj3EsJ4ApLJdh/FsNC/pW12J8x783V+
	zz/EU1ahJBP7dFx2bqTWzmclVfN7L3A7nnm1r5eJbTeBThAZE5RiyXEl6LEc3iA6cCe20OnHsxC
	ZUfnaymAfHP/KQDztZnYQc59bKlqY9QoE18iqQyvzng+4W8VeyNE+NcHIWFWODviICDNW
X-Gm-Gg: AeBDiesNYESM9FBqBYayKlHDbc2eo/CWUwpTR2ofxS9XN6LbYi8BXbB9qZKbPa5THJ1
	tRJAcQ9Qgrj1hLdpmUQVNTTdsW1OOMgU8ktFaXMl6fsbo5lwEb7P96hPcw5GMgNjmHIfraYVW5Q
	ZjvKBeUYTYxnTzqqd9XyNuc2Xn1WSErDM4KJWR7L1jy6ZTgUZWgVcWEHihehYZBu5HamJa37Xpd
	V4zeipqqlRiC1B/NH/0R9ksl0mRtGt3eqRJPIGyQAUcHmNVLW8q+S7v68DrLQQbS+2N+TXCmaZ/
	zfwGOko9F/XVqL9EAf12iq26czRgRscKXYi3gCzn72Nr9blvUb0b8noby6AR6CLqoocKOENKuVm
	oek3/V8UJtSXgv604j3SuwBt7eMVrMm35L2VsROpCIoTHG1JmGJDtRvdUJGWKxRS4nXhtJzTjeX
	YZ/MCUfVw+2c+94pu2sCacy7QhNCn/fyGlMBV3WTmDBQc5sg==
X-Received: by 2002:ac8:7dc5:0:b0:50e:631c:c390 with SMTP id d75a77b69052e-5100e1d08d6mr33550341cf.44.1777376137378;
        Tue, 28 Apr 2026 04:35:37 -0700 (PDT)
X-Received: by 2002:ac8:7dc5:0:b0:50e:631c:c390 with SMTP id d75a77b69052e-5100e1d08d6mr33549631cf.44.1777376136857;
        Tue, 28 Apr 2026 04:35:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7462d8681sm552176e87.36.2026.04.28.04.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:35:35 -0700 (PDT)
Date: Tue, 28 Apr 2026 14:35:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <jstultz@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 11/11] drm: of: forbid bridge-only calls to
 drm_of_find_panel_or_bridge()
Message-ID: <fjveutk74w2iwbzibrpeu3bwlikunkpfea3cv6majekjta7o5o@4tucid3myk4h>
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-11-4300744a1c47@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-11-4300744a1c47@bootlin.com>
X-Proofpoint-GUID: IrX-_jp7fM823OFjeSU4CT7GBmAPV-aX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwNiBTYWx0ZWRfX34lXaHJta66B
 ydd4Dcw3+hI2Ay/VfUG6Ei16aFtaJeS7mS9ty3Zv7L03EjJZmeCgZp84LEfss6DrES21Ve226K9
 cuyV4lT9+tW1LmerMeqVSdF20n8oDN36/zDGLNfRg6FHwQXlP0UoyxiEaInIjpkjd3ajljtpsMw
 MSQYYd6U9EV8P8jcUzhfm6Wf7GDahaYl2E4ixqyLCF4nbftB3a3e/EQxWN24hZMMYYL8DJ1BhX9
 kRYpZJnZ1GXNidvrozYO+VVsC4ie6y4rEoq1L6t12W9C6UbRrLtN4zTBFrN7x2Rhum/2MGicYey
 1bZTheYG6Pnqi1pRTbc7HFSmfcdlZtlVeQvEwQB3t9ye3BDsIHFpmGkb25dqNtFwGuyZCfhHxj9
 ow5jJCg3BktlOfjWlcJj9N9bO4bCmLQiV8PnWcGGkik4ovYozPtEdfn5MkgILj8D7nuwIA/m456
 ijQFuNEpQkgbtqzMI3A==
X-Proofpoint-ORIG-GUID: IrX-_jp7fM823OFjeSU4CT7GBmAPV-aX
X-Authority-Analysis: v=2.4 cv=cMnQdFeN c=1 sm=1 tr=0 ts=69f09b8a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=ihHiGccrl-12bfV6lMsA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280106
X-Rspamd-Queue-Id: 524B048450C
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-104974-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,hisilicon.com,linaro.org,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, Apr 28, 2026 at 11:15:57AM +0200, Luca Ceresoli wrote:
> Up to now drm_of_find_panel_or_bridge() can be called with a bridge pointer
> only, a panel pointer only, or both a bridge and a panel pointers. The
> logic to handle all the three cases is somewhat complex to read however.
> 
> Now all bridge-only callers have been converted to
> of_drm_get_bridge_by_endpoint(), which is simpler and handles bridge
> refcounting. So forbid new bridge-only users by mandating a non-NULL panel
> pointer in the docs and in the sanity checks along with a warning.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/drm_of.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

