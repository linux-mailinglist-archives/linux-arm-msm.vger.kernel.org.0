Return-Path: <linux-arm-msm+bounces-81893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 62224C5DD25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 16:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ABB05368AC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 15:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5377A33DEF5;
	Fri, 14 Nov 2025 14:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aq3cTo12";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SpXU1cgI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BC633D6CB
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763132248; cv=none; b=nkDEDMvHVHUbBPK6ucisFcJpzoWVt3WTv4wT73aaH1ooCwFuqVdNWDtiEn+NrRXuZw0zrwkIVP7OXY8HCYGqvZIj8MZ7btuF0V2gH3oon11rF0D5pg/pEU+FGNo5WR8ESXtLJknZ7HfBSxJ8fe4o/eRCiIjUK8Uyq4D/LjvgExA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763132248; c=relaxed/simple;
	bh=NDU/9DTGFzTS6lHtk5lvp+cXA2+ZXVND12r05xXFGZw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cqqxOBmwCz2eIfZ2/Q+GiCTy115KQDM5GbSm/+fr+TxAktRRYlylE6WCeKPCHAY1GFG4tGzjucBu4g+A70pC5+p2Ixx/wCK9eoai6fY4mfjWjynGsu6sTQnoZBatvkPfnkYABAY5pasSDGZXCpeiRR/F/ttCdZvqcZMp773DKms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aq3cTo12; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SpXU1cgI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE80GhJ1484495
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aq+XT4jKptJ
	SUIP35BrFeVRs5wjC8qJyB9EbrAfv+z4=; b=Aq3cTo12ElBNQ94jgVomCptbPf1
	JaUEenX5oCJTddwHklj9x+zd58hXR3oK0KOH4dC4JFnopubYwgrkP0bGRjT8B1fU
	yjhi70mjR1dmXbL3OrxAag5/GO8XIz8LkRALKta4RfvVYRqru+YK9LG0mikuhtUA
	tddMy6k5p5v+HEeQJb2o9Tnpur53sLSf+yBAtMY5tqx9V88ExjVDvng3Rpn7mI6x
	db1vgHHXBlN9aYkUlArPxnhuOwlzDp/+zNJaBqHO5Okm+bIiwozARBoHv2KI6sOM
	rHz+JohAfywYdJwBffUCSTEXEugMVTkgfzhtJwW98Hcl1VyI25YLB63x0Eg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9cjhu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:57:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso4139906a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 06:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763132245; x=1763737045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aq+XT4jKptJSUIP35BrFeVRs5wjC8qJyB9EbrAfv+z4=;
        b=SpXU1cgI6mqGqsrgcFt0RM0QHdPIuMszpsqg8SgA3t5sNMVOR9bH3lAs2KtnMG6kZx
         KZH3DS6at3g2Ra7wwykxRVX2+0rdKvOyLQTe+Z3fO9QgjMDasB6BRSGaim+46N/MO7qG
         jG47iWXJPkvyXUHghjVNALnl0i+OSXLkv8DJ4C6do/SR9EpE+4Bda92MPMYVtWGfoj7q
         hGNoA+vr4KWyZrCkpbMCTSs5h1nEeyhKpYDLZn3Qi4ZLARK1fjjCtpioqZOgDysG2h+W
         7vA6GFqtKDK9MQZIKOGJYs+0knskcDFroa4IY6xWzSbz3PiJ3eOu+OhpDZGyjdZZ9vt9
         +BvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763132245; x=1763737045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aq+XT4jKptJSUIP35BrFeVRs5wjC8qJyB9EbrAfv+z4=;
        b=UcjkLNLovUYmAwc921q06pyfkjLlFo6xmo3jdduCqhMpl775DjqDOQWxazK8EdVspJ
         EznJaEwIPZxL542j23MjMKK4HzHdDbBjNZyQztBSlZJZIxD15GB8thZxSjoxOEUIoQcY
         qz3D2NAxMJNZOXNRA6t8OHIlK5vi8x/gXxXupF3nZG9q1ZiuBKdYVeKrvxBsHvaaaHOw
         F+4lPwPa2UISWiZPWDCcNWrRHSTutYDCaRb5ImsBIp+ZZA9f9raJAgzKFWJw/36Ysi7+
         mqPdZnfJlV7g+4yu6LvVs7dwoJm16SfVl45eyRqQv6IJWZrq3bDm6AFECwQexVCNhtsj
         tjVw==
X-Gm-Message-State: AOJu0Yzq26I/Wyu3fsXcZjW8TWWg5JwgB2MB/Dy8M1WIaFNZlCursCrg
	bwu/+kGaZ0JrNyV4wtDrN2+5H6/haSJWFSfgeF2Lj7nOuIM9DT3UduZ/5Uw9aqDRChW6LhCe/SN
	PF8bQfRDKyxkCbRAI/vFR/fy2U/XlzOwu6ARsstEC+4H3VBVYoohkkn6QskQHC9yMp9yy
