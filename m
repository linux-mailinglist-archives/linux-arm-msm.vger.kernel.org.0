Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F180AA2798
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 22:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728121AbfH2UDq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 16:03:46 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33283 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727602AbfH2UDq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 16:03:46 -0400
Received: by mail-wr1-f67.google.com with SMTP id u16so4716802wrr.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2019 13:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3M8K2hCSiPvGzizEtGkQOzw0j/L8RdGCYEoiff4ylD8=;
        b=OOCAsilqKIQujBzpjN60C4x2o4qBoPW3kHXFD6Vl5mx1ySp6Ygvo0FJR7EP1tJf67T
         xRkNY2JoQoVLZrEN6oqfofF9bNanmQr0X/P+YycOOUqOfQtwDxrWBjD3ZVSBLiJ4Ux6N
         2s7/uP+dqZUB753IIBMjB/gc+MyLByuDE3CD3Hmthu9DMdA2JNX2MVsHE4IPnzSvoG3y
         dURJ/ycc2lsDiyjiT0Wk7ndHKaBaUg1Q3Dr8aTtrFqMwf/LOq20NllaZxjYlGqEHrgTu
         MdS8/bdvf3392w0Xx0KDRdaGf1WLbSmfZLun831+3LdjR00UR9Hic2iR2GlcPZLLhN1K
         lgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3M8K2hCSiPvGzizEtGkQOzw0j/L8RdGCYEoiff4ylD8=;
        b=uB5G77J2Hqj5hoVX2ItTkklOovH2Ch2Ybmu+vwyOmbnpLp0G8rM/9lVkfmG23Agkxh
         c29C+R1RJLu2YPvI1JsNlbKw1ePKajEoXEQ5Ytafo4fl9gatOUmvjzzHwDovkLyukSUU
         LIK39Ntzb/2mdyoed3cnrZItwxJA0Zc/7kijq3mQovKCN9W3tfVh29JlGJcFCl0UkyEP
         suqM68kumqY5d5AFcOhEbUM6Wzpx/Yx0EAcwjRKaljZcHQlG3jnrXAfRYwaMRdSelTZ2
         yOIPFIQeV6/qy8tUPDaWvsAHiwhqOZf2sqOKgMxzFZf01yjMNyQ5BLF/9tYcNF5pjrVY
         uAWA==
X-Gm-Message-State: APjAAAWy5hYzVAX4G9/DT/RXvRuulyg2bzEEfIOrWW0xixtkVN05ESE6
        43npZjfllEFtPMbp+hni2W4nFw==
X-Google-Smtp-Source: APXvYqwsr1v6UMKeFI2VY96K3XlhP/mMqvf9FqYSHttg0/GWCHv9zqjHvmFKpGlULE9FhC0YKHq+MQ==
X-Received: by 2002:adf:ecc7:: with SMTP id s7mr14507441wro.215.1567109024642;
        Thu, 29 Aug 2019 13:03:44 -0700 (PDT)
Received: from localhost.localdomain (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id w8sm15584995wmc.1.2019.08.29.13.03.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 29 Aug 2019 13:03:44 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org,
        agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: qcs404: add sleep clk fixed rate oscillator
Date:   Thu, 29 Aug 2019 22:03:39 +0200
Message-Id: <20190829200340.15498-1-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This fixed rate clock is required for the operation of some devices
(ie watchdog).

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index a97eeb4569c0..131d8046d3be 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -22,6 +22,12 @@
 			#clock-cells = <0>;
 			clock-frequency = <19200000>;
 		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+		};
 	};
 
 	cpus {
-- 
2.22.0

