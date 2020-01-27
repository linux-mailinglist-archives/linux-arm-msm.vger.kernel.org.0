Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D48D14A802
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2020 17:25:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgA0QZm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jan 2020 11:25:42 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37421 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbgA0QZl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jan 2020 11:25:41 -0500
Received: by mail-pg1-f195.google.com with SMTP id q127so5406199pga.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2020 08:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AETTwMBW1K6QIrQVON3rToRwyIKW9SZw4dAWXXfxxIQ=;
        b=SSPGMkhcg/9PUEynqidYuSP3yImPLsIF0VEkjnYfGxegxHZYeafBU/aC87Hn79uJC9
         EBVXL8aVbo+SfESMN5nfxwDx102EQIGK/SYxSIzGYcn3sBiIo8fGtdst1wuCOuOR0RXI
         jKkgzLl91xKXawlXJkk/ZclgLnsYths3wEGQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AETTwMBW1K6QIrQVON3rToRwyIKW9SZw4dAWXXfxxIQ=;
        b=o7svPIE0MpSa27XBA0lWHbBrpCCw2lekalFokEcqbrfV0RBPJbzSwXhRXJArlYI1Ro
         RZojo4dlMxSnHCvJtfKL0UVmA4PXGTqb9TpoIHTtsLk1QfqLhspiKsWiMiHccnlKYCyu
         drGIQcjAH+2D3gcI4eHGIlyYPb+5MvyJl9xx/2jnmcgFweu0fVJQ6SBCJ2JndzQWs0ux
         YEhYyaqFu8P94VUtkntXNKwXbe86vjgm+tFt/jvA6Xz/ZnlaHJt5F7WPXRz7+2Y3n6o2
         pu+sya8abdkj3Bji1ueGRMnSiCsd/RFUZLYgDvR5zkkLzD4FUjL+nLMgJxbI0vATORCo
         QKHQ==
X-Gm-Message-State: APjAAAVNsA+7+BcfESugxG3rVxL/txB7kWcN7dS+mynEQcglhGVlezMf
        VwMxKzLX2t5lsdCNa03+6zysfw==
X-Google-Smtp-Source: APXvYqxlebiuUFEHjfubvnlKDauUXcLhX/iKJ6unhIbyMgvVa8vTxmVSqa4anG4aFFAUBvpxV2N5AQ==
X-Received: by 2002:a63:3196:: with SMTP id x144mr19921682pgx.319.1580142341192;
        Mon, 27 Jan 2020 08:25:41 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id r14sm16133264pfh.10.2020.01.27.08.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 08:25:40 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <andy.gross@linaro.org>
Cc:     mka@chromium.org, vbadigan@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH] arm64: dts: qcom: qcs404: Fix sdhci compat string
Date:   Mon, 27 Jan 2020 08:23:48 -0800
Message-Id: <20200127082331.1.I402470e4a162d69fde47ee2ea708b15bde9751f9@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As per the bindings, the SDHCI controller should have a SoC-specific
compatible string in addition to the generic version-based one.  Add
it.

Fixes: 7241ab944da3 ("arm64: dts: qcom: qcs404: Add sdcc1 node")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/qcs404.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 4ee1e3d5f123..1eea06435779 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -685,7 +685,7 @@ pcie_phy: phy@7786000 {
 		};
 
 		sdcc1: sdcc@7804000 {
-			compatible = "qcom,sdhci-msm-v5";
+			compatible = "qcom,qcs404-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0x07804000 0x1000>, <0x7805000 0x1000>;
 			reg-names = "hc_mem", "cmdq_mem";
 
-- 
2.25.0.341.g760bfbb309-goog

