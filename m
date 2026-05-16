Return-Path: <linux-arm-msm+bounces-108006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJnQNHaMCGp8uwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 17:25:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 976AC55C5EA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 17:25:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA0923001AC2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 15:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC303E4C6A;
	Sat, 16 May 2026 15:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XP+lXIOH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XmP17XX4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F1E3E3DA3
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 15:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778945122; cv=none; b=jFqVyB2sV9kxW5kx0/unzq5XOFqxG7KhpqsmRHBoPy+KaYyJdxp93j/ReEudXMrX+L8WZ0itsCH6Cp/HXi/ki9SrmMpKpRG3N3sTr8UfgL1VTWuf46eN22dIxFziYrMkSRGVg7ueqU3oFo4rpIUJWUUPj0CZgU3Yy6WWk1XkntY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778945122; c=relaxed/simple;
	bh=IYkXLGpODyZu+AX/KfR2hmxrZu7ht4ALW0vOZEXhBsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rpBczKxibzqI+8euYNzfEi1sEb/w4XpMR9D65Hu0B9ihW/7Geqjogndm6cCu8+vRH+yEgeuiAT1GhWz1iL7/JrWZtVszraataLwvX4c6F9EwMBDriyS7cbo1vVdLTeolKzqqkblUbk0usSWJLm+pl/xf6kZpHSjZ+DfDR2PFKqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XP+lXIOH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XmP17XX4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G3er9K777183
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 15:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v2gcIEHC5V5+zmW6nZ7rTYwHa2UuXlAJLQXFWHz1tXY=; b=XP+lXIOHVEQFtbxM
	V5rN/AB+cz1T/pvmq8MyBHVJ8Fc7kO/029iL70BdgS7IiH3ndzr+jmh8v9AstqZP
	vbe6NzYcbDHlY/HecPLbCHmy7T9EobwnIxx38IAPlhkavTxYdOY5BfZuk+qs4C4S
	IEn3yuyaHRajuT8PjJk3h4KY8HxRj1DrO02wgaudUa7zypisXl4hHBGLmi2Q3gJm
	JMvDgxDrada0bEBbBnKiaBN5lV4D/gnFdyQ7IqDV9wFGSc1/286sD0SFXWEojQEk
	6R0A+hovoNNhmy0VUlmzrCQOiQbrB/crOaubXDkp1kNPEV8pu0FP4QIZHopfJeNC
	XkY0fg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvys5u3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 15:25:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514ae0edeb6so58356171cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 08:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778945120; x=1779549920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2gcIEHC5V5+zmW6nZ7rTYwHa2UuXlAJLQXFWHz1tXY=;
        b=XmP17XX4yIhkQO7wvZzWvy4qv03lC+XvN9KgIcNYt+b+dSxoqVqvXxtuIxKlts7Otw
         sS/tBwE6u1uws5Jt5AdxV4vQuJ33fgHscpzjPGi4qMo0clg9d0KrvPzy+sOqrBOuAU53
         fXjk+uxhrIzV7vo7Rx8tsgttrPV30ftxE6dxh+H8rUTJEJjLRPk6R6XrnBBCDKWGRU9q
         ZZBSBxMj6RhrGliQnQqT2CEXr1dgisJyOyHUJJzIM9+DqziCekUo/H2UkL5lLBt7uRM9
         Xh4eJGa9LjKl5ONypX/QTL7xt9+ffvqCluVzdGwvp52Va7Ornhs6OZW678bzf366vjHJ
         kGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778945120; x=1779549920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v2gcIEHC5V5+zmW6nZ7rTYwHa2UuXlAJLQXFWHz1tXY=;
        b=Bl5mmOGeo5OFjuJBv3iHn05syFFrWrxxjBxrC2ODHffvzbFFIR+FFVba9f6/LNoYXZ
         Qkx9u+5ADexT8lgbRaEwGPSGPdOqEGpAP7L7E4niMNhapM1iFzp7Wky55UBTuIgJOeIT
         ap/GSQGXnYndqxB/C8AwZki59D2sMECVgzvc9FcXOj5TLs4/I+2aul++gzems9JwoL8w
         3SxUL5RABHh9tg3IuSYplCZVpyz7ZuLYyBo+a4rltm2YFAfUOiBNPtmpVfLC0E6P6/t0
         VWLwUzuYfkr9hIHBWsEWLbXjYYwRevcHf7ZHeqlhbUFy30PnrSntxGvlDH96yTKPjrle
         HnWA==
X-Forwarded-Encrypted: i=1; AFNElJ+GO5x570y0pDMiYll2fBI4uNZBIErGxGpOPFEGCQrOZJNSqpUMPwLFhqHczGTW5R7bIV0r0EawER5UszG8@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs9SB7ecMMfFhZ/3QyQvT2hsScplm5gJZsd9b7jQQd3ibGzQIo
	aCktmagRMvI2MWD7T8R8IQlRdK0/p+U/rxWjK09MUmC8cwPkkWrC+DfEn7fScw3iwdoFezoaMaW
	X8i+KR9YKzcHE2IfL6EGtv0EXqQIJRUmXKADmiuBXYvCicvaK46yJ0/P8wZrM1qnee7Fc
