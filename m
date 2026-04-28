Return-Path: <linux-arm-msm+bounces-104973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kF24JySd8GkRWQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:42:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCF2484123
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 52E52303B449
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 743DB3AF643;
	Tue, 28 Apr 2026 11:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n7IPcpfb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kQVfheqi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1013D4A07
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376101; cv=none; b=URff9Ly8SFUj388MRNL6Hxeh6aX2I8UB9TDfgPzhEGIEwl2jn46FEp1XCR0Fz7WXa/avt3mWGTcr4ZkfzZIWeMlREDJwZMISBW/SRwEg1iZUhz/HJSVeZvh//zQP8y/MsI4fJOe5E2uDTTbRJUutDwXv02tRs1lb63921PpgZaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376101; c=relaxed/simple;
	bh=RrTqx82WMIWFZiuMZ/ElX8JC77lDVd4Bb5zAf0fehQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jlz/aewmC3waviEoRfIB27JRZbOhtFVTYokzBjanH5ecyJl//t+pbvpk0bPQ9zy8Ch+t1kO5XKoAh3ugbN8/PwYP1U9JLTE13+BeJbR2Y9OpIykhvdi95k9zh753j9ZQcxo1xP6IruP8+Nss7rK8zFnALzU+exs1+454m1OqfE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n7IPcpfb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kQVfheqi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S6M11R1625044
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PffpjeU2jjzDgU5tqSe+zBEf
	KdG5CBffNrOKWE6A8zM=; b=n7IPcpfbxW8Kbc9LBIGAsME04k+zoicwwnz8zyRC
	sf8+5tu7dFguRjsVLTtuk4OLv2kSpFBBH4HSf532tje1UKSzv28xz4ZwFBEwYJZk
	FsyljiOjsw5E+ur704bQ1BTjt7oRcGDXvQtVAuq7ZMaeAm0MZTPsx1U2b67pgROz
	IETJdkjZL2V8YyZKp7iV885fXhUZonAjMgcjsR4urluhVmfmjHiVDk67wkapk7fe
	sMs4iHn9me6CnXoNzu4GBm2NZ1b+u4VGXdcZpNLfaJm47mtObcc7z6qwYIcuLGIp
	V52wJSaDRBXpR6YeAKjCjTeXblE3Zoa3YwwY+sq1e7em5g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtgmsaqc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:34:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8e8c47a3so307084321cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 04:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777376098; x=1777980898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PffpjeU2jjzDgU5tqSe+zBEfKdG5CBffNrOKWE6A8zM=;
        b=kQVfheqipL0sMYVXdnybAI6ddAHBkaesnfA4dAa680FodDtWTsdQTPw4uldnytjFqN
         SNjsLXZiesVpYPSC93EQldBsdtYsMknxIdqwqnbheJYmVqud+K6um7fUC7IsPiumBnJf
         3xdt5ETurLOkswJaBenzIp67CM/MjOcyjrOZ+nwj3zZQyKuXjLiztHwwyO2MSiAquuf5
         WoXKIFqdHMxxrfNWlvG0jX/4UwtkKD0uxXSAQ02Te4LKq/V+5i4DDYT3TM+aMs/VLwmg
         NnXoCpbAlRfAh6YpQnFexk+q84AsUFMpLO6njmoUVcQcI1csdXfBjmRdgxas+5/Vehes
         kLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376098; x=1777980898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PffpjeU2jjzDgU5tqSe+zBEfKdG5CBffNrOKWE6A8zM=;
        b=mfib7Vi0xHIXVdRr8U6wP4eGcfGNjNDRPawjpjjoCmZq+r8IpMSD/RtGVVaDqPq/xR
         AC5IwsZnFRCceqj8EjP0z2/DtdRqQuxI/laeG66IXFicDoaz3IhM44ExO6raR8QuIu6f
         Y7Xna4gJ5epkfNVEu/TckOB57dFs0zGyJcmxLXQ5hAs3IC35JX+RSK7+Vf/kIQxkgelV
         WtNhH0AN+YpBez3gMswXvnFJVsQdu2rOeVD57YLm51sxxI++9JMbKVS5nbEJEvM+/Po8
         DpSCOQT+DB7ydWvjLIqQSrFeqGgNB6pqxfeXMw1BKDpk75MrZGZAq4wH/W7AtuR/1zpG
         Gyrw==
