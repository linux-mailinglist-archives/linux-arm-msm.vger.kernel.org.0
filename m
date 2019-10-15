Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 728ECD72DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2019 12:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730161AbfJOKLK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Oct 2019 06:11:10 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40863 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730157AbfJOKLJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Oct 2019 06:11:09 -0400
Received: by mail-wr1-f68.google.com with SMTP id o28so476363wro.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2019 03:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yTcxngXEkdeT6TmpQoj373zyfLdTNEDntvuleghb3z0=;
        b=Tk3U4INVvMhn3XuqivdMRKYFmy1lMLS1ACVuZo/76VgXTjomtOlZ9OqUlracsv33Vq
         xFRM90kKKiMBBX2Ye8yIe2AWio4DmGOfvK5e4FCxQkKGwiajFBGfMYSrMFidAo0JZqt6
         sqYkVftgtyc21x4VFhS+jB1QojVVwJSYMIR2Z5Q3r/PL97TAb8HnkzZSTa1YdE7o4UtC
         kTdMD3UDPaRixQN4c+ux/5arVaXw77pxXkwEQAN4WwhuvZ1nwrH/6bTQ6H+XfJU0NNH6
         zIblq1TUfLvRJo3U16cbRxDaSlq06we2oGa/E3UW2RxmRX6fJiHbl/wtLhzm4NuxMHEG
         QuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yTcxngXEkdeT6TmpQoj373zyfLdTNEDntvuleghb3z0=;
        b=RrvvPi1wvamnXa364yhyxhX9SGnbSZ9H4rahaRL5GZCTgPqrM3Yt61eCnedst1H74F
         Uaa8QAlS/RBdHbCCUhIe28Agpi6G8bIrj6Z2eO9ZhtOn2JJ59sy+Rkwcnf+55kJaxNtj
         ekyZTZOGx7oUqoiDz2fOQliYj0Zc45i7r+VUAVkA6ebukuOpeR1tVUF+gkPXJTR0d+2X
         kIj5+3gDmkz15qEpdsXoCCrE71D6psJrt54vAOG1vEDlMMfECNnz1IOW4cZZ6faFN6BQ
         svJWAC7sK2HDx8exaLMe7Uheqx9kZfC1TSaWPkVbSP1BhwJZUhf+oln15eL9YM+4jGSP
         EARQ==
X-Gm-Message-State: APjAAAX2C0nO3wi98qADaL2bRS8YkH0pZPLRtXdCJ64IUDl2ap2Dgntf
        ukqEtXQqDv0yIJpIB1GBimBiQd0yEb7pXg==
X-Google-Smtp-Source: APXvYqx432gjFnXZKeEVX6PE1pt4uYSzdjJ9xDnwcnNJxxi74raOf/9SMD8lTM3ejiLUqunU0pwGkA==
X-Received: by 2002:adf:f511:: with SMTP id q17mr1444270wro.3.1571134265626;
        Tue, 15 Oct 2019 03:11:05 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id y186sm42778837wmd.26.2019.10.15.03.11.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 03:11:05 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
        jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 4/7] drm/msm/dsi: Add configuration for 28nm PLL on family B
Date:   Tue, 15 Oct 2019 12:10:55 +0200
Message-Id: <20191015101058.37157-5-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191015101058.37157-1-kholk11@gmail.com>
References: <20191015101058.37157-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

The 28nm PLL has a different iospace on MSM/APQ family B SoCs:
add a new configuration and use it when the DT reports the
"qcom,dsi-phy-28nm-hpm-fam-b" compatible.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 18 ++++++++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index aa22c3ae5230..b0cfa67d2a57 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -483,6 +483,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 #ifdef CONFIG_DRM_MSM_DSI_28NM_PHY
 	{ .compatible = "qcom,dsi-phy-28nm-hpm",
 	  .data = &dsi_phy_28nm_hpm_cfgs },
+	{ .compatible = "qcom,dsi-phy-28nm-hpm-fam-b",
+	  .data = &dsi_phy_28nm_hpm_famb_cfgs },
 	{ .compatible = "qcom,dsi-phy-28nm-lp",
 	  .data = &dsi_phy_28nm_lp_cfgs },
 #endif
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index c4069ce6afe6..24b294ed3059 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -40,6 +40,7 @@ struct msm_dsi_phy_cfg {
 };
 
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index b3f678f6c2aa..3b9300545e16 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -142,6 +142,24 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 	.num_dsi_phy = 2,
 };
 
+const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
+	.type = MSM_DSI_PHY_28NM_HPM,
+	.src_pll_truthtable = { {true, true}, {false, true} },
+	.reg_cfg = {
+		.num = 1,
+		.regs = {
+			{"vddio", 100000, 100},
+		},
+	},
+	.ops = {
+		.enable = dsi_28nm_phy_enable,
+		.disable = dsi_28nm_phy_disable,
+		.init = msm_dsi_phy_init_common,
+	},
+	.io_start = { 0x1a94400, 0x1a94800 },
+	.num_dsi_phy = 2,
+};
+
 const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 	.type = MSM_DSI_PHY_28NM_LP,
 	.src_pll_truthtable = { {true, true}, {true, true} },
-- 
2.21.0

