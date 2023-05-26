Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3F1D712D38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 21:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243357AbjEZTXA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 15:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237261AbjEZTWy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 15:22:54 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54051E4C
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 12:22:49 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5343c3daff0so749022a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 12:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685128968; x=1687720968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54cDFJeSGSXG52/B4DosN83/4R3Mi7SpQa7UatFpDqI=;
        b=b2lzihYg5M6iCzLBXlF88l5Ap3kClLx0dCY0MfER3ClAtPvcLCU1IrMJvMjWLfkQzJ
         Kcfkw96vBN5XtJNcQLKT4l01uNUmbOXQAFuWQsOV+xppoOBjZe9IgwcR5ltS7DDhGeGB
         Y+tuQgsULHr2QcEczOZZeOQNXPC4AWL41bZZwlQHCX1hpyZ7Pjjr881SGK7J3ckxEhXm
         ZYD/jmVSP2DdAZz8bs0CgYlkCDj3Fx+Efv5Nd96teg1d+CmQ9SEZgwHUUdmsX6o4SfTx
         BJZb6QdU09Jeqr4yvL3T7XGYzitpw6y7EHMDTHvlmy/j34IAjM3iESfMXpNkoVFwuHPJ
         G1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685128968; x=1687720968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54cDFJeSGSXG52/B4DosN83/4R3Mi7SpQa7UatFpDqI=;
        b=L+Q7awh7i0jHbMqqrBbOeFHl8/fUhpdR1afp/78Gt8XYCHrwONBljnW/S/7Bda7DtG
         3stJd1GSokuJlpYVEI4qPzXgq023pBLeNgCOlaJDF+1UojoPM6+fbHAfLSBnERhoMN2W
         739ZdtjKHP3NXs59q2RP0Q5ikhCC/rk2TyJipQbP6YVEqNBtosMJrUwn3VwFlXErfW/N
         YISsJI/5jqAhxoolQxnru4l+cTyEDvufmn46fDDW7HnKQC1JfcR+WZFpopDH9UUi3NsT
         lcf7B5GMdKqElEyNrSnhFRWwwEIJkLxr6gHkiqFvvDkYWvFv43LvXLO4QObFZP03on+V
         CAIw==
X-Gm-Message-State: AC+VfDzHQ58J26+ideCMiXSqtda1CdVnO+aZ8VIgshyhIs2C6ibZc+5s
        LJJsHp2Cca2aqg6uw0WD+OFJpEG7G5xsB1e+lJg=
X-Google-Smtp-Source: ACHHUZ6o47bDq6z9DBl7EGitghXheC/LQHkoFjUi1X+GLMYSKSOabZ2cIbN38uYkbtsRYiOTazK4EQ==
X-Received: by 2002:a17:903:2350:b0:1b0:45e:fb02 with SMTP id c16-20020a170903235000b001b0045efb02mr3823014plh.35.1685128968276;
        Fri, 26 May 2023 12:22:48 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f3a:6990:1a5c:b29f:f8cf:923c])
        by smtp.gmail.com with ESMTPSA id q18-20020a17090311d200b001b008b3dee2sm1955079plh.287.2023.05.26.12.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 12:22:47 -0700 (PDT)
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
Subject: [PATCH v8 03/11] arm64: dts: qcom: sdm8550: Fix the BAM DMA engine compatible string
Date:   Sat, 27 May 2023 00:52:02 +0530
Message-Id: <20230526192210.3146896-4-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230526192210.3146896-1-bhupesh.sharma@linaro.org>
References: <20230526192210.3146896-1-bhupesh.sharma@linaro.org>
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
index c9b70cdf1320..577806795a00 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1848,7 +1848,7 @@ pcie1_phy: phy@1c0e000 {
 		};
 
 		cryptobam: dma-controller@1dc4000 {
-			compatible = "qcom,bam-v1.7.0";
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			reg = <0x0 0x01dc4000 0x0 0x28000>;
 			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
 			#dma-cells = <1>;
-- 
2.38.1

