Return-Path: <linux-arm-msm+bounces-86756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3F8CE5490
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 18:32:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA80D3015E07
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 17:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7FD2D6E78;
	Sun, 28 Dec 2025 17:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHYPAMyU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SEzhhEQQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2822D595B
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766942516; cv=none; b=fg/XEY3HOltXisyo+GfzrucJCfO92HIz6nML5lzHvL19CakLR8bEzQOr4V/Zpl+MLor+KQHjB1wBCFfcZFFQvGrw1oN1jyphcGtIHKOfUgfBlCYJNRX5+cRm2dKmXUtxAW5ATEuNRCA+0bd1gy1gSM/6kaSxlRCmhfcTxuViz8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766942516; c=relaxed/simple;
	bh=xzYTa/EfA8HI5QOy/2+R2YoV5rkgAh7n+QXK0lkObWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XbiZebX8j9GucavX0cgeHdpyhiDBLmn/k1TXPj6XL/DlDevxqbBMV8TxNexUORdJilbl2oshOZJdd/SI2+FL/SEyvMAvKqYom/38YDJZSsAwc4YnPom+9cNJWzgi9vlLm7YFjkNcW+WrUSGwKeCuUGqAQP1NVn7vigBY7b3vFbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nHYPAMyU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SEzhhEQQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BS2IX4R1792534
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	stPaTlDyP6pjIcLXxQYHh7Ugkri4ssOkoL6G6tZaLY8=; b=nHYPAMyUOg4sCsC4
	eB2ocb4P+RrJTbrr2y+1AnS4GWXykf+30iVKmKrxfhWMXN7G7naVKHSGHx/5gaH+
	Q/Qjm+FpVgVYXStDPg86nHoGVpaZe8s5N4+26SfuTnzB4XfduT9iKuavdpu2aLlX
	EAf1wOxVxh3fQv4KBwz0bVIU/hZF5h/fqhg0wOoAjk3R+ZemDHhRvM+dqeMmwiQS
	IY2ufqEuY2hAz9DkeWrRKpKwc6osNB5VY5wxro9fHx+ZcjGjkc+LG/9l9PMCQF7L
	Qu2ew0tn/y7tbJtB17mpXJZKvmoO6SXpKmndZ6KxVUDKubC01Fnp9pKxKx+5IMgP
	4dF9Ow==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7u5jeyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:21:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edb6a94873so166132391cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 09:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942510; x=1767547310; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stPaTlDyP6pjIcLXxQYHh7Ugkri4ssOkoL6G6tZaLY8=;
        b=SEzhhEQQiXK5lURKQ3i+S1Qr6jV1zr32fZNHQua1izH8W+AM9l2d1A6JQ4/cUuUuuL
         9JATqmdz25K+5P4xQ8KzBlRedA1BFhg9hcsEMz+8Ek/EDOCPa96eRtEmy4SHWlcOfJF+
         Z1yIzv7XpEiiXhHkkZO3hLo1eIQmB+rGCZhkAt3bGmPxUyNYMXebvOA0eSdz7DYw73Gy
         5xnF/45D4ccR+OOWQTDsVfCvjBcl3iyNGG22x6ESl3IhsQ4oFOB/TfARgAEGWooJDOBv
         NHkCt1D6c7Ze8A4EvKAz54qX3g2z5uBVorljDW8OkpPqcN0Yh8LC6gBku8RoUQwGjnXQ
         OH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942510; x=1767547310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=stPaTlDyP6pjIcLXxQYHh7Ugkri4ssOkoL6G6tZaLY8=;
        b=uVeLb/aEm9L4ZjOXtSlbgprxF8FMw8V5cgD9sm7k834+GD+CVpVPbkRp1eNDYfLlgd
         coJsx8hIDlfpwV7hvaSa5E8eb1bqyb5DiebfJWEvrNXYwsHrVojEDlrYRmcMq1ifW6xr
         3vpaHFmk+AR/hQGDKw4h8d4UUeD5yj3lN4IrrKiVgYbPEKXFq5Vy+Z3JjEqmvU3EZRv0
         doSqzfeWePnbqN6d3CfwPKnstixpQHi7MVrXJcxwp1CKh0/ha6pJfTMHOs5vzJ1v4XUm
         p/MJ5udCNvLt4gEBPgfC0TQ4n1rrdGU/+UfK5UFI0B+/J6UNd1mL9He4+NGuXznZV30T
         6EzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnqXJynoGwW7RtgORp+mhWV2F6N+nZigotIkqjUYYEmcJfPQDQjCG4Zgt4+sxJc5uUth8QEPOeQdDAStrX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2j6z31NtC53Jb1lxWcxOKielBq7md5cDHMAqzENn4m+8xvw6Y
	Cc4WGihom9MjNJiRRHO2rjMh7B2aWIZjeyJNJcHadaZSkcBjnp4xgvV2IsebckdXIMb1SIDtm5k
	kpXQgMheRXIl5cOSbUufjvtdQ5wmmg2mV++iCO5bhM6ysT+6YIuvyKy26JjX+WcL3/qOr
