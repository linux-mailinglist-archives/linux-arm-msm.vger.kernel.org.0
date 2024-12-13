Return-Path: <linux-arm-msm+bounces-42035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BA29F0E05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 14:55:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9E592849F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 13:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7961E1A08;
	Fri, 13 Dec 2024 13:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJCJTX5u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297CC1E0DCD;
	Fri, 13 Dec 2024 13:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734098017; cv=none; b=VcAqtXu/wq1c8iTzYEGrHevHkXMr8kaIGNQeGvlh4QApLQbxbnz8CfaHaqKHfGfPS0Jf4QFn4UXwbdfimzcKI+0PJHnWygGAba7f51VZGVz9YKuXVt7QOji7IG1NlbdUtedmVhrm47FCvzsfUwTkDmwEXdKcuPLqFxjxmdSB0vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734098017; c=relaxed/simple;
	bh=ILrVOZAnjJk8uP2YDbIU+dxS9aQbWGYFC0vNs5GJeq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o3fJ8a2Qq9EZML7pIF6mHGy0ajDaR9m9JLnxDp3Hz0qlGYsOxkR5aUHtLxTmbmChRIwsVeTIKT540y/xowKMaM0A9vGIJ3n1K14mS5S1EiXDctGXalqYvdEQt4BS0FWKXgoGlc7oMA3Whe2g+V3BErpFj7RJKmxidqDAXtDWvTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJCJTX5u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86643C4CED2;
	Fri, 13 Dec 2024 13:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734098016;
	bh=ILrVOZAnjJk8uP2YDbIU+dxS9aQbWGYFC0vNs5GJeq4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VJCJTX5ujgivEC97TnV4uxHcd1BWB31/0GBILvnuvhqlAETVtCL7yeyGPXUaT+IOo
	 aIdD1LoFjJhJz1XMJXQvMq5muFo5tlSUyY45XNdklcx+Y591TRiHrT37QNImBQ69k5
	 BlwURbqBaQ/WbSDlBWH1YVFpP4YrYXFcpEUbFaeQJkNB9wzFFcQq6DG/ATmcu3BV85
	 5fwpX/XA8KEWSPlWi2bKPD3d1WVl1HqTpGZqD2LB2PZiWdKKQep1SWIafNlF3hYtdj
	 VbPAMRBAR0zVRfitHbwmotyjimLvFh8yXOe8CKivs5du0+FQ0BjYz/5UcDYw6yk6HW
	 bfWXdCYcp7vDw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B360E77180;
	Fri, 13 Dec 2024 13:53:36 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Fri, 13 Dec 2024 19:23:29 +0530
Subject: [PATCH v2 1/3] scsi: ufs: qcom: Power off the PHY if it was
 already powered on in ufs_qcom_power_up_sequence()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-ufs-qcom-suspend-fix-v2-1-1de6cd2d6146@linaro.org>
References: <20241213-ufs-qcom-suspend-fix-v2-0-1de6cd2d6146@linaro.org>
In-Reply-To: <20241213-ufs-qcom-suspend-fix-v2-0-1de6cd2d6146@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>, 
 Nitin Rawat <quic_nitirawa@quicinc.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 stable@vger.kernel.org, Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6268;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=Sv4V4lP72bSSLgkPPE0X0h9+uMY2fNRzExFuxTd/oBU=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBnXDxb7oP5rerxn5AN1GGgl0eGejKfGcaFcWqgf
 yW3X6IAOhuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZ1w8WwAKCRBVnxHm/pHO
 9Y56B/9HwMY/oBu+OmjNpGOKJDFBMQXkS79rz2KZj/YBNXHImDeR1SIaaBxuPyc2tcyEornXz/8
 2WptibUDZ/VqDRx+nksbSmLxX43e8IqdF8UW/+O/RmxEX5/jbO9UpWh0M1G5ejlJkmoZq8Yxoql
 wrR0rTufz6mjoVL7OoHf7PDXqjqygA39kTygzlgz69YW8udZFAl2mOA1+dCtnBPYHDRbBVPe/iZ
 32MNbLZ8IUVNEcJGSC2wyPpC4AFs4z8/NAs8/KAxOtSLWgVgv1BeGWWvSvKjWmk1l9Y5AXhkPW6
 gaNmxLrJYbyK64wti7GDzJH3qIJZ4VCEYYBMVKGRz2DkTbGg
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

PHY might already be powered on during ufs_qcom_power_up_sequence() in a
couple of cases:

1. During UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH quirk
2. Resuming from spm_lvl = 5 suspend

In those cases, it is necessary to call phy_power_off() and phy_exit() in
ufs_qcom_power_up_sequence() function to power off the PHY before calling
phy_init() and phy_power_on().

Case (1) is doing it via ufs_qcom_reinit_notify() callback, but case (2) is
not handled. So to satisfy both cases, call phy_power_off() and phy_exit()
if the phy_count is non-zero. And with this change, the reinit_notify()
callback is no longer needed.

This fixes the below UFS resume failure with spm_lvl = 5:

