Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A84F02B6C40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 18:49:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730302AbgKQRtN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Nov 2020 12:49:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730253AbgKQRtM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Nov 2020 12:49:12 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81A1EC0617A6
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 09:49:11 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id b63so14161929pfg.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 09:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EAf9d4gGWEUWE1b+AMgq6WQ0FcZNv1uCLoEh96U6HDQ=;
        b=GrQmJSaliPTve3DL04A9GAepxzDBPQmaJDXflI0uIc24Ceqru5Te8SBteMXYibBiWV
         YXtyBkZcp4alV78euGq8ZrdXrY/s1xTOqwOzjdB/goMB33KUlG5kJWFx/V0Hqrk3JZEp
         zw7ndp6YX9rmihiKPQuebdAS2Wg2Jl1+n+zNJJHekxbJkjfpKusp/zA2T2t21GcxUBBV
         sZr+xgHWq6+/6X33ZHMmafEYZVgWboH6fcuIKZcdfC7uKZ/Gc2XP02Uwep7dMXIQHRUe
         AZFf9CI2yybVt/jWzI+IT2jw9m6POx/FLGVpicrbqCfBClD5HoQVjXuKaz0ESjdzURvc
         ZuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EAf9d4gGWEUWE1b+AMgq6WQ0FcZNv1uCLoEh96U6HDQ=;
        b=bUwSHPd8R+EtMakhGr30GlsaPej8a2h2hubi1LxDX99/2SjF4tbpKxPRwWe6lkLtEv
         kr96WCsEunSSpw4eKhMDaBWCNunPfw2DGyPrEXjiqFfIDo9BTih+scBcxyjE6CzfuGzt
         x+mSQ23Tjiq/WO5kCK+EH1j6JWFZ7dyYxNkWcgKan36jYr6LXxalQzPea+aSwpeQhCO1
         JPtkGjTGC6XIiGnRTIfNbzcKf47LV5p7lIHwPuo027Kds6LMJ38L+B6e8YvmatblqacU
         UFBdVQZake2MUPo3ozCipL7187xExTqNlk237Oj6KP1JCyWYzLcby7ntiH2e6OigKk+p
         dPcQ==
X-Gm-Message-State: AOAM531WXrXHLnmF5Td2xAJXf+hF2YNvAooaeQ/sBgH0b/c6yn8KTymG
        IDG/dJMOBzuLuF+eDaqMMlOS
X-Google-Smtp-Source: ABdhPJwxqq2K6RhfPEieDLWKql41cofe+24CsQYp9jpMXliRovzgKa7QgkEGeFPlq1NqV99mGfsR1w==
X-Received: by 2002:a65:55ce:: with SMTP id k14mr4432790pgs.65.1605635350991;
        Tue, 17 Nov 2020 09:49:10 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id 192sm22222810pfz.200.2020.11.17.09.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 09:49:10 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 4/4] mtd: parsers: afs: Fix freeing the part name memory in failure
Date:   Tue, 17 Nov 2020 23:18:45 +0530
Message-Id: <20201117174845.28684-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201117174845.28684-1-manivannan.sadhasivam@linaro.org>
References: <20201117174845.28684-1-manivannan.sadhasivam@linaro.org>
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

