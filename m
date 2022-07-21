Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B44C57D578
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 23:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbiGUVDu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jul 2022 17:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbiGUVDu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jul 2022 17:03:50 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08FDE904F8
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 14:03:49 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-31e55e88567so24091477b3.15
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 14:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=MypyzVZSccI/RyC46qp75Pb6XbMOH7vgHkqe/QUNPpo=;
        b=KGtiU3I1Yc2pPQ93b0InIC/VuuUUJbgRueIy0lePqllWiicPtHn7WKGz0btmVyk0nL
         aiESAnSPgMdxVpNrNxbm8kN8yCAVFNVcjTpucSpHAYSE/4g3cr+7PvvOcDS1S/WmdJX8
         1bAqIFb2pMUyuw6gH0P1UUR/bm+CYAqThTW+X12OC8EDQmew8lKXHz7R0gD25EtoIkQ4
         VUvy5J9eTKnl+OkrVTcPVKnTp4mJQs4yS7PHVCUCOqpffTDGby2D0gsUmTEr2m/Xa5Po
         7vSYyhpqZm4I52h3zF/v83BM8hHyPkWdvLqXeTCg1iWszKpT9akPaMxriel8j+qa6vNa
         3/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=MypyzVZSccI/RyC46qp75Pb6XbMOH7vgHkqe/QUNPpo=;
        b=1O4RCfDLuY76CJi0PpCORx6kKDUkaT/v1DRntN3UH+7oj3GYp6S7f73yyLQukrqFjp
         CedEof4O5kz59KLd83ts1EI7Oy9nUsAzl2sRRrL/pFdTcZjgraSTP8xBqkLmyMt4RJBw
         g78bUBvw8V2tdwVRZGl2Hg8BU3T38E/nbC47ksPHcCeRutrqvfc/7dDxgXV3rbJaxcvL
         fX52Ny/J6acG3CILsFlIQR0zBhEKcA+FLZhICY/Wf8e4u7P/M3OnMBEDd9iIFcDyzTtF
         V0/bn8VxULCm+XFQW0mmihAVSJHJIaSlsKDSOZmeEqg45o/vNfUGzYsba5bjPVc96Laj
         q84g==
X-Gm-Message-State: AJIora/ED4bTTwEhilLD2DA8a2LcyO4m7Rme0bVz7QBMrdoICTKuqEmQ
        1tIFfolVNevF4j6jwgSOQIU9fgQG4NDuKLlkGw==
X-Google-Smtp-Source: AGRyM1sxwUS7zWxfuhFmDg/oyvsoaf1Wwexumse7I9VvtS1d218Qh2nHKoK4HZcdCT8xWr/B9mnpWLyMLY0auVLITw==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:21e:d672:5a6a:420e])
 (user=justinstitt job=sendgmr) by 2002:a25:bd42:0:b0:670:be21:78a5 with SMTP
 id p2-20020a25bd42000000b00670be2178a5mr460245ybm.478.1658437428335; Thu, 21
 Jul 2022 14:03:48 -0700 (PDT)
Date:   Thu, 21 Jul 2022 14:03:31 -0700
Message-Id: <20220721210331.4012015-1-justinstitt@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
Subject: [PATCH] drivers: iommu: fix clang -wformat warning
From:   Justin Stitt <justinstitt@google.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When building with Clang we encounter the following warning:
| drivers/iommu/msm_iommu.c:603:6: error: format specifies type 'unsigned
| short' but the argument has type 'int' [-Werror,-Wformat] sid);

`sid` is an int, use the proper format specifier `%x`.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Reported-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Reported by Nathan here:
https://lore.kernel.org/all/YtmrCJjQrSbv8Aj1@dev-arch.thelio-3990X/

 drivers/iommu/msm_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 428919a474c1..6a24aa804ea3 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -599,7 +599,7 @@ static int insert_iommu_master(struct device *dev,
 
 	for (sid = 0; sid < master->num_mids; sid++)
 		if (master->mids[sid] == spec->args[0]) {
-			dev_warn(dev, "Stream ID 0x%hx repeated; ignoring\n",
+			dev_warn(dev, "Stream ID 0x%x repeated; ignoring\n",
 				 sid);
 			return 0;
 		}
-- 
2.37.1.359.gd136c6c3e2-goog

