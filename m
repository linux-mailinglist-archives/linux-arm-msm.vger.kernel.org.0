Return-Path: <linux-arm-msm+bounces-102987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6N3+HBww3WlAagkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 20:04:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 159C03F1C87
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 20:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 67EDA3000FE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 18:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E483E2747;
	Mon, 13 Apr 2026 18:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="olBy1O2O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OoCwVtx1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25343E2771
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 18:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776103449; cv=none; b=idxq789aJARCIgY0T1PTgJGHlhx20M4v7PpuI35WrR7LPoVfvZLP4aWNKHPJL/QWsSLXPcph8rCOlOqDJxjkXUvZSyjJGLy8vOkhxUAYNE+VWM4/bcOfhJWUaautK4cCdrJKQOL7kskZbzTdwRV+PDy8g8SQmEnKUvVg/IkO2mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776103449; c=relaxed/simple;
	bh=Md4eD7Lzt35OSoASoppKlvjCKvlT/RaT3Zkag5qTLGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKhtOzPONFXBtSvJ9uy8xWVSXbUX5oq/7lzI79C9DjNy/sIe8NK2ZdpL4qNhDsY2F7X1/Jg899BPYNw0Au93pyb9y9aW+7n7h/8hWbbE8y6GzJmwo2205dgz2r1wAEDMJ/SmhUxkGt1xAsbeosExiW+YnUgQBt06+FQBJbJogm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=olBy1O2O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OoCwVtx1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DDm6IL1496998
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 18:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uG6p1MFp+26v87RPXmsW7BAV
	+LfDZF1OPvLL93JOuM0=; b=olBy1O2OMOlg59z38ME2FspkMia97BPsNpQAcUFA
	IVsJNTWZGxEWFER43A/2wB8v/RLuaowc9ryQia13ZkzfaKtA7SIWJBBFPiKQnssQ
	fhiZosocLqiMn/iQ96JenS3iwW7e7L4mS17msFVvwue8U0NeYaaxysy17K7tzktx
	EqgOZ4qzq98P/okV1scwWMVq7FMjS/w9003qg4uR9mJMDFW/Sp4jBSvd4f9qo4T9
	l8kInOABbVzccqcotJ20RLO8X+yHYRA51pQBNSwZ2dS6OERlC8kahwcWYWSz6HG4
	nhnfJ3mpMh/XOzXkgS1AMBrIRgVwALfs1bWlugv5dFmpcQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh1pk8yq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 18:04:06 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-46ef241b62aso3516010b6e.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 11:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776103446; x=1776708246; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uG6p1MFp+26v87RPXmsW7BAV+LfDZF1OPvLL93JOuM0=;
        b=OoCwVtx1AWL7L1/ULRIer5i/pfg/qrbnFsqIZp5DaT3SnlZWA9bVvELcoHCxeC+MOS
         6lVO8Xsiefjsm6ZA3Hk+tCT10TLgXgqgz0pSUu7EPclEXvOdDPj7nfE5t90KlU2bs4lf
         tU3OBxZeGJLi7W+4s8Jk6O2idx3M44SQhd9AZqBTOwNcWciH8BA3+VGoqWk7yZfQjgYH
         qLhrqQvbVHsexE+wF6OF7PggR6oav8fh1u6DcxZ+PNQSOmoUknozO5G1WnYzTVcSh7ee
         t3yKI0Ol/KAqdsrD3eC3pIDKqULByxnUC+QkMyH2wcseQ+9xAZ72EDYvhZ/ZUM4lVrKd
         Z+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776103446; x=1776708246;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uG6p1MFp+26v87RPXmsW7BAV+LfDZF1OPvLL93JOuM0=;
        b=HksTxER5xlrkRSsdHIXflZ2HwH3rwQGQVpuLWpbzPFcc+8YMWzzxKq+oK+KNXwjKg8
         DBaACsOg9U+mOWHYbA2evyY3thq7ctcEicFLdF2Wmt0Cq1t1ndqy0buBKnKURA9hAph0
         vrEw8loCluP/gOBFYdg4+8z9RVEr8ilrWbm4ALlHhfkah8ARgsH0cFqEBUXwMBVn2pN4
         8or+GuZHuFYUJJxxL3e/tfvHzP3ySJLvdcDaL8F15NqickA4zWTVre6GQWOPb93HFJ8x
         RXHOGp/hWjNBuz45qpnHFmx2tkjOMIXQ4gz5ju0Mb2xHg3Q+wBbp3+gFZPEyWWNyS1TM
         5N+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/pLnQQS/j4CIYpueDtjEFe+T7n8IxhbgZ4DQZPAD2XW0m0S9Z3SJHqUZb5fjcO8Ib85au5f/mtsws/6c0X@vger.kernel.org
X-Gm-Message-State: AOJu0YyFqpmNH2D2Ws5Zqgd1Dao0bypLW+aVS9NjTA3V3crzsLYrTEsD
	1NxpnwebeUo/SLzHGLAW1vY8SxAzaPz8EuBZnrwDMqNthL1z0sXqhmIQZWbAUUq8AYQaC+YrQt/
	HV7KnY/wPC3M9j+Cr7SZQylJlUyNAVugL8ECe8TAg1/2l1svaEOdcXsHgLU64iZVWl/gC
