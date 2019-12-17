Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F114122492
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 07:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727816AbfLQGUn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 01:20:43 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42964 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726609AbfLQGUn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 01:20:43 -0500
Received: by mail-pf1-f193.google.com with SMTP id 4so6950722pfz.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2019 22:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k/4+dE6TBvtAZbiMIIRV67E0nc4u23eKs5qpkR7aBsc=;
        b=Zf8bJkaoXvahdNySVN74ycCQmLoxy4e5zh/QEjLuVcb/JCf6/qKAIx/QIxOu2AylUF
         NMV/DOrOPmOeOmY0f/G/FTwuHzSTsno4nQwSkTeTsttDr6a+VEguvb69NOqt354udB5u
         3NVNEK2lBA0XKrW2irpwFs6w6ounikv/qY/RU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k/4+dE6TBvtAZbiMIIRV67E0nc4u23eKs5qpkR7aBsc=;
        b=Ez4YklnZ+C5VNK+3rGcEpp55njc3i2ucB7rjOnCS0m+nFP7CLXn5mwpNLbY3tC5ldW
         ZkECyjN2mL3I3Z+R8WcboD/0//x13LcmKtviO2YeBydaXLXCfKXatEx29er6AGxrQrgY
         EafMaQ3RynkBD+knLOiiycBk/Uwv/HK1XsdowmuqhLOCUFeYz+hXeHZgUXXJCVn+iVkN
         4I3bNikW6y8tqt0rpxA7xk3CYxS/TtGtpHCH6lZiox3NVR/Je5SxtanRoAD6lLxdWwlQ
         xjvSy83+tS9D6CeUdCyr9l4l8m/eS4grN2zJ3+ZtLNIVGh0gg1kBGOGAmTtZ/Zf0YoNp
         UOKg==
X-Gm-Message-State: APjAAAWVXawPhVkv0KNyD4mhcKdjTUcTE1gh/yITv9tL5u7gKeuuo2T8
        xjgaA142WGJymfkl4J78wIOEyQ==
X-Google-Smtp-Source: APXvYqyEClKB5KveoH1dz7RJn9lqOw2w9s8Xx0dDnRonMN4XFIC7VrXPxnzpn33/nSEKlc6SZb1QQQ==
X-Received: by 2002:a63:360a:: with SMTP id d10mr22663260pga.366.1576563642808;
        Mon, 16 Dec 2019 22:20:42 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id 100sm1682030pjo.17.2019.12.16.22.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 22:20:42 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, swboyd@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH] arm64: dts: qcom: sdm845: Rename gic-its node to msi-controller
Date:   Mon, 16 Dec 2019 22:20:25 -0800
Message-Id: <20191216222021.1.I684f124a05a1c3f0b113c8d06d5f9da5d69b801e@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is just like commit ac00546a6780 ("arm64: dts: qcom: sc7180:
Rename gic-its node to msi-controller") but for sdm845.  This fixes
all arm64/qcom device trees that I could find.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 407d26e92fcc..5d3b470f1be5 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3203,7 +3203,7 @@ intc: interrupt-controller@17a00000 {
 			      <0 0x17a60000 0 0x100000>;    /* GICR * 8 */
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 
-			gic-its@17a40000 {
+			msi-controller@17a40000 {
 				compatible = "arm,gic-v3-its";
 				msi-controller;
 				#msi-cells = <1>;
-- 
2.24.1.735.g03f4e72817-goog

