Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF66C9730
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2019 06:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbfJCENw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Oct 2019 00:13:52 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42476 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725613AbfJCENv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Oct 2019 00:13:51 -0400
Received: by mail-pg1-f193.google.com with SMTP id z12so894396pgp.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Oct 2019 21:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=m8hFjA3x5J6UIifkesrHQlzvrEbWo1oOG3daGAO1Kds=;
        b=i5esF3BhGT+PZNcHTJPM4IJ2c8B0EtVNHjz2sMfWVyDlsdjvH7aGm8Wg+mM4Qx2XOH
         BnqQVYtNrj7kuwsnDdvUMlMYcwOAzlV2dR902apMkswWzx7YQhl8tbm29+fGzyz7hlmM
         k3mIYDi/88ELYvEX5xGjnCdjbDlDCgSGGT7g+N4xUgQ9fosAhu+PL/pVV6DdCduEvtBz
         kKpfrExbywrPHCTL0M007R8UWkyPISywv4P82868F0Huim8EIbofLfgyJJ4vscUMJyPm
         juJbyKfKO5qDuYvs4yqLhoiMmfB96tKSr48W8v3NgNcKfrUazNRpRi0F9xZr42na109D
         KPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=m8hFjA3x5J6UIifkesrHQlzvrEbWo1oOG3daGAO1Kds=;
        b=Ljk35UbHQOxvf7VzbT1dZpRFvwhrp7bSlJqiRmm+mWSELvapqVANN1iCsMqu9I8jcy
         /UeQWH02Ox7gV4F6i/gKzKiuxK4Huk6awl9x6LbB0Om5p9OFdCxtk0VSDSMNOYOdIG0w
         z5bbbySR2xja5wfHaZA9v4o71BvTtiuK61HjEG4r0i0g4MyXyf5E7joLB3sHmKzZlrLp
         RC+yEazqesnZkLxLis8O1IhBkkzaO4ffXBtSKgg3/5mNf3TqRH5+rWTEwb2TRGqsSDAT
         mDcVDIEn7cadrP0WaMeB5y6lTQ96f4cDAI1aH0/KZbqXSjqd+ZGwpAZmNmGEgyUY5Z/E
         bXpA==
X-Gm-Message-State: APjAAAXua7wowy0ju4Q0FFnuKENmyn9x0VQIIzvK0MWoiwyHAMpQCD25
        gIBbBHI/HHs4Y3qCVhDWIJ2xvIJKri8=
X-Google-Smtp-Source: APXvYqyqK2FTREVQtaobYQa+y7zSAJtRxO4xSW9iXnj50Z6gIChwFgdcvlIk/Z34JnR9JfHmNz8qWw==
X-Received: by 2002:a65:5043:: with SMTP id k3mr7649733pgo.406.1570076029386;
        Wed, 02 Oct 2019 21:13:49 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i7sm704205pjs.1.2019.10.02.21.13.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Oct 2019 21:13:48 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sdm845: Add APSS watchdog node
Date:   Wed,  2 Oct 2019 21:13:45 -0700
Message-Id: <20191003041345.20912-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a node describing the watchdog found in the application subsystem.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index f0b2db34ec4a..23915eab4187 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3488,6 +3488,12 @@
 			status = "disabled";
 		};
 
+		watchdog@17980000 {
+			compatible = "qcom,apss-wdt-sdm845", "qcom,kpss-wdt";
+			reg = <0 0x17980000 0 0x1000>;
+			clocks = <&sleep_clk>;
+		};
+
 		apss_shared: mailbox@17990000 {
 			compatible = "qcom,sdm845-apss-shared";
 			reg = <0 0x17990000 0 0x1000>;
-- 
2.18.0

