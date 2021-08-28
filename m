Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B65B73FA42A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Aug 2021 09:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233375AbhH1HDJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Aug 2021 03:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233352AbhH1HDI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Aug 2021 03:03:08 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8763CC0613D9
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Aug 2021 00:02:18 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id m6so3066pfh.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Aug 2021 00:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Oma39e4ztyqU/L0DrbCeGQ/UJAnQ1l0pUG/tIJG6wR4=;
        b=s/CUPMeDIpZQSgMbAi4HZ+h401BTKoxrEbc9dVPc2nFy6iY3o6sbC7Qf353urfMCQs
         w9jnKRqj1j3tV3hWJ17nzQGo35q/0sP7JslWmsiHHuFHNUJIwM4UfeETs8RN1Whcq2iV
         so7uqB51C89jgiA8CCb9uzfQ9zlMdW4NpEKZ23bj3L8B6G7e7TNTeouviZa72lHFQSoC
         lm+O0ooX7yHhwQhBR5oGOoK0f98056ycI+yhuxiCZqNmCTk27bFdCIxyKI07DqSFtDqF
         JvInMkxusmvsnqLFilFB1Fx4WX7r6CevezlsFacD2XECi2Em6eq0KJZNFoaEdA9VctWM
         hsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Oma39e4ztyqU/L0DrbCeGQ/UJAnQ1l0pUG/tIJG6wR4=;
        b=ZK6K38NCUlZ8Y8i06+ecdzFmNIYDN3xk1XGBYZomQts3OnR9y6MZB8sVhk7K1AkFTr
         AvDjVJm1GMFP+j3k750vFAeZ+DYhqAN8oN7TH1/zKYsQnwSwzmgNMAkUcPANhBmihMg/
         t4T3RAFByItSJh5MhBjJjGMoEwRE82TR8SgHiMXcrQnlSACtxktMPkR1kck7dUPE55jq
         BvyBp8eMihO8HEdXfHcO38RCJb1gGHtLqBiMh2UuqFssyhEbLo6d4xgymLD4L7B7aRp2
         h4POGK7L+PHROFfpUeX86IkboIk+wZCEdK5Y5MqxUXGKhp2WjkJosllp/oFs0wSkzUJP
         1uDQ==
X-Gm-Message-State: AOAM533n3x+m9/Jpk3J9/ELJQD9ldezMiGx+TdJGZbl1Ds7OyGb001l9
        /yVbmS+mdC4edjtsjkK+iBbNFA==
X-Google-Smtp-Source: ABdhPJyTaTawiH47b206zeHxorAa2CgewWiUPDH2sChn390F2XP81SNN0Mw8BqdcEEAMuApahnH6VA==
X-Received: by 2002:a63:1b60:: with SMTP id b32mr11188888pgm.422.1630134138055;
        Sat, 28 Aug 2021 00:02:18 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 141sm8674284pfv.15.2021.08.28.00.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 00:02:17 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2] soc: qcom: mdt_loader: Drop PT_LOAD check on hash segment
Date:   Sat, 28 Aug 2021 15:02:02 +0800
Message-Id: <20210828070202.7033-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PT_LOAD type denotes that the segment should be loaded into the final
firmware memory region.  Hash segment is not one such, because it's only
needed for PAS init and shouldn't be in the final firmware memory region.
That's why mdt_phdr_valid() explicitly reject non PT_LOAD segment and
hash segment.  This actually makes the hash segment type check in
qcom_mdt_read_metadata() unnecessary and redundant.  For a hash segment,
it won't be loaded into firmware memory region anyway, due to the
QCOM_MDT_TYPE_HASH check in mdt_phdr_valid(), even if it has a PT_LOAD
type for some reason (misusing or abusing?).

Some firmware files on Sony phones are such examples, e.g WCNSS firmware
of Sony Xperia M4 Aqua phone.  The type of hash segment is just PT_LOAD.
Drop the unnecessary hash segment type check in qcom_mdt_read_metadata()
to fix firmware loading failure on these phones, while hash segment is
still kept away from the final firmware memory region.

Fixes: 498b98e93900 ("soc: qcom: mdt_loader: Support loading non-split images")
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
Changes for v2:
- Update commit log based on the great disscussion with Marijn and Bjorn.

 drivers/soc/qcom/mdt_loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index eba7f76f9d61..6034cd8992b0 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -98,7 +98,7 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len)
 	if (ehdr->e_phnum < 2)
 		return ERR_PTR(-EINVAL);
 
-	if (phdrs[0].p_type == PT_LOAD || phdrs[1].p_type == PT_LOAD)
+	if (phdrs[0].p_type == PT_LOAD)
 		return ERR_PTR(-EINVAL);
 
 	if ((phdrs[1].p_flags & QCOM_MDT_TYPE_MASK) != QCOM_MDT_TYPE_HASH)
-- 
2.17.1