X-Gm-Gg: AY/fxX5CBYObnM9epMiBVgchhFv+9ecczpV0R54hAQEeir4IzVMtzqhjZUPWV2inHau
	jqiVv53L10p2SnvNGH6Tn3fNpDcragMOQH6ikdgzizhbWqv8MdFzOGFIN3QIphceOamVZgPNSla
	bN+XmkgHpiWLl3q0nqEEgxTBlpbAcOIXoJknrwXAUsTZp7h2AIHoiT/RiKuRb6vWbT03P/3Xklm
	xpJxuscg7rg5oGp/RcwvFdT0FcNdu/8XxrikLb7RcD3/g4VOFBo83lugvAKJ6rjgwtM77ZjpY9c
	piFve/qJ+Q5YzOWdvelRT6oiP9ur63J8bqRLjw7rHElx/fjG1oq2GkBzJ/plqFbE+mL8ZgB4Z6v
	Mo+h+le7+vyFuq2EREWH1B26j7h4wZLRZB/NMnPz6gkw9oq+9aEE8ka32opE2q8QXcjF61I/Mp/
	+mkkgmkxvHW2375HFCwzGoYhE=
X-Received: by 2002:a05:622a:1f88:b0:4ec:ed32:c3f9 with SMTP id d75a77b69052e-4f4abd055b1mr480630071cf.29.1766942510585;
        Sun, 28 Dec 2025 09:21:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE46X5ME/cJSAhXh+LJc/4rpNKJJcT6TLHe0qPrboYnIgch2/evOzlw9QUxO7vnvIRO7gsLtA==
X-Received: by 2002:a05:622a:1f88:b0:4ec:ed32:c3f9 with SMTP id d75a77b69052e-4f4abd055b1mr480629561cf.29.1766942510201;
        Sun, 28 Dec 2025 09:21:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812251cfffsm76871031fa.19.2025.12.28.09.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:21:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 19:21:38 +0200
Subject: [PATCH v4 6/8] drm/vc4: use drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-wb-drop-encoder-v4-6-58d28e668901@oss.qualcomm.com>
References: <20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com>
In-Reply-To: <20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Suraj Kandpal <suraj.kandpal@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1683;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xzYTa/EfA8HI5QOy/2+R2YoV5rkgAh7n+QXK0lkObWo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUWcimSXjC5I40z+YRP5l4N9Pd8rbhOQ57vQMn
 zZaKY2yKwOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVFnIgAKCRCLPIo+Aiko
 1R9HB/4mQmUa/OGajO4xKbD2IFdVvt+++OOPGvLicDm0j7FhJTr7p//We0wf1N+GA+QqJGZ0nxy
 V4ezDgOozgp4Uvx8QVOLOfZz1xUCjntHe6O4xTR8UBlaj/LqAjoRFm0lUyAdxxLMEyEU521iP2N
 ZbOLK1AC3yfLU5himWI3isf+GJ2dM/3dxP0Q1fOlY0QNu5wf6/qTsYGOUaKHuaiiVA6Di+FJC//
 +rGCKFkjOC/N5dGVyYL6EPg/z37Z0bKg7Niw01ZUka5FxAQFyR/SupZMD46M2HW1QCY2VYCZ2nb
 QUVy5ElbO6tShYK9+5jf+O7QjLkgOhuEc9COHlpUlxMEv6fO
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Vphi9P5CdTDreDSzFrRLj-LK-uzpJsCK
X-Proofpoint-ORIG-GUID: Vphi9P5CdTDreDSzFrRLj-LK-uzpJsCK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfX5iJ6c/ePfssa
 VlBZocBxFA8p3qaLq7dKcpdIgbjSZoVTWsHS/hLcOCViye7vbpcb81pdiJeSZqwfiCxl2W+Omow
 BfKtkmgB1gSq1Acr4h/h1HjyiQGJVZx6GdgPyN4dFLuTc8Ni4rzxo/0zLatG3WFNTHP3lSI1sjv
 9iP0a5RSrHdxQlbtyrwuLufjuDBs1jEywRebL4wX30BIrdNH5jX0pJn9SgcTz+TowbBZ37duP2g
 4CYdgVh5LF1Iqt62jhBMgte32iOGeSymOeL+W7tTA84+4tBYc2binFgOzvMA7cPHRkulfHapd0+
 yuV/T4tEcfFDgVZpo+beTodGfWuGFQO+5gEwG7H4rNN8TfAdrTTUxKQFleVRymiyR/jxlfAq7cG
 ZrZ0V6VLqpYwlcCLwH+UsEeq9/AV4K/dDhTk40fysArBhzdpYDsx+88kWg2Q4X2C3Gf4FOsQZF1
 WdkkPC37zEAWeW1Q4hw==
X-Authority-Analysis: v=2.4 cv=DptbOW/+ c=1 sm=1 tr=0 ts=69516731 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P-IC7800AAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=VKUx2AQ49gFIcjACzlMA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280159

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 9082902100e4..befdb094c173 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -378,7 +378,6 @@ vc4_txp_connector_detect(struct drm_connector *connector, bool force)
 static const struct drm_connector_funcs vc4_txp_connector_funcs = {
 	.detect = vc4_txp_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -602,10 +601,10 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 
 	drm_connector_helper_add(&txp->connector.base,
 				 &vc4_txp_connector_helper_funcs);
-	ret = drm_writeback_connector_init_with_encoder(drm, &txp->connector,
-							encoder,
-							&vc4_txp_connector_funcs,
-							drm_fmts, ARRAY_SIZE(drm_fmts));
+	ret = drmm_writeback_connector_init(drm, &txp->connector,
+					    &vc4_txp_connector_funcs,
+					    encoder,
+					    drm_fmts, ARRAY_SIZE(drm_fmts));
 	if (ret)
 		return ret;
 

-- 
2.47.3


