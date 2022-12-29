Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC7F7658E7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 16:50:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbiL2Pur (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 10:50:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233526AbiL2Puk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 10:50:40 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64DE013F6E
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 07:50:39 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id m26-20020a05600c3b1a00b003d9811fcaafso6913549wms.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 07:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEdVYIDCyjQIozVI4BE2BvXtfHehdibvZ1uOyQg9tFw=;
        b=rBl5gV8tfSZs0wx8/3BCDl745B08pVzPfhtErDJtxzQwRSKqtP7V5t0N0QEJZas1HS
         SJLB2D7A4qv4+cpSR0A+XzRAzPlLULVRiH/XToUExR9lv0XtVzJhhvxxfyx24M7gHyFZ
         Y3O52tWSpFXdl/K1MgQBc4yq5+ruYA/DLvHJ9MuK4w7yAdq/j59H+1kcI2CBvPa5HQ9X
         YMVSJcJpcRn4LROWnLQzPqr/lWPZHVHoaBtf8vxA8jn/oI3ZMYxY0kkF2iP3H/y0Gnm+
         LnL/X+JRgil9Ha/Wj8effJfxoeiLZ3M9MBY75EYNrsfwRs5BCRm++WbH/47aUN7pte05
         EXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEdVYIDCyjQIozVI4BE2BvXtfHehdibvZ1uOyQg9tFw=;
        b=BapJ+yUx5qtywDAuKSYWMZ8nWICsq1u9RiswfwckOSAQtLyzV9K67VSRiJ8Ge1U37C
         9rOi7ntRZTFZByTj38vG5Ode0a2E2YXP5+B84EUQZMFTgazNGZhRF22TqwbmMFxTf3Tk
         I3ECjRBvou3+pnJvfxWjsxMahdlPk0xKXDnAF03o6Ew7CuI/DuK+k0T38uZFf7Pcqg1Y
         XzFsDpFzLLcm9Dt6HPByHdahgKgP4jbHsIPl8aNYBroUe1BVlCfQvRY3p+tMxjx1X0nI
         Gm5RhEGFscIV/B1m4GrYATNoBCJNIXMH8Z5mCXGatFQKwjsfjKMgLF/easwqv7Is+aTN
         CaKQ==
X-Gm-Message-State: AFqh2kpVtHcBc4A0W4cwDO3yAswRjEuXXe4+oiFllsHeITOChy8bqzV7
        sIuGhRoU2KgfEEmcNqkYeLTlJA==
X-Google-Smtp-Source: AMrXdXurWx7jopuz9KB4ZATRrdqs70MzxtWmuYNMxsjo46bv4aXdd8GMkbcoU6hNh+9QGB2Tu2KnsQ==
X-Received: by 2002:a05:600c:b4d:b0:3d3:49db:d84 with SMTP id k13-20020a05600c0b4d00b003d349db0d84mr20148669wmr.20.1672329037892;
        Thu, 29 Dec 2022 07:50:37 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:8f7a:98d8:9d8d:ced8])
        by smtp.gmail.com with ESMTPSA id bh12-20020a05600c3d0c00b003cfa81e2eb4sm25251647wmb.38.2022.12.29.07.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 07:50:37 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v6 04/14] tty: serial: qcom-geni-serial: align #define values
Date:   Thu, 29 Dec 2022 16:50:20 +0100
Message-Id: <20221229155030.418800-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221229155030.418800-1-brgl@bgdev.pl>
References: <20221229155030.418800-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,UPPERCASE_50_75
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Keep the #define symbols aligned for better readability.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 62 +++++++++++++--------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 359d9f0ba6ee..a4a50f2a6554 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -39,57 +39,57 @@
 #define SE_UART_MANUAL_RFR		0x2ac
 
 /* SE_UART_TRANS_CFG */
-#define UART_TX_PAR_EN		BIT(0)
-#define UART_CTS_MASK		BIT(1)
+#define UART_TX_PAR_EN			BIT(0)
+#define UART_CTS_MASK			BIT(1)
 
 /* SE_UART_TX_STOP_BIT_LEN */