ufshcd-qcom 1d84000.ufshc: Enabling the controller failed
ufshcd-qcom 1d84000.ufshc: Enabling the controller failed
ufshcd-qcom 1d84000.ufshc: Enabling the controller failed
ufshcd-qcom 1d84000.ufshc: ufshcd_host_reset_and_restore: Host init failed -5
ufshcd-qcom 1d84000.ufshc: Enabling the controller failed
ufshcd-qcom 1d84000.ufshc: Enabling the controller failed
ufshcd-qcom 1d84000.ufshc: Enabling the controller failed
ufshcd-qcom 1d84000.ufshc: ufshcd_host_reset_and_restore: Host init failed -5
ufshcd-qcom 1d84000.ufshc: Enabling the controller failed
ufshcd-qcom 1d84000.ufshc: Enabling the controller failed
ufshcd-qcom 1d84000.ufshc: Enabling the controller failed
ufshcd-qcom 1d84000.ufshc: ufshcd_host_reset_and_restore: Host init failed -5
ufshcd-qcom 1d84000.ufshc: Enabling the controller failed
ufshcd-qcom 1d84000.ufshc: Enabling the controller failed
ufshcd-qcom 1d84000.ufshc: Enabling the controller failed
ufshcd-qcom 1d84000.ufshc: ufshcd_host_reset_and_restore: Host init failed -5
ufshcd-qcom 1d84000.ufshc: Enabling the controller failed
ufshcd-qcom 1d84000.ufshc: Enabling the controller failed
ufshcd-qcom 1d84000.ufshc: Enabling the controller failed
ufshcd-qcom 1d84000.ufshc: ufshcd_host_reset_and_restore: Host init failed -5
ufs_device_wlun 0:0:0:49488: ufshcd_wl_resume failed: -5
ufs_device_wlun 0:0:0:49488: PM: dpm_run_callback(): scsi_bus_resume returns -5
ufs_device_wlun 0:0:0:49488: PM: failed to resume async: error -5

Cc: stable@vger.kernel.org # 6.3
Fixes: baf5ddac90dc ("scsi: ufs: ufs-qcom: Add support for reinitializing the UFS device")
Reported-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Tested-by: Amit Pundir <amit.pundir@linaro.org> # on SM8550-HDK
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/core/ufshcd-priv.h |  6 ------
 drivers/ufs/core/ufshcd.c      |  1 -
 drivers/ufs/host/ufs-qcom.c    | 13 +++++--------
 include/ufs/ufshcd.h           |  2 --
 4 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index 7aea8fbaeee8..1f413b3aab5d 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -236,12 +236,6 @@ static inline void ufshcd_vops_config_scaling_param(struct ufs_hba *hba,
 		hba->vops->config_scaling_param(hba, p, data);
 }
 
-static inline void ufshcd_vops_reinit_notify(struct ufs_hba *hba)
-{
-	if (hba->vops && hba->vops->reinit_notify)
-		hba->vops->reinit_notify(hba);
-}
-
 static inline int ufshcd_vops_mcq_config_resource(struct ufs_hba *hba)
 {
 	if (hba->vops && hba->vops->mcq_config_resource)
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 6a2685333076..7bd0f5482db3 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -8820,7 +8820,6 @@ static int ufshcd_probe_hba(struct ufs_hba *hba, bool init_dev_params)
 		ufshcd_device_reset(hba);
 		ufs_put_device_desc(hba);
 		ufshcd_hba_stop(hba);
-		ufshcd_vops_reinit_notify(hba);
 		ret = ufshcd_hba_enable(hba);
 		if (ret) {
 			dev_err(hba->dev, "Host controller enable failed\n");
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 3b592492e152..32b0c74437de 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -368,6 +368,11 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
 	if (ret)
 		return ret;
 
+	if (phy->power_count) {
+		phy_power_off(phy);
+		phy_exit(phy);
+	}
+
 	/* phy initialization - calibrate the phy */
 	ret = phy_init(phy);
 	if (ret) {
@@ -1579,13 +1584,6 @@ static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
 }
 #endif
 
-static void ufs_qcom_reinit_notify(struct ufs_hba *hba)
-{
-	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
-
-	phy_power_off(host->generic_phy);
-}
-
 /* Resources */
 static const struct ufshcd_res_info ufs_res_info[RES_MAX] = {
 	{.name = "ufs_mem",},
@@ -1825,7 +1823,6 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.device_reset		= ufs_qcom_device_reset,
 	.config_scaling_param = ufs_qcom_config_scaling_param,
 	.program_key		= ufs_qcom_ice_program_key,
-	.reinit_notify		= ufs_qcom_reinit_notify,
 	.mcq_config_resource	= ufs_qcom_mcq_config_resource,
 	.get_hba_mac		= ufs_qcom_get_hba_mac,
 	.op_runtime_config	= ufs_qcom_op_runtime_config,
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index d7aca9e61684..6e40b8e8009b 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -327,7 +327,6 @@ struct ufs_pwr_mode_info {
  * @program_key: program or evict an inline encryption key
  * @fill_crypto_prdt: initialize crypto-related fields in the PRDT
  * @event_notify: called to notify important events
- * @reinit_notify: called to notify reinit of UFSHCD during max gear switch
  * @mcq_config_resource: called to configure MCQ platform resources
  * @get_hba_mac: reports maximum number of outstanding commands supported by
  *	the controller. Should be implemented for UFSHCI 4.0 or later
@@ -379,7 +378,6 @@ struct ufs_hba_variant_ops {
 				    void *prdt, unsigned int num_segments);
 	void	(*event_notify)(struct ufs_hba *hba,
 				enum ufs_event_type evt, void *data);
-	void	(*reinit_notify)(struct ufs_hba *);
 	int	(*mcq_config_resource)(struct ufs_hba *hba);
 	int	(*get_hba_mac)(struct ufs_hba *hba);
 	int	(*op_runtime_config)(struct ufs_hba *hba);

-- 
2.25.1



