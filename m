Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3AE5744E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 08:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234446AbiGNGMU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 02:12:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233559AbiGNGMO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 02:12:14 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 524BE255B0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 23:12:13 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id o5-20020a17090a3d4500b001ef76490983so1757379pjf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 23:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jhKCnn2vUZabyEjVQ34XnYYStwx7FF/g1HUD8RjY5qg=;
        b=L317bCTzKTqaXlJ4EfmgBVMoewNTGGEOrPaCffD0ZZXIwdyuepe5EKRQ6kMfrKVy12
         ACo5fbj1mCL+ZnwKzvskmbcuPUhseZnhRmxLziWdVnspTEMZU8Uew+h6isuw4k+6o9DJ
         vXFbcJ7Mfw1gp439kEFYWq0j6cZA4jN46XgNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jhKCnn2vUZabyEjVQ34XnYYStwx7FF/g1HUD8RjY5qg=;
        b=wn3Hq4/V1wepo/Gu+eMYy5R2vfv/i0f/U3WQd4oxhr+Mmw+JXolhKUjstiQ8QoL5jR
         ldDN/TVsbpwpMdwPLnHpZwAijnmZacYd7fzOpgjDsDu0L7WNnVgyFPDY2gVQrj4oZAZa
         5qUlrUcClDRjhqZftYHWFO/9QnX6SLHaXJX3hwS6SWsEE7B9Eek8ojiPyf++EvE+wg64
         4Bp7xZe33kVp5wrtKWdNWDeKLnltysCuqMzbLjKUUP5Cr74FsFOdSHHJRnE0+tGI72aN
         FV5O3nUzi/QQNrTU1ImgvXjUou2drqnNFzxQbLbLFu6ShEizi1PYUBwha5grKHkvlzn5
         VRig==
X-Gm-Message-State: AJIora/SPbGqVvugMDzC6sTRjh74JVDcw9KvnV+rtQ1lp8OLkvOdGvE0
        hkva3Tz55W+LVdepFGMZeaOSIMSOQaDkdw==
X-Google-Smtp-Source: AGRyM1tIepRwep6gJA7RqD5bmmkiAwYliMFcEY85zwW1xxcbOSk/eXbsg4HYmU3w3lY7EbYHlLAaSA==
X-Received: by 2002:a17:903:18c:b0:16c:51c6:675d with SMTP id z12-20020a170903018c00b0016c51c6675dmr6781526plg.153.1657779132852;
        Wed, 13 Jul 2022 23:12:12 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
        by smtp.gmail.com with ESMTPSA id j10-20020a170902690a00b0016a17da4ad4sm509683plk.39.2022.07.13.23.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 23:12:12 -0700 (PDT)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, mka@chromium.org, cychiang@google.com,
        judyhsiao@google.com, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Judy Hsiao <judyhsiao@chromium.org>
Subject: [PATCH v1 1/3] arm64: dts: qcom: sc7280: herobrine: Add pinconf settings for mi2s1
Date:   Thu, 14 Jul 2022 06:11:49 +0000
Message-Id: <20220714061151.2126288-2-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
In-Reply-To: <20220714061151.2126288-1-judyhsiao@chromium.org>
References: <20220714061151.2126288-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

1. Add drive strength property for mi2s1 on sc7280 based platforms.
2. Disable the pull-up for mi2s1 lines.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>

---
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 0a220e7421d9..74c451bf0d00 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -632,6 +632,21 @@ &dp_hot_plug_det {
 	bias-disable;
 };
 
+&mi2s1_data0 {
+	drive-strength = <6>;
+	bias-disable;
+};
+
+&mi2s1_sclk {
+	drive-strength = <6>;
+	bias-disable;
+};
+
+&mi2s1_ws {
+	drive-strength = <6>;
+	bias-disable;
+};
+
 &pcie1_clkreq_n {
 	bias-pull-up;
 	drive-strength = <2>;
-- 
2.37.0.144.g8ac04bfd2-goog

