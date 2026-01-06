Return-Path: <linux-arm-msm+bounces-87698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1577CF8A9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 15:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A038307CA6C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 13:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91D0333739;
	Tue,  6 Jan 2026 13:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j3YtAs9g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I4w8eqmW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359DC1957E8
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 13:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767706849; cv=none; b=PPt/UtfTu30I/bFEOqwC4M3OaGd53TntavHPFlfmH9fTu9LQphJxsJKbnKnhjTsr8um4/5MdQHYbqCeE/QWwp7x/SxU7LE8zFyljE605ZKC70C+oca78VnAl9WBYw80Z6U8SYmC9/6F7hAZ16PzCj2tP7mmY0s882huHhnZPZ78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767706849; c=relaxed/simple;
	bh=D1O+si2Yt1LHRX9ttPtLSW9kr0/xClDgoku245+GvJk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TQNCHqUx47N3aR6YyH9MyscwtXHh8D5B2V3YL1gT/wiY9LULE2epyYlVLg7rnE+68drkfnkQK/4lWJKCPGQW2kY9UN41eynyP8kWE7JqpLxpyVJtUSnlqVXuQRr/mcICd/eVih2mX22yFQYBC6NVVYTxI3FtEe2hgX9NNa3nr84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j3YtAs9g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I4w8eqmW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606AaVfG3052950
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 13:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=09GkqJKtIHi
	QNekPzoYMiNgzGedCPpCvBabWAf+0JyA=; b=j3YtAs9g6P//wjdLTCBI+S0LuTf
	3xUGxV6doPL/RJ4Mgt/thSTknnVQnsiZz5i0+Sht+U68PtMZxbKpv6dVmDBmOLCK
	+ns7n0RHlFXdQdJr2wk9Gye8sdRkA5xqdo99djDfvef+RvAUN1Ys41pWT4TIG1NA
	TBW3m4f3Pbjj+rQhiVLQhiIRWUplghJ6SoKsHZTSCISywTFr0dxPpUQY/dKmd9fG
	z0qyelCRbjBHC/pYj2kHrWbZTA1cEyR1wvXt8SsZtiYU50QcrSJo0gXYjwhaCj1z
	pvpntR127gTOg+x/c9JApkfbun3F5qaR02zNHKm7xyjEu0QoyUoKfFXCmWA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgpn9t66g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 13:40:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34abec8855aso2274552a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 05:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767706839; x=1768311639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09GkqJKtIHiQNekPzoYMiNgzGedCPpCvBabWAf+0JyA=;
        b=I4w8eqmWjnKmUh8V0jmFpv5dvOs+duP0lA3eK0w8ZjyDhUWgGh8PytxMX/qxJjqcDB
         bObtb+3rx9JTjUov2xop+9Ad7gO/6/TluEzmVqGz22Fa8thIqEfHemXpNSZo5m5bFQ88
         MB6QKMUuYV9xRfP5Sq85HVgeyUWaEbP3/+0u2vj2XXOjDAxTHa0VQp3vdEFJcqY+f91L
         p4CjQ1EuwcEQ1aa8ZOGCBlcjFGGWoAhsavNcuQU00uOJ/Fxoa+f2B9hxrAzyn4+BxjY5
         j+F6G3UlX69gd9+RL+BhOD0Ant7JL68nzU7oUTw7E8RL2jbHjnm3T5OwWGrGb7nppGUs
         cVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767706839; x=1768311639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=09GkqJKtIHiQNekPzoYMiNgzGedCPpCvBabWAf+0JyA=;
        b=Xvdj2hu3GspxS8QcQTODnnu4qASF4RAztBVuCw2gislZqVwoO+iuYVD86Qd4SvP6+N
         02gzZst1mniXNl3DF4h/N21S+JUYe6xnIsn/RAGtXj6qGyWwkDh32bovkP1zG6IJUE8L
         +9XQYClRlyLKJty9PLzizVILN5McNTC1MVtfFiAsq00/UX3Q/mZIMH95mqu7wPAQJIL0
         VNun+UE2rbXXpNKqmXcpJrUvXIzjFiak5fOdN1Xasv+Mjj/XlhrgdquC0hmeEVdlmdP+
         EmMWLl3z4UVOC32NNEPbK6Yz7Ty0mtP+5PUvGXs7WLDiF7fToH+GjMehz5IQ4TGtCASp
         gfOw==
