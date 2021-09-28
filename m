Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9399D41A898
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 08:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239382AbhI1GHQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 02:07:16 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:17955 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238897AbhI1GGB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 02:06:01 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20210928060421epoutp013f2c474900bc9626f83ce7266dfff182~o5zCreNZE0275002750epoutp01w
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 06:04:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20210928060421epoutp013f2c474900bc9626f83ce7266dfff182~o5zCreNZE0275002750epoutp01w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1632809061;
        bh=8sweX3DIsALuKLz+wzpzAeQefZMloVVd1YMoHWSAA8Y=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=fBL3jYiO7vESXFereg+QX0cweivPPROXJhMJcn/yG7WIYDoLZXUG5KVvWUvSqqcMF
         Gyd78xGe9x2oRz3WHiPmiJSr+u1O93Ghr9c0IHG17ZNSA7aZ16IcJyq9op+79yBCj7
         XYcBdha15P5f64z009ag4Xsk1iGpbSKInT539FSQ=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas5p4.samsung.com (KnoxPortal) with ESMTP id
        20210928060420epcas5p4d953816bbbf6290317681d222b63bd12~o5zB-D7FF3135731357epcas5p4I;
        Tue, 28 Sep 2021 06:04:20 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.175]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4HJTV81cpvz4x9Q2; Tue, 28 Sep
        2021 06:04:16 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
        epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        9C.40.10367.D50B2516; Tue, 28 Sep 2021 15:04:13 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
        20210928060357epcas5p22ff1cce62e551d446377dd6443bc316f~o5ysQMunA1416714167epcas5p26;
        Tue, 28 Sep 2021 06:03:57 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210928060357epsmtrp10068b6bdbc4e1720793fed78b6f4f67b~o5ysPP3ie1504215042epsmtrp1I;
        Tue, 28 Sep 2021 06:03:57 +0000 (GMT)
