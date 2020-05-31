Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B49501E9945
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2020 19:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbgEaR2Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 May 2020 13:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728234AbgEaR2P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 May 2020 13:28:15 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B25EC061A0E;
        Sun, 31 May 2020 10:28:14 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id c71so8555659wmd.5;
        Sun, 31 May 2020 10:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2DRiNbK762AXkswj1HhYBzOBmJVVHL34gfc+Pw0XaPM=;
        b=s35LDCMUvODW0UkBfwN/JSwOhbyq4+PuuZKptsZ8nTZ1CgeiXKxoGK2stHa4QIi709
         dKCuQ8LohuXOuTGVeXWyFT0VSpFkc/l2kgTA3xT/WYKcIcyYoc9+v9CNxVliXYnExWcd
         ucf9gzowJ8stBgkcB1yQAKWlKg+5h9yO3WGa6o2uMhFeVO2q1NWLWhwIO5D4aOalL8P6
         8J7FjA1wpL494qch+1sBD3gmWE+eyc1kPF2GgDw4VPOfUKQq+7+1GOy4mIT7BAf6Sc8M
         5HTnW8OsBwSTMe8Yn82BtuVO2uMEdpuNp55Re+L3EBRB3dFYJkAScgizru1w7y+vsW0Y
         QcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2DRiNbK762AXkswj1HhYBzOBmJVVHL34gfc+Pw0XaPM=;
        b=a1Yaq5fXJOYG8R7cOTxRlifEj50DxkBJxhJb2icNLaKcXLHX8SogtiX6U4+XfN3bup
         V9h4j029ht4FngdmRxcK9qu+6E1NenpQJ1f8Tn7Lgk3BLhCaK34GgpYCb9vZySJciwJv
         5MDKbZs/aAYGNOVMHe6+sYhyo2HGNPxdAV2sdC9b6XFgE8QNcDJwlqJx94lwzUIoNKRY
         PSMxk7c1SuwwZk81R+iAVcFdaR3Cp2KKaw5MsclP3Ei/afeSjlardGKAJow34xtvqs6N
         9SRKsN7UX6UlustSD0GXBl7hw3d0UQ9E2BgT6Zpwkn6/CuC7vbnedNC/u1cBXMb5zSV/
         QAjQ==
X-Gm-Message-State: AOAM530gYKJZpA/AvywSpVT1/TQ9ptVoIvWpJAH0T/T+DEDgE+0K9Y2/
        rMzBNXuaD7Watgzp3Px+Yr4=
X-Google-Smtp-Source: ABdhPJxoFBlhkTS0MO4she4gFi2dgkoNrIxQPCff1ZCyVFEQmxNBry2PQd7HWtP/tO/vGFQ+xHZI6A==
X-Received: by 2002:a7b:c212:: with SMTP id x18mr8717760wmi.119.1590946093146;
        Sun, 31 May 2020 10:28:13 -0700 (PDT)
Received: from localhost.localdomain (abad130.neoplus.adsl.tpnet.pl. [83.6.167.130])
        by smtp.googlemail.com with ESMTPSA id b81sm8922326wmc.5.2020.05.31.10.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 10:28:12 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/14] arm64: dts: msm8992: Place clock nodes in clocks{}
Date:   Sun, 31 May 2020 19:27:52 +0200
Message-Id: <20200531172804.256335-3-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531172804.256335-1-konradybcio@gmail.com>
References: <20200531172804.256335-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commits brings no changes
functionality-wise, but aligns the DTS
with the style used in newer ones.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index 900c9445e0ba..e255b577af37 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -116,16 +116,18 @@ timer {
 			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
-	xo_board: xo_board {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <19200000>;
-	};
+	clocks {
+		xo_board: xo_board {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <19200000>;
+		};
 
-	sleep_clk: sleep_clk {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <32768>;
+		sleep_clk: sleep_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+		};
 	};
 
 	vreg_vph_pwr: vreg-vph-pwr {
-- 
2.26.2

