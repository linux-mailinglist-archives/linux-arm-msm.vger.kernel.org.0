Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73F87202465
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 16:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728382AbgFTOs3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 10:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728348AbgFTOsZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 10:48:25 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ACD7C0613EE;
        Sat, 20 Jun 2020 07:48:25 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id l11so12380599wru.0;
        Sat, 20 Jun 2020 07:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p7Zl7lqrThNKdsqg3QbPFVZu6d1ST335CM8NkSqvRSU=;
        b=LIeBcIrJ3ecmKXNYIeszQaZlRVNNTxuJ418s85/jubTj/u6h9YLE2j2TddBJ4/ZYTj
         GaajqqoyzoJex+Tk+BAIrai+LxbgmjrZa4T+1PnJQTF1E6011BOqUnWhA/SzBXTz7kn7
         +3RdTGEwZb4P2qCYbCbnKLrtcQvIltU+U6eulxE2H4IA91v3lWjQaps0dJfpVAuYFK1E
         KkzOlY6PraOAmYlZqSkiZtWQ4SOZ1N2apP0Gd92d8h4+ukVMDpTyJqTegSGkhu91jl0x
         I1qIHx8FgvizAxg46XsilMnEbEeQYkuP+YLp+7n9z5ro4KRAakKM8UPpKuSAfFIg65Wl
         5ghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p7Zl7lqrThNKdsqg3QbPFVZu6d1ST335CM8NkSqvRSU=;
        b=hQB8udHy1RR5cxK0u47j/08mLO26X4spqDR5lb6e8DGQMh9nF01uMMtq/ypxMKSD/h
         cq6ewcvjqcB+s9kJXC8RwIrLr0cjwpe9lWi4sphtOTf+/K3vjczPXq5dh11pnk+sArNo
         rYeWGcO+ngoxMaX9PLmZgVywdbC9SWBK8BSGnoWpQWoM6lAFefcMskE0ANeNZKgeappE
         9P9PUZFk8KAxQvLkFuT2sxiMwO/0rRdYPU+gzEWHSV6KytytW5iQl1CKpVWArpoYCGDk
         Os0K5DfXKmia71LlJHE1QlOtqv81SqHOAEujXmZWoMHtkrU/K1bTPCP7wmykZuzSUoR4
         Ir/Q==
X-Gm-Message-State: AOAM533UjsK+8d2fWv/AnFiy4T2HT83eWMbLKXCn4C4AKZfMW3BkoEM9
        3N/v1uakqvwGDS9dzbaPpKY=
X-Google-Smtp-Source: ABdhPJw1WAcTW3meA7eqByw3FB5W2Ahyf/5p/55ugLQgziZCG2Q2KAKToi6OI5m21LQPLucdThBjnQ==
X-Received: by 2002:adf:e4cc:: with SMTP id v12mr9114825wrm.183.1592664501803;
        Sat, 20 Jun 2020 07:48:21 -0700 (PDT)
Received: from localhost.localdomain (abae138.neoplus.adsl.tpnet.pl. [83.6.168.138])
        by smtp.googlemail.com with ESMTPSA id 63sm11928379wra.86.2020.06.20.07.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 07:48:21 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 09/21] arm64: dts: qcom: msm8994: Add PSCI node
Date:   Sat, 20 Jun 2020 16:46:25 +0200
Message-Id: <20200620144639.335093-10-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200620144639.335093-1-konradybcio@gmail.com>
References: <20200620144639.335093-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add PSCI node to enable multi-processor startup.

Note that not every 8994 device firmware supports PSCI,
and even if, then it can only start the cores and not
shut them down.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index adb1ebd15667..076da1fc52a1 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -287,6 +287,11 @@ pmu {
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4)| IRQ_TYPE_LEVEL_HIGH)>;
 	};
 
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "hvc";
+	};
+
 	clocks {
 		xo_board: xo_board {
 			compatible = "fixed-clock";
-- 
2.27.0

