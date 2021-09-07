Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC1CE40231D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Sep 2021 07:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238682AbhIGFoh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Sep 2021 01:44:37 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:56981 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238488AbhIGFog (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Sep 2021 01:44:36 -0400
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20210907054328epoutp04a9a99803f3c500568d5674c67b3dbcbf~ic90fZyy71093010930epoutp049
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Sep 2021 05:43:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20210907054328epoutp04a9a99803f3c500568d5674c67b3dbcbf~ic90fZyy71093010930epoutp049
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1630993408;
        bh=HTyqdQEDL7epIX9hTmn7Uw23uKGLryIvgU5mRk3lILA=;
        h=From:To:Cc:Subject:Date:References:From;
        b=ussoj/eYcPVabdWjnwwZ92+eIpGulPHXNnWGLEA/ycQ3LLkUdHLS18XcZj8LwQDvO
         +WlTwx6Dr7Wk1xciKlWZjrfJ2vDGe/U/10Ohj2FCVQevPYRB7iGvWmPoD98qktKNl3
         pgJKkslm4KnuCO2HEXVCUChZsJddOeZrACGSdAHs=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210907054327epcas1p209680e5cce58071affe65077b9eca1af~ic9zVL4fY2973829738epcas1p2Y;
        Tue,  7 Sep 2021 05:43:27 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.38.249]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4H3Z1m72sTz4x9Pt; Tue,  7 Sep
        2021 05:43:24 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
        epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        26.BB.09910.CFBF6316; Tue,  7 Sep 2021 14:43:24 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20210907054323epcas1p4eba3cc7c0c7c25dba22c404852069fea~ic9v3ESgf0824108241epcas1p4E;
        Tue,  7 Sep 2021 05:43:23 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210907054323epsmtrp1cff2aee56db03243995316ba7cb2b02b~ic9v2PQFX1548215482epsmtrp1e;
        Tue,  7 Sep 2021 05:43:23 +0000 (GMT)
