Return-Path: <linux-arm-msm+bounces-102991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJSDLaAz3Wl9agkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 20:19:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 287093F1EC5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 20:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7446C300D853
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 18:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBCBE33D4F8;
	Mon, 13 Apr 2026 18:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JTEXXUJA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H2s1viYn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ECB33A702
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 18:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776104267; cv=none; b=qRLiXs07YcNvB5j74oud7rykeS7C4ZIZ1gEcWOorQyOeuGWJe1EKblwKrWgew75QMLCSsI9ZQFgscpQ4lBkPl1e9xkpVgUh9sozcIYt2TDuzDQhOkRyfFmiJyzfU4IvmT8csPrcuiBAonHRRLy+98MI/FC6VXArmDLDI/+VHATY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776104267; c=relaxed/simple;
	bh=OaqTX7EKd3C5XbPL8km/P6gO7OhxBcLjo/GQoOvGx/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BiOfJamNtUZqfjTHw8eXf0in66x+kCjKKGYhtpKF5C+KzoLVbO9AHzPrFizKF26psUxfvL7xT0F3K8Z7oUNmr06k487Y4qNZiuBI6D+ki34hpavc0SFJOyEHKmnQSIoX7th2UobvjpXLxy3vBYG27vxHYQM2FA+bJ7/vSFTdSNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JTEXXUJA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H2s1viYn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DEmo7D1764876
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 18:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CKO27PWzOXPgZeFys90Xta2A
	cRn+O+syI4x+EowrjHE=; b=JTEXXUJA6IL0hyec6XzDL2EEL8O26sMo5Pa8/mAL
	RvJdS/YjDSS8+rCzn9T8yvmIZj7LRVNWdyveGZJSW4hZQZfsa9uWcysN9Mfpl80O
	eu4jUxSDx6VZSUVyGG2ateyEqk7DNLP9gO6v30J5BChvWXobgP/Q64gR4sLZl4V2
	jxmmLdZeGzfBTeTWPTngqe34KKa5ta46EKAn7jvLmZmnk2lW8ByAklizA4Q6l4Qd
	RWBe2xubr7RBh9zPldXzoGVlAsTw3YzvxfOeauKyayStBO5LFMgpfHU5KGi7T3na
	iWkSxRy2Df9TD8uwkIo4lXuNPOswwGWBHQ4rdPW57RXv9w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh2k08qnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 18:17:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d831e8083so74869241cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 11:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776104262; x=1776709062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CKO27PWzOXPgZeFys90Xta2AcRn+O+syI4x+EowrjHE=;
        b=H2s1viYnmt4eXRepwh3ZiKRAe8S0FolI6f1/nUr7lJqXPdJIx0X8jknawFx6IR3w41
         B7UuO+unJG3ndxogJ0g4OK/i6PTdTUJ84rUs/uu0Jq86AuwKgRIGa/YO7AgQc3JrrrgF
         f2EyJO70ODXXTEX+tvmercrHJMsI3sNzXtCxTCfQM0EXl2we6A2HOKFMKI05cJ1LPezA
         WdSQ4cEXi/eEdtqrcL82trYjcVUurdgQeShjL0cC53mL3kHFJTsryZrO2x9f8n93rF1a
         o0AiBtQr03CK8DkicQj7jgjXE2Ub3kw252oK+rZ3yaegbb3mEmuUoyWAKVv1hm/Rkpbl
         xDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776104262; x=1776709062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKO27PWzOXPgZeFys90Xta2AcRn+O+syI4x+EowrjHE=;
        b=iwMP0cf8b6qMVQcE6frz1n1a0/I+XHEUYhrT8BawSpp1IhbyPXjzlex0rnPr8LbYYU
         KCGnDSAnQor9rVFH2/N4qEIi1jS98rT7ucny3BETiEBt8fpWOSoc0DtXOWMVAa8SFkId
         rA4eSoT8sg0cWQFVAntG0NBm5vh7ci20wIKfVNm+0CGb084IymXSR4yp3LWYzgxPT5eM
         vZzTdWzE39YpVeecAeKWZYz4Zc47iO+Do0jxpC0ag7xA+VfFQ7MQ4nObhhA+pp2aUaqR
         Y/UwR1IR+RyHtaWHtWGCJ41IFvrQqcdcMhSxdMNJXIYk26LrC1lXtJsoVLUPmPaufTU2
         Oyww==
