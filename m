Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7B172734E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 23:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727593AbgIUV1n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 17:27:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbgIUV1n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 17:27:43 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 703EBC0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 14:27:43 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id v14so422936pjd.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 14:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u8FVHsVgYrbb7FNSvCdJbBQEsePOhdNqr2E1JPJWIsg=;
        b=RVD73UM5+I5emYaN/zPzfNXAxYjQhCBOCBZ2iAXfs2XDpivTEbB6Rm4XWxc7eWxy5T
         NSwASDsrqr2WK/kLu1qyEahPr6zRRiu70dbAIReBJkgUcUyiuzEnjmLTTWdUHbF6nS9X
         m2dxXhhVvaGZiP7M9w1KwnpnXzcKEubDJyhFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u8FVHsVgYrbb7FNSvCdJbBQEsePOhdNqr2E1JPJWIsg=;
        b=eiRP88E/ajJ7Zsr0e94pt678yE4Zo0ZNWLpKkypFxvbmQkK2PljTbodAortPmLtebx
         yJJpIjnURBaZMqPtVIahWPu4mc8hgS0yUzOa4XeS8yITN4e/nCXnUiQ08MytiJSLON1b
         LZCPbzhzr355dvB2r8oq1ntK3lOq/dHSM8FS6dOMqJSqNXnUtjfUlLqBWb4pH/xBfyBe
         dMrEvd/Qd1WqoL6P8zQ64OvDLqflMq/LRnlBysf5inirsw/RSJpEZhNA9tzhFBlQV0eK
         pSCz6ZmIUkU/zrAd5ICOuXdeOWlLP6o0GzRzw/SRxPfcsomQ/kjqnA2hUe9wr3JnYUvM
         o9cw==
X-Gm-Message-State: AOAM5316YYQ8AOVcM5hpwe23hsrBQw9GwD8f+frOAOkyLKYUkIKHRqNe
        snwhhcXiJYlAVudYCWODdfAmRg==
X-Google-Smtp-Source: ABdhPJyZqGcsxAk9c1aY0WwbIYpkPWfgS+3zQvKdBBovpoVlQJyAJUgoWZYy820x7RBFhBGjAkcKFA==
X-Received: by 2002:a17:90b:3241:: with SMTP id jy1mr1136122pjb.10.1600723662701;
        Mon, 21 Sep 2020 14:27:42 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id x62sm3865659pfx.20.2020.09.21.14.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 14:27:42 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, akashast@codeaurora.org,
        swboyd@chromium.org, Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] arm64: dts: qcom: sc7180: Provide pinconf for SPI to use GPIO for CS
Date:   Mon, 21 Sep 2020 14:27:16 -0700
Message-Id: <20200921142655.v3.1.I997a428f58ef9d48b37a27a028360f34e66c00ec@changeid>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When the chip select line is controlled by the QUP, changing CS is a
time consuming operation.  We have to send a command over to the geni
and wait for it to Ack us every time we want to change (both making it
high and low).  To send this command we have to make a choice in
software when we want to control the chip select, we have to either:
A) Wait for the Ack via interrupt which slows down all SPI transfers
   (and incurrs extra processing associated with interrupts).
B) Sit in a loop and poll, waiting for the Ack.

Neither A) nor B) is a great option.

We can avoid all of this by realizing that, at least on some boards,
there is no advantage of considering this line to be a geni line.
While it's true that geni _can_ control the line, it's also true that
the line can be a GPIO and there is no downside of viewing it that
way.  Setting a GPIO is a simple MMIO operation.

This patch provides definitions so a board can easily select the GPIO
mode.

NOTE: apparently, it's possible to run the geni in "GSI" mode.  In GSI
the SPI port is allowed to be controlled by more than one user (like
firmware and Linux) and also the port can operate sequences of
operations in one go.  In GSI mode it _would_ be invalid to look at
the chip select as a GPIO because that would prevent other users from
using it.  In theory GSI mode would also avoid some overhead by
allowing us to sequence the chip select better.  However, I'll argue
GSI is not relevant for all boards (and certainly not any boards
supported by mainline today).  Why?
- Apparently to run a SPI chip in GSI mode you need to initialize it
  (in the bootloader) with a different firmware and then it will
  always run in GSI mode.  Since there is no support for GSI mode in
  the current Linux driver, it must be that existing boards don't have
  firmware that's doing that.  Note that the kernel device tree
  describes hardware but also firmware, so it is legitimate to make
  the assumption that we don't have GSI firmware in a given dts file.
- Some boards with sc7180 have SPI connected to the Chrome OS EC or
  security chip (Cr50).  The protocols for talking to cros_ec and cr50
  are extremely complex.  Both drivers in Linux fully lock the bus
  across several distinct SPI transfers.  While I am not an expert on
  GSI mode it feels highly unlikely to me that we'd ever be able to
  enable GSI mode for these devices.

