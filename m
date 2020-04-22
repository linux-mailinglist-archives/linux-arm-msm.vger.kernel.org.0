Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E18C1B35EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 06:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725835AbgDVEHQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 00:07:16 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:37810 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725810AbgDVEHQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 00:07:16 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03M3wh9U052561;
        Wed, 22 Apr 2020 04:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2020-01-29;
 bh=CXy27XimszPCc1m0DvfiEsLS9gQM1NpiNecuLxJv8MM=;
 b=RuKqT1Ior2xKgL7CYOgixRA9Nsnj5U+CcoyajoS5ZcWDepXzHISWLnUiLkXnI/TubXkf
 9pHkIUrefDgZUg3OxBQIg5qVqPxcAxqg2EccFj5WgV4/c7gnePRLuH5bh4bwqBw93jhD
 0Uvov3Mz/RXDxJbtlcvKp9amnVsEFVIsDyrnK5vE9S3z12yVW7gPnca1QqFOBo9VMSTQ
 7Q0xQJ7SVWF+coxZDVkuyOFb0QbG9DKQ/hkzIJuaTrNXS5/V577wvKUphrNDg95V4AmA
 lwNgal0myKLHEoXVhZwkSKHsZhX62ta022SAN90fCtk/DMmr2dm0axvfnBOQzsVjjQzs 3w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 30ft6n89w0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 22 Apr 2020 04:06:52 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03M46VkP148654;
        Wed, 22 Apr 2020 04:06:51 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 30gbbfqkys-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 22 Apr 2020 04:06:51 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03M46m8Y031250;
        Wed, 22 Apr 2020 04:06:49 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 21 Apr 2020 21:06:48 -0700
To:     Jason Yan <yanaijie@huawei.com>
Cc:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
        <jejb@linux.ibm.com>, <martin.petersen@oracle.com>,
        <p.zabel@pengutronix.de>, <cang@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH] scsi: ufs-qcom: remove unneeded variable 'ret'
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20200418070625.11756-1-yanaijie@huawei.com>
Date:   Wed, 22 Apr 2020 00:06:45 -0400
In-Reply-To: <20200418070625.11756-1-yanaijie@huawei.com> (Jason Yan's message
        of "Sat, 18 Apr 2020 15:06:25 +0800")
Message-ID: <yq14ktci2p6.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9598 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004220031
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9598 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004220030
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Jason,

> Fix the following coccicheck warning:
>
> drivers/scsi/ufs/ufs-qcom.c:575:5-8: Unneeded variable: "ret". Return
> "0" on line 590

Applied to 5.8/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
