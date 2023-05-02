Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D80C96F3D09
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 07:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233521AbjEBFga (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 01:36:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233545AbjEBFgY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 01:36:24 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A759249EB
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 22:36:09 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1ab0c697c84so1870675ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 22:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683005768; x=1685597768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5pQrJTTCZJZZKPmjIiq+X+xkUImdFCCiZ3e7a6lOiY=;
        b=fZP5Z2rmGEmEpMy/cc4ZqxwatyLd6N1517X/g3uf1SrKVGaZW/O0PmycIWhrUpTajl
         r3ICQ65PAG96adg0yLWV3BYu8Io1tOKqCxKo7QyouVeng7Uv1GnYf6luRWhbqcvKo0Y8
         lhTMNeAxOgQ/96CNfMBQNnGTEesOCzfPE6rTpr3653xNSDPZ3CMKcO0xdx8TnyKG0u0y
         aeHN39S3FzCqWfdH7hBmIl+aMdj2+VIXsJkCCix5kialup04MsjsUmv10/3nBUqlrErr
         aniplwSJ3sJvvni0BQ4M67c2ipOEpcTZyBYeojhiWj7MwJYnSTFiPDGSqTGERTeMU5u1
         HWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683005768; x=1685597768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P5pQrJTTCZJZZKPmjIiq+X+xkUImdFCCiZ3e7a6lOiY=;
        b=f8We35OQRQB8hD7Lr77ZXu951nw2B2cEven7zRHLWwjckbg/GTkzWmub6ebkTaLtIP
         zE/e6Rq9081bfI1WHiGWUv6u7Q8XsCtPUh0N9JYVLjtXCTKmvLUIgM+kEFxqI7LBpLEZ
         TpiFAYbgB7XZ4y1Q9Ak3+2grZBOMXQmZkH0xKmgwNGSW188LU681y2zlhGDx8TG1Hrmi
         hRGZFmRFC2iaBY0x1Ua/GJZjTbW+Rs1i7lFSMwI5fh8/cBJ55C0wnid3kT8bZADkw03T
         9Ly/hTxLORyV4741fJ9DaBL0V0+CKIaS9UdtPCx6y96cewa0HhL7CLkZrxs82nbhN9q6
         YxxQ==
X-Gm-Message-State: AC+VfDwVkIBDTt+yvL5QJ7LV387oI3gpmeh288U4EMu3v8oenUcGnXpj
        rEldxJyKXAp9czpfM0SQT294iebB9ZotroBaHH8=
X-Google-Smtp-Source: ACHHUZ4tSd8e/JnDsfq3JN6L/4ZDpvPlKlRCROwvaxatf/we7R8ZNaa88ly1NpuHJ+TXY3Txe/QJRw==
X-Received: by 2002:a17:902:aa85:b0:1a5:22f3:220d with SMTP id d5-20020a170902aa8500b001a522f3220dmr15482431plr.49.1683005768487;
        Mon, 01 May 2023 22:36:08 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f3b:58fa:39f6:37e1:bb9a:a094])
        by smtp.gmail.com with ESMTPSA id j12-20020a170902690c00b001a6a6169d45sm18870369plk.168.2023.05.01.22.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 22:36:08 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, bhupesh.sharma@linaro.org,
        bhupesh.linux@gmail.com, krzysztof.kozlowski@linaro.org,
        robh+dt@kernel.org, konrad.dybcio@linaro.org, kishon@kernel.org,
        vkoul@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        dmitry.baryshkov@linaro.org
Subject: [PATCH v10 4/4] arm64: dts: qcom: qrb4210-rb2: Enable USB node
Date:   Tue,  2 May 2023 11:05:34 +0530
Message-Id: <20230502053534.1240553-5-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230502053534.1240553-1-bhupesh.sharma@linaro.org>
References: <20230502053534.1240553-1-bhupesh.sharma@linaro.org>
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

Enable the USB controller and HS/SS PHYs on qrb4210-rb2 board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index dc80f0bca767..eae3024ce003 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -222,6 +222,30 @@ &uart4 {
 	status = "okay";
 };
 
+&usb {
+	status = "okay";
+};
+
+&usb_dwc3 {
+	maximum-speed = "super-speed";
+	dr_mode = "peripheral";
+};
+
+&usb_hsphy {
+	vdd-supply = <&vreg_l4a_0p9>;
+	vdda-pll-supply = <&vreg_l12a_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_l15a_3p128>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&vreg_l4a_0p9>;
+	vdda-pll-supply = <&vreg_l12a_1p8>;
+
+	status = "okay";
+};
+
 &xo_board {
 	clock-frequency = <19200000>;
 };
-- 
2.38.1

