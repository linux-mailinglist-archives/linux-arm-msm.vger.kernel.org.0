Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17FE27AB8B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Sep 2023 19:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233994AbjIVR4W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Sep 2023 13:56:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233907AbjIVR4C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Sep 2023 13:56:02 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03625272C
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Sep 2023 10:54:15 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-690f9c787baso2171355b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Sep 2023 10:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405255; x=1696010055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jdTn/0muvJtiHpvCIE7e0tTaPM/Ce4Zkoiyha7khL+I=;
        b=UlQxktioAjNkad4gZJKZ3WbYGMg5yIs0Yh9m2iDqQVXAgOoriuE0tSLDN+lA/IqKwH
         6hLhMgdAD89E9W4jXDkH/19Z3TaevNbAGRJTytxTFylNUFODC1jNz8u+GU7/s+/XJiQG
         PffFp1jOr+e8wQ79XoK7wGRyfeh0I0jVYzQ9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405255; x=1696010055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jdTn/0muvJtiHpvCIE7e0tTaPM/Ce4Zkoiyha7khL+I=;
        b=I/8ziuQd6pL5OdSwMfOId7CYcyhJhgR6jXqkmZy84jo2Gh+aSGv9tYnSk7wxRrtUdA
         0GzgEIKzpzmRV8/YQEI9RUVkYlPeM2OOSkuremnraNtKOi325E+xldYdbtbJhvhvGqIh
         aJbKZzQdaJcyob60Vxvs+iJ9ctVMpcEjIx0GzCGooXubwyFfdJAfMZ9dOkSRoVUI7rRJ
         BUlhnTAJysBKICLhCzgHDk+5rArMArroDHBUAupunf/OJH6xbTY6TNPzwQIYfRhObrag
         d3mIwlZYHiTF4wIDoDL1r03UxZ2IkMEaNW/NI40mPBPksQe5ilGXpHp95vynz4+w/hYO
         VUlQ==
X-Gm-Message-State: AOJu0YwqwwU9Nv974cR2z3QmLJwdvWg4sRvw/BCs/ueXe+FFm53anFi2
        ocy2lZnq2QElBJ0tog67Q0Uneg==
X-Google-Smtp-Source: AGHT+IHmKpHNU9aBKp4VBNBpbcxaBgcglJ1q+b7TgjvNi2g+nYDvvPPG+ayO9ELWEcqaEMGWJzYGIg==
X-Received: by 2002:a05:6a00:a1b:b0:691:1eb:7dda with SMTP id p27-20020a056a000a1b00b0069101eb7ddamr125247pfh.7.1695405255436;
        Fri, 22 Sep 2023 10:54:15 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id k15-20020aa792cf000000b0068a3f861b24sm3462729pfa.195.2023.09.22.10.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:54:15 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Andy Gross <agross@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-arm-msm@vger.kernel.org,
        llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: [PATCH] soc: qcom: smem: Annotate struct qcom_smem with __counted_by
Date:   Fri, 22 Sep 2023 10:54:14 -0700
Message-Id: <20230922175413.work.929-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341; i=keescook@chromium.org;
 h=from:subject:message-id; bh=QPRDelWAkTRqn7WkklPCzYdZBpFhCd5JrP57gKSvApU=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdTF73/unAW40zqEdxsHteb4OckB4oasGzAI8
 NOpnPkmZimJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3UxQAKCRCJcvTf3G3A
 JkzBD/4tqXg1cj8rIGdfiTLxyn+Fxw2EOGzdNwoaHT+gnQ4/WAFF+cBiQDT2pw5MErwxaFPvgTp
 nxLcMPJidI5ovUXQBW/ZmmX7O90D2J3ZEYdglHZa+igB3Y5IoFPr1ZKfMFYNBM0dcQmqFhKrWpW
 efiU/f2+Be+SS4g0eKcXI9WNlEXYuXkJ+GdH67IVoy0Pic9i/ng49XRXo25WO2jClcXKUQPK5zf
 NEg2VxWNLH92GFejJSP/yNWH6s1cPSezw17mzWthPUDQMo+N5asZtkgbOuHjVRt0nala2sjQqAo
 6TLnQLCQj7RIr818kuvGwDF3j45J2ec/0w7e8KIz/rIpLqu0MEwHLqbWvxrk3aH7vwhitPQ3E73
 UbuwnVKSaKsZ8r5p1OgT/QcV0wdx/51pXGa8ffvUGGwmrEdhH4lKxsNKxDzRy/dZcAQ2QRkcGPx
 rTiKQDfoLTwp+kXkd6vF6597phWgvNm6ePlS7/3tIPIz69azGs1Enezefya5sAYYbiTneBFOMLG
 Y6lqKInf5HKwR3R8S/3m4EzZsvN0M5jg4xhXSIfH5kRBJ9VDNWL0baQuXQqDeiYfi2DFhA32zK5
 AfrO6Wej/d4qssRVsFyEjZS0f4YAmRFbPNrwn2zeXDGHm0oKKPsBFXyazqjf6GT40wWfxuIB+Yf
 MxEssqC L+wdL2PA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
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

As found with Coccinelle[1], add __counted_by for struct qcom_smem.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Tom Rix <trix@redhat.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: llvm@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/soc/qcom/smem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index d4a89d2bb43b..4ce9cf1477ac 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -285,7 +285,7 @@ struct qcom_smem {
 	struct smem_partition partitions[SMEM_HOST_COUNT];
 
 	unsigned num_regions;
-	struct smem_region regions[];
+	struct smem_region regions[] __counted_by(num_regions);
 };
 
 static void *
-- 
2.34.1

