Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2022665433
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 07:04:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235691AbjAKGEQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 01:04:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231361AbjAKGEL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 01:04:11 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AEB8B7D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 22:04:07 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id f34so21901541lfv.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 22:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PW4JYNWiYq9bE+2bC5NYpOaosg0SySsEGmX3Ei9VgRo=;
        b=fPtdC2Ax0gOgYtfH6EfRwxYN03hK/T9yG8IIp1U11Q/y6ecRW/fhmPfcT8rXoiGtCX
         7enJCwd5cBwIxbjOci/h0P7734aDRlWrSWndl3HVSPtuI+Pr13zWETyTe5/sUmNeL/ZB
         TCjv52XYQ+oVfu+WhSONmrn21tllDBaXUgJ1c1WUjVnEk3mz0NNY7M9DLqcDRCh7uPCC
         qOc0tycmuJfdtdXgASxaMDW//YFPG5j5qp+GEH3+/UnHT7CVaCkCAoLZVDLNiqrkEXcu
         UtFCF74yt0w6wk0d+ouu977Z8//7k5F7NkKg9KlIP9XySA/saDQRI3+MYF4IpVjcDOu7
         9N6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PW4JYNWiYq9bE+2bC5NYpOaosg0SySsEGmX3Ei9VgRo=;
        b=N0NZ3EgdzvfqB6yrmShDs2Elp7HwS2XNud6LWv9wRMasKj2/KGzLKTNhN2lL2Ju/Jp
         I0VuQq9rXlcLuGapJ9PxQadcYjnzjGex8iWEP2UlOoDjYh86vJTQp8pSC2N3syE7UYzj
         rwzzoX/+fcpzX7nKzv8VjBJe8QAFg+ZRQmAHNmF4v6r2G7cIFGNwfr4YCFHjdJf6RZML
         uzd8WrmXbHECBxyXGLHAjUoUQtNm/3G87NTg1nfCQkdx3Ojx3GOl+NhtvuCLDJba3Ct4
         uRRbEgZTUdZXpNNvqb76n8iTloByikpEqf+cBOIaQdfhAm5mHd8RQtAWArrQI9oHd1RE
         GSbQ==
X-Gm-Message-State: AFqh2krN+kCk52br9tL0fwYbi7fpG1sHGWYmU8K6217BJZ+JEy5LkTH7
        Aaqp97napZBEzOcLZacfTorhuA==
X-Google-Smtp-Source: AMrXdXut9r3eDheC3RtMM/HTeuxNf2t3gCE2JD5dayDI8MQSTHr7dbY6U9VyymvZrzPXOw7U5dy6eA==
X-Received: by 2002:a05:6512:2390:b0:4b5:649a:9105 with SMTP id c16-20020a056512239000b004b5649a9105mr25563804lfv.65.1673417045400;
        Tue, 10 Jan 2023 22:04:05 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id b7-20020a056512070700b004cb143f7391sm2524607lfs.258.2023.01.10.22.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 22:04:05 -0800 (PST)
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
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 02/12] dt-bindings: clock: qcom,gcc-apq8084: add GCC_MMSS_GPLL0_CLK_SRC
Date:   Wed, 11 Jan 2023 08:03:52 +0200
Message-Id: <20230111060402.1168726-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org>
References: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org>
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

Add GCC_MMSS_GPLL0_CLK_SRC, the branch clock gating gpll0 clock for the
multimedia subsystem.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/dt-bindings/clock/qcom,gcc-apq8084.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-apq8084.h b/include/dt-bindings/clock/qcom,gcc-apq8084.h
index 7f657cf8cc8a..a985248d6332 100644
--- a/include/dt-bindings/clock/qcom,gcc-apq8084.h
+++ b/include/dt-bindings/clock/qcom,gcc-apq8084.h
@@ -339,6 +339,7 @@
 #define GCC_PCIE_1_MSTR_AXI_CLK				330
 #define GCC_PCIE_1_PIPE_CLK				331
 #define GCC_PCIE_1_SLV_AXI_CLK				332
+#define GCC_MMSS_GPLL0_CLK_SRC				333
 
 /* gdscs */
 #define USB_HS_HSIC_GDSC				0
-- 
2.39.0

