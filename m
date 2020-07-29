Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62944231DDD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 14:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbgG2MB3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jul 2020 08:01:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727001AbgG2MB2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jul 2020 08:01:28 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3799AC0619D4;
        Wed, 29 Jul 2020 05:01:28 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id r4so18413911wrx.9;
        Wed, 29 Jul 2020 05:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4dsJZR6exGc1T0EmcyZPyr2Gz6t1X0UGcbSNE1N0tEw=;
        b=ADs2k5e2my6lFev6YnfqvFfjLdyhHpzb8DpB135rHP3kU6gOwZ+iluDWPd6l7tCfGi
         oxuyaRWQiopVN47KdcnrysD6oJmlpW04SZ6Fwy8FhvVrJ9EODJ3fV3RyY8uMHp1vhnx9
         clcQsFTkbJ61vHPD3v/b70slyYdf+iwyGJh4f2z4RAAqbq1rixlu5pobAr5ygToIdieO
         NiyJPwW4FomSzEIu8zo+W+liGElj55sPlZ95CCBxdjxaDQvwuj/QnymydTaQkN5DPoOJ
         wPm+OaoWoZUTjjm09ClbeaHvm+D7IVmICJkSyiNYKqcgp/95pOr2CEgIlP5PrXKwdkBM
         Oq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4dsJZR6exGc1T0EmcyZPyr2Gz6t1X0UGcbSNE1N0tEw=;
        b=BoHVExQO22+9LkmYwuUdviW+YESQzSnXc6PdZSxxz6pv2FSEJqkbGDCNEmxlK5w/Q/
         gbk+vqWOlXs5OzBqpIV+upS0YwdUdCMLx7ELdm83Hb7XE8pPFmUpekRoMzVjuvm8uGSP
         tqxeFpdq8JlgmKAfc6CHFt8UB9ES0azBP0WKbPUA8c/vAB1V2WdrIba6WRsa/qfm1bJH
         3LuqY5qjEy/ypKmOjqfMYQI6q9R35IgQ5/4mUBk54kGSvba+8rDRyL0ES67pk4YIlZWD
         IoKRxSw+OlY3fZf+i4AWWRN8eoBtwIqY2pLOk3JyXHozBzhi/aPe3ctBlHX6mTfoxeJE
         iLfA==
X-Gm-Message-State: AOAM533vJz2aa6sByLzyVhdUnOTOr7fY13uSI0Z/8WU9ykuBZ/7ROaXx
        XMA6/W/bV0jkTbLZoxA61sI=
X-Google-Smtp-Source: ABdhPJxtcOeNQtXzRyQOL5po8il8vZUESKCp/zwvGTPjQqWywMRZdXBlPmeeICZ4mjN8KIKEAdILSw==
X-Received: by 2002:adf:cf10:: with SMTP id o16mr27064006wrj.380.1596024086992;
        Wed, 29 Jul 2020 05:01:26 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl. [83.6.167.207])
        by smtp.googlemail.com with ESMTPSA id l67sm5426000wml.13.2020.07.29.05.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 05:01:26 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     lauren.kelly@msn.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 10/10] arm64: dts: qcom: msm8992/4: Add clocks property to gcc node
Date:   Wed, 29 Jul 2020 14:00:56 +0200
Message-Id: <20200729120057.35079-11-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200729120057.35079-1-konradybcio@gmail.com>
References: <20200729120057.35079-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is required for the platforms to function after the recent
driver cleanup and also is the current coding style.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index c9502fcf5d70..008206251f49 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -457,6 +457,8 @@ gcc: clock-controller@fc400000 {
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			reg = <0xfc400000 0x2000>;
+			clock-names = "xo", "sleep_clk";
+			clocks = <&xo_board>, <&sleep_clk>;
 		};
 
 		rpm_msg_ram: memory@fc428000 {
diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 58fc8b0321c3..f2f850ebd3c8 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -528,6 +528,8 @@ gcc: clock-controller@fc400000 {
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			reg = <0xfc400000 0x2000>;
+			clock-names = "xo", "sleep_clk";
+			clocks = <&xo_board>, <&sleep_clk>;
 		};
 
 		rpm_msg_ram: memory@fc428000 {
-- 
2.27.0

