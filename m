Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 467F666D206
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jan 2023 23:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234634AbjAPWwc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 17:52:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233976AbjAPWw0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 17:52:26 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30DCC2658E
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 14:52:25 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id h16so28822617wrz.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 14:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Svkhj0q099C0FoiRDtRciP7InWwLuxVC/46qIXiovr8=;
        b=Gy+avgLG+P9k57jRvfeRfBrO68shrWo0WU9kEl9VIjNz09vvI89ZCkxMzfu3yFjOQ8
         JT1fqaMcjc1lX5xvxn8tOVvnjE/+7+WWKVM8Pb3ckh5N+Iq37KWDHOkGocyOvGkkFas1
         HxzN1kUZauvgvBcZjdVhxMJMoyQ2s1Ra53l4nZgBTfCvW9BaNGyEdHsioLIDIaTsTJRF
         A+1TXLfAxQ+cb0Z5HJqWH/YWyxxFnPtaw8W8ndU8oBpM0CBmW3+RonAjJjgs7CieCAH+
         1cvyBXXbD2oWBktpAfCxoC71fArxJsARswn7LSwM9BLActgzmi5tgb9rFQ36bbXBvcva
         vhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Svkhj0q099C0FoiRDtRciP7InWwLuxVC/46qIXiovr8=;
        b=bRDvShRbaEnos3J4GPH3VKXwxjzgQwDB08HRZs/m8Meedn0717fhUyG03GPBrLi3aB
         0pwx9X+Kv6eTMm2q6wuuzwPW9InDKz4t2BMRfjl0ZeUB2sdvhhX3EQbR3XhRFkkOk+kQ
         gUBcXd1RJnFegeEu2IcN5MLY+KqKnZ1EYqucReULMMe4K66qyuFGspybl7jzF3JRdfuJ
         TUYU0lgQgZtgLqltNAMZB5GZczN1wtjv6nV4prppiUMF2VRC2qVz7P4JrDXEvvyeraJ4
         20AJ1iOxyGbPQj+CTS5iIt+DBJ5UxWrwMalTuXs2Qcl9e8Qjx7iqd1szgjv8AA5aSJqq
         k9rA==
X-Gm-Message-State: AFqh2koZLf3fSz0JhsDJfGiRPFsQfsMKZRzsg2WlFNsR9OEoiUGq+/sv
        HdsRFSPILfr3DBBFsEfuQhtVpVuF/55ZHgff
X-Google-Smtp-Source: AMrXdXvUKlFppTep+nHcqzlcDeqCrJhyvFf3zYNb7MinJOl9BZPcHL2Wubs4TDUvKhrf5jY/iTKVNg==
X-Received: by 2002:a05:6000:689:b0:2bd:ffad:1bce with SMTP id bo9-20020a056000068900b002bdffad1bcemr982441wrb.59.1673909543565;
        Mon, 16 Jan 2023 14:52:23 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id q15-20020adfab0f000000b002bde7999cd6sm9247880wrc.61.2023.01.16.14.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 14:52:23 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org, dianders@chromium.org,
        david@ixit.cz, krzysztof.kozlowski+dt@linaro.org,
        swboyd@chromium.org, konrad.dybcio@somainline.org,
        agross@kernel.org, andersson@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v8 3/3] dt-bindings: msm: dsi-controller-main: Add vdd* descriptions back in
Date:   Mon, 16 Jan 2023 22:52:17 +0000
Message-Id: <20230116225217.1056258-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230116225217.1056258-1-bryan.odonoghue@linaro.org>
References: <20230116225217.1056258-1-bryan.odonoghue@linaro.org>
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

When converting from .txt to .yaml we didn't include descriptions for the
existing regulator supplies.

- vdd
- vdda
- vddio

Add those descriptions into the yaml now as they were prior to the
conversion. In the .txt description we marked these regulators as required,
however, that requirement appears to have been in error.

Taking the example of sc7180-trogdor-wormdingler.dtsi. The avdd and avee
come from GPIO controlled external regulators, not the SoC and in this case
there's no need for vddio to power an I/O bus. Similarly the regulators for
the LCD are controlled by the panel driver not by the dsi-ctrl driver.

It would be possible to connect a different type of panel to the DSI bus
here in which case we may or may not want to make use of vdd, vdda or
vddio.

This is also the case for older chipsets like apq8064, msm8916 etc the vdd*
regulators in the dsi-ctrl block are helpers not dependencies.

Add the description of vdd, vdda and vddio back in for the existing
upstream dts where vdd, vdda or vddio are already declared but, don't
declare those regulators required - they are not SoC requirements.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 47faf08a37443..7b849c8f119a7 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -147,6 +147,18 @@ properties:
       - port@0
       - port@1
 
+  vdd-supply:
+    description:
+      VDD regulator
+
+  vddio-supply:
+    description:
+      VDD-IO regulator
+
+  vdda-supply:
+    description:
+      VDDA regulator
+
 required:
   - compatible
   - reg
-- 
2.38.1

