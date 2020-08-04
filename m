Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC8A23BDD1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Aug 2020 18:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728819AbgHDQLP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Aug 2020 12:11:15 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:63472 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729745AbgHDQLM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Aug 2020 12:11:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596557463; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=8y0jLshA9qpRvTkRjJMpImoGmv56AYBmPOWWXjPR3Lw=; b=i9+9MadUif8elTZ2uLiXyJQyh/+kXBb+o6u6dZ6mkx1OaVJful3YC1EAmUkXh+akUCqKts6o
 DRLZJrqh1QAsSMt4FtrN4gF5faT3nZOUfd8+zksfPJNcP2/i1mo2AE8n7pBjLUAeHIq5BSWU
 +uc+fFMtCr12msCDN6RfJRT2tdA=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f298888781ba1c5e2a3e478 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 04 Aug 2020 16:10:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DD412C4339C; Tue,  4 Aug 2020 16:10:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7EC43C433C6;
        Tue,  4 Aug 2020 16:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7EC43C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>
Cc:     Asutosh Das <asutoshd@codeaurora.org>,
        Can Guo <cang@codeaurora.org>, linux-scsi@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH] scsi: ufs-qcom: Remove unused msm bus scaling apis
Date:   Tue,  4 Aug 2020 21:40:33 +0530
Message-Id: <20200804161033.15586-1-saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM bus scaling has moved on to use interconnect framework
and downstream bus scaling apis like msm_bus_scale*() does
not exist anymore in the kernel. Currently they are guarded
by a config which also does not exist and hence there are no
build failures reported. Remove these unused apis as they
are currently no-op anyways and the scaling support that may
be added in future will use interconnect apis.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/scsi/ufs/ufs-qcom.c | 225 +-----------------------------------
 drivers/scsi/ufs/ufs-qcom.h |  11 --
 2 files changed, 1 insertion(+), 235 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index d0d75527830e..d78f2f8181e8 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -621,218 +621,6 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	return 0;
 }
 
