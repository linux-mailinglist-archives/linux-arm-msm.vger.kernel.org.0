Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10025155F1A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 21:16:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbgBGUQx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 15:16:53 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55205 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727309AbgBGUQx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 15:16:53 -0500
Received: by mail-wm1-f68.google.com with SMTP id g1so3812664wmh.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2020 12:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qsI/xaPXMqNdKm9K1igbwkE2PA4fRpWtUntr4tiEc9c=;
        b=nzKvmZJ9aAV/JW+8pzm2E70BKhQcS23xS0CYkXUr7Z3bAxJaRv8nqWz2cj1SSddqpQ
         uoYVkYCmGAhg2yBA3YBHi+G5uSEerEuFW1eFYWObrz4OwI2Vxvli+j8E5/Vu6vdXOJOr
         Xm4L3nC2KO8US8RWWLmptOE/87ngvdNCkoKchUjMlhtqsfcqnvbuTDKCI25tJFt4h+6i
         nEYJ2A26wYgCpQMR2JBl/f4WYvfkFQ6Qer3IcjqHeNEkZ6TYgEH4WjCIhDmQ813wcrcf
         R2WSvjmTqnJ2S3kYlnM4Fd4m+EhFRIsP/FBWi+R1hYNrj+qBCuL1emw0a2SrjBhGkPMv
         sjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qsI/xaPXMqNdKm9K1igbwkE2PA4fRpWtUntr4tiEc9c=;
        b=P3MKz9KwuoXYyHMfVEd5Q+S3OWZYuXHNou2SadhpY8mSyZWDh1XfGs8tjBuT9yDYn6
         1cD4z80hwyk4KyjxnXv1rDdCVz74KitiRrcFTq1u3cqgkXgZmJmR4FTCHcMSz1oNRGG/
         e/FG7IuifFX68ZupROAiOH8HDZeR4aoRu4HVs1UpjKKnIYqcHyrdOAAaDiSmMpm/zfh0
         yBwBbhbPs/w55RdozWY3RrJow2gEX5EG1SteNlH70/ZHr7VjUYEHPPDzKHd6sSf3Vo7/
         E+HDtoiKOmENZi+htMlZ5694nn0aKDVvedJjzzH6NWn6AsB253YDFYQhqf8qu95+7WzS
         44ag==
X-Gm-Message-State: APjAAAXV2oqq0x80u1N8lV3OF2yaEG2B929k/nXJKdzwbqYyfZKQk5zC
        e2iyY6mRFaO+CdiFZBqUdB3sR7UMMPU=
X-Google-Smtp-Source: APXvYqw9qXEd9607sipcwdF14YHooE/RA/yasD/GDtyTLNkUEQwkjXe4Bpi0gslaJ+gT36M7lapfbg==
X-Received: by 2002:a7b:cab1:: with SMTP id r17mr47670wml.116.1581106610849;
        Fri, 07 Feb 2020 12:16:50 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id h2sm5018542wrt.45.2020.02.07.12.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 12:16:50 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v5 01/18] dt-bindings: phy: remove qcom-dwc3-usb-phy
Date:   Fri,  7 Feb 2020 20:16:37 +0000
Message-Id: <20200207201654.641525-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207201654.641525-1-bryan.odonoghue@linaro.org>
References: <20200207201654.641525-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

This binding is not used by any driver.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/phy/qcom-dwc3-usb-phy.txt        | 37 -------------------
 1 file changed, 37 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom-dwc3-usb-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/qcom-dwc3-usb-phy.txt b/Documentation/devicetree/bindings/phy/qcom-dwc3-usb-phy.txt
deleted file mode 100644
index a1697c27aecd..000000000000
--- a/Documentation/devicetree/bindings/phy/qcom-dwc3-usb-phy.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-Qualcomm DWC3 HS AND SS PHY CONTROLLER
---------------------------------------
-
-DWC3 PHY nodes are defined to describe on-chip Synopsis Physical layer
-controllers.  Each DWC3 PHY controller should have its own node.
-
-Required properties:
-- compatible: should contain one of the following:
-	- "qcom,dwc3-hs-usb-phy" for High Speed Synopsis PHY controller
-	- "qcom,dwc3-ss-usb-phy" for Super Speed Synopsis PHY controller
-- reg: offset and length of the DWC3 PHY controller register set
-- #phy-cells: must be zero
-- clocks: a list of phandles and clock-specifier pairs, one for each entry in
-  clock-names.
-- clock-names: Should contain "ref" for the PHY reference clock
-
-Optional clocks:
-  "xo"		External reference clock
-
-Example:
-		phy@100f8800 {
-			compatible = "qcom,dwc3-hs-usb-phy";
-			reg = <0x100f8800 0x30>;
-			clocks = <&gcc USB30_0_UTMI_CLK>;
-			clock-names = "ref";
-			#phy-cells = <0>;
-
-		};
-
-		phy@100f8830 {
-			compatible = "qcom,dwc3-ss-usb-phy";
-			reg = <0x100f8830 0x30>;
-			clocks = <&gcc USB30_0_MASTER_CLK>;
-			clock-names = "ref";
-			#phy-cells = <0>;
-
-		};
-- 
2.25.0

