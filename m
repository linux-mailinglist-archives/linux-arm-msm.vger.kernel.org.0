Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4F39527DA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 May 2022 08:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240296AbiEPGca (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 May 2022 02:32:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234207AbiEPGc2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 May 2022 02:32:28 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2374729806
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 May 2022 23:32:25 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id n8so13543822plh.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 May 2022 23:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QXhchf3VZKM2/quDawnPGLqCcD7r9Df6+XHBYX2DLsI=;
        b=er+husaPM6oUMR/bWv0fOcpxSi2F07vVoxYoQRvWEU20qdK+AHjaR824zZ4BBvjdz2
         9juGiROZhRQy45WF2Py9fdiQnSdtVUta1MELqb0a6ZzRpEyttkF4Dzj1C9EgrSH0sD4j
         Qarm+ZmBChiwCacKzgsCYqDpRrlbyNPBwQBgdp0qcSmDZ/qMs6CMQiTIhs9zME5YV2cz
         zdWgJzYVlei+u7i15OjihA4/RvkrR3RMu6BGx0ecJ8HY1cdvwYC23438yH9lSsTUJKz0
         AD0LuTP8wW6SPGQfZXJDP+bMEgFobLChWxDHqw1GiHIYKKLqNF5mrNIMNf+DFVIDkPhu
         rsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QXhchf3VZKM2/quDawnPGLqCcD7r9Df6+XHBYX2DLsI=;
        b=ctf4ZO4iKG7u/E/h4jht06pBijV8A19K1zc1fgWx24dfAhsUdo4El8/NvQjZt9cbvi
         6NEXSLG2y08Zr2Oe8btkFAMZaERjiMSkfN1glWXO7EiU4IkfJ0CamlEUQbXaveryMk0q
         UvU+mUIjSrjygBI8y055B/F/ObD2r2eZwozduLnBDH/RSRt7H6KHPp6NEapzR3LDGBXQ
         ig92qW29rPsfJgpQ6go3psreR5/IDsW8C7JeVFiHjjK0d6akcszoIEja+VxyzjrHadcX
         k1izXKl3R22ssMooiXXS/ssGRhYQ077pCTj0BF0DT2nUUcJbEdOJk1MDBYQS4d/EDu9h
         jwgQ==
X-Gm-Message-State: AOAM533tVi4HQlbUigBx4RNa0lkT1PzczvbaStR250toEaF2HtwtqHEu
        uiODbcRfhE46myQZ6rIeIZc0S+1SNiK0ZA==
X-Google-Smtp-Source: ABdhPJw4tg2JjTIDpk5FTyBYQIZzrMbZuhGEPyGCIJmecDah5IQiCWbIKNXw1HQrXySzm9W2UOo0lg==
X-Received: by 2002:a17:903:1205:b0:15e:8cbc:fd2b with SMTP id l5-20020a170903120500b0015e8cbcfd2bmr16225656plh.99.1652682744269;
        Sun, 15 May 2022 23:32:24 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:931c:dd30:fa99:963:d0be])
        by smtp.gmail.com with ESMTPSA id t9-20020a1709027fc900b0015e8d4eb1e2sm6053647plb.44.2022.05.15.23.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 23:32:24 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        robh@kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org,
        konrad.dybcio@somainline.org
Subject: [PATCH v4 4/4] arm64: dts: qcom: Remove unused 'vdda-max-microamp' & 'vdda-pll-max-microamp' properties
Date:   Mon, 16 May 2022 12:01:55 +0530
Message-Id: <20220516063155.1332683-5-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516063155.1332683-1-bhupesh.sharma@linaro.org>
References: <20220516063155.1332683-1-bhupesh.sharma@linaro.org>
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

As Bjorn noted in [1], since the qmp phy driver doesn't
use the 'vdda-max-microamp' & 'vdda-pll-max-microamp' properties
currently, let's remove them from the dts files as well.

Otherwise, it leads to the following '$ make dtbs_check'
warning(s):

sm8350-microsoft-surface-duo2.dt.yaml: phy@1d87000:
  'vdda-max-microamp', 'vdda-pll-max-microamp' do not match any of
   the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+

If later on the driver support is added, we can add these properties
back to the dts files.

[1]. https://lore.kernel.org/linux-arm-msm/YmQhpsmiYJzR99LK@ripper/

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts | 2 --
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts                    | 2 --
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts                    | 2 --
 3 files changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts b/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts
index 9a6faa9393dc..9c4cfd995ff2 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts
@@ -336,9 +336,7 @@ &ufs_mem_phy {
 	status = "okay";
 
 	vdda-phy-supply = <&vreg_l5b_0p88>;
-	vdda-max-microamp = <91600>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
-	vdda-pll-max-microamp = <19000>;
 };
 
 &usb_1 {
diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 4e51a9d6af98..38ccd44620d0 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -418,8 +418,6 @@ &ufs_mem_phy {
 
 	vdda-phy-supply = <&vreg_l5b_0p88>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
-	vdda-max-microamp = <173000>;
-	vdda-pll-max-microamp = <24900>;
 };
 
 &usb_1 {
diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
index 236e53974fdd..e58fc7399799 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
@@ -424,8 +424,6 @@ &ufs_mem_phy {
 
 	vdda-phy-supply = <&vreg_l5b_0p88>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
-	vdda-max-microamp = <173000>;
-	vdda-pll-max-microamp = <24900>;
 };
 
 &usb_1 {
-- 
2.35.3

