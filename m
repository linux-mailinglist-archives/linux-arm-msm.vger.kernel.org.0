Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02623780247
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Aug 2023 02:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356455AbjHQX7l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Aug 2023 19:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356416AbjHQX7T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Aug 2023 19:59:19 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E40D33AA6
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 16:59:14 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6887c3aac15so305285b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 16:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692316754; x=1692921554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CM3L26PWMAExR3lQXTcXbU6tlb1FTfdlreosiNsvPEE=;
        b=HTrrZZ+wk74qL34Op1mlB1taurJkAnd7YsB6DcuhqPFWoY5BxKedYKyw/BVOzmxMFL
         g30Pe4HkwYC69jPPfY81Upl2joAkDOLn7binq7aylyfOpUoPLa28nnHt6eNCAsaiaXSS
         hUbFj7PjofegYErrFt2HTzB8fTUTdKU6OagXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692316754; x=1692921554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CM3L26PWMAExR3lQXTcXbU6tlb1FTfdlreosiNsvPEE=;
        b=hv+k4KcJuqnSFkS5lsOdtaEvN/NX+Qc4o+mUuiIpmZXsDk3bzaG9r8fuEAdeC4X0Y4
         ld6THNFlL1q8bIyckAyutcD2LZ18lDSxO1FgS4BcAF3wvWVrnYq81StK0XU1pdeP0HZf
         lPFxchrX6T9+ybCmnkep/HwJVJJT0qa2o/8lR+ruhWyJ1BROdpC4jwzvNnDSTa6gUjLI
         kYRBHb9RATAhVe89UkF8FBU04B/+ONqsHw2uZShCcksLCHK2RzYq0FkQppDXmcqCCL9Y
         XEUadyAosjcEXEnSNCYmVAV7N462TxS89SptJbstexw6o+lNLDUqivx9i01SQ1cJvSxr
         +fUg==
X-Gm-Message-State: AOJu0Yygtz2lAzCgO8riLVe0xToR5SAlj5ZX0LkFwiQuv/y7a/47tsoA
        dQmN82h4bOXAYnzwTCbfoGvJFA==
X-Google-Smtp-Source: AGHT+IGtcgNnZbWaCWdSXzGTxx8lAj3NvRd0lG+maqih7++bsMmfpiz36E56uky5QKHaPXs/1RnBBg==
X-Received: by 2002:a05:6a20:3250:b0:122:c6c4:36b1 with SMTP id hm16-20020a056a20325000b00122c6c436b1mr1292709pzc.4.1692316754444;
        Thu, 17 Aug 2023 16:59:14 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a22-20020a62e216000000b006875df4773fsm307299pfi.163.2023.08.17.16.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 16:59:12 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Jie Hai <haijie1@huawei.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Green Wan <green.wan@sifive.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Yu Kuai <yukuai3@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jordy Zomer <jordy@pwning.systems>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, llvm@lists.linux.dev,
        linux-hardening@vger.kernel.org
Subject: [PATCH 15/21] dmaengine: tegra: Annotate struct tegra_dma_desc with __counted_by
Date:   Thu, 17 Aug 2023 16:58:52 -0700
Message-Id: <20230817235859.49846-15-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1306; i=keescook@chromium.org;
 h=from:subject; bh=IvCoDTUmPGIj+7qEwbz1ZUwbMaX1EfMB2pX6XS9uHHE=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rRBfmj3qZYeUoE3VYSBxcgFtgqsG+6voaDsG
 dN7+tvlUR2JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60QQAKCRCJcvTf3G3A
 Jg8fEACt1MzmrcCipsy/0n1aAT9hBbqUq5idN/BI2c3yHNHVpnIRI5GN1j7hOdImkZfcRTcOTFJ
 VUxhWitSM/ypDtTnX8pInDcpcIu9N4U+Uv2olN0raAq3sK4EZcADL/p0aPckt7B1JZjlIPD9F1Z
 OG+WAsV238be/ceJ4BkyWHI9QjMdcsxyLXZvv8kYFGxNbR+Q2BH33KwV39nvO/xtBtaxxMFkmMJ
 3n8JUfQRVVjQmXT3b8UWREZN2S9RD7HaXr3QOVGM4KYaWc5vOPA410mtWrNpBmBUWLkcFraCJql
 BLUul3gf5WgSXSKOSBrzDFIkO9KIYxiRJ4HNItT5cRlbzW/IzY+cWiUwd0d0Z1HuLq2ualRyuM4
 sJgnDenKCrbgN6BrNEzBLFutAuzp0x9KxrorooWOaCnulXSBpCQDM/L2DCoK6EsmSBAF7qEDp27
 MOaEZlijjaJ4OMM0jgxuVCco5wpR9YTOPyPeESqX7QZUoCyGDBPVqPMg5SyBDL+5rStUEsW4riP
 jGHKZiuI0eaNMNa5VdHILPKgR/qXNZM6uNcfF9qgsUicTfY1ov8F+2CVIYB8e1Ka/Di+zeUra6o
 gyFd6zhW5eFnGFR90vPU3Gq/JAQmPESBS4YarQhrVCMJGZkllIB/I5nzaP9nIPCfsM9hTkcg81S asDsoiP0g9COZRQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct tegra_dma_desc.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: dmaengine@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/tegra186-gpc-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/tegra186-gpc-dma.c b/drivers/dma/tegra186-gpc-dma.c
index 33b101001100..5e3d5f5d1e20 100644
--- a/drivers/dma/tegra186-gpc-dma.c
+++ b/drivers/dma/tegra186-gpc-dma.c
@@ -221,7 +221,7 @@ struct tegra_dma_desc {
 	unsigned int sg_count;
 	struct virt_dma_desc vd;
 	struct tegra_dma_channel *tdc;
-	struct tegra_dma_sg_req sg_req[];
+	struct tegra_dma_sg_req sg_req[] __counted_by(sg_count);
 };
 
 /*
-- 
2.34.1

