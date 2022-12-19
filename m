Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B3E16511FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Dec 2022 19:32:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232438AbiLSScx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 13:32:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232441AbiLSScJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 13:32:09 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 398D96453
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 10:31:23 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id m4so9876364pls.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 10:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6zR8ugZMMSbsUYzZxGLGG2mvpL7z7iHt3BZjr/IYFc=;
        b=LXYA/o0rsUg+vniZbRgR5ToqfadsQ0+SCYz6AzzwsaP86nSrdcNVXG3of0kTsD9kgz
         KUDlOO8GcUTFdztbIAGOaGIiTmRJsKyzS9RyQiCLaZwJ59/9OI+DqUNRnFUVNru5N2Gk
         q/h7Y8yg+Yi12/Ky1QVZcDI9dFjS49LiJF9wt2yOHNqW+2v7XtPicZAbHLTkM2PtnuwQ
         lA7fwwrbhv6rxo4yJi0pGmGJUFdWNTjkpTjx4LDPgGG4IDtM/x0c5okgiH4gVihsitLT
         wPvEUJuH9p2yK025Yc3VdYJGGugFJDkJLrTOEmkmOHRh/vLqw2WCfus7n1z35TSw2Msu
         UyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6zR8ugZMMSbsUYzZxGLGG2mvpL7z7iHt3BZjr/IYFc=;
        b=HCZMF3CW8tQghICg3KTAlUMLFf1tcncOrkfCtRnxMXyTwhprE3HK8v5mqrA0osf+gX
         eWo/FU/EMCqbbtf8iqO2AduTYDHj0ECVtaoUqP6mT6ho0Yqrnmp4HrkvAJbvNg59LlZ8
         Z+d0HorHPHOnYCG13IK7UVaH99tBIcFct7yXcsx3IX+NIvf0v5YBUjoImKKA9dPciF6a
         FjRuGF2iNEIIhJevF7EXNhLMsEpGZJQNheG9PnRtksNRKTc43q+hdGpwAJbLbWbWPgM2
         MSgowu17FCuK9R94c5gixeam606i++X/PyJKsCo37nMDHBASHQ2gC0g/lCvAVskZ5R3T
         Blmw==
X-Gm-Message-State: AFqh2kpAjGZcFimkDO4S+6TMoxywbq8t/8jaB51BEtPr/GraajoZVUjv
        PKAJAxfhl4YnGfSh6u+3z9r7
X-Google-Smtp-Source: AMrXdXsq68iRq1AJ4pJ1/A/WhCkhwXRxCkZRc3XhJHrLuf95YiOH0btnO3KPBZpAO41hx01UikeGmQ==
X-Received: by 2002:a17:902:f689:b0:191:13f2:173a with SMTP id l9-20020a170902f68900b0019113f2173amr10729999plg.36.1671474682712;
        Mon, 19 Dec 2022 10:31:22 -0800 (PST)
Received: from localhost.localdomain ([220.158.159.17])
        by smtp.gmail.com with ESMTPSA id d2-20020a170903230200b00186e34524e3sm7480979plh.136.2022.12.19.10.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 10:31:21 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        luca.weiss@fairphone.com, ahalaney@redhat.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 10/15] arm64: dts: qcom: sm8450: Fix the base addresses of LLCC banks
Date:   Mon, 19 Dec 2022 23:59:53 +0530
Message-Id: <20221219182958.476231-11-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221219182958.476231-1-manivannan.sadhasivam@linaro.org>
References: <20221219182958.476231-1-manivannan.sadhasivam@linaro.org>
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

The LLCC block has several banks each with a different base address
and holes in between. So it is not a correct approach to cover these
banks with a single offset/size. Instead, the individual bank's base
address needs to be specified in devicetree with the exact size.

Reported-by: Parikshit Pareek <quic_ppareek@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 570475040d95..12549a2912c6 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3640,8 +3640,11 @@ gem_noc: interconnect@19100000 {
 
 		system-cache-controller@19200000 {
 			compatible = "qcom,sm8450-llcc";
-			reg = <0 0x19200000 0 0x580000>, <0 0x19a00000 0 0x80000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
+			reg = <0 0x19200000 0 0x80000>, <0 0x19600000 0 0x80000>,
+			      <0 0x19300000 0 0x80000>, <0 0x19700000 0 0x80000>,
+			      <0 0x19a00000 0 0x80000>;
+			reg-names = "llcc0_base", "llcc1_base", "llcc2_base",
+				    "llcc3_base", "llcc_broadcast_base";
 			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
2.25.1

