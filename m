Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADF271F4B63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 04:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgFJCZW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 22:25:22 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:33878 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725798AbgFJCZW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 22:25:22 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05A2Gn7Q048473;
        Wed, 10 Jun 2020 02:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=Bdui7u4XM81OcPdkAfNmLW37AcCSeVZ7wpNG0nFDb1k=;
 b=q3fzBu/LacuOsEwSurKmfxPMAs7Axky9B7f1y9P/tnAoaSeXvruZE9ErYoxKKsIJAeV3
 XhJreVSN0c1zCYDWQN99KE/XVNqBcA32K+oxR0o0lRSR/SGgToSvag40j7pMylAVeMQk
 q90HmWVYSMIPiur5NmInOwpn5yOPTB3ITCWzTfENCSiX6aM91zfQTq9WslAosdn2aveS
 IT4grdVMqu+M/sRjK503Qg1cEpyeTSHxYtzaIXONzkY7XavOi9fRU6LysW268tCRvq5G
 AE9T0LPsrGScf4666T8bm1dqZ5JyJFLWxnTLXxPP/mSfRlEPOW4bKwscjhXxkWzmlZdU Wg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 31jepnsrrt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 10 Jun 2020 02:25:15 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05A2Nhml178916;
        Wed, 10 Jun 2020 02:25:15 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 31gn2xmtt2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 10 Jun 2020 02:25:15 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 05A2PDFF011900;
        Wed, 10 Jun 2020 02:25:14 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 09 Jun 2020 19:25:13 -0700
To:     avri.altman@wdc.com
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        alim.akhtar@samsung.com, jejb@linux.ibm.com,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        amit.kucheria@linaro.org
Subject: Re: [PATCH] scsi: ufs: Bump supported UFS HCI version to 3.0
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1eeqnsln7.fsf@ca-mkp.ca.oracle.com>
References: <20200604063559.18080-1-manivannan.sadhasivam@linaro.org>
Date:   Tue, 09 Jun 2020 22:25:11 -0400
In-Reply-To: <20200604063559.18080-1-manivannan.sadhasivam@linaro.org>
        (Manivannan Sadhasivam's message of "Thu, 4 Jun 2020 12:05:59 +0530")
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9647 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 malwarescore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 spamscore=0 suspectscore=3
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006100017
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9647 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 suspectscore=3
 priorityscore=1501 bulkscore=0 clxscore=1011 phishscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 cotscore=-2147483648 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006100016
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Avri: Please review!

> UFS HCI 3.0 versions are being used in Qcom SM8250 based boards. Hence,
> adding it to the list of supported versions.
>
> I don't have the exact information of the additional registers supported
> in version 3.0. Hence the change just adds 0x300 to the list of supported
> versions to remove the below warning:
>
> "ufshcd-qcom 1d84000.ufshc: invalid UFS version 0x300"
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/scsi/ufs/ufshci.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/scsi/ufs/ufshci.h b/drivers/scsi/ufs/ufshci.h
> index c2961d37cc1c..f2ee81669b00 100644
> --- a/drivers/scsi/ufs/ufshci.h
> +++ b/drivers/scsi/ufs/ufshci.h
> @@ -104,6 +104,7 @@ enum {
>  	UFSHCI_VERSION_11 = 0x00010100, /* 1.1 */
>  	UFSHCI_VERSION_20 = 0x00000200, /* 2.0 */
>  	UFSHCI_VERSION_21 = 0x00000210, /* 2.1 */
> +	UFSHCI_VERSION_30 = 0x00000300, /* 3.0 */
>  };
>  
>  /*

-- 
Martin K. Petersen	Oracle Linux Engineering
