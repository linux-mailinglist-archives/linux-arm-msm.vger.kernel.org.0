Return-Path: <linux-arm-msm+bounces-102993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id o1wgEYcz3WmiagkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 20:18:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC9D3F1EA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 20:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 33B88300E6B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 18:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C3533F5B8;
	Mon, 13 Apr 2026 18:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pRKkzj4e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZGemj7M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF6133B6DA
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 18:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776104319; cv=none; b=bwbsKxiVEWuWcnfIlyQMahrupiRb3iGKYLCqo+dzX9Wq3UomzxDPXiEKKf1URma6d2vBT+nHpWzZNmpLfBNnWQYFc9NwgjvZSqRJpmwDc4AygPmIIDU+mAURYSqVIQ/Kpn6QGxmnZSJC4HUkRbQZ01dPl+MJUd1bbVd9YmWs55w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776104319; c=relaxed/simple;
	bh=qFpzJnA48oy0cp3z681ecVe0lWg1heFPUIEXabIq8Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H7TTWuDdU4GxfrgFfC8Z5xL33vzwouY3wOvmKL+dkb/Mu8RzUtv7XmRDzrHMl7V/a6TRKMFD7Of+3mRMYE3yHY32B8l1VmYOULe7GtHhU7rGo+MVKCJ5t+yye2Xjy4A5+NzD0RH2MeT+s29+n7DMP8m3793BDmt0g58snGh/Lqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pRKkzj4e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZGemj7M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DCZEfs3989205
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 18:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cvg9O/QkoL6L++yjzZgvdyr7
	NcHvlP+82mqh/kFxhmE=; b=pRKkzj4eBCLt7MBIHrvfMDHA8m40GRD33k+hBScN
	2Ygbk73IPzEDe5rG8ZQVNp8xBORszviNd5JgeNCOkbvUnUKjd21Wk49Ec2c5jaWp
	ZuFeKcPeVikXiC5f5XXRfMKFA3nc2UtOSWQeAxW7U6+2nIKSHrkRkL1O7jVf5MJ+
	Pclf8y65gFhT2lcawQlBhx+jbhrc3dT4B4OZEmPqWu5IFEwCz3xMcaRHUpqu/OHE
	5YdK3FVApL2VjsE7Qc/RzlpqDsG/Xfz7W7golo5D7kaxCNwer0pxx9pFrNarWl1S
	o57bOBJPnO7cOv3F+q6PLIGpZjy9Tks13KdMF9PWNA2ELg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh0mfsaf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 18:18:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d6bf346adso88580981cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 11:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776104316; x=1776709116; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cvg9O/QkoL6L++yjzZgvdyr7NcHvlP+82mqh/kFxhmE=;
        b=GZGemj7MPNfvWD2iPs1rxctmctg6vHtABC/mSoX5pVtdSlW2mcaJbchOoSMfv7Orj0
         OnKCrAmhe7xggGDOgIhy4UiJrVjWPbZzZO2j1THenizlAucksxW6doW7TQRUHpE174x4
         zkSk4861UhuTo5UDvx4lMbSXQfYHRZcnVZXLzqbjuxVcDbfMx+ceIt3nr9sVyAXHc2ti
         6fNDYTrBruFeVlGyt7+IKDgWGvJNOgcv/3VKMkhZkz8x1CvrGoLB6YCeiWowPN1BtUc8
         m5cMhZKBbkJEpey/b8W2ANdkEPBgss4IbAqlfl9LhExP6l3AFdIqcZ6s2z3Dyt1fxnpT
         sBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776104316; x=1776709116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cvg9O/QkoL6L++yjzZgvdyr7NcHvlP+82mqh/kFxhmE=;
        b=UwzDt6reL6bB55iNJmlP1pBvMXzo5R0ZRPFEPFylvT7O9w0udY5fS0qpGsYPHoUwCA
         ctVrrKdv9GmZetiyisr8ue9GiPQCr2SftB9F+rnZqeKufI3/jQvqmnWC78tYmOz89C4J
         //GhFZ6bGtjCpmGHTMZPxYtvCdHsvNCm0Xu858Nxnj2zMYK9doK1/6ZED2Ta+M5W8wTi
         eaPX6Pvt5eYU4PEJ8CSG+bHcP8jQO1rYU/vE9tiElRnW9B8PljFuvKsp4LrbzeMmb7ND
         oLa0HEqUFqcxTeaNo+DQ+RwVEtr2d7goJF9xaSeUITQrjLaKPxnyQTIT9RshK9tU47TF
         B3dQ==
