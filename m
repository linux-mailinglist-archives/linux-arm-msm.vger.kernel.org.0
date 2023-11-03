Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF7E7E0C3E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Nov 2023 00:35:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbjKCXft (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Nov 2023 19:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjKCXft (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Nov 2023 19:35:49 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2915D5A
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Nov 2023 16:35:45 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6b5af4662b7so2526458b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Nov 2023 16:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699054545; x=1699659345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VSqLYgRbivKKnYF2aYcQthhro+1b5nXgEwvXxzPNrJI=;
        b=Xpudmcym95weo5RMydYrt3wBcmheGvdph6nKmkUnU/Ms2To1kqu9g6HiijwWWmWO3r
         MHjQ5cT0Ea3uTmQb71ASJVsSO+cZKzi+o+rOoZ2ZIE+P9A0qtXsuK2z6HSsPkpdNntl7
         NrikQ6u03vqSS2PDSTs0Q3T1b5jmFyajs/1Dc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699054545; x=1699659345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VSqLYgRbivKKnYF2aYcQthhro+1b5nXgEwvXxzPNrJI=;
        b=Wm/el2srkdwZNcn/XJvvQNW2RETW6EM1TsW161wA1nLHr7Jc0o3Sm0J7L5exIuH5j3
         gp1yh5sErYTWuUQtSDWGH5xbgsC5Rj5qVn92XWj+CKRQsUaDV2osGNWvPpW49H7jvEJh
         t5UFIWteDVS+xTdMF5CyN6f8XxhHuSxzOctyrs3blZsg+vxYqLgaatPilXvSFD3nAcmQ
         i8EU2Oth5ZPU77LRXOfOIy3KkrhlVfRd7GgvHUvkc+mtju2bZY8qUw898F8MFDieYIp2
         gVUdGIRtDza/yjcDvUow1HpbgEf7ubJwB5FB2gRx8m83Pwntuhh6u/oyrZz5LjyMhVIK
         3+fw==
X-Gm-Message-State: AOJu0YzdEW4gbh9h9tyLA4MiqxUixnukTn94a2LLK04jdYCSjiRnAwf+
        kzkz7eop2CF1INjV2+aXQQf48Q==
X-Google-Smtp-Source: AGHT+IGivJm72G8Ok/Dga94KQLsX+IkSW0u6XGPI33zFZ+PCZIj6TFlSL7IcmjdbwjmZbUt1yJ1mbg==
X-Received: by 2002:a05:6a20:938e:b0:180:7df:76a4 with SMTP id x14-20020a056a20938e00b0018007df76a4mr19623287pzh.45.1699054545136;
        Fri, 03 Nov 2023 16:35:45 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:5195:5e72:f5bb:e3f0])
        by smtp.gmail.com with ESMTPSA id jg5-20020a17090326c500b001b8b2a6c4a4sm1878114plb.172.2023.11.03.16.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 16:35:44 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        swboyd@chromium.org, Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Kees Cook <keescook@chromium.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Tony Luck <tony.luck@intel.com>,
        cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] arm64: dts: qcom: sc7180: Make watchdog bark interrupt edge triggered
Date:   Fri,  3 Nov 2023 16:34:27 -0700
Message-ID: <20231103163434.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On sc7180 when the watchdog timer fires your logs get filled with:
  watchdog0: pretimeout event
  watchdog0: pretimeout event
  watchdog0: pretimeout event
  ...
  watchdog0: pretimeout event

If you're using console-ramoops to debug crashes the above gets quite
annoying since it blows away any other log messages that might have
been there.

The issue is that the "bark" interrupt (AKA the "pretimeout"
interrupt) remains high until the watchdog is pet. Since we've got
things configured as "level" triggered we'll keep getting interrupted
over and over.

Let's switch to edge triggered. Now we'll get one interrupt when the
"bark" interrupt goes off we'll get one interrupt and won't get
another one until the "bark" interrupt is cleared and asserts again.

This matches how many older Qualcomm SoCs have things configured.

Fixes: 28cc13e4060c ("arm64: dts: qcom: sc7180: Add watchdog bark interrupt")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 11f353d416b4..c0365832c315 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3576,7 +3576,7 @@ watchdog@17c10000 {
 			compatible = "qcom,apss-wdt-sc7180", "qcom,kpss-wdt";
 			reg = <0 0x17c10000 0 0x1000>;
 			clocks = <&sleep_clk>;
-			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 		};
 
 		timer@17c20000 {
-- 
2.42.0.869.gea05f2083d-goog

