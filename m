Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68D3568EC8B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 11:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjBHKQC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 05:16:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230479AbjBHKP6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 05:15:58 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 842C62F785
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 02:15:57 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id u10so9898703wmj.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 02:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7AX0KvsHNXIwnS/VJd4Zm7BJ6Z2WcU4zrwjwY9zApro=;
        b=otB5oI1h2JjdnPTN1uupxEvdwOdGJFMuwogAF3TapP0WoZkknD9Ir79LtK5kA8SIMi
         iJwSnkoxqtECHPDMRzgQHfmIiccFRY6jyy3EllP4YZPfOUScCxib0YDMY8XiqcoYfapF
         YixXF5FqGyzIZ9Oo5YVZK3HRr2u0e8PkFJ2CFJ5tf2B+exRAUUHuKPzaWlO0t8E4IDT4
         Nbse+sG1sO4pBXqNdrWKxgrMR1dq2/oq2uf8Co6dnxOwxymkuU/vF0vw9A+PUIl0dVsq
         oJhj6Wl4xajS7UzXwMw9yJLvVK4RLBV6X3N1g+89BY0jhk33VyRzhBewiBaM8TmHDrcx
         BS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7AX0KvsHNXIwnS/VJd4Zm7BJ6Z2WcU4zrwjwY9zApro=;
        b=IMEtvdaaDeguj0DqXtHfoJmYGSbtJQPUJDw/3+tYwrO75LbF5YBpOTe1hfPYgltgTp
         dKtyCfstdNofAyMhvbTc36LxVsxMjYIZrj8uVdQU9KJFNKkgJqo4ZbTzkFWmjpbDaPk7
         KnyTuCRwj1ifXP4Jexmn8Cl3J4NAYblLzhxnCJlITk52WCW1c3fRz8JWG7/xgOoJjl34
         53SfISWr8uAcAlff6lQdeee0mCsyIaR2UlT07YYhwZjkVfAvG2TO3Zdxpetn2ucJ6rnq
         qjURgAOsO3A16PnvbZBLOgopql0IpO4uWHDdtGU2pNPgp7S3DRQRE2/wVS7M3LA16i7C
         eJ+w==
X-Gm-Message-State: AO0yUKWQicjwKXfjRBan4zbagGTm5pW1/x9NcxWKoQbeiMvyfF26hCyJ
        7k76JmY6MFSz5Q7DtIO2N4QauQ==
X-Google-Smtp-Source: AK7set/KVAJ9urDvdx9Mib0W5fhtxUGBPc2Cgcsin9K4324Fl6UNdsN4sun4S8bzZmC8WB1eg90eOg==
X-Received: by 2002:a05:600c:708:b0:3df:fcbd:3159 with SMTP id i8-20020a05600c070800b003dffcbd3159mr1354532wmn.3.1675851356081;
        Wed, 08 Feb 2023 02:15:56 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c198e00b003dc4ecfc4d7sm1496328wmq.29.2023.02.08.02.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 02:15:55 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 4/7] dt-bindings: mailbox: qcom,apcs-kpss-global: drop mbox-names from example
Date:   Wed,  8 Feb 2023 11:15:42 +0100
Message-Id: <20230208101545.45711-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
References: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
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

Qualcomm G-Link RPM edge bindings do not allow and do not use mbox-names
property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. None.
2. Previously was sent as separate patch.

There are no strict dependencies. This can go anytime. The next patch
(glink-rpm-edge) should be applied in the same or later cycle (could be
via different trees).
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 943f9472ae10..56b386b688b3 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -155,7 +155,6 @@ examples:
         interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
         qcom,rpm-msg-ram = <&rpm_msg_ram>;
         mboxes = <&apcs_glb 0>;
-        mbox-names = "rpm_hlos";
     };
 
   # Example apcs with qcs404
-- 
2.34.1

