Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D78C68F6F4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 19:34:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231904AbjBHSeu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 13:34:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231911AbjBHSeo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 13:34:44 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D818526CF1
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 10:34:39 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id bu23so1859781wrb.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 10:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RIRS8quKmcuI5WlR3ZOR9P7J9hL8JDRcRIT95B2/tw=;
        b=uDbg+nT7iNBwoXs559bUW3YIhC8/6i7JfWB+EdU4RUJh3KMutF5knCidtqDjorHKKN
         aGxYhI4xg2uYR1DSgscNPlXMc3N1pa8KW7U85hYO2iAH5pqGuIWchD0VZXC1bb7bFsPR
         vR2X4E6kaD72/dWQzraU7aet1nWX1ePCJ0uluRZYeCoRvBTPyQoX77/8V29M1ycovVvO
         52VIJsW5ANosBFQT+OU3Sa5pw3eE6SgKIvPqS3Kuts1GfDK/x+fh4VM9SxtO50wy4Onm
         CZZi9oKOi8RE2X7JsQGcva8ALPhfaWkS1JCTVYtRgynkJV7DBODPksog7mxePyD4aGuB
         N7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RIRS8quKmcuI5WlR3ZOR9P7J9hL8JDRcRIT95B2/tw=;
        b=muWHesFVvC7iuKCO9AE3BByMnyc8ivAMCauxgCIGa0nw9AG6MSrwSNIxweZCQExPtl
         P3Mxy68AHsgzcgzUNaKYZYoOehxJuudpD2xhbKZ3QyALyU9rZXEr5gQIUL8SLCRUX02z
         X44FzoceROB1JU+BDhYMvqx1xW2SkDiunF3aWoK4gu5ukczkPQrGRBgw2gKJjDfAZlCW
         b/PY7oD4c1AkHqGeqynzwlkzFR4j8oSBD1J675KVRuyC5N5eDkkk5SBBiCMq+A39I89g
         NwmGt32jgjERO0evzUUAq9vP8Ks2+xpjKn/AXDt+NkV495fygkPLOlZmgakTzImtLKxK
         LXbQ==
X-Gm-Message-State: AO0yUKVehMWxqLPoXuqCkBV+8bEGdh1tVxYjZ0jLPt1g3w29rVcbpKv7
        /uCiR7OefardwvvSpEwGGXoaqAar9R3bhauT
X-Google-Smtp-Source: AK7set+SFfGid0f6zHeiKIhNJ9ePxJlcXfKM1DYwCfErJTVdUkc4Md/L9M3Yc/zaRI6ujIu1B2DgWA==
X-Received: by 2002:adf:df89:0:b0:2bf:95c0:6b30 with SMTP id z9-20020adfdf89000000b002bf95c06b30mr2465348wrl.31.1675881278417;
        Wed, 08 Feb 2023 10:34:38 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v1-20020adf8b41000000b002be505ab59asm14591304wra.97.2023.02.08.10.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 10:34:37 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan+linaro@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-phy@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v6 3/6] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Document SM8550 compatible
Date:   Wed,  8 Feb 2023 20:34:18 +0200
Message-Id: <20230208183421.2874423-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208183421.2874423-1-abel.vesa@linaro.org>
References: <20230208183421.2874423-1-abel.vesa@linaro.org>
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

Add the SM8550 compatible to the list.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
---

The v5 version of this patch was here:
https://lore.kernel.org/all/20230207114024.944314-4-abel.vesa@linaro.org/

Changes since v5:
 * none

Changes since v4:
 * added Johan's R-b tag
 * changed qcom,qmp-usb to qcom,sc8280xp-qmp-usb43dp in subject line

Changes since v3:
 * added Rob's A-b tag

Changes since v2:
 * none

Changes since v1:
 * moved to sc8280xp bindings

 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 0764cd977e76..83944959d394 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - qcom,sc8280xp-qmp-usb43dp-phy
       - qcom,sm6350-qmp-usb3-dp-phy
+      - qcom,sm8550-qmp-usb3-dp-phy
 
   reg:
     maxItems: 1
-- 
2.34.1

