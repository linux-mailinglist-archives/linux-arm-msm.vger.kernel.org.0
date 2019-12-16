Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90961121F17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 00:43:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbfLPXmG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 18:42:06 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36724 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfLPXmG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 18:42:06 -0500
Received: by mail-pl1-f195.google.com with SMTP id d15so5205316pll.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2019 15:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lDyvDIqdNyLcx4V2i25mbpZbeEe915JVgGFlXA+zH5w=;
        b=Qxjn5BB1mSPYMopx67Uuhuoi0ZWzpj0NjW4kRVI1JYR7xPEVyUJRT5Z9+ZSc6i6pCC
         o1ln1pemHpWjnEqecBhD4oxZHcstblycd6kE7vhOeLvXFEVh1i5JWrxz9oQ5yjscp0e3
         XONLp1TfVHKlCjlzm7dEbPkQNsKdPrlFZKpMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lDyvDIqdNyLcx4V2i25mbpZbeEe915JVgGFlXA+zH5w=;
        b=BSRMAhAsomx+4PmGKdi83maG2hcwlVvWs2gWTsOXWBQrnyRY3sN7DMAy9zOccAnjDK
         Yuew8dvDAHHrF8D+Rl5eKD5FLUv8Lwo0A/Mp14pL7O5iIPvbaXw4HEDAO0oaYQ/gMYCL
         sGLR6kLaH3WVP7lCfLWCZmkq9y7HSfxf/TLN2agx809lnlWTsrU4sR+w3Ob8h0TvZPej
         NZc1Oe072bH2BvSbHrPReAKygN0oeVmXfDKnEap4f5TPAQ8X4+bXWFf2jIaOi8K1DvYY
         tKYUH2HiMfNZ3LTQ+yZhXQMY6QReVQgywcAp3+3Izrg3U2UjAkZzoL8SjhHM4r0FPEVA
         eRdA==
X-Gm-Message-State: APjAAAUecPsQbP41jxS79z96Q8ZQSs8GRB0UMWLRLi9e78bt1saVRLWf
        TCKoTLBu+aPVUYozVcLNo6WszQ==
X-Google-Smtp-Source: APXvYqw4HPLBvMTotNyMS2JzWt5rQ1xusHqkl5mTKG6mEBNNKIFYcvOkQLR+jEb6RZr3hDfNq4X76g==
X-Received: by 2002:a17:902:322:: with SMTP id 31mr18686496pld.293.1576539725616;
        Mon, 16 Dec 2019 15:42:05 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id cu22sm632053pjb.13.2019.12.16.15.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 15:42:04 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2] arm64: dts: qcom: sdm845-cheza: Add cr50 spi node
Date:   Mon, 16 Dec 2019 15:42:04 -0800
Message-Id: <20191216234204.190769-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the cr50 device to the spi controller it is attached to. This
enables /dev/tpm0 and some login things on Cheza.

Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Changes from v1:

 - Fixed node name to be tpm

 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 9a4ff57fc877..b59cfd73616f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -651,6 +651,20 @@ &spi0 {
 	status = "okay";
 };
 
+&spi5 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "google,cr50";
+		reg = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&h1_ap_int_odl>;
+		spi-max-frequency = <800000>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <129 IRQ_TYPE_EDGE_RISING>;
+	};
+};
+
 &spi10 {
 	status = "okay";
 
-- 
Sent by a computer, using git, on the internet