X-AuditID: b6c32a35-c45ff700000026b6-8f-6136fbfc8f40
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        C9.E9.08750.BFBF6316; Tue,  7 Sep 2021 14:43:23 +0900 (KST)
Received: from localhost.localdomain (unknown [10.253.100.232]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210907054323epsmtip18b52eb91623cc0460c3af1da0e3f3d7c~ic9vobI-i0662506625epsmtip1D;
        Tue,  7 Sep 2021 05:43:23 +0000 (GMT)
From:   Chanwoo Lee <cw9316.lee@samsung.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        alim.akhtar@samsung.com, avri.altman@wdc.com, jejb@linux.ibm.com,
        martin.petersen@oracle.com, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     grant.jung@samsung.com, jt77.jang@samsung.com,
        dh0421.hwang@samsung.com, sh043.lee@samsung.com,
        ChanWoo Lee <cw9316.lee@samsung.com>
Subject: [PATCH] scsi: ufs-qcom: Remove unneeded code
Date:   Tue,  7 Sep 2021 14:35:54 +0900
Message-Id: <20210907053554.1005-1-cw9316.lee@samsung.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHJsWRmVeSWpSXmKPExsWy7bCmnu6f32aJBgv/Klmce/ybxeLBvG1s
        Fi9/XmWzOL3/HYvFjFNtrBb7rp1kt/j1dz27xaIb25gsdjw/w24xcf9ZdovLu+awWXRf38Fm
        sfz4PyaLpj/7WBz4PDat6mTzuHNtD5vHhEUHGD0+Pr3F4tG3ZRWjx+dNch7tB7qZAtijsm0y
        UhNTUosUUvOS81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJzgG5WUihLzCkF
        CgUkFhcr6dvZFOWXlqQqZOQXl9gqpRak5BSYFegVJ+YWl+al6+WlllgZGhgYmQIVJmRnLFm7
        hq3gH3/F2d+3mBsYl/J2MXJySAiYSJzb9Jmti5GLQ0hgB6PE7WWb2EASQgKfGCUurGaESHwG
        SqyezQTTcfvWTEaIol2MEm1/RSGKvjBKfLt/kr2LkYODTUBL4vYxb5C4iMA7RolVvc/AVjAL
        dDFK/DrYxQLSLSxgKvF/eQc7iM0ioCqxvO8l2GpeASuJ1g/LGSG2yUv8ud/DDBEXlDg58wlY
        LzNQvHnrbGaQoRICUzkkWk/8ZINocJG4/f0JM4QtLPHq+BZ2CFtK4mV/GztEQzOjxKnZ56Cc
        FkaJ11duQFUZS3z6/JkR5AdmAU2J9bv0IcKKEjt/z2WE2Mwn8e5rDytIiYQAr0RHmxBEiYrE
        nK5zbDC7Pt54zAphe0isXnSKHRJcsRKrnzxgm8AoPwvJP7OQ/DMLYfECRuZVjGKpBcW56anF
        hgWG8GhNzs/dxAhOuFqmOxgnvv2gd4iRiYPxEKMEB7OSCO9fc7NEId6UxMqq1KL8+KLSnNTi
        Q4ymwBCeyCwlmpwPTPl5JfGGJpYGJmZGJhbGlsZmSuK8jK9kEoUE0hNLUrNTUwtSi2D6mDg4
        pRqYDAPcnm7e9yh++cYVNy+qXz+z2/nWlv/uS3p+J/4I3hS23cRZVkAiU21PubQvS7Z72k9B
        XpPXgoWdaQLz39Y6n5o0gVG644CeyIqXHAfclI7ry7k0sKp+9DLaUd9Z7Pp8qvuUgCUsL3/d
        YUyPr1syk0PJ+q7BUoPrtSVC19YF/GNRlJ57RGexyrHZWx9H/Tu/kSMvNLjZuKfApuYfF/ek
        dzbZjwWORc1d4OC+w/7R21WlmWLsZfWsWrK9hxqm+r/uUfbbeucGd3/kMpOQmRN+KTDZieRP
        XKjQrtb215lztwpn87sTcblaRq+deattewS8Ap8eeCi820gz2UtS/kJtyu0JPzpu/upWrt9r
        JaXEUpyRaKjFXFScCACwqdjvQQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDLMWRmVeSWpSXmKPExsWy7bCSnO7v32aJBt0/NC3OPf7NYvFg3jY2
        i5c/r7JZnN7/jsVixqk2Vot9106yW/z6u57dYtGNbUwWO56fYbeYuP8su8XlXXPYLLqv72Cz
        WH78H5NF0599LA58HptWdbJ53Lm2h81jwqIDjB4fn95i8ejbsorR4/MmOY/2A91MAexRXDYp
        qTmZZalF+nYJXBlL1q5hK/jHX3H29y3mBsalvF2MnBwSAiYSt2/NZOxi5OIQEtjBKNF3+iAr
        REJKYvf+82xdjBxAtrDE4cPFEDWfGCX6b5xhBomzCWhJ3D7mDRIXEfjBKPHi0RewQcwCExgl
        Fl95ywwySFjAVOL/8g52EJtFQFVied9LNhCbV8BKovXDckaIZfISf+73MEPEBSVOznzCAmIz
        A8Wbt85mnsDINwtJahaS1AJGplWMkqkFxbnpucWGBUZ5qeV6xYm5xaV56XrJ+bmbGMERoKW1
        g3HPqg96hxiZOBgPMUpwMCuJ8P41N0sU4k1JrKxKLcqPLyrNSS0+xCjNwaIkznuh62S8kEB6
        YklqdmpqQWoRTJaJg1OqgUmY/SKX/q6vNjYznZ+lPPoztd7mwDVlUVPvA6v4py36XThdb7aP
        /CfJ772Jj8Vnzgs4mvfa5ItLSM6PMpUmmb2CR1tDNwqVa73YypXFqsK+SjKqVl+q81y1/Of7
        ev+Kurw5JVT/JE3LeSQ9o9bD+9G/74Vuyc7zmTXS9OSWbpYXf/53YQ23DIvM5t/FZk/U3nU/
        Ld/FuN+1NvOP3v8bvBXL5UOD+Xn3mDmr3qznei11fEmtmPuKdTf5WrQPruaLkbgwhcdo7U7P
        C9cOuYouML9ftf9N+MYz/5/tedgY0sGwX+E7T+YyPk8R9kSdfSnlkZcPq9yOXRp2aU16s9v5
        nXEGvLKSpy/0bv4z6cCOT0osxRmJhlrMRcWJAP7ycGHvAgAA
X-CMS-MailID: 20210907054323epcas1p4eba3cc7c0c7c25dba22c404852069fea
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210907054323epcas1p4eba3cc7c0c7c25dba22c404852069fea
References: <CGME20210907054323epcas1p4eba3cc7c0c7c25dba22c404852069fea@epcas1p4.samsung.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: ChanWoo Lee <cw9316.lee@samsung.com>

Checks information about tx_lanes, but is not used.

Since the commit below is applied, tx_lanes is deprecated.
 -[2/3] scsi/ufs: qcom: Remove ufs_qcom_phy_*() calls from host
 -Message ID	20180904101719.18049-3-vivek.gautam@codeaurora.org

As a result, link_startup_notify->POST_CHANGE action does nothing.
No need to read tx_lanes.
If it is not going to be updated, it looks like it can be removed.

Signed-off-by: ChanWoo Lee <cw9316.lee@samsung.com>
---
 drivers/scsi/ufs/ufs-qcom.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 9d9770f1db4f..124557525b5c 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -54,19 +54,6 @@ static void ufs_qcom_dump_regs_wrapper(struct ufs_hba *hba, int offset, int len,
 	ufshcd_dump_regs(hba, offset, len * 4, prefix);
 }
 
-static int ufs_qcom_get_connected_tx_lanes(struct ufs_hba *hba, u32 *tx_lanes)
-{
-	int err = 0;
-
-	err = ufshcd_dme_get(hba,
-			UIC_ARG_MIB(PA_CONNECTEDTXDATALANES), tx_lanes);
-	if (err)
-		dev_err(hba->dev, "%s: couldn't read PA_CONNECTEDTXDATALANES %d\n",
-				__func__, err);
-
-	return err;
-}
-
 static int ufs_qcom_host_clk_get(struct device *dev,
 		const char *name, struct clk **clk_out, bool optional)
 {
@@ -190,13 +177,6 @@ static int ufs_qcom_init_lane_clks(struct ufs_qcom_host *host)
 	return err;
 }
 
-static int ufs_qcom_link_startup_post_change(struct ufs_hba *hba)
-{
-	u32 tx_lanes;
-
-	return ufs_qcom_get_connected_tx_lanes(hba, &tx_lanes);
-}
-
 static int ufs_qcom_check_hibern8(struct ufs_hba *hba)
 {
 	int err;
@@ -566,9 +546,6 @@ static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
 		if (ufshcd_get_local_unipro_ver(hba) != UFS_UNIPRO_VER_1_41)
 			err = ufshcd_disable_host_tx_lcc(hba);
 
-		break;
-	case POST_CHANGE:
-		ufs_qcom_link_startup_post_change(hba);
 		break;
 	default:
 		break;
-- 
2.29.0

