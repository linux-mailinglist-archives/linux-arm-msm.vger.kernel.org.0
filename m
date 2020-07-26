Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B83B922DE3B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jul 2020 13:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728038AbgGZLNg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Jul 2020 07:13:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbgGZLNg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Jul 2020 07:13:36 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1207C0619D2;
        Sun, 26 Jul 2020 04:13:35 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id z17so10057576edr.9;
        Sun, 26 Jul 2020 04:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cs+gLIqTnPWhYBODTViZE90E8/vlMy99+hp1beAtSdc=;
        b=TfjEq8a0HN5EKRYxTu1RrtRq3PV8DWEu0s4HFYSYMFjNqF/Q/sPzeWIw6VYdwxenCy
         VSDLsjexOMBD5C4SpTiHsWj9P8IDMPWP4CZSUqFaQMuVvI8ob9Ai4ldYp3XMOJVu0Zpl
         Ae3ElERiJl2bp5NcSvoKdHLAJJmgnlomdfrMTuT45onAQEoniH5kki9IWBEIRa95myuE
         +FeVc49sACD9W+uf4ze8mpOblD0DUv4Y34PDMMWSeNHa8FRdgsVFQepYK0Q6UDpqclVZ
         sC5DcRdSiMcKGgXv+enX2h47KonLbIkBhW3nZe18zAt4LXJIfoBRxZEOXMSOOGMN8GbP
         9fTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cs+gLIqTnPWhYBODTViZE90E8/vlMy99+hp1beAtSdc=;
        b=Y+QsRh8rUw9rZnEg4g3CQ22YW9nZ0MoRGTWYFRsZf8QO3OZtRCRcuxVsk2116+C24h
         yi22SvxTXYGzrBBOV8fXx4YdV0/KgL44vey3fRiabrs9tEOQDJEHpyfp/M/gXEh+cFZS
         2QPvVV7tE/Czpj1+vfFMjI1u6OP631GHRvtkXve8U20IsQLIsdNYONN4ROo6T5Wtuq/T
         JEqEkkBiSKLU4zAPM+MGc3PQGRSUJil5kNzUfIHYByq6n41cIJD8BvLD4dq2qBe9BKTj
         oNY8DtRKqK57Pp5pDYLt+lne1xPngh7eF5OpNRHOYhcGktFEpLi0fYpJOtxgGE/kJetB
         B+Ag==
X-Gm-Message-State: AOAM533DFftSCFF5xO+xgCvNQzM5+BdxxDD3KREmiXafi0mNQs4GGzhi
        p954B1nI555WDMgh4eZg9NE=
X-Google-Smtp-Source: ABdhPJweKLGsol8NQGsiYc75+IT7bG6HGpzYRGIJFqb3lQ91mVNQIxF51Gc1uUa+b+igMmW85X4QwQ==
X-Received: by 2002:aa7:c90a:: with SMTP id b10mr17062270edt.71.1595762014668;
        Sun, 26 Jul 2020 04:13:34 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl. [83.6.167.207])
        by smtp.googlemail.com with ESMTPSA id d23sm4696253ejj.74.2020.07.26.04.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 04:13:34 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     martin.botka1@gmail.com, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        zhengbin <zhengbin13@huawei.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Krzysztof Wilczynski <kw@linux.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Xiaozhe Shi <xiaozhes@codeaurora.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 2/9] phy: qcom-qusb2: Add support for SDM630/660
Date:   Sun, 26 Jul 2020 13:11:59 +0200
Message-Id: <20200726111215.22361-3-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200726111215.22361-1-konradybcio@gmail.com>
References: <20200726111215.22361-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QUSB on these SoCs actually uses *almost* the same
configuration that msm8996 does, so we can reuse
the phy_cfg from there with just a single change
(se clock scheme).

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
 drivers/phy/qualcomm/phy-qcom-qusb2.c                     | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index b5a6195de7ff..e61a3ca3deba 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -20,6 +20,7 @@ properties:
         - enum:
           - qcom,msm8996-qusb2-phy
           - qcom,msm8998-qusb2-phy
+          - qcom,sdm660-qusb2-phy
       - items:
         - enum:
           - qcom,sc7180-qusb2-phy
diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 393011a05b48..11852ebe9e49 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -702,7 +702,8 @@ static int qusb2_phy_init(struct phy *phy)
 	usleep_range(150, 160);
 
 	/* Default is single-ended clock on msm8996 */
-	qphy->has_se_clk_scheme = true;
+	if (!of_device_is_compatible(phy->dev.of_node, "qcom,sdm660-qusb2-phy"))
+		qphy->has_se_clk_scheme = true;
 	/*
 	 * read TCSR_PHY_CLK_SCHEME register to check if single-ended
 	 * clock scheme is selected. If yes, then disable differential
@@ -815,6 +816,10 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
 	}, {
 		.compatible	= "qcom,msm8998-qusb2-phy",
 		.data		= &msm8998_phy_cfg,
+	}, {
+		.compatible	= "qcom,sdm660-qusb2-phy",
+		/* sdm630/660 use the same config as msm8996. */
+		.data		= &msm8996_phy_cfg,
 	}, {
 		/*
 		 * Deprecated. Only here to support legacy device
-- 
2.27.0

