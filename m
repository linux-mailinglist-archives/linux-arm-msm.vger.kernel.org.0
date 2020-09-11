Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5A8266357
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 18:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgIKQNz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 12:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbgIKPfr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 11:35:47 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A54AAC06179A
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 08:35:35 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id p4so10286884qkf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 08:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Eg1t9In0g5b7CTs/tQIaFcuTzs3vfJs/vuWLC07Pzgc=;
        b=op4An1PnPRWomDDvrh+nKoYRRdPk4XUQj8HNFNnW+U8+QekwP9q6xgikrq/BQ//LEo
         xSp2bB6ZSxHQjVzhlPB9qQv/Tl4TNas9t8N0d69UAmYJF/nXeP4NXAJFzpasbEHlvP3U
         K1jH2pSP3EYY8Xe8IHCXrtIFjDpNPm8CwWXZnKTLqQATrLkFF96/ZFG3BdOe0iL6YoJB
         XI6kgslrLRJUBTbAKvHu7bXN3MpL40BXlD8fDhv8hIycGToaIbDJjUvtNwHPSxbkOe8+
         dglYYwtMUaWR7X/ceGAzjEJCv730b5do490qSqzomuAeBWjPFnLOAD/7WYJHPmWhAe1J
         PEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Eg1t9In0g5b7CTs/tQIaFcuTzs3vfJs/vuWLC07Pzgc=;
        b=m30HV0+3Z1XbRSYVCbd8tKmL++wn6v4b8QP9QWi0X2Axg08A8AVsszntK6z2imoTyU
         W6swZjv7KzZH0jEvHl5JET3uyLxC7JJgLfhNIB0CovrVuwX7LGmIBkZbvx0SyyMDWVu9
         KzreMXpkATmOJKfS6UV6YNNYl4za72WUBT9uFTVsOVELrlytdQ+QHVIOfBvxLxmDTDP/
         L0kBfDedOJYzgqq2imudhK7hIg+F+xSdH85q7zFivgQq05AuNqYn7zEX3xNTKi2+sikN
         88CaC5zVDcKAN3G7n8cct7AMSeji+BxWO3JykAQiMNSLZMHDb95gY11807AF5Qxyb2Wc
         Y7+w==
X-Gm-Message-State: AOAM5327H7ArqnMejLXeo8GHzMgpwk6YjWpI0TzPK3m8J8ID53hGOH7e
        Gnrjbb3dJ0fThXVyV5860aebxGicuuB8Nl631QI=
X-Google-Smtp-Source: ABdhPJyRhekVuX88QAgVrUgs4m14RZILH7ZS5TVfcQSTsYzmRTExFXuX3W4AVFA27DUrko7aR730FA==
X-Received: by 2002:a37:654b:: with SMTP id z72mr1926935qkb.365.1599838534552;
        Fri, 11 Sep 2020 08:35:34 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id v16sm3001744qkg.37.2020.09.11.08.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 08:35:34 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 2/7] arm64: dts: qcom: sdm845-dispcc: same name for dp_phy clocks as sc7180
Date:   Fri, 11 Sep 2020 11:34:02 -0400
Message-Id: <20200911153412.21672-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200911153412.21672-1-jonathan@marek.ca>
References: <20200911153412.21672-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This makes it easier to combine dt bindings for sdm845/sc7180 dispcc.

Note: nothing upstream provides these clocks and the sdm845 dispcc driver
hasn't switched to using .fw_name for these clocks (these properties are
ignored), so changing this shouldn't be a problem.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 2884577dcb77..8184d6204b33 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4139,8 +4139,8 @@ dispcc: clock-controller@af00000 {
 				      "dsi0_phy_pll_out_dsiclk",
 				      "dsi1_phy_pll_out_byteclk",
 				      "dsi1_phy_pll_out_dsiclk",
-				      "dp_link_clk_divsel_ten",
-				      "dp_vco_divided_clk_src_mux";
+				      "dp_phy_pll_link_clk",
+				      "dp_phy_pll_vco_div_clk";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-- 
2.26.1

