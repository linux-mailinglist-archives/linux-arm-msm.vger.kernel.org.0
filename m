Return-Path: <linux-arm-msm+bounces-104972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NCfFFSi8GlAWgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:04:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5DF484801
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:04:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3817830C2574
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BD93AEF43;
	Tue, 28 Apr 2026 11:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L8kw+96p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P0yWgU/n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D2D3ACF07
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376077; cv=none; b=BWnyeEHYFuYMuPWrRt+Nj5l61q0vC0+k2wN3ngB7eqxzG2tDl08WmkNUp3DedriIsO1a/Oc9piBS5TXUnXJA+BhVw7PZi8RpUvm4VFGmdu1v4O49AmA37RmxjYB6+3gsK1P95+chC+qsnNKjUxuDcRVtxhJKVWFOfbSBgHEjYL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376077; c=relaxed/simple;
	bh=4YGaQQpk8AxAr62pumZr9JDxDSX6W63W3fxcg8E+0Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kY8qtSKlPCUXhlZLnAY86cFjAWsHlTslXLpoGm3PJ9fshrikcXdjtr/svAT0AYx/llAs23jDyEW4ooTZrchkRrlz5nmGzax6UbXLbidod/XCbxoTCTHEMMx7gRHlNxvl6wrkrNcxDrfX+uC8o2OaYNSfZbXFGLKc6l0FgI45rts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L8kw+96p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P0yWgU/n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S6M11P1625044
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2oN/nRVkS1oynahEcEXi/uXH
	8DKUZjrkBQc+KfvDpf8=; b=L8kw+96pOMOVax7PWlaDruPRyzLmzLYh3AeAI6QO
	fyVNNqXU3NM3UuPaZACAPDa3U7yYhuo6rFLULi6Rwjc5VN7u4L7mRaPDVA6OgZ1P
	ELLpDbuCnLDtmN3w/hqjpUUBKmDGy3th2/uoIbjAs1JbIG5T9r2eOSEK2RtzKj1K
	s2nPAsQ6d1+RCo9itSHV7K8IAERvKzj3wniAxh2fjXK2QmVjGxmlhSH6MF8yD1a3
	jPg3ZdN1th9x9GDF9jYVaZSiixaq/19K32+zABtKY5kRZuY8jvTJDMikVMBJpm+O
	khuS/apglHSXVxJqMQLEKxgpjnhxsO31KoWx8Jbp9sfDzg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtgmsaq9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:34:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50faf575af4so67194211cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 04:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777376074; x=1777980874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2oN/nRVkS1oynahEcEXi/uXH8DKUZjrkBQc+KfvDpf8=;
        b=P0yWgU/nyRoqn+iS2BtHxZOz/C6Y1yZSQ2YB4mCaHla4tZTCckp03zgKMWU904N0Rv
         c5wq1tBwJXxpumXqQG31VKuvkiUvIoAxfPoQcq3ePY/wNS26tndAycRkFMVE8bcgiwHK
         q1y6OOEiFqeyIkQrqNurTcObXRvepepgES6TIK/W8LcOv0VWW3d6np8+saHFxg8KbjvQ
         gAvBwsHpbCy5lFsjLXONAQ7X9KYLlbqCpsmRJV+1rLKULU/53KHV2D2ElTrwVkIDxQH7
         vkgByUL5wNAVDJiJyxVAPnxtCnIS2ZZTw5H7VZ5VNgaUxPiKocERLMBHPNDpkJCnQtyp
         5RlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376074; x=1777980874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2oN/nRVkS1oynahEcEXi/uXH8DKUZjrkBQc+KfvDpf8=;
        b=s2IRk1zXJzKXeW1pCj//58PBs+jHYAerPsCiH3p1PeO1v2Nvfz8n6mHW3c0OTmvPYa
         XqLWAxdckLNTotLPUCsRaWX0baw1DzOK+ErsO4tvG04DyNZzEcRGvuJHIdi1Dewtegz5
         bp1cPt8BS7OSFhsgMTzVHDKwEH7Pd4B6NZ7vM7JIhh2za/qe+/bAndvBOmpk2AiNM+v+
         bSNkHHVpk8xyp4eb7MJSozQV63FjBe9kIS4ct2QSCQDEAmnQSL5GYZY8XaP0XbNI3XCd
         HZFXUfgv5z7frrWLHUSrPdiHXwB8tFjom3jE657peyZpcKnDNxxcdoAsNz28pIyTVF/r
         aOkA==
