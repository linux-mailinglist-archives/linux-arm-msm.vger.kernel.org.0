Return-Path: <linux-arm-msm+bounces-67365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 091F5B182F0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 15:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE34BA85F04
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 13:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE6C272E63;
	Fri,  1 Aug 2025 13:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRpZth5d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A29271455
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 13:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754056292; cv=none; b=L+ieNFLvUea8I/7VLTn2Wo+iA62tr5c/dlVSrIpsD8Ai3cn4e4GjQgf1R3Um2ZOiiN2Nz+fq84SYpiST92y7q49n7hv/IqCoDN9v3IiYYh7jSrPBqva+NcC/y/vD1tG0x3GWR2umY5YwwGtZdj0fG4StUBJUko2D5GlQtmaqrmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754056292; c=relaxed/simple;
	bh=gZgct+R3pIg8eXO3IJV5mPFQorUlTRSoPS4dZG7+aRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fKboIzGMuVMszSVsokywU8UoIYV/zls3RU1J+NusxWWwh7Yjeg4sR9oZbUO20ZQATxL7M0iscEbpVqYgxCbyQeGA51z0x9pOvDldrYp89UXIMBuyQrfJpalAeR9VLEvvk+Co82a9+ex8zVUxo/lzyz6PiEU2sb/E6/D3vEkFR+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XRpZth5d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5719PBHi001563
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 13:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBx5bn66d6vut0znzeSHUeN3eqzlVEi7rifsJB3EV/E=; b=XRpZth5d5B+ArEFp
	qt2j+OEM5CBM1SM0Rgw8MPgYk1p7Gp7Cr3IBPVawEsN6bS/LQyBfA+KyK8zQyKhh
	0Jz9lcDtN752a4bDJjvFiaW1NVgh8Akyro/bvduCAMu5FvQJ4UeRHJw8/DTtxAX+
	lQV9goHAX3AmRDdNZxT6KMWWZoClrU6rpVxGgASMZvat6MCGCoGgoTmoAs/lT2Oh
	sCaDkNA+GqByye4emPzarqvh+ADlVJd771iYZNeZQGLFFgq18ydQcUL8AtQv1tR4
	pu6ig8WH3QAPcfRM3ERR1wgo0cGuU8D/ElAYl5UQ+nrrZKmDLj/fVdltfVEAxkd0
	QKhPvw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nyucg62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 13:51:30 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-707453b0307so26351566d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 06:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754056289; x=1754661089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kBx5bn66d6vut0znzeSHUeN3eqzlVEi7rifsJB3EV/E=;
        b=FjtDEFiZU/Z0wHFsgo1Bzj0WuEYf1kTim5K/xDuO8lfhuNglnkS2z3Zr88z1s63lHV
         BQM24Bj6qE60Ikzsnop+TR921mI51m4jI4g7A6hO9YGWYLy0c1XshUs3WI1M/HLVB3vs
         7MEcuOqe6G1VbKwqk0bZS94aHXyECbfvl40392Sp1VesvSGo4ZB3TMNxrpuQ90onooc9
         GUhmdtVH+UYdRyT9MP4mhoA62KSdWstcTElgter1xwvl2Sb0gujKWCDtV7aFv0eyyBld
         yx/cRwxTujEwOCUVGfGUKMvQNJrddiAp9XAYtCO7udRYu+OQlcRR/IoDM7a8OUCA6kdJ
         jZwA==
X-Forwarded-Encrypted: i=1; AJvYcCU+BrZiO2hT4DCPQvZFiPm/N3jNBLOOeY40wG7YJmvVKnBtauF0sIqa3Z6U44aX6yYnj3rpwjp1FUjSAf5R@vger.kernel.org
X-Gm-Message-State: AOJu0YyI1rODF+NJjiSs4bqsS7FtoaXYXWBdOQhRohWVRNDbYdQ5Feke
	jfbUtGQ5kCwUs9cIY1DjoDLlNVpgH+O9AfKmsrsCA6x88Bh+siyTAYrFcPofScAUYgk+KXGY81j
	yNQwMeAJ+/2Lx+r8Te30yl5MRIYQZUFeAZv0fmgmhjFygWSYKVjqcUxWtrtLV6g6PG7Vk
