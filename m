Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7B233AE451
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 09:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbhFUHoY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 03:44:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230161AbhFUHoW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 03:44:22 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D458BC061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 00:42:00 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id e33so13468126pgm.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 00:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PcRAvrQip+1WJuNclasUdgOdAuaWVTSb28lQVa+Hq0U=;
        b=PW1xTA2/2xO4PqExn5V1DOomUzRaLUlMK7VPvDZAnglAjgj3HF0HR4tTvM1Jyq4Xo/
         lbz8+BPcBz3r6RVcMPnk5m2CUnlfe6Y1yZGbO3GZ9ucEhXHnuWrpQe9DBX2P9BN4xpy/
         k0U3/0P/720ja+nHXJ775gb7N3AE3nuCG4Z3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PcRAvrQip+1WJuNclasUdgOdAuaWVTSb28lQVa+Hq0U=;
        b=ZAdWvaL2MhEuhDCP4eJ4ZjNyeuWcA5Fu/h3yh/fuNd0BoWzQT66QxAbRby4j43XHam
         EBzi8YplsywqYLjRdVh6dj5c6SoTUtaZFXVGydvk2VzZE/hVhpK1NJ9nA6RBJuHiAssD
         cQLJL1ruMf2pVi60+V31ClLt/2ysb+4AVmKArvAbCxmfG34rQZfNlISTTXr4ON/nC3rE
         Ig240MHvT+KUqIzg9g4Su56BP+C66N1K1t3AakKWBGxXDhkKpH4rHDU2I5VNjg4F++fr
         aRn7JY0T5QHKVd5kCu3UPIzyEnCiSopktedO0URUujvxwVz/L2evIOU9TXuo+MPNw3Vj
         T2Qg==
X-Gm-Message-State: AOAM531cP3wyUTRQCTEzwWYN9I9pqiTmjlQwoPAwKntTssH+3EVKrro5
        SYDDa7XXUgDifqkb6JWOo8oTDQ==
X-Google-Smtp-Source: ABdhPJxkwpEFihejVk1nobo1GrlcMvMr+6qs8f9VpwqRVo8xZY9eo8LzrK9zu5A5PICZlxCe0KZu7w==
X-Received: by 2002:a63:e245:: with SMTP id y5mr22455461pgj.171.1624261320340;
        Mon, 21 Jun 2021 00:42:00 -0700 (PDT)
Received: from judyhsiao-p920.tpe.corp.google.com ([2401:fa00:1:10:5a92:9d6d:3875:d2ba])
        by smtp.gmail.com with ESMTPSA id 10sm11954195pfh.174.2021.06.21.00.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 00:41:59 -0700 (PDT)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     broonie@kernel.org
Cc:     Taniya Das <tdas@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>, dianders@chromium.org,
        dgreid@chromium.org, cychiang@google.com, judyhsiao@google.com,
        tzungbi@chromium.org, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, Judy Hsiao <judyhsiao@chromium.org>
Subject: [PATCH] ASoC: snd-soc-dummy: add Device Tree support
Date:   Mon, 21 Jun 2021 15:41:52 +0800
Message-Id: <20210621074152.306362-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Support for loading the snd-soc-dummy via DeviceTree.
This is useful to create dummy codec devices where we need to have some
DAI links without a real Codec.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---
 .../devicetree/bindings/sound/snd-soc-dummy.txt  | 16 ++++++++++++++++
 sound/soc/soc-utils.c                            | 11 +++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/snd-soc-dummy.txt

diff --git a/Documentation/devicetree/bindings/sound/snd-soc-dummy.txt b/Documentation/devicetree/bindings/sound/snd-soc-dummy.txt
new file mode 100644
index 000000000000..7fa8c5751e62
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/snd-soc-dummy.txt
@@ -0,0 +1,16 @@
+* snd-soc-dummy
+
+This node models the snd-soc-dummy.
+This is useful to create dummy codec devices where we need to have
+some DAI links without a real Codec.
+
+Required properties:
+- compatible   : "asoc,snd-soc-dummy"
+
+
+Example:
+
+dummy_codec {
+	compatible = "asoc,snd-soc-dummy";
+	#sound-dai-cells = <0>;
+};
diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index 299b5d6ebfd1..def2cc687415 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -7,6 +7,8 @@
 // Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
 //         Liam Girdwood <lrg@slimlogic.co.uk>
 
+#include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/export.h>
 #include <sound/core.h>
@@ -181,9 +183,18 @@ static int snd_soc_dummy_probe(struct platform_device *pdev)
 	return ret;
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id soc_dummy_device_id[] = {
+	{ .compatible = "asoc,snd-soc-dummy" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, soc_dummy_device_id);
+#endif
+
 static struct platform_driver soc_dummy_driver = {
 	.driver = {
 		.name = "snd-soc-dummy",
+		.of_match_table = of_match_ptr(soc_dummy_device_id),
 	},
 	.probe = snd_soc_dummy_probe,
 };
-- 
2.31.0

