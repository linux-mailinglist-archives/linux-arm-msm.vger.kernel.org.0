Return-Path: <linux-arm-msm+bounces-104969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePUvF+Se8GkRWQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:49:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A59CB484377
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B0E9312743E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E52418871F;
	Tue, 28 Apr 2026 11:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQ5hqlpD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h0IQxDGD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447834A07
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777375871; cv=none; b=Q4A5XaAqc2JyqfHuGExPaMLgFQIEdJeKOQWYgy1MTrt5VaNbcpbB4DdzlfatmR/lpmnZj3c8nSOQHGE9BsQVu7Px7EiXdhSmUlzmCVLiii9KDUmCROX4FZYSl+EgGsu3Ecj5mKcxWCNzpPPxdN2ye4nfHn2Bfiqat/zj37W+UQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777375871; c=relaxed/simple;
	bh=M4eVUq6BurLOO2rtiPoErDMIOQpcHzVNXZTr+MDIM3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ioc3K8AegrD7a+s2MjPFUkxgGEgnWDKxjV+wddWCFZwh7Fo+dp8oq8JHlxTSni39wPTphWWLW58734eC7ylNsX29QZLBkcdM5bw8k7OduDQNB5YFnK4rO2VFsFp3yd/dPeIeSaNCBF2RLk5kX3BiLx21xZLHiteVvPhEypKiAV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQ5hqlpD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h0IQxDGD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S5lWDZ1625526
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:31:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e6kbSqYZzJcGS2gc3yj0gG/z
	i1Gf5AJhMNDlMIMu6Qc=; b=jQ5hqlpDoI5BgghzDD08b6QhYBNPnGVP59FNl306
	RKI4JmoDxQR2wC7GVpKTCu78SEiIPsFPP4UQybMmKVR0No4kDAOvDwk/fQp+AwQs
	lbaZ6d80X3JWDXqFIJLGyBiLLyhLS7dzfryR5dbIiPcTx6ahGVYsnJnkss1v2KdP
	MsMRubDrpKOLP9yHj582DYpcqyP9dmBO4sAr0MB9HBWPrIzaCfeBf2qptnqfPvVt
	+fV+m/tg55TUGIdHToBbmCbWqp4MPb9aX5fQkCVZRXH131IgHgRl+iiBPr2w/+lL
	tqw14LubPn0tZkEOyoC8FBb+Qq0UOvr4ug39jHyNQhF8wg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtgmsapvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:31:09 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-68cfc614246so1232349eaf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 04:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777375869; x=1777980669; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e6kbSqYZzJcGS2gc3yj0gG/zi1Gf5AJhMNDlMIMu6Qc=;
        b=h0IQxDGDAB9g2uXds2bQO8tRf3X/cTT6TL+ocFIwcYIVornpjDYA+g18mUfMaxiJpe
         RS1fHX2CNUYc7ohqfgrnh3KXm05WsmO5NT9IxUpF+gacc/LnVHzue0a1xvvzt7l/7oAJ
         BExwBtXjHs5OmZJkkIgkDQYqR9O3pAKed9K1HJvnSrm2hzuyvF/MQHPhYHDizNQh+YRk
         VU8WUnViOAJxA4tIaDEJ/eI+e6qKyasDL1lYilh+4nSHTRz3SqJf1/SFLS8N6Xx7QqeN
         fowQDRv83eA7PaswzRiTKrDnLCe8IAzJwpgiUto5BtKKCZ5qAhvp6R6x0T8681l8t4Lh
         8E1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777375869; x=1777980669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e6kbSqYZzJcGS2gc3yj0gG/zi1Gf5AJhMNDlMIMu6Qc=;
        b=LxUQCfHviUWw5wm/tUxNNNfACZeB6OG9lDnWueCOOu96nbgO7OYQN4/sIkO5hsGseM
         V7FfUaY+6A65U5QyliosLiQGNsljxK7MVMCz+iy76tLpOE7/S/stV0UDcsnD3L3rZK1v
         Nj1jmCNXxnDVa/MhbWa/WEkFafkc1yEppLWKtKOtEPR+p8MOtmptd4nGNL6fX0PMa9jQ
         lPb/t8ni1p/Fq2CvacvI4XMuZcMMl+5LS46GRRU4b+QS3sx/BovW9NQQ5Kim2msTG48a
         PuOruFRGESGHuC0JRvczuzvi0Tw/52+YUxgIkz/A+1op+RjnqF5FhcbAnXTGnIRdZzqn
         SzgQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Rf4TTIDNi54gTU4tQdJa79l34UZEhPVqZukI5geyABVYwkqJyRGRwHxNKCflUDIN8MUN1L5/kNfDiOuXK@vger.kernel.org
