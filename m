Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFEE54DBBB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Mar 2022 01:28:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350649AbiCQA3p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Mar 2022 20:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350024AbiCQA3o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Mar 2022 20:29:44 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC921C93B
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 17:28:29 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id o23so1402991pgk.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 17:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yptMZxQwuM4/nhQWGl69YHBFnVEqE4ofulpvMd74sog=;
        b=n8bUTPs0RcSaAXixFEKySl0u8k+TRB+NvyapzsRrzaLnAU3EpAeyqBIThUubmBneYr
         rJOvM8vEQ4fzjItlgh68hu9hgO6hAH0CPiQUaCJUQhO92yVJnrp91HRxEQZWLcIiAhR3
         Dw/4XYaB9ESoScez4XVQyYDN319UV89inqmIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yptMZxQwuM4/nhQWGl69YHBFnVEqE4ofulpvMd74sog=;
        b=A1x6M3Lm3j30Mrx5vdFeS1X2e3+Z4AbfvDxd4AhwGOQdv5R45QC5kbqu/Y/m4822LM
         2N05XDuA1a6EkD0IJpx7FPxYo3F1fuTPRvN9tvhjaTzJv8XDtxXiPco9FYxLuC9aB/yQ
         8O0HM8/73TcjaWx0QBI8bX9uEqhtQ5rBAnhpetyAWwG2Ci9L4pztQS0Gp8n5SpoHTqEy
         zwSnca3rtA9kUNDmx43WJMRb1dxJg5y/FIm9XIRZECFQmlQWz3kSft5w1rkUD/Lakot3
         I/XuhyHeJUhtJQFSalWmGxlzQU9XoKYaAMh30liV2HkVDuYXEmpGSyMig0iuhbMPfYRo
         P6LQ==
X-Gm-Message-State: AOAM533EYCGnb028ACNuXNBu9avC4EJvvsboFAtJru5W7Sam4V8iUX8Y
        nRYjacLnMEkiFkcpOp3I0wVevw==
X-Google-Smtp-Source: ABdhPJyXM3wxFN8ZQ6yIHuMAlSmM9tuRMnCBtroC4H1pY4Ip+opibit3dUNn8jhdqPhSV1vu08GCRw==
X-Received: by 2002:a63:b06:0:b0:374:5e1a:150a with SMTP id 6-20020a630b06000000b003745e1a150amr1575763pgl.137.1647476908603;
        Wed, 16 Mar 2022 17:28:28 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:3314:2f99:65d0:5a73])
        by smtp.gmail.com with UTF8SMTPSA id 22-20020a17090a019600b001c6457e1760sm3701981pjc.21.2022.03.16.17.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Mar 2022 17:28:28 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v1 2/4] arm64: dts: qcom: sc7280: Add 'piglin' to the crd-r3 compatible strings
Date:   Wed, 16 Mar 2022 17:28:18 -0700
Message-Id: <20220316172814.v1.2.Ib0fbb7e5218201c81a2d064ff13c9bc1b0863212@changeid>
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
In-Reply-To: <20220316172814.v1.1.I2deda8f2cd6adfbb525a97d8fee008a8477b7b0e@changeid>
References: <20220316172814.v1.1.I2deda8f2cd6adfbb525a97d8fee008a8477b7b0e@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With newer bootloader versions the crd-r3 (aka CRD 1.0 and 2.0) is
identified as a 'piglin' board (like the IDP2 board), instead of 'hoglin'
Add the compatible strings 'google,piglin-rev{3,4}'. The hoglin entries
are kept to make sure the board keeps booting with older bootloader
versions.

The compatible string 'google,piglin' (without revision information) is
still used by the IDP2 board, which is not expected to evolve further.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts b/arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts
index 7a028b9248c3..344338ad8a01 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts
@@ -12,7 +12,10 @@
 
 / {
 	model = "Qualcomm Technologies, Inc. sc7280 CRD platform (rev3 - 4)";
-	compatible = "qcom,sc7280-crd", "google,hoglin-rev3", "google,hoglin-rev4", "qcom,sc7280";
+	compatible = "qcom,sc7280-crd",
+		     "google,hoglin-rev3", "google,hoglin-rev4",
+		     "google,piglin-rev3", "google,piglin-rev4",
+		     "qcom,sc7280";
 
 	aliases {
 		serial0 = &uart5;
-- 
2.35.1.723.g4982287a31-goog