X-Gm-Gg: Acq92OGVBAwW5GYk2AbEoSKeWt0Yl7SXTLinsAXTYcsMllNWEIKd1QVTdoim2ukNz8s
	CzGG51PI8lkuSBcY3eUZE62Nf3tRJA2Y+z0QowJULkzlguMUVCh0iHX+dKfUuG+DLwn6gCcHqG0
	cXfG0H+jmjmYWd8zLtuQGcNvV/Hh30Gw3cpWn/zZhSJdRQyr0HL0DH32kfvIruaO4eli4+EruZh
	YK4B+C6eTutuPwqooUt6gKmO4+Dcy0uK3kPwU5cePMuXlkE1qF6H1jS6QgSDRMSLB73k2vUwRIh
	NrEr6AXHQYeutDeEtwbd339+YcUQDvWyZg2uTvL0pn4IWF4CJ6SqDcHD9Mwn51R1ImGqlHDL9Zb
	4FqDeTxhDVs7vxxO6IoN1JzPjwZ7UcpzIcOVZh2CI1JSreAS7nGQHuZA16AtfUu9fzuUTkYyZeD
	vJVongk1JqMuHGlBXFHebbAN917eCMKItHgO0=
X-Received: by 2002:a05:622a:1386:b0:50f:b7b3:2ebb with SMTP id d75a77b69052e-51641928873mr165222391cf.33.1778945119697;
        Sat, 16 May 2026 08:25:19 -0700 (PDT)
X-Received: by 2002:a05:622a:1386:b0:50f:b7b3:2ebb with SMTP id d75a77b69052e-51641928873mr165221841cf.33.1778945119241;
        Sat, 16 May 2026 08:25:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164cd939sm2057972e87.70.2026.05.16.08.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 08:25:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 0/8] drm: writeback: clean up writeback connector initialization
Date: Sat, 16 May 2026 18:25:14 +0300
Message-ID: <177894506978.2448625.17152574519326512949.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
References: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDE1MiBTYWx0ZWRfX3HdMABfpllK0
 G48gFoasXDM5Ez05TZ6k2vax+nkPkvwqDvEFi0uojoDduMfmkCkDSwVchtcctu4xCIh1bZW+G9z
 otk+ms8uq0hFN8rUM4P6BKJL/zq4nluEP6yF+vLgkXb1sJW3B6Gs63xkZTaGLyOErdictbqQLuL
 PonCPMBYV3h6ZNS3zHcwPSbEjZ5eZ/P35xkBbRl5tHsofOb/hJG2ouuIAwiLwk6wNbXvlb7L8bm
 tfo5E+akiCO3LOIllyHN9+L0CfdcZJ1Ie994XaaHB9Dw7Olj3rdgAPPdJ1EHez1ChcMN1zAktf0
 O4VqZQriEfDzaXrNO4SOqrJvsUrJQJyClloMqdJb9n/BnNRBnPOlOwn/WGcRocR8z1ExgipDd++
 iYvcrHNVOliFfInqRBMtNioDs3nTDBFwWjH4JgvvxTKA3afSkvlLxMuh9o7hSMEBhFKQcYnUCHU
 dAC2am+V6yfDSGqVz7Q==
X-Proofpoint-ORIG-GUID: TukgELZDMyIpzq0O8C82AB-iGn2aU5KU
X-Proofpoint-GUID: TukgELZDMyIpzq0O8C82AB-iGn2aU5KU
X-Authority-Analysis: v=2.4 cv=X5Ni7mTe c=1 sm=1 tr=0 ts=6a088c60 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=e5mUnYsNAAAA:8
 a=XF3gkq58PEN6Oa2goDkA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605160152
X-Rspamd-Queue-Id: 976AC55C5EA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108006-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,intel.com,amd.com,igalia.com,gmail.com,ffwll.ch,arm.com,kernel.org,suse.de,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,gitlab.freedesktop.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, 05 May 2026 03:24:57 +0300, Dmitry Baryshkov wrote:
> Drivers using drm_writeback_connector_init() / _with_encoder() don't
> perform cleanup in a manner similar to drmm_writeback_connector_init()
> (see drm_writeback_connector_cleanup()). Migrate all existing drivers
> to use drmm_writeback_connector_init(), drop
> drm_writeback_connector_init() and drm_writeback_connector::encoder
> (it's unused afterwards).
> 
> [...]

Applied to msm-fixes, thanks!

[1/8] drm/msm/dpu: don't mix devm and drmm functions
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c0c70a11365c

Best regards,
-- 
With best wishes
Dmitry



