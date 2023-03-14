Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE79E6B8C8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 09:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbjCNIGX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 04:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230444AbjCNIFw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 04:05:52 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C29174DDF
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:05:46 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id e15-20020a17090ac20f00b0023d1b009f52so4214543pjt.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678781146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WM/W3mGHWee04PiGhWaePDSEFLq+5Xz9JBoWs5RSs+4=;
        b=RDGwems7PyJZDZ29pYgfkme1i95dPUInFnXwzopbD6Em5qAza9fIY+En5MtKlgSpqG
         YEPMHWlaC2/G41YoL0usMUjvOqq6fkjWNI2RQgNUSoJ8ZfjSU3PQicRblMHRdBichWpX
         F3V6cYIEFrkj1FxBuPNHqp7ry3wbusvjYzSCqEJZbieoKqxWeyfuVvMAI0tNXSlv+lmJ
         EahXwYc/ksWZIJKinruI87wppf+TUFSw2IyyVpTBJBR1ED8VZh8ycFvca2pz01phKde0
         xD8pFjaG4RgYhg3aupoOE+6jC1Dq4epW1Hyjzh1dH5/bF5+H5p4UWzBpA4HgQPTBrXiz
         3+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678781146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WM/W3mGHWee04PiGhWaePDSEFLq+5Xz9JBoWs5RSs+4=;
        b=sYdlIOzNhZDaqIi2Laa1LxTk432BqW44gWTzZTLFHSMW+HXDPzthcOlExRQEnCwW3o
         +8i6PV5Eb+2sEyljyZ1OuDHvsg0lM2uqVIl+0eEJcUfkRULqCtXDCvkBYljs+/khqNZ0
         8oWpG6ndkxa+kDGQ3TGI7duY8WiLyEac+59/GjFY3qEqHrvq7rVh1TCHdVyP+0tttKzA
         rVIDlItsxiqBFL6oO81Io2ufWQAwjf8+yBz7QlePwuvpvaAb9WV2y8ZekMdhuJ4mk+rD
         tGlMzKiEiqw54HiJoJZdnYKFYban79B5IRBGdYU5ccZrTG4vFxv7VrKRwmHNbvwpFNMm
         piNw==
X-Gm-Message-State: AO0yUKXYIaef5p//SpWmonJ6eScMvLTQnsYlMXWZmXsQwM7oI9jji9sh
        0WzVyRh5uC2/VgcQd67jbJ6IQlcligGABLj4KA==
X-Google-Smtp-Source: AK7set/EBRWn+iFCvwCLybzCKfHdXTnJNY/XzNdvpeEfeBdb0/V4NEbBLT9p7swb5llI6OB4biA5cg==
X-Received: by 2002:a17:902:d502:b0:19d:16e4:ac0f with SMTP id b2-20020a170902d50200b0019d16e4ac0fmr46377415plg.5.1678781145728;
        Tue, 14 Mar 2023 01:05:45 -0700 (PDT)
Received: from localhost.localdomain ([117.217.177.49])
        by smtp.gmail.com with ESMTPSA id l8-20020a170902f68800b001994a0f3380sm1078022plg.265.2023.03.14.01.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 01:05:44 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, james.morse@arm.com,
        mchehab@kernel.org, rric@kernel.org, linux-edac@vger.kernel.org,
        quic_ppareek@quicinc.com, luca.weiss@fairphone.com,
        ahalaney@redhat.com, steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v8 09/14] arm64: dts: qcom: sm8350: Fix the base addresses of LLCC banks
Date:   Tue, 14 Mar 2023 13:34:38 +0530
Message-Id: <20230314080443.64635-10-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314080443.64635-1-manivannan.sadhasivam@linaro.org>
References: <20230314080443.64635-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The LLCC block has several banks each with a different base address
and holes in between. So it is not a correct approach to cover these
banks with a single offset/size. Instead, the individual bank's base
address needs to be specified in devicetree with the exact size.

Reported-by: Parikshit Pareek <quic_ppareek@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 1c97e28da6ad..3fefd8cbba6d 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2204,8 +2204,11 @@ gem_noc: interconnect@9100000 {
 
 		system-cache-controller@9200000 {
 			compatible = "qcom,sm8350-llcc";
-			reg = <0 0x09200000 0 0x1d0000>, <0 0x09600000 0 0x50000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
+			reg = <0 0x09200000 0 0x58000>, <0 0x09280000 0 0x58000>,
+			      <0 0x09300000 0 0x58000>, <0 0x09380000 0 0x58000>,
+			      <0 0x09600000 0 0x58000>;
+			reg-names = "llcc0_base", "llcc1_base", "llcc2_base",
+				    "llcc3_base", "llcc_broadcast_base";
 		};
 
 		compute_noc: interconnect@a0c0000 {
-- 
2.25.1

