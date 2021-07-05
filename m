Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADB933BB75B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jul 2021 08:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbhGEG7m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jul 2021 02:59:42 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:16430 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbhGEG7m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jul 2021 02:59:42 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210705065704euoutp0127f5e54c3411937d72795dcc47a5ef6f~O0rzzFsB51000310003euoutp01X
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jul 2021 06:57:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210705065704euoutp0127f5e54c3411937d72795dcc47a5ef6f~O0rzzFsB51000310003euoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1625468224;
        bh=Rn6oui8vNSOkba5+SL9hOQCcwE6W7/neAD8+y9vs3gY=;
        h=From:To:Cc:Subject:Date:References:From;
        b=ZLp/xms0USWtQpdfN4vwt8eg7e7Vt4Qb9LDuue8r6sGBT5a5ifCwmgSlR6PPtrV4R
         ojYAtFRslq7MpydzI9OtuxqancFp67IeG2GByKf1Bw7ImvWBctu4oaUlw+VWeVyQM0
         +bGGMkk/4197CTe6vf5blwa9mYnXHzq3NAlXhT7c=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210705065703eucas1p24403b2842e74f7d843f8d77ce61aab6e~O0rzFHrJb2770227702eucas1p2g;
        Mon,  5 Jul 2021 06:57:03 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 07.1F.45756.F3DA2E06; Mon,  5
        Jul 2021 07:57:03 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210705065703eucas1p2e89258a2fc286896b755047e06f514cb~O0ryjuym82752127521eucas1p2c;
        Mon,  5 Jul 2021 06:57:03 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210705065703eusmtrp2704ec35040dd29269ebdc309b2f114f3~O0ryi_AuN1229112291eusmtrp2q;
        Mon,  5 Jul 2021 06:57:03 +0000 (GMT)
X-AuditID: cbfec7f2-7d5ff7000002b2bc-e7-60e2ad3f3ff7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 70.FC.31287.E3DA2E06; Mon,  5
        Jul 2021 07:57:02 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210705065702eusmtip15a3d78a6d0c3d1a4c75d47a32eb85aff~O0ryAs9NO0308503085eusmtip1I;
        Mon,  5 Jul 2021 06:57:02 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Amey Narkhede <ameynarkhede03@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>
Subject: [PATCH] iommu: qcom: Revert
 "iommu/arm: Cleanup resources in case of probe error path"
