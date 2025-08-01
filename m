Return-Path: <linux-arm-msm+bounces-67362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D56FCB182E2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 15:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0551417A532
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 13:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7AA26E6FB;
	Fri,  1 Aug 2025 13:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ot71yDba"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD02026D4DA
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 13:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754056287; cv=none; b=By68/X7J5QYVFENwk+bkOVQm09+Sdu/f9P5pNOwTzaHpfb11FJN0sqk95sGwS0RR3YEThYsmvXVdOFZXtqy8UMig3T8PYhx0ZnNuBiCgdJHp8Mc/ePw0syIuE7ROv4HzL9IDPRBiUXIP0NQV08elRWzzniGdaXL9dJ7Hl9spXdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754056287; c=relaxed/simple;
	bh=4v/UkWVUd2usRk11ttudKMK/GFE7oPMYIMlz0jnkFl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ye7oSVaJkC5DJDtW2lkCocipRygvCtuDsWB4DMKf5wRo4ZhuytKq2OoG3mpW4tqJ5RD3MfScuZ4bjcRxPE4i2CM9beOfTCYt2pquFnteJPvEMxIdykatWMFYjo2Bb6MpAvQGkJvBwOuF56RKFNiBuKclOMjp+e++O03f/DZBq74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ot71yDba; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571Cob5w010182
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 13:51:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	278QZ0lFfDm835VGauRYZsYszXs7O8BAZXSyOh2pTg4=; b=ot71yDba/AH2AD6I
	Mj2dOXKQojk6IRbIcHcc2poCjsJKGX4bm8HdAdEldXhvifVAQe7sLwhUihEUpDxi
	Pl1EpZu8O1We7/iLGosinar8YzZVZdqFxpd4LK2SyUoHWVYQJ4ci6M0px+NDMHhX
	TWDrEjYRBeN3bW4rjWFBYqF04YLNWilWVI6WjXUBHVAGo6EpOUOyOG0lPHvjUaS7
	FWyYNsJtUvWoilTT6LAhGtrPZp+uzfxD+fG908le2MPVxQLPA52G8WkI+6uoF7zS
	t8Zf4KA8nqADiu5GRVoxg5//Jm3JaqPRCbGsBD7mSZj5Lxk/IQv1Bv9DHg9xF+nj
	4FoyrQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 488q7xsjay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 13:51:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70743a15d33so25861466d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 06:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754056284; x=1754661084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=278QZ0lFfDm835VGauRYZsYszXs7O8BAZXSyOh2pTg4=;
        b=DydOwbY3sFx4qyw97QFzRxZO837y3mL+QhnO4Z00Gu3rhjuOxu/0NQNuoXsnr/fYZe
         12LaQ4VvQqfavr9T+c8CDv+GxxT3A+lCqrsbg3gdb7JiMKr8vvrgAjwpyr3pwon1ou/J
         h0cb5Y6ILwWMmMa1g2v44CBv6qT7fT/axzEt+ycucXXE8uLH0v8tSRMlPxYHAgbtUEhU
         iWdp6Zv92cCNHwj05bOY2Sj12MOlHn2B6bFATE8GxZCZCWY/k8zHuEifLFvqP+12Elpm
         pNawNAaUZfgfQK1dF0QKWlvLvXf85OGlVzmbWIyMTZhZuM3IJ+JWPQTMmB2DrR6cnudI
         Ia1A==
X-Forwarded-Encrypted: i=1; AJvYcCWjW4zG/S+nlrAE1gBA0J/af//I+oB97EeiYwtuZJih89su5okiiXH/7hWlY98feu0PY4VvFh/g+YP69fLV@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxvu7hPL9n6ovhn4Sy48+QoIB4ROiFwe8be4jB8W7el0K1DUiY
	gp/QY+Zc62Qwchd+vgyRemxGiQkTarN17sZjJ8DcolHuLZmllH0aWSQs7khTTGM2CHD2+DQv7vc
	JaoiNs4Su9RwPR4NhmTtAoQJ2WxFoBsdQ/WO0IC/F8kRpMSB+0CyzRHReGFuTIbKdGYRe
X-Gm-Gg: ASbGnctpARMoqi25cUxPj71AmqIzZXduI07at0O58NuhXwsUYWN9I3AfrCeAItnL/0w
	ssgZsCT8enshpAehPx4lmxjp30jzu016FsfbHMzAaw2tiOpDPQ1KiVLlbz5x+qA0LKgALh50dFz
	eN2VnMGYlBo3UojtqYGz2sAc6QHFTlN+TTSQrW8ZEZomk0zqwyGuVDnRkFCa6cacs+BE0ryAffk
	oItMrOapj0CRam0lhN7NPofHymRTzB+vErf5EOusTOqTAF2Vqrhu1GGWhiPjpS4nRcFn6QSdhOp
	q/vv31Tr5xHO6iutRAgyleCe2xoEf3o09Sd9eh/QiTUxbch4rWbh+M1qqHAlIUMeoPM0raoVvwW
	462AjZa8YYFelRmZXjvCdSy9Lf+0uBUFy2RGUaruOr59iY912SGp3
