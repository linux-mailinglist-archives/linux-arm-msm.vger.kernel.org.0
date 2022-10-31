Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C32261336F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 11:20:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbiJaKUW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 06:20:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbiJaKUV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 06:20:21 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3565DF2C
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 03:20:19 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id 3-20020a17090a0f8300b00212d5cd4e5eso15449244pjz.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 03:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7fcvrE1BvqWs8Ve2suGBYVJ5y1iMJPXMU/J5Xu4wR0=;
        b=y0NzHzL9+OqKycduRshIlouA9QYZcOsz78KLUVB0CECSss941UQsjs8jYeHg+jBNGP
         PWO2b+loghQvOah73gMdje/LWDkXEWpr9M1rXWomtkWx51YsZqUkgnSQoa6oK9113Eww
         cmgLdH8v8m5FFwoVQwukBbWy9KEL9qhGLPJO+DKAmaC2tb9ug++BRY7Sgl9hij0AB5+8
         ONBJlOMiGrJ/FwokLw1n6tQiGHKPKDT7Yub02JqoFGcrQDR4ysCnGO1ldTOo0irTrmU+
         jymJMLoswP0lbBHHImhZbZimvf62GvfJJURWKLCPr8VOhHV4x9AkT15V6SGK7evScRF3
         mScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7fcvrE1BvqWs8Ve2suGBYVJ5y1iMJPXMU/J5Xu4wR0=;
        b=tTOFBPnUW88bGkbo+Quzv4yQRI8fhDDO5b9b7aj9X9wRa4Fgt8oSTV53AajMmE7/Y2
         8T73DLaEIHefMiRZtcHrPw+giW9u81uBVqMott4GFFdnJDCNiGtJGRutnpFRLKnfe2F8
         d6t/+IL/dDdfSf6BSMgEnyYdj4IGAN8jqWek0EUGbpaE+JET4lPBhDH2rlTJKTj8jEPD
         eGvQTyFc85I+/UQnk0t0UkrmptHNHzBGofqciscokEjnTCh3L4L2T8aIL2doqSFa+YdA
         qebAPO4tppIup4bmT7qDsj4XOzLumDGYHnf1HMU6RD92TGtEMIw97/rq+/w24HHF9WTW
         Mtyg==
X-Gm-Message-State: ACrzQf1gMD7HXKK448KxWj0kLY8qWgtgfvlkApHJA5y6CFJeuEiTh7X5
        NWJZEXnAeKCaG0A21izzu7Wdpw==
X-Google-Smtp-Source: AMsMyM6zRx4W8DirlVQgBINnxDF8OsjxcShDvVrtOxeI9ew90VXn0xCXf/lc4+jWsKU4n6DoPhRTaQ==
X-Received: by 2002:a17:903:183:b0:184:8c1a:7a95 with SMTP id z3-20020a170903018300b001848c1a7a95mr13578100plg.137.1667211619371;
        Mon, 31 Oct 2022 03:20:19 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (60-250-232-247.hinet-ip.hinet.net. [60.250.232.247])
        by smtp.gmail.com with ESMTPSA id k12-20020a170902c40c00b00186881e1feasm4136551plk.112.2022.10.31.03.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 03:20:19 -0700 (PDT)
From:   Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org,
        Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v9 1/4] dt-bindings: arm: qcom: Separate LTE/WIFI SKU for sc7280-evoker
Date:   Mon, 31 Oct 2022 18:20:08 +0800
Message-Id: <20221031181735.v9.1.Ic800ee7b604bcb0519ca404600d7be2352725686@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031102011.136945-1-sheng-liang.pan@quanta.corp-partner.google.com>
References: <20221031102011.136945-1-sheng-liang.pan@quanta.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

evoker will have WIFI/LTE SKU, separate it for each different setting.

Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- fix typo in tittle and commit
- recover change for trackpad and touchscreen

 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 207e282602064..04928ca8cd556 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -592,6 +592,11 @@ properties:
           - const: google,evoker
           - const: qcom,sc7280
 
+      - description: Google Evoker with LTE (newest rev)
+        items:
+          - const: google,evoker-sku512
+          - const: qcom,sc7280
+
       - description: Google Herobrine (newest rev)
         items:
           - const: google,herobrine
-- 
2.34.1

