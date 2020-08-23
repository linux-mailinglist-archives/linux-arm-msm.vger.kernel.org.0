Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BBDD24EFFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Aug 2020 00:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbgHWWAr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 Aug 2020 18:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbgHWWAr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 Aug 2020 18:00:47 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4353C061574;
        Sun, 23 Aug 2020 15:00:46 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id w25so7433732ljo.12;
        Sun, 23 Aug 2020 15:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SBAESB7guiywS3iRmfY/38fD7WSfpRQpGnQZqXWbF/E=;
        b=mUoUs/YZzrS+B8vzev3/EC0sCnui5HL7nn72tGunptCJAE6kS8AKnUdsnYknHG5JMp
         8eku6cYBPhqcsOEB85RnLWHcpbv9o0uyUB5bcgr/E9i5ovPaZyXc+vXORprMKjj/j5cV
         b8D+nCcjIQlrqB7OB8FiiEGCAliunJGv3TZx+5Du8o8PB2pOeJKSrNG53s5XMIGOTjWX
         SP0czzpQ4OeWNzRL6308in8h6oQYb8KU0tPsdrL7snwWNsBnI89FZ/vvf/zS/wnSgqZt
         YxP6vsJkAZHPqF34YW4Ro93q9k915IZU+LcRioiYoIEAPcKE8+t93dsvAOEmDOKP3Rnz
         ivUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SBAESB7guiywS3iRmfY/38fD7WSfpRQpGnQZqXWbF/E=;
        b=q5TPJS232xqSC6HhLQpIROCwp+TmqB1CCOzYF6U9UFQ6I+dlx5xDG9WNma+jJ2BDlA
         oxEjBlSw/iL+8CRnHUqho+/MeEXvIPBiSpXS2Aisr3kvq5IfY3Y5M4Ru9NsIAeF6MRHp
         ryyme668VSPcsfVSpiUwfAqC/Zc1dHjwPt3Awtg243gAERrl9GB3lPbKQhdE1tYjx4ng
         lQTEeHH3ZichRtu+YmZ87tE94H1GTAdrnwgXq4xyjpTT8bwobOYdUm9nJx2x520RuHB4
         0qnTjn2lgAAGs5LaAfUVWn1YSSBw1PpmlMUtseL85c4FZixZTmNivxe7SNmpqUoF6q8r
         sy2Q==
X-Gm-Message-State: AOAM530pEyquMgCD/HIN0OBS4z0sVxdPy4Wrrp5Q4aUelqVuwwiJdEM0
        f2hglXZEV3m62+oL6nNOJZE=
X-Google-Smtp-Source: ABdhPJyAXmjDEQVqyO5wb+cn0sHUGPcE1n0OGb5nWyE3bXMb/rcnlEUeFwdTq4iEZcmsn893UxpR2w==
X-Received: by 2002:a2e:9643:: with SMTP id z3mr1370413ljh.282.1598220045235;
        Sun, 23 Aug 2020 15:00:45 -0700 (PDT)
Received: from localhost.localdomain (h-82-196-111-59.NA.cust.bahnhof.se. [82.196.111.59])
        by smtp.gmail.com with ESMTPSA id g11sm1825097lfc.46.2020.08.23.15.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 15:00:44 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 8/8] phy: qcom-ipq4019-usb: Constify static phy_ops structs
Date:   Mon, 24 Aug 2020 00:00:25 +0200
Message-Id: <20200823220025.17588-9-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823220025.17588-1-rikard.falkeborn@gmail.com>
References: <20200823220025.17588-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Their only usages is to assign the address to the data field in the
of_device_id struct, which is a const void pointer. Make them const to
allow the compiler to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
index b8ef331e1545..fc7f9df80a7b 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
@@ -48,7 +48,7 @@ static int ipq4019_ss_phy_power_on(struct phy *_phy)
 	return 0;
 }
 
-static struct phy_ops ipq4019_usb_ss_phy_ops = {
+static const struct phy_ops ipq4019_usb_ss_phy_ops = {
 	.power_on	= ipq4019_ss_phy_power_on,
 	.power_off	= ipq4019_ss_phy_power_off,
 };
@@ -80,7 +80,7 @@ static int ipq4019_hs_phy_power_on(struct phy *_phy)
 	return 0;
 }
 
-static struct phy_ops ipq4019_usb_hs_phy_ops = {
+static const struct phy_ops ipq4019_usb_hs_phy_ops = {
 	.power_on	= ipq4019_hs_phy_power_on,
 	.power_off	= ipq4019_hs_phy_power_off,
 };
-- 
2.28.0

