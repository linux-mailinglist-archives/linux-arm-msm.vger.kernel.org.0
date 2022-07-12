Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB9EA571AB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 14:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbiGLM7b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 08:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbiGLM73 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 08:59:29 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ACEB11476
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 05:59:29 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id r14so11091953wrg.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 05:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hg0/yrt/f4Age9reiCr+uEvd+Uow8vVWrrE7vxpr1RA=;
        b=BGSdqaqj8skqRbN8hvHX4NvNkyuVeJ4xn1BFHQkCJ7Gqsou2f6SXxgnrJF6NlsOBO6
         QeBsFREm5EeIQLubjqp6lAamnV3NY1UBUjyyjZaxfyUo4e1WYth7hRwjh5vQpcV87jGt
         6I0mH9/BvBsGWLXwA594n/93xWYyinE6qy1C0JFY2p/Qch1ImcDweqRaZysR1j54K1MZ
         Ybfxnhw7fEO0uek6DGGwncmwGmV9AwfUNj4JSU/sGHg38XbJJ89RUZCRZZ+MO69RqOwm
         Pvu8bx3pYbfgjDsrpT2IdP4+QWoK6qkH+wqK/mUMS6OP8P8U3f1+EU0mIMk6NFGf0RPD
         xDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hg0/yrt/f4Age9reiCr+uEvd+Uow8vVWrrE7vxpr1RA=;
        b=nJwgFfixlsM17NaJmvJF3epp9bLxRlHXPrvYdDzpUWzDmXF7L5vOBsWuYQRah+mZrv
         eHNxD2Gehh87Pm5YcsAeaG3BUCL5Ok/OwQmpU9IslIJ+yylmQurdQwt1UPL4h9CmJXpx
         64KB/6llviht0owTWxk8pz90d5rXfynAVSr5ymiiSwNE3/F5+8ugv25Hgx8WVSqTol/U
         nOLFS+FAzDl2fvkA1cWgqB86aIGz6wAVQchN0cwVZw8T5SjmpMBRUf/f7zyiKjWA4rfR
         blVslKERLzBbefCojVa8kQwroOt+1z9SvUBSBvyWqgI1h3VHo0NoK6RqVtJzaJXL/o+b
         KrOQ==
X-Gm-Message-State: AJIora9YP0YeKmnEml/DbEjVimVCuNIyRGHLw15t3QL7N8FjYfgcA2Zn
        /Kqe+CV73QdT8BxOyP3WomC8Wg==
X-Google-Smtp-Source: AGRyM1t93dgV0ssjHFM7oe8VbwlLpLzhQjtKZ9t309aqkm0TcEioSg+fmCuwNnn7cspM8ZLRFNBZ1A==
X-Received: by 2002:adf:f5c7:0:b0:21d:7f20:7508 with SMTP id k7-20020adff5c7000000b0021d7f207508mr21894020wrp.458.1657630767655;
        Tue, 12 Jul 2022 05:59:27 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t123-20020a1c4681000000b003973c54bd69sm13008627wma.1.2022.07.12.05.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 05:59:27 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 3/6] clk: qcom: gcc-msm8939: Fix venus0_vcodec0_clk frequency definitions
Date:   Tue, 12 Jul 2022 13:59:19 +0100
Message-Id: <20220712125922.3461675-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
References: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
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

The Venus clock frequencies are a copy/paste error from msm8916. Looking
at the original clock-gcc-8936.c ftbl_gcc_venus0_vcodec0_clk defines we
have:

- 133 MHz
- 200 MHz
- 266 MHz

These values are born out by the relevant qualcomm documentation for the
msm8936/msm8939 Venus core performance levels.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/gcc-msm8939.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 6a3e2326c72a3..2aad40dbef8e6 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -1824,9 +1824,9 @@ static struct clk_branch gcc_ultaudio_pcnoc_sway_clk = {
 };
 
 static const struct freq_tbl ftbl_gcc_venus0_vcodec0_clk[] = {
-	F(100000000, P_GPLL0, 8, 0, 0),
-	F(160000000, P_GPLL0, 5, 0, 0),
-	F(228570000, P_GPLL0, 3.5, 0, 0),
+	F(133330000, P_GPLL0, 6, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
+	F(266670000, P_GPLL0, 3, 0, 0),
 	{ }
 };
 
-- 
2.36.1

