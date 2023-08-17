Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 944A6780272
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Aug 2023 02:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356294AbjHRAJM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Aug 2023 20:09:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356664AbjHRAJL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Aug 2023 20:09:11 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 772BD3C26
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 17:08:45 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1c4cf775a14so164002fac.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 17:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692317317; x=1692922117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJAStmqEWJCV11M3alF7g0EvIWbhKJ8cHn0i1bzIQ+w=;
        b=G9dQNpeCDU6vSJDa21UY/Mw8p61U6Pa3T/VNTD0N6eKEN/xkSyFSPxwZJMlrumbxF2
         yxFdU1Mqtc9PVDPeUdJTTI/byEwzyL9clggs4DITweNemWAvyD4OqipRB0RiiEHV+Yrn
         46u3CyfTS3MTL8L9LrHEhkvbP1CddmUGW3Su4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692317317; x=1692922117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJAStmqEWJCV11M3alF7g0EvIWbhKJ8cHn0i1bzIQ+w=;
        b=DbrrKWHy4OD0W8XS4nKj4T4Rg/gZKaxYxyZCn+eEo2jV7lvhb3RwolfRzO6Iyg+8ps
         n4WVSb5MHkTUrsKdHkF7ogsOQ+T4RM1HD48Q0aM+oeU8TK9jND4+hlJw5dhLB7if/S8v
         PnpZUuaup2FX+sT7jgJYMPvD0imi54gqsyLaY/gMU8WdAPz4QyrfdSVnKqN9vsNW5DhS
         mbFgqi9lt0vN50qbdfS4et68mVtAnCr9+YZvnOFb0jwxZzkxSyE6IHN1KsOUtDe12odS
         crBTPqorFfx7TtOcW3Kgx3Ms6KLisyuog/Dv4fvUIaNuyeD1GsdhWnraGrbQBLMZRDgj
         CupA==
X-Gm-Message-State: AOJu0YyJNgLOkU46gz4m17wuIF7oqTwDrckUjlEEDEpmGesKAZLqPazh
        tQKpOXRDr+i7+aEDy2krT1zLzg==
X-Google-Smtp-Source: AGHT+IFkVSQqkmXL975Xr4Tk7VbbfLZbWMUu/vztJf9RRnyAzWDuQtXtUyT8v9C9jYYePa2KPNQ1rw==
X-Received: by 2002:a05:6870:9127:b0:1bc:d479:ed70 with SMTP id o39-20020a056870912700b001bcd479ed70mr1130390oae.25.1692317317112;
        Thu, 17 Aug 2023 17:08:37 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id n10-20020a17090a670a00b0025c1cfdb93esm349211pjj.13.2023.08.17.17.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 17:08:35 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        dmaengine@vger.kernel.org, Hector Martin <marcan@marcan.st>,
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
        Laxman Dewangan <ldewangan@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
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
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org, llvm@lists.linux.dev,
        linux-hardening@vger.kernel.org
Subject: [PATCH 18/21] dmaengine: ti: omap-dma: Annotate struct omap_desc with __counted_by
Date:   Thu, 17 Aug 2023 16:58:55 -0700
Message-Id: <20230817235859.49846-18-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1732; i=keescook@chromium.org;
 h=from:subject; bh=KkqTKiy8rqvFYl8aW58GCbimShLAkaRsCHzcvcCWSRw=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3rRBNQrQGSxUXSXTSL+LF23xeHTG1HiHDx+NZ
 DxNL9D2ClaJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN60QQAKCRCJcvTf3G3A
 JstED/45VAohOEERN7C2lIV4zZVuC4OumCYP+mNrRtNtNzgTirqKjGCFbY5TkcbFBX9k7DrLDgS
 O13YhKpbYpdvbWnGSeyb3uF+VGAi5gnoUyIqwH/qwyDHFXcWuO48mXo+cu/8YLZeJxa5E+W/SNR
 Dg83cQ0lXZmMqd8yYOc4SRNUpXBQGklpsswWwAaTe5TXdvq0b4jFPboIw88TEncJSXUKgmOajZC
 Bw259+NR+DyoqUms3n4xhOKHZYZcE/pVrnWV0dydmbg9C0arCn5GLThkZD05+PV5iKgN1AJmxTc
 hCzGYVh8UU74S3XB0OAIRRum0P/QVS65aFVd5ncstN3ivfSpgvS3F5wZh3bfEBY7rlt+meDWGNO
 kHm+TZ6D/Tru1vy3ISGD5DeUovqDen5gLBUN20wYUyEKCSWKzd5LzRAu1W3uoHXFz6HpdEaa3jn
 LIxAZTHuCeJ+sKoxAbf5nBMCfqUXZ/KB7jP7yzf/c2SB3hVND2jeQLo3WiaoMLsvBRHb2/D36dp
 h3JI9oFzJ0Oqo+tpdhBFiAGpUPqnLYk7MVqaIGrgT8DlN7QB/i/hzHQFmk85WOkneZu/WYLZL3w
 iLBlUGubkbGblD5s2sp0LMWS0T/r9yUD8u8ndim38nSwUlyLw9CObnOXtj+udrDiMzpNOcZW/OL v3VOa7tcLzm25MQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
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

As found with Coccinelle[1], add __counted_by for struct omap_desc.
Additionally, since the element count member must be set before accessing
the annotated flexible array member, move its initialization earlier.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: dmaengine@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/ti/omap-dma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ti/omap-dma.c b/drivers/dma/ti/omap-dma.c
index cf96cf915c0c..11ac3fc0a52a 100644
--- a/drivers/dma/ti/omap-dma.c
+++ b/drivers/dma/ti/omap-dma.c
@@ -124,7 +124,7 @@ struct omap_desc {
 	uint32_t csdp;		/* CSDP value */
 
 	unsigned sglen;
-	struct omap_sg sg[];
+	struct omap_sg sg[] __counted_by(sglen);
 };
 
 enum {
@@ -1005,6 +1005,7 @@ static struct dma_async_tx_descriptor *omap_dma_prep_slave_sg(
 	d = kzalloc(struct_size(d, sg, sglen), GFP_ATOMIC);
 	if (!d)
 		return NULL;
+	d->sglen = sglen;
 
 	d->dir = dir;
 	d->dev_addr = dev_addr;
@@ -1120,8 +1121,6 @@ static struct dma_async_tx_descriptor *omap_dma_prep_slave_sg(
 		}
 	}
 
-	d->sglen = sglen;
-
 	/* Release the dma_pool entries if one allocation failed */
 	if (ll_failed) {
 		for (i = 0; i < d->sglen; i++) {
-- 
2.34.1

