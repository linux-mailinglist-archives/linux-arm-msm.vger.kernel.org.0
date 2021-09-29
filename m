Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 131DA41BD52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 05:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243936AbhI2D0J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 23:26:09 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:31187 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243857AbhI2D0J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 23:26:09 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20210929032427epoutp026c08d7f1a4fa254c313af5e5fca1ccc5~pLQt7zS_s1130811308epoutp02w
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 03:24:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20210929032427epoutp026c08d7f1a4fa254c313af5e5fca1ccc5~pLQt7zS_s1130811308epoutp02w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1632885867;
        bh=IaMYQS1lqoNxu3W1BOxesvck03z7/43KHkhq9l1WpTk=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=N+e4WwvI+KkOMku49feu08OCDBYmfYrk2rRPYfJQatTnMoar+imwTiJC49A+fd6Jj
         /cqCK+F30dgx/votTGMIWDsmygR7EgCgvFI+T3JFPeK9aZ5GvNXKPmgessLTrSf6D5
         V1phgh5YooP7WeqgRxPaR2nk+G2M6NnASK/iVm9k=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTP id
        20210929032426epcas5p32aeb9274eb68bcde0990c062eac424fa~pLQtfTBDu0995609956epcas5p3y;
        Wed, 29 Sep 2021 03:24:26 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.181]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4HK1v916j1z4x9QM; Wed, 29 Sep
        2021 03:24:21 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
        epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        40.F1.59762.15CD3516; Wed, 29 Sep 2021 12:24:01 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
        20210929031358epcas5p2bcc25bd81a117ddb35e053ddea0606a1~pLHkBF2982380823808epcas5p2W;
        Wed, 29 Sep 2021 03:13:58 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210929031358epsmtrp2e56fc0d37baa0db2ad4ca2c126a566c2~pLHj-jUuU1008010080epsmtrp2b;
        Wed, 29 Sep 2021 03:13:58 +0000 (GMT)