X-Gm-Message-State: AOJu0YxHR4rUtCqVoA2IpAzvMya9PmMXZ0HV7DTg58PnYJt8uHBpKCSJ
	HUuYBlcxllKmeF6OZP5LxTI9g6T1BhGqgExpPTfN3JuMWB2Gz4YkjsJ9HimX72wvVb9Gnojt1W+
	cHERZ87dEIlYlmcB5LMwPSyIMk2QYwzPldoXb4zc2b6jvxennllYUVqHwPVeRzPuh3WXM
X-Gm-Gg: AY/fxX7jLaT9GX3Lc1vm1L79y1CbsxcbMjAvyGcJOg+Jaafe7i4nE5nluXM+DjyIdSV
	gDMswgWakDq5oQ66xYgw0pP5GvlkIVgYI1VL3jQ+AO/A7JvVwh2xfdmH4x+rHU7wbKddkEVrWI3
	uGlxCwhVXOnBJadTZTEPbdZE8jM2qA9PFb0CF24L3yTh58raa69FKUaokEnuFXu3b8aLWUhcRJC
	tlNMbdrkFBWS7it6WpQmKk4OTKiDVpz/bEeKdz2q856H+8RnAeGsBbgQ+Mhq8pi1UP7mfMoIwaQ
	d50tEPnLHIV5bjthNxpzCrGpVUO5r98hR1uT9n7T88gGI05HwGQH8fRuGVQzDjvww6wCQ1hrPeK
	fdVIqMqa/qlO6M8rlwJdzpodQ8ejryngPbCHjCg/C
X-Received: by 2002:a17:903:3806:b0:2a0:afeb:fbb2 with SMTP id d9443c01a7336-2a3e2d5a034mr25572195ad.60.1767706838959;
        Tue, 06 Jan 2026 05:40:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0NLjFs+ONROrujGP8cMw4GV8fRDz387ZfduPT0onKmM4tZUyrM+9Z3Zo9EvL7UQbHurbRyw==
X-Received: by 2002:a17:903:3806:b0:2a0:afeb:fbb2 with SMTP id d9443c01a7336-2a3e2d5a034mr25571965ad.60.1767706838430;
        Tue, 06 Jan 2026 05:40:38 -0800 (PST)
Received: from hu-rdwivedi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc7856sm24112515ad.68.2026.01.06.05.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 05:40:38 -0800 (PST)
From: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
To: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, ram.dwivedi@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anjana Hari <anjana.hari@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Subject: [PATCH V4 4/4] ufs: ufs-qcom: Add support for firmware-managed resource abstraction
Date: Tue,  6 Jan 2026 19:10:08 +0530
Message-Id: <20260106134008.1969090-5-ram.dwivedi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106134008.1969090-1-ram.dwivedi@oss.qualcomm.com>
References: <20260106134008.1969090-1-ram.dwivedi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: shs4tdtnlW49iLtZQkk8Q9pjvK-8e4DA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDExOSBTYWx0ZWRfX2GnSXbySSgzV
 z/Be0wJmOBsZywGKVg4eKtIZasCrp2iti64F+xJnRfwRGXCmFkjCOawu1vU6V5skycxzDtJP0zf
 NsT4lC6pKsOHiCn3LL24jhpVkx0xXrcLyoxLlAE4XPfn7idAAFPeXzCGOk1BB4t+zyIP3e7TeYL
 7/ONYMuLTE/IEZvMeEWmghz9tpvyMiCKLvXWONL4k0JWZV0oL5Kav7McMwIhO9gJ3J1ldndW4uO
 gFUvhWrfHa4uFCB9cCFC7ehkuu3e5q2HCdQcWeONrYrqSSk7TK7g4/FWKeOj7WWO47hoUtxamTU
 OpTBdRZH6uz3FtPb82CMVS1mkkd3L8sY2mKAYaLl/XR3XmBwO4tm+MeKaex8XZh7W0IPrnrnjr1
 jim7hAR17FnHtr3sm7ruOwV/Pdnd4ww+/xGFK6xXJvXmIf8OUK9iyZL9mGWpPuJRTJpShutr9ny
 uI2RYzkaTQi2+ETxXnw==
X-Proofpoint-GUID: shs4tdtnlW49iLtZQkk8Q9pjvK-8e4DA
X-Authority-Analysis: v=2.4 cv=KfnfcAYD c=1 sm=1 tr=0 ts=695d10d8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=YNeBtJC1tzGph8_Y4V8A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060119

