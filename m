Return-Path: <linux-arm-msm+bounces-104966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJmZMvic8GmGVwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:41:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8424840D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 181E131DD478
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788352E88BD;
	Tue, 28 Apr 2026 11:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OyQN3EWb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FY+K2tCT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A08311CBA
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777375785; cv=none; b=IIoxTna+wX/fFPix2Dvw1NRY5Wr113siEs6JF2MdsblgQF9FIjDslFgF2gxii2M5j6LTGx2FUhCs3RjkQvO1H/q69PB7XC/YpObhGGYLIv0NJDPzflffWvF+dO+5fPUo4aDNhLFok7BnXuydB1vGw4haa7woyLUG87qJouGOln4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777375785; c=relaxed/simple;
	bh=I2Q0JM9UILYjRJyiXO7+OnGunUs3zSqVXBt+bItwx2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7aci4yJtQC9cmm01Ag8FDWmzGDx4NuHIKid47O6VsUpld09n1An/3tNnNFccz7k+UUJ7LOOoTgzZDtP13HtQIRjBAFLQwRicubHtDQOrgKMamZdZyMg7TlgAnR7dfXKGpQRZ8up9janb21L+B/3piSvGrqeOTAprY1842XlO7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OyQN3EWb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FY+K2tCT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SA3tpS2112620
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0IfYo/CntwwiLEZ3vhK+hpUb
	6DgwSIZulel/sENVZRI=; b=OyQN3EWb+KQcCalY6BHyE1R5E2hPeDwMxmJ8AU/F
	8V7UZjBsXJyZRN42PoF2eS8B9zjOGIxZgeEwhEWPh6maf+EK5AJla/LDYRIWcdWe
	V501DxGVW9TmWB9kGWchcKo/mU5priNX9Sq0hD1+XqWqQa2SUQdeaN9733diGFG8
	bl2Vo4sglcyyYOotpnsdzuorcCxmHsS61h1CqopysbFvCHG5PBcPwTfPLBIObTfi
	k/tRzyGTpLV2YMh/Q98GrI2obqf0M6GBiSM/PDn+b6CepvqhkfDp4rdJtmF0Y+6L
	UpdyDGZadi31engSWxL/MEeH7Voied+sKh9mVtEVi2DqmQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbk942-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:29:43 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56d9f191b6eso19100455e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 04:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777375782; x=1777980582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0IfYo/CntwwiLEZ3vhK+hpUb6DgwSIZulel/sENVZRI=;
        b=FY+K2tCTVuFa6f2tMvUwRi8PY9qtKkfHZwFTW6h39nQLlu/zzx/+SNri5ZFnelKuX1
         49C5lM3FMfpEcWMcz2zv/bXFUY1R85jkWbohsZbp0jr5V2gTcTQJdDWE8fpOC0W/jhm3
         14D/2e92UZBXoE6xXDek9rJsPg5pyZcUeBRTOSzO0ncvj90jtrOYX+LmEe7k2Jx3MduL
         Rq0GFkAW/Ex4/1zX+uxNyR2ItniL1QRoieaj7BKS0CfgWzLBvBB/UGfPbAR2NEdO/b08
         PMsCdN4G5TI2fBn3dlmQ8pPGrtev2LINa4rPBzKynacbTrkUmDl34Kv3jqnjFHv4bDXd
         yxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777375782; x=1777980582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0IfYo/CntwwiLEZ3vhK+hpUb6DgwSIZulel/sENVZRI=;
        b=qdj+M9stDFMDvDPuEa94FVG24EjvgRLnYyjjwXX8nmomF2Wo3c0eJfOl4C46Gr7nxY
         yd2mOqW+T9l9/jxMTReZ0itsUcjEnkvEsguBhNab+uzzKzrGI+L5HgCDW8V6bu+Uoeed
         IZyotd3Rojka8T0azp+md1Jev9m77ez0XuoZhBGcm/YYlnYt1wfqNpS7DFuXcc2DRJTo
         jZwQ0Avcx0ey38HeV73W0jaQ8Ap9h4r2G+1CGDEpXZWsvUaBC7XgLqcGiFUyA0OJjdK2
         NTXUyaNlXnMX/JobZihAZxHQagmIRBODP43BabzLvnNY2feXCO07YwufOU1n2AMtN3X5
         nUXg==
X-Forwarded-Encrypted: i=1; AFNElJ8LI4Vujkoeyn+SPqhZBRoeSFVFtxavGUOg6f8PrMhZBTrE942/Ouo4YRZQp1dv311vAzbtzLWJm5BXs8py@vger.kernel.org
X-Gm-Message-State: AOJu0YyYIMPLZWjiQHLqg7PS1hBqtLbq7xMJj658X0pQeAUM5i0iw/+U
	me1Ma/3c9UnA9O24Xpd13P+oZYOzaImFZFpYmLbehiL8BcQjujoKj/EThKUXav/XNDhCMgV0YIG
	qqXBsxgx9dB3pYxN5sKa/v6NcczBOxqEwGUFIcbL3osHMH3JKk8E1e+u0M2IWRNGlCloL
