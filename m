Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30FCD66969D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 13:13:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241010AbjAMMNV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 07:13:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240987AbjAMMMQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 07:12:16 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B7587F47C
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 04:07:09 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id g13so32844877lfv.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 04:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hm/qQ8fRN2NQHjAQUuIDga+VQhSDIFkn6c2/qYNneiA=;
        b=ZFRatt/dxs5o0+wQkcz4uNvrDuRZmQTYPlToVfMr+7HTwl5EqQiKl7jPlkAV5mexc+
         gt+8O9lsZfxTNqn7TLo8OKJkW+afnkuYOkFbNzF5/0keHyFucCBEuvJwtpnjgVlFChjf
         h6YGOmQTI06JeDucA8iWvSnVMg8QykjjEaEQ17TOMsLMPR03jGzTyCNxC7i5eHaXcrbK
         6Ss17K0lc3n6wt1mZfjkzRVzO863pRC7VRFl/AjQJlJze+5jaCoeqio4f8ZclkXwm3as
         9abAKWybrWoBelHzlO25LrhLZDA1Jz95/TBud2CNt2tQIPh23IZtCjf2e3byNynZQmAw
         54CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hm/qQ8fRN2NQHjAQUuIDga+VQhSDIFkn6c2/qYNneiA=;
        b=x2bVy55hbc9vPf2OWNiXtw4uW1LUhxAwARY3uiJuCFfmd61FXT/z5QBwwFf5sKWUX7
         4uUeCr7Zg9kF7mPt923BYB7Ry0B7NITz9WunUpYnuBcu9cn/slTps9hdw/LX805KG57f
         pZetOcTJBelAERMnbvvcrz1jQuf9xCHjsxLCVDttLlC2Y9xviYKAELctX0wHLjAKxpP2
         aGbw1YD8eD0jeXCtp0ovzGTcS50bzXD4RCmfQL80oOhND5rfS/YSbnCPqsdK7jGeUCxr
         QtkL/ExwFGeJYI+UgI1qgiKkY8yZmDnHB9WUg8Mj57vv0dyvkSsa/DrMgA+Cj/ToMtGs
         Gp5A==
X-Gm-Message-State: AFqh2kr9gODM+1/AuDF9+Es5k+CJa2/bNrXEqyJ7BKwXQIBuHOlPbO+f
        Lab0aEOeJGnFm8Im8U8yA0VomAAtfp9UfOV0bIG0VQ==
X-Google-Smtp-Source: AMrXdXsBRAteX1m4WkeMuLekg73W6xuRSD8lqAflC3cp1BrQ+FO37EJXz6dTlWvKg/GS1z0NVctXIQ==
X-Received: by 2002:a05:6512:1111:b0:4b5:43ef:a552 with SMTP id l17-20020a056512111100b004b543efa552mr24324909lfg.16.1673611629271;
        Fri, 13 Jan 2023 04:07:09 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.170.82.205])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25227000000b004ac6a444b26sm3806290lfl.141.2023.01.13.04.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 04:07:08 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 06/14] clk: qcom: cpu-8996: skip ACD init if the setup is valid
Date:   Fri, 13 Jan 2023 14:05:36 +0200
Message-Id: <20230113120544.59320-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
References: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
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

Check whether L2 registers contain correct values and skip programming
if they are valid. This follows the code present downstream.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 0e0c00d44c6f..7e5246ca7e7f 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -472,10 +472,15 @@ static void __iomem *base;
 static void qcom_cpu_clk_msm8996_acd_init(void __iomem *base)
 {
 	u64 hwid;
+	u32 val;
 	unsigned long flags;
 
 	spin_lock_irqsave(&qcom_clk_acd_lock, flags);
 
+	val = kryo_l2_get_indirect_reg(L2ACDTD_REG);
+	if (val == 0x00006a11)
+		goto out;
+
 	hwid = read_cpuid_mpidr() & CPU_AFINITY_MASK;
 
 	kryo_l2_set_indirect_reg(L2ACDTD_REG, 0x00006a11);
@@ -492,6 +497,7 @@ static void qcom_cpu_clk_msm8996_acd_init(void __iomem *base)
 		writel(0xf, base + PERFCL_REG_OFFSET + SSSCTL_OFFSET);
 	}
 
+out:
 	spin_unlock_irqrestore(&qcom_clk_acd_lock, flags);
 }
 
-- 
2.39.0

