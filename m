Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8ED757AF9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jul 2022 05:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236253AbiGTDxF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 23:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232316AbiGTDxE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 23:53:04 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B1D96D2D4
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 20:53:03 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id o18so2420356pjs.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 20:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y9DpWvCVDJd6A56HD1n6KoSQsmY3hGAJ1AiVFQE9fVY=;
        b=DhtvpLqeqFwbxgAIOlZXE81TxUYZwlPQBuSg2dwhkrch5LY1xVdruf4BeaREQ4ck6R
         SY7uMediWrlQxpPrS/F5BmswEGLwzNsdcOWUYud1H8s7qe3ofYuMpmsg7pspXUnlvWPn
         wlORUrl5Ktd//orD47Ic9z5T9rYzTf86xwUSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y9DpWvCVDJd6A56HD1n6KoSQsmY3hGAJ1AiVFQE9fVY=;
        b=dOPCToCDzStNyBCrR8/0grSUNhpLCEgkA6ZqlCXaWObgdd5l4j4vybia6UARdgi/1i
         6MSkDuO90z1gcrOmt5qOahDbJacZBr8VKRKyqkyuXB6s0BVHtNH28SKb89vCH81o/2ac
         cXjqGvcsSPBnLT+yZR8P+qNXdnZbyUH3inb0708tBH5nrdOGvDNPcQBGQ9+ZilbSB6P8
         XK0Y4f4maTzIoaP9DQ7NiPJBXSxy6/tZKz3Nqy/a/VB2oOBNuVRYMHvhlAXtf00qmDZ/
         KJ5uxoneoTpUbvUr3RySSIJOTd9vfIuRJY5k28hktmG8hDZMUQcuBt8aVZ1CGVlNFgNN
         g9Zw==
X-Gm-Message-State: AJIora+lpavb/R3IGQ0rZJ2oc830bub2Tsvopm6RBxMqSmMR2sXLoJ5w
        OWAynXOLGTYZnp/HPAtdelcpAw==
X-Google-Smtp-Source: AGRyM1seKYtGcJoMu0mo4YwrBiYolZ8G+Sm5dVXymDL7WJKurHjFH6MmazmKkIKY73m4wjlsnDgG4w==
X-Received: by 2002:a17:902:b28a:b0:16d:1c68:2e2 with SMTP id u10-20020a170902b28a00b0016d1c6802e2mr2595346plr.26.1658289182621;
        Tue, 19 Jul 2022 20:53:02 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
        by smtp.gmail.com with ESMTPSA id t11-20020a170902d14b00b0016648412514sm12378346plt.188.2022.07.19.20.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 20:53:02 -0700 (PDT)
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
Subject: [PATCH v2 0/3] Add dtsi for sc7280 herobrine boards that using
Date:   Wed, 20 Jul 2022 03:52:51 +0000
Message-Id: <20220720035254.1411959-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Put sound node and lpass_cpu node settings for boards that use rt5682
codec in the sc7280-herobrine-audio-rt5682.dtsi as there are different
choices of headset codec for herobrine projects. Common audio setting
for the internal speaker is in sc7280-herobrine.dtsi.

Changes Since V2:
- Fix sc7280-herobrine-audio-rt5682.dtsi syntax.

Changes Since V1:
- Not to include the herobrine-villager-r0.dts changes in this patch
  series to avoid conflict.

Judy Hsiao (3):
  arm64: dts: qcom: sc7280: herobrine: Add pinconf settings for mi2s1
  arm64: dts: qcom: sc7280: Add sc7280-herobrine-audio-rt5682.dtsi
  arm64: dts: qcom: sc7280: include sc7280-herobrine-audio-rt5682.dtsi
    in herobrine-r1

 .../qcom/sc7280-herobrine-audio-rt5682.dtsi   | 122 ++++++++++++++++++
 .../qcom/sc7280-herobrine-herobrine-r1.dts    |   1 +
 .../arm64/boot/dts/qcom/sc7280-herobrine.dtsi |  15 +++
 3 files changed, 138 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi

-- 
2.37.0.170.g444d1eabd0-goog

