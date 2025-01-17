Return-Path: <linux-arm-msm+bounces-45386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E1DA14BA7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 09:58:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83CA53A52BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 08:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44D81F91F2;
	Fri, 17 Jan 2025 08:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W6REiTUB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB93B1F91E1
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737104218; cv=none; b=lELhDGGFLDLWzDr/qUNPHzWWa75L0y0cIGFDpFPptn+Fml2LYFuUaZG0LTCLQ0+9eiIHgFtjNN4NHokk9uHXFZO7y8M9U9YhivvW4jZCGdGKM7r96Wmvk8HW+/FwNS5d2IDr5db2QLI2exkIBQDL85Q9Gc0ehJOFn9U9dwbhdtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737104218; c=relaxed/simple;
	bh=TJuc4RRF8VtMJDchcyjdI4OhT4nZLA2Y/JKIfwZo8hU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e6C7bAGfrttWNsmUoiWleK84cd6Q9j0PaDKbmhQ3j7cbwHgPn++CGgNecEv24dsLQcuhF0rfUpwknf2/5RImLjkyd4CRoKZ5N2bWgQrgK0J5T0lvlVDV7NA1yttBqAaJ+hVbUBZcbqUbCDI5UgZUZv0q1FlZKCBHHRHg/ZPlxAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W6REiTUB; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-305d843d925so15823791fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 00:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737104215; x=1737709015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mkej2Dgbml3avSflLlUvt7qJpvnNaMgjKXK5J7iu/Ps=;
        b=W6REiTUBoZDDpeLeePsCcBCnVDUeSSQks0CZGc6S9fEth6pP7T/REE8qguVJKGFw7r
         oh9tZrwuM1QxdOVc3wpnSyHCCmRXSkWg2W+JicpZlQ0MzMfxNEQN0ZaAKGosJxYUjjLU
         azaKpfxPl4Hk95JWtRqaMYzJRpuHkuFQoDfxK4C/KzjkoI/ZIlutSL+xlGRZqYT1URHe
         0r4F/2Ew7rUbCvmVUtcPnVl3IWKVbwmNDApEXHoVKkv29yuMEpDAevLiVWIeNhlO7VZh
         XEHS0yeYJCZldAeqiRuqa/MA7I66vbvhoZxQX7kAQOfgp2Qbsc8Cxfl0zy3PX8jLopnp
         ptLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737104215; x=1737709015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mkej2Dgbml3avSflLlUvt7qJpvnNaMgjKXK5J7iu/Ps=;
        b=eU8I0TCQteCyLEvlxBC7duabiLmdEUpUgRKfjhaYk7iPMLhsznxvxCdkmlrAZqEf14
         KJIptXlwSisT/Ecgm42xWmIpFt4nZ5XXAubEwujfETVvzx6C4FPE8WJzWd29yATbWFkA
         ojxPkwDeKqcPz6L/QbGCGb35VR6dhs2V0J22K69WCfHu7qMQy0cDrFPmuAIc/L/kQPBg
         UIbUgggU6oNkxvsdT6r2tXAyrnXJIdlN8q8A6Ge7Nzl1kDUIqESLHiIUXacNk/saxmQe
         JSTb/r+a/cTdnmPWvEU2lh1y5ePznkeQWRUDo269zWlQckc7A8O+icZk6jrAVtGxfKco
         iMdA==
X-Forwarded-Encrypted: i=1; AJvYcCVbbZho2FMeaWujHsyfVstx0U5RSClQIIudmIzOlVisu3PB0FOXZB+osOnHlSfY+I7XlFVfI1fdGSQeKxRk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/9GIrqEwC9u4sD/F/XlLJVDV/4eHAzo5OzEFu462/CMm5xgoe
	UkUhJ/pi2K3Qx+7Kek8ht+1njXoRW8fVF0sKlQZOXNpkO1+NAj3GJlWROEVL3Qo=
X-Gm-Gg: ASbGnctNZz8hVmMUxn2DdHmfvXRHoDpVABEUcSFD9ALCgm+wISOqWOpR03/8Q3YitX9
	3+TeyFaHBVdKLt54vPNsN2znZHKC+VMNnS3JAlasSn25spbG0Jq9H1z6rPikX82c/YQO8KeYjI8
	RooeH/uuD9/DbnLz+Q+7bLHZVGIWSXSZjH8rhCXiot/D1E45KPghMZg6cTSpRnkIp89bB7mG72M
	LBYaYk0zCLDAm/UeHXVVCA2D/hB7bwmUgGj9oRUin8/h4EqOoESUqfbWZRuCrU7
