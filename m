Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50C476229EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Nov 2022 12:13:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbiKILNR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Nov 2022 06:13:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbiKILNF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Nov 2022 06:13:05 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 115B12A248
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Nov 2022 03:12:54 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id s12so17082477edd.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Nov 2022 03:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIKwiZufvJH5nrQuxrW8TWphTglnKJX8yB1ZUtB1Ni0=;
        b=CmgjSshs7sIUPcpQedPzNta/B7FcL9iLPK3lKmJ0DWXb7wGb+JTQawbYQ/nsF65ZQQ
         5B6jMMyJB9PCy/IjKIzZWV2FNeWUvxEqyeGSNLyeceEZY1m0Xk/S8RNkEstjhFU2bVf/
         1OYRG9olu3sTKX+DaryYufeSxGlfyPc4XuZPebxULoBg6z669eO0kpjgwNTTiN1sw6ro
         vZq+F02wm9bdUBbaNIwbllsi1Es/OI26I2USVI6pP1g1mBh6Sg9kuT+9zp0HOY39zeiv
         Fzch8H9R4Plx0E6QvKIIBrr6gpo0G7E2dWwU+rCGOmRoOgn81aa0ukkKSFrDBJ8Nz4m8
         ijEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIKwiZufvJH5nrQuxrW8TWphTglnKJX8yB1ZUtB1Ni0=;
        b=mV38ha3qNcgQRiS4MSN1i0ZurbDrJL5qFeu4o2kDHkRGPJa9O2HKLFnzbkiKfM9+y7
         ddZNxVtzZBJ1KoampLd2iX0wITZ5tLDnjp6v/gH2JH/fInIGWdWzX++7OnRK/raKZkgN
         cmS2Ls4HaXWHfLbxTgdGIqf7G9Ku/bEkUqIIe5XM4zZ2IDMfFJHnbqn4QC8/cu+hkqxw
         TUF0kj6WOebBP+6STwKofT38TwzJNImlK9JwHqBN4yYbUqJbuZMJ9vbimtP+88Z53NyA
         PWAJxu/DQ0zewYOp1aDwEP9GWx0zRZvYHCTvi8X8uhsDhMoPGz+ha5u64VSf7t4QsIw2
         2JdQ==
X-Gm-Message-State: ACrzQf2dOPPnhqJqk7AosPocBGRIE246SxZyBJDUeyYYwBkvVW9i82vp
        yWpmCc+mVpAGs01+LEoSNPLr9FSVQZdlfQGL
X-Google-Smtp-Source: AMsMyM4PU0JoqFUXkwmPVXF7NhjSmURcMsgCEv6cVSRjm9swGu35lXsourrSXa/vXhbBW0qu4R6CEA==
X-Received: by 2002:aa7:dd57:0:b0:453:2d35:70bb with SMTP id o23-20020aa7dd57000000b004532d3570bbmr60200498edw.26.1667992373410;
        Wed, 09 Nov 2022 03:12:53 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id k8-20020a1709062a4800b007ad9c826d75sm5825899eje.61.2022.11.09.03.12.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Nov 2022 03:12:53 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] arm64: dts: qcom: sm6375-pdx225: Enable QUPs & GPI DMA
Date:   Wed,  9 Nov 2022 12:12:32 +0100
Message-Id: <20221109111236.46003-8-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221109111236.46003-1-konrad.dybcio@linaro.org>
References: <20221109111236.46003-1-konrad.dybcio@linaro.org>
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

Enable QUPs & GPI DMA on the Xperia 10 IV.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../qcom/sm6375-sony-xperia-murray-pdx225.dts    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts b/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts
index 450d4a557df1..6a0f4c0bf7ad 100644
--- a/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts
+++ b/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts
@@ -65,6 +65,22 @@ vph_pwr: vph-pwr-regulator {
 	};
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <13 4>;
 };
-- 
2.38.1

