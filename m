Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 495B860029D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Oct 2022 20:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbiJPSER (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Oct 2022 14:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbiJPSEP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Oct 2022 14:04:15 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A885930F69
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 11:04:13 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id m29-20020a05600c3b1d00b003c6bf423c71so10337132wms.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 11:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6neNdc+0nI2SGbRISwCUwwxWcdJ7orR9DX0HymKmW4=;
        b=JznrT9IUavHOaCBCtH1b96aXUbl6jNUxYJ9TZwRrc9jecSa3ImhV2RKzYfPVuhakjR
         CVXDDlOrSn81NeOftBXADH3XfVOWwxQtwDVUmqBO96oUYifnQ75IIyxuCBTQz+chFrTm
         GkTLE2+5TKPe7zjz19ZmEb1oYtGygccovcET+WrpXG/vUJGC/Ul27oYcjvG4GkL9G2Fq
         5hI5yio79uYW/b5X8lXWJRvzqcZck+qc2gLO6BNQB4zN4wNYvrBhLi/viEIKE8Oc3FTD
         tqDmAYVuQHq7PQJMdTXCC/oDgUs1AWVRAGJmgsnn15a6jfevSy/ypD6NXFO4gWrrlPNU
         wfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6neNdc+0nI2SGbRISwCUwwxWcdJ7orR9DX0HymKmW4=;
        b=EMBrg4XJUeXxar/FtiIGTM5Zunp4/NfqmQWfpQG/XxniVqC7sAL4YfgQGlx6Mklirq
         NNiK7N+1NTGKF0Ef6HFQl4UlAccgkTavCWd3xy0ufARiPMW1PueFZnIFaFsHeS317fpH
         U6s29zf8IxoTgssBBvOICEiEUFjLJU/GVoNjxQ/CTzXKZ0MVMuuEP4TUczSLQSqkh4qF
         4MX8K/HVUQMg2fhh1xgkr07hkDKlFMlxF3Z77xu7BC8v6cbSXhSRsdD7nU345qcRIlp+
         meh6/pOwWNUbNJAZwSLwTXVakgZow8cB5aFh+HuImjSLQdoP0Ki+OL3rKB9wQ6PnHxsP
         B4iQ==
X-Gm-Message-State: ACrzQf28881jwUqK7GPqkcjl/6boI7Rx1YjgWHE94H2fs4AUJAIOTFor
        Dp6zAt52pPkqm6XZEFCoH9T/6g==
X-Google-Smtp-Source: AMsMyM7Kxu06RGpeMyy5FKb2pZFNnkyI9W2Wm+q7t7tFDaByiCYFmyamiHjiYnfTWNWb7A0ZQpdH2A==
X-Received: by 2002:a05:600c:1c16:b0:3c6:bb05:702c with SMTP id j22-20020a05600c1c1600b003c6bb05702cmr16447160wms.203.1665943451281;
        Sun, 16 Oct 2022 11:04:11 -0700 (PDT)
Received: from localhost.localdomain (cpc76482-cwma10-2-0-cust629.7-3.cable.virginm.net. [86.14.22.118])
        by smtp.gmail.com with ESMTPSA id k5-20020a5d6d45000000b0022e57e66824sm7844181wri.99.2022.10.16.11.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 11:04:10 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org
Cc:     Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 3/5] arm64: dts: qcom: sdm845-db845c: enable rradc
Date:   Sun, 16 Oct 2022 19:03:27 +0100
Message-Id: <20221016180330.1912214-4-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221016180330.1912214-1-caleb.connolly@linaro.org>
References: <20221016180330.1912214-1-caleb.connolly@linaro.org>
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

Enable the Round Robin ADC for the db845c.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index c6e2c571b452..e0ae43ceada5 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -649,6 +649,10 @@ led@5 {
 	};
 };
 
+&pmi8998_rradc {
+	status = "okay";
+};
+
 /* QUAT I2S Uses 4 I2S SD Lines for audio on LT9611 HDMI Bridge */
 &q6afedai {
 	qi2s@22 {
-- 
2.38.0

