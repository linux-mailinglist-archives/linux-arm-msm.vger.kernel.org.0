Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0D02355C0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Aug 2020 08:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgHBGxb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Aug 2020 02:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725850AbgHBGxb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Aug 2020 02:53:31 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7AF4C06174A;
        Sat,  1 Aug 2020 23:53:30 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id f1so30808265wro.2;
        Sat, 01 Aug 2020 23:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=rs54B29tWCCrVhPxX04t7FFEWHnrLOxSKBgk2U1YFCA=;
        b=caiM1fPnBhKvSeFdy1yX0uOl+tlPe4753gxbKBZEzWEgr6vZKU9rmQ60bEnTBrDSs6
         gJOsHkGP1rNPQ+qvIpQZ5cj6Q+9osarcGlzLhvhYpjH0MeetPbVxbB58F5M7UvCAE+FJ
         vnUg/jGtxOyOdkWcWTou73fL2CSkr1vHa0xJQT9gzuK68gy5LXWg2qTsnq3TrPf7m217
         UQXwxadJuStCyop06PfNfgJMBskS8fTeZ7d0DoxRX7NUspkORquJO6o3G54oTbwS8/bj
         ICISk4CRzmp+JUvmwyTSNDbory9P0oUOajXOQ9NkUYjV1UXJ78EA92za88r5GmxTviOv
         ObvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=rs54B29tWCCrVhPxX04t7FFEWHnrLOxSKBgk2U1YFCA=;
        b=Dbjt2k1pIDPvqXhgi8wRGnuIz7GN2YrlzfQ4PBFy+St7ZeaRo/R3ueaFbnAfhWRHYl
         1kK+j8YpUCCAisCaHdhEWEjgmK1TNYCaiYikgJoDDfq6uuQWT+pHAdvS0DMPelvWONVa
         Wkrn+/8XSM3BV0RMTP4RS8th3HcsiH+DXrSg9r15LiZvvBR2zcPzNjMym9zjd6zrMmlU
         +gkk9n5obKh0k21FfbCySUs/jBkI+5mPeb3HSdrYNh71K+VEOzRI3VPVoGt0dfJw+rAV
         pWVtqzv8KmPEmatTkZHRWPDz9pC9yU1pa9VzCnrFhvxE3StlNKV10krUx07uceIVCZzO
         skgQ==
X-Gm-Message-State: AOAM530P8qiHpNjZT65bPSM4lKARy7Gcl0tVMnVHx6FuGz4V+hKafnNS
        5rcMfBxwn1D1mHxXy0pnscoKA0lZp2A=
X-Google-Smtp-Source: ABdhPJzU737g4BQ0PI02QtqBBrYd5JaxPm0earZrC3QMVjeilkQqYT0dbhQi2VFzRmn+G1KvW9DkHA==
X-Received: by 2002:a5d:4610:: with SMTP id t16mr10494065wrq.101.1596351209301;
        Sat, 01 Aug 2020 23:53:29 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2dd3:b900:b425:3ccc:d91f:7988])
        by smtp.gmail.com with ESMTPSA id m126sm18166966wmf.3.2020.08.01.23.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2020 23:53:28 -0700 (PDT)
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
Subject: [PATCH] MAINTAINERS: update QUALCOMM IOMMU after Arm SSMU drivers move
Date:   Sun,  2 Aug 2020 08:53:20 +0200
Message-Id: <20200802065320.7470-1-lukas.bulwahn@gmail.com>
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
---
Will, please ack.
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

