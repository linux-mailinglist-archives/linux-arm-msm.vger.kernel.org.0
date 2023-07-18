Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 638FD7573CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jul 2023 08:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbjGRGMo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jul 2023 02:12:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231365AbjGRGMP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jul 2023 02:12:15 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D6A412A
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 23:11:53 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-668711086f4so3253103b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 23:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689660700; x=1692252700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aoaxiWdRTQIjlpKBPFLmbhlJ2o+zAdh4av4kyochmEo=;
        b=sn5U4MWGxnrt7DhiV2WWKv7dD7NLNlyt1BcEtCXTkOw/Uf8oIJ6PwmKIwF6FtLKPhg
         8TlIKNSQAyZVe1gfVbgEx2k8bk5LMX+QAuclX+KMIcO0NFJoSrIERmxT118aoGWjIzCc
         fUmHl4YQZsx/3es7b/IVW1UOf/2CleLxq5vu/8l6FlBARVxbuw+8O7D528NGSBVVihRd
         Pj7faOnq6na2/+UZbhmoh6Nk4yfgUZ2Qz4qtTekyyv8G6nGfu5sTfSsW2JCbSsqAzq8m
         +1gff7MypqYM5gumiG3UP0JgnJp+awXH9VN26Zp0jgZTC4al32RLzwDOhW0f4ctfmDwr
         okbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689660700; x=1692252700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aoaxiWdRTQIjlpKBPFLmbhlJ2o+zAdh4av4kyochmEo=;
        b=e8Qd7QyQTSvqw7GgSwNTfgSs3X16DvPl6AP3q8s2+eqXK3kh01z+dIL0DO3QgT/x6o
         bG3yMm/Rotx5m24pB/B6s8XT8QHU3Ald1Mr75B8BF3po/Nq/7Qrqxl6irA0sifbQTYlZ
         +mnbvS3f2lHYmY+0VXhJcj3mDGE8BSvI8nYuIx/hAbSZ4q2CHj/W05dMxwOKGY7PLLVI
         BgGZWue7nmJ+0kmO6S1jrwrY5dbhQAxbj5FNLMAjoSZzAMi4j7eoRFNkdWjQI3njkybL
         ieBNqNaF+6uOJ3jubFQ+5z2uM5uv0mC+1RWiCpG086wbEsA/yVRKsKpIkI27AA+8TGpo
         bXLg==
X-Gm-Message-State: ABy/qLbu3JZvgUzxm08nlGxZrm56Is0SDlA0EX7nJmejWrKPW1NoCc0S
        GStdfRCCOMyivpAujGPG51q6VFA+hf+aVsGucZk=
X-Google-Smtp-Source: APBJJlEjkKb95SZ3h4MhroX1z4Rb0wFQVD0acfPLpGOo6UMskxiuerWVpHUqtAwqOeu7rT87h9CrJw==
X-Received: by 2002:a05:6a20:9189:b0:12f:d350:8a12 with SMTP id v9-20020a056a20918900b0012fd3508a12mr15193455pzd.21.1689660700254;
        Mon, 17 Jul 2023 23:11:40 -0700 (PDT)
Received: from localhost.localdomain ([223.233.68.54])
        by smtp.gmail.com with ESMTPSA id h21-20020a62b415000000b0067db7c32419sm778106pfn.15.2023.07.17.23.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 23:11:39 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org,
        quic_schowdhu@quicinc.com, gregkh@linuxfoundation.org,
        stephan@gerhold.net
Subject: [PATCH v9 7/7] arm64: dts: qcom: qrb4210-rb2: Enable EUD debug peripheral
Date:   Tue, 18 Jul 2023 11:40:52 +0530
Message-Id: <20230718061052.1332993-8-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230718061052.1332993-1-bhupesh.sharma@linaro.org>
References: <20230718061052.1332993-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 27 +++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index a7278a9472ed9..640668960deb0 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -264,6 +264,10 @@ &pon_resin {
 	status = "okay";
 };
 
+&eud {
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -518,7 +522,28 @@ &usb {
 
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

