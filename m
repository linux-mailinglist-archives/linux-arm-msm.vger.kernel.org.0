Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58E8E68CCD5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 03:49:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbjBGCtb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 21:49:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbjBGCtY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 21:49:24 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5296434C3C
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 18:48:56 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id i2so858174ple.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 18:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHOxy0yjbuzT3CsBPRlqzRmrlyQ1Ah6MquxggTwVj5Y=;
        b=a5aCRZAFkj1OvRq3aqzQYp5C/iomdSqyPvH0qs3MIsi9GhYOKB1JCv8ovy4qRDbgFV
         PGEk4cw3cimKms0el816jGpQXBeI6qKZVKnPCX5ZatMXnvu9gpulLU3CUulpZZE8fwPd
         Yr1iSkY2FUYdtvnLvlTM1qr4Al/kx3d7Nj2z0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mHOxy0yjbuzT3CsBPRlqzRmrlyQ1Ah6MquxggTwVj5Y=;
        b=GbV4Cy/4Gfp3ISrz9uF+It/yEEWONV2Zh+3GAmPjRk9/L00ZkyNr1SiKmRR7iX4cBX
         sODZ/JKBlS3RFDLZfYVJkrrSepdaBz1uFxLPI56alPk5qvQj2FTFIlyKx/mTAeNoGgph
         ES/lTV8v27B4/Yj6BE1oz9eyzosJpdusC+8/nicjxx6roMO8VVCggt0gP5pNzIksqn78
         mAdxf1+3SzPCL3B6BkIQcv/n534PZ81+oQ54Rwkj1gT0sHzUkrmJH3Y5aqXN/qWLrKb9
         r18l4GR/IKWnSJRZnBrSyGm+Z1awHRs6r7vHENNMtc04FYFROztLBEsheGBXJ+qGN47O
         snNg==
X-Gm-Message-State: AO0yUKXzDES0M5Danq4poeKj2V+abZBTKiSIAfoQqBvdNjQ8mCv1WYLm
        vMdxTsNZxt5jMFZDJsBgowsrlg==
X-Google-Smtp-Source: AK7set+8Sx7+L05dQMtdW2yFX45Ga3BJe5QCG6gLFIc5l5Bhsxug8kSss0eC4tBn0Yh5xUGdwZeSpA==
X-Received: by 2002:a17:902:dac6:b0:196:59a0:bffe with SMTP id q6-20020a170902dac600b0019659a0bffemr1485572plx.17.1675738135842;
        Mon, 06 Feb 2023 18:48:55 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:29fb:a635:f0df:f45a])
        by smtp.gmail.com with ESMTPSA id s17-20020a63a311000000b0045dc85c4a5fsm6882430pge.44.2023.02.06.18.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 18:48:55 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org, Stephen Kitt <steve@sk2.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] HID: i2c-hid: goodix: Add mainboard-vddio-supply
Date:   Mon,  6 Feb 2023 18:48:15 -0800
Message-Id: <20230206184744.6.Ic234b931025d1f920ce9e06fff294643943a65ad@changeid>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
In-Reply-To: <20230207024816.525938-1-dianders@chromium.org>
References: <20230207024816.525938-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As talked about in the patch ("dt-bindings: HID: i2c-hid: goodix: Add
mainboard-vddio-supply") we may need to power up a 1.8V rail on the
host associated with touchscreen IO. Let's add support in the driver
for it.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Unfortunately, I haven't been able to actually test this on real
hardware yet. However, the change is very simple, I believe it is
correct, and it doesn't break other boards I've tested it on.

 drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
index 584d833dc0aa..0060e3dcd775 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
@@ -26,6 +26,7 @@ struct i2c_hid_of_goodix {
 	struct i2chid_ops ops;
 
 	struct regulator *vdd;
+	struct regulator *vddio;
 	struct gpio_desc *reset_gpio;
 	const struct goodix_i2c_hid_timing_data *timings;
 };
@@ -40,6 +41,10 @@ static int goodix_i2c_hid_power_up(struct i2chid_ops *ops)
 	if (ret)
 		return ret;
 
+	ret = regulator_enable(ihid_goodix->vddio);
+	if (ret)
+		return ret;
+
 	if (ihid_goodix->timings->post_power_delay_ms)
 		msleep(ihid_goodix->timings->post_power_delay_ms);
 
@@ -56,6 +61,7 @@ static void goodix_i2c_hid_power_down(struct i2chid_ops *ops)
 		container_of(ops, struct i2c_hid_of_goodix, ops);
 
 	gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
+	regulator_disable(ihid_goodix->vddio);
 	regulator_disable(ihid_goodix->vdd);
 }
 
@@ -81,6 +87,10 @@ static int i2c_hid_of_goodix_probe(struct i2c_client *client)
 	if (IS_ERR(ihid_goodix->vdd))
 		return PTR_ERR(ihid_goodix->vdd);
 
+	ihid_goodix->vddio = devm_regulator_get(&client->dev, "mainboard-vddio");
+	if (IS_ERR(ihid_goodix->vddio))
+		return PTR_ERR(ihid_goodix->vddio);
+
 	ihid_goodix->timings = device_get_match_data(&client->dev);
 
 	return i2c_hid_core_probe(client, &ihid_goodix->ops, 0x0001, 0);
-- 
2.39.1.519.gcb327c4b5f-goog

