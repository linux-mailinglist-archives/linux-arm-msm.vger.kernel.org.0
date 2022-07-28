Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 474345847BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jul 2022 23:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232867AbiG1Vdf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jul 2022 17:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiG1Vdd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jul 2022 17:33:33 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E9DA74DFD
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 14:33:33 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id w7so2871561ply.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 14:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VGZnlwTei/ZzhPPKyBsKYsctyA0v2J1Oq7FlaRHkiC0=;
        b=MBmpKNB7026bTVxYfXlRK9k4pKS9nLVwHoNfZAsAMcTcg/svGGR02m1rj5rY+/750d
         i0OpHdPRsd09HXyTXq2+SylxrUYxFtO3QyObum4qmKbH2eAaWg/d5SmvyburO3DvfE2g
         6CFXMlfRcC6HQkFpDAKgEMjCYZGwfygaTYXUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VGZnlwTei/ZzhPPKyBsKYsctyA0v2J1Oq7FlaRHkiC0=;
        b=SiOHWnocaXy+k7dunTlqzTdG40fAx947eEzMkK2jgQA8MsxVorCpoGcq0VWF1D4X2y
         lQg7oV3AIOmxwWcJyX9eR8TZHiEocz1MJ9x/DUdkMrCBfEGzL/Dl9hWpXsvHbO8NTj29
         JUy6/6KC04k7P3SrSS9iLsYlZg+tXIPMxQHaZUKySZwqTZmYICBvouQBX2MlYHXbJtLm
         Fn0Tc5zjJb1UXXNC140dIYDjZJdhqRde2t2xcQENisq4k2w7g+98207diq+LcFe4n53H
         0ZpRFwXcm364LfC2pDI14F3a4xltcJVlSCAhO8PECqDJadqxGZ4Y9wMeRETXSSfaHw+m
         XQ/Q==
X-Gm-Message-State: ACgBeo057p7taVo9A47hFU+Mb3PqO5LUZbo59seUkCM/+SQs2UM0NxMX
        JxBsLe4jDhTKj2BBRT3CZ4mQHA==
X-Google-Smtp-Source: AA6agR6bZq/Ocotiih0eHd8FKhNfBUdHpJ5zdhjB9mpln0C4dS7tPtoNELEb+0sIdl4sZKb2cMuD0A==
X-Received: by 2002:a17:902:e80c:b0:16c:28a6:8aa0 with SMTP id u12-20020a170902e80c00b0016c28a68aa0mr829420plg.119.1659044012578;
        Thu, 28 Jul 2022 14:33:32 -0700 (PDT)
Received: from moragues-cloud.c.googlers.com.com (252.157.168.34.bc.googleusercontent.com. [34.168.157.252])
        by smtp.gmail.com with ESMTPSA id z1-20020a170902d54100b0016bf4428586sm1756930plf.208.2022.07.28.14.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 14:33:32 -0700 (PDT)
From:   Bob Moragues <moragues@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     swboyd@chromium.org, mka@chromium.org, dianders@chromium.org,
        Bob Moragues <moragues@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: dts: qcom: sc7280: Add support for zoglin
Date:   Thu, 28 Jul 2022 14:33:21 -0700
Message-Id: <20220728143215.v3.2.I7d57fb9c4806a8b3fe3501c766b64f4987c271ef@changeid>
X-Mailer: git-send-email 2.37.1.455.g008518b4e5-goog
In-Reply-To: <20220728143215.v3.1.I5b9006878bdabd6493b866b46dbd6149968d545b@changeid>
References: <20220728143215.v3.1.I5b9006878bdabd6493b866b46dbd6149968d545b@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Zoglin is a Hoglin Chromebook with SPI Flash reduced from 64MB to 8MB.
Zoglin is identical to Hoglin except for the SPI Flash.
The actual SPI Flash is dynamically probed at and not specified in DTS.

Signed-off-by: Bob Moragues <moragues@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Reset Author
- Fixed duplicate Signed-off-by

 arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
index 6d324ac2dda1..98d09187fc69 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
@@ -13,7 +13,7 @@
 
 / {
 	model = "Qualcomm Technologies, Inc. sc7280 CRD platform (rev5+)";
-	compatible = "google,hoglin", "qcom,sc7280";
+	compatible = "google,zoglin", "google,hoglin", "qcom,sc7280";
 
 	/* FIXED REGULATORS */
 
-- 
2.37.1.455.g008518b4e5-goog

