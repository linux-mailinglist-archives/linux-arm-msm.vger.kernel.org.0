Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E53CD41BD55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 05:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243931AbhI2D0O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 23:26:14 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:41060 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243949AbhI2D0N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 23:26:13 -0400
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20210929032429epoutp017ae1926e9609142b0be678358d4a279c~pLQwFSPi92164121641epoutp01p
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 03:24:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20210929032429epoutp017ae1926e9609142b0be678358d4a279c~pLQwFSPi92164121641epoutp01p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1632885869;
        bh=WrNCUbpSw207ejXs3q+o/xLoyNlILDn60SbqLv/Idhg=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=EAMQcV/O3AfeAouqlia8w1Pe/PoAsBOVK6vawTofneAbUG7cu+oum7nD44hujJnJl
         7vkpEuqAWiRTkYkJcBrrrPVulQrKrlN/9v6dbFGfG5cLTUglw6lRjYk51iD1KtEywX
         BH8fdksLfJ5JVge5WTg+j3rfe/pVippR7f7N069Q=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas5p2.samsung.com (KnoxPortal) with ESMTP id
        20210929032428epcas5p2dba1e2bad56e314b58ef07665cf79130~pLQvUGj4v1274512745epcas5p2W;
        Wed, 29 Sep 2021 03:24:28 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.181]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4HK1vC42Jnz4x9Q2; Wed, 29 Sep
        2021 03:24:23 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
        epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        A2.F1.59762.45CD3516; Wed, 29 Sep 2021 12:24:05 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
        20210929031607epcas5p21aa4f12860d68a6db8ae2df0df35d776~pLJcwbhCh2437324373epcas5p28;
        Wed, 29 Sep 2021 03:16:07 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210929031607epsmtrp1be665762c79eadf7a7168cc9d9d700df~pLJcvpw4x2768827688epsmtrp1W;
        Wed, 29 Sep 2021 03:16:07 +0000 (GMT)