X-Google-Smtp-Source: AGHT+IFm4k0duptfNNqNo9ovG1IM2PPWDcpt/zalR+xfYDZ9sS188Lv3M8hO8zDK38dYyNuQxcG/kg==
X-Received: by 2002:a2e:a813:0:b0:302:29a5:6e01 with SMTP id 38308e7fff4ca-3072ca5b52bmr6092241fa.2.1737104214887;
        Fri, 17 Jan 2025 00:56:54 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a330764sm3402101fa.3.2025.01.17.00.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 00:56:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 17 Jan 2025 10:56:41 +0200
Subject: [PATCH RFC 6/7] drm/display: dp-mst-topology: use new DCPD access
 helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-drm-rework-dpcd-access-v1-6-7fc020e04dbc@linaro.org>
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
In-Reply-To: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8833;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TJuc4RRF8VtMJDchcyjdI4OhT4nZLA2Y/JKIfwZo8hU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnihtFvWQ7P4k24wQB6JVUqLQ/RDOvd3K1a3Riq
 YPOy3h1nKaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4obRQAKCRCLPIo+Aiko
 1aSsCACCHvHcjKSucNtYm2HFIAs2pWYBvtuSNh9BuQQ8keXDVJsunSVxSfSvS9Dn6u01kJLo4vp
 ISp9HRzB3RatWLR4fz7X2XY7W5E59xmDRe8iJ5f6QpJzuqR8JxNrDygr0NHNRyJhw7DArNiXr0S
 FSZHpLWhMDdQ7Op/UAd/H37+g3d7BrZCgqGDHJW0JBKcfXABl8xdw9qmKmHSKLe1Y/DFc2Js9UK
 2l26yAtUsH/9FvMcYNKyAma5SOdVnm22tMbRtfLoj3ex1tZhXMZMMrGs2n/HfWxaN7iJ5p4LcyD
 ZSEXl/dokLsbh94iWsthxfl1Gv4DzKgUFqYqwi9dnBzE41so
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Switch drm_dp_mst_topology.c to use new set of DPCD read / write helpers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 105 +++++++++++++-------------
 1 file changed, 51 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index f8db5be53a33e87e94b864ba48151354e091f5aa..1bd9fc0007d214f461ea5476c9f04bb5167e5af0 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -2189,15 +2189,12 @@ static int drm_dp_check_mstb_guid(struct drm_dp_mst_branch *mstb, guid_t *guid)
 						     mstb->port_parent,
 						     DP_GUID, sizeof(buf), buf);
 		} else {
-			ret = drm_dp_dpcd_write(mstb->mgr->aux,
-						DP_GUID, buf, sizeof(buf));
+			ret = drm_dp_dpcd_write_data(mstb->mgr->aux,
+						     DP_GUID, buf, sizeof(buf));
 		}
 	}
 