-#ifdef CONFIG_MSM_BUS_SCALING
-static int ufs_qcom_get_bus_vote(struct ufs_qcom_host *host,
-		const char *speed_mode)
-{
-	struct device *dev = host->hba->dev;
-	struct device_node *np = dev->of_node;
-	int err;
-	const char *key = "qcom,bus-vector-names";
-
-	if (!speed_mode) {
-		err = -EINVAL;
-		goto out;
-	}
-
-	if (host->bus_vote.is_max_bw_needed && !!strcmp(speed_mode, "MIN"))
-		err = of_property_match_string(np, key, "MAX");
-	else
-		err = of_property_match_string(np, key, speed_mode);
-
-out:
-	if (err < 0)
-		dev_err(dev, "%s: Invalid %s mode %d\n",
-				__func__, speed_mode, err);
-	return err;
-}
-
-static void ufs_qcom_get_speed_mode(struct ufs_pa_layer_attr *p, char *result)
-{
-	int gear = max_t(u32, p->gear_rx, p->gear_tx);
-	int lanes = max_t(u32, p->lane_rx, p->lane_tx);
-	int pwr;
-
-	/* default to PWM Gear 1, Lane 1 if power mode is not initialized */
-	if (!gear)
-		gear = 1;
-
-	if (!lanes)
-		lanes = 1;
-
-	if (!p->pwr_rx && !p->pwr_tx) {
-		pwr = SLOWAUTO_MODE;
-		snprintf(result, BUS_VECTOR_NAME_LEN, "MIN");
-	} else if (p->pwr_rx == FAST_MODE || p->pwr_rx == FASTAUTO_MODE ||
-		 p->pwr_tx == FAST_MODE || p->pwr_tx == FASTAUTO_MODE) {
-		pwr = FAST_MODE;
-		snprintf(result, BUS_VECTOR_NAME_LEN, "%s_R%s_G%d_L%d", "HS",
-			 p->hs_rate == PA_HS_MODE_B ? "B" : "A", gear, lanes);
-	} else {
-		pwr = SLOW_MODE;
-		snprintf(result, BUS_VECTOR_NAME_LEN, "%s_G%d_L%d",
-			 "PWM", gear, lanes);
-	}
-}
-
-static int __ufs_qcom_set_bus_vote(struct ufs_qcom_host *host, int vote)
-{
-	int err = 0;
-
-	if (vote != host->bus_vote.curr_vote) {
-		err = msm_bus_scale_client_update_request(
-				host->bus_vote.client_handle, vote);
-		if (err) {
-			dev_err(host->hba->dev,
-				"%s: msm_bus_scale_client_update_request() failed: bus_client_handle=0x%x, vote=%d, err=%d\n",
-				__func__, host->bus_vote.client_handle,
-				vote, err);
-			goto out;
-		}
-
-		host->bus_vote.curr_vote = vote;
-	}
-out:
-	return err;
-}
-
-static int ufs_qcom_update_bus_bw_vote(struct ufs_qcom_host *host)
-{
-	int vote;
-	int err = 0;
-	char mode[BUS_VECTOR_NAME_LEN];
-
-	ufs_qcom_get_speed_mode(&host->dev_req_params, mode);
-
-	vote = ufs_qcom_get_bus_vote(host, mode);
-	if (vote >= 0)
-		err = __ufs_qcom_set_bus_vote(host, vote);
-	else
-		err = vote;
-
-	if (err)
-		dev_err(host->hba->dev, "%s: failed %d\n", __func__, err);
-	else
-		host->bus_vote.saved_vote = vote;
-	return err;
-}
-
-static int ufs_qcom_set_bus_vote(struct ufs_hba *hba, bool on)
-{
-	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
-	int vote, err;
-
-	/*
-	 * In case ufs_qcom_init() is not yet done, simply ignore.
-	 * This ufs_qcom_set_bus_vote() shall be called from
-	 * ufs_qcom_init() after init is done.
-	 */
-	if (!host)
-		return 0;
-
-	if (on) {
-		vote = host->bus_vote.saved_vote;
-		if (vote == host->bus_vote.min_bw_vote)
-			ufs_qcom_update_bus_bw_vote(host);
-	} else {
-		vote = host->bus_vote.min_bw_vote;
-	}
-
-	err = __ufs_qcom_set_bus_vote(host, vote);
-	if (err)
-		dev_err(hba->dev, "%s: set bus vote failed %d\n",
-				 __func__, err);
-
-	return err;
-}
-
-static ssize_t
-show_ufs_to_mem_max_bus_bw(struct device *dev, struct device_attribute *attr,
-			char *buf)
-{
-	struct ufs_hba *hba = dev_get_drvdata(dev);
-	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
-
-	return snprintf(buf, PAGE_SIZE, "%u\n",
-			host->bus_vote.is_max_bw_needed);
-}
-
-static ssize_t
-store_ufs_to_mem_max_bus_bw(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
-{
-	struct ufs_hba *hba = dev_get_drvdata(dev);
-	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
-	uint32_t value;
-
-	if (!kstrtou32(buf, 0, &value)) {
-		host->bus_vote.is_max_bw_needed = !!value;
-		ufs_qcom_update_bus_bw_vote(host);
-	}
-
-	return count;
-}
-
-static int ufs_qcom_bus_register(struct ufs_qcom_host *host)
-{
-	int err;
-	struct msm_bus_scale_pdata *bus_pdata;
-	struct device *dev = host->hba->dev;
-	struct platform_device *pdev = to_platform_device(dev);
-	struct device_node *np = dev->of_node;
-
-	bus_pdata = msm_bus_cl_get_pdata(pdev);
-	if (!bus_pdata) {
-		dev_err(dev, "%s: failed to get bus vectors\n", __func__);
-		err = -ENODATA;
-		goto out;
-	}
-
-	err = of_property_count_strings(np, "qcom,bus-vector-names");
-	if (err < 0 || err != bus_pdata->num_usecases) {
-		dev_err(dev, "%s: qcom,bus-vector-names not specified correctly %d\n",
-				__func__, err);
-		goto out;
-	}
-
-	host->bus_vote.client_handle = msm_bus_scale_register_client(bus_pdata);
-	if (!host->bus_vote.client_handle) {
-		dev_err(dev, "%s: msm_bus_scale_register_client failed\n",
-				__func__);
-		err = -EFAULT;
-		goto out;
-	}
-
-	/* cache the vote index for minimum and maximum bandwidth */
-	host->bus_vote.min_bw_vote = ufs_qcom_get_bus_vote(host, "MIN");
-	host->bus_vote.max_bw_vote = ufs_qcom_get_bus_vote(host, "MAX");
-
-	host->bus_vote.max_bus_bw.show = show_ufs_to_mem_max_bus_bw;
-	host->bus_vote.max_bus_bw.store = store_ufs_to_mem_max_bus_bw;
-	sysfs_attr_init(&host->bus_vote.max_bus_bw.attr);
-	host->bus_vote.max_bus_bw.attr.name = "max_bus_bw";
-	host->bus_vote.max_bus_bw.attr.mode = S_IRUGO | S_IWUSR;
-	err = device_create_file(dev, &host->bus_vote.max_bus_bw);
-out:
-	return err;
-}
-#else /* CONFIG_MSM_BUS_SCALING */
-static int ufs_qcom_update_bus_bw_vote(struct ufs_qcom_host *host)
-{
-	return 0;
-}
-
-static int ufs_qcom_set_bus_vote(struct ufs_hba *host, bool on)
-{
-	return 0;
-}
-
-static int ufs_qcom_bus_register(struct ufs_qcom_host *host)
-{
-	return 0;
-}
-#endif /* CONFIG_MSM_BUS_SCALING */
-
 static void ufs_qcom_dev_ref_clk_ctrl(struct ufs_qcom_host *host, bool enable)
 {
 	if (host->dev_ref_clk_ctrl_mmio &&
@@ -976,7 +764,6 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
 		/* cache the power mode parameters to use internally */
 		memcpy(&host->dev_req_params,
 				dev_req_params, sizeof(*dev_req_params));
-		ufs_qcom_update_bus_bw_vote(host);
 
 		/* disable the device ref clock if entered PWM mode */
 		if (ufshcd_is_hs_mode(&hba->pwr_info) &&
@@ -1107,9 +894,7 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 
 	switch (status) {
 	case PRE_CHANGE:
-		if (on) {
-			err = ufs_qcom_set_bus_vote(hba, true);
-		} else {
+		if (!on) {
 			if (!ufs_qcom_is_link_active(hba)) {
 				/* disable device ref_clk */
 				ufs_qcom_dev_ref_clk_ctrl(host, false);
@@ -1121,8 +906,6 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 			/* enable the device ref clock for HS mode*/
 			if (ufshcd_is_hs_mode(&hba->pwr_info))
 				ufs_qcom_dev_ref_clk_ctrl(host, true);
-		} else {
-			err = ufs_qcom_set_bus_vote(hba, false);
 		}
 		break;
 	}
@@ -1264,10 +1047,6 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 		goto out_variant_clear;
 	}
 
-	err = ufs_qcom_bus_register(host);
-	if (err)
-		goto out_variant_clear;
-
 	ufs_qcom_get_controller_revision(hba, &host->hw_ver.major,
 		&host->hw_ver.minor, &host->hw_ver.step);
 
@@ -1307,7 +1086,6 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 	if (err)
 		goto out_variant_clear;
 
-	ufs_qcom_set_bus_vote(hba, true);
 	ufs_qcom_setup_clocks(hba, true, POST_CHANGE);
 
 	if (hba->dev->id < MAX_UFS_QCOM_HOSTS)
@@ -1446,7 +1224,6 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba,
 				    dev_req_params->pwr_rx,
 				    dev_req_params->hs_rate,
 				    false);
-		ufs_qcom_update_bus_bw_vote(host);
 	}
 
 out:
diff --git a/drivers/scsi/ufs/ufs-qcom.h b/drivers/scsi/ufs/ufs-qcom.h
index 97247d17e258..3f4922743b3e 100644
--- a/drivers/scsi/ufs/ufs-qcom.h
+++ b/drivers/scsi/ufs/ufs-qcom.h
@@ -174,16 +174,6 @@ static inline void ufs_qcom_deassert_reset(struct ufs_hba *hba)
 	mb();
 }
 
-struct ufs_qcom_bus_vote {
-	uint32_t client_handle;
-	uint32_t curr_vote;
-	int min_bw_vote;
-	int max_bw_vote;
-	int saved_vote;
-	bool is_max_bw_needed;
-	struct device_attribute max_bus_bw;
-};
-
 /* Host controller hardware version: major.minor.step */
 struct ufs_hw_version {
 	u16 step;
@@ -216,7 +206,6 @@ struct ufs_qcom_host {
 
 	struct phy *generic_phy;
 	struct ufs_hba *hba;
-	struct ufs_qcom_bus_vote bus_vote;
 	struct ufs_pa_layer_attr dev_req_params;
 	struct clk *rx_l0_sync_clk;
 	struct clk *tx_l0_sync_clk;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

