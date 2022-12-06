Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1761B644F78
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 00:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbiLFXSM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 18:18:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiLFXSK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 18:18:10 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7348327FFD;
        Tue,  6 Dec 2022 15:18:08 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id p6so1729584iod.13;
        Tue, 06 Dec 2022 15:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2S48S/ZvuL1KoDCkjWF/hDiUMwnp9MDUvJrls0zCYxc=;
        b=hpPyK7ANWm0PWMrGjhOIXtL2QxT2LrGN3F74Zy/m9ldIayBOlDoKksjac3C0sXO24q
         CxCdGAZG63G2KOjUkOQVhQg2i8YvFrJCD46rJ1pVuRbEyykaqLwpTXPqLRq7rA7k4L3g
         qkJyI0gbYggicDLLLYoJMP/nOChe9XN7yomTCiAOf9lHMFRtFJkeqaar2EKtci4pYoQG
         tQ3AMcumCnu8SpyDtPpg2zXNTG8S6k7PH8gbNlwNS5c4+KZssKcQj4t1E5V9kqRSBu4X
         j2YKm6hgfb808V0VYE81mWdsdJjU+N7V5tlk7ipoxry/hT2l+ytHYmG/tGozU4NH/H9K
         jG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2S48S/ZvuL1KoDCkjWF/hDiUMwnp9MDUvJrls0zCYxc=;
        b=BVpsDImBxDMAeprEgEawU1b6LR8kDqfGWQ8XfAG/Ibk00XcOyLox4jg5wtCR2RWVW+
         qlxr12FbShxzO45oaKi3Cataiia7fNYt4I3umJd2wh9i6ajPUYEjA7h4l742Y8xJl+4b
         TvZWsWRDwcx/ucHZD801WD87QgdV1oKalrg8AK4kIhDLeBLQtTp4V1ryQxiu1fV/QOM2
         NTXIb1JzxC9NKlP5fctWhactMVTp7NwbA03HtKeA2nkoe1Ro9iQg3f1vBs5a+YnFcpGa
         Y2KHlvwAVeqT2klvQLqiECQ9y4DGGx0xNk4khgRj4WPt5mBEUABwMnOHwleYrvPLUiDi
         IXYw==
X-Gm-Message-State: ANoB5pkkHHa8HFEieYB2SzGCH76WXSo3/xilYSJIce7q9RcBfzKQnlR6
        qoNifCnHyv90qt6kbSokaDU=
X-Google-Smtp-Source: AA0mqf590evn9EVI+BG0q6lMLy/zYK0ACd1BTRHQ6879JK/WqoIKXxKr+m1TGgE6e3VLYCMjkqpfag==
X-Received: by 2002:a6b:d117:0:b0:6a3:a0cf:ea32 with SMTP id l23-20020a6bd117000000b006a3a0cfea32mr33878087iob.155.1670368687823;
        Tue, 06 Dec 2022 15:18:07 -0800 (PST)
Received: from localhost ([2607:fea8:a2df:3d00::32c2])
        by smtp.gmail.com with ESMTPSA id n10-20020a02a18a000000b0036332a07adcsm7017098jah.173.2022.12.06.15.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 15:18:07 -0800 (PST)
From:   Richard Acayan <mailingradian@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 2/3] arm64: dts: qcom: sdm670: add qfprom node
Date:   Tue,  6 Dec 2022 18:17:30 -0500
Message-Id: <20221206231729.164453-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221206231729.164453-1-mailingradian@gmail.com>
References: <20221206231729.164453-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some hardware quirks and capabilities can be determined by reading the
fuse-programmable read-only memory. Add the QFPROM node so consumers
know if they need to do anything extra to support the hardware.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
Changes since v1:
 - offset address by 0x4000 and zero-pad regs

 arch/arm64/boot/dts/qcom/sdm670.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index f93705bc549f..c78156e03d93 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -731,6 +731,13 @@ gcc: clock-controller@100000 {
 			#power-domain-cells = <1>;
 		};
 
+		qfprom: qfprom@784000 {
+			compatible = "qcom,sdm670-qfprom", "qcom,qfprom";
+			reg = <0 0x00784000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		sdhc_1: mmc@7c4000 {
 			compatible = "qcom,sdm670-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0 0x007c4000 0 0x1000>,
-- 
2.38.1

