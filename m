Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A6747E301D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 23:44:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233501AbjKFWo4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 17:44:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233392AbjKFWoo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 17:44:44 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C594D73
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 14:44:31 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6c32a20d5dbso3971470b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 14:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699310670; x=1699915470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtIla5EbbYn7ksxcCnIGYzIT7sP4waGo4Xe+LkSJul0=;
        b=I+3E4D4uAw4sDrCR+Hzng0lg2b9iQelHjIZlh4r1bIG5QfDfsN8/uy9EZd2WsELD6b
         ZccTJJWRYG02daFWpEFNspzjY6dCN3PGEledRTmfcRdn2nDXYh4GIZpIGdFsxXaztoC+
         azTehmJUtMD3Xt79IUghcdxBqt056Evv31Pv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699310670; x=1699915470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtIla5EbbYn7ksxcCnIGYzIT7sP4waGo4Xe+LkSJul0=;
        b=L6IEi6PvGXXoMEo1ld/Fz+885LnMxBM2yEjBip9mDf0fzXuiSRavnKy4iEWUWAGNUu
         reK9XKPfosR5CKGK8ykJwmFp+B0v3p+fP2xcd/IZgxDFxiKe+z3OyePd21vM6Vt0l+oi
         xqboK2zDSPE6B28dzCeVeox10X4iFI6D+MJxmXkk9oVmIgUBCQZb4y2L4OdroKhgMpRW
         drz2u6ciiKp6c4nLj2xfWOilf2KJng0fAf6OXYz5aqCPjl/vREWgtpKlN97gJyrQhDjq
         nEttYwpDCy3iSaO6pAVyQbqT37/R/O5Tl7uPtf48G+VfoMHPXcPW6NW7KRg/crcmSFVy
         qlkg==
X-Gm-Message-State: AOJu0YyH0tNwOhXAO5+eL1gE8RQ1ZR46kaghgKHGORTBWIbWgj1pwDQg
        SNxSdv/gO1j9aHX1fQhftAsN8w==
X-Google-Smtp-Source: AGHT+IHhY66QtjpSz12CT+cwtmbPE2TaCgraRxWmFmABFrRaJm+7w2MEktS6cSaLQrf8qgGLBV3IPQ==
X-Received: by 2002:a05:6a00:2e29:b0:6bd:71e3:b647 with SMTP id fc41-20020a056a002e2900b006bd71e3b647mr28475394pfb.19.1699310669886;
        Mon, 06 Nov 2023 14:44:29 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:16a7:2c01:9126:36a4])
        by smtp.gmail.com with ESMTPSA id c10-20020a056a00248a00b006b725b2158bsm6043402pfv.41.2023.11.06.14.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 14:44:29 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     swboyd@chromium.org, linux-watchdog@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 9/9] dt-bindings: watchdog: qcom-wdt: Make the interrupt example edge triggered
Date:   Mon,  6 Nov 2023 14:43:36 -0800
Message-ID: <20231106144335.v2.9.Ie30c1d3f780666f6906fd2fd7c437632c229d987@changeid>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231106144335.v2.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
References: <20231106144335.v2.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
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

As described in the patch ("arm64: dts: qcom: sc7180: Make watchdog
bark interrupt edge triggered"), the Qualcomm watchdog timer's bark
interrupt should be configured as edge triggered.

Update the example in the bindings.

Fixes: 7c631cdff391 ("dt-bindings: watchdog: qcom-wdt: allow interrupts")
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 5046dfa55f13..681d1efbaf2f 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -121,7 +121,7 @@ examples:
         compatible = "qcom,apss-wdt-sm8150", "qcom,kpss-wdt";
         reg = <0x17c10000 0x1000>;
         clocks = <&sleep_clk>;
-        interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+        interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
         timeout-sec = <10>;
     };
 
-- 
2.42.0.869.gea05f2083d-goog

