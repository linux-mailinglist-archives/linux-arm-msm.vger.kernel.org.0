Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 259042B8C1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Nov 2020 08:14:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgKSHNm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Nov 2020 02:13:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726375AbgKSHNl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Nov 2020 02:13:41 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C729AC0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2020 23:13:41 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id t8so3572318pfg.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2020 23:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aapWpWlyJG4BRZvNWpxnSiKXabtbA1WEoNDKMnXBWMg=;
        b=qgWlpJRtvQvY++Dn2/UpaiG/tLsPm+RlkTuBkKurklKGiW6comp6026pG/rrJE5H9s
         Jvk8jJuWq4Rmp7o3owcGR826LFXlnudvx23sSDp7tOXziagznab4Xu/yqFRqW91nuLpg
         oddCSmZB+jJQZcvwEZy+kadZpuFNxNRVyHJOXrjEsjC3XSrDx5kYfxTW9YHmyjS9YH5o
         sgRWaev0MOcbaeZrDF5y0KNkiRpi/kko7dycJ4xxtMSLRG1WgLOpHPXTmUa8T0Lwj487
         Z2bzhg0NQVo1PhiaH/PrUtoyRFbTUM47fiwe92cnxelpWzoWVcdqwTR5ci+L8dRHwkQR
         Ixgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aapWpWlyJG4BRZvNWpxnSiKXabtbA1WEoNDKMnXBWMg=;
        b=WxHHAgLT+06iMtn4PWe8HAil11e39o+3iIT/IFvEWgCg7PBi1hCq/kCjmWmuUFDphs
         RdcSyrdzYdt8baArkqhvDcwWFgMsW8SxZUymMinUaSS8h6Mqg+OQmVGy8ig+dglBwUi6
         KZbqhikQxrY6EbvMSKu5vVsrbyWOoLsYcLfIKm4Ufufqb234qoVPa0DpT01iNwKbpCZT
         X5x5Y05NUQCImK3Hr/INaEohrK+KB40C2tMjCG/rdWs6/JyroXLcclrnp/PBd0uEftHq
         aLlxaNFoNq7HjLzhZmF3vxL0S09Cq3kBxG5ezFdlm/hYEmRFlFFxA+rQzTvtKorMwdVv
         uQkw==
X-Gm-Message-State: AOAM531MDBpDsgy1IX+cTLM3avdZjEy/hOTe0xmfznjwbnEeXcngYQEe
        zLesQdy/H+Cr+xwAbScxkfeI
X-Google-Smtp-Source: ABdhPJwcInvozb/zTCyAg8emYQVQFmIX2bAwu06mXAwj/87oGn8Q4Nm3DbiDeHZzBrzSc5OLOLtxVA==
X-Received: by 2002:a62:8608:0:b029:18b:a8e:ee9 with SMTP id x8-20020a6286080000b029018b0a8e0ee9mr8008802pfd.65.1605770021344;
        Wed, 18 Nov 2020 23:13:41 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id 12sm5491577pjt.25.2020.11.18.23.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 23:13:40 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 4/4] mtd: parsers: afs: Fix freeing the part name memory in failure
Date:   Thu, 19 Nov 2020 12:43:08 +0530
Message-Id: <20201119071308.9292-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119071308.9292-1-manivannan.sadhasivam@linaro.org>
References: <20201119071308.9292-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the case of failure while parsing the partitions, the iterator should
be pre decremented by one before starting to free the memory allocated
by kstrdup(). Because in the failure case, kstrdup() will not succeed
and thus no memory will be allocated for the current iteration.

Cc: Linus Walleij <linus.walleij@linaro.org>
Fixes: 1fca1f6abb38 ("mtd: afs: simplify partition parsing")
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
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

