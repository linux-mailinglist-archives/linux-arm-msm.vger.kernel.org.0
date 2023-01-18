Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A66BB671880
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 11:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjARKGn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 05:06:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbjARKFp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 05:05:45 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC8D49AA8A
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 01:11:25 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id v30so48708753edb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 01:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rxj8H9i6KU881UdYVe5EuzkuebPPKMfYy3OoIlcIPlo=;
        b=dWmh0YMYxSrOVOXK+zjy7pLmQl1T/LfLg5POOqaGuzfQ9lNmxmNFzK7dvggcMob2WD
         ZQGvVhW4wqgeIlL8BJ/q4mJld5gCFfUqTqy0Jb4l4OXk5ZdZd6mh7N0+bzuGid5Gncmp
         E4PfD7GFseFfokdUZhqdz8cdK6VLmdgAO/Z4IsHPzadoOlYMWOe8ooubA8b4dRq4BW+X
         qfQ8nBX8+EPCXXyaMnp4QeF6Cv9m5s/xjgMBDdhlI0xesJ7ELh7cArhdSaMMniftACVu
         ssroT+ItgGR8g+xh6rFdcbcaZZb1WRAkS7hrjGZQ57d07w35ijHgiL1E4pxZnhHRiKGi
         EfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rxj8H9i6KU881UdYVe5EuzkuebPPKMfYy3OoIlcIPlo=;
        b=R3elY4+ZmxoIADX0GlfbT5lFnw3h+5mzvw/7hwMKcTGLRa1cosppzb+XpK0hYBzEp8
         /RNbhEFy3vD/sUvgnYRYebjoj6aB5SewY6/jwmfQeyxhrMA3vkTdcTOYMBjMd2gbYudn
         jELc6H4EVeIAYbvNssE8mAUJ5/lCgPnbmmFKDK4hZq136CiGNvt77NgAxy9+xYJ0l66O
         dPim2NjUUfNx7Ol7CbIV1gqhhBN6ScovmRY9pyDAjF7TqLxT19SdJu1T0oioLFsvoRIN
         lrDUf7d/pVm3ynSx6aJ5WfDIasK78ydKzOzu2LbFlMsHXeygF629TxWX7OJeqVPfqV9t
         Dtzg==
X-Gm-Message-State: AFqh2kqrL1xT+P0Kp79ZzzbxtWiAP2OfIczspr1HjpgqTyh0dnFE0rKK
        GV6ptQtBh3olYXT3SbwLTUzOSg==
X-Google-Smtp-Source: AMrXdXtvoL53wkIUnF8UzSZrQYnm9HUXrGhkxlLLOQu28WT+LxxHrhTjPDP6hpjmiR9pH0jodeCpkw==
X-Received: by 2002:a05:6402:1c84:b0:49c:d353:8237 with SMTP id cy4-20020a0564021c8400b0049cd3538237mr5684389edb.42.1674033084089;
        Wed, 18 Jan 2023 01:11:24 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906059100b007c16f120aacsm14213624ejn.121.2023.01.18.01.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 01:11:23 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: [RESEND PATCH] of: property: do not create clocks device link for clock controllers
Date:   Wed, 18 Jan 2023 11:11:22 +0200
Message-Id: <20230118091122.2205452-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

Do not create device link for clock controllers. Some of the clocks
provided to the device via OF can be the clocks that are just parents to
the clocks provided by this clock controller. Clock subsystem already
has support for handling missing clock parents correctly (clock
orphans). Later when the parent clock is registered, clocks get
populated properly.

An example of the system where this matters is the SDM8450 MTP board
(see arch/arm64/boot/dts/qcom/sdm845-mtp.dts). Here the dispcc uses
clocks provided by dsi0_phy and dsi1_phy device tree nodes. However the
dispcc itself provides clocks to both PHYs, to the PHY parent device,
etc. With just dsi0_phy in place devlink is able to break the
dependency, but with two PHYs, dispcc doesn't get probed at all, thus
breaking display support.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

This patch has been posted a year ago in January 2022 ([1]). Since that time
Saravana failed to produce patches to assist in debugging the issue
([2]) or to fix the issue ([3]). The issue we observe has been described
by Abel at ([4]). As we work on adding support for Dual DSI
configurations, the issue becomes more and more important, since binding
the whole display subsystem fails.

Currently the qcom/sdm845-mtp board is already broken and I've just
posted a patch adding Dual DSI variant for the qcom/sdm845-db845c board
([5]).

[1] https://lore.kernel.org/lkml/20211125183622.597177-1-dmitry.baryshkov@linaro.org/
[2] https://lore.kernel.org/lkml/CAA8EJpqELXvRMPWJdTLCURjwkcMxyPDPj1tVZPkdOT_JVQb4-w@mail.gmail.com/
[3] https://lore.kernel.org/all/CAGETcx8F0wP+RA0KpjOJeZfc=DVG-MbM_=SkRHD4UhD2ReL7Kw@mail.gmail.com/
[4] https://lore.kernel.org/all/YrsdLQrOtg1qdaoE@linaro.org/
[5] https://lore.kernel.org/all/20230118082048.2198715-1-dmitry.baryshkov@linaro.org/

---
 drivers/of/property.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 134cfc980b70..d323bf26a613 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1297,7 +1297,6 @@ struct supplier_bindings {
 	bool node_not_dev;
 };
 
-DEFINE_SIMPLE_PROP(clocks, "clocks", "#clock-cells")
 DEFINE_SIMPLE_PROP(interconnects, "interconnects", "#interconnect-cells")
 DEFINE_SIMPLE_PROP(iommus, "iommus", "#iommu-cells")
 DEFINE_SIMPLE_PROP(mboxes, "mboxes", "#mbox-cells")
@@ -1327,6 +1326,21 @@ DEFINE_SIMPLE_PROP(backlight, "backlight", NULL)
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 
+static struct device_node *parse_clocks(struct device_node *np,
+					const char *prop_name, int index)
+{
+	/*
+	 * Do not create clock-related device links for clocks controllers,
+	 * clock orphans will handle missing clock parents automatically.
+	 */
+	if (!strcmp(prop_name, "clocks") &&
+	    of_find_property(np, "#clock-cells", NULL))
+		return NULL;
+
+	return parse_prop_cells(np, prop_name, index, "clocks",
+				       "#clock-cells");
+}
+
 static struct device_node *parse_gpios(struct device_node *np,
 				       const char *prop_name, int index)
 {
-- 
2.39.0