X-Forwarded-Encrypted: i=1; AFNElJ/wkBNB7mQb4jftid2BM2GgcULJTHLh6XrUm69p9kYsnygQNuT7eXm0CHV7/VmCT6kAUh08uvgXiHvXH6Ga@vger.kernel.org
X-Gm-Message-State: AOJu0YwP7DX0SrIGqWt5IZAUD+4aJerzbwUgC4rcao0cpHr6ZokzwbKS
	hg0T2hO7+sQLKwu62lXtOY1YadCIL4ckh14+2Ku00Lef0l49eM6CfkwYvBK+NRn3x8+cfMoxvW2
	+DoFNPBOCk+fO/844O8DExx72kIr8OnTb5bGLOb4rOgy4KFDeoooEoCf3YxZQ8wCDfSRv
X-Gm-Gg: AeBDietsFXfaHA6j+PTLGlC/nubeN3uKaEH6rH+pRfV82tAkNVjIYqyP4z9xA5uXyAZ
	2LkMAk8m0nDjp5a058GIkR+bmdKLKoVoxpdMNfJOfz7BOUvI5u8RAn6nAriZ3Q4mnnEHMrLz+ZE
	wajywfJMwyQ+zHst3z63u599l06dNSLyOwvrNqUaTV0K5XimcMUZVXjzd3YjxGllOc5ffxv3RtW
	iyrBQLIr6Ue/kS6eMiIT3ZteFCU52iqzgRdl5B+++bJP97AsSJojTAZO1gPMkKIUAJWhXVhKoh9
	kalYxb5rvbB5NGkGD0v1GpwjgCO5Lf5J3M2LvXyLetpmConzP1O9fm5sB8WFmKcWPeNNnvHc255
	5YpFyEB+zlV+Ni5d5vS3o78S2T7VsCa1Qss+yHTjLLRev54SAy0eLuQJjzSx6DKzasEgamoGaqk
	FbDpmqymMVzwhb7kQwl+KMWV3XOoZ2u9a9sDqnR2OmjADMVw==
X-Received: by 2002:ac8:5916:0:b0:509:348f:bc1a with SMTP id d75a77b69052e-50dd5ad989amr232216061cf.26.1776104316352;
        Mon, 13 Apr 2026 11:18:36 -0700 (PDT)
X-Received: by 2002:ac8:5916:0:b0:509:348f:bc1a with SMTP id d75a77b69052e-50dd5ad989amr232215361cf.26.1776104315794;
        Mon, 13 Apr 2026 11:18:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e49298f1csm24034161fa.12.2026.04.13.11.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:18:33 -0700 (PDT)
Date: Mon, 13 Apr 2026 21:18:31 +0300
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
        Xinliang Liu <xinliang.liu@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
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
Subject: Re: [PATCH 08/10] drm/bridge: lt8713sx: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <5d4juwqjm2wxxzd6vf3rjrsrp3xhg2spklukvocwrdenuepk6v@a7mdfn27fsgt>
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
 <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-8-acd01cd79a1f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-8-acd01cd79a1f@bootlin.com>
X-Proofpoint-GUID: -uQLQsFV1kQkQpP3RTNROaql_Z4hgDOy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE4MCBTYWx0ZWRfX7penWLECJqtV
 5t3FUGpJki5cM4o0VuPb/FgVeEMj7eMjnf1DQeuCyVijTCm/2yHDYiwdyczu6eM9uwlZt81wE1w
 DFyWKF0X56doeVfuLYIndem5FNc5YioClWleyrniUrCToZANkAwfirEXJbL+24YdZHGEtWlVXN7
 iBqRfprQIRGSy0i0r4X0DMPKN+ZYS0EIIbvyl23gBR4EP30aO5vDmghZym3EypCpxqFCGhuVqea
 PboQrihqGvhqH8tE/UPkD5Tvt0gAWrsB9g+9JpuMY0/n8isqahG84hcaY7JIV1bOLcT7Q0P5mpB
 Urbiq9yQcQU5eY7grLPQJAqLBCtJOrOU3mFA63zyqigtp1O5gV2Msm27GJ512/irFl47JadcSqm
 boZ+6wFUexdlPHmSGJrBe1w+hVnUBjuDp9SZHgpbgdTjmrWsi06wCdF/JbvUtG8uF5ZVMA11/Xl
 f9b4q8HmVWJkAavCt1g==
X-Authority-Analysis: v=2.4 cv=cMvQdFeN c=1 sm=1 tr=0 ts=69dd337d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=sqxsbOWVCbAVHG9YZwUA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: -uQLQsFV1kQkQpP3RTNROaql_Z4hgDOy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130180
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102993-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,linaro.org,hisilicon.com,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,bootlin.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2AC9D3F1EA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 03:58:40PM +0200, Luca Ceresoli wrote:
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
>  drivers/gpu/drm/bridge/lontium-lt8713sx.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

