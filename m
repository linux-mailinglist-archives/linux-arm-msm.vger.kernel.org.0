Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72DF1659F92
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Dec 2022 01:27:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235927AbiLaA1X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 19:27:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235817AbiLaA1W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 19:27:22 -0500
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 712971E3FE
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 16:27:21 -0800 (PST)
Received: by mail-il1-x135.google.com with SMTP id c20so8315956ilj.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 16:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eqU7JgWl4dJVjguwaLq4WB7+jzDfq4wubcJKGAoN4w=;
        b=kgdmWFZUa8sixWzA+A7G1gfSz69e5PpnfVf8GKUDUCs7tLlaN0/Ftk2Q/CBIB1XX5J
         tzB905s27qsKME0pYRYuPtnM5/RPVzR3bLa9EhSbn2/A9O9jE4zboN7VjAG6Tbsc3YJj
         YOfZOE+cTiC2CDth/8pJXLswxfZvTMDQenI7ngYD6wPlKVwI87sgiu+99uyStIlH23Pi
         OdOUWrwHdDHLSeEuG+BK7pR/G5/42XeVMAQaX8NKaLH/yPjXNrrDAG2CUAn6cF11agKm
         Go2NT6+2YDpMIlcVrlAC0otg1gATClObTHrtOWkkEagW/+BHWX2njvJ5EMuil0U6kZKl
         NyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5eqU7JgWl4dJVjguwaLq4WB7+jzDfq4wubcJKGAoN4w=;
        b=e81LOgbXoah5109e7IzRLfFCy4gARluhmb/qmcTPKBAizTv2Gz0AYje5BGcc1I/4sX
         9guZPG6pJHOYgZXxIp/RYNYaiqzrWrVEh34PtTL5gYtbJekPKAVnJxIqPZTqWwqz4/8r
         +qutqfa3zHOlXaSm0Ak91QWyJjtFDgpEH9GC6VT6UBfdDkok8eS3fV+l/UX6u/xxr0eG
         ESTtK3gjTyB2r8viNFp/yIrt6jMe1ECWr42+9ckgY1S7+f3PMXe8hikbI9cRhYB3yxQ2
         Beyp4UTzd/gjiJMfuZ60dOqUxDgdn/i0FFHLueP2WtKJonTdN8fP49P+1OuDi14+BwbR
         nQmg==
X-Gm-Message-State: AFqh2kpUgOSv6I6hcc2O2KLmuVf2GcNNEvMMS1qL4PHhmFgtryp9cHQU
        Kt3WbXMFD3R2YxZFjc3fHOj3LA==
X-Google-Smtp-Source: AMrXdXvX9DZJDImVz3L1Csjbzux4PXcPmnVN98uC4JbGl8dLXSmnhwnzpZcCSB0bvk/Np6PHazEO8A==
X-Received: by 2002:a92:8e13:0:b0:302:f953:4637 with SMTP id c19-20020a928e13000000b00302f9534637mr22058513ild.26.1672446440817;
        Fri, 30 Dec 2022 16:27:20 -0800 (PST)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id t4-20020a922c04000000b002f9f7d24d78sm6969279ile.76.2022.12.30.16.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 16:27:20 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, agross@kernel.org
Cc:     caleb.connolly@linaro.org, mka@chromium.org, evgreen@chromium.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: qcom: use qcom,gsi-loader for IPA
Date:   Fri, 30 Dec 2022 18:27:15 -0600
Message-Id: <20221231002716.2367375-2-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221231002716.2367375-1-elder@linaro.org>
References: <20221231002716.2367375-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Depending on the platform, either the modem or the AP must load GSI
firmware for IPA before it can be used.  To date, this has been
indicated by the presence or absence of a "modem-init" property.

That mechanism has been deprecated.  Instead, we indicate how GSI
firmware should be loaded by the value of the "qcom,gsi-loader"
property.

Update all ARM platforms that use IPA to use the "qcom,gsi-loader"
property to specify how the GSI firmware is loaded.

Update the affected nodes so the status property is last.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55-t55.dts             | 4 ++--
 arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-sdx55-t55.dts b/arch/arm/boot/dts/qcom-sdx55-t55.dts
index 7ed8feb99afbe..61ac5f54cd57d 100644
--- a/arch/arm/boot/dts/qcom-sdx55-t55.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-t55.dts
@@ -237,9 +237,9 @@ &blsp1_uart3 {
 };
 
 &ipa {
-	status = "okay";
-
+	qcom,gsi-loader = "self";
 	memory-region = <&ipa_fw_mem>;
+	status = "okay";
 };
 
 &qpic_bam {
diff --git a/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts b/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
index ac8b4626ae9ac..c9c1f7da1261b 100644
--- a/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
@@ -237,9 +237,9 @@ &blsp1_uart3 {
 };
 
 &ipa {
-	status = "okay";
-
+	qcom,gsi-loader = "self";
 	memory-region = <&ipa_fw_mem>;
+	status = "okay";
 };
 
 &pcie0_phy {
-- 
2.34.1

