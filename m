Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0495F5B35AA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 12:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbiIIKvu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 06:51:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbiIIKvp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 06:51:45 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDCEED0237
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 03:51:42 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id w8so1979306lft.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 03:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=5hRjVhtmA/1LGQ0J4v1L+rPfsNLzeir0jildbKGOmB8=;
        b=feGsyXDEga227yZTGak08wrLIRhLQAOgESWyvVXpDWhPlSjHYfu8FoDuSpk1AjW41e
         Lac9KmD5U+ysr4wZdMCWQ4JMmn3ZzB8Bpp7qKLtQSxzT71Wb/3YWSZ4N/TrLYequWDAs
         ciMHx3LRIz1mVtZyzptCg9NwvJsXK5WlRDhL1Y4rHl7Jyc481922d2guzFufkDLyGdtt
         3U82vtp5vToXTCPbaxte/p1K3QylKqXKyJy4fQwBrU84gC/4YP/dKCVHJUantEHuZw3y
         tphuMrI6QLFHJZtS1yElJpptKL+gD/YfQLDRx0HHYOHR4hxwWwvGHXh/LqlT2TnVY+nj
         osWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5hRjVhtmA/1LGQ0J4v1L+rPfsNLzeir0jildbKGOmB8=;
        b=2NU3kbiBRkQ2iCicZZnzlXx2QBxHrqw6jGapBKh9qvCRK808J0nuGrIB2OvPPZRzDe
         szu+/hK7w9LiA0e3PrZz4W99zoCAJnYT+y4sxs4JGclTjDNxFEmEmh8VHn3IlSgz/o0S
         QxGw4GaHXg2nLriqVhBnIqsOldifX+Gjt7lM8t4cV+pKLISsEH2quxgQy+eIsSxWmkNh
         B6fWPZgzqvnPFFbBqTNwPNZOf5iScGVb8huOiZeSnaV1cdv304MpPeiuHRIjOad5+jNh
         Kj+KecBuazIFau46yQjb+AgmpSOkXffv1cY+LBwD4xa7Qh1P0Eskpg+KRB3hllRBrr6F
         Uqiw==
X-Gm-Message-State: ACgBeo39NDl8wOLXWNYDqwJsF0k98R1WNGzhjZa7kXHkwV54wDRGNHrK
        KhEb3nilgj4/sxBwnuJYZWugNg==
X-Google-Smtp-Source: AA6agR6DxmOyspd/lZfs/9PqO2TzdxA6lPpV4O1XJPFo2mrnZsJuocF4vdxpGEymMqY07VWcSeezIA==
X-Received: by 2002:ac2:5602:0:b0:497:adb7:1270 with SMTP id v2-20020ac25602000000b00497adb71270mr3254670lfd.353.1662720700753;
        Fri, 09 Sep 2022 03:51:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u4-20020a05651220c400b004949903efdcsm25428lfr.287.2022.09.09.03.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 03:51:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 5/5] ARM: dts: qcom-msm8660: fix node names for fixed clocks
Date:   Fri,  9 Sep 2022 13:51:36 +0300
Message-Id: <20220909105136.3733919-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220909105136.3733919-1-dmitry.baryshkov@linaro.org>
References: <20220909105136.3733919-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix node names for three fixed clocks to follow the
no-underscores-in-name rule. To remain compatible with the drivers
expecting to find the old clock names, add clock-output-names
properties.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8660.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
index 153156f48421..4f0a8ff2ab61 100644
--- a/arch/arm/boot/dts/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
@@ -50,22 +50,25 @@ cpu-pmu {
 	};
 
 	clocks {
-		cxo_board: cxo_board {
+		cxo_board: cxo-board-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <19200000>;
+			clock-output-names = "cxo_board";
 		};
 
-		pxo_board: pxo_board {
+		pxo_board: pxo-board-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <27000000>;
+			clock-output-names = "pxo_board";
 		};
 
-		sleep_clk {
+		sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <32768>;
+			clock-output-names = "sleep_clk";
 		};
 	};
 
-- 
2.35.1

