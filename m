Return-Path: <linux-arm-msm+bounces-86751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5241FCE54A8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 18:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45C4B302BA88
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 17:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FDE92367DC;
	Sun, 28 Dec 2025 17:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BEwij8f4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d8PyeuOv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE3C23EAA0
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766942506; cv=none; b=hz++2/9St6MUcgHVLWtNyC0thUQsnCYqyNC4qIqzmDc/zwJ8zseaREBCF/cppzqEgLbZjMEAauPQTY/IGT7IGnU4w3iyJ7gGCXEAevRTaxNQ27ImTVSR8U4dUzmgnd0F9JNb1NvbuPcVJUVtX0ubHoYCkAxTust2/IBJ4DuLVnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766942506; c=relaxed/simple;
	bh=AhjL5n0KqMn00LisHx2T5B6vTrBvTjUUJYkgUx2rS80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HjuBClquUGJ3xZ79fwCXP7K17ukDtz1tY7VQ7TIUS4zM7pbOkfS8Npm227Vf3F/47wiq6JxV+LnLQtQvfzfaY+7BYXlCdG2SgilDuvKl7Dd5SPjF/xlDoS06R1hIMlYETgiSwSr9Ni4QRJop+EoTRxsEMJqLKKkSs6DbJ9Qq+eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BEwij8f4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8PyeuOv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSEmBiM3489045
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QwKCOLaLwEVYb/ydqismQTZCLmcdjRauyMNTqQmx16w=; b=BEwij8f468punwq6
	urKJB9CgqrOEhjKjBPwBBQXG2Ilhu1me2Y8M2L+iFIkvhgwNJybHYhrBCyDkvzOp
	jVx5gZ00XNtkC7J/J7VguH7FjCj78ZFy2j+LVOhNLFfRYXYTgJ62udHdIwgIo3sr
	3221YP2zI1V5Au/JthDmcXGCuik8AcGoq9kLIAP5RwhdRtLDvAsp2zc/T8vqth+1
	eZtJvqyr0V+idOdxnbYqL2mGH3JXZ4lAuNnt09lwMr06yJ0lIQB3RdC93fqswMGB
	xXPfIvwWnEvqC4V8o1z544t+W/lrFu15e9AQzQWVPOQhTxXnDdZ4JsqLkdRg3Z+3
	lEga1A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6f62jah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:21:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a32bf024cso86747386d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 09:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942503; x=1767547303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QwKCOLaLwEVYb/ydqismQTZCLmcdjRauyMNTqQmx16w=;
        b=d8PyeuOvzpi1qCXISrbPC+J9ocsh3DPUo5xcekUlpznDd6TFBNVKZ9pVjgn2hRhdLH
         KuikzENFjmc6b65KdSIkPriSti4tqSAPkxOQUBPwp6fr3wXjiValpLoPJ4PYNWCEYdmE
         AMyU5wLAS9ilTnvHxM4jdKiH1zdxKmfkwD6BjVFkZBcmwcOCs9E3VjY7Z9Js/DwbRrAV
         gqcOmtIfGe0zwAJ174bntI9OuIjzqQ1RFnxPeKE32tXft8wrWWT0EfjLmEFmF1Fumsae
         Sf6N9U72VkZ0CVV08qD2CKgZcCWv2Glg1U2t9NU5d+usp0g05tGjr4W044dx3SX7UHaD
         i5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942503; x=1767547303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QwKCOLaLwEVYb/ydqismQTZCLmcdjRauyMNTqQmx16w=;
        b=XHvTb73Ulr/C6xK3z93rpv8DZM92zhfvbkwHSg9fFACkApP7aorCEtC56v7wu38/1+
         iisG5dREY5rrC1t8TvUJipOhaFQl8kQTbNXMNLqYjllTCnBaGRUFJa+zaW6Ja8ixoR8x
         ggU2+DtsFrqz52fhhouj48sjrBUprO6jb4p+e/6LbU7zjP24SFQ4xuczZVcq5AbIvJoG
         htVONK1DKwGOOXOcq4dm5X/E6BofrtViEXS5SLC148xkhUr0A7Prfm9iG1G+VL96e5Vy
         qm7+XhKvLgCvW4m6bklLelVqMJSOUl/xBgveltBpNFxcbgKeqyWX4zBNqp/l4zxsSFTa
         kgkA==
