Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C47625119B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Aug 2020 07:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728640AbgHYFio (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Aug 2020 01:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728145AbgHYFin (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Aug 2020 01:38:43 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D22C061574;
        Mon, 24 Aug 2020 22:38:42 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id si26so14862670ejb.12;
        Mon, 24 Aug 2020 22:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Cvb0A9IRVLSsoFCfcZyj1U4yUSMM5vQl3gQOUmNeIGo=;
        b=G++tiKuDShN9pc23dyIevDr+cZBVwyC7VvsI4bEXClMei5oqFqjWi94wCCneP/vKy0
         LexpHU99oSZzMjQcL+WLa4F5lm87dhEquZAmwrqATs1/wGGpZwgxDxBNQPvBb7jgAh17
         UpoIdxBgpYRu6+E5uy8j0oDtBzuaQul0b5ThXf5n/aTRdTT4PYZPXarS1zYN74+cDT1W
         qUttZUMeEvPpPyvlaZvpPe9npBne9X4v/bGcSPs0M3QkqUSnnO9Vhh4MVm2FM0cngDLp
         8Y4Ju+KPzw357U9ckQDm9wXsztmLWj36MqIyEnE56zNf7rVm7TBqqwTHx4AeI/pTwjGk
         grYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Cvb0A9IRVLSsoFCfcZyj1U4yUSMM5vQl3gQOUmNeIGo=;
        b=RGt3H2Bwn+4CwHl621NUI2BV4Liu0Y5Y0zcegURorM04CqtBDsoRTZrOGcL5XbrqtS
         BDVghFa5J8fTQYeri2YbvZzd+ruCjG8YQxtNyBGjjc1UHuuXKZ7OvndVhaTGTEr1d7L+
         ofZT+YfmHIYIYvuA1vaPyo4/dKV4eDWBeibMnwrQP6BK7xOM9KRHkjOWBVh4K4jlGqbs
         KIDXuRmYW3+hRzZ7vs6EJBo061qrnBIJP5zRR02GTxBAlEbbnA05GED6ZObCjjrofm9o
         jXMaJld423S5GYbDC5Vn5cuWjse0HddWd15XdO4tuwVPmCHz7vV6/JbyvVy9RjfQ3JeP
         WZ4Q==
X-Gm-Message-State: AOAM533bSVe/2mbTtRVEXwu2K5chTHZpuF883UUT/6KrO7e6cxqwcVGW
        w8lyAcyyQvdqRNMhu7TW6X8U/v/QKUhZ6w==
X-Google-Smtp-Source: ABdhPJyRUIKUbRUhlOKBBMsu5/OxI8cNrhveYOeqRDXItbKYX5J13lRtTjQy9/UFSHUieFtfPvPmcw==
X-Received: by 2002:a17:906:a219:: with SMTP id r25mr9055831ejy.201.1598333921147;
        Mon, 24 Aug 2020 22:38:41 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2d83:7500:a091:6d55:fb72:2347])
        by smtp.gmail.com with ESMTPSA id dn7sm11802273ejc.76.2020.08.24.22.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 22:38:40 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>, kernel-team@android.com,
        iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH v2] MAINTAINERS: update QUALCOMM IOMMU after Arm SMMU drivers move
Date:   Tue, 25 Aug 2020 07:38:28 +0200
Message-Id: <20200825053828.4166-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit e86d1aa8b60f ("iommu/arm-smmu: Move Arm SMMU drivers into their own
subdirectory") moved drivers/iommu/qcom_iommu.c to
drivers/iommu/arm/arm-smmu/qcom_iommu.c amongst other moves, adjusted some
sections in MAINTAINERS, but missed adjusting the QUALCOMM IOMMU section.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches    F:    drivers/iommu/qcom_iommu.c

Update the file entry in MAINTAINERS to the new location.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Acked-by: Will Deacon <will@kernel.org>
---
v1: https://lore.kernel.org/lkml/20200802065320.7470-1-lukas.bulwahn@gmail.com/
v1 -> v2: typo fixed; added Will's Ack.

Joerg, please pick this minor non-urgent patch for your -next branch.

applies cleanly on next-20200731

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1469cb81261d..e175c0741653 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14358,7 +14358,7 @@ M:	Rob Clark <robdclark@gmail.com>
 L:	iommu@lists.linux-foundation.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
-F:	drivers/iommu/qcom_iommu.c
+F:	drivers/iommu/arm/arm-smmu/qcom_iommu.c
 
 QUALCOMM IPCC MAILBOX DRIVER
 M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
-- 
2.17.1

