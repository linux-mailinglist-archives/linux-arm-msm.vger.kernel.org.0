Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0157F155032
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 02:59:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727682AbgBGB7l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Feb 2020 20:59:41 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35025 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727702AbgBGB73 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Feb 2020 20:59:29 -0500
Received: by mail-wm1-f66.google.com with SMTP id b17so1010467wmb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2020 17:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GxnmQXYbPrwwDf1YSEYt6X6fG7RNrO9V3k1o149cooA=;
        b=Ph/ceQJBkbfcaN2157vp1LsLvms4t8gRLjruxE0+ZYUYxSz9CF4i6n3ysHGgZXvOnj
         nXoUAoKnAVWL15mrTFqyDJO/Qm1F+EXvHDFvCbnVigDDqPXhqJ2QF2pLpsOKC7caM279
         u/IkyIqsM6YZVobJaeS2dGFbatI/q7BDqEvcDJtvZO0MfMa64s3dpwCgKMy8C7tCyiqh
         /qzJYn9ueunXKKYkPP1qgmNiQHgZ9HOY+0mC0f6gmqf5+FHsLCTxfLgJwqsKPKtH6COj
         cNi/UBuBbNuYsxKZeuNXh0113n5iwRQjlCCph8NVd5AAn8LjaBaXAbk1yi2VJtjcXO+V
         pYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GxnmQXYbPrwwDf1YSEYt6X6fG7RNrO9V3k1o149cooA=;
        b=MbHZjRvoatHbVGEUisSCzxUyBiR60fKS9IEoweayyMd7wJcl923YsQli9WnXbRi819
         GiWbW/ow/anvxVEzUCp8pef7iihs+6G6o8iFz7YUPhQZBVBZXkl3gHki916ptGg6gX65
         FvtZbnTNqRTOQEMby9j2IfLZjE6WusqO1JnFeJDdtX/bJ2Ontn2pq4iynxDuGGubr+qc
         pPRqGJhmAzpJrFFIF8GO8T/MOwJD65HiMZ5MB6xSCBWHMkaHXVln+HD/LUKVJ5gf/PV8
         v78HNKWYUbWRh9lxVbH9SNsEoLz/DXLglQYdiHAL9AFySF1KB/YMSnHPXHG9Ou72EuQF
         3Ypg==
X-Gm-Message-State: APjAAAV+6TS7ZrenG5APyn1m8K2MEf9ZwWgCwiQ2t1KOF69YUi444YJW
        2etnB2V5oGVdE+dOacDMnp+DpCm5uZY=
X-Google-Smtp-Source: APXvYqzRCnHwCvNpDLkgCsTiWvatIyOa3bRtPAr2/syZ37Q0Ryuo260neou5/AukdGISrddCaXKjJg==
X-Received: by 2002:a1c:ded7:: with SMTP id v206mr1007653wmg.106.1581040767193;
        Thu, 06 Feb 2020 17:59:27 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id a62sm1490095wmh.33.2020.02.06.17.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 17:59:26 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v4 16/18] arm64: dts: qcom: qcs404-evb: Raise vreg_l12_3p3 minimum voltage
Date:   Fri,  7 Feb 2020 01:59:05 +0000
Message-Id: <20200207015907.242991-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207015907.242991-1-bryan.odonoghue@linaro.org>
References: <20200207015907.242991-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rather than set the minimum microvolt for this regulator in the USB SS PHY
driver, set it in the DTS.

Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 01ef59e8e5b7..0fff50f755ef 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -199,7 +199,7 @@ vreg_l11_sdc2: l11 {
 		};
 
 		vreg_l12_3p3: l12 {
-			regulator-min-microvolt = <2968000>;
+			regulator-min-microvolt = <3050000>;
 			regulator-max-microvolt = <3300000>;
 		};
 
-- 
2.25.0