Date:   Mon,  5 Jul 2021 08:56:57 +0200
Message-Id: <20210705065657.30356-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpileLIzCtJLcpLzFFi42LZduzneV37tY8SDDYeVrS4tH0Zq8WC/dYW
        nbM3sFtsenyN1WLi/rPsFmuP3GW3eL7wB7PFwQ9PWC369gZZtNwxdeDyeHJwHpPHmnlrGD12
        zrrL7rFpVSebx+Yl9R6Tbyxn9Ohtfsfm0bdlFaPH501yAZxRXDYpqTmZZalF+nYJXBldh58z
        FZzhq1hw5QlLA+MWni5GDg4JAROJl7uFuxi5OIQEVjBKfJx/gRHC+cIosXnqBXYI5zOjxIaF
        24AcTrCOLd0TWCESyxkl1v76xQLX8mPzdVaQKjYBQ4mut11sILaIQLZEw/FWsFHMAu1MEjem
        rmUGSQgLJEqsadkAVsQioCox5ctRMJtXwFZi5qrHjBDr5CVWbzjADNIsIbCWQ+L6ikdMEAkX
        if27LrNA2MISr45vgbpPRuL/zvlMEA3NjBIPz61lh3B6GCUuN82AGmstcefcLzZQGDALaEqs
        36UPEXaUePV3JxskaPgkbrwVBAkzA5mTtk1nhgjzSnS0CUFUq0nMOr4Obu3BC5eYIWwPiTnP
        J4GdJiQQK7Hz+CfmCYxysxB2LWBkXMUonlpanJueWmyYl1quV5yYW1yal66XnJ+7iRGYTE7/
        O/5pB+PcVx/1DjEycTAeYpTgYFYS4RWZ8ihBiDclsbIqtSg/vqg0J7X4EKM0B4uSOO+q2Wvi
        hQTSE0tSs1NTC1KLYLJMHJxSDUyeOd62vw+IhG9dlrjzaVl9g6j8xhtuNtrJJyKnFMr8rL5w
        X6KV42eUqq+wxXXOgICGzUIP5UsXcInsUtM72zV/Q0FQS8uUeSqvLIt9fr0QEP+znLXz0U+F
        ys5Zi0S8LsmquV8O/blv62qFH7e+1lqbKLGv6Yq4u+BRzrKQ9xHBBrd/1XjbOsi+kklkduC+
        wKUmxP2MTbbgvk+CpfzhpunWawqFvlqz6J+xfWr7jLVBxXLLnsIXalyhu+zLSs0O+5+7+yig
        dP3uMwqfvkgekyhaazzjzrSFx62mL72mxVKRetR6+c8Okw3BUnkrdt7g36vN+URERyY0UlD5
        8mbeHtXpfY1bbeYYShhpPts8W4mlOCPRUIu5qDgRAAAccB2VAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBLMWRmVeSWpSXmKPExsVy+t/xu7p2ax8lGDxYYmNxafsyVosF+60t
        OmdvYLfY9Pgaq8XE/WfZLdYeuctu8XzhD2aLgx+esFr07Q2yaLlj6sDl8eTgPCaPNfPWMHrs
        nHWX3WPTqk42j81L6j0m31jO6NHb/I7No2/LKkaPz5vkAjij9GyK8ktLUhUy8otLbJWiDS2M
        9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DK6Dj9nKjjDV7HgyhOWBsYtPF2MnBwS
        AiYSW7onsHYxcnEICSxllJh17BorREJG4uS0BihbWOLPtS42iKJPjBJvtx9gAUmwCRhKdL0F
        SXByiAjkShxunsUIUsQs0MsksWPaY7BuYYF4iRNty8EaWARUJaZ8OQrWwCtgKzFz1WNGiA3y
        Eqs3HGCewMizgJFhFaNIamlxbnpusaFecWJucWleul5yfu4mRmAQbzv2c/MOxnmvPuodYmTi
        YDzEKMHBrCTCKzLlUYIQb0piZVVqUX58UWlOavEhRlOgfROZpUST84FxlFcSb2hmYGpoYmZp
        YGppZqwkzrt17pp4IYH0xJLU7NTUgtQimD4mDk6pBqau1ZMv3J7B1z3pxjkPR5HjPT1f+I4+
        vbR+s5+4v5Fp5rHX7D815J2130etUV8UumzyYflj35XypzS8lmqbvakj9nF0SZRJg29JjIPt
        Aq+uuyvesLuZ/HA3KA16zcvfZLRY1sB6vtO3/O8vv+9ucJjEvzbvc2H6oz2/Hvp+5l6x5e4t
        p7jFMzzXzLEuDvx3/H2+8YyXesEaor1xR+3eTtxczLZknluOyff2cMEaCbONW1yD581s1r9T
        bDrr/z0hkZqOzBN1TuphT92VhPpUkvVCVxgIHGdY0qBRGhI306Ppi8Op3UcW72z4++jG8YBb
        jFt2dYtpCZQ/Tj3+5/KTpR8nRklxsylPkwuSbnTffleJpTgj0VCLuag4EQC9ltwG6wIAAA==
X-CMS-MailID: 20210705065703eucas1p2e89258a2fc286896b755047e06f514cb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210705065703eucas1p2e89258a2fc286896b755047e06f514cb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210705065703eucas1p2e89258a2fc286896b755047e06f514cb
References: <CGME20210705065703eucas1p2e89258a2fc286896b755047e06f514cb@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QCOM IOMMU driver calls bus_set_iommu() for every IOMMU device controller,
what fails for the second and latter IOMMU devices. This is intended and
must be not fatal to the driver registration process. Also the cleanup
path should take care of the runtime PM state, what is missing in the
current patch. Revert relevant changes to the QCOM IOMMU driver until
a proper fix is prepared.

This partially reverts commit 249c9dc6aa0db74a0f7908efd04acf774e19b155.

Fixes: 249c9dc6aa0d ("iommu/arm: Cleanup resources in case of probe error path")
Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 25ed444ff94d..021cf8f65ffc 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -849,12 +849,10 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 	ret = iommu_device_register(&qcom_iommu->iommu, &qcom_iommu_ops, dev);
 	if (ret) {
 		dev_err(dev, "Failed to register iommu\n");
-		goto err_sysfs_remove;
+		return ret;
 	}
 
-	ret = bus_set_iommu(&platform_bus_type, &qcom_iommu_ops);
-	if (ret)
-		goto err_unregister_device;
+	bus_set_iommu(&platform_bus_type, &qcom_iommu_ops);
 
 	if (qcom_iommu->local_base) {
 		pm_runtime_get_sync(dev);
@@ -863,13 +861,6 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 	}
 
 	return 0;
-
-err_unregister_device:
-	iommu_device_unregister(&qcom_iommu->iommu);
-
-err_sysfs_remove:
-	iommu_device_sysfs_remove(&qcom_iommu->iommu);
-	return ret;
 }
 
 static int qcom_iommu_device_remove(struct platform_device *pdev)
-- 
2.17.1