-	if (ret < 16 && ret > 0)
-		return -EPROTO;
-
-	return ret == 16 ? 0 : ret;
+	return ret;
 }
 
 static void build_mst_prop_path(const struct drm_dp_mst_branch *mstb,
@@ -2733,14 +2730,13 @@ static int drm_dp_send_sideband_msg(struct drm_dp_mst_topology_mgr *mgr,
 	do {
 		tosend = min3(mgr->max_dpcd_transaction_bytes, 16, total);
 
-		ret = drm_dp_dpcd_write(mgr->aux, regbase + offset,
-					&msg[offset],
-					tosend);
-		if (ret != tosend) {
-			if (ret == -EIO && retries < 5) {
-				retries++;
-				goto retry;
-			}
+		ret = drm_dp_dpcd_write_data(mgr->aux, regbase + offset,
+					     &msg[offset],
+					     tosend);
+		if (ret == -EIO && retries < 5) {
+			retries++;
+			goto retry;
+		} else if (ret < 0) {
 			drm_dbg_kms(mgr->dev, "failed to dpcd write %d %d\n", tosend, ret);
 
 			return -EIO;
@@ -3618,7 +3614,7 @@ enum drm_dp_mst_mode drm_dp_read_mst_cap(struct drm_dp_aux *aux,
 	if (dpcd[DP_DPCD_REV] < DP_DPCD_REV_12)
 		return DRM_DP_SST;
 
-	if (drm_dp_dpcd_readb(aux, DP_MSTM_CAP, &mstm_cap) != 1)
+	if (drm_dp_dpcd_read_byte(aux, DP_MSTM_CAP, &mstm_cap) < 0)
 		return DRM_DP_SST;
 
 	if (mstm_cap & DP_MST_CAP)
@@ -3673,10 +3669,10 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 		mgr->mst_primary = mstb;
 		drm_dp_mst_topology_get_mstb(mgr->mst_primary);
 
-		ret = drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL,
-					 DP_MST_EN |
-					 DP_UP_REQ_EN |
-					 DP_UPSTREAM_IS_SRC);
+		ret = drm_dp_dpcd_write_byte(mgr->aux, DP_MSTM_CTRL,
+					     DP_MST_EN |
+					     DP_UP_REQ_EN |
+					     DP_UPSTREAM_IS_SRC);
 		if (ret < 0)
 			goto out_unlock;
 
@@ -3691,7 +3687,7 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 		mstb = mgr->mst_primary;
 		mgr->mst_primary = NULL;
 		/* this can fail if the device is gone */
-		drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL, 0);
+		drm_dp_dpcd_write_byte(mgr->aux, DP_MSTM_CTRL, 0);
 		ret = 0;
 		mgr->payload_id_table_cleared = false;
 
@@ -3757,8 +3753,8 @@ EXPORT_SYMBOL(drm_dp_mst_topology_queue_probe);
 void drm_dp_mst_topology_mgr_suspend(struct drm_dp_mst_topology_mgr *mgr)
 {
 	mutex_lock(&mgr->lock);
-	drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL,
-			   DP_MST_EN | DP_UPSTREAM_IS_SRC);
+	drm_dp_dpcd_write_byte(mgr->aux, DP_MSTM_CTRL,
+			       DP_MST_EN | DP_UPSTREAM_IS_SRC);
 	mutex_unlock(&mgr->lock);
 	flush_work(&mgr->up_req_work);
 	flush_work(&mgr->work);
@@ -3807,18 +3803,18 @@ int drm_dp_mst_topology_mgr_resume(struct drm_dp_mst_topology_mgr *mgr,
 		goto out_fail;
 	}
 
-	ret = drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL,
-				 DP_MST_EN |
-				 DP_UP_REQ_EN |
-				 DP_UPSTREAM_IS_SRC);
+	ret = drm_dp_dpcd_write_byte(mgr->aux, DP_MSTM_CTRL,
+				     DP_MST_EN |
+				     DP_UP_REQ_EN |
+				     DP_UPSTREAM_IS_SRC);
 	if (ret < 0) {
 		drm_dbg_kms(mgr->dev, "mst write failed - undocked during suspend?\n");
 		goto out_fail;
 	}
 
 	/* Some hubs forget their guids after they resume */
-	ret = drm_dp_dpcd_read(mgr->aux, DP_GUID, buf, sizeof(buf));
-	if (ret != sizeof(buf)) {
+	ret = drm_dp_dpcd_read_data(mgr->aux, DP_GUID, buf, sizeof(buf));
+	if (ret < 0) {
 		drm_dbg_kms(mgr->dev, "dpcd read failed - undocked during suspend?\n");
 		goto out_fail;
 	}
@@ -3877,8 +3873,8 @@ drm_dp_get_one_sb_msg(struct drm_dp_mst_topology_mgr *mgr, bool up,
 		*mstb = NULL;
 
 	len = min(mgr->max_dpcd_transaction_bytes, 16);
-	ret = drm_dp_dpcd_read(mgr->aux, basereg, replyblock, len);
-	if (ret != len) {
+	ret = drm_dp_dpcd_read_data(mgr->aux, basereg, replyblock, len);
+	if (ret < 0) {
 		drm_dbg_kms(mgr->dev, "failed to read DPCD down rep %d %d\n", len, ret);
 		return false;
 	}
@@ -3916,9 +3912,9 @@ drm_dp_get_one_sb_msg(struct drm_dp_mst_topology_mgr *mgr, bool up,
 	curreply = len;
 	while (replylen > 0) {
 		len = min3(replylen, mgr->max_dpcd_transaction_bytes, 16);
-		ret = drm_dp_dpcd_read(mgr->aux, basereg + curreply,
-				    replyblock, len);
-		if (ret != len) {
+		ret = drm_dp_dpcd_read_data(mgr->aux, basereg + curreply,
+					    replyblock, len);
+		if (ret < 0) {
 			drm_dbg_kms(mgr->dev, "failed to read a chunk (len %d, ret %d)\n",
 				    len, ret);
 			return false;
@@ -4867,9 +4863,9 @@ static bool dump_dp_payload_table(struct drm_dp_mst_topology_mgr *mgr,
 	int i;
 
 	for (i = 0; i < DP_PAYLOAD_TABLE_SIZE; i += 16) {
-		if (drm_dp_dpcd_read(mgr->aux,
-				     DP_PAYLOAD_TABLE_UPDATE_STATUS + i,
-				     &buf[i], 16) != 16)
+		if (drm_dp_dpcd_read_data(mgr->aux,
+					  DP_PAYLOAD_TABLE_UPDATE_STATUS + i,
+					  &buf[i], 16) < 0)
 			return false;
 	}
 	return true;
@@ -4958,23 +4954,24 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
 		}
 		seq_printf(m, "dpcd: %*ph\n", DP_RECEIVER_CAP_SIZE, buf);
 
-		ret = drm_dp_dpcd_read(mgr->aux, DP_FAUX_CAP, buf, 2);
-		if (ret != 2) {
+		ret = drm_dp_dpcd_read_data(mgr->aux, DP_FAUX_CAP, buf, 2);
+		if (ret < 0) {
 			seq_printf(m, "faux/mst read failed\n");
 			goto out;
 		}
 		seq_printf(m, "faux/mst: %*ph\n", 2, buf);
 
-		ret = drm_dp_dpcd_read(mgr->aux, DP_MSTM_CTRL, buf, 1);
-		if (ret != 1) {
+		ret = drm_dp_dpcd_read_data(mgr->aux, DP_MSTM_CTRL, buf, 1);
+		if (ret < 0) {
 			seq_printf(m, "mst ctrl read failed\n");
 			goto out;
 		}
 		seq_printf(m, "mst ctrl: %*ph\n", 1, buf);
 
 		/* dump the standard OUI branch header */
-		ret = drm_dp_dpcd_read(mgr->aux, DP_BRANCH_OUI, buf, DP_BRANCH_OUI_HEADER_SIZE);
-		if (ret != DP_BRANCH_OUI_HEADER_SIZE) {
+		ret = drm_dp_dpcd_read_data(mgr->aux, DP_BRANCH_OUI, buf,
+					    DP_BRANCH_OUI_HEADER_SIZE);
+		if (ret < 0) {
 			seq_printf(m, "branch oui read failed\n");
 			goto out;
 		}
@@ -6098,14 +6095,14 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 
 	/* DP-to-DP peer device */
 	if (drm_dp_mst_is_virtual_dpcd(immediate_upstream_port)) {
-		if (drm_dp_dpcd_read(&port->aux,
-				     DP_DSC_SUPPORT, &endpoint_dsc, 1) != 1)
+		if (drm_dp_dpcd_read_data(&port->aux,
+					  DP_DSC_SUPPORT, &endpoint_dsc, 1) < 0)
 			return NULL;
-		if (drm_dp_dpcd_read(&port->aux,
-				     DP_FEC_CAPABILITY, &endpoint_fec, 1) != 1)
+		if (drm_dp_dpcd_read_data(&port->aux,
+					  DP_FEC_CAPABILITY, &endpoint_fec, 1) < 0)
 			return NULL;
-		if (drm_dp_dpcd_read(&immediate_upstream_port->aux,
-				     DP_DSC_SUPPORT, &upstream_dsc, 1) != 1)
+		if (drm_dp_dpcd_read_data(&immediate_upstream_port->aux,
+					  DP_DSC_SUPPORT, &upstream_dsc, 1) < 0)
 			return NULL;
 
 		/* Enpoint decompression with DP-to-DP peer device */
@@ -6143,8 +6140,8 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 	if (drm_dp_has_quirk(&desc, DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD)) {
 		u8 dpcd_ext[DP_RECEIVER_CAP_SIZE];
 
-		if (drm_dp_dpcd_read(immediate_upstream_aux,
-				     DP_DSC_SUPPORT, &upstream_dsc, 1) != 1)
+		if (drm_dp_dpcd_read_data(immediate_upstream_aux,
+					  DP_DSC_SUPPORT, &upstream_dsc, 1) < 0)
 			return NULL;
 
 		if (!(upstream_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED))
@@ -6166,11 +6163,11 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 	 * therefore the endpoint needs to be
 	 * both DSC and FEC capable.
 	 */
-	if (drm_dp_dpcd_read(&port->aux,
-	   DP_DSC_SUPPORT, &endpoint_dsc, 1) != 1)
+	if (drm_dp_dpcd_read_data(&port->aux,
+				  DP_DSC_SUPPORT, &endpoint_dsc, 1) < 0)
 		return NULL;
-	if (drm_dp_dpcd_read(&port->aux,
-	   DP_FEC_CAPABILITY, &endpoint_fec, 1) != 1)
+	if (drm_dp_dpcd_read_data(&port->aux,
+				  DP_FEC_CAPABILITY, &endpoint_fec, 1) < 0)
 		return NULL;
 	if ((endpoint_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED) &&
 	   (endpoint_fec & DP_FEC_CAPABLE))

-- 
2.39.5


