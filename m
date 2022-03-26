Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CE724E7F3B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Mar 2022 06:58:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231340AbiCZF7t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Mar 2022 01:59:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231350AbiCZF7r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Mar 2022 01:59:47 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0901122B06
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 22:58:11 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id t4so5036137pgc.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 22:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vsQ1ZJDbzm8xjG34TYgWolguHSp0d0tTX8/9HERcrNs=;
        b=kgzEx5U+usqwGcjy+zG6MpsKazUBCOMJOf2PLiHhrDWVNJM+iNJC8CcWFSzYizXcsi
         QUZoBL3re5R5zeI/lxOMb26SMNBs+nV+SDBGoYSzY6sA/LBeewodQuwfC2PM7O0FsA70
         V5pStK942xQ/MvlV0rE92NiCEzgdH/P82kGKqSiXK/Rvfrg+7Wfjg9m7bQ39UChtsGwa
         LEw0z+BoBPOBfzEuyIB2fC3CxHZLEx8u5W3sr3lTn3o2RLOO/4gnM5nU9C87BWZ3yRaX
         gchVUyHz1J3++5amMcHeRgMUPMIffhdkl1QiNWs2U7UTYMNKCr9sdKHHnnsv27d+jLjY
         46Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vsQ1ZJDbzm8xjG34TYgWolguHSp0d0tTX8/9HERcrNs=;
        b=GZr6xvPLc3uZJF3hi6qXkwmMhK1FZ84I4eoQuYav5Vj2zoHBflIVyGQJwRAE5mWqBo
         5Fpo1ScEBlfMzwOTTMgjXPYs+jJeMlUknDbhghH9wYH7U6/8HevLjCM60E6WUdbJA5OP
         8JmmleclJWqGKfsai7XZSJAVqjfv2C2WptgHr+x+fM5yjyzzhQL4T3xZRq7JxEDC+WRW
         2XnrDcLRWDRpy4EI0h2p8o1BXFpKc7DGOAgI8+fADRdqE01pKFO/cUYu4oz5vGT40h0C
         y6Tz4WsjhG6yuz3DCssm1JFdVzqp1NCGs9D7f0m9k1A+LKeah7ohD9uc6TnztCUuoBUq
         XqTA==
X-Gm-Message-State: AOAM532itMO0xMT1gUUTABMKTW6C0FRgYoEISVkZT15db9GidFe8Zs3C
        6z399pae82EpcQPt4XEzfOumDJKN3qvQ3A==
X-Google-Smtp-Source: ABdhPJxq7vt7oi+D/i4f+hhO8Q9TjjM+NhAy6KY+3G6J6E9XjTOtp/mFZY9Tb46J0USK4Aj4I59jJA==
X-Received: by 2002:a63:481d:0:b0:380:ea8d:4301 with SMTP id v29-20020a63481d000000b00380ea8d4301mr2312697pga.285.1648274290336;
        Fri, 25 Mar 2022 22:58:10 -0700 (PDT)
Received: from localhost.localdomain ([223.233.78.42])
        by smtp.gmail.com with ESMTPSA id b2-20020a056a000a8200b004e1414f0bb1sm9505067pfl.135.2022.03.25.22.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 22:58:10 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v4 2/2] arm64: dts: qcom: sa8155: Enable PCIe nodes
Date:   Sat, 26 Mar 2022 11:27:54 +0530
Message-Id: <20220326055754.1796146-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220326055754.1796146-1-bhupesh.sharma@linaro.org>
References: <20220326055754.1796146-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SA8155p ADP board supports the PCIe0 controller in the RC
mode (only). So add the support for the same.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
index 8756c2b25c7e..676e4fe3f848 100644
--- a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
@@ -387,6 +387,21 @@ &usb_2_qmpphy {
 	vdda-pll-supply = <&vdda_usb_ss_dp_core_1>;
 };
 
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_phy {
+	status = "okay";
+	vdda-phy-supply = <&vreg_l18c_0p88>;
+	vdda-pll-supply = <&vreg_l8c_1p2>;
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l18c_0p88>;
+	vdda-pll-supply = <&vreg_l8c_1p2>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <0 4>;
 
-- 
2.35.1

