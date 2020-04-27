Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03E031BB1A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 00:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgD0Wt4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Apr 2020 18:49:56 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:32808 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbgD0Wtz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Apr 2020 18:49:55 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03RMmne9073051;
        Mon, 27 Apr 2020 22:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=oVk8zwrCCyRVmyAmlLHAB42v5Wo3dr+BdvPGt8M+b5c=;
 b=hQwP0xWEjPM4LuTak6zdQr3K5KVk9tbSy6vMxMSn1cyor61nF8zUouHexJo1Bx/QiZOn
 HHPQq+Bquce/nH96nYf6JvVlfa45p0/yz2JeI+cZV6aysWnpsgPWqVjWL9Z7gxw+Ovnh
 EhqOF8ckzP3ui+D6jFqWvoTLbSFNqs8UiY5ibQ0oeLH8Gz5lDG/cAYEmjEI9NcQgo23n
 b1ZCQqFOmdaaldY7ort2cKB8Z+L4Kpbs3ZV7IjPeHcWg8MuC1Uorla8ElI1TOFeDuvYK
 NAuurCEMbSaOwdr2F6PuVpcsXVI4pCr/TyyO0TBepDJESOPxsYXt5rOU/zMWFee5OQCa Rw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 30nucfvfy2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Apr 2020 22:49:53 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03RMc9oW100402;
        Mon, 27 Apr 2020 22:49:52 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 30mxrr6v27-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Apr 2020 22:49:52 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03RMnpOk022303;
        Mon, 27 Apr 2020 22:49:51 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 27 Apr 2020 15:49:51 -0700
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
To:     cang@codeaurora.org, linux-scsi@vger.kernel.org,
        Avri.Altman@wdc.com, Asutosh Das <asutoshd@codeaurora.org>
Cc:     "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 0/3] WriteBooster Feature Support
Date:   Mon, 27 Apr 2020 18:49:47 -0400
Message-Id: <158802757520.27023.18369609870776656823.b4-ty@oracle.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1586374414.git.asutoshd@codeaurora.org>
References: <cover.1586374414.git.asutoshd@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9604 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 mlxlogscore=825 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004270185
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9604 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 priorityscore=1501
 mlxlogscore=896 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004270185
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 8 Apr 2020 14:48:38 -0700, Asutosh Das wrote:

Applied to 5.8/scsi-queue, thanks!

[1/3] scsi: ufs: Add write booster feature support
      https://git.kernel.org/mkp/scsi/c/3d17b9b5ab11
[2/3] scsi: ufs: sysfs: Add sysfs entries for write booster
      https://git.kernel.org/mkp/scsi/c/c14e7adf3a6a
[3/3] scsi: ufs-qcom: Configure write booster type
      https://git.kernel.org/mkp/scsi/c/04ee8a01abf8

-- 
Martin K. Petersen	Oracle Linux Engineering
