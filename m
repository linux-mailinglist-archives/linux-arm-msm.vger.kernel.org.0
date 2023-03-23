Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1523A6C6EDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 18:31:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231748AbjCWRbT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 13:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231678AbjCWRbT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 13:31:19 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B757F199C5
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 10:31:10 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id kc4so8380917plb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 10:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679592670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=km2gqXc7azHXISk3TRRkbz6777YLDRrwj5fuSfpq1q8=;
        b=KCgwX9Jxa6ZuTKmTith9SO5UOsRsmngKseZno4cqXEm7+jy1lVMNhTL1iOBxxM5TxK
         oYE8Dll9PNG+8RA0LbuHxpwQIZxHdl8kOBdP4qkOWRFfmZlXmgW7smhrcv73a8Vu18z4
         0zVIqv9teDevEYUSrhbLRlUA2va7Vj4PC4tN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679592670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=km2gqXc7azHXISk3TRRkbz6777YLDRrwj5fuSfpq1q8=;
        b=DB+gW2vUGWMH1iE+45nMRNWdXLZXZj7rDIr/bLLfx6hBWCOT3Bg5QPZQWaTkMqhEZL
         Okb7bMOM76Uu+JR2xyLARG+mjkT1mCQQWhNU9EkTBxPH0AiO3bGkvzlI572Ri8vQjc7T
         qySswI53PvmzQ7dfwsKPXpeosyjdCjlY3YV+FYgah2O7BV1KCgiGT/wqDaRQwdxf0O1S
         Oc0WIgcXD1WH9/AI2/nHlrXVk8wY9QH2ATws+e6CllaTWkB3sscy7ZEMc6FqVCt78EvZ
         3+7NCEmg+DbVvfHmwhH1QZe9/TNgszXJ/HfRU9X0tDjgTpqB9hiBn9bfcSjvtB3Y76PZ
         jV9g==
X-Gm-Message-State: AO0yUKVc1kgDqksOuQ4zoX3+eOCLwMaC8hSs8cnlcV7oCMLJxtc45aat
        M8gpqMFu9jWSRHImxJUoKFCd3g==
X-Google-Smtp-Source: AK7set/eq0TFdASOKnSDm1Sm/iWmOncE+NdY4v8Uy8PcDjyvmJd7KNfv2/GAbFmZOvVhygT3gxRmiQ==
X-Received: by 2002:a05:6a20:8b9c:b0:da:d9e7:9a5d with SMTP id m28-20020a056a208b9c00b000dad9e79a5dmr400673pzh.4.1679592669751;
        Thu, 23 Mar 2023 10:31:09 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:16d3:ef20:206a:6521])
        by smtp.gmail.com with ESMTPSA id x13-20020a62fb0d000000b0061a6f4c1b2bsm12613546pfm.171.2023.03.23.10.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 10:31:09 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/14] arm64: dts: sc7180: Rename qspi data12 as data23
Date:   Thu, 23 Mar 2023 10:30:05 -0700
Message-Id: <20230323102605.1.Ifc1b5be04653f4ab119698a5944bfecded2080d6@changeid>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230323173019.3706069-1-dianders@chromium.org>
References: <20230323173019.3706069-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are 4 qspi data pins: data0, data1, data2, and data3. Currently
we have a shared pin state for data0 and data1 (2 lane config) and a
pin state for data2 and data3 (you'd enable both this and the 2 lane
state for 4 lanes). The second state is obviously misnamed. Fix it.

Fixes: ba3fc6496366 ("arm64: dts: sc7180: Add qupv3_0 and qupv3_1")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index ebfa21e9ed8a..fe62ce516c4e 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1540,7 +1540,7 @@ qspi_data01: qspi-data01-state {
 				function = "qspi_data";
 			};
 
-			qspi_data12: qspi-data12-state {
+			qspi_data23: qspi-data23-state {
 				pins = "gpio66", "gpio67";
 				function = "qspi_data";
 			};
-- 
2.40.0.348.gf938b09366-goog