X-Gm-Gg: AeBDiesBSzxZQcTV+vBqESefwOHwyOfBkviFGxGGm275/gCo+XztsTHZs5UHssA1G3R
	oIM1W1/mQwOgOiKYoi1SezRix8bBZsidDihtjPLO5LUnFaRwL9wUGBtJ9XZ+im890bXbBmu6NXZ
	gIq9mR5ElRHBLMzGQAQYI5+kFtDOBIlwH46vIs6WByp7q5DQxlmvGTIPe19xXIVffpTmo+VHoRJ
	embHbTlwz1STAZpHNHXT7lEOByV1vr1aqClAIJ/6vAvp0U0kGySTX2u41DPl0Cv+d2TUWV33+4q
	X2+EttHm+ZDLG6+pmA1GNSXKXd2Rn/v5by6+iiza+KcLrfGklJxOweMlyervcD18Bfa2O5iRebC
	H7HA8moFLxaJZMjls+yirJBsYY4oj4ScJEzjsQXEBF5Nf6qUcPzfA2alHOYlxtRoD2ZHzykzrMr
	4xyg+yKDwgQoUj+pnaHMR8fI/16eFlnHbvUl3c2oxtRIDv/w==
X-Received: by 2002:a05:6122:f90:b0:56d:b4d1:3c1e with SMTP id 71dfb90a1353d-573a56746aemr1116970e0c.10.1777375782331;
        Tue, 28 Apr 2026 04:29:42 -0700 (PDT)
X-Received: by 2002:a05:6122:f90:b0:56d:b4d1:3c1e with SMTP id 71dfb90a1353d-573a56746aemr1116935e0c.10.1777375781729;
        Tue, 28 Apr 2026 04:29:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3923f2e0f5bsm6739471fa.1.2026.04.28.04.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:29:40 -0700 (PDT)
Date: Tue, 28 Apr 2026 14:29:39 +0300
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
Subject: Re: [PATCH v2 01/11] drm/bridge: drm_bridge_get/put(): ignore ERR_PTR
Message-ID: <vf4ddg5retquxjbzqueligpbfhweuwgmqnm4y2hmla4air4lx2@ubi25fqbxuar>
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-1-4300744a1c47@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-1-4300744a1c47@bootlin.com>
X-Proofpoint-GUID: jnAMVFYcoAEl85XJQrtJTXXCWto7gh31
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69f09a27 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=lmVp1xxxIbapqg5Hp4gA:9
 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22 a=D0XLA9XvdZm18NrgonBM:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: jnAMVFYcoAEl85XJQrtJTXXCWto7gh31
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwMyBTYWx0ZWRfX/Z5NxWBWoPUB
 FI7vsUs8u4XrAexoJFfsba/L9cMwrIsLkZrWHMr3MqkId+jPTKkVC/flglbFvzCgzSPl0EzBLay
 acc05MM1BiSt3/QdOse6/BslLqgEGA7bYwt3wKbZ3mi0T1jjaAQUj9Ltu6iD7IHYSELTpr0cacs
 rxe/kFpKWHjaFPAShwvuU/OkYdtDC4QTMP8zhJU5L926cmKuPC14/f4SMnRsnZkbtLE5pYbHq9+
 McOE0RGcip09/B2XfZSpykF4OothWlXMMXfE0sAl+Bvh/UmdQlTZQKe/XhjdC8RbtDmENEzMa2X
 KvCkTdUIZkU/4uH3ENKGYbYPncn3SZ0nK6upBg3gNG1hLTUgLAUmYFS0cDxOtBnksGGAgqL0QFK
 peQ4Nx6duP2ErMkcpzO3Oa/zETtc9V93APhILzTqHYQBuTXfUvUAJjhv7h+TtzJIWpr/iS+mgRb
 IaISLHlUlBCM6hnn/8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280103
X-Rspamd-Queue-Id: 3F8424840D5
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
	TAGGED_FROM(0.00)[bounces-104966-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,hisilicon.com,linaro.org,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:email,qualcomm.com:dkim,qualcomm.com:email,ideasonboard.com:email,oss.qualcomm.com:dkim];
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

On Tue, Apr 28, 2026 at 11:15:47AM +0200, Luca Ceresoli wrote:
> Most functions returning a struct drm_bridge pointer currently return a
> valid pointer or NULL, but this restricts their ability to return an error
> code describing the error kind.
> 
> In preparation to have new APIs that can return a struct drm_bridge pointer
> holding an ERR_PTR (and for those which already do) make drm_bridge_get()
> and drm_bridge_put() ignore ERR_PTR values, just like they ignore NULL
> pointers.
> 
> This will avoid annoying error checking in many places and the risk of
> missing error checks.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Link: https://lore.kernel.org/all/20260318152533.GA633439@killaraus.ideasonboard.com/
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Link: https://lore.kernel.org/all/omlnswxukeqgnatzdvooaashgkfcacjevkvbkm6xt33itgua2k@jcmzll2w6kdq/
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