X-Gm-Gg: ASbGnctn+QgtNX4NLTbYGWEis1gWXYSfznia+gwaQngYYOWbRiZXDYbJ3SG4fS7OUXw
	BQ6X/kObZFvmK8MN24s/stKnAGh9ttaCOpQskwu4qCZ3H/RlupNGyFxg0xDGRH7fDtmN3uUIy6W
	esKoaYelvwMbqFauu42SyZkgLTS62JBlE9ml0lGjWH1Lwo+K0fxKLbN5bizxsS5i4HGiPhNtlFx
	Yh1KQOyocT9xhXI60C9MaZS1xGLTkp2+2/0FfZ2NeG2PI9p6EaiIaf/Ogik8H9ViKWnNzfluS40
	xs8eOdLSL4wniV7Okd/Kx6q+b45Byt6vpKlFZaOPFfCj2MVA9OGgPCBtUR0cJ/LC4OjCzE4MGrv
	mSrVVO+/RObGE63ij9Bh9XuL+kE9iGf9+wSpnrX7/FXYx54OtqvlN
X-Received: by 2002:ad4:5c6b:0:b0:707:642b:cdf4 with SMTP id 6a1803df08f44-709266e5b39mr33801706d6.44.1754056288516;
        Fri, 01 Aug 2025 06:51:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGllYuESTRqftyHKDNb4inezLURrR+fzmRpNK5DetH32nfbPqtCnDKyebMVY5gAjPzgta1wgg==
X-Received: by 2002:ad4:5c6b:0:b0:707:642b:cdf4 with SMTP id 6a1803df08f44-709266e5b39mr33801266d6.44.1754056287837;
        Fri, 01 Aug 2025 06:51:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-33238273006sm5917801fa.9.2025.08.01.06.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:51:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 01 Aug 2025 16:51:15 +0300
Subject: [PATCH 7/8] drm: writeback: drop excess connector initialization
 functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-wb-drop-encoder-v1-7-824646042f7d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4482;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gZgct+R3pIg8eXO3IJV5mPFQorUlTRSoPS4dZG7+aRg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBojMZUui4aeAWjDE1KcnUWDiWpmo7D1w9CnyLW1
 NS+7irQsJCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaIzGVAAKCRCLPIo+Aiko
 1VnvB/wN1Uyqu8Gb7rElaqvtKoq8ctBCnyPLrCinS1CSpFKhE6DmjVLZ93duHSs8PhT2XLUl+Gk
 FHlskZNC8PV0yqTDNDF8ljaQxml44/wm5h6idVdLatujDJKa4yVGpox41E2mkKxMFg8cJEQdUHo
 mDOKWaFTl9tTkseYzULna9+MamFoDNn7K2bAAkU2sqZHh242r0i//UoAcoZD6jvcJOxYtjpoOVT
 Mi8lHRiCI7shQ+XZfD6Lt1eS35mbm7RQbHnUF5ivVS6Ytsxx8DInpU4WT+Vwf9Q8Dfv7UF4vMzV
 h9maCrN7tS9BsiflO86XVabEVhHS1tEOnD2ABbu+CMWr4Bsn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: WAdvue8y6qPmpfZ6WyI9ZxDtp4jc7uIK
X-Proofpoint-ORIG-GUID: WAdvue8y6qPmpfZ6WyI9ZxDtp4jc7uIK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwNSBTYWx0ZWRfX4wkK+dHWC2P+
 CmIDv0TGapCQCrMzF7mBfvJJnKxeifNGDOxIcjHmbLgPLIOGZromnJtPIgFjQin+7t437G2LDaz
 8QtcO/Ty9xk34Y/etqzaNv0MckNoDM5IjNmTpcE1a+caDAboelJ7YXfUm2in9ssrBoTKU0CtMFv
 Qa2QrnVXc/SD/Y1Ac6Hqgw1v+E1XTlVUyn+SdPc1u/hdfPjK0IGwBtaZ5B9MMsNqwe5Jnzqhz0Z
 Jw5JWJwS2awNYQco4KOCZpsk2bvkCDrnFMyxQckG5bOEIMoI7Jkld/RBvlXmMYfKtwhRzsn7Xt1
 IuYjCxTDP7v1FDIJ5+RcpvXO0citSovc3Knz750XAgbPzJCzMDILIxSF36qYIK7TM7dcu7LVYO3
 te1Aokggojh72IaYAcTk6aRka+J4/AMdGoq449lE2og3TDo/EbZ7/EinCsC/khz5Prrcmyys
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=688cc662 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=3owybDqXPaZAjLikVYcA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=903 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010105

