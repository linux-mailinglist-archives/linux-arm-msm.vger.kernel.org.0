Return-Path: <linux-arm-msm+bounces-69456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FE7B28F0D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 17:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46EE71CC7997
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 15:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224B92FE064;
	Sat, 16 Aug 2025 15:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X5Gt1UWk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5034C2FD7AE
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 15:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755357593; cv=none; b=T+11GBVKWDvX4TxSMXXTBiqisJ2fsvlNZo2ZCUt0wzvfWr+mrCEuCA/AELeN2Z8Hcbcld/v4brpKwY7Tdyer6kMYW9U66sLJjfOnxFMbObObatX3wUUYeQCt34dQ5nYUGyIsfJ+sKSgA0TowIlYJjcl29CuttcRXmTbRFWsYVDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755357593; c=relaxed/simple;
	bh=/fLUas0t6+pmOh4Lpow6ATkHgTqazIs0UqCL1npG8PE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ONlxvDb8IPT5Ppe8kdejl9zoQLfFNGUpOrlEEzHrtzGTOH0YGsioV0W4q/aAL19O/vGH632Th8JuzbdIRYW9Q6in2g2P2vIAE5e1QEuWaynUD1ewfSlbIJX+LeIfn/Y4iTuHFeJMkNtTbLpXDSe7ynv8zD8pp4bgmAeUV9+gY8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X5Gt1UWk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G3AZNS030473
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 15:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qV+1O4itHxYPrihyEQKWirrQ3uqLooPtU+1YJ1+NTiI=; b=X5Gt1UWkBtIMJCFm
	C8L7MumhPmhoSG0JDTascQfKTI9hjhrhWUT6gbrN7YuPvnXR3pQr58i47YtlolQN
	M9404pODYFr7CzBpOICBjFPwepXwNswGlCBnmColodWNtAyZq4hzs+pl3ogNfW1B
	Io/VFH5qHPn8Udg6EQBqcsDBuFvhSkQ7tDwwZO4Rkx3N10j592iQjdPdOJdo4mJi
	JbwZTzPi0guL22dBHpQqI9VBC5u/2JMpBrd9evWVZ4EkZats8p970cEjfmK6BnTz
	zHr5v/oy9oNz1LO9J1K5KBBzMAnmEk8OU00Cj/P8XIbEGtcxNzGBH8cx2XShyKbj
	O1rWgw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh070w57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 15:19:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b109ab2cbaso78257911cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 08:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755357589; x=1755962389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qV+1O4itHxYPrihyEQKWirrQ3uqLooPtU+1YJ1+NTiI=;
        b=YbM1VZ9pdK2QN6q8+qplpEkjBOQg/AeP1YK+2Afo6IRmWFJOAQZIhtN95daHh7mILb
         dy5fod5bUegWsSWmP8dKSOUSsFMZQ/wNizKCvcK9XTN//0vMDlQlnV7yFZ8+2mUM2Q9w
         iyiRYq5SKUw9SAeT6/cjxqslXeahHDher+DHnJB68628nemDlmAl9l7Wx3doOcCeO1KZ
         DxBCUB3WXiM09cHZN/STiAFyZCHNy0lleIzNlf1r0wdXuYhxcFanc0Ztin0MUOuqFbkP
         l8PlYK4XM4wGUEtvlEPEgA7uMfBv+MbFsgxCumC4aas14qonNrxm9R1RO+CL+aL9ZgYM
         LTuw==
X-Forwarded-Encrypted: i=1; AJvYcCUtU6YaDkPKebVcOhuPTRBK95R+XZO6vLkoOLSGxFphzV59f2Bg9p5SNTKEp3Qj0mhRPIwf2D2DOSQMdUlq@vger.kernel.org
X-Gm-Message-State: AOJu0YwsdZTdWic0RiQJkN5ov5xpgG9BP5QzAO3imk24Z0Ng4R1hoAfx
	vArv9/t/7194uDaehGkBx2wqo/CMhdb67rWrGifm9WUVRXAG2UpLHk8aD1bohbVKRMBR9QN6713
	1q1bccSeCXnM7A+DRrgOXeRJ9x8uCauOdWAkv3aXQ5IdB16fiMP/bpetcyy2twnI5InZt
X-Gm-Gg: ASbGncs37a2uAVxdZNMgdEwmlGlRVnz8JQQaDydN6hIA8OsrByV/oL3S/BaRjgqj7Qn
	wJXXFVxRtiAeWO6ld469gbZOTrdsshMBPH6yi7AXueVJTD+0DSmphkqQfUjRq522hHxM4QaWQr6
	rANUbC/N4McjF2TVNPc+hQtPQ5/GEzhYTMt+pA70IEFKKDI/a0yeVa6IhqCnyfYmogkMZ2bu9C9
	3CxSjczYRgdptjvY2Z04DQDnR6tVeXcEF/tQ5OvhYTwkKmrsMVD4LBlR5nBE8BHmL/DQwlfuh4J
	GkTTlA5w185nBRPPyMemm4RHboBmccsaPjhboqYjKYw/ajzKd4oAseWiFFsBJ4boFJn7coyXgyV
	uQMqWC0PYEQqjDsWjVpGILzQEgepGiyVXRn6xzx7VLhOvB9wGSWZX
