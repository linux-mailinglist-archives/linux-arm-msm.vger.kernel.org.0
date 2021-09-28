Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49D3041A741
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 07:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235647AbhI1Fue (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 01:50:34 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:32686 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234207AbhI1Fue (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 01:50:34 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20210928054852epoutp0459425f97ee9fd1a5139a85101e950371~o5liQ8AEQ0923709237epoutp04B
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 05:48:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20210928054852epoutp0459425f97ee9fd1a5139a85101e950371~o5liQ8AEQ0923709237epoutp04B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1632808133;
        bh=n8sLwjT3z5cbfy0kjTPTWLnrkYB113KneiW60rXVgSM=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=uCt75kSabuZq8hcM4AU49x346jwkGlHtOKxoQ5tEXwlw2gmCKn1kIxmA8RRROVuCX
         cs+pZAP/UXNoqxiykSeXo9NH3+XaHM52cXN6r0FKU/q2+rMgSUCj/s79oAkHeAdQlt
         8JH363qgxNvIdOG0ZggsGXHnEfbYEz9F0gL4L0v8=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas5p4.samsung.com (KnoxPortal) with ESMTP id
        20210928054852epcas5p487b3796524da928e9b4f8d40c96f2624~o5lh1Teco1142611426epcas5p4T;
        Tue, 28 Sep 2021 05:48:52 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.179]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4HJT8H0Sbgz4x9QM; Tue, 28 Sep
        2021 05:48:47 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
        epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
        0D.BF.38346.9BCA2516; Tue, 28 Sep 2021 14:48:41 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
        20210928053943epcas5p1273beec6d0cdc9faa15a0fa55b67ea31~o5diGiX4E0173401734epcas5p1g;
        Tue, 28 Sep 2021 05:39:43 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210928053943epsmtrp269981a5d1dc9d3f1489c13070f2a7060~o5diE-wld1692616926epsmtrp2Q;
        Tue, 28 Sep 2021 05:39:43 +0000 (GMT)
X-AuditID: b6c32a4b-23bff700000095ca-f9-6152acb95d80
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        D2.A1.08750.E9AA2516; Tue, 28 Sep 2021 14:39:42 +0900 (KST)
Received: from alimakhtar03 (unknown [107.122.12.5]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20210928053939epsmtip23af010681bee322527ffb983195f39cc~o5dfFUIC11432514325epsmtip2k;
        Tue, 28 Sep 2021 05:39:39 +0000 (GMT)
From:   "Alim Akhtar" <alim.akhtar@samsung.com>
To:     "'Bao D. Nguyen'" <nguyenb@codeaurora.org>, <cang@codeaurora.org>,
        <asutoshd@codeaurora.org>, <martin.petersen@oracle.com>,
        <linux-scsi@vger.kernel.org>
Cc:     <linux-arm-msm@vger.kernel.org>,
        "'Avri Altman'" <avri.altman@wdc.com>,
        "'James E.J. Bottomley'" <jejb@linux.ibm.com>,
        "'Bean Huo'" <beanhuo@micron.com>,
        "'Stanley Chu'" <stanley.chu@mediatek.com>,
        "'Bart Van Assche'" <bvanassche@acm.org>,
        "'Jaegeuk Kim'" <jaegeuk@kernel.org>,
        "'Adrian Hunter'" <adrian.hunter@intel.com>,
        "'Keoseong Park'" <keosung.park@samsung.com>,
        "'open list'" <linux-kernel@vger.kernel.org>
In-Reply-To: <70c5376129f902b6b3e9940ea3b10f147bf18a10.1632171047.git.nguyenb@codeaurora.org>
Subject: RE: [PATCH v1 1/2] scsi: ufs: export hibern8 entry and exit
Date:   Tue, 28 Sep 2021 11:09:37 +0530
Message-ID: <000701d7b42b$3cc69680$b653c380$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFSrXMYWf6xZll5STjad3GlX/AECgJ09uJGAZBhtUOsos4ScA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIJsWRmVeSWpSXmKPExsWy7bCmpu7ONUGJBj9ecVmcfLKGzWJv2wl2
        i5c/r7JZHHzYyWIx7cNPZotP65exWjxZP4vZYtGNbUwWx0++Y7SYuP8su8XlXXPYLLqv72Cz
        WH78H5PFx67ZjBZLt95kdOD3uHzF2+NyXy+Tx+I9L5k8Nq3qZPOYsOgAo0fLyf0sHt/Xd7B5
        fHx6i8Wjb8sqRo/Pm+Q82g90MwVwR2XbZKQmpqQWKaTmJeenZOal2yp5B8c7x5uaGRjqGlpa
        mCsp5CXmptoqufgE6Lpl5gD9oqRQlphTChQKSCwuVtK3synKLy1JVcjILy6xVUotSMkpMCnQ
        K07MLS7NS9fLSy2xMjQwMDIFKkzIzui6cJKxoEmqYsWTVpYGxjNiXYycHBICJhJ9UzawdzFy
        cQgJ7GaUeLfzJCtIQkjgE6PE4odJEInPjBIPb9xihOmYNX01M0RiF6PEkSXtUM5LRokpW46z
        g1SxCehK7FjcxgaSEBFYwCjReeEcK4jDLLCaWeLN0ZlgVZwCsRKPF31hAbGFBVwkVu6+CWaz
        CKhK/JixnAnE5hWwlPj3aA0LhC0ocXLmEzCbWUBeYvvbOcwQNylI/Hy6DOxwEQEniSl3elkh
        asQlXh49AvadhEAzp8SDu0+hnnCR+L9lOxuELSzx6vgWdghbSuLzu71AcQ4gO1uiZ5cxRLhG
        Yum8YywQtr3EgStzWEBKmAU0Jdbv0ocIy0pMPbWOCWItn0Tv7ydMEHFeiR3zYGxVieZ3V6HG
        SEtM7O5mncCoNAvJZ7OQfDYLyQezELYtYGRZxSiZWlCcm55abFpgnJdaDo/x5PzcTYzgtK7l
        vYPx0YMPeocYmTgYDzFKcDArifAGs/gnCvGmJFZWpRblxxeV5qQWH2I0BQb3RGYp0eR8YGbJ
        K4k3NLE0MDEzMzOxNDYzVBLn/fjaMlFIID2xJDU7NbUgtQimj4mDU6qB6dIZZdd3P2K3ztXn
        fBAQ17illXcjryV/UcD2y4Ff+tkqV5fP0LZYOan7ok60b5/RzPc35i/lPqddbXvctMRc/JWh
        W9RyRscDuxJy2dwz3526ajDvGbunx8+6qa6XU+3Sd12QZiz/of3fNzTDMNrynqHTFxZ5pjl3
        rzypf74k6YJV7UMPkca3SxISmnJzCouZ7mzZWvAhd92Juc5Lj3y90MsqqFChvmfhtOIdT0wO
        3slyYCtk8FYzy2c5XzXxpKPp8hNpC/zd7TcUHTv5zu/02fvzr2ocP853Yc730P37JutcLLiR
        /CCi5ucz7cM1u1/rW855edSvcmdG2oqw/Q+t9O+mnbM0lV/7pjguR22iuBJLcUaioRZzUXEi
        ABcPPGJ0BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRmVeSWpSXmKPExsWy7bCSvO68VUGJBq+OmFqcfLKGzWJv2wl2
        i5c/r7JZHHzYyWIx7cNPZotP65exWjxZP4vZYtGNbUwWx0++Y7SYuP8su8XlXXPYLLqv72Cz
        WH78H5PFx67ZjBZLt95kdOD3uHzF2+NyXy+Tx+I9L5k8Nq3qZPOYsOgAo0fLyf0sHt/Xd7B5
        fHx6i8Wjb8sqRo/Pm+Q82g90MwVwR3HZpKTmZJalFunbJXBldF04yVjQJFWx4kkrSwPjGbEu
        Rk4OCQETiVnTVzN3MXJxCAnsYJS42NrKCpGQlri+cQI7hC0ssfLfc3aIoueMEruXTQcrYhPQ
        ldixuI0NJCEisIRR4tH6y0wgDrPAZmaJpuddUHPvMEpcWzqRBaSFUyBW4vGiL2C2sICLxMrd
        N8FsFgFViR8zljOB2LwClhL/Hq1hgbAFJU7OfAJkcwBN1ZNo28gIEmYWkJfY/nYOM8R5ChI/
        ny4Du0hEwEliyp1eVogacYmXR4+wT2AUnoVk0iyESbOQTJqFpGMBI8sqRsnUguLc9NxiwwKj
        vNRyveLE3OLSvHS95PzcTYzg2NbS2sG4Z9UHvUOMTByMhxglOJiVRHiDWfwThXhTEiurUovy
        44tKc1KLDzFKc7AoifNe6DoZLySQnliSmp2aWpBaBJNl4uCUamBaXCs55eJv7hsr9HY5but4
        o7o2PiVzW+UUjQyJBbYemabzvl270nPvb297jviFuwweecq8sR+qSvXtrh7cfXiKRWJXisUK
        +Z1VW5a1+BbfeGDX/LDwLePGG7OW7eBbpPf7w4lbE9/ddXcJXMxmxvxdP85rre0LTSfBBVXZ
        idcbHKt/fe6sCjjvuDLjq8Kd3HdCX3LYKo3c/vT4HPPhVLaNLV1kdOOAnMCeSesXf+lcKCrq
        GdjV+9nLzuZZ8qk5thUcN19MqyvzY3psvrz1//xz/RecS+tOX4l9e4vjisbDhV5FSi5Tzl1o
        0bbd90Nv/ZuJp0/vtU188m9VdeTcWbkzRfbsbnx453Tc5K13OztLlViKMxINtZiLihMBplIP
        wFwDAAA=
X-CMS-MailID: 20210928053943epcas5p1273beec6d0cdc9faa15a0fa55b67ea31
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210920210820epcas5p3255a53f0d25000310e401305795017e8
References: <cover.1632171047.git.nguyenb@codeaurora.org>
        <CGME20210920210820epcas5p3255a53f0d25000310e401305795017e8@epcas5p3.samsung.com>
        <70c5376129f902b6b3e9940ea3b10f147bf18a10.1632171047.git.nguyenb@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bao

>-----Original Message-----
>From: nguyenb=codeaurora.org@mg.codeaurora.org
>[mailto:nguyenb=codeaurora.org@mg.codeaurora.org] On Behalf Of Bao D.
>Nguyen
>Sent: Tuesday, September 21, 2021 2:38 AM
>To: cang@codeaurora.org; asutoshd@codeaurora.org;
>martin.petersen@oracle.com; linux-scsi@vger.kernel.org
>Cc: linux-arm-msm@vger.kernel.org; Bao D . Nguyen
><nguyenb@codeaurora.org>; Alim Akhtar <alim.akhtar@samsung.com>; Avri
>Altman <avri.altman@wdc.com>; James E.J. Bottomley <jejb@linux.ibm.com>;
>Bean Huo <beanhuo@micron.com>; Stanley Chu <stanley.chu@mediatek.com>;
>Bart Van Assche <bvanassche@acm.org>; Jaegeuk Kim <jaegeuk@kernel.org>;
>Adrian Hunter <adrian.hunter@intel.com>; Keoseong Park
><keosung.park@samsung.com>; open list <linux-kernel@vger.kernel.org>
>Subject: [PATCH v1 1/2] scsi: ufs: export hibern8 entry and exit
>
>From: Asutosh Das <asutoshd@codeaurora.org>
>
>Qualcomm controllers need to be in hibern8 before scaling up or down the
>clocks. Hence, export the hibern8 entry and exit functions.
>
>Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
>---
> drivers/scsi/ufs/ufshcd.c | 4 ++--
> drivers/scsi/ufs/ufshcd.h | 2 ++
> 2 files changed, 4 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c index
>3841ab49..f3aad32 100644
>--- a/drivers/scsi/ufs/ufshcd.c
>+++ b/drivers/scsi/ufs/ufshcd.c
>@@ -227,7 +227,6 @@ static void ufshcd_hba_exit(struct ufs_hba *hba);
static
>int ufshcd_clear_ua_wluns(struct ufs_hba *hba);  static int
>ufshcd_probe_hba(struct ufs_hba *hba, bool async);  static int
>ufshcd_setup_clocks(struct ufs_hba *hba, bool on); -static int
>ufshcd_uic_hibern8_enter(struct ufs_hba *hba);  static inline void
>ufshcd_add_delay_before_dme_cmd(struct ufs_hba *hba);  static int
>ufshcd_host_reset_and_restore(struct ufs_hba *hba);  static void
>ufshcd_resume_clkscaling(struct ufs_hba *hba); @@ -4116,7 +4115,7 @@ int
>ufshcd_link_recovery(struct ufs_hba *hba)  }
>EXPORT_SYMBOL_GPL(ufshcd_link_recovery);
>
>-static int ufshcd_uic_hibern8_enter(struct ufs_hba *hba)
>+int ufshcd_uic_hibern8_enter(struct ufs_hba *hba)
> {
> 	int ret;
> 	struct uic_command uic_cmd = {0};
>@@ -4138,6 +4137,7 @@ static int ufshcd_uic_hibern8_enter(struct ufs_hba
>*hba)
>
> 	return ret;
> }
>+EXPORT_SYMBOL_GPL(ufshcd_uic_hibern8_enter);
>
> int ufshcd_uic_hibern8_exit(struct ufs_hba *hba)  { diff --git
>a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h index
52ea6f3..0cc55a2
>100644
>--- a/drivers/scsi/ufs/ufshcd.h
>+++ b/drivers/scsi/ufs/ufshcd.h
>@@ -1397,4 +1397,6 @@ static inline int ufshcd_rpmb_rpm_put(struct ufs_hba
>*hba)
> 	return pm_runtime_put(&hba->sdev_rpmb->sdev_gendev);
> }
>
>+int ufshcd_uic_hibern8_enter(struct ufs_hba *hba); int
>+ufshcd_uic_hibern8_exit(struct ufs_hba *hba);

This will add ufshcd_uic_hibern8_exit() twice, it is already add by 
commit: 9d19bf7ad168a8: scsi: ufs: export some functions for vendor usage

Also move ufshcd_uic_hibern8_enter() before _earlier_
ufshcd_uic_hibern8_exit() declaration.

> #endif /* End of Header */
>--
>The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a
>Linux Foundation Collaborative Project