X-Gm-Message-State: AOJu0YwRoi7kXz79LTqjTp6yMbBA0pc6/p2xn8l7e+HXnwswKRzrW4H+
	vod/w/Yn6rkDijYo0nt/v8WdkHnL4sKBDzmEs6V1j2ZFujOz0fCT9FLzAE4AtJqUvLDDcwsV/bN
	1VCYxUvN2MQyJ6r/Xk97/lCDXYemDvjjCHxyag8mVClVOqlB3Jil20vDKc1CwK7fhW7C2
X-Gm-Gg: AeBDievd2arpAJL6nlylHz6uoFTwh28P/tcZlGQf+O5ePw8vqESnQVggbpN3e1p+DM1
	eYo5Xz+vLKBtw30h1U15OLkOGUHsfLjqsxWH/MbrMLR5dOaMuHNxu8RNp3EVErQS3SerhC88RKv
	YiPc0KoVwWCRZA4QW2oR3AITYHAnyIyBIS5JCvyIHt33snninivkmtL+gMbsIRQN1Jwe11Y1PdA
	wSVv1eX+57UuPlaWHynm0oNSVU3NzmzqNiGky+z779jkszU1gUASk5W+44037J0SEadheBmHApx
	eiKn9idp+0xw10ve80vqkSCclAmtBCzgwQoclAcF7QZwbgJl4qHa/f6PeOWRvEJ+fpNyBkJHUKa
	ZJv3Dgzk0NopfcKqEPZX4x7N8uBfqQRvMu8VXD/E1jGWWz1miZFJg8LlHBhDvSBfVQsKGWsRTBK
	X6PMKQU4mNz/zqaHJuc4MwJx5lo2XKPOrysZ7EJEizhUO+QA==
X-Received: by 2002:a05:6820:1b05:b0:694:914f:c18f with SMTP id 006d021491bc7-6965ca69f0emr1224710eaf.3.1777375868606;
        Tue, 28 Apr 2026 04:31:08 -0700 (PDT)
X-Received: by 2002:a05:6820:1b05:b0:694:914f:c18f with SMTP id 006d021491bc7-6965ca69f0emr1224690eaf.3.1777375868164;
        Tue, 28 Apr 2026 04:31:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7463f5f91sm548695e87.43.2026.04.28.04.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:31:07 -0700 (PDT)
Date: Tue, 28 Apr 2026 14:31:05 +0300
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
Subject: Re: [PATCH v2 03/11] drm/msm/hdmi: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <4zlmusbxhafoevbprgxempl7yjmhc2cvo2xozlt4yhcnwa247z@ac6xhtfrc5bz>
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-3-4300744a1c47@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-3-4300744a1c47@bootlin.com>
X-Proofpoint-GUID: Yc3VJOgdZ_EMJi_7iJVzDu6SLJFeTXu2
X-Authority-Analysis: v=2.4 cv=R4gz39RX c=1 sm=1 tr=0 ts=69f09a7d cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=hXVsb92WUBna0ZnZifYA:9 a=CjuIK1q_8ugA:10
 a=WZGXeFmKUf7gPmL3hEjn:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwNSBTYWx0ZWRfX3/g4ef5IE6w+
 0WcwQxpaPfUNDEQp2U6yYd8b7ubH8Ftpbcel1ns+BJ11Unjrc82XTYSuKj/K0EvYTfH7xian03r
 iwmAfotl6bBAUn1Id1qA3O9FDkr1cmRwg5NeVYULgaAzr9OiMesKLq4++b/SidN/RYepN9YzMT+
 VENwmgJlALmGIf2MClPmiFAOTsAsuCQSHuIQblyLuykXpwBPp6qsBBGtBcnWTXtBagjn+FSD6pb
 S71ld6Xb6TQFAoXsRrfqhn6epPY6oKmFx8ipbFvn42gNhLpHAwOf4Vgm24pnoqL4xSPFYSBdFO1
 yxSuNRMWfntva59A9lOh8GrjQmkDf1X+07djGcwp1NDJQrjrC9bx22bggJHz+1CMC1ocw/OuGzB
 i9ZUHhvXpZxqna5sKB31DzY1wiJMJkOxjgAiJDBUmNBYD1BjVg9AbP+KDG9jA/bjmxOk796hN+u
 F1nzxawVtwq4mvWl7Vw==
X-Proofpoint-ORIG-GUID: Yc3VJOgdZ_EMJi_7iJVzDu6SLJFeTXu2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280105
X-Rspamd-Queue-Id: A59CB484377
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
	TAGGED_FROM(0.00)[bounces-104969-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,hisilicon.com,linaro.org,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,bootlin.com:email];
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

On Tue, Apr 28, 2026 at 11:15:49AM +0200, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

