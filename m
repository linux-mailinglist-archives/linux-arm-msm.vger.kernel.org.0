Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B60DD5249DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 May 2022 12:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352445AbiELKBy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 06:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352435AbiELKAr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 06:00:47 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E34CA230200
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 03:00:27 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id gh6so9227843ejb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 03:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a0nTM6qsq4GtGJkoH4nf0Q+TnkSQuyFZioVt/ZR1zw4=;
        b=oQtJ1P1ICxbjuMvyKGc4PrOAjOYiXbWwf9h50atcRuWJ3tVM+EDUHiZUwhHWJRX3oH
         KkcXY+UDJL4iCFU+LPkUAwmbiW0xc+fR53Z7Tiyc7BmzupNQSbNqNvoikVrwctwew9HN
         Evnr3mYbJv2yxkkoUTsjSqEKXAiSWHn2z/D1ZGnSjJ7t0U90qwvUsieqTIvlMRLXydhP
         jBIwSBQAMGT4icJxcJZRrjFhYoUGwlzQpiIZF8qmEgXBBmeRvXOiw/tISK7utNTNxYaD
         /IexxpPTLBnJzv0kUIAMI66JSMoKjOCrK/CUS7LMU6FdtR7L2u/+E/ZLOl4OFWhZXrvu
         3MOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a0nTM6qsq4GtGJkoH4nf0Q+TnkSQuyFZioVt/ZR1zw4=;
        b=wcLmsFpZ/XOvl3KM+2OuaOQN8A4ei12KpLoOPSemtGKdcEuPDIFdgUPS+/dYo4gZ2e
         tL0OwLwHc5WYOr3jnzyr7+x8EPuCyMdVi8ucss6852dLvzL5RbtPSwxo8Dp2LaTf0/Cd
         5I/GtecCWIq5kO7Ijkjss6uDssUWLK64EjXtw+dAcK5BrbNLMsvlqiDQbQx6VSOyqfbm
         NRanPQyE1c45H9ITj/esJazkkprTFcTxL+8QN53rzPJhQTFMspeadZV1Y7Jz057EOb2l
         wyQY8eXOLB9LDgs2bhoX12cSzJbBYqSs5OjpUHZX6GY5oSQUDm4WjYV5pv4cw+VW9qGb
         tzHA==
X-Gm-Message-State: AOAM530/BnyXPn5nu2fjM0TzH2v6y1lyUWjttMmuqYzvHCno8qfI6sOD
        PzDnCzcsbqkM8DMh82knaCH16g==
X-Google-Smtp-Source: ABdhPJztglS/DsrXYvgSkRA9NmYg98rfTUoXDYryxBoafF/ogKr7ATiW2uZke/W9R/xOYWc7cKdl7g==
X-Received: by 2002:a17:907:62a9:b0:6da:7953:4df0 with SMTP id nd41-20020a17090762a900b006da79534df0mr29302869ejc.316.1652349627443;
        Thu, 12 May 2022 03:00:27 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d17-20020a170906641100b006f3ef214da1sm1970287ejm.7.2022.05.12.03.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 03:00:26 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 09/12] arm64: dts: qcom: ipq6018: add label to remoteproc node
Date:   Thu, 12 May 2022 12:00:03 +0200
Message-Id: <20220512100006.99695-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220512100006.99695-1-krzysztof.kozlowski@linaro.org>
References: <20220512100006.99695-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

glink-edge bindings require label:

  ipq6018-cp01-c1.dtb: glink-edge: 'label' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index c89499e366d3..9db30e7da7bd 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -621,6 +621,7 @@ q6v5_wcss: remoteproc@cd00000 {
 
 			glink-edge {
 				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
 				qcom,remote-pid = <1>;
 				mboxes = <&apcs_glb 8>;
 
-- 
2.32.0

