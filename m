Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AEC62BA124
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Nov 2020 04:30:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbgKTD3x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Nov 2020 22:29:53 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:57978 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgKTD3x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Nov 2020 22:29:53 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AK3NjDG154501;
        Fri, 20 Nov 2020 03:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=7T+25RsczIG/AyB9xuQpsSbg+PK5T5XL21kHWE6wBO4=;
 b=w7/Qru3pwCsJ00bIGYyFpHwkYvU5QlSO2hvo66v2fjoTuYDWjTtsAe3gFy207kJNxFTB
 Bcl+3/lRfBRlj5miDMccsTidBVZgxSO2VBU82kEhiAmNvhXu/1EF+g2Y5zui/iDiolxt
 dZ6HEN8xQ2H/dmLhFduYnqU09XJB+KLmZqVhlWwbEto4jaMn2dS4VnVP9eXHzxvjPY+L
 cEFuexDQPiI8eP13BultpgJt99Z5abq8F3bvUcwzjXFQW6bOWJUjRbg3tEIA+8Aac3o+
 ZiuNQSlbNU7BgUbOISZ0WYnv/m+kxmdB0IUWAtWV4d2b5sBSQ37awo/NV7cj5De8cVxC Yw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 34t7vngp1v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Nov 2020 03:29:48 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AK3Pjjb032583;
        Fri, 20 Nov 2020 03:29:48 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 34uspx2g7k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 20 Nov 2020 03:29:48 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AK3Tls0029078;
        Fri, 20 Nov 2020 03:29:47 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 19 Nov 2020 19:29:47 -0800
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
To:     Eric Biggers <ebiggers@kernel.org>, linux-scsi@vger.kernel.org
Cc:     "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, Satya Tangirala <satyat@google.com>
Subject: Re: [PATCH] scsi: ufs-qcom: only select QCOM_SCM if SCSI_UFS_CRYPTO
Date:   Thu, 19 Nov 2020 22:29:34 -0500
Message-Id: <160584262851.7157.18069892435697004008.b4-ty@oracle.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201114004754.235378-1-ebiggers@kernel.org>
References: <20201114004754.235378-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9810 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=895 malwarescore=0
 mlxscore=0 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011200023
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9810 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=923 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011200023
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 13 Nov 2020 16:47:54 -0800, Eric Biggers wrote:

> QCOM_SCM is only needed to make the qcom_scm_*() calls in
> ufs-qcom-ice.c, which is only compiled when SCSI_UFS_CRYPTO=y.  So don't
> unnecessarily enable QCOM_SCM when SCSI_UFS_CRYPTO=n.

Applied to 5.11/scsi-queue, thanks!

[1/1] scsi: ufs-qcom: Only select QCOM_SCM if SCSI_UFS_CRYPTO
      https://git.kernel.org/mkp/scsi/c/6ac63216a7af

-- 
Martin K. Petersen	Oracle Linux Engineering
