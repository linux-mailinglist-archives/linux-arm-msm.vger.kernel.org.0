Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E27AA4CEABD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Mar 2022 12:12:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233340AbiCFLNB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 6 Mar 2022 06:13:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233308AbiCFLMt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 6 Mar 2022 06:12:49 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D5C60A9D
        for <linux-arm-msm@vger.kernel.org>; Sun,  6 Mar 2022 03:11:57 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9227F3F630
        for <linux-arm-msm@vger.kernel.org>; Sun,  6 Mar 2022 11:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646565108;
        bh=5q3Cvfs96FMgD3OViDSeZ+rSi5cV583JAJ+X+hKXLOQ=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=FgTbh85gpiffX3Szwldtswz6NvPfjU8B4V1DUM/C+b/x9jHCPOyoUdB4AYtKHJkK7
         1q04z6FK/pdiZITi+fMwsDt+F38qsGYDd1ep9etNV0Lnh+whSqRDCni5a4BTtdangA
         LbH6KowoH4hGf8S0wibmwXEQQsMvbaco/xxrzgXQRRgH6g6npoR1FzJjyQHPsCueZP
         kqQ76LsfpqrA0yp71GewnQyhPKqDdgRm847bLWeP3X6qGVcSl7H2V7gU349ACqLdT1
         agVmedvS5ocSeG454lcvOMtdE6+6SH9P8zFVaMYHAA30sQmpVzjKq6qyvYIyfCvq0j
         AmvqqXFTFmi2Q==
Received: by mail-ed1-f72.google.com with SMTP id i17-20020aa7c711000000b00415ecaefd07so4389615edq.21
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Mar 2022 03:11:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5q3Cvfs96FMgD3OViDSeZ+rSi5cV583JAJ+X+hKXLOQ=;
        b=aHaegNjhv36FHn0JJyeh0N0CrkNwL/vFP6IDtcBpN70qNS34lc7xm3Jta5dCF5X7/s
         1H/80k95jNH4Z++lCVBOy/RLZ9mFMLWQtihtuw9N7Z8dWDlNdvjrvZlwfBUA26ofJlgn
         YZ4Rzn4JHAOkNqWoZqkjtUJPYCWs+WxWpoxtJO1m1PVfrv6kvCSwTai1MIrIvOShSoEX
         9QXmjkuNgghN/UFkhcGTNNl9X/ozNYYsK855ZzAvfDA7tGvhjowFsOFXGdr93fZYiasw
         uWvilHdFUsAEgTu26DQJoSSnCf1QHx8wE5n6atqD+XNVoyi90jXcyLAKOzlLvo2NDffE
         g8fA==
X-Gm-Message-State: AOAM533wQ7AV/SQkZVcO+SyBCceVpw6dGPhpUeJ8bXA4THLXCp9n5dL6
        wDb9uekqdwbB3ANni0omt62H1A2E3yI6VBsPHc9HrCdGT8YXES3ZY1pecO6kFh+wV+aw+aUvoF0
        Krgglxu3LCfRKE2iBllKlZDmBUtsSrDGdqr57xd+IC3c=
X-Received: by 2002:a05:6402:278f:b0:410:d242:465e with SMTP id b15-20020a056402278f00b00410d242465emr6368193ede.292.1646565106226;
        Sun, 06 Mar 2022 03:11:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwW1Ya1zhxY85xcQnirVjPnpGI6XhFX2Sj/phtUq064BY75zEOeymYAnMlQ9+XNNG3HRgb2Sw==
X-Received: by 2002:a05:6402:278f:b0:410:d242:465e with SMTP id b15-20020a056402278f00b00410d242465emr6368175ede.292.1646565106043;
        Sun, 06 Mar 2022 03:11:46 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id a9-20020a1709066d4900b006da888c3ef0sm3720444ejt.108.2022.03.06.03.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 03:11:45 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v3 10/12] arm64: dts: qcom: msm8996: drop unsupported UFS vddp-ref-clk-max-microamp
Date:   Sun,  6 Mar 2022 12:11:23 +0100
Message-Id: <20220306111125.116455-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
References: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The property vddp-ref-clk-max-microamp (for VDDP ref clk supply which is
l25 regulator) is not documented in MSM8996 UFS PHY bindings
(qcom,msm8996-qmp-ufs-phy).  It is mentioned in the other UFS PHY
bindings for qcom,msm8996-ufs-phy-qmp-14nm.

The MSM8996-based Xiaomi devices configure l25 regulator in a
conflicting way:
1. with maximum 100 uAmp for VDDP ref clk supply of UFS PHY,
2. with maximum 450 mAmp for VCCQ supply of UFS.

Since the vddp-ref-clk-max-microamp property is basically not
documented for that UFS PHY and has a conflicting values, drop it
entirely as it looks like not tested and not used ever.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
index 7a9fcbe9bb31..3ade756e1cd9 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -341,7 +341,6 @@ &ufsphy {
 	vdda-pll-max-microamp = <9440>;
 
 	vddp-ref-clk-supply = <&vreg_l25a_1p2>;
-	vddp-ref-clk-max-microamp = <100>;
 	vddp-ref-clk-always-on;
 };
 
-- 
2.32.0