X-AuditID: b6c32a49-125ff7000000e972-fa-6153dc510563
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        75.76.08750.5F9D3516; Wed, 29 Sep 2021 12:13:58 +0900 (KST)
Received: from alimakhtar03 (unknown [107.122.12.5]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20210929031355epsmtip2836ddd52a5aa308a920324f5575a5d05~pLHh2dAs-2133521335epsmtip2G;
        Wed, 29 Sep 2021 03:13:55 +0000 (GMT)
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
In-Reply-To: <a29bfdd0c8f1d1a3e5fb69e43ea277c97a7f0cb6.1632818942.git.nguyenb@codeaurora.org>
Subject: RE: [PATCH v2 1/2] scsi: ufs: export hibern8 entry and exit
Date:   Wed, 29 Sep 2021 08:43:54 +0530
Message-ID: <00f801d7b4e0$0acfe630$206fb290$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJbPZpAqiweWuut4hQb/UQ8HpO3kgIzDpUNAWSkPZSqlocLkA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAJsWRmVeSWpSXmKPExsWy7bCmlm7gneBEg5Y3RhYnn6xhs9jbdoLd
        4uXPq2wWBx92slhM+/CT2eLT+mWsFk/Wz2K2WHRjG5PF8ZPvGC0m7j/LbnF51xw2i+7rO9gs
        lh//x2TxsWs2o8XSrTcZHfg9Ll/x9rjc18vksXjPSyaPTas62TwmLDrA6NFycj+Lx/f1HWwe
        H5/eYvHo27KK0ePzJjmP9gPdTAHcUdk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6hpYW
        5koKeYm5qbZKLj4Bum6ZOUC/KCmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIKTAr0
        ihNzi0vz0vXyUkusDA0MjEyBChOyM468fM1c0ClV8bD/EWsD4y2xLkZODgkBE4lZny4xdzFy
        cQgJ7GaUOD55MRuE84lRoufOenYI5zOjxKY/b1hgWnoPnGMFsYUEdjFKNGyzgih6ySjROfUJ
        M0iCTUBXYsfiNrBRIgILgBIXQDq4OJgFVjNLvDk6kx2kilMgVmL95plAHRwcwgIuEvdvy4OE
        WQRUJbqv/WMDsXkFLCVuXX3FCmELSpyc+QTsCmYBeYntb+cwQ1ykIPHz6TKwGhEBJ4k9PRDX
        MQuIS7w8egTsBQmBdk6Jc5feM0E0uEic79wB9Y6wxKvjW9ghbCmJz+/2soHcIyGQLdGzyxgi
        XCOxdN4xqHJ7iQNX5rCAlDALaEqs36UPEZaVmHpqHRPEWj6J3t9PoDbxSuyYB2OrSjS/uwo1
        RlpiYnc36wRGpVlIPpuF5LNZSD6YhbBtASPLKkbJ1ILi3PTUYtMCw7zUcniEJ+fnbmIEJ3Ut
        zx2Mdx980DvEyMTBeIhRgoNZSYT3h3hwohBvSmJlVWpRfnxRaU5q8SFGU2BwT2SWEk3OB+aV
        vJJ4QxNLAxMzMzMTS2MzQyVx3o+vLROFBNITS1KzU1MLUotg+pg4OKUamCLubgxZHdBbsIvZ
        4PPb4PJe9VqWsJpbFxZtiJV0dtp5LW+WtOPphwdTl+wKXu2k1JdouHJy0eKeWom11gtEA7Ly
        zgXPm8AnPOnIkaaPokf//s85tflLfPjq0g+7Kvrv7rgr4ta44HmfRLytplvWySWP53hGJyf1
        WN19r/rZRmirfOzWqsPR8T8clLWcLm1i3hM14+8eh2Md7CJXmewZ+kvbrfet3lD381ax8r6J
        FVdtyxcvZxIuSN/2eOqVwFUqW+sC36bZzWWVLn2YwaCWbn36ecer3BeHN6pkrpim+zx/0YnW
        HpEUfdGr/Fwltgb9l61fyL51OqX82XCfCPO9Wy4pYnbJFTO8StO2hs2RU2Ipzkg01GIuKk4E
        ALGqSX9zBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRmVeSWpSXmKPExsWy7bCSvO63m8GJBk8uM1mcfLKGzWJv2wl2
        i5c/r7JZHHzYyWIx7cNPZotP65exWjxZP4vZYtGNbUwWx0++Y7SYuP8su8XlXXPYLLqv72Cz
        WH78H5PFx67ZjBZLt95kdOD3uHzF2+NyXy+Tx+I9L5k8Nq3qZPOYsOgAo0fLyf0sHt/Xd7B5
        fHx6i8Wjb8sqRo/Pm+Q82g90MwVwR3HZpKTmZJalFunbJXBlHHn5mrmgU6riYf8j1gbGW2Jd
        jJwcEgImEr0HzrF2MXJxCAnsYJSYd/4XC0RCWuL6xgnsELawxMp/z8FsIYHnjBI7d9uA2GwC
        uhI7FrexgTSLCCxhlHi0/jITiMMssJlZoul5FzPE2DuMEjOPPGMCaeEUiJVYv3kmUIKDQ1jA
        ReL+bXmQMIuAqkT3tX9sIDavgKXErauvWCFsQYmTM5+wgJQzC+hJtG1kBAkzC8hLbH87hxni
        OAWJn0+XgZWLCDhJ7Ok5xwpRIy7x8ugR9gmMwrOQTJqFMGkWkkmzkHQsYGRZxSiZWlCcm55b
        bFhglJdarlecmFtcmpeul5yfu4kRHNdaWjsY96z6oHeIkYmD8RCjBAezkgjvD/HgRCHelMTK
        qtSi/Pii0pzU4kOM0hwsSuK8F7pOxgsJpCeWpGanphakFsFkmTg4pRqYgkNCuIzay0K+nng6
        ofSd4drVXEH7U6b+kVSPW/Tiz8Kz4YoCERrcMbkBAdmHLlacDd/sUlb/quRc2NOFSdu9vC/8
        bFxksn7R+w12TV6MPMVpwZuVVX/5zXPffKCHMUD5zdM7Kq1TJCsjPPujd9mEMax8oDnnbmmR
        1oWoWIWfVT+Oc4n8ba0s9Pdo+tWavqt6qqrdRiYhu/n8yhHh5w6mJlSpbd36I8PTUvpSxE79
        tF43g6sqK44wqS9gCHi39p6h4Hle6zW6V2Y9C5tx5dOtO7uVJEsak/I0vqw2Xvu3aPe8gtP3
        4+6Wl+0NiV4ywULj5vqoY43rRRRzd0w+oy10NG1BiJ7cLz3Pg92fhTuVWIozEg21mIuKEwHD
        2aIeWgMAAA==
X-CMS-MailID: 20210929031358epcas5p2bcc25bd81a117ddb35e053ddea0606a1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210928090634epcas5p149638a0e4d0cc009d1c068dcb7a18b44
References: <cover.1632818942.git.nguyenb@codeaurora.org>
        <CGME20210928090634epcas5p149638a0e4d0cc009d1c068dcb7a18b44@epcas5p1.samsung.com>
        <a29bfdd0c8f1d1a3e5fb69e43ea277c97a7f0cb6.1632818942.git.nguyenb@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hello,

>-----Original Message-----
>From: nguyenb=codeaurora.org@mg.codeaurora.org
>[mailto:nguyenb=codeaurora.org@mg.codeaurora.org] On Behalf Of Bao D.
>Nguyen
>Sent: Tuesday, September 28, 2021 2:36 PM
>To: cang@codeaurora.org; asutoshd@codeaurora.org;
>martin.petersen@oracle.com; linux-scsi@vger.kernel.org
>Cc: linux-arm-msm@vger.kernel.org; Bao D . Nguyen
><nguyenb@codeaurora.org>; Alim Akhtar <alim.akhtar@samsung.com>; Avri
>Altman <avri.altman@wdc.com>; James E.J. Bottomley <jejb@linux.ibm.com>;
>Bean Huo <beanhuo@micron.com>; Stanley Chu <stanley.chu@mediatek.com>;
>Bart Van Assche <bvanassche@acm.org>; Jaegeuk Kim <jaegeuk@kernel.org>;
>Adrian Hunter <adrian.hunter@intel.com>; Keoseong Park
><keosung.park@samsung.com>; open list <linux-kernel@vger.kernel.org>
>Subject: [PATCH v2 1/2] scsi: ufs: export hibern8 entry and exit
>
>From: Asutosh Das <asutoshd@codeaurora.org>
>
>Qualcomm controllers need to be in hibern8 before scaling up or down the
>clocks. Hence, export the hibern8 entry and exit functions.
>
>Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
>---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

> drivers/scsi/ufs/ufshcd.c | 4 ++--
> drivers/scsi/ufs/ufshcd.h | 1 +
> 2 files changed, 3 insertions(+), 2 deletions(-)
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
52ea6f3..124f50b
>100644
>--- a/drivers/scsi/ufs/ufshcd.h
>+++ b/drivers/scsi/ufs/ufshcd.h
>@@ -1001,6 +1001,7 @@ int ufshcd_init(struct ufs_hba *, void __iomem *,
>unsigned int);  int ufshcd_link_recovery(struct ufs_hba *hba);  int
>ufshcd_make_hba_operational(struct ufs_hba *hba);  void
ufshcd_remove(struct
>ufs_hba *);
>+int ufshcd_uic_hibern8_enter(struct ufs_hba *hba);
> int ufshcd_uic_hibern8_exit(struct ufs_hba *hba);  void
>ufshcd_delay_us(unsigned long us, unsigned long tolerance);  int
>ufshcd_wait_for_register(struct ufs_hba *hba, u32 reg, u32 mask,
>--
>The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a
>Linux Foundation Collaborative Project


