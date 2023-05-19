Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 849D470A1FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 23:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbjESVtE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 17:49:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230502AbjESVsv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 17:48:51 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7578CE43
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 14:48:50 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-64d3491609fso802378b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 14:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684532929; x=1687124929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRz4nt24YoTgBoEZH5nQGl99Iug5W32/X3YqAbF3Tjg=;
        b=M5qZR4JM0bZqUzJQPC+1FWw1qHJWVn6H8xdlxkrYVAAswm8AYAsYLNXvOTLAnu3dh7
         vFaaM/eb3pPNBfOi4OT6yuBXUgZGFkZf6Z1l9Q6pbpInOAaJHH0QKBlReHQXhPVUNvpb
         SkBIGtZIbrAM7Fyyar2ZytHkCDw/XjoDRG7lChn3oXvDpWSIq323IUH72Ry2TQfRT5Hf
         YsBf5Ww74CrZKHcmwzYjgJ9e8zgVCX0hY660ETc1eDD1FWJO8jBquOyNw/83Z90tjJQ1
         AlVoEb/OCJYmwjf6VC2i4fegsdbojsV8sh7mqPfwl+Co59j0N7BPVnLNKqDG/bOr27lk
         hJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684532929; x=1687124929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRz4nt24YoTgBoEZH5nQGl99Iug5W32/X3YqAbF3Tjg=;
        b=A9599omAMaoD6srFLHjYac5KBGX9LEL7pHXypky6St6IR7RRts2NdXTzh/2THCEQBC
         9sqLh7mVUtA8Vy66J0eCF308Vne+BpYFpldAdSzHy1CkqdJD9kViO6ZbYb3Hqx24Q5eM
         jcO4cmMBsgv7vlZ8c6M+5K1x6rLe1n2Ake1C6+KsN3zZWMWkjjjoMnoXAI6cTkgfzJKr
         y2LyFtr271Mu0zgTbl3fYSHr/H7xI2wmf4AYkBJNYTRZ22dXfK0RBFu9VgJQx3W2WOSu
         8g/Vho6+LKizQDIAIHLvWU2RaX79x1lP4qrhwlitbgQcFGFPeAPjYdTMKsXIvq8GgECe
         L8Uw==
X-Gm-Message-State: AC+VfDwBMInkiu7lM8DuepqdccSDiGRFZwluJtJc9WDUq7VBouWE1KDC
        3RCogDE2ZrlZlSsoblZ3wQ2aJmIu9DYp65yIRck=
X-Google-Smtp-Source: ACHHUZ65tMdVhoCNqi9JkinRNUFIzI5t62KLUoxk97wjxXxoakWh/FqGsyx3YOYaxbUBxtBfTDWKRQ==
X-Received: by 2002:a05:6a00:14c4:b0:63b:5496:7af5 with SMTP id w4-20020a056a0014c400b0063b54967af5mr4749990pfu.1.1684532929470;
        Fri, 19 May 2023 14:48:49 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:d309:883d:817e:8e91:be39])
        by smtp.gmail.com with ESMTPSA id n14-20020aa7904e000000b006470a6ef529sm144891pfo.88.2023.05.19.14.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 14:48:49 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org, djakov@kernel.org,
        stephan@gerhold.net, Anders Roxell <anders.roxell@linaro.org>,
        Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH v7 03/11] arm64: dts: qcom: sdm8550: Fix the BAM DMA engine compatible string
Date:   Sat, 20 May 2023 03:18:05 +0530
Message-Id: <20230519214813.2593271-4-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230519214813.2593271-1-bhupesh.sharma@linaro.org>
References: <20230519214813.2593271-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As per documentation, Qualcomm SM8550 SoC supports BAM DMA
engine v1.7.4, so use the correct compatible strings.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Tested-by: Anders Roxell <anders.roxell@linaro.org>
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 6e9bad8f6f33..e477ea391e93 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1839,7 +1839,7 @@ pcie1_phy: phy@1c0e000 {
 		};
 
 		cryptobam: dma-controller@1dc4000 {
-			compatible = "qcom,bam-v1.7.0";
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			reg = <0x0 0x01dc4000 0x0 0x28000>;
 			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
 			#dma-cells = <1>;
-- 
2.38.1

