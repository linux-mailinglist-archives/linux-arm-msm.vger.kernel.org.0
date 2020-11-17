Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE1D2B6C06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 18:41:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729742AbgKQRjr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Nov 2020 12:39:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729876AbgKQRjq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Nov 2020 12:39:46 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06193C0613CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 09:39:46 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id t12so896635pjq.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 09:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EAf9d4gGWEUWE1b+AMgq6WQ0FcZNv1uCLoEh96U6HDQ=;
        b=roejm7Op9Zg7DIDxR2z85W2idQGhDnJWcLxRVK9/FJgE4xP73woVLLM3cWiZlNukme
         7+xYxPb12cPLd+Nwpof5LdVtyYyAhs6qQ7FHzo4sK3gHh0Xx2Wtv8G9zgI36HcQnBFQm
         wKGkcZAMWGvS2Hqr7Gu0t5WgVOHwqNbmEGgziVOhQGPyvC011MB/JsNYjgpt3LFLUGPo
         Acd4A10Ljb3knE8r1khe/l2wZxdZajD+HcPx7IjGqAReaUTDHa3ri/fAE6xuo7CA/MpO
         zYoRNRYMQ9DHMlSXNT+ckd/V5j9z/Nizr4H4DFkCaRPLwCRDeUxnQxd13waGTyExsCLg
         ECdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EAf9d4gGWEUWE1b+AMgq6WQ0FcZNv1uCLoEh96U6HDQ=;
        b=lJuobGeBHGZiBB9qegJv52v6XH7YbEONBE5dG2LYHfUA8SC4pBc3fN9yheUE/mtd6V
         Q/0ndHdZC0GpwoY/B0LW/fcpbeirJWpGHoIDtVsjb6cAvQ9d7S2Y9YznHOZX74hazBC9
         LdhIBrMP+CJ3oU2aaToefv4UNyaKVVbCI0Wpa8RAs9puzxc1+BuL21ypG2m8BAEisIk9
         IafHnI6eM4L4lwCAhs7169Q1IxPsEz3Qn13gAjjMwVHBp83SVhy8D+vngAbgWQMv1MBv
         qDa3atdWXSd9XEC3eQlvVuy9g7EHrHc0fxBbK+IlK2XUFEgpH086x47V7ZZXo+d1bJgk
         a8iQ==
X-Gm-Message-State: AOAM531b4bMoBqpbzOXPbEHzrpIl28e+MayQ/Dy0wMtd9jtveEBGKxUr
        JlRB6lCQQ39BYZyJz/YCVWTA
X-Google-Smtp-Source: ABdhPJwB2H0ru1rDI9vN4pDM/1VqZieHatMHr5QNK9SyRs7wdkDFRvOEa/dKnxkDSTZFI1x7nSplCA==
X-Received: by 2002:a17:90b:a54:: with SMTP id gw20mr198504pjb.178.1605634785524;
        Tue, 17 Nov 2020 09:39:45 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id a21sm1751330pjq.37.2020.11.17.09.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 09:39:44 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 4/4] mtd: parsers: afs: Fix freeing the part name memory in failure
Date:   Tue, 17 Nov 2020 23:09:09 +0530
Message-Id: <20201117173909.23585-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201117173909.23585-1-manivannan.sadhasivam@linaro.org>
References: <20201117173909.23585-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the case of failure while parsing the partitions, the iterator should
be pre decremented by one before starting to free the memory allocated
by kstrdup(). Because in the failure case, kstrdup() will not succeed
and thus no memory will be allocated for the current iteration.

Cc: Linus Walleij <linus.walleij@linaro.org>
Fixes: 1fca1f6abb38 ("mtd: afs: simplify partition parsing")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/parsers/afs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/parsers/afs.c b/drivers/mtd/parsers/afs.c
index 980e332bdac4..26116694c821 100644
--- a/drivers/mtd/parsers/afs.c
+++ b/drivers/mtd/parsers/afs.c
@@ -370,10 +370,8 @@ static int parse_afs_partitions(struct mtd_info *mtd,
 	return i;
 
 out_free_parts:
-	while (i >= 0) {
+	while (--i >= 0)
 		kfree(parts[i].name);
-		i--;
-	}
 	kfree(parts);
 	*pparts = NULL;
 	return ret;
-- 
2.17.1

