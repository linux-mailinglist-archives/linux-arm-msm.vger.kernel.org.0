Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B80806720BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 16:10:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231735AbjARPK6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 10:10:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231787AbjARPKH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 10:10:07 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9BCC3527D
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 07:10:03 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id 200so20240313pfx.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 07:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEcc2ZZg4+/rCWO8lF+EBDL5HIag6zFEZ6LhCeBUUxo=;
        b=SF0jnonDRV3kMcVclflOD2iajoDlCgYs+7RCBsuEuTbAUtPpOd051QxBH225nYEe0j
         Wk7K28q+az5tsoheuC4aGX0bgSFN7k0Vtt0G0ChpVLhfmHZbdK8w84laJV+yrBSNmswB
         XI6NZgoKeBfDSIef82be5y5+3HHpwTFwN9Xoi1nUaUwR81eOGaxpFfsoMAZ5tGhYDRPN
         qWhPD5MUhGK7waGozSvl5VJg1U4LsL2YiMOwEFoMZFDIR1bUIN0XXezUVKTZUTH1tH5m
         O4OIz6PnAzQXZkm7m0GIvKtjNOOPzoLBRjfuaj2hFbmYUm8SjMfS2H5/0/t2IWkXuG6l
         OJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cEcc2ZZg4+/rCWO8lF+EBDL5HIag6zFEZ6LhCeBUUxo=;
        b=1Vq4yYAdmD2/1vNARp8TYTVD9Yg0IoNECsu1ddwjh3pxVU9EtYOg/Y+pQxiJzxCr6+
         I9579FkaDwBBxqjUJ3gAfE3xS5kclkGJD4nvDAjyzsQde6McEkVWJ1sgZHdo4JnG2hGZ
         QD4k2xNp02DvnZ3NpNT76oEv4hYotaoxSQWakuLOM/lwqI7jMNeJsesJcnxkaESATDUD
         uO07VwcR7kiLta/j3ga0+CP8lZitTDv2khySxWabjAZ4QxAG3soG/OhUWrWMsHqwUjq/
         8aP9M2dpXGZ5Zsizu1IX0fVSAY1IbnpoGSIfy+CRBV48M+rEsTgIPiQMT5ojYladUE+R
         hohw==
X-Gm-Message-State: AFqh2koXwn7IhiFHfY/j7oTVkjJNw/cyvE9R/0uuz8zEWCRGgHunwDPg
        28G7xCDEO2Z2GlZsvlnYMG0m
X-Google-Smtp-Source: AMrXdXsQHYRmOryPXtwWfuYEySKTMiOyDnNTqUQWNw+ESAAg1dOAhAWgoXvMEjompjkzgvz9mP7Jpw==
X-Received: by 2002:a05:6a00:3691:b0:580:d409:396c with SMTP id dw17-20020a056a00369100b00580d409396cmr8995745pfb.6.1674054603390;
        Wed, 18 Jan 2023 07:10:03 -0800 (PST)
Received: from localhost.localdomain ([27.111.75.61])
        by smtp.gmail.com with ESMTPSA id i15-20020aa796ef000000b0058d9623e7f1sm6721544pfq.73.2023.01.18.07.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 07:10:02 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        luca.weiss@fairphone.com, ahalaney@redhat.com, steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v6 09/17] arm64: dts: qcom: sc8280xp: Fix the base addresses of LLCC banks
Date:   Wed, 18 Jan 2023 20:38:56 +0530
Message-Id: <20230118150904.26913-10-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230118150904.26913-1-manivannan.sadhasivam@linaro.org>
References: <20230118150904.26913-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The LLCC block has several banks each with a different base address
and holes in between. So it is not a correct approach to cover these
banks with a single offset/size. Instead, the individual bank's base
address needs to be specified in devicetree with the exact size.

Reported-by: Parikshit Pareek <quic_ppareek@quicinc.com>
Tested-by: Steev Klimaszewski <steev@kali.org> # Thinkpad X13s
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sa8540p-ride
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 109c9d2b684d..0510a5d510e7 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -1856,8 +1856,14 @@ opp-6 {
 
 		system-cache-controller@9200000 {
 			compatible = "qcom,sc8280xp-llcc";
-			reg = <0 0x09200000 0 0x58000>, <0 0x09600000 0 0x58000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
+			reg = <0 0x09200000 0 0x58000>, <0 0x09280000 0 0x58000>,
+			      <0 0x09300000 0 0x58000>, <0 0x09380000 0 0x58000>,
+			      <0 0x09400000 0 0x58000>, <0 0x09480000 0 0x58000>,
+			      <0 0x09500000 0 0x58000>, <0 0x09580000 0 0x58000>,
+			      <0 0x09600000 0 0x58000>;
+			reg-names = "llcc0_base", "llcc1_base", "llcc2_base",
+				    "llcc3_base", "llcc4_base", "llcc5_base",
+				    "llcc6_base", "llcc7_base",  "llcc_broadcast_base";
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
2.25.1