From a testing perspective, running "flashrom -p ec -r /tmp/foo.bin"
in a loop after this patch shows almost no reduction in time, but the
number of interrupts per command goes from 32357 down to 30611 (about
a 5% reduction).

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

Changes in v3:
- Add a blank line between pinmux and pinconf.

Changes in v2:
- Now just add the pinctrl; let a board use it.

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 104 +++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 6678f1e8e395..73b1c17cfe7c 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1595,6 +1595,19 @@ pinmux {
 				};
 			};
 
+			qup_spi0_cs_gpio: qup-spi0-cs-gpio {
+				pinmux {
+					pins = "gpio34", "gpio35",
+					       "gpio36";
+					function = "qup00";
+				};
+
+				pinmux-cs {
+					pins = "gpio37";
+					function = "gpio";
+				};
+			};
+
 			qup_spi1_default: qup-spi1-default {
 				pinmux {
 					pins = "gpio0", "gpio1",
@@ -1603,6 +1616,19 @@ pinmux {
 				};
 			};
 
+			qup_spi1_cs_gpio: qup-spi1-cs-gpio {
+				pinmux {
+					pins = "gpio0", "gpio1",
+					       "gpio2";
+					function = "qup01";
+				};
+
+				pinmux-cs {
+					pins = "gpio3";
+					function = "gpio";
+				};
+			};
+
 			qup_spi3_default: qup-spi3-default {
 				pinmux {
 					pins = "gpio38", "gpio39",
@@ -1611,6 +1637,19 @@ pinmux {
 				};
 			};
 
+			qup_spi3_cs_gpio: qup-spi3-cs-gpio {
+				pinmux {
+					pins = "gpio38", "gpio39",
+					       "gpio40";
+					function = "qup03";
+				};
+
+				pinmux-cs {
+					pins = "gpio41";
+					function = "gpio";
+				};
+			};
+
 			qup_spi5_default: qup-spi5-default {
 				pinmux {
 					pins = "gpio25", "gpio26",
@@ -1619,6 +1658,19 @@ pinmux {
 				};
 			};
 
+			qup_spi5_cs_gpio: qup-spi5-cs-gpio {
+				pinmux {
+					pins = "gpio25", "gpio26",
+					       "gpio27";
+					function = "qup05";
+				};
+
+				pinmux-cs {
+					pins = "gpio28";
+					function = "gpio";
+				};
+			};
+
 			qup_spi6_default: qup-spi6-default {
 				pinmux {
 					pins = "gpio59", "gpio60",
@@ -1627,6 +1679,19 @@ pinmux {
 				};
 			};
 
+			qup_spi6_cs_gpio: qup-spi6-cs-gpio {
+				pinmux {
+					pins = "gpio59", "gpio60",
+					       "gpio61";
+					function = "qup10";
+				};
+
+				pinmux-cs {
+					pins = "gpio62";
+					function = "gpio";
+				};
+			};
+
 			qup_spi8_default: qup-spi8-default {
 				pinmux {
 					pins = "gpio42", "gpio43",
@@ -1635,6 +1700,19 @@ pinmux {
 				};
 			};
 
+			qup_spi8_cs_gpio: qup-spi8-cs-gpio {
+				pinmux {
+					pins = "gpio42", "gpio43",
+					       "gpio44";
+					function = "qup12";
+				};
+
+				pinmux-cs {
+					pins = "gpio45";
+					function = "gpio";
+				};
+			};
+
 			qup_spi10_default: qup-spi10-default {
 				pinmux {
 					pins = "gpio86", "gpio87",
@@ -1643,6 +1721,19 @@ pinmux {
 				};
 			};
 
+			qup_spi10_cs_gpio: qup-spi10-cs-gpio {
+				pinmux {
+					pins = "gpio86", "gpio87",
+					       "gpio88";
+					function = "qup14";
+				};
+
+				pinmux-cs {
+					pins = "gpio89";
+					function = "gpio";
+				};
+			};
+
 			qup_spi11_default: qup-spi11-default {
 				pinmux {
 					pins = "gpio53", "gpio54",
@@ -1651,6 +1742,19 @@ pinmux {
 				};
 			};
 
+			qup_spi11_cs_gpio: qup-spi11-cs-gpio {
+				pinmux {
+					pins = "gpio53", "gpio54",
+					       "gpio55";
+					function = "qup15";
+				};
+
+				pinmux-cs {
+					pins = "gpio56";
+					function = "gpio";
+				};
+			};
+
 			qup_uart0_default: qup-uart0-default {
 				pinmux {
 					pins = "gpio34", "gpio35",
-- 
2.28.0.681.g6f77f65b4e-goog

