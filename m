Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCA6B4150B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Sep 2021 21:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237192AbhIVTxs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 15:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230384AbhIVTxr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 15:53:47 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84A3CC061574;
        Wed, 22 Sep 2021 12:52:17 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id c7so14071234qka.2;
        Wed, 22 Sep 2021 12:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zLTAvh/qTdiRs4eWmGep1vOuuKWt6ejXUVBUMtYvUec=;
        b=lYHp4nIlkfDdsAKs95SiTh6sURggwWS64NWrdEvp7M2/EeH1lz1l1X8pzw0sYDeR91
         RQdEw+hthuhVCnqQNqGRR+Bwe3Us2DfyCMYSHcJvQOYKbGrXQdTO/vsX0bTX7DyQMFIU
         TE5nnYWVuK71E2xg+pEyzgRB5ed+rP7kfgEH+pqntFCsSYlO31/PqBDVmtEpRmotZO8z
         11YZrd8su0+K6gly3WtPTNm562xr6wnRagc7KBfFPR21f/dZ3fTKjylxR66T45jnIih3
         irqPGXTAaPDUTOo4Hw2g1m6innYVGN76f7eWblpBi/1J6KAPcCodvEEYDuldkkWn8X7X
         2mqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zLTAvh/qTdiRs4eWmGep1vOuuKWt6ejXUVBUMtYvUec=;
        b=u9m+6yNNdErYYK9uxsN7nIo8ghMvMK0BqDPtKfwRobXDIFUCXIJIdyOoZ3+F3LNgtd
         SOrJ/zNeygSCJCILrSIsmppZdtIqyASi/TASogpPYTgWWh1AEjyrbFa4xczzrZScGhtW
         0jdniJYfp0uVSCXeKLkiHVPj7a11arDwVC2wICTU5xKYLgsdtMd1I+1A82olh6v2+i2i
         1u9ZIzX++Z+Ib1e+4zfzK572KmuMPvX5l2iF3eX7tFvB+ThKV1piiNx3gdqmQUmj6wnd
         RFdTLLVmGOv8v4g02TSQdTdoMnal+q+pawjuuOK8E6RoJqlumymvvWKwzRBiTC5Yerv/
         6J2g==
X-Gm-Message-State: AOAM532TLqLntb5QyUvi7UDAlBXCLwuRICJUmuQXM2ApQDlVeIaArXIz
        AiYzgRz2CwnY1PQd/hbwoBOVtHHLGM8=
X-Google-Smtp-Source: ABdhPJyFQO2z00KfzoiF2B7YRGN+Fw1NoorTnPMAf+YY+yPMiNg6xPczBycvf/b2a9YxfCjPfbQkDQ==
X-Received: by 2002:ae9:df07:: with SMTP id t7mr1105861qkf.95.1632340336630;
        Wed, 22 Sep 2021 12:52:16 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:51af:67d8:b2b6:725f])
        by smtp.gmail.com with ESMTPSA id l195sm2654895qke.98.2021.09.22.12.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:52:16 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        martin.botka@somainline.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] arm64: dts: sm6125: Remove leading zeroes
Date:   Wed, 22 Sep 2021 16:52:08 -0300
Message-Id: <20210922195208.1734936-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dtc complains about the leading zeroes:

arch/arm64/boot/dts/qcom/sm6125.dtsi:497.19-503.6: Warning (unit_address_format): /soc/timer@f120000/frame@0f121000: unit name should not have leading 0s
arch/arm64/boot/dts/qcom/sm6125.dtsi:505.19-510.6: Warning (unit_address_format): /soc/timer@f120000/frame@0f123000: unit name should not have leading 0s
arch/arm64/boot/dts/qcom/sm6125.dtsi:512.19-517.6: Warning (unit_address_format): /soc/timer@f120000/frame@0f124000: unit name should not have leading 0

Remove them.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 2b37ce6a9f9c..0c1057456597 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -494,7 +494,7 @@ timer@f120000 {
 			reg = <0x0f120000 0x1000>;
 			clock-frequency = <19200000>;
 
-			frame@0f121000 {
+			frame@f121000 {
 				frame-number = <0>;
 				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
 						<GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
@@ -502,14 +502,14 @@ frame@0f121000 {
 				      <0x0f122000 0x1000>;
 			};
 
-			frame@0f123000 {
+			frame@f123000 {
 				frame-number = <1>;
 				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x0f123000 0x1000>;
 				status = "disabled";
 			};
 
-			frame@0f124000 {
+			frame@f124000 {
 				frame-number = <2>;
 				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x0f124000 0x1000>;
-- 
2.25.1