Add a compatible string for SA8255p platforms where resources such as
PHY, clocks, regulators, and resets are managed by firmware through an
SCMI server. Use the SCMI power protocol to abstract these resources and
invoke power operations via runtime PM APIs (pm_runtime_get/put_sync).

Introduce vendor operations (vops) for SA8255p targets to enable SCMI-
based resource control. In this model, capabilities like clock scaling
and gating are not yet supported; these will be added incrementally.

Co-developed-by: Anjana Hari <anjana.hari@oss.qualcomm.com>
Signed-off-by: Anjana Hari <anjana.hari@oss.qualcomm.com>
Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Signed-off-by: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 164 +++++++++++++++++++++++++++++++++++-
 drivers/ufs/host/ufs-qcom.h |   1 +
 2 files changed, 164 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 8ebee0cc5313..ddca7b344642 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/reset-controller.h>
 #include <linux/time.h>
 #include <linux/unaligned.h>
@@ -619,6 +620,27 @@ static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
 	return err;
 }
 
+static int ufs_qcom_fw_managed_hce_enable_notify(struct ufs_hba *hba,
+						 enum ufs_notify_change_status status)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+
+	switch (status) {
+	case PRE_CHANGE:
+		ufs_qcom_select_unipro_mode(host);
+		break;
+	case POST_CHANGE:
+		ufs_qcom_enable_hw_clk_gating(hba);
+		ufs_qcom_ice_enable(host);
+		break;
+	default:
+		dev_err(hba->dev, "Invalid status %d\n", status);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /**
  * ufs_qcom_cfg_timers - Configure ufs qcom cfg timers
  *
@@ -789,6 +811,38 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	return ufs_qcom_ice_resume(host);
 }
 
+static int ufs_qcom_fw_managed_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
+				       enum ufs_notify_change_status status)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+
+	if (status == PRE_CHANGE)
+		return 0;
+
+	if (hba->spm_lvl != UFS_PM_LVL_5) {
+		dev_err(hba->dev, "Unsupported spm level %d\n", hba->spm_lvl);
+		return -EINVAL;
+	}
+
+	pm_runtime_put_sync(hba->dev);
+
+	return ufs_qcom_ice_suspend(host);
+}
+
+static int ufs_qcom_fw_managed_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	int err;
+
+	err = pm_runtime_resume_and_get(hba->dev);
+	if (err) {
+		dev_err(hba->dev, "PM runtime resume failed: %d\n", err);
+		return err;
+	}
+
+	return ufs_qcom_ice_resume(host);
+}
+
 static void ufs_qcom_dev_ref_clk_ctrl(struct ufs_qcom_host *host, bool enable)
 {
 	if (host->dev_ref_clk_ctrl_mmio &&
@@ -1421,6 +1475,55 @@ static void ufs_qcom_exit(struct ufs_hba *hba)
 	phy_exit(host->generic_phy);
 }
 
+static int ufs_qcom_fw_managed_init(struct ufs_hba *hba)
+{
+	struct device *dev = hba->dev;
+	struct ufs_qcom_host *host;
+	int err;
+
+	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	if (!host)
+		return -ENOMEM;
+
+	host->hba = hba;
+	ufshcd_set_variant(hba, host);
+
+	ufs_qcom_get_controller_revision(hba, &host->hw_ver.major,
+					 &host->hw_ver.minor, &host->hw_ver.step);
+
+	err = ufs_qcom_ice_init(host);
+	if (err)
+		goto out_variant_clear;
+
+	ufs_qcom_get_default_testbus_cfg(host);
+	err = ufs_qcom_testbus_config(host);
+	if (err)
+		/* Failure is non-fatal */
+		dev_warn(dev, "Failed to configure the testbus %d\n", err);
+
+	hba->caps |= UFSHCD_CAP_WB_EN;
+
+	ufs_qcom_advertise_quirks(hba);
+	host->hba->quirks &= ~UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH;
+
+	hba->pm_lvl_min = UFS_PM_LVL_5;
+	hba->spm_lvl = hba->rpm_lvl = hba->pm_lvl_min;
+
+	ufs_qcom_set_host_params(hba);
+	ufs_qcom_parse_gear_limits(hba);
+
+	return 0;
+
+out_variant_clear:
+	ufshcd_set_variant(hba, NULL);
+	return err;
+}
+
+static void ufs_qcom_fw_managed_exit(struct ufs_hba *hba)
+{
+	pm_runtime_put_sync(hba->dev);
+}
+
 /**
  * ufs_qcom_set_clk_40ns_cycles - Configure 40ns clk cycles
  *
@@ -1950,6 +2053,39 @@ static int ufs_qcom_device_reset(struct ufs_hba *hba)
 	return 0;
 }
 
+/**
+ * ufs_qcom_fw_managed_device_reset - Reset UFS device under FW-managed design
+ * @hba: pointer to UFS host bus adapter
+ *
+ * In the firmware-managed reset model, cold boot power-on is handled
+ * automatically by the PM domain framework during SCMI protocol init,
+ * before ufshcd_device_reset() is reached. For subsequent resets
+ * (such as suspend/resume or recovery), the UFS driver must explicitly
+ * invoke PM runtime operations to reset the subsystem.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+static int ufs_qcom_fw_managed_device_reset(struct ufs_hba *hba)
+{
+	static bool is_boot = true;
+	int err;
+
+	/* Skip reset on cold boot; perform it on subsequent calls */
+	if (is_boot) {
+		is_boot = false;
+		return 0;
+	}
+
+	pm_runtime_put_sync(hba->dev);
+	err = pm_runtime_resume_and_get(hba->dev);
+	if (err < 0) {
+		dev_err(hba->dev, "PM runtime resume failed: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
 static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
 					struct devfreq_dev_profile *p,
 					struct devfreq_simple_ondemand_data *d)
@@ -2229,6 +2365,20 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.freq_to_gear_speed	= ufs_qcom_freq_to_gear_speed,
 };
 
