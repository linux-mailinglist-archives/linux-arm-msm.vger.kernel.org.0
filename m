Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3B915E7782
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 11:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232002AbiIWJn3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Sep 2022 05:43:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231703AbiIWJnA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Sep 2022 05:43:00 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 676BFF1873
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 02:42:54 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d24so11272694pls.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 02:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=yCRHc0PcXHdJWSS78ttIEzNo+ij6OWHA8kTAAu9ECqM=;
        b=FGaU+m60wkcfVBxlEbFiZwXmUqujm9gv3NqwZK0D0TBfvqyMMZmC26EdRZgyOrN9jT
         ++9+BW/x9LVlkDsrt0e/o8xJHui2atcgRCpo+HsbqjVf59TjybID6V5D2Gvm8T1qHaPP
         YnynoYBRAS/BIMyjvGwAtmu/N71oh1BM3y1rUD/tskrFgp/ZBiV6FjpkBWEfHoMC+VnF
         D+C+SQVC0YQ1fL1zFfr8SFM3ndUkBw9R+65oJWXEKRgoH/C3pt7TM/lacMaoltAkCF6X
         PTUxCwgP7uKGvXmDlwuERbZrFZikdiPNRHRtWH7dBIlW6t4HXZBUeGYh7ilavYkSSrmK
         8gTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=yCRHc0PcXHdJWSS78ttIEzNo+ij6OWHA8kTAAu9ECqM=;
        b=ncHa06zMU7AEcxLRpN67Z40iVCTELeBgkvBGiG92FKME6Ia7YaYLkGwAhX2I1g+M6O
         pNgM+74ExradfWwwdO3V1lWk1iS/Qu7u7Eig0NbPD7OdPraaOdrRyxZrxuezQhGc8Vun
         8Iv+OD605WL4EdyPt1V9+LaSXoVxt7TydS/EHhp+v1xw86sJJRVFX6iYIua3MHI1yDxO
         7ehIcp0znio/5xHs1WSdbnte7Iml/4Mg/wJhDtAB8IRy1TZhhNwl0wnEfatwheSYk0d7
         jnZUxUw/U+MXiFImq0+VIf//viAhD7YP+NGH8zl9vreiINpN6aTZ0Amp/jtdHTPZkpyr
         3q0w==
X-Gm-Message-State: ACrzQf2afs2NqoFR6N4/c1eqrQxQYL+sqUJAiwBLI+K4CYKSvc9zjkMu
        cjCaRXBHkfsBTmWBUqHjfH22ZA==
X-Google-Smtp-Source: AMsMyM6rQCz83AExxDbCVzWoyXamqzjX1XX/qPmqGmy/OqBKq37gGhAvoWBfKLViRgzrzlo9W6cLiw==
X-Received: by 2002:a17:902:7294:b0:178:a2be:ac18 with SMTP id d20-20020a170902729400b00178a2beac18mr7701786pll.93.1663926174451;
        Fri, 23 Sep 2022 02:42:54 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (60-250-232-247.hinet-ip.hinet.net. [60.250.232.247])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902eb8800b0017515e598c5sm5512855plg.40.2022.09.23.02.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 02:42:53 -0700 (PDT)
From:   Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org,
        Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Separete LTE/WIFI SKU for sc7280-evoker
Date:   Fri, 23 Sep 2022 17:42:41 +0800
Message-Id: <20220923174224.v3.1.Ide53082044aac56877c4ff5725777769e377476a@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923094242.4361-1-sheng-liang.pan@quanta.corp-partner.google.com>
References: <20220923094242.4361-1-sheng-liang.pan@quanta.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

evoker will have WIFI/LTE SKU, separete it for each different setting.

Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
---

Changes in v3:
- none

Changes in v2:
- none

 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b6257683a700c..065d9cc4421e0 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -575,6 +575,11 @@ properties:
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

