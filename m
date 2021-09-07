Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5534022E9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Sep 2021 07:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234495AbhIGEt6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Sep 2021 00:49:58 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:55165 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234468AbhIGEt5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Sep 2021 00:49:57 -0400
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20210907044849epoutp01e1c6e9db4136545a3feb0b417b0a5eca~icOGrAfRM2117321173epoutp01r
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Sep 2021 04:48:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20210907044849epoutp01e1c6e9db4136545a3feb0b417b0a5eca~icOGrAfRM2117321173epoutp01r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1630990129;
        bh=8uHJcyLOVZnF590J/OwYJts8gD9hMkd0fISIovGR4d0=;
        h=From:To:Cc:Subject:Date:References:From;
        b=exQP6yTvGS4z88+Gfz/YBjg1z9w0VaiPTHz8lj3dCo6ZoyyiaexbG42V/eAcAzpHn
         sR6Qe2chx+MqdzR/SBAwAnr96NKwhGzclyjoCfM4Henn8mQy+UoXtZBqpVdDdcGrXr
         zuVGWqhVipi5PT39RptsyTM3pRPNbjZjCip0oN5w=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210907044848epcas1p209c423dd9db153c18ed15d8b949c3048~icOF3cHFl0326303263epcas1p2x;
        Tue,  7 Sep 2021 04:48:48 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.38.247]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4H3Xpl52HLz4x9Px; Tue,  7 Sep
        2021 04:48:47 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        8D.2E.09910.F2FE6316; Tue,  7 Sep 2021 13:48:47 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210907044846epcas1p297b8ef121290fc3265cf9dc3eadc44de~icOD6GjkU0077500775epcas1p2G;
        Tue,  7 Sep 2021 04:48:46 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210907044846epsmtrp2a260ca664c6c7bf73325764e005ba294~icOD7Q_EL0308503085epsmtrp26;
        Tue,  7 Sep 2021 04:48:46 +0000 (GMT)
