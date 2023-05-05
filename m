Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D10BB6F7D26
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 May 2023 08:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbjEEGlj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 May 2023 02:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231165AbjEEGlc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 May 2023 02:41:32 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D95916366
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 23:41:09 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-24dfc3c662eso997435a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 May 2023 23:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683268868; x=1685860868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fz6g2/625qlFmhiR93VnIJ+EVOsf12tbuuuDirZwZ9U=;
        b=MmA7Y+uUYYhv+yAq02uAK8CEia0LlV4pux4QKHpZFC0gkmfB1CQgMBVEQQg/9XU48g
         qYArqTuHSsRi8p5ZmrZYxMze6dorq5vbED1me6hx7gKOUkOcNk4qN0ZBhQtcB0mpMEJL
         DGEFs1sPgNw82bJdShebVPVxdBcZc/SwcCEp8AKfOiHStBE7L/hXSxKrjnGPu4211oyF
         rL43hNZYqLdiGqiI+KbaA/Pp5kWjLiyPFpXU83xoWhRjd9BuESvbieLZOmEPO7ux26T5
         WEinZT8zCN7PTBiYTtPSVhySoqy3VAiXGmd336t6Gngckqh3aG28ZWrGCkPjU0UpNYH3
         CBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683268868; x=1685860868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fz6g2/625qlFmhiR93VnIJ+EVOsf12tbuuuDirZwZ9U=;
        b=FMXivWXkV0AbaarOcEgrmfcpXOQmXSF2z/LtEV5VeKgyW9SD/Ws1+vJf0/6nm/YPdu
         UOGH9tO9cA6IvyQbUKmzTl2erlg82Af9A9nDBbFL2/w/U3RfPuuvHatC0hrmksFqKEml
         T68+rxgRpM132WogYKmwtDcYd0l8+hFXd7FLt4WmNf7vUjY+yUhsPtrJL/15eXSWIR65
         0REaUOr94IW1Wq5BSfECnCfA9/YUslKJLx26xJrQskyvmCZpYFz0/Y8wbrPPPIZSmN0H
         ggYn4xyjvkk/cekCSNbup8HvfcjxgCBCZpFMjO387GOEyuroI2i/VJLz4x18Emc4nfTs
         R61w==
X-Gm-Message-State: AC+VfDyKyJUG8Q8XC7PpykMfSGj0YE9tbttQiK7dJkWeZ82ZHXEUg4d6
        4AHhPG0gtqVnvVniF1FbBe5L8fx02/2/xQlgNTw=
X-Google-Smtp-Source: ACHHUZ7bu2wArNoHuLvlQnjk8//3Ao/e4FZ1KTLuUotie7kxB4Xc+nU1hmRfbTzX8r59/0PujftApw==
X-Received: by 2002:a17:90b:3a8d:b0:23f:9fac:6b35 with SMTP id om13-20020a17090b3a8d00b0023f9fac6b35mr419434pjb.39.1683268868592;
        Thu, 04 May 2023 23:41:08 -0700 (PDT)
Received: from localhost.localdomain ([223.233.65.180])
        by smtp.gmail.com with ESMTPSA id c4-20020a170902848400b001ab0b2dad2fsm816251plo.211.2023.05.04.23.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 23:41:08 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org
Subject: [PATCH v4 5/5] arm64: dts: qcom: qrb4210-rb2: Enable EUD debug peripheral
Date:   Fri,  5 May 2023 12:10:39 +0530
Message-Id: <20230505064039.1630025-6-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230505064039.1630025-1-bhupesh.sharma@linaro.org>
References: <20230505064039.1630025-1-bhupesh.sharma@linaro.org>
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

Since the USB-C type port on the Qualcomm QRB4210-RB2 board
can be set primarily in a 'device' configuration (with the default
DIP switch settings), it makes sense to enable the EUD debug
peripheral on the board by default by setting the USB 'dr_mode' property
as 'otg'.

Now, the EUD debug peripheral can be enabled by executing:
 $ echo 1 > /sys/bus/platform/drivers/qcom_eud/1610000.eud/enable

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 27 +++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 1a0776a0cfd0..0ce72f1ebc10 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -30,6 +30,10 @@ vph_pwr: vph-pwr-regulator {
 	};
 };
 
+&eud {
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -253,7 +257,28 @@ &usb {
 
 &usb_dwc3 {
 	maximum-speed = "super-speed";
-	dr_mode = "peripheral";
+
+	/*
+	 * There is only one USB DWC3 controller on QRB4210 board and it is connected
+	 * via a DIP Switch:
+	 * - to either an USB - C type connector or an USB - A type connector
+	 *   (via a GL3590-S hub), and
+	 * - to either an USB - A type connector (via a GL3590-S hub) or a connector
+	 *   for further connection with a mezzanine board.
+	 *
+	 * All of the above hardware muxes would allow us to hook things up in
+	 * different ways to some potential benefit for static configurations (for e.g.
+	 * on one hand we can have two USB - A type connectors and a USB - Ethernet
+	 * connection available and on the other we can use the USB - C type in
+	 * peripheral mode).
+	 *
+	 * Note that since the USB - C type can be used only in peripehral mode,
+	 * so hardcoding the mode to 'peripheral' here makes sense.
+	 *
+	 * However since we want to use the EUD debug device, we set the mode as
+	 * 'otg' here.
+	 */
+	dr_mode = "otg";
 };
 
 &usb_hsphy {
-- 
2.38.1