-#define TX_STOP_BIT_LEN_1	0
-#define TX_STOP_BIT_LEN_2	2
+#define TX_STOP_BIT_LEN_1		0
+#define TX_STOP_BIT_LEN_2		2
 
 /* SE_UART_RX_TRANS_CFG */
-#define UART_RX_PAR_EN		BIT(3)
+#define UART_RX_PAR_EN			BIT(3)
 
 /* SE_UART_RX_WORD_LEN */
-#define RX_WORD_LEN_MASK	GENMASK(9, 0)
+#define RX_WORD_LEN_MASK		GENMASK(9, 0)
 
 /* SE_UART_RX_STALE_CNT */
-#define RX_STALE_CNT		GENMASK(23, 0)
+#define RX_STALE_CNT			GENMASK(23, 0)
 
 /* SE_UART_TX_PARITY_CFG/RX_PARITY_CFG */
-#define PAR_CALC_EN		BIT(0)
-#define PAR_EVEN		0x00
-#define PAR_ODD			0x01
-#define PAR_SPACE		0x10
+#define PAR_CALC_EN			BIT(0)
+#define PAR_EVEN			0x00
+#define PAR_ODD				0x01
+#define PAR_SPACE			0x10
 
 /* SE_UART_MANUAL_RFR register fields */
-#define UART_MANUAL_RFR_EN	BIT(31)
-#define UART_RFR_NOT_READY	BIT(1)
-#define UART_RFR_READY		BIT(0)
+#define UART_MANUAL_RFR_EN		BIT(31)
+#define UART_RFR_NOT_READY		BIT(1)
+#define UART_RFR_READY			BIT(0)
 
 /* UART M_CMD OP codes */
-#define UART_START_TX		0x1
+#define UART_START_TX			0x1
 /* UART S_CMD OP codes */
-#define UART_START_READ		0x1
-
-#define UART_OVERSAMPLING	32
-#define STALE_TIMEOUT		16
-#define DEFAULT_BITS_PER_CHAR	10
-#define GENI_UART_CONS_PORTS	1
-#define GENI_UART_PORTS		3
-#define DEF_FIFO_DEPTH_WORDS	16
-#define DEF_TX_WM		2
-#define DEF_FIFO_WIDTH_BITS	32
-#define UART_RX_WM		2
+#define UART_START_READ			0x1
+
+#define UART_OVERSAMPLING		32
+#define STALE_TIMEOUT			16
+#define DEFAULT_BITS_PER_CHAR		10
+#define GENI_UART_CONS_PORTS		1
+#define GENI_UART_PORTS			3
+#define DEF_FIFO_DEPTH_WORDS		16
+#define DEF_TX_WM			2
+#define DEF_FIFO_WIDTH_BITS		32
+#define UART_RX_WM			2
 
 /* SE_UART_LOOPBACK_CFG */
-#define RX_TX_SORTED	BIT(0)
-#define CTS_RTS_SORTED	BIT(1)
-#define RX_TX_CTS_RTS_SORTED	(RX_TX_SORTED | CTS_RTS_SORTED)
+#define RX_TX_SORTED			BIT(0)
+#define CTS_RTS_SORTED			BIT(1)
+#define RX_TX_CTS_RTS_SORTED		(RX_TX_SORTED | CTS_RTS_SORTED)
 
 /* UART pin swap value */
-#define DEFAULT_IO_MACRO_IO0_IO1_MASK		GENMASK(3, 0)
+#define DEFAULT_IO_MACRO_IO0_IO1_MASK	GENMASK(3, 0)
 #define IO_MACRO_IO0_SEL		0x3
-#define DEFAULT_IO_MACRO_IO2_IO3_MASK		GENMASK(15, 4)
+#define DEFAULT_IO_MACRO_IO2_IO3_MASK	GENMASK(15, 4)
 #define IO_MACRO_IO2_IO3_SWAP		0x4640
 
 /* We always configure 4 bytes per FIFO word */
-- 
2.37.2