X-AuditID: b6c32a49-125ff7000000e972-02-6153dc54e7e7
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        3F.96.08750.77AD3516; Wed, 29 Sep 2021 12:16:07 +0900 (KST)
Received: from alimakhtar03 (unknown [107.122.12.5]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20210929031605epsmtip1c5bf0f3d77ea563326d70442d813fbbd~pLJbF4Sua1283012830epsmtip1U;
        Wed, 29 Sep 2021 03:16:05 +0000 (GMT)
From:   "Alim Akhtar" <alim.akhtar@samsung.com>
To:     "'Bao D. Nguyen'" <nguyenb@codeaurora.org>, <cang@codeaurora.org>,
        <asutoshd@codeaurora.org>, <martin.petersen@oracle.com>,
        <linux-scsi@vger.kernel.org>
Cc:     <linux-arm-msm@vger.kernel.org>,
        "'Andy Gross'" <agross@kernel.org>,
        "'Bjorn Andersson'" <bjorn.andersson@linaro.org>,
        "'Avri Altman'" <avri.altman@wdc.com>,
        "'James E.J. Bottomley'" <jejb@linux.ibm.com>,
        "'open list'" <linux-kernel@vger.kernel.org>
In-Reply-To: <212b7aaf6d834c4a8c682fdac4a59b84013ed573.1632818942.git.nguyenb@codeaurora.org>
Subject: RE: [PATCH v2 2/2] scsi: ufs-qcom: enter and exit hibern8 during
 clock scaling
Date:   Wed, 29 Sep 2021 08:46:04 +0530
Message-ID: <00f901d7b4e0$581ae2f0$0850a8d0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJbPZpAqiweWuut4hQb/UQ8HpO3kgL954syAtigKhaqhJCvIA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBJsWRmVeSWpSXmKPExsWy7bCmpm7oneBEgxsbGC3OPf7NYrG37QS7
        xcufV9ksTu9/x2Lxaf0yVotFN7YxWUzcf5bd4vKuOWwW3dd3sFksP/6PyeJj12xGB26Py329
        TB6bVnWyedy5tofNY8KiA4weH5/eYvH4vEnOo/1AN1MAe1S2TUZqYkpqkUJqXnJ+SmZeuq2S
        d3C8c7ypmYGhrqGlhbmSQl5ibqqtkotPgK5bZg7QkUoKZYk5pUChgMTiYiV9O5ui/NKSVIWM
        /OISW6XUgpScApMCveLE3OLSvHS9vNQSK0MDAyNToMKE7Ixfq34xF3QJV0x49Zu1gfEpfxcj
        J4eEgInE9z/vWUFsIYHdjBJXz8p1MXIB2Z8YJXpfNrBDOJ8ZJVpuN7LBdKx7/5IdomMXo8ST
        g/EQRS8ZJZb+/coEkmAT0JXYsbiNDSQhIrCAUaLzwjlWEIdZoJlJ4tWxT2DtnAKxEhdebQBb
        LiwQKXFh/z1mEJtFQFXi7/adjCA2r4ClxI9zZ5kgbEGJkzOfsIDYzALyEtvfzmGGOElB4ufT
        ZWBzRAScJB7emcMIUSMu8fLoEbAfJAROcEg87ToLdBIHkOMisX2TIkSvsMSr41vYIWwpiZf9
        bewQJdkSPbuMIcI1EkvnHWOBsO0lDlyZwwJSwiygKbF+lz5EWFZi6ql1TBBb+SR6fz9hgojz
        SuyYB2OrSjS/uwo1RlpiYnc36wRGpVlIHpuF5LFZSB6YhbBtASPLKkbJ1ILi3PTUYtMCw7zU
        cnh8J+fnbmIEJ2Etzx2Mdx980DvEyMTBeIhRgoNZSYT3h3hwohBvSmJlVWpRfnxRaU5q8SFG
        U2BoT2SWEk3OB+aBvJJ4QxNLAxMzMzMTS2MzQyVx3o+vLROFBNITS1KzU1MLUotg+pg4OKUa
        mJbOma135sbDB8eVb4ssvWu1v3pt92nOt76Hnu2W7pjdGa2bfWk9R9YXyW25/1qaCrh6d14O
        fCd9uOlxjKKmixVvqW3TDDPztvLE30tv1DvdXfbt8M+NKcd9/v2YqrHI78jJ1+6bBV/EMIUc
        2BOVU/BhmuKBb4UG3/aJfNeZ7tXTzVUqZhXGx7tf4lVDcURrvYnNctbJ7z82M2yYctFl3dYf
        /UZ7/hcEvrEWXcnD+f3RlK4Uk6wXXy+nLfopPdVFy7jt8xPJHu9jdxdvMF5WoXAhI7hdWOYS
        +5pP/fFanInrfnnwfFY/erpy2opKNlvBj73Gv4q13Gy3+YRtqBJgk8jX9rb6EJ6UbJjjkxNT
        qcRSnJFoqMVcVJwIAKy73idLBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsWy7bCSnG75reBEgz1/VC3OPf7NYrG37QS7
        xcufV9ksTu9/x2Lxaf0yVotFN7YxWUzcf5bd4vKuOWwW3dd3sFksP/6PyeJj12xGB26Py329
        TB6bVnWyedy5tofNY8KiA4weH5/eYvH4vEnOo/1AN1MAexSXTUpqTmZZapG+XQJXxq9Vv5gL
        uoQrJrz6zdrA+JS/i5GTQ0LARGLd+5fsXYxcHEICOxglNjRvYYNISEtc3ziBHcIWllj57zlU
        0XNGid9PzzKCJNgEdCV2LG5jA0mICCxhlHi0/jITiMMs0M4k0XvnKRNEyx1Gid2XnrCAtHAK
        xEpceLWBFcQWFgiXaJ06gQnEZhFQlfi7fSfYWF4BS4kf584yQdiCEidngvRyAE3Vk2jbCFbC
        LCAvsf3tHGaI8xQkfj5dBjZSRMBJ4uGdOVA14hIvjx5hn8AoPAvJpFkIk2YhmTQLSccCRpZV
        jJKpBcW56bnFhgVGeanlesWJucWleel6yfm5mxjB0ailtYNxz6oPeocYmTgYDzFKcDArifD+
        EA9OFOJNSaysSi3Kjy8qzUktPsQozcGiJM57oetkvJBAemJJanZqakFqEUyWiYNTqoGJi+fF
        e6HaoqgHhc8LP6a8Mdgs+CHrzFfvU1PPH6+5WBGgt7RTr9f46bvXP9h+Wql9mdl15La/W1rK
        3dKEtyFnuZouahtXJkoo1xSozY8pZLiv+vrR5xtNT34HMj2Xk5O+7b/7nuKGoIdP+p7+tHiS
        az4hU27Sal8n7nQbvVeTq4saZt/6mT//ytyvGrM95ht0f/d8zn5hx/xS887CkPOGaeszujnb
        NVijebeG3tV8tlKAbRtb3fO7Xt+OLev1CijplNN8z3r457XFCuULerUXLfOs0lz2vcajslPr
        nN5On5wp9ldnPyg2r5lxsClXucWS4eCFP+V9gR8PlZSxMFUbluzabFrVZNzjr5n4nk2JpTgj
        0VCLuag4EQAB0L99NQMAAA==
X-CMS-MailID: 20210929031607epcas5p21aa4f12860d68a6db8ae2df0df35d776
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210928090645epcas5p497488b7f231454f99e91d1a56e9bd219
References: <cover.1632818942.git.nguyenb@codeaurora.org>
        <CGME20210928090645epcas5p497488b7f231454f99e91d1a56e9bd219@epcas5p4.samsung.com>
        <212b7aaf6d834c4a8c682fdac4a59b84013ed573.1632818942.git.nguyenb@codeaurora.org>
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
><nguyenb@codeaurora.org>; Andy Gross <agross@kernel.org>; Bjorn Andersson
><bjorn.andersson@linaro.org>; Alim Akhtar <alim.akhtar@samsung.com>; Avri
>Altman <avri.altman@wdc.com>; James E.J. Bottomley <jejb@linux.ibm.com>;
>open list <linux-kernel@vger.kernel.org>
>Subject: [PATCH v2 2/2] scsi: ufs-qcom: enter and exit hibern8 during clock
scaling
>
>From: Asutosh Das <asutoshd@codeaurora.org>
>
>Qualcomm controller needs to be in hibern8 before scaling clocks.
>This change puts the controller in hibern8 state before scaling and brings
it out
>after scaling of clocks.
>
>Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
>---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

> drivers/scsi/ufs/ufs-qcom.c | 12 +++++++++++-
> 1 file changed, 11 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index
>92d4c61..92f5bb4 100644
>--- a/drivers/scsi/ufs/ufs-qcom.c
>+++ b/drivers/scsi/ufs/ufs-qcom.c
>@@ -1212,24 +1212,34 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba
>*hba,
> 	int err = 0;
>
> 	if (status == PRE_CHANGE) {
>+		err = ufshcd_uic_hibern8_enter(hba);
>+		if (err)
>+			return err;
> 		if (scale_up)
> 			err = ufs_qcom_clk_scale_up_pre_change(hba);
> 		else
> 			err = ufs_qcom_clk_scale_down_pre_change(hba);
>+		if (err)
>+			ufshcd_uic_hibern8_exit(hba);
>+
> 	} else {
> 		if (scale_up)
> 			err = ufs_qcom_clk_scale_up_post_change(hba);
> 		else
> 			err = ufs_qcom_clk_scale_down_post_change(hba);
>
>-		if (err || !dev_req_params)
>+
>+		if (err || !dev_req_params) {
>+			ufshcd_uic_hibern8_exit(hba);
> 			goto out;
>+		}
>
> 		ufs_qcom_cfg_timers(hba,
> 				    dev_req_params->gear_rx,
> 				    dev_req_params->pwr_rx,
> 				    dev_req_params->hs_rate,
> 				    false);
>+		ufshcd_uic_hibern8_exit(hba);
> 	}
>
> out:
>--
>The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a
>Linux Foundation Collaborative Project


