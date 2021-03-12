Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C47933826E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 01:33:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231411AbhCLAcg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 19:32:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231343AbhCLAcR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 19:32:17 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29BE5C061763
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 16:32:17 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id q130so6173878oif.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 16:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/wnT9KFtjE2dj5B3TvenbW5A0O1A3p6LBzIrAp2VB50=;
        b=nQ/PHelfe6p0xzxLiT/y3D0LTRCKSdnNbhzgJmtQ6Seq6IB8FN4cNbEJOu6ewRcqqL
         LVs49uIf89GWT58FnaQckw3dVUxx2zJYIPAJW0Csqv5mcXPI5kGoeR9jUZ5vAu+0+uMZ
         BYui7+TEEdHWCANjaULtA02QMUr5XxawJzugVmlKBCnv8Bnwg4HjPQpyD5r0w7tWuLZc
         jTRdxusyQZ0nSoIzDA3rt5wK7llfTQBpD+oUJbhCIbaMVXFa4x55VkMkyZdWbZwVTFIT
         BmGNcA+RugSuylJhfmBLObGxuwcKkKPdEq1RbULeRfkdDlioMsnmmxG8ixXydVYVoFsH
         7faQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/wnT9KFtjE2dj5B3TvenbW5A0O1A3p6LBzIrAp2VB50=;
        b=jOTK5UW5gTeE2BfD4Ru0AXoPIj8vlL1HMgJYaGF1vnhuHZba9fHBqK3TkTekhNvqeZ
         SIjYt/vmVdeOfDbqc8rJBJak9uAOH23WIAbOvTYcPsUpQ84Oibpo9phoZid4E2JhM4tp
         RjxLWITt0MSTzc7IWbjzcZWmNihsun2+gIVSCx/4yECa82hUWLxh5bQX42prkH31OtC6
         pqi2+juwSpR6K6XpaehJZeZS1FJzQfJT3jVu3N6VAAdxMIX5BRzHxzbPohJEBLkrXuE5
         spvvRNYroJMv+JAqPRMkYTP/L3mZQz2UkkoYCBxFMluIGBsHC5uDWbt6fAwNqwO5+gDY
         auHA==
X-Gm-Message-State: AOAM531aXynHZ59LSpQwjxoNNKaEwANReo8uEdF6eFxnuHpVk7bkm7C9
        plBhZEjggNs1DmDgmATx+leDjQ==
X-Google-Smtp-Source: ABdhPJzwqufzHfZoLzOmD5jMfbWGNnlySFjzLTTO1fCcGhtliPRoFuEmoE+ER6cVwwNeAAYMLcXIOg==
X-Received: by 2002:a05:6808:130a:: with SMTP id y10mr8294467oiv.138.1615509136575;
        Thu, 11 Mar 2021 16:32:16 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l190sm670835oig.39.2021.03.11.16.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 16:32:16 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, wcn36xx@lists.infradead.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH 2/5] wcn36xx: Allow firmware name to be overridden by DT
Date:   Thu, 11 Mar 2021 16:33:15 -0800
Message-Id: <20210312003318.3273536-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210312003318.3273536-1-bjorn.andersson@linaro.org>
References: <20210312003318.3273536-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The WLAN NV firmware blob differs between platforms, and possibly
devices, so add support in the wcn36xx driver for reading the path of
this file from DT in order to allow these files to live in a generic
file system (or linux-firmware).

For some reason the parent (wcnss_ctrl) also needs to upload this blob,
so rather than specifying the same information in both nodes wcn36xx
reads the string from the parent's of_node.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

This patch can be applied independently of the others, but relates to the
acceptance of the addition to the DT binding (in patch 1/5). So my suggestion
is that this one goes through the ath tree and the others through the Qualcomm
SoC tree.

 drivers/net/wireless/ath/wcn36xx/main.c    | 7 +++++++
 drivers/net/wireless/ath/wcn36xx/smd.c     | 4 ++--
 drivers/net/wireless/ath/wcn36xx/wcn36xx.h | 1 +
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wireless/ath/wcn36xx/main.c
index afb4877eaad8..87b5c0ff16c0 100644
--- a/drivers/net/wireless/ath/wcn36xx/main.c
+++ b/drivers/net/wireless/ath/wcn36xx/main.c
@@ -1407,6 +1407,13 @@ static int wcn36xx_probe(struct platform_device *pdev)
 		goto out_wq;
 	}
 
+	wcn->nv_file = WLAN_NV_FILE;
+	ret = of_property_read_string(wcn->dev->parent->of_node, "firmware-name", &wcn->nv_file);
+	if (ret < 0 && ret != -EINVAL) {
+		wcn36xx_err("failed to read \"firmware-name\" property\n");
+		goto out_wq;
+	}
+
 	wcn->smd_channel = qcom_wcnss_open_channel(wcnss, "WLAN_CTRL", wcn36xx_smd_rsp_process, hw);
 	if (IS_ERR(wcn->smd_channel)) {
 		wcn36xx_err("failed to open WLAN_CTRL channel\n");
diff --git a/drivers/net/wireless/ath/wcn36xx/smd.c b/drivers/net/wireless/ath/wcn36xx/smd.c
index d0c3a1557e8d..7b928f988068 100644
--- a/drivers/net/wireless/ath/wcn36xx/smd.c
+++ b/drivers/net/wireless/ath/wcn36xx/smd.c
@@ -514,10 +514,10 @@ int wcn36xx_smd_load_nv(struct wcn36xx *wcn)
 	u16 fm_offset = 0;
 
 	if (!wcn->nv) {
-		ret = request_firmware(&wcn->nv, WLAN_NV_FILE, wcn->dev);
+		ret = request_firmware(&wcn->nv, wcn->nv_file, wcn->dev);
 		if (ret) {
 			wcn36xx_err("Failed to load nv file %s: %d\n",
-				      WLAN_NV_FILE, ret);
+				    wcn->nv_file, ret);
 			goto out;
 		}
 	}
diff --git a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h b/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
index 71fa9992b118..5977af2116e3 100644
--- a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
+++ b/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
@@ -185,6 +185,7 @@ struct wcn36xx {
 	struct device		*dev;
 	struct list_head	vif_list;
 
+	const char		*nv_file;
 	const struct firmware	*nv;
 
 	u8			fw_revision;
-- 
2.29.2