X-Forwarded-Encrypted: i=1; AJvYcCV0abGIJccoVzLzFwlHIAYiBkogIgdWDFNE79thaNd7RMHj7Hl9y1SY9Pqw/uDBLVVBOSp+OGPV8WJP5JRL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5pTugudeCyX35aszdYz0NVNuIA4Upj3TBzqKfFSabelTH5Fur
	SSORWs4IcV5r0NolsND9sQ55kz2jaMZcmqUYlXneq5LKXC6sXqxIrQDhT4h5YDzayPQIQ7dilzd
	2HdjO8MyKeEAX3y+jZegwg1iXyvAu627bHfxsTBUgXeJqA7hZwHhLRLk4LhZ6p5sZcV0V
X-Gm-Gg: AY/fxX47WvoiZ2bAKY46EDXg07ooJwKTZVAofhO475H+3n97aakhPmiI+8JrdTCQSK8
	j9ejuS13YibpOHJvQIuq2Gp2tU3rCVL6u8UQg5QpHOtO9Uxlg6MbyASwou5TATE/Knj59jdAtBS
	Yxnu4Uy2F+fSPlTaQIXVE58HCRy5nOF8AdUXwI5u/WNsaIhpNlg+emcRvy4OE9N+cJyU+sbuE8s
	5KQfa3aCwT6bgpo/by7p3Xa0YGKgDLEsuirIsWo00Qi50thvr4XuSeitJigAB0A/t/JiYRprljY
	nlzfCZFVh2ZyVqbzgnaQeYf/NAqD2vJjlz3b1vBkwDMCyUafEZWDXNo0IfHCgrVjCsj226wH67f
	A6+AP83OhOab7BqRZZu8tgVrMoqR8gvkIQaEH+KyU0qNnq3ruLtRFcDzhtGJZOSdWgadXa33as3
	0ID96G+J0XLs4e0Yfs8py0CpQ=
X-Received: by 2002:a05:6214:14ac:b0:880:48bc:e08f with SMTP id 6a1803df08f44-88d83793405mr311516486d6.40.1766942503352;
        Sun, 28 Dec 2025 09:21:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5EUG88eN7xWHCQu1kB/Om4DasLN+n2uCUeGVvVxm3AjAOh3j8JLRR73QWpq6YGG91jGc5zw==
X-Received: by 2002:a05:6214:14ac:b0:880:48bc:e08f with SMTP id 6a1803df08f44-88d83793405mr311516016d6.40.1766942502851;
        Sun, 28 Dec 2025 09:21:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812251cfffsm76871031fa.19.2025.12.28.09.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:21:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 19:21:34 +0200
