Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC4D8677681
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 09:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231571AbjAWInK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 03:43:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbjAWInJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 03:43:09 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BCBB18A9A
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 00:43:08 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so7935245wms.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 00:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i62Sv7Z9pyLgKE8iTn5bJ35rfwFqLP3uw4DYsz1kYmw=;
        b=OKiDMSTw8KbxzjIbLtJQ64WHWuvfvKhnoEHI44pe6iL5nQLWWlW9utB6k2dIpPUn7M
         JydRitF9xELcpVMMVt3C8T+9kjEvG0VWNlK7eVdUK84+xaxQTsn83aqKBBIbbQzeBjgA
         2v8I8Pn8iLNyGzNPhHte5D9V6wFdd2iUghrLs7+1G9RqRylUueYecEQS7MTK9DMkMXID
         axZ020kT/tjgn6OfUTcx5fJBT6U/Ni0s3AcjkYoBdYoMpjqPm7uygZXPGfRWLM7s+mo/
         7Ku47KjAOdp9fUMUIJZe6w6gNrPvpJbk94wSkxnGdw215mm4Nk/tuCRq12EktmH8M9K6
         VvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i62Sv7Z9pyLgKE8iTn5bJ35rfwFqLP3uw4DYsz1kYmw=;
        b=yXRgeSGE11NpLLLpCOLOue3omM0m1XwRHRRdT3euDACSBiJONQqP1BiOwowtuRRWgz
         scO+24uNhWB5tqJ+kjwfZdeHMRc8x7tBiLqwovCF2yGhcugH13BIzmrfOqf1wKefoLC1
         byMvPUNqJChfIBlT7vfMIXseVDfjRBCTwKqi6ghEnkOKK7NuoldW1500qpY4hHzffHmc
         tg2atKMk5Pk9FhY22oNmykS6SxIuYD12LjsA83dKZK5yL+nKta7v7c7AjCbl4WEJef8k
         3pViwukwJ25qma+xxnFmatjpbpXOJ7YwZcm+qII2VQl5SZVXRJI3nvZQJn5z4VtWRWsA
         OOPw==
X-Gm-Message-State: AFqh2kqbn2XY+6encsNdPCDuxTudgxb44grYS5/nXJkD+TmZ7Ot+cZeb
        RNXZUP9smoVrQhjEOnPeT3LsOQ==
X-Google-Smtp-Source: AMrXdXs/1cYiYG8DlneBzUDyF+tLa2QegwpJWMegHFhbTLowaUIrl+6J2+KKzlP05jUvnMCfmwQ4Ew==
X-Received: by 2002:a05:600c:3514:b0:3db:80c:8ed9 with SMTP id h20-20020a05600c351400b003db080c8ed9mr21484635wmq.22.1674463387029;
        Mon, 23 Jan 2023 00:43:07 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l30-20020a05600c1d1e00b003c6b70a4d69sm10974120wms.42.2023.01.23.00.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 00:43:06 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH v3 1/6] arm64: dts: qcom: sdm845-db845c: add generic sound compatible
Date:   Mon, 23 Jan 2023 09:42:55 +0100
Message-Id: <20230123084300.22353-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use generic sound card fallback compatible, because the device is
actually fully compatible with the generic one.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v2:
1. None

Changes since v1:
1. New patch

Bindings: https://lore.kernel.org/alsa-devel/20230118101542.96705-1-krzysztof.kozlowski@linaro.org/T/#t
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 0d935c928148..4833e89affc2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -704,7 +704,7 @@ &sdhc_2 {
 };
 
 &sound {
-	compatible = "qcom,db845c-sndcard";
+	compatible = "qcom,db845c-sndcard", "qcom,sdm845-sndcard";
 	pinctrl-0 = <&quat_mi2s_active
 			 &quat_mi2s_sd0_active
 			 &quat_mi2s_sd1_active
-- 
2.34.1