X-Gm-Gg: AeBDietzMFwL9hIXQzIVN5lCNUpfnJ6g/7jGPGBwp7YOE4sv7v+qZxx7qkHpVAnI+rR
	t4QxQsPL+R/oB/1ZdDMx3RwQlcR4u4tZ5QhPWTm2yikYmbTiZPCruU309Fo9EtFoI9z9T10Udgd
	xadbCFHzjkS8hzw0LNxrzO7m0jKfJsSt70KgTY8b/XFfeY1J7aFty2+LpMHy8uURNDuyEIsIY2w
	un3We5D0CLOz+LIkXdIwZRYa6HzT/y0JOfFOiXXi8+04+6usgLaamzZszTgFDAIUnAB/ULBKgeU
	yhF70ACvVnyaMyli90h9J5dIfYE3UZ4DfeePYrFjBe7FHrOCWE/SNE/JCNQAB5GQyOztN9gXqWG
	P0vaGtg8hy02O0xGljBCrKEEvpwSE7LZZGndoTYL2+nTehQK+U4N8RBjBHGNLryG/NEPFWYoRmt
	WayHypRIcn0OrHUDzzwR6+CAqLu06kzP/8JK/YXs4l/BqlWg==
X-Received: by 2002:a05:6808:67c5:b0:467:462b:ab0 with SMTP id 5614622812f47-4789e42be12mr7589017b6e.2.1776103445644;
        Mon, 13 Apr 2026 11:04:05 -0700 (PDT)
X-Received: by 2002:a05:6808:67c5:b0:467:462b:ab0 with SMTP id 5614622812f47-4789e42be12mr7588959b6e.2.1776103445107;
        Mon, 13 Apr 2026 11:04:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee865e7sm2765700e87.10.2026.04.13.11.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:04:03 -0700 (PDT)
Date: Mon, 13 Apr 2026 21:04:01 +0300
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
Subject: Re: [PATCH 10/10] drm: of: forbid bridge-only calls to
 drm_of_find_panel_or_bridge()
Message-ID: <nligqvm3lq6n556onglmb345arxztd4pc6fboo4yrs3bfu27eu@uiyu2xklnexb>
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
 <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-10-acd01cd79a1f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-10-acd01cd79a1f@bootlin.com>
X-Proofpoint-ORIG-GUID: UqK0dhwKEzqGvSHJ1wl7q9Korr4XbeIJ
X-Proofpoint-GUID: UqK0dhwKEzqGvSHJ1wl7q9Korr4XbeIJ
X-Authority-Analysis: v=2.4 cv=BoitB4X5 c=1 sm=1 tr=0 ts=69dd3016 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=P-IC7800AAAA:8
 a=ihHiGccrl-12bfV6lMsA:9 a=CjuIK1q_8ugA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE3NyBTYWx0ZWRfX0UOgKDd/vEDv
 lxIyO4RvGxH+/GX6JVxxxjbAT+uZDSKbAQDARqNTClYt4e99vlcnNCtc7cxsT9ibYdpne6HgiI3
 I/C+DLS023HFren3IVoGyNGzmO3ZRgKddLgT3y6r3YlOUo3M6w2rw8RysDdLa7hMQgBg1/6/+af
 Rik4S7YB1ZH1L/HBg8H9DroAb9oL+FkFEnwaMijCgidzyf11HUEIv4Eu8T39v0caV60e3ZEBYMn
 0plStmJEgaz0vvog4MRsIH+yUTl9RcSD0WAAL8wUaUuI3tAX26dpHCMi/ESUV+hHI0eTzb4FPJ1
 JWt0WIOWoX31QRPwBOLYGdcryfmOha3IaIXorJ6GQal11b+k3hevwkxUvoYawKCMBty4BSXA7eK
 ISUZi1bxJ4pczcSgk5yWZNINF5t+6Rd4tGNz9sKT7Lu+GxsSknbYOsmqvAsKwoBcoaVnIqQIOE9
 XW0THin4t/Y8m4iSQqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130177
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	TAGGED_FROM(0.00)[bounces-102987-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,linaro.org,hisilicon.com,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 159C03F1C87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 03:58:42PM +0200, Luca Ceresoli wrote:
> Up to now drm_of_find_panel_or_bridge() can be called with a bridge pointer
> only, a panel pointer only, or both a bridge and a panel pointers. The
> logic to handle all the three cases is somewhat complex to read however.
> 
> Now all bridge-only callers have been converted to
> of_drm_get_bridge_by_endpoint(), which is simpler and handles bridge
> refcounting. So forbid new bridge-only users by mandating a non-NULL panel
> pointer in the docs and in the sanity checks along with a warning.

Are there remaining users which still use either the bridge or the
panel? Would it be possible / better to drop the two-arg version?

> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/drm_of.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
> 

-- 
With best wishes
Dmitry