X-Forwarded-Encrypted: i=1; AFNElJ9S7dKYckmuXKVGBVRjC+tQHp/wcbr00nYVDPdI//Lf8fDy+KO1oamUZjpT9jCF218Nzjew7kK/tPzB5dnI@vger.kernel.org
X-Gm-Message-State: AOJu0YxJS9WbqQcgIOyNLvjC72Sid12m7r+slWeZ8Xe8MeTh38pDORYK
	tCvOHRqINJDohxTWGIs/iM2F4PZf2wD7bbzZL2qDTqfV/k4cs3bbxGenrY8Vmtr5cAzhUPm+/i0
	Wx/PR0V29gWKnDiEPdStB0ZpQSJGpXTh8/xFph9L8vfl2ksIr7kkLd+7J37V4O21u/atX
X-Gm-Gg: AeBDiev2G6UrQk2f+jgrtm1lyKRijPNgkXTtsEartIqnp6jU7TsbzIyhkWZG5JIb59s
	Fm+X5urrjgKIYzPoJ9FyjULdYZ70u4F3oCic5EVS73+8S0YvSdcuemC+eFwNklg+wo96pEpEaua
	mfWTYhxqElac3nt/aD9mjMtAw4fV+R7nTuN171eJ3xN+4DSAS7LHyl5OzgnB+qJ2PXVBagUmEc4
	vk1rbAIZCNQzPvl5s8OMyVU50ldmdv0IVMn1kizRt1ThpS4+5sGJLrs4DgdYyH84ohReQb1E36K
	2/aELOLhIMm1yrQyqhByN0Rv9FB48d7LuyzIZylLam28UycZzZEK5Vb61G3qX/Wn0UDFvnFUqYZ
	AkuPkJhyvZ9KVTAKiEyIf4mLXt5AnjVryqkUh7zULv6H8e+MmejuIpz4wI52T5Vq4Q4kZ/7DabE
	XoNjhyiLwF5/csJQ9XTbMgB+dUy3IKZAPbDYQSVjpLnUjddw==
X-Received: by 2002:a05:622a:4a8e:b0:50f:783f:31a8 with SMTP id d75a77b69052e-5100e19a66emr34473271cf.28.1777376074067;
        Tue, 28 Apr 2026 04:34:34 -0700 (PDT)
X-Received: by 2002:a05:622a:4a8e:b0:50f:783f:31a8 with SMTP id d75a77b69052e-5100e19a66emr34472571cf.28.1777376073577;
        Tue, 28 Apr 2026 04:34:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a74640b51esm540937e87.77.2026.04.28.04.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:34:32 -0700 (PDT)
Date: Tue, 28 Apr 2026 14:34:30 +0300
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
Subject: Re: [PATCH v2 08/11] drm/bridge: adv7511: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <6xeo4ctvhpvnas53uptyzyo3uu3ooydchqbv7u3eradrcb7r64@meatvyekusg5>
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-8-4300744a1c47@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-8-4300744a1c47@bootlin.com>
X-Proofpoint-GUID: dKFUfkpyzyBTiGQCDffDpbaJSziCb6m-
X-Authority-Analysis: v=2.4 cv=R4gz39RX c=1 sm=1 tr=0 ts=69f09b4b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=8rJAFfykPjGPsRQMFU4A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwNSBTYWx0ZWRfX86gll9XLtXdv
 IpvH4zh0QzUI5ErI4gqgD2MoxxRxWC4V9tsoMHKerEPqxigg5SAxhMBaDi3FkN2P9U6WlqAVMCO
 L7kgnDZMtg3cWBW583jWAfStBt+w3ES5PotdeXpV4f80FXvYTIp6oEUSxztkz+wEiBNfz0eJ7SP
 ziCn5bNgVItq8O1GSvC+u2vqQtTgqlT8r0m1IRL3O3m0DgTP3ISREsv7uQ/dkjEmoVxKVep4eve
 A1o4wROVGk7Do5dhTBarRoWW1qVllwZXt9EpVkzMC+wX/mgDYJm/GmfEQh5utD6HIl0E6/B8FLH
 Y6UY2UbVGrl44e5YVZk323E0oGdDgmcAnTtcCTEe6FXg/BLzCYhx7xO/m+BDUp6K3AhQPYBn5Wq
 wZ7flNrD+rtwN4LiV1p6JuRyzInMrquoFgHacDHnwFt0dfFzdK9rB+wAPZXHpYgHzFGdv11Ynax
 Wzj0DOtvUWfQ6Jq8XFQ==
X-Proofpoint-ORIG-GUID: dKFUfkpyzyBTiGQCDffDpbaJSziCb6m-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280105
X-Rspamd-Queue-Id: BF5DF484801
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104972-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,hisilicon.com,linaro.org,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, Apr 28, 2026 at 11:15:54AM +0200, Luca Ceresoli wrote:
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
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 -
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 11 +++++------
>  2 files changed, 5 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

