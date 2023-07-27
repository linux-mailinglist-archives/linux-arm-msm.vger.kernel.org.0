Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 941847659EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 19:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232747AbjG0RTB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 13:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232412AbjG0RSs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 13:18:48 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02BCE30F9
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 10:18:40 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-686f0d66652so1078277b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 10:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690478319; x=1691083119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+sJqO38e2gNSysz3Tl3WNQ34X1K+Pprq+XQpM/wPpA=;
        b=XR79+iJg38TdqRqVksssPvqJCfRVppUDJ0SCoIzYZz9E7npJ3QbCrYBR0YtCH1Iwpz
         bh8ddXSBmExnRlwhNEaqyewsrL8WmSIwwp8P2pEYNXLOnclbvGHTfebTxUYiViXnkb3Q
         cJhn2pL+oUoG+Carw6pl4TGtM19+hj0XsDhTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690478319; x=1691083119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+sJqO38e2gNSysz3Tl3WNQ34X1K+Pprq+XQpM/wPpA=;
        b=BoS8jCbq8/edp2AVT0Y0awasth6KDywP4K1G/TRsPadwgA7GMZgXj9IZ88ZzNR7IeG
         djO5+s0NOL+VZbovyAhXQDmuQZW+ZqCQLz2Ip6Q3kZ+4E94KIMWq870Ktm1yU+nqW1oy
         yTUVlUDrhW57B+mxMSrm2oQOoId6r56PFgbKEnVwU0sAYNC5ZN2WAKv9/e+BGy11S18I
         CL3Tgn+KVjS05xKEAiCIpAZ6A8JaHjrQ3tOZjRsE0qkiWk9L2L+5cJhiHi06jSx8SAu0
         QNO8YADLBC0yapGHX2Ezj2gpY0Fr8GPbrifM5zSBNDA4MfnIZPe9EPF2LkLoOLWs6y7n
         i6MA==
X-Gm-Message-State: ABy/qLZAdyG696UCJL0d7gnlyKuesdViPHK9cdTl25VtQ5dEwIJODTzB
        2NaphppG7+vCHBFqbb8pe/L6jg==
X-Google-Smtp-Source: APBJJlEtdcPHvIy7yXOPJnhlhZ0fZ1vrgQ0KPFYytG6arm/TebgKO/M3EPsrsa35yfXcgeHGVYzcKw==
X-Received: by 2002:a05:6a21:6d88:b0:134:4f86:7966 with SMTP id wl8-20020a056a216d8800b001344f867966mr7749482pzb.9.1690478319489;
        Thu, 27 Jul 2023 10:18:39 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:2339:954b:b98f:611a])
        by smtp.gmail.com with ESMTPSA id 17-20020aa79111000000b0064f76992905sm1702524pfh.202.2023.07.27.10.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 10:18:38 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     linux-arm-msm@vger.kernel.org,
        yangcong5@huaqin.corp-partner.google.com,
        devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        hsinyi@google.com, Chris Morgan <macroalpha82@gmail.com>,
        linux-input@vger.kernel.org, cros-qcom-dts-watchers@chromium.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 04/11] of: property: fw_devlink: Add a devlink for panel followers
Date:   Thu, 27 Jul 2023 10:16:31 -0700
Message-ID: <20230727101636.v4.4.Ibf8e1342b5b7906279db2365aca45e6253857bb3@changeid>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
In-Reply-To: <20230727171750.633410-1-dianders@chromium.org>
References: <20230727171750.633410-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Inform fw_devlink of the fact that a panel follower (like a
touchscreen) is effectively a consumer of the panel from the purposes
of fw_devlink.

NOTE: this patch isn't required for correctness but instead optimizes
probe order / helps avoid deferrals.

Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Since this is so small, I'd presume it's OK for it to go through a DRM
tree with the proper Ack. That being said, this patch is just an
optimization and thus it could land completely separately from the
rest and they could all meet up in mainline.

(no changes since v2)

Changes in v2:
- ("Add a devlink for panel followers") new for v2.

 drivers/of/property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index ddc75cd50825..cf8dacf3e3b8 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1266,6 +1266,7 @@ DEFINE_SIMPLE_PROP(pwms, "pwms", "#pwm-cells")
 DEFINE_SIMPLE_PROP(resets, "resets", "#reset-cells")
 DEFINE_SIMPLE_PROP(leds, "leds", NULL)
 DEFINE_SIMPLE_PROP(backlight, "backlight", NULL)
+DEFINE_SIMPLE_PROP(panel, "panel", NULL)
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 
@@ -1354,6 +1355,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_resets, },
 	{ .parse_prop = parse_leds, },
 	{ .parse_prop = parse_backlight, },
+	{ .parse_prop = parse_panel, },
 	{ .parse_prop = parse_gpio_compat, },
 	{ .parse_prop = parse_interrupts, },
 	{ .parse_prop = parse_regulators, },
-- 
2.41.0.487.g6d72f3e995-goog