X-Forwarded-Encrypted: i=1; AFNElJ/fxua8M+1VjDHYDlxaGXSGHlri3OI7T2HJZAoK95avYqoU4KoAbMDmSCMiQ7/sMM3p+aUC2oraH+r5e5G4@vger.kernel.org
X-Gm-Message-State: AOJu0YzrgML3VLzzRk8gQYfnCrwG/dwyL10MVORbA7s4T/VcTis4JEtM
	y4xf8qxEfw9lZuGezwhSm6nRDc2+aGO7kHRElLdfIiNdkBh6on5qKqt1pbC58NbC8IGw15rduWW
	/28Gqy8z1NH9mAKkIxjQySbraH4yi9wV2uXLfJvt3HMxKDxwV28UilYKkJrXopkeERu+J
X-Gm-Gg: AeBDietpowF+XZCxe89KPwDCMUSkJ/0uorr1w3BxI6qSygu2ylym2qJc7aZvjn24slx
	EdXGdC5idtWBzIK2QHMck6oGq1JwbRxEA89Xsj0qw+g8EOXRgtMUwb7Zmyv3mCm41zefAnnh/Ud
	jSFDq2PMqmrv3MFygpxphCbzhgDoz9ZRiMYK9N8r4elpJVpWFkvrjVe6hz+X/tbnQuMpVgOfgqy
	blGRR64oaXMCv1HalgJT2+yBmbjfUDiWGB6UFU2ShL0U4AZLHoaru60QDxeYZiMjEGMdg3pgdaA
	Bd0TAVADNkeH+Ia9fcEZnZ6dwkR5bVzEMORDFO7exguu3wie0Ip0OKNbNbOIZtgV1m87rToygb5
	8WsMRgaEVSmG276gxdVPSS2Q3X3AzOvGjmEyAkP42OfgqAT0Mg6FEmm/oT2Fl3sfNPJa4WJpvi2
	ekRrdSjwr8msduCo6O8CcWectQJzoBehMtG4rx5dKBt5lNUQ==
X-Received: by 2002:ac8:6f05:0:b0:50f:bb77:a084 with SMTP id d75a77b69052e-5100e146630mr31517971cf.25.1777376098386;
        Tue, 28 Apr 2026 04:34:58 -0700 (PDT)
X-Received: by 2002:ac8:6f05:0:b0:50f:bb77:a084 with SMTP id d75a77b69052e-5100e146630mr31517541cf.25.1777376097914;
        Tue, 28 Apr 2026 04:34:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a74640b645sm557987e87.79.2026.04.28.04.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:34:56 -0700 (PDT)
Date: Tue, 28 Apr 2026 14:34:55 +0300
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
Subject: Re: [PATCH v2 09/11] drm/bridge: lt8713sx: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <jeoq37unyevaxozcryvus7u4frdwayqdxej4hhq72fjpirr3gm@e4yagmhobqdj>
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-9-4300744a1c47@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-9-4300744a1c47@bootlin.com>
X-Proofpoint-GUID: sAsdyqzlVtiqy2AhLyLPYHhSXO71OxjC
X-Authority-Analysis: v=2.4 cv=R4gz39RX c=1 sm=1 tr=0 ts=69f09b63 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=SbJqdHswXr3mvj6Yul4A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwNSBTYWx0ZWRfX9qfl78hVFhdR
 34TDbRpAg/nwwOXCSreVlevSuYQvFNwHqnwJUrlsku09Mm9U1k00pe4ihr5sDWLHt8+3SkrsjUw
 HDQE2EcBIy+RqbO+cm+dY++/AMLWf1kUMLmf9kL0yqUSzrAF3G4ikK+lkMGM71gvm5BQkEE6qoG
 OOPHggMS/vzIDSHUsouUCMSfQ1KaWsXCkXbrgXavnrkKBmfyLscfjcZQjNexucPjtnB4Bto/8F0
 YApuwexkptbuSrUP49doCXaWlXuGQ9BsnOn9z0OPnTAovw8ccwAmZdr5SlgCOFtFfqrfyfgDy1C
 lCvM1OwUYPPurJCHB2Fx2aTGV9XkdIppRDCgfBlnselL5eEngPjj3mn2U3SDO5sVofu0TBeizx/
 7gt3oja3vXBJC9MCPB32YEZPF0GqEpT2+qOulGn49xtsrTTHZ6/b2T3oSW+cDXFEgf0NAzt7+qh
 dSk85/MKcV9icVthPVw==
X-Proofpoint-ORIG-GUID: sAsdyqzlVtiqy2AhLyLPYHhSXO71OxjC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280105
X-Rspamd-Queue-Id: 3DCF2484123
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104973-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,hisilicon.com,linaro.org,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:email];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, Apr 28, 2026 at 11:15:55AM +0200, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal. To achieve this, instead of
> adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
> pointer which is automatically put when the bridge is eventually freed.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt8713sx.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

