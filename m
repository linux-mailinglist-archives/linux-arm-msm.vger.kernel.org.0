Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5354777FF08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Aug 2023 22:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354890AbjHQU35 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Aug 2023 16:29:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354882AbjHQU3q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Aug 2023 16:29:46 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AC8FE7C
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 13:29:44 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-26b0b4a7ccbso166056a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 13:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692304184; x=1692908984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bejKFOv40nW5UB4MPUX1sxxfyGTieb9ncD7oLPE8Z+s=;
        b=fYptxuJFfshCOLmmZrhf5HuczD8wuJzRHDJ4wviNpxjMi0hN8/mggISkYlF9w0ZfhS
         YsMt3R+tIzbtNfKct7Hi3eT7fPEX6IMmmfVr8Gm6E9YF9QodFrhWlGWer0iHwUIJxCT5
         pLl44wHboTNkaqXBon0LXFzgfguc03Po+aodw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692304184; x=1692908984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bejKFOv40nW5UB4MPUX1sxxfyGTieb9ncD7oLPE8Z+s=;
        b=T9T9Agwmy06wLOTSBksxhlUfH5nfzXkYR5/7amFy9Q+WcdYUSSSknPozqoh5kXllBE
         /qKLkOJFwBiuwaSHTwCMhC2iO+i29dskBaHyLlSDEpEpojTymQp2UrJKvMQb+pnnnwFc
         JF9+ZpTu35IMjhdImMwW9946CVtESKpxo0ZxY4JxBeZPJhPWVNHqK70l0Z6Xe/NI8KCa
         GAMTrxRq5VlU3AHakeZY6VXCjcrSp8+BmwE/G8jJ+p6p1z8v9QU4gTK0UYD4oKqq8keN
         PEqFXNuISHICxiEliEOV4WHvDW1LOljLutK6vuG09a55hmkdiq2Krx6yviFXXXBu+rE1
         G38A==
X-Gm-Message-State: AOJu0YxxP2PMGeK4dnybnOWVgpWtu0Os1xS5R5YyoIohFOQ2PMBWeoIe
        RlpqWUzs0YZKO3y3Xadd0CqsCg==
X-Google-Smtp-Source: AGHT+IGiH4SzY/KEf0E2Oted2OyIubhNNRotZNFfwFzlOOwI+VlZ21H5sEcaiHGghL/Ci/Eo6YFCdQ==
X-Received: by 2002:a17:90b:908:b0:268:5e70:508a with SMTP id bo8-20020a17090b090800b002685e70508amr506967pjb.43.1692304184132;
        Thu, 17 Aug 2023 13:29:44 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y8-20020a17090a644800b0026b30377c14sm199843pjm.6.2023.08.17.13.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 13:29:43 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: [PATCH] clk: qcom: clk-spmi-pmic-div: Annotate struct spmi_pmic_div_clk_cc with __counted_by
Date:   Thu, 17 Aug 2023 13:29:42 -0700
Message-Id: <20230817202941.never.657-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376; i=keescook@chromium.org;
 h=from:subject:message-id; bh=aFJ/owVNWGHnxeERrmpeKd9Wgvw1VegUqdSJfBbpzIM=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3oM2mSVeEUI0BEmGPEnqFczVCa6whyt25AvcE
 hvrr831zlWJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN6DNgAKCRCJcvTf3G3A
 JtdMEACgnhJmvLgodQJ8rW9IPTXTbiAam5FlhCmZbR2WmKf0Ja36KYox6Jz/WJs2YHNAfSmROIH
 e4UcfCZTrCQliTloC5BC89x/EROnGrOLBw5OqChHDbfwZJbUeLh8SGCBDBRRyZdyxKNG27G6MC+
 GEZ0v93DH46Whg696QZ4XiEPGEYK70Lsj/I5h9oIRzzFPbo62uOGQrYyd4eCHMLRNoBTHYlEU9+
 mNj65sIv1MJM/KxnpMqSgHrAgY+syi26RjVcUjKRPpnj0FlXQhGBe2NaWG8LIsArmsiXDrybdwL
 OOAGRls7POzBw+MfiOVsJREga2bGrv7keeGiwK52nFFWWGbruY+DNrIodgfLyCFxp2I7S964TLX
 OV+J1ga0kkq6c5843mNZi1eR31pKc0uXLoVxyniOUJ233r2FO8/m15ppymlY7Ba39ZOfL78vDKe
 Z+mAmAJ2tVAJbZeuHYxCYeJ1BVVG2ZrFzkcOTh2E3QBDfxzCT0ZjPpzwNRVrbC4N845wrAzSprp
 fx92t/OmaHZnjhwA1rC/Vgc7Tb6xYwTHiS0eII0rdUCIbO+G/X6HO7Z27dy2DG3IYJRWUaeB/U8
 beOhZk+EZGAQtjCDEohFQGJeIg9IKNWq9JG8AVElaPlylu+/pYtvn7XQRWDOKXrTHK2fi8ZCNe8
 5jXqDZ8 JkBvJD5g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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

As found with Coccinelle[1], add __counted_by for struct spmi_pmic_div_clk_cc.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/clk/qcom/clk-spmi-pmic-div.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-spmi-pmic-div.c b/drivers/clk/qcom/clk-spmi-pmic-div.c
index f846be285f51..f394031eb0e5 100644
--- a/drivers/clk/qcom/clk-spmi-pmic-div.c
+++ b/drivers/clk/qcom/clk-spmi-pmic-div.c
@@ -177,7 +177,7 @@ static const struct clk_ops clk_spmi_pmic_div_ops = {
 
 struct spmi_pmic_div_clk_cc {
 	int		nclks;
-	struct clkdiv	clks[];
+	struct clkdiv	clks[] __counted_by(nclks);
 };
 
 static struct clk_hw *
-- 
2.34.1