X-AuditID: b6c32a35-c45ff700000026b6-d4-6136ef2fe0d7
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        7C.73.08750.E2FE6316; Tue,  7 Sep 2021 13:48:46 +0900 (KST)
Received: from localhost.localdomain (unknown [10.253.100.232]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210907044846epsmtip1822bf54d8fd5b182431e8caf8cda3c1f~icODpHfYA0844408444epsmtip1O;
        Tue,  7 Sep 2021 04:48:46 +0000 (GMT)
From:   Chanwoo Lee <cw9316.lee@samsung.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        alim.akhtar@samsung.com, avri.altman@wdc.com, jejb@linux.ibm.com,
        martin.petersen@oracle.com, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     grant.jung@samsung.com, jt77.jang@samsung.com,
        dh0421.hwang@samsung.com, sh043.lee@samsung.com,
        ChanWoo Lee <cw9316.lee@samsung.com>
Subject: [PATCH] scsi: ufs-qcom: Remove unneeded variable 'err'
Date:   Tue,  7 Sep 2021 13:41:11 +0900
Message-Id: <20210907044111.29632-1-cw9316.lee@samsung.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPJsWRmVeSWpSXmKPExsWy7bCmvq7+e7NEg6eblC3OPf7NYvFg3jY2
        i5c/r7JZnN7/jsVixqk2Vot9106yW/z6u57dYtGNbUwWO56fYbeYuP8su8XlXXPYLLqv72Cz
        WH78H5NF0599LA58HptWdbJ53Lm2h81jwqIDjB4fn95i8ejbsorR4/MmOY/2A91MAexR2TYZ
        qYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QDcrKZQl5pQC
        hQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgrMCvSKE3OLS/PS9fJSS6wMDQyMTIEKE7Izvnev
        ZCt4y1bx7cRXlgbGI6xdjJwcEgImEv3XlgHZXBxCAjsYJfZeamCCcD4xSvQtm8UC4XxmlNjX
        9JQNpmX2/1NQLbsYJc40zGaEcL4wSuy8vIu5i5GDg01AS+L2MW+QuIjAO0aJVb3P2EAcZoEu
        RolfB7tYQEYJC9hLPGh+xg5iswioSux8sYkRpJlXwFri1AUjiG3yEn/u9zCD2LwCghInZz4B
        a2UGijdvnc0MMlNCYCqHxNxL/cwQDS4Sh7ZegDpVWOLV8S3sELaUxOd3e9kgGpoZJU7NPscO
        4bQwSry+cgOqylji0+fPYFcwC2hKrN+lDxFWlNj5ey4jxGY+iXdfe1hBSiQEeCU62oQgSlQk
        5nSdY4PZ9fHGY2gIe0h8/P4NrFVIIFbiw7TLLBMY5Wch+WcWkn9mISxewMi8ilEstaA4Nz21
        2LDAEB6vyfm5mxjBKVfLdAfjxLcf9A4xMnEwHmKU4GBWEuH9a26WKMSbklhZlVqUH19UmpNa
        fIjRFBjAE5mlRJPzgUk/ryTe0MTSwMTMyMTC2NLYTEmcl/GVTKKQQHpiSWp2ampBahFMHxMH
        p1QDU1svM0Pn+fU3E81EN9/LD5iyZfPXnr5ETbessIl7J5s171xlpvOA33z/lzefTzwReiqa
        OvlpzMs9uyLWSa0/FGusdio8sizlfeP1kOeXLf+2uNporKtif3Lrf9Z/k9drl0QqiuxcvWMB
        48rGhMWftWXnlV34ztxtxeDj8KE9/ecp7uT3bJK9DZ/+Ptq7c9bSxng9VZ6S7e1vnupdXPDw
        se7CyIrNrCe/zU1b5HrpzXFpP8016TEZ/V9n5SgfuOkuWPWna2LTScXqW9dk/6kEZM5baDen
        xNPmjsHeTU9/RBXwBKw/lZlafS8jWmFGcuuWzRW2FenzjfZ2ThV6Kf+AxU53ygvLxlfRkSU7
        miyi9imxFGckGmoxFxUnAgCw4zk0QgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNLMWRmVeSWpSXmKPExsWy7bCSnK7ee7NEg3mXFS3OPf7NYvFg3jY2
        i5c/r7JZnN7/jsVixqk2Vot9106yW/z6u57dYtGNbUwWO56fYbeYuP8su8XlXXPYLLqv72Cz
        WH78H5NF0599LA58HptWdbJ53Lm2h81jwqIDjB4fn95i8ejbsorR4/MmOY/2A91MAexRXDYp
        qTmZZalF+nYJXBnfu1eyFbxlq/h24itLA+MR1i5GTg4JAROJ2f9PAdlcHEICOxglbvZ1MUEk
        pCR27z/P1sXIAWQLSxw+XAxR84lRYkLXNSaQOJuAlsTtY94gcRGBH4wSLx59YQRxmAUmMEos
        vvKWGWSQsIC9xIPmZ+wgNouAqsTOF5sYQZp5BawlTl0wgtglL/Hnfg9YOa+AoMTJmU9YQGxm
        oHjz1tnMExj5ZiFJzUKSWsDItIpRMrWgODc9t9iwwCgvtVyvODG3uDQvXS85P3cTIzj8tbR2
        MO5Z9UHvECMTB+MhRgkOZiUR3r/mZolCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeS90nYwXEkhP
        LEnNTk0tSC2CyTJxcEo1MFlpS95uVNSI2V9mkq+/6JLAZX7Wy2UOPoftuGbNXn/Q7OBLRb/k
        n66y8nHbPT+lGzjdYwuX//uDw/Awh7jwB67AzQcMdSQ8HHPle3puHCn0mr7Wq7B0td/G5Y0H
        ZtyI8P9j7hy/53y/hdTKVb1xN/u4vp36XByjxmMlJs0lE7xwUazgX4/EtUkM4bqTu97LiE9/
        FKjpmcEyzWTixMffHpp9Czh+6eK+xNM56k8OX21tCp8V7TrhvM4lmTNtbLcEF7dbbTX8471q
        0sY/39oPuGod4Zuy1r4qhremNXSP5i1B/bZtxcmZ+7ybnrH5XE2WYd2jI9w3J3DZY0UvyW0X
        J3l2vfiWudT4+u+nP73ilFiKMxINtZiLihMBf0t9uO4CAAA=
X-CMS-MailID: 20210907044846epcas1p297b8ef121290fc3265cf9dc3eadc44de
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210907044846epcas1p297b8ef121290fc3265cf9dc3eadc44de
References: <CGME20210907044846epcas1p297b8ef121290fc3265cf9dc3eadc44de@epcas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: ChanWoo Lee <cw9316.lee@samsung.com>

'err' is not used.
So i remove the unneeded variable.

Signed-off-by: ChanWoo Lee <cw9316.lee@samsung.com>
---
 drivers/scsi/ufs/ufs-qcom.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 9d9770f1db4f..92d4c61fc9d0 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -888,7 +888,6 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 				 enum ufs_notify_change_status status)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
-	int err = 0;
 
 	/*
 	 * In case ufs_qcom_init() is not yet done, simply ignore.
@@ -916,7 +915,7 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 		break;
 	}
 
-	return err;
+	return 0;
 }
 
 static int
-- 
2.29.0

