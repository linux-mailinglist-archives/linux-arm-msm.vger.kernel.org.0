Return-Path: <linux-arm-msm+bounces-88683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FE2D172DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03B8E30963F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C14B36C0C9;
	Tue, 13 Jan 2026 08:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NtCWm5I3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TMKmwKJU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D37136B058
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768291298; cv=none; b=rZh4zZdMSHrAqlD5y1flC4UgViiUZ6zjSkUaI81KTYNpkGfd6zOsipFjxbzpgv5Tx86nU5G1KQz8pavT473kEY1FPRlTsR39H+N4Dmwe80xuU1Uon9nDd7W1leqjtFwLn2i0xkUFWdig2GM+ewPCuRmfysE1F49igJ2LwX33riY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768291298; c=relaxed/simple;
	bh=5C+MMRfW5HATC9/GKfhwCJbFXWuL5tBqusvLD8ZnEzg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e2rkxDwL8OrHDSk+IKdjMYE0LwZaIypWM2jmMi20S4c6oggbBgGkgC0DvAvAoDFyETaRJRBSktv++w/y354JCxbj1gGfMjWRvrRvKlU4Eze/3sA+fJoZg1uWAFi2Vi9oW+x/Kyipe6AO0bKO5dVGA8sdE1ZraGlIgtHemkf3h5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NtCWm5I3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TMKmwKJU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7P16D2514273
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IWX5yIg5tIK
	QdRtJnez+8YTz+9JJufKUZ8xo5ixAo9w=; b=NtCWm5I3WZ04A1Kuu90jIhyLUbF
	atu/ZgvNuZHqIpIH4hMZQpjSd0NxkP188+j2on9dLaDL7L9n80MOD1aDc0iGMHuq
	/vz2LaU5VKjd/pODupZTawpONPHNJgB6QDlM4pl7KeM46eEVD6nTMx0/AZa0kcpR
	inek13W3wVV+Whb8qifr8qtxJ7IjKJChvm0SSzptcuYmSsivyiPOfXeESveDMYWl
	hF8IrgPa6MZiMMw+Y+vO5gzOBa1Fw/Ql4CbOIinFPlNFDwqChTTqjGmtndd8TbFY
	lNYQsdj+igJ5f3VolMuiDFwJd+Rr5bafkip0p7oBceln6Y5zhVm89RSbGnw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6y8swf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:01:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f8e6a5de4so72014305ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 00:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768291282; x=1768896082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWX5yIg5tIKQdRtJnez+8YTz+9JJufKUZ8xo5ixAo9w=;
        b=TMKmwKJU/j5pBgQ7acwSfvc+NCwIlbrJSRVOVRnS9JYCcOkVBLe7yHkNy3Vw42YJ4M
         DjclRukGW6Uo2gAXtFo5AGZu8ZzDXjhmWSsNDv6SmvGHIjVXtzgBZ4gu5LHgdMkPIKAT
         0QaFoXL3M5vAONh0lxa256El/4bOC+29bGWzNPYOCkhyoAl2BPTpKJ/uKlio007XP2LG
         2DoWnhW1+Vqbh1dLsk9Iu+UJJIQa+AXMOzYO2/sBoHj2aNSa7GfiCRQLDnIZX7TY9ZaU
         MBeTDd8GNdDs0Lp7aghzKcugyLzn8VeLpNfCYpJAI6MOc8uCWM+2d8lMun7J+GhfJpPQ
         J2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768291282; x=1768896082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IWX5yIg5tIKQdRtJnez+8YTz+9JJufKUZ8xo5ixAo9w=;
        b=BouflHX2Q1Lr+MuG/OktuEGkScve0k1J4I0dECKjb/Zu9CuhEXQh9lHP67vBmlKKq5
         nUWFFve4I/KQnKboIy6K6Rm+wAPs0AJwPvth7tKyerQVLZO5vXWHleKgYcSFkd3lG+Uj
         IYClXq/2sakR3AshLZTtLdMwWWxqKMfrGyRQ1ecftqfdeK0TfDQycn9DgRtkoKvYvqhr
         xTRWz43KL11Vux5p+cot5iQJ+ypPVoLWwozGE2UcTXrPXrhVef6k09BcO1XjNvnLKd5W
         EICr/VFgjgZ8eE3gk9kaVPXsN3Uwu0Ca8mcRHEtKUhJdHhUo/6KzVHI1qKZ5u1K2zyLz
         C5uQ==
X-Gm-Message-State: AOJu0YzuE5ieT9PjbOVJCNl/vNPdw+JGPyyj39xWR9rmVOIJW2Jmahai
	QxiXMQc5ovvKhQSi8aSSpLKzu2JNwPGuyNp9fQphecLU/oiPWrjwFt3ENyNTsXxbWrfaMjbh86O
	HeQVW7q16AWmhscAtJosgfPLN7KcmhUcEaQEJirl+Ytqj0UVjgLHq8exeqnvKafXhoiNZ
