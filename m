Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7B6E73EB5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jun 2023 22:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbjFZUB3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 16:01:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbjFZUAy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 16:00:54 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2804319BB
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 13:00:50 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f8775126d3so4949737e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 13:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687809649; x=1690401649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9oE1vA9oZECxb4lngoFC5l9QDNuTaz25Y3kIWdbl1G4=;
        b=vw1Zn2lkdQDV8C2mNkXXf2b6yxaSYrNGCJ/o/8rmXru/l9NDdM7l8Amw9sahWGfL1/
         b1cqNvH9gTWYlX+k8BYada27hhiz0RMgMNoJfe1nkmC89ya0YNMcpYJnXXFjMjRIsIpE
         rK2TFcb/eVhmOh3lL72hu1geZq6ASYxpWKfMKdneXpddc5fTN1Zxdi6tbQeVUgrmzR9b
         ZUk6ExFgrqnqIZhJtDuxOSk0N6QO4+n7QcX6SFG92kHPnFkf0wlQHoegIzsvDDhsr1RS
         /lCGwg7fR7Kjg1djr0IiaDrMwmlhFilMiOoIdvEjuJMuW0/Q1fXHwieLeWfT7chpSBL0
         +ucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687809649; x=1690401649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9oE1vA9oZECxb4lngoFC5l9QDNuTaz25Y3kIWdbl1G4=;
        b=HnJpcHD2+Cdmm7dIqabIu9gRpJ0zcYLekubmeXyRPjoFqJRRQBbEFTbBXNReXw1KXR
         jaOLiPwD907zvtGOU4iUDkEBw1fyge2sp9Yk9beqomXvLtZAd9vO5MLHNDLcs5w1X/IJ
         76CY+AFJmUUwosTcca2xlnhsiwZ4azBeD9Z7ceXoHLQ6n7DFPT/rxiZOia6G4zkYsZeb
         rJCeFyOXdSa4hbDo9jUv/KkF0iFqwgoecIy22p8r1UVhWJ2XR0yRrnSqkmdemZDExcFb
         7ZJdbeQORUKsn2dvCFV0LcVmoNf6TxWxcjKOSapyI1qk5BzcYB5sow81fstHjShNJedt
         U3DA==
X-Gm-Message-State: AC+VfDyKE5gq1hIQyWXQcx35QWhpYwx5ptE0z4Rgvjy8ht+cv248GseT
        dKxhmzgCRNeROPcA3CGGfP5kew==
X-Google-Smtp-Source: ACHHUZ4OiBhU4ZhPCNUmYmycNqrSBBeUaIAmkQGKJPpildJC6x6za9LCFa2p42QVBFQtf9EZLkInIw==
X-Received: by 2002:a05:6512:3a96:b0:4fb:7642:88d3 with SMTP id q22-20020a0565123a9600b004fb764288d3mr2947490lfu.27.1687809649016;
        Mon, 26 Jun 2023 13:00:49 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
        by smtp.gmail.com with ESMTPSA id o11-20020ac2494b000000b004fb74cb9670sm628082lfi.125.2023.06.26.13.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 13:00:48 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 26 Jun 2023 22:00:28 +0200
Subject: [PATCH 6/7] arm64: dts: qcom: pmi8994: Add missing OVP interrupt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230626-topic-bindingsfixups-v1-6-254ae8642e69@linaro.org>
References: <20230626-topic-bindingsfixups-v1-0-254ae8642e69@linaro.org>
In-Reply-To: <20230626-topic-bindingsfixups-v1-0-254ae8642e69@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>, Vinod Koul <vkoul@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687809636; l=1039;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ZiBnl3ppLgPG+6RsUgiLkAxM9fVUIHOAF6RSdTbrPSM=;
 b=GKIu4T7ibjpsm2tmTrKQED9br3OgA+LWnPEAhuS767DpB016iimNdk40hfz04vB7l0+oZsFJq
 lBP0unrfJyqCBgyGG23dbfIJIghh/6j/QEmu65W3NnR/vGTVMi89B61
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the missing OVP interrupt. This fixes the schema warning:

wled@d800: interrupt-names: ['short'] is too short

Fixes: 37aa540cbd30 ("arm64: dts: qcom: pmi8994: Add WLED node")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmi8994.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pmi8994.dtsi b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
index 0192968f4d9b..36d6a1fb553a 100644
--- a/arch/arm64/boot/dts/qcom/pmi8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
@@ -54,8 +54,9 @@ pmi8994_spmi_regulators: regulators {
 		pmi8994_wled: wled@d800 {
 			compatible = "qcom,pmi8994-wled";
 			reg = <0xd800>, <0xd900>;
-			interrupts = <3 0xd8 0x02 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "short";
+			interrupts = <0x3 0xd8 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x3 0xd8 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ovp", "short";
 			qcom,cabc;
 			qcom,external-pfet;
 			status = "disabled";

-- 
2.41.0

