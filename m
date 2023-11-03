Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA52C7E0C58
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Nov 2023 00:37:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231425AbjKCXf7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Nov 2023 19:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231147AbjKCXf5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Nov 2023 19:35:57 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A362D6A
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Nov 2023 16:35:51 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1cc53d0030fso21571325ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Nov 2023 16:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699054551; x=1699659351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zz68Dpk5/BPogrJUoLb+ojt78NoitxE3Zt6yEq9LG2U=;
        b=momXYVMY+bw+3Dv62fdAW7nOnWhR68hRjnpbXq59K5XvakR4hadBzJAgaVHEi89cKJ
         dvMNHjQSAvReZ1SX+WzvnjoJBkrJ06J6Tb9u4+QoThxtjwqmUrRXIjt8VLEO25jYY4SV
         ntjHz7PWlTVFCUxFRs4DAT+x9ku5v+xalby6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699054551; x=1699659351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zz68Dpk5/BPogrJUoLb+ojt78NoitxE3Zt6yEq9LG2U=;
        b=DR8dXGKmfC7ARH2fyuAYEHQ6AOgd+TS29x0FN5rwdpG2ymvxiiH6rfwv57600Z+BAN
         /GOm70bbkjvd/lbGJN3ucPuReqeUBFzUKESDStBSTs+S0ccWLFn2NDD/sEo3HLC1tr8I
         l9aBaxzKQNvHubwKWI3Euqyidchx/8jVgwklDQMqsjtp+FPFxgzVCq7kLEMtjzPN94wt
         8zpuaT39YhOBw+cqp94wE0K3WFA/TjelWbqpnVKiYVJe/Uk3a6abEPxGNlFTGfzOEaQo
         EhA+vEdtzlWiRos08P8OqjE6Ike/09sMIa2XVIVcnk+QCPYfBgOzEmwJefabi927Q7iA
         RIiw==
X-Gm-Message-State: AOJu0Yz9hpt158hYxmlhMQWp04pCiJjrDA1/s0BsFS/cee4TDtDVZLTu
        A0qywUvSpSlKcUmgIDYTfwbFyw==
X-Google-Smtp-Source: AGHT+IFK1hHfcpBeh0knlfyxQFyC6Jxkd70kmnEy3Aot5NkHmsPwatjZSDR3YYJuCABjHH3P6t4sxw==
X-Received: by 2002:a17:902:c40c:b0:1c3:e2eb:f79d with SMTP id k12-20020a170902c40c00b001c3e2ebf79dmr5655555plk.8.1699054551130;
        Fri, 03 Nov 2023 16:35:51 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:5195:5e72:f5bb:e3f0])
        by smtp.gmail.com with ESMTPSA id jg5-20020a17090326c500b001b8b2a6c4a4sm1878114plb.172.2023.11.03.16.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 16:35:50 -0700 (PDT)
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
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] arm64: dts: qcom: sm8150: Make watchdog bark interrupt edge triggered
Date:   Fri,  3 Nov 2023 16:34:30 -0700
Message-ID: <20231103163434.4.I23d0aa6c8f1fec5c26ad9b3c610df6f4c5392850@changeid>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231103163434.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
References: <20231103163434.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As described in the patch ("arm64: dts: qcom: sc7180: Make watchdog
bark interrupt edge triggered"), the Qualcomm watchdog timer's bark
interrupt should be configured as edge triggered. Make the change.

Fixes: b094c8f8dd2a ("arm64: dts: qcom: sm8150: Add watchdog bark interrupt")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 97623af13464..ad4fab61222b 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -4170,7 +4170,7 @@ watchdog@17c10000 {
 			compatible = "qcom,apss-wdt-sm8150", "qcom,kpss-wdt";
 			reg = <0 0x17c10000 0 0x1000>;
 			clocks = <&sleep_clk>;
-			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 		};
 
 		timer@17c20000 {
-- 
2.42.0.869.gea05f2083d-goog