+static const struct ufs_hba_variant_ops ufs_hba_qcom_sa8255p_vops = {
+	.name                   = "qcom-sa8255p",
+	.init                   = ufs_qcom_fw_managed_init,
+	.exit                   = ufs_qcom_fw_managed_exit,
+	.hce_enable_notify      = ufs_qcom_fw_managed_hce_enable_notify,
+	.pwr_change_notify      = ufs_qcom_pwr_change_notify,
+	.apply_dev_quirks       = ufs_qcom_apply_dev_quirks,
+	.fixup_dev_quirks       = ufs_qcom_fixup_dev_quirks,
+	.suspend                = ufs_qcom_fw_managed_suspend,
+	.resume                 = ufs_qcom_fw_managed_resume,
+	.dbg_register_dump      = ufs_qcom_dump_dbg_regs,
+	.device_reset           = ufs_qcom_fw_managed_device_reset,
+};
+
 /**
  * ufs_qcom_probe - probe routine of the driver
  * @pdev: pointer to Platform device handle
@@ -2239,9 +2389,16 @@ static int ufs_qcom_probe(struct platform_device *pdev)
 {
 	int err;
 	struct device *dev = &pdev->dev;
+	const struct ufs_hba_variant_ops *vops;
+	const struct ufs_qcom_drvdata *drvdata = device_get_match_data(dev);
+
+	if (drvdata && drvdata->vops)
+		vops = drvdata->vops;
+	else
+		vops = &ufs_hba_qcom_vops;
 
 	/* Perform generic probe */
-	err = ufshcd_pltfrm_init(pdev, &ufs_hba_qcom_vops);
+	err = ufshcd_pltfrm_init(pdev, vops);
 	if (err)
 		return dev_err_probe(dev, err, "ufshcd_pltfrm_init() failed\n");
 
@@ -2269,10 +2426,15 @@ static const struct ufs_qcom_drvdata ufs_qcom_sm8550_drvdata = {
 	.no_phy_retention = true,
 };
 
+static const struct ufs_qcom_drvdata ufs_qcom_sa8255p_drvdata = {
+	.vops = &ufs_hba_qcom_sa8255p_vops
+};
+
 static const struct of_device_id ufs_qcom_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,ufshc" },
 	{ .compatible = "qcom,sm8550-ufshc", .data = &ufs_qcom_sm8550_drvdata },
 	{ .compatible = "qcom,sm8650-ufshc", .data = &ufs_qcom_sm8550_drvdata },
+	{ .compatible = "qcom,sa8255p-ufshc", .data = &ufs_qcom_sa8255p_drvdata },
 	{},
 };
 MODULE_DEVICE_TABLE(of, ufs_qcom_of_match);
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 380d02333d38..1111ab34da01 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -313,6 +313,7 @@ struct ufs_qcom_host {
 struct ufs_qcom_drvdata {
 	enum ufshcd_quirks quirks;
 	bool no_phy_retention;
+	const struct ufs_hba_variant_ops *vops;
 };
 
 static inline u32
-- 
2.34.1