Subject: [PATCH v4 2/8] drm/amd/display: use
 drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-wb-drop-encoder-v4-2-58d28e668901@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2978;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AhjL5n0KqMn00LisHx2T5B6vTrBvTjUUJYkgUx2rS80=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUWciqEro/DFsCfKaexLHG7KTjaJzdmaEO/86Q
 /tztctUKI2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVFnIgAKCRCLPIo+Aiko
 1ajxCACH793b0lsnrCbvP33cFhq6yL0q59eHuPMhmnMl4PbAf74U2q6vkmuhCLbqWCyjjympkm2
 F/QcVzF6/2fMsBgWaxsNYMVRtMEayNK7VupJM/1PgLNA0wAVIhFcD1nGQ9aAoIUL3hD0ssjtLSE
 9+AjggpuA2/LVew7AVfi28UvHarYVEjG/cdGTOH+shJS4pH7Uc7xY64PV2WAV7gcxdIF6LMqZF8
 zVkVffrU80TTqtUmnaNTLFzL5KTn2ydJbita7NEyIvP5RCWD2I94OLeJHb90rtbkm2B4OL7NFwl
 y1FdVeZNaoJYHJgm5XqKdUx1uN271EkIn8vhU3oofzZ79v+n
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Ps8cFixrVBgM6PbVmU7sGF_OfaTTqhuu
X-Proofpoint-ORIG-GUID: Ps8cFixrVBgM6PbVmU7sGF_OfaTTqhuu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OCBTYWx0ZWRfXyZJqKTFclC4X
 B/uW8K3Bh3PSr1Lh90bcyvmP1NibQWLsQdiyTfmrJDg1Ibc6E2W8dnhxxKsf2Iz9A/6sOhPXd+G
 93v58Q0Pwdpp/llf8L/dBfNzJjAdDGe3nMzOS+YSH7Mynz4fujviwpdSqBsmXKNLCcyHp6pwzh2
 uEQ2EUJvOWMqB1Nezf6tG8ItOE31vP7BnxyxMxqqETVgCiTJA07u6xHQ5XN1VHfJolsah7VLRvZ
 3SZtUuk4aAUiBO4NGxIS/dIhxTeun+VHPpHDbhyV3B2JFRCobe+9HhBRnhnSrW2aGGLh+uJXAOe
 ZHCr9Edyzp2n0A090GSVyrey8V3aGRiFgaBKOX9rERk0b+O4aB9gzLwbYGxbrsCrgMHGSQRBfmD
 Tc8yxuO1Fs0FQtiSFPilmhed9ND+gUe2aGTDOMZOiLcaO65IjgK1vjcgJzsBFaCjWGHYTGuItB7
 Uu0NDMPvh5Umd906PJQ==
X-Authority-Analysis: v=2.4 cv=YuEChoYX c=1 sm=1 tr=0 ts=69516727 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P-IC7800AAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=8cP71iSYcfV9S7Y4u-4A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512280158

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c | 18 +++++++++++++-----
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 740711ac1037..45b3c8f16b23 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10570,7 +10570,7 @@ static void dm_set_writeback(struct amdgpu_display_manager *dm,
 		return;
 	}
 
-	acrtc = to_amdgpu_crtc(wb_conn->encoder.crtc);
+	acrtc = to_amdgpu_crtc(crtc_state->base.crtc);
 	if (!acrtc) {
 		drm_err(adev_to_drm(adev), "no amdgpu_crtc found\n");
 		kfree(wb_info);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
index d9527c05fc87..80c37487ca77 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
@@ -171,7 +171,6 @@ static const struct drm_encoder_helper_funcs amdgpu_dm_wb_encoder_helper_funcs =
 
 static const struct drm_connector_funcs amdgpu_dm_wb_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = amdgpu_dm_connector_funcs_reset,
 	.atomic_duplicate_state = amdgpu_dm_connector_atomic_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -190,17 +189,26 @@ int amdgpu_dm_wb_connector_init(struct amdgpu_display_manager *dm,
 	struct dc *dc = dm->dc;
 	struct dc_link *link = dc_get_link_at_index(dc, link_index);
 	int res = 0;
+	struct drm_encoder *encoder;
+
+	encoder = drmm_plain_encoder_alloc(&dm->adev->ddev, NULL,
+					   DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &amdgpu_dm_wb_encoder_helper_funcs);
+
+	encoder->possible_crtcs = amdgpu_dm_get_encoder_crtc_mask(dm->adev);
 
 	wbcon->link = link;
 
 	drm_connector_helper_add(&wbcon->base.base, &amdgpu_dm_wb_conn_helper_funcs);
 
-	res = drm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
+	res = drmm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
 					    &amdgpu_dm_wb_connector_funcs,
-					    &amdgpu_dm_wb_encoder_helper_funcs,
+					    encoder,
 					    amdgpu_dm_wb_formats,
-					    ARRAY_SIZE(amdgpu_dm_wb_formats),
-					    amdgpu_dm_get_encoder_crtc_mask(dm->adev));
+					    ARRAY_SIZE(amdgpu_dm_wb_formats));
 
 	if (res)
 		return res;

-- 
2.47.3