X-Received: by 2002:a05:622a:1803:b0:4b0:69ff:eb71 with SMTP id d75a77b69052e-4b11e05f86cmr89079331cf.1.1755357589312;
        Sat, 16 Aug 2025 08:19:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4j2k4YAYzpQ0pMCPbpzOT1o6CdrG9QkvoXk17IoZ7zfFypPLXZJtxqIY6aSy3p+i62FJnEA==
X-Received: by 2002:a05:622a:1803:b0:4b0:69ff:eb71 with SMTP id d75a77b69052e-4b11e05f86cmr89078721cf.1.1755357588831;
        Sat, 16 Aug 2025 08:19:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35965fsm907579e87.37.2025.08.16.08.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 08:19:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 18:19:39 +0300
Subject: [PATCH v2 5/8] drm/msm/dpu: use drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-wb-drop-encoder-v2-5-f951de04f4f9@oss.qualcomm.com>
References: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
In-Reply-To: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
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
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2304;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/fLUas0t6+pmOh4Lpow6ATkHgTqazIs0UqCL1npG8PE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooKGJrX/EOza+6SHDDyhh3b0F4k58JM15op7JC
 zsrf9qs2FKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKChiQAKCRCLPIo+Aiko
 1RPCB/9KsE7LBH2gz3/CuiP3n3VWw21nUSaR2KEoT3QNbRnJ3kkvF8BVfxyPCfMPXyL8GP8+X+W
 1eo7ACU/9lwfSLQKW1Gnv3ZPNYawwta+UR+hdHck6Lfeu+kPxKKOyqfVp+p+zVXa0SQ93cL/NEf
 JS8K/7gj1Mb0FMolDe1qPEfHsG8P8LPEiTcY1SzvEDp94WNhqZe/hngjRryF042P4d0Bj7worm4
 akTK/ST6rN9abWTt+MI51ZZc9SW1GkAGBQM6+yP9YItM403Q2JqK6zELkFGY5AXyQ8ICXLx+5Rb
 2lSOj6fPeztw3nIfRul5Iclrps8maUSX1XJImBsAqhNG89N4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: NHPgv7yGsejDsBoX2Bc280cTVhcoynzL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX1OvgdaUkrPyp
 hb6eS+aDt1eBEWuGtE+yAt0DNhIjDUm424dGq/8y0Bo8c3Ubf4vXtk/2Hj/1FGpciSX5rT19PGD
 +aweD9DW90wkxCEmKoUbM3OtWG4H1fpCCwzNsJHoHKHAmTxZ7OFtWTM1phMGm6lSouu5WoVwjsQ
 CrSmnT/l00aG8AOiK04Cfwy+i4yk4wijr7imoqGpTOV0nzx9I9BFxL+A/BmTSvnq/owYAvFWEh1
 saP42DgrVeDgoSXc37XJps5H/06xo6SWQO2UIZOuu0LVDzz1eNytk4l0mKUeur6vQ5naz54kFwh
 rt6UyRDQF32UPeOjvj6Z9O6asEfdfB9dGIb5PAP3iKKksitwSyy6Vh9o1vJUVIKilFvElxNHAv5
 ckYz7+32
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a0a196 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=mhD89yN676IZukTL2GQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: NHPgv7yGsejDsBoX2Bc280cTVhcoynzL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 23 +++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index 8cd37d7b8ae281cbc1fd8cbb243c621174517e23..64cea20d00b38861e22fc53375ab41ae988ceb59 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -134,7 +134,6 @@ static void rcar_du_wb_conn_reset(struct drm_connector *connector)
 static const struct drm_connector_funcs rcar_du_wb_conn_funcs = {
 	.reset = rcar_du_wb_conn_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.atomic_duplicate_state = rcar_du_wb_conn_duplicate_state,
 	.atomic_destroy_state = rcar_du_wb_conn_destroy_state,
 };
@@ -202,15 +201,25 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 {
 	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
 
+	struct drm_encoder *encoder;
+
+	encoder = drmm_plain_encoder_alloc(&rcdu->ddev, NULL,
+					   DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &rcar_du_wb_enc_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(&rcrtc->crtc);
+
 	drm_connector_helper_add(&wb_conn->base,
 				 &rcar_du_wb_conn_helper_funcs);
 
-	return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
-					    &rcar_du_wb_conn_funcs,
-					    &rcar_du_wb_enc_helper_funcs,
-					    writeback_formats,
-					    ARRAY_SIZE(writeback_formats),
-					    1 << drm_crtc_index(&rcrtc->crtc));
+	return drmm_writeback_connector_init(&rcdu->ddev, wb_conn,
+					     &rcar_du_wb_conn_funcs,
+					     encoder,
+					     writeback_formats,
+					     ARRAY_SIZE(writeback_formats));
 }
 
 void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,

-- 
2.47.2


