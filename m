Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31A797189D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 21:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjEaTI1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 15:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbjEaTIZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 15:08:25 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C86B125
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 12:08:18 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f3bb61f860so7557247e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 12:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685560097; x=1688152097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KPuFw0npUksRN+4mHiT4+56P5P3V/hniye1VhYDyU0w=;
        b=Sis4OrHydMo42fDcC44TNHJSZKzjTozD2PehkgwML9aetns/dUYYzGIf1Qa8o1JVPj
         RYoMxcF5ZeRmGtlGvdXuj7+p5UhvySuI5FJKpxyaw/GQVC2Zi9RqLV5bmSWUr6X4Otic
         AuQAzmpmPEhSyWrw6fj+D+tVIqH+se18LmgLC9iyGzRjWdrM9RnxjbUQMHijqMsFJF6I
         czVSLXcKnzR8Z5OK5M6gN91vprEid4mvTafmKxm68QRScuITBageropUGdMkgtQv0qdS
         xAOkzlVBZkuDsxahwY7EIogMOXrh3tYAeVM9s80BfXuDTsYmuS86iWJtcZjgqageq+mO
         efdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685560097; x=1688152097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KPuFw0npUksRN+4mHiT4+56P5P3V/hniye1VhYDyU0w=;
        b=IxtxWRaR8MYsCm84WEl7JW3JZMxynlWEshQHYCRcfVrCkTzyMMJ+sZX/BBxGWGxDPV
         Sb/nYrV+/ezebACqRbDG/df2yrg44JatERzENJPB/1LTYCW8GTrfn/i5Mmaufv4WEppL
         PiBIKChPoW8FDhZu1p9vFGwffta6xRmlxUrveIet9wtOlsD9daqRW4yOLnLYQSElTlHh
         UYFcNQ4owh+/Cl0KGs7mmIbjejKo4tcKLW9y+fqDzoHnXcTUOAUTh8OFC4KTbaEgfT7n
         FY/hl+Ta5egNIiKnylDEXpfJ9+tfMHZOj6A0W7X12GNMyuppeaxCr5I3FRz+wlNik7Iu
         zZUQ==
X-Gm-Message-State: AC+VfDwghE0AEUhOYbbbNdhfxRS/oWQo6Jofd/RZab04b0lhYwHkfMSQ
        eGSJKmgbXSsrflepg9bxoCy6ow==
X-Google-Smtp-Source: ACHHUZ6RcarRYJQYAJ+ZB8ZpJbC+zZY8v6u8a9s9Q5JOBscTZYIYJt1oSIbiESaLT3mFfYsPuK70RQ==
X-Received: by 2002:ac2:5ecf:0:b0:4f4:deee:efaf with SMTP id d15-20020ac25ecf000000b004f4deeeefafmr36163lfq.4.1685560097279;
        Wed, 31 May 2023 12:08:17 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25227000000b004f3b4d17114sm820935lfl.144.2023.05.31.12.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 12:08:16 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 31 May 2023 21:08:11 +0200
Subject: [PATCH 2/2] clk: qcom: gcc-sm6125: Set up flags on GPU mem_iface
 clk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230531-topic-sm61125_gpucc_flag-v1-2-f59dd1350781@linaro.org>
References: <20230531-topic-sm61125_gpucc_flag-v1-0-f59dd1350781@linaro.org>
In-Reply-To: <20230531-topic-sm61125_gpucc_flag-v1-0-f59dd1350781@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685560093; l=841;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=IEG6edkTJ6CWQJbTd+SqBb7jA9qXN5DYOo46+SWTNaQ=;
 b=C19QIJ+cMrTd9aUbcEfcX7gO4fZN0tbV+8Qndittoq8YWiKVMg+cUu7mjFqSCAP07aPGlVuRq
 WrMx8gJV6FPBW5R6bEnOoHnXJRcllaqXvIZajXBNn+G4y97mY8y0ZK5
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Following the BSP, disable the RETAIN_MEM and RETAIN_PERIPH bits on
gcc_gpu_memnoc_gfx_clk.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-sm6125.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sm6125.c b/drivers/clk/qcom/gcc-sm6125.c
index 40ad062d1bf7..ea1d567c7994 100644
--- a/drivers/clk/qcom/gcc-sm6125.c
+++ b/drivers/clk/qcom/gcc-sm6125.c
@@ -4162,6 +4162,10 @@ static int gcc_sm6125_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/* Set up no PERIPH/MEM retain on the GPU mem_iface clock */
+	qcom_branch_set_force_mem_core(regmap, gcc_gpu_memnoc_gfx_clk, false);
+	qcom_branch_set_force_periph_on(regmap, gcc_gpu_memnoc_gfx_clk, false);
+
 	return qcom_cc_really_probe(pdev, &gcc_sm6125_desc, regmap);
 }
 

-- 
2.40.1

