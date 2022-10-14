Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 878FE5FF304
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Oct 2022 19:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbiJNReA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Oct 2022 13:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbiJNRdv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Oct 2022 13:33:51 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1DC1D3A7A
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Oct 2022 10:33:48 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id o17-20020a17090aac1100b0020d98b0c0f4so7151456pjq.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Oct 2022 10:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s7n7kg5ZGrzZei7LkvZ2ZwEshWtc/pQnGnmVPojL5nQ=;
        b=QT5XLyUXl0mRsGaB+/xmM3SgDUqAP3vUIZ+ThDo8qYw47HcRJLBZ7E/mKkS66/yLld
         K26hk+unjIxki7txwSEiBfH8wyuDkD82j0HqRO+SO0zoJ+BngdyNCxpT3CH6EAPdumzy
         pqQk0Ay3OFdGjsZmt24K3l44Q7Kt0uetJzRVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7n7kg5ZGrzZei7LkvZ2ZwEshWtc/pQnGnmVPojL5nQ=;
        b=GDA0xQMB3jj8OMBXo7axjOMOT81G/OU//HRJRVevx8ReGsMDVZXPtiPMnSefDwPqr+
         lwNBVMejXr/qC3Xq5QZ3etUtV67HOdU0s0zRpHnJkXMUaz5YxkAukZT8UCMfIiHNySx5
         4jCEo37s8UuNDPG7qG6IXdW69U1eQn8kZaHMpxy+HM6vDDB+baNwOTPnHbULYYBnvk4b
         6w1LpcWgM7gQiVsOaWkxWQX7p8nqhtQ7+aEhbyTZk3eRojswao/AwNdWROm4+Nm9hAYi
         5MnrqapcUK68nHsrqRTsHoE9YON5X6Icezat+VmjSKQzZ+kDpIbWr6nNrzJa9yeD9azQ
         e0kg==
X-Gm-Message-State: ACrzQf1UsC7+PGt5V5DbIJrQgFkcYa/nvLWN1SgnjaDNokvvogN7hnz8
        GiPACVl6Qo4H4Wfy6fIedFyV0Q==
X-Google-Smtp-Source: AMsMyM733kp241N2Iyz0w8PsxxZSXlJAac4CMEtku6myzRSlE8JEJlHR7uZui1x87CBNPDqPXBkXDQ==
X-Received: by 2002:a17:90a:d390:b0:20d:3b10:3811 with SMTP id q16-20020a17090ad39000b0020d3b103811mr18681663pju.211.1665768827984;
        Fri, 14 Oct 2022 10:33:47 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:6288:98db:8dcf:b414])
        by smtp.gmail.com with ESMTPSA id a15-20020a1709027e4f00b0017f92246e4dsm1972125pln.181.2022.10.14.10.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 10:33:47 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: Avoid glitching lines when we first mux to output
