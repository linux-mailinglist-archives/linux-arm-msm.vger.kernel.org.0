Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8000512E785
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2020 15:55:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728673AbgABOzM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jan 2020 09:55:12 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44727 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728668AbgABOzM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jan 2020 09:55:12 -0500
Received: by mail-pl1-f194.google.com with SMTP id az3so17889524plb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jan 2020 06:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qQ3dPyVIYOxnnD+V93y32YHWB9TyUbtp8D+2BSxgJjI=;
        b=HAA0qFXPm/feR1Ew/vwtwclzWPyBuVhbCMyKzSfk+mFTqf+hLc7gq+QlFGuYOyr/fc
         CyhSu4o6NwWWTPcJn1t2qjZtoHIo/vbiZMrudIJlV8u+ikmzs+30YbcYs29LU9vFfW+z
         Aj/dyGVA8AvnEZbqp9vnD5aC85GvONjy0ss2CPjOPdNZpVYplhIQ/0G8/CDQd/Nqhu+z
         X5J60RFDye1a+qyv691H9YIKYuRP1iZ8kowTd4C+3hR6y834ctBesFJfkPWsqH3PI6s9
         caxkCijpZALFHNzbuvTe5hO4OcCoNKHJuloha4Q4Q5eQMOKxmCa5Bw8qwYHZOyVQqYmT
         SVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qQ3dPyVIYOxnnD+V93y32YHWB9TyUbtp8D+2BSxgJjI=;
        b=NQBwSKXI+jWeWOj9RS5w8Wlau+3RA8PBuInGxuh7u6+OhO5NxiBtEz59aWV4rGkAdl
         prC2bB7NxFUbs4gZ2Amwj404NS6bH4z/Ka38Leq57SbKEmdXafjt129qpc/X+YfnCIaQ
         IK+AAMOw7famqdL5zdLD0h80DNY+eMTaBjUFSfICt5d759Gpxx1/v1zlf3IZjbjGuTnb
         TqOmo1WHV/VMyVdo/jaPpEVKT7DJpA5isMRDBg98P4Z8+46Xt6TN2paMdPpBZoDuUzIh
         49m8UuV472jNNQnBFFv6HFFVvKTUK3dM3KpzMZc22JlPPPYC9sy9seHxS2KoC/fCQZ6z
         cLMA==
X-Gm-Message-State: APjAAAVsajQDf0O2WyOJ6hshTrLCj8MJxp5yNYG1VHhMjndsL+fjYjth
        3HpnASTrdQ60bqMOfp51/b6hGg==
X-Google-Smtp-Source: APXvYqwQggvFSNCdOyWo4GIOGfBb4EPNOjBCZx/+BM2YzYiNE/19lee99UQH/FwKdi2eQNwxfET3Yw==
X-Received: by 2002:a17:902:8c91:: with SMTP id t17mr83625707plo.225.1577976911485;
        Thu, 02 Jan 2020 06:55:11 -0800 (PST)
Received: from localhost ([103.195.202.148])
        by smtp.gmail.com with ESMTPSA id d65sm64405487pfa.159.2020.01.02.06.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2020 06:55:11 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, swboyd@chromium.org,
        sivaa@codeaurora.org, Andy Gross <agross@kernel.org>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v3 9/9] arm64: dts: msm8998: thermal: Add critical interrupt support
Date:   Thu,  2 Jan 2020 20:24:34 +0530
Message-Id: <445b152a10e51c29590659ce717f505d56a98d9e.1577976221.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1577976221.git.amit.kucheria@linaro.org>
References: <cover.1577976221.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register critical interrupts for each of the two tsens controllers

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index fc7838ea9a01..4b786b8651a9 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -817,8 +817,9 @@
 			reg = <0x010ab000 0x1000>, /* TM */
 			      <0x010aa000 0x1000>; /* SROT */
 			#qcom,sensors = <14>;
-			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "uplow";
+			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
 			#thermal-sensor-cells = <1>;
 		};
 
@@ -827,8 +828,9 @@
 			reg = <0x010ae000 0x1000>, /* TM */
 			      <0x010ad000 0x1000>; /* SROT */
 			#qcom,sensors = <8>;
-			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "uplow";
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.20.1

