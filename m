Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B539872BCB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 11:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235206AbjFLJcn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 05:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232536AbjFLJbT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 05:31:19 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 309844ECD
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 02:25:02 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f730c1253fso29567005e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 02:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686561901; x=1689153901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLaMx9+e4iuA9k0HKzXztUaaZBEZ9bpdRm0ATPtxSFs=;
        b=Z0vGtlAOr73GZC/Gj6eNFC/9k2Sm7GthQ5ThOHdTEND/fWcqoz9SHGZU7g4Oejo0+B
         RaV6BZ/igQvP2b+/IrEGbCH17+t+nX1v97JhXRnct3KrN+NH+rKKSmNU5mCdV4b8VRdx
         LxPR1YJ1FiMBcCV/4psL9l/br0kTlIiTM9S2TXH8Yt5k/l/Yji6lXbMjA3yDLYaN1t5F
         yTkATjmoZYcy0mVncUpNLUH8UkjQNLy9HERgoOXFhfpbFPFdkrhehA7+aktL68oKI3fc
         VfoghKsM37C8k9q6fKStc7pJd2JFqcOuHZ/fiUcQndVgIGO+EMPW0QhTOi40Ae765TFr
         GNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686561901; x=1689153901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CLaMx9+e4iuA9k0HKzXztUaaZBEZ9bpdRm0ATPtxSFs=;
        b=VI5reqRlYnYOgxJ+kiRl6P8gHkIfXf1JFAeZCw7BDPLXA5vg26o9tlUyTaJIRYPNKt
         sed0DrAXjeVeL9ACGrrJ8hEtkGEBpy2hdoYXx4/gjyBmrh9kULYtcgsKs5/Whbtaajr0
         JB7IY2tH01qqa8VywA+jjcFHu1omLGIgemTctN6mWgUd26sbB/AwUuUoizf1nope3LO0
         lv7C8ogFksaXpZtNXipwVRef/Ai2yAEen5Qvf7vxrlp/8YJc9s5st/jMN+A8GqF5P0xA
         cXRC2AQA9CNrHHodalqReTnhjyu61A18I0cx0act+zjGN+oYcV5WshrtyqymqZRTXRHQ
         /aRQ==
X-Gm-Message-State: AC+VfDwg+13CWdgBreQxxywWD+pjhFo6jYJHuYgkuy74rLytVU0j2qtd
        a3tibeCIWxGPZ6laARuwrMO0zomwiWGFHhBetUE=
X-Google-Smtp-Source: ACHHUZ7qP7/SyTOU8/DDIX68G7BFQneP8olbAA34G/JnNTqmm2c9ABxgMYXONRfwTSOTiB3F/nspiw==
X-Received: by 2002:a05:600c:284a:b0:3f7:e818:1eb with SMTP id r10-20020a05600c284a00b003f7e81801ebmr5507867wmb.40.1686561901784;
        Mon, 12 Jun 2023 02:25:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a222:bbe9:c688:33ae])
        by smtp.gmail.com with ESMTPSA id p14-20020a7bcc8e000000b003f727764b10sm10892044wma.4.2023.06.12.02.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:25:01 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>
Cc:     netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 25/26] arm64: dts: qcom: sa8775p-ride: add pin functions for ethernet0
Date:   Mon, 12 Jun 2023 11:23:54 +0200
Message-Id: <20230612092355.87937-26-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612092355.87937-1-brgl@bgdev.pl>
References: <20230612092355.87937-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the MDC and MDIO pin functions for ethernet0 on sa8775p-ride.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 7754788ea775..dbd9553aa5c7 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -370,6 +370,22 @@ &spi16 {
 };
 
 &tlmm {
+	ethernet0_default: ethernet0-default-state {
+		ethernet0_mdc: ethernet0-mdc-pins {
+			pins = "gpio8";
+			function = "emac0_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet0_mdio: ethernet0-mdio-pins {
+			pins = "gpio9";
+			function = "emac0_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+
 	qup_uart10_default: qup-uart10-state {
 		pins = "gpio46", "gpio47";
 		function = "qup1_se3";
-- 
2.39.2