Date:   Fri, 14 Oct 2022 10:33:18 -0700
Message-Id: <20221014103217.1.I656bb2c976ed626e5d37294eb252c1cf3be769dc@changeid>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Back in the description of commit e440e30e26dd ("arm64: dts: qcom:
sc7180: Avoid glitching SPI CS at bootup on trogdor") we described a
problem that we were seeing on trogdor devices. I'll re-summarize here
but you can also re-read the original commit.

On trogdor devices, the BIOS is setting up the SPI chip select as:
- mux special function (SPI chip select)
- output enable
- output low (unused because we've muxed as special function)

In the kernel, however, we've moved away from using the chip select
line as special function. Since the kernel wants to fully control the
chip select it's far more efficient to treat the line as a GPIO rather
than sending packet-like commands to the GENI firmware every time we
want the line to toggle.

When we transition from how the BIOS had the pin configured to how the
kernel has the pin configured we end up glitching the line. That's
because we _first_ change the mux of the line and then later set its
output. This glitch is bad and can confuse the device on the other end
of the line.

The old commit e440e30e26dd ("arm64: dts: qcom: sc7180: Avoid
glitching SPI CS at bootup on trogdor") fixed the glitch, though the
solution was far from elegant. It essentially did the thing that
everyone always hates: encoding a sequential program in device tree,
even if it's a simple one. It also, unfortunately, got broken by
commit b991f8c3622c ("pinctrl: core: Handling pinmux and pinconf
separately"). After that commit we did all the muxing _first_ even
though the config (set the pin to output high) was listed first. :(

I looked at ideas for how to solve this more properly. My first
thought was to use the "init" pinctrl state. In theory the "init"
pinctrl state is supposed to be exactly for achieving glitch-free
transitions. My dream would have been for the "init" pinctrl to do
nothing at all. That would let us delay the automatic pin muxing until
the driver could set things up and call pinctrl_init_done(). In other
words, my dream was:

  /* Request the GPIO; init it 1 (because DT says GPIO_ACTIVE_LOW) */
  devm_gpiod_get_index(dev, "cs", GPIOD_OUT_LOW);
  /* Output should be right, so we can remux, yay! */
  pinctrl_init_done(dev);

Unfortunately, it didn't work out. The primary reason is that the MSM
GPIO driver implements gpio_request_enable(). As documented in
pinmux.h, that function automatically remuxes a line as a GPIO. ...and
it does this remuxing _before_ specifying the output of the pin. You
can see in gpiod_get_index() that we call gpiod_request() before
gpiod_configure_flags(). gpiod_request() isn't passed any flags so it
has no idea what the eventual output will be.

We could have debates about whether or not the automatic remuxing to
GPIO for the MSM pinctrl was a good idea or not, but at this point I
think there is a plethora of code that's relying on it and I certainly
wouldn't suggest changing it.

Alternatively, we could try to come up with a way to pass the initial
output state to gpio_request_enable() and plumb all that through. That
seems like it would be doable, but we'd have to plumb it through
several layers in the stack.

This patch implements yet another alternative. Here, we specifically
avoid glitching the first time a pin is muxed to GPIO function if the
direction of the pin is output. The idea is that we can read the state
of the pin before we set the mux and make sure that the re-mux won't
change the state.

NOTES:
- We only do this the first time since later swaps between mux states
  might want to preserve the old output value. In other words, I
  wouldn't want to break a driver that did:
     gpiod_set_value(g, 1);
     pinctrl_select_state(pinctrl, special_state);
     pinctrl_select_default_state();
     /* We should be driving 1 even if "special_state" made the pin 0 */
- It's safe to do this the first time since the driver _couldn't_ have
  explicitly set a state. In order to even be able to control the GPIO
  (at least using gpiod) we have to have requested it which would have
  counted as the first mux.
- In theory, instead of keeping track of the first time a pin was set
  as a GPIO we could enable the glitch-free behavior only when
  msm_pinmux_request_gpio() is in the callchain. That works an enables
  my "dream" implementation above where we use an "init" state to
  solve this. However, it's nice not to have to do this. By handling
  just the first transition to GPIO we can simply let the normal
  "default" remuxing happen and we can be assured that there won't be
  a glitch.

Before this change I could see the glitch reported on the EC console
when booting. It would say this when booting the kernel:
  Unexpected state 1 in CSNRE ISR

After this change there is no error reported.

Note that I haven't reproduced the original problem described in
e440e30e26dd ("arm64: dts: qcom: sc7180: Avoid glitching SPI CS at
bootup on trogdor") but I could believe it might happen in certain
timing conditions.

Fixes: b991f8c3622c ("pinctrl: core: Handling pinmux and pinconf separately")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/pinctrl/qcom/pinctrl-msm.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index a2abfe987ab1..8bf8b21954fe 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -51,6 +51,7 @@
  *                  detection.
  * @skip_wake_irqs: Skip IRQs that are handled by wakeup interrupt controller
  * @disabled_for_mux: These IRQs were disabled because we muxed away.
+ * @ever_gpio:      This bit is set the first time we mux a pin to gpio_func.
  * @soc:            Reference to soc_data of platform specific data.
  * @regs:           Base addresses for the TLMM tiles.
  * @phys_base:      Physical base address
@@ -72,6 +73,7 @@ struct msm_pinctrl {
 	DECLARE_BITMAP(enabled_irqs, MAX_NR_GPIO);
 	DECLARE_BITMAP(skip_wake_irqs, MAX_NR_GPIO);
 	DECLARE_BITMAP(disabled_for_mux, MAX_NR_GPIO);
+	DECLARE_BITMAP(ever_gpio, MAX_NR_GPIO);
 
 	const struct msm_pinctrl_soc_data *soc;
 	void __iomem *regs[MAX_NR_TILES];
@@ -218,6 +220,25 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
 
 	val = msm_readl_ctl(pctrl, g);
 
+	/*
+	 * If this is the first time muxing to GPIO and the direction is
+	 * output, make sure that we're not going to be glitching the pin
+	 * by reading the current state of the pin and setting it as the
+	 * output.
+	 */
+	if (i == gpio_func && (val & BIT(g->oe_bit)) &&
+	    !test_and_set_bit(group, pctrl->ever_gpio)) {
+		u32 io_val = msm_readl_io(pctrl, g);
+
+		if (io_val & BIT(g->in_bit)) {
+			if (!(io_val & BIT(g->out_bit)))
+				msm_writel_io(io_val | BIT(g->out_bit), pctrl, g);
+		} else {
+			if (io_val & BIT(g->out_bit))
+				msm_writel_io(io_val & ~BIT(g->out_bit), pctrl, g);
+		}
+	}
+
 	if (egpio_func && i == egpio_func) {
 		if (val & BIT(g->egpio_present))
 			val &= ~BIT(g->egpio_enable);
-- 
2.38.0.413.g74048e4d9e-goog

