Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79BC341B4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 06:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389772AbfFLEpr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 00:45:47 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45211 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730042AbfFLEpm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 00:45:42 -0400
Received: by mail-pg1-f193.google.com with SMTP id w34so8186570pga.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2019 21:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lU+1IReUFq1QxTqJmNw/PFLd12Qda0MdEvw29DLYGsI=;
        b=Ok3TDXB/0ir1GXhXi4ceey/ULS/XIgOAO3ADiqKp5EnZ72xf3Z2Rz5aTAdztTH/lSH
         yV+BGzMyOaXTmH7eA8jzZnCBDsKHX/YtNUEwo9JofnxkgjlptRcxgMLCBDz2C4iN6ePX
         eUMC9IntZ82vQqR23loEnCWf7Tk9R+bNazeOqRZ8/QFTDDFa2tzRoVbht8lRG8t4j+RB
         RC1SswfT5jxdzNHlGZm4nu2xuGfYrAwMEEFcWkdLL/eAWYwtGx5+X9B8b5oOQJahhGMK
         96HmPZsmjNF64F6fuxyJaERspyC9niiFYDxMNub4ply7vD9VPSoGCaxLI6fZE97mgI/q
         546Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lU+1IReUFq1QxTqJmNw/PFLd12Qda0MdEvw29DLYGsI=;
        b=VdvXGkmNiOMOFC/Od5r4+1M+Cx/C2zjSwE+g48nnRt2/sxBDeJ9n5CWPd3GJyca3xn
         nsXTmWfTX92OrguB5szA+gUx/VZB2Gr4V6Cy2V24Oc8A762c6dbdYEG4VJr6ejyDps2r
         YwjjK6jRS7n2N2NWSHh52VR2rtwnRzB5Rqf6XVge2AmGeEEhnoDcqP5C/Jv7Ib+9POXK
         bYFpOJJNu/mtpcqIPpURXlrrejWdMwovQUnk9AmJGkTq6uz15mHe84nJdw3Jg0dUnuUu
         en1Xi1mOHk5EVf1R5lz2D5UGyBiqHTk+7liPAAPUgrHSkbJf9d1Q0ookHvVB2WCitw/n
         wc5A==
X-Gm-Message-State: APjAAAVujUiOVTl6a2Dqy149u0iwlsrv5aB32M8E0BQBLynXB1Qcz8Nm
        56FfHGfOH5XJM6KoFI5KCfnV5Q==
X-Google-Smtp-Source: APXvYqxidn6YVca8VaGCmJ1n6WsjntR5pgsqjt1jIgf7t/P0osUBMOKWEroQFtZYfl48vexKIAhPJw==
X-Received: by 2002:a17:90a:d3d7:: with SMTP id d23mr29021075pjw.26.1560314742061;
        Tue, 11 Jun 2019 21:45:42 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z126sm17129194pfb.100.2019.06.11.21.45.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 21:45:41 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 3/4] arm64: dts: qcom: Add AOSS QMP node
Date:   Tue, 11 Jun 2019 21:45:35 -0700
Message-Id: <20190612044536.13940-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190612044536.13940-1-bjorn.andersson@linaro.org>
References: <20190612044536.13940-1-bjorn.andersson@linaro.org>
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The AOSS QMP provides a number of power domains, used for QDSS and
PIL, add the node for this.

Tested-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v8:
- None

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index c5a5c5b086b1..c80881309f79 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2448,6 +2448,16 @@
 			#reset-cells = <1>;
 		};
 
+		aoss_qmp: qmp@c300000 {
+			compatible = "qcom,sdm845-aoss-qmp";
+			reg = <0 0x0c300000 0 0x100000>;
+			interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
+			mboxes = <&apss_shared 0>;
+
+			#clock-cells = <0>;
+			#power-domain-cells = <1>;
+		};
+
 		spmi_bus: spmi@c440000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0 0x0c440000 0 0x1100>,
-- 
2.18.0