X-AuditID: b6c32a4a-b2dff7000000287f-dd-6152b05d71b2
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        C1.E4.08750.C40B2516; Tue, 28 Sep 2021 15:03:56 +0900 (KST)
Received: from alimakhtar03 (unknown [107.122.12.5]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20210928060355epsmtip26014d70cf40fa59c43f4a4193a9ec5fb~o5yqbA3nW0054400544epsmtip2j;
        Tue, 28 Sep 2021 06:03:54 +0000 (GMT)
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
In-Reply-To: <94cda1143d3332c3284a09b88139e358eab5a233.1632171047.git.nguyenb@codeaurora.org>
Subject: RE: [PATCH v1 2/2] scsi: ufs-qcom: enter and exit hibern8 during
 clock scaling
Date:   Tue, 28 Sep 2021 11:33:53 +0530
Message-ID: <000801d7b42e$9f69df10$de3d9d30$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFSrXMYWf6xZll5STjad3GlX/AECgF7MZHvAVJql3KsrJU7oA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJJsWRmVeSWpSXmKPExsWy7bCmum7shqBEg1sPeC3OPf7NYrG37QS7
        xcufV9ksTu9/x2Lxaf0yVotFN7YxWUzcf5bd4vKuOWwW3dd3sFksP/6PyeJj12xGB26Py329
        TB6bVnWyedy5tofNY8KiA4weH5/eYvH4vEnOo/1AN1MAe1S2TUZqYkpqkUJqXnJ+SmZeuq2S
        d3C8c7ypmYGhrqGlhbmSQl5ibqqtkotPgK5bZg7QkUoKZYk5pUChgMTiYiV9O5ui/NKSVIWM
        /OISW6XUgpScApMCveLE3OLSvHS9vNQSK0MDAyNToMKE7IwN9/uYC7qEK859UWxgfMrfxcjJ
        ISFgIvFlyke2LkYuDiGB3YwSF2Y9YYFwPjFKfLrVxA7hfGaUaLgzix2mpXN5JytEYhejxMZp
        K5hAEkICLxkljrwSALHZBHQldixuA5srIrCAUaLzwjmwDmaBZiaJV8c+gY3iFIiVeDv9EguI
        LSwQKfH73nawOIuAqsSiHf+YQWxeAUuJ+dt+skLYghInZz4Bq2cWkJfY/nYOM8RJChI/ny4D
        qxERcJLYN+cAVI24xMujR8B+kBA4wSExfcoLqAYXiUOHp7JA2MISr45vgfpNSuJlfxuQzQFk
        Z0v07DKGCNdILJ13DKrcXuLAlTksICXMApoS63fpQ4RlJaaeWscEsZZPovf3EyaIOK/Ejnkw
        tqpE87urUGOkJSZ2d7NOYFSaheSzWUg+m4Xkg1kI2xYwsqxilEwtKM5NTy02LTDKSy2HR3hy
        fu4mRnAa1vLawfjwwQe9Q4xMHIyHGCU4mJVEeINZ/BOFeFMSK6tSi/Lji0pzUosPMZoCg3si
        s5Rocj4wE+SVxBuaWBqYmJmZmVgamxkqifN+fG2ZKCSQnliSmp2aWpBaBNPHxMEp1cDEkmSx
        tZ9x27zI7I+2swV3qCx91VLWPverzv/umZ77jcR/CskmnuSecNh1YvuKl3F2/T2Hn3xp+iG1
        a89Wc58pyzkEn/4RPbnp2rM57Lc+PVh2Tco/5SerXFVknvPfHefWpz9MW9/97o7H0r5NacXR
        /+vKTt/6x24i6vrurfDDXf+2fcv643o4KTTqssqO40mF3+euOGuZtdHjwCVbRiXBKcunGc7w
        SdwcZ35jk2FA4cro2hkmL22eP7bK/nM7Y3uPBO/M+V9uHPq4U/SBcd8Wx+u+fc4Ti/aJZG6/
        qZF0isnu/KayBVu/OE09mvvbgvvdMoH9k7TXvtMx5jI1XuAwYbp1qMAxxvsTbYsuaG2T1lZi
        Kc5INNRiLipOBADBwVfkTAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsWy7bCSvK7PhqBEg81tZhbnHv9msdjbdoLd
        4uXPq2wWp/e/Y7H4tH4Zq8WiG9uYLCbuP8tucXnXHDaL7us72CyWH//HZPGxazajA7fH5b5e
        Jo9NqzrZPO5c28PmMWHRAUaPj09vsXh83iTn0X6gmymAPYrLJiU1J7MstUjfLoErY8P9PuaC
        LuGKc18UGxif8ncxcnJICJhIdC7vZO1i5OIQEtjBKHH33DpGiIS0xPWNE9ghbGGJlf+es0MU
        PWeUWPnmEDNIgk1AV2LH4jY2kISIwBJGiUfrLzOBOMwC7UwSvXeeMkG03GGUeDyjGWwWp0Cs
        xNvpl1hAbGGBcImG+VPB9rEIqEos2vEPbCyvgKXE/G0/WSFsQYmTM58A1XMATdWTaNsIVs4s
        IC+x/e0cZojzFCR+Pl0GVi4i4CSxb84BFogacYmXR4+wT2AUnoVk0iyESbOQTJqFpGMBI8sq
        RsnUguLc9NxiwwKjvNRyveLE3OLSvHS95PzcTYzgWNTS2sG4Z9UHvUOMTByMhxglOJiVRHiD
        WfwThXhTEiurUovy44tKc1KLDzFKc7AoifNe6DoZLySQnliSmp2aWpBaBJNl4uCUamDK9/rc
        vcyHY+PcR/tmyqz0M/a9Zemc1Ba+6MqEfRvf5ur8PKE7py8/eO1eCfeuQ584vcQXPrfqvbGX
        javuTtqjXW1hR3ZWq9xe0Rq8Myms68TZ4P0R8iHbLXZOL/7R0r/kjvJ7zrNHxKtz7HcvlQu0
        mr/i6pfynBrWORM27g3Y2P75CevjT1l54d/frr430+3u/+tmyxhrbrXMv/Hw0B3n9MPyqnKs
        55ztHrJ2mMm/mVDqW5O22CDeduPZuUtXVM9iYf6ysTfL50Xbx/7ITRI9v7526D/9HSRUy9wl
        HbPT9PKqyGstW654XnJ2397tI8H9OsbsHs90gZW5T3MUT+Tc/KV+x9xc7nTsDM5zew53KbEU
        ZyQaajEXFScCAPCL7b80AwAA
X-CMS-MailID: 20210928060357epcas5p22ff1cce62e551d446377dd6443bc316f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210920210821epcas5p233e0025318135ae97b5f87eb83391b4a
References: <cover.1632171047.git.nguyenb@codeaurora.org>
        <CGME20210920210821epcas5p233e0025318135ae97b5f87eb83391b4a@epcas5p2.samsung.com>
        <94cda1143d3332c3284a09b88139e358eab5a233.1632171047.git.nguyenb@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

>-----Original Message-----
>From: nguyenb=codeaurora.org@mg.codeaurora.org
>[mailto:nguyenb=codeaurora.org@mg.codeaurora.org] On Behalf Of Bao D.
>Nguyen
>Sent: Tuesday, September 21, 2021 2:38 AM
>To: cang@codeaurora.org; asutoshd@codeaurora.org;
>martin.petersen@oracle.com; linux-scsi@vger.kernel.org
>Cc: linux-arm-msm@vger.kernel.org; Bao D . Nguyen
><nguyenb@codeaurora.org>; Andy Gross <agross@kernel.org>; Bjorn Andersson
><bjorn.andersson@linaro.org>; Alim Akhtar <alim.akhtar@samsung.com>; Avri
>Altman <avri.altman@wdc.com>; James E.J. Bottomley <jejb@linux.ibm.com>;
>open list <linux-kernel@vger.kernel.org>
>Subject: [PATCH v1 2/2] scsi: ufs-qcom: enter and exit hibern8 during clock
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


