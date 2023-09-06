Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B7DE793A3C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 12:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232139AbjIFKsB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 06:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234799AbjIFKsA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 06:48:00 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F6CF171F
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 03:47:50 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9936b3d0286so544671766b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 03:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693997268; x=1694602068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OG4uCIo9NbzSp5j794h37SkEa5IXQu9qFm+Y4qnc40g=;
        b=KhK+AGyYl/VLVA4RzXPL8tGLbvb+/3Sf/WVO2GksiQKt+9SKC319PoFGcyFpqi7qEC
         3OUVU1jRISwhi/kF3HH3WZRiSW5YEGI83lvU6CpS2awD38rjYP8dh3RO0Vj0i+eCYEse
         9Y1KAP9lxaXf7GVCp0abFxg5JugnZiPUQxo+BWhXc/XlFGraFNMqFBgyGd7selt8MwBL
         iknKs4goVDN4ivnnJ95h//WQ8O4Ct9z8t0rTJ/JnJ3W+mN1Pw2idRhZjjD8IdKCbx4fI
         yhGQA6DoUzhxGymqkOOFw+4HaHpsyCy42j6PEtCNqLO5uq2tu/kafquSWSgTL9vB0OhF
         0M7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693997268; x=1694602068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OG4uCIo9NbzSp5j794h37SkEa5IXQu9qFm+Y4qnc40g=;
        b=fTyqG4fMclKDki8KgnU8DQ5gTooTd4RWirXInhn/DeV+o83fpy2NCihZfcan51FKbw
         ZWXIKYg2I2TuPXs3yQ68NzVKWFKe3tgTAmNTQkLJ20ZIat9+FZIJJX8lXTO2qyoXx2pf
         d42aSNX/2IbRXwtbB1jzvhFhW+UPrWH9+k032GIEzvjW4IQAGBu7kr7ZuhcbLTOWHgdG
         BuYFGr23E4D04kIZfMQ9armPQ/667v+MtCJglHB/qz06jFGyvp/XY4MeyqYrsqI+pCVA
         gbiUAEOmT31zEkKxNXVbeanQDhOPTVRSdL0KKR0v6ryfUWgP+KKUZ6DHeYDp4FQu83Yo
         RZcg==
X-Gm-Message-State: AOJu0YzB2H1PvPL1sv8pP2+ephRoyLeDpyykZhT/o2h/i/wel1/ZIEPb
        JlSx8FXMLrqCys0qwm2df0VuKBTqxZhsZPAs8dA=
X-Google-Smtp-Source: AGHT+IEI0lN95wJrCu1nuDQgiWNJZP3cE8NKRr12wRdRek4MHVnScSO1nSphjrl42nQJl35OIClLpA==
X-Received: by 2002:a17:906:255a:b0:99c:e38d:a823 with SMTP id j26-20020a170906255a00b0099ce38da823mr2071035ejb.67.1693997268350;
        Wed, 06 Sep 2023 03:47:48 -0700 (PDT)
Received: from krzk-bin.. (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id e7-20020a170906248700b0099cc15f09a0sm8791163ejb.55.2023.09.06.03.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 03:47:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/6] arm64: dts: qcom: sm8550-qrd: use correct UFS supply
Date:   Wed,  6 Sep 2023 12:47:40 +0200
Message-Id: <20230906104744.163479-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230906104744.163479-1-krzysztof.kozlowski@linaro.org>
References: <20230906104744.163479-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

According to schematics the VCCQ2 supply is not connected and the L3G
regulator instead powers up the controller pads (VDD_PX10).  Use correct
supply vdd-hba and drop unsupported current limit for the vdd-hba.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 2c09ce8aeafd..923b40646e81 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -889,8 +889,7 @@ &ufs_mem_hc {
 	vcc-max-microamp = <1300000>;
 	vccq-supply = <&vreg_l1g_1p2>;
 	vccq-max-microamp = <1200000>;
-	vccq2-supply = <&vreg_l3g_1p2>;
-	vccq2-max-microamp = <100>;
+	vdd-hba-supply = <&vreg_l3g_1p2>;
 
 	status = "okay";
 };
-- 
2.34.1

