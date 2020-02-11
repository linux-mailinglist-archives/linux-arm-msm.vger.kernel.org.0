Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8171B15989D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 19:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728626AbgBKSaQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Feb 2020 13:30:16 -0500
Received: from mail-yb1-f194.google.com ([209.85.219.194]:37989 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728587AbgBKSaQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Feb 2020 13:30:16 -0500
Received: by mail-yb1-f194.google.com with SMTP id v12so5850741ybi.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2020 10:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r/j2vvVFfb2pvvewnOqGFeHcx4HUzbo3PkGetmF0ApA=;
        b=WWE2UP0bVzNzxjdQPMAadNNL/kOWI0y9xAyMB3zoasEPuHuYVjeKiiLaMoyOkG4/9Y
         ajCQvRQ4+syc0704ykkaWttG9f+RS4dt+4d4HbqZJ+P83/wspnHWvqhRV20KpxhIDvku
         fSbMqVVQ9wBxFBlPS8PXsFkUX3v1GzbGyTGYahpS3nz8mctna7ksGnBA4vLfWREDkCwO
         0hIF4c8oNA2TNKuN7FdxOzLZTkQeeYlqPBrrpjYlnQgJf4i1irQDLdAEqIn2MRzengid
         02rn1zi6XW1d6SqhOIm11slkcDefx9P2xEMPqoXS3ZF81MTAe0X4L+EgAo8+rpWxn4Jx
         9WEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r/j2vvVFfb2pvvewnOqGFeHcx4HUzbo3PkGetmF0ApA=;
        b=WTSqRGoPx2yZEQQu75EfYNyIl2xzlA6jPF/OtkeD2B0PCBy6b6d1KPNN6FadUq2T4H
         Hs0dw6jLqRIaKfVFVy0k2iug246WF1Fs1xIR4RnC3V9U/+vqenVI4/lqmmVbz6Q9f0Z2
         w1ffE6yGsHAtBEMr3A3Y/GvqGr+SrlSzcP0Syd4v5vzC3BCdylyRYbm9rsi6a3PSP3Cf
         wXVfWDhDEj0KFdsKSchOQXFbqHbbVA3sgMV5EQMMDzkhIiTcZ3VBzRbH+GzIXssWOpmj
         xK97vq0HSkYhpP8ElzlCp7AxNk3uQe+XaLEEyVBOkDXHKoIR0SWZNfPtpWcMR+cx3CS0
         Nm/w==
X-Gm-Message-State: APjAAAW4pf6Ihc4iOLSLUAyadNBvBQpAQm+jED541vYJwxha/mgBTA1H
        /YPclsUlxmn7QVUuU1f0WcPTVQ==
X-Google-Smtp-Source: APXvYqxv0PnETTPgk+VJLufuYzlw0zLVjWrKfCT95T70l/M+tfCVDewpTF2LGd/XpEf5QFkkdD6tVA==
X-Received: by 2002:a25:640e:: with SMTP id y14mr6925518ybb.380.1581445814190;
        Tue, 11 Feb 2020 10:30:14 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id a202sm2100827ywe.8.2020.02.11.10.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 10:30:13 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: msm8916: Properly deal with ETMv4 power management
Date:   Tue, 11 Feb 2020 11:30:11 -0700
Message-Id: <20200211183011.24720-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Properly deal with ETMv4 power management by adding the
"coresight-loses-context-with-cpu" property.  Otherwise tracer
configuration is lost when CPUs enter deep idle states, resulting
in the failure of the trace session.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 8686e101905c..846c5b4a53e8 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1363,6 +1363,7 @@
 
 			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
+			arm,coresight-loses-context-with-cpu;
 
 			cpu = <&CPU0>;
 
@@ -1381,6 +1382,7 @@
 
 			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
+			arm,coresight-loses-context-with-cpu;
 
 			cpu = <&CPU1>;
 
@@ -1399,6 +1401,7 @@
 
 			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
+			arm,coresight-loses-context-with-cpu;
 
 			cpu = <&CPU2>;
 
@@ -1417,6 +1420,7 @@
 
 			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
+			arm,coresight-loses-context-with-cpu;
 
 			cpu = <&CPU3>;
 
-- 
2.20.1