X-Gm-Gg: AY/fxX6eQnDrZLGvU7M0/alqF7x6Ex34v5tA+5TJqFBVHJX8oSMe9wOL+n4dIWWvBOK
	OX5alw0sT4l+WuvnX8NJfg2uAUccUlWrYEAER+nAbGfM8eraG2uh/SfoTON3g/z0Co341px++aK
	H7l2/LjGcN5YQgcvFsQmU6b2HYa9YnztLUAbfyz6pRaWV7x+dAtQbFixfhqtJAzXPSyyFIVpwNE
	iEaz8NtwWj9lLG4ZRCOTN7t6N/+kfgfO6IsvE3kTEF++qRjjIXff2hAVOUv2LrRyf0Hr3i1U6i5
	tXKdpizUQYAubvJ1csPvSw74ZouPbIEoPxrlAtQfVCmgQSXpfc4aCglQDzzDE+UUkG2vb9AZWWF
	w4lAzyzhugGNzxwtd6lKPdNJlHEzxuQgZalgiO/nt
X-Received: by 2002:a17:902:d501:b0:2a0:dabc:1388 with SMTP id d9443c01a7336-2a3ee47d571mr187685375ad.28.1768291281527;
        Tue, 13 Jan 2026 00:01:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHo2Vm8ZNkjOT/uY1a2KVKGKdBpOLilLwSo01EJLxFI6+/2bNEB3LGqglrNlZC8yzeT2bokng==
X-Received: by 2002:a17:902:d501:b0:2a0:dabc:1388 with SMTP id d9443c01a7336-2a3ee47d571mr187684935ad.28.1768291280972;
        Tue, 13 Jan 2026 00:01:20 -0800 (PST)
Received: from hu-rdwivedi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48c15sm191132725ad.27.2026.01.13.00.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 00:01:20 -0800 (PST)
From: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
To: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, ram.dwivedi@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anjana Hari <anjana.hari@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Subject: [PATCH V5 4/4] ufs: ufs-qcom: Add support for firmware-managed resource abstraction
Date: Tue, 13 Jan 2026 13:30:46 +0530
Message-Id: <20260113080046.284089-5-ram.dwivedi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113080046.284089-1-ram.dwivedi@oss.qualcomm.com>
References: <20260113080046.284089-1-ram.dwivedi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hbm5eMcEgGjWNapQfoU99dcqh7f844fN
X-Authority-Analysis: v=2.4 cv=dK6rWeZb c=1 sm=1 tr=0 ts=6965fbd2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TgZdhWxOq2hPTxl1y-EA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: hbm5eMcEgGjWNapQfoU99dcqh7f844fN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA2NiBTYWx0ZWRfX6B1nSJ+nxShd
 QrGrQbvqutkpkyRMVnARJh43SUVnfURTmJKVRoDB+G1FwET6B4hAhfrRMRGmNfA/biErm5/rR5K
 NrcevFt8z7gqm7k1L072KlyXbIgqyS/1bpljMrDC6VNHGBRy8bRySAn+Rfyp8THNBViBJyN7maN
 HVZ2RbcZ3KTFxCb1Fpu/1JCIHKD5ejmrvdYJEYyZJSmcfc904A2+9hvlcxxVxT1jD/nzrSG48b6
 Sym87Oq5iwbJJddgvcCDSH8yyeRci0s0VZf9VxxdUnrVf+MWG4VUGUn9r4qDt4JeNMb+iBAq3y2
 wL+RC4FQ5z2+OEEA4BuYqlrAnxAAa1YrXONLSbvHIc20DYZST+45wIvL+ILaXgemA7ZAsGO/hJG
 YqJqRD1aVB4RjrpvNo/8PYwEcsQC8kmSAs8OZg4nsUt81DEpff7KoZMmYH2wlbj8T+3BGKpJPqe
 SldjNSRqhxQt0SWae5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130066

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
 drivers/ufs/host/ufs-qcom.c | 156 +++++++++++++++++++++++++++++++++++-
 drivers/ufs/host/ufs-qcom.h |   1 +
 2 files changed, 156 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 8ebee0cc5313..375fd24ba458 100644
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
@@ -789,6 +811,33 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
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
@@ -1421,6 +1470,54 @@ static void ufs_qcom_exit(struct ufs_hba *hba)
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
+	hba->spm_lvl = hba->rpm_lvl = hba->pm_lvl_min = UFS_PM_LVL_5;
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
@@ -1950,6 +2047,37 @@ static int ufs_qcom_device_reset(struct ufs_hba *hba)
 	return 0;
 }
 
+/**
+ * ufs_qcom_fw_managed_device_reset - Reset UFS device under FW-managed design
+ * @hba: pointer to UFS host bus adapter
+ *
+ * In the firmware-managed reset model, the power domain is powered on by genpd
+ * before the UFS controller driver probes. For subsequent resets (such as
+ * suspend/resume or recovery), the UFS driver must explicitly invoke PM runtime
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
@@ -2229,6 +2357,20 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
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
@@ -2239,9 +2381,16 @@ static int ufs_qcom_probe(struct platform_device *pdev)
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
 
@@ -2269,10 +2418,15 @@ static const struct ufs_qcom_drvdata ufs_qcom_sm8550_drvdata = {
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