Now as all drivers have been converted to
drmm_writeback_connector_init(), drop drm_writeback_connector_init() and
drm_writeback_connector::encoder field, they are unused now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_writeback.c | 55 -----------------------------------------
 include/drm/drm_writeback.h     | 18 --------------
 2 files changed, 73 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 95b8a2e4bda69230591b50be15d14d0b3692373b..1a01df91b2c5868e158d489b782f4c57c61a272c 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -142,61 +142,6 @@ static int create_writeback_properties(struct drm_device *dev)
 	return 0;
 }
 
-static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
-/**
- * drm_writeback_connector_init - Initialize a writeback connector and its properties
- * @dev: DRM device
- * @wb_connector: Writeback connector to initialize
- * @con_funcs: Connector funcs vtable
- * @enc_helper_funcs: Encoder helper funcs vtable to be used by the internal encoder
- * @formats: Array of supported pixel formats for the writeback engine
- * @n_formats: Length of the formats array
- * @possible_crtcs: possible crtcs for the internal writeback encoder
- *
- * This function creates the writeback-connector-specific properties if they
- * have not been already created, initializes the connector as
- * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
- * values. It will also create an internal encoder associated with the
- * drm_writeback_connector and set it to use the @enc_helper_funcs vtable for
- * the encoder helper.
- *
- * Drivers should always use this function instead of drm_connector_init() to
- * set up writeback connectors.
- *
- * Returns: 0 on success, or a negative error code
- */
-int drm_writeback_connector_init(struct drm_device *dev,
-				 struct drm_writeback_connector *wb_connector,
-				 const struct drm_connector_funcs *con_funcs,
-				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
-				 const u32 *formats, int n_formats,
-				 u32 possible_crtcs)
-{
-	int ret = 0;
-
-	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
-
-	wb_connector->encoder.possible_crtcs = possible_crtcs;
-
-	ret = drm_encoder_init(dev, &wb_connector->encoder,
-			       &drm_writeback_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
-	if (ret)
-		return ret;
-
-	ret = drm_writeback_connector_init_with_encoder(dev, wb_connector, &wb_connector->encoder,
-			con_funcs, formats, n_formats);
-
-	if (ret)
-		drm_encoder_cleanup(&wb_connector->encoder);
-
-	return ret;
-}
-EXPORT_SYMBOL(drm_writeback_connector_init);
-
 static void delete_writeback_properties(struct drm_device *dev)
 {
 	if (dev->mode_config.writeback_pixel_formats_property) {
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index c380a7b8f55a3616fa070c037d5cc653b0061fe6..879ca103320cc225ffb3687419088361315535fc 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -24,17 +24,6 @@ struct drm_writeback_connector {
 	 */
 	struct drm_connector base;
 
-	/**
-	 * @encoder: Internal encoder used by the connector to fulfill
-	 * the DRM framework requirements. The users of the
-	 * @drm_writeback_connector control the behaviour of the @encoder
-	 * by passing the @enc_funcs parameter to drm_writeback_connector_init()
-	 * function.
-	 * For users of drm_writeback_connector_init_with_encoder(), this field
-	 * is not valid as the encoder is managed within their drivers.
-	 */
-	struct drm_encoder encoder;
-
 	/**
 	 * @pixel_formats_blob_ptr:
 	 *
@@ -148,13 +137,6 @@ drm_connector_to_writeback(struct drm_connector *connector)
 	return container_of(connector, struct drm_writeback_connector, base);
 }
 
-int drm_writeback_connector_init(struct drm_device *dev,
-				 struct drm_writeback_connector *wb_connector,
-				 const struct drm_connector_funcs *con_funcs,
-				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
-				 const u32 *formats, int n_formats,
-				 u32 possible_crtcs);
-
 int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
 				struct drm_writeback_connector *wb_connector,
 				struct drm_encoder *enc,

-- 
2.39.5