X-Gm-Gg: ASbGncv4mx1JCitzoAuArn7r+xLhS0pLFCYQiOYIAhEMn5hJR696qvIntdLfG/ej0Fs
	aPjfUUPUztNCn5WgerXha8zo/u0l458ONwcbJ+8OOEi+gEpZwpcHy09JPLysc6AkllWIJ1Rk6fO
	ZlcgmIkKj8OGGRqHGIZxijHeUD9bi5u+619eCHD8w1YphPRMRx+3onZ4+QnY0qpakZ2o1S9CSzN
	IucgO2UXqSHM9dgg21Tfkb44qT68JcePKEH8QK1iKy5XP1lH8DKXKQdwDyfFxxjwrRDP3wDPo9q
	CQlSDKDCxBGhnu2sse1I/ZhUUIjQc8bXlSnsYvuCRfUj/ukazu6tibQEf1i/ksFCH/x7Hj88qvf
	rSpIH6N0GdxODBhQ75xXLsSpIJdIJyA==
X-Received: by 2002:a17:902:e548:b0:294:fb21:ae07 with SMTP id d9443c01a7336-2986a6d692dmr37469135ad.21.1763132244625;
        Fri, 14 Nov 2025 06:57:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLkk2GCSNJknT6ol4YR4oPjskABRG9VD9RIRBzBKsc5wu7Io5HACafNijLahG9P+6hwQPyAw==
X-Received: by 2002:a17:902:e548:b0:294:fb21:ae07 with SMTP id d9443c01a7336-2986a6d692dmr37468815ad.21.1763132244095;
        Fri, 14 Nov 2025 06:57:24 -0800 (PST)
Received: from hu-rdwivedi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c244e13sm57548015ad.29.2025.11.14.06.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:57:23 -0800 (PST)
From: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
To: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, ram.dwivedi@oss.qualcomm.com,
        quic_ahari@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shazad Hussain <quic_shazhuss@quicinc.com>
Subject: [PATCH V1 3/3] ufs: ufs-qcom: Add support for firmware-managed resource abstraction
Date: Fri, 14 Nov 2025 20:26:46 +0530
Message-Id: <20251114145646.2291324-4-ram.dwivedi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114145646.2291324-1-ram.dwivedi@oss.qualcomm.com>
References: <20251114145646.2291324-1-ram.dwivedi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: t4xelAT-kxRSBMQMMF4qBFper2dBI8ue
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEyMCBTYWx0ZWRfXwB88pWN/PI9w
 WNBHX/3PkDslkU1+jUbGxkFfWR6OcWyyKlKwkfeyWgb1e15j1c6r/n7CCDPi7zPyjlxZpDe03Yj
 200RABwF55MGtRxrue+Z/8Bqrp+B3f35zWZGRPUCp9lxjAtHLNsiGApPML1KBawoZGC/Ug0Bqiv
 G01ByPEAb/2oAkGmTgOhKiiZ4cErnMtomjshYvWIUjv6YnITr30aRWznnK/uXMoxO5Sj1C4h9cV
 GngCEInXa0YV6emWir+IHo+qkAgD9TGS+DLsFk3W9XnHH3TJ659KXMBa9Hh4sZafU+fCWwDLqKE
 zTxRPxtepQD5UgBm74eJhzwJXjo+RGwkVQZ6tr3R6gryxkaA0zMz2zbq5RE2JejUCz4vCv0PbMc
 DBt7PzXtvmHJFHAZ1RRrssUXFuR0Zg==
X-Authority-Analysis: v=2.4 cv=MNdtWcZl c=1 sm=1 tr=0 ts=69174355 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=TgZdhWxOq2hPTxl1y-EA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: t4xelAT-kxRSBMQMMF4qBFper2dBI8ue
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140120

From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>

Add a compatible string for SA8255p platforms where resources such as
PHY, clocks, regulators, and resets are managed by firmware through an
SCMI server. Use the SCMI power protocol to abstract these resources and
invoke power operations via runtime PM APIs (pm_runtime_get/put_sync).

Introduce vendor operations (vops) for SA8255p targets to enable SCMI-
based resource control. In this model, capabilities like clock scaling
and gating are not yet supported; these will be added incrementally.

Co-developed-by: Anjana Hari <quic_ahari@quicinc.com>
Signed-off-by: Anjana Hari <quic_ahari@quicinc.com>
Co-developed-by: Shazad Hussain <quic_shazhuss@quicinc.com>
Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 161 +++++++++++++++++++++++++++++++++++-
 drivers/ufs/host/ufs-qcom.h |   1 +
 2 files changed, 161 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 8d119b3223cb..13ccf1fb2ebf 100644
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
@@ -1421,6 +1475,52 @@ static void ufs_qcom_exit(struct ufs_hba *hba)
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
@@ -1952,6 +2052,39 @@ static int ufs_qcom_device_reset(struct ufs_hba *hba)
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
@@ -2231,6 +2364,20 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
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
@@ -2241,9 +2388,16 @@ static int ufs_qcom_probe(struct platform_device *pdev)
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
 
@@ -2271,10 +2425,15 @@ static const struct ufs_qcom_drvdata ufs_qcom_sm8550_drvdata = {
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