X-Forwarded-Encrypted: i=1; AFNElJ/9jTSCWY4dJ7VV9770KnQUZs+lN7e1Cg6KusFAQInC+uoF6WWo0Hx/zEQBQ9Oj/kGa7rUXWRhi8FROkBoK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4QkJcCFb0ZeLkC2Vqhk+hK4C0tF0b+HJKRgUr9HokWZVzYMk6
	04GUYgFFOeI8Wxke9w8N0K0l5EnvR8ARY8ZKKwuUjuHKWPTjPHWZUtm8X/IQop1ZG+Bffs240v/
	EWMNuePqO2WNTsq+7KshIfovEjJxvPUTWd2OIf9UXf5amLsR240ndJL8NCz4PhVldEm2e
X-Gm-Gg: AeBDietSlefWRoI0OKgn8msoD3kC6h34FvrJqxYRw8qcoJn+xTMaimxl+kIQbsVu3LU
	6brn5O1ew02AuxsBb18hm82YNc6PShsEh6L3k2fkOzhBOstlvhAPLs+Mr+aotjxGZTwANm+Dyy7
	zLxrgiJDStqCmFaycX3dGx5+arzeKlS9vC2vvP/syuar9VfBdomiwWxgyh75LRtsw/XU5YuCEBD
	BQ178hmWTSs5lNtD3+ZW3KE9cgvYtHhnxuxmqQNs2B/eHWAY0Zdx3fGpCQ8lIa3pxIK934RYgv4
	m6qM/pIfJB7jTdzcSaMUtbSwGgNnsEWwZop4I5EAONqJkW0gTGPtb3jrIiPtF3+i2NyI+Rp81qa
	2hE8fPXgCs6w1Um+iFp6W0pMGrX5PneWXvUWOFcbACoGMGQ7uMLujg4d9j0yHBiv0at8/reuf2y
	ldOhbrelKonEpA7+hafwsqGCVjTiB50rIaZHqiphXTC34e/Q==
X-Received: by 2002:a05:622a:d1b:b0:50b:4d3d:496e with SMTP id d75a77b69052e-50dd5c1383amr209571631cf.46.1776104262137;
        Mon, 13 Apr 2026 11:17:42 -0700 (PDT)
X-Received: by 2002:a05:622a:d1b:b0:50b:4d3d:496e with SMTP id d75a77b69052e-50dd5c1383amr209571031cf.46.1776104261646;
        Mon, 13 Apr 2026 11:17:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee86778sm2672353e87.16.2026.04.13.11.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:17:40 -0700 (PDT)
Date: Mon, 13 Apr 2026 21:17:38 +0300
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
Subject: Re: [PATCH 07/10] drm/bridge: adv7511: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <kcvbx7glrazf6mr7bcb2agj6pdqxdqnrcsujg3y4x5drmhqlbd@pfdb6zcnlwju>
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
 <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-7-acd01cd79a1f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-7-acd01cd79a1f@bootlin.com>
X-Proofpoint-GUID: pZisj4XKtrdqyqcCRGZYnrW1W96eAS5_
X-Authority-Analysis: v=2.4 cv=CsGPtH4D c=1 sm=1 tr=0 ts=69dd3347 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=sqxsbOWVCbAVHG9YZwUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: pZisj4XKtrdqyqcCRGZYnrW1W96eAS5_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE4MCBTYWx0ZWRfXy25YyzZhkTgV
 Up4+H9fwhBHm0APZ7vZfQL4BQdzzsJ8JnIVOo9QO6jEnBA5V2N1JO//iuGD3HsyyN8qKwcFcmYi
 CGKzyTK/79Our6BC3IdnREUmqx52Mi94wiE9VcXVIgJjZDGqmiXFDKnjhaR0aN4hI5wJcygfc98
 1uzOwfXlJZQM+ifPraNwNpC2f5Wne6PSb/TMk5kzoeH0b9ZWTgyRkeN5x/AIzZsBMwVf3jPboai
 oMipFcgJpCTuVBgvYkpbU4EIR5AfMwuMxkyfW6CuD1jrJwhM33gT07Hw1AybErgvCPRYu4ToW2k
 IhyZUs9ujX5YN0H+dJ9cPInR1/yfD92cH2wOtVNAsA2uNFptAfOkoEgoCFmFmrVkpGpCXJzGATS
 ixDYYoquV6bxhs8kWO7MB4RcZ8dSOLbbmBDB+n0/Fk5eE7K1vdxVG1HHKJXfNzgGHWtt6YH4ouq
 MyPnpeHEVDaYTCmBgTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130180
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
	TAGGED_FROM(0.00)[bounces-102991-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,linaro.org,hisilicon.com,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 287093F1EC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 03:58:39PM +0200, Luca Ceresoli wrote:
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
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     | 1 -
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 8 ++++----
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