X-Received: by 2002:a05:6214:226f:b0:707:4fec:c0ca with SMTP id 6a1803df08f44-70926508ddcmr38892556d6.4.1754056283826;
        Fri, 01 Aug 2025 06:51:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJom3kFAnf8JFuU2DiA4RfLsiaMRDn6FA+aJ51nDsVnUTvIGfyBP8DkrKWMMjE38R3E76PPQ==
X-Received: by 2002:a05:6214:226f:b0:707:4fec:c0ca with SMTP id 6a1803df08f44-70926508ddcmr38891606d6.4.1754056283051;
        Fri, 01 Aug 2025 06:51:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-33238273006sm5917801fa.9.2025.08.01.06.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:51:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 01 Aug 2025 16:51:12 +0300
Subject: [PATCH 4/8] drm/msm/dpu: use drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-wb-drop-encoder-v1-4-824646042f7d@oss.qualcomm.com>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
In-Reply-To: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4v/UkWVUd2usRk11ttudKMK/GFE7oPMYIMlz0jnkFl4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBojMZTDNkPGITvncNEDx/CNCeglk1Jp+f/ChpC0
 AXAHrPUnAeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaIzGUwAKCRCLPIo+Aiko
 1f8aCACjBXtlBxXcmFySHdDryhXuuyHrGFTLWoQAJYFbFPslFIRoxZSJT6mHErULJ228fcTw8Ww
 risQU9WSdjD7jV8ENl54qLAQNALPedsvbKGwten2/zVwwHND1/tHm62gE/zJVsv0AAxskybYyqX
 XgnflK5pL7cHdNq8kEqSnM8NrkQfgWCwS+NE00GVjlUOwvIM+Db4IxyZpw8ysGkKcOooYn0XV1j
 4zVzcS/pLcAgTkHK6SEWIusjCrJuUX2qaE0MHEDMfL/vyb+buazqF8TLWkgP4XM94aJOKBQFcAC
 qr7avC1KLtKnUu4777zLxpSwk41rREYYp97VOlRBxnyQ5KCS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=EqPSrTcA c=1 sm=1 tr=0 ts=688cc65d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=UqIHtJT1QCIVCAY24KsA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: _d1G9pO5AN5IvW4EsA6eAeGntJCkz7PL
X-Proofpoint-GUID: _d1G9pO5AN5IvW4EsA6eAeGntJCkz7PL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwMyBTYWx0ZWRfXwpLjHq30FQg8
 jZTLcP5aaboifjT40xREIEk2yDitL6n4S2MQD2HjFR1SlZD/Y4Vkc+aBDsf1wAQzt5pVwEZSMip
 /vG2z733VpSMZ0mFIaNmFGqdnjfvt19gaK46xuPd705A4I6UPYTMoPjy01LEmTLJKOcqL3jT5MO
 cssp2o0XNqvfR3nz5/RvvO5uNlv/ffLEnD2l7MEg6z/bPIGK4cBUhNaBXK0l5bgGGG3PhDx3NUe
 K0DGrXFoT/4g1/ygNKJ9UGgHo7sjW8WNjCvwdR91jCKO8q/z1yMOdn8joIxaKINmc17NY5m8WOP
 eCVFTkFf5b2+smA0VaCbfSsX6+C19eQlDZLxKMy3Q1/qpya6yee6yi6v5OEJAQDjMd5WxyhDVmY
 BQvjcujxIwju0hqM7za5Frn1D/u23a/F4/TrzssE01J9ZSSkejaD+Wz9sQPmxD0NBLhdX4Ub
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 mlxlogscore=936
 impostorscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010103

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 8ff496082902b1ee713e806140f39b4730ed256a..cd73468e369a93c50303db2a7d4499bcb17be5d1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -80,7 +80,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
 static const struct drm_connector_funcs dpu_wb_conn_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
@@ -131,12 +130,9 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
 
 	drm_connector_helper_add(&dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
 
-	/* DPU initializes the encoder and sets it up completely for writeback
-	 * cases and hence should use the new API drm_writeback_connector_init_with_encoder
-	 * to initialize the writeback connector
-	 */
-	rc = drm_writeback_connector_init_with_encoder(dev, &dpu_wb_conn->base, enc,
-			&dpu_wb_conn_funcs, format_list, num_formats);
+	rc = drmm_writeback_connector_init(dev, &dpu_wb_conn->base,
+					   &dpu_wb_conn_funcs, enc,
+					   format_list, num_formats);
 
 	if (!rc)
 		dpu_wb_conn->wb_enc = enc;

-- 
2.39.5


