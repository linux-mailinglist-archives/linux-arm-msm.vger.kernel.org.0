Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE8F1E3550
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 04:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbgE0CNW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 22:13:22 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:41414 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgE0CNW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 22:13:22 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04R2BiS2057149;
        Wed, 27 May 2020 02:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=YIyN4Qo606LJ4RFAc+vzNbDR934KRVMtW+N72kxxmv0=;
 b=f8qNoHcPre7uK7Wq6gM8KVA72N+8BM3ORXTKXSYMaprmm+8eTEg/we6RskC0cqmZqWlr
 0oR8MQY1AMCKRhG2MitViTJegX44OUimvlW2QAidnr/ZnN7wkJH9Lq2TNmnuZ86nzzSY
 B4DQLgZfrhFmvon9rUHK1mZSHWp9FiyuuO+Oyfa8NTwG8Fb9w/KyNlWMNGDamoBgYpwP
 0GYRmuSVurm/HTSYc2MPJ5s3nTKfPJNDe3XFFG/0S4SEKOn3AxtJK26rJENAKRlHYCuN
 6g0dHuNeFmkGHeo8gdIAcftk0VWTkRVlS4/1FmszLzlUfERfLDjkwMyY63/XT5VVQdPk hw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 318xbjvym6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 27 May 2020 02:13:13 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04R2D1Vn062744;
        Wed, 27 May 2020 02:13:13 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 317ddpxqbr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 27 May 2020 02:13:13 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04R2DBSB017236;
        Wed, 27 May 2020 02:13:12 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 26 May 2020 19:13:11 -0700
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
To:     agross@kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        avri.altman@wdc.com, venkatg@codeaurora.org,
        bjorn.andersson@linaro.org, subhashj@codeaurora.org,
        alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc:     "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs-qcom: Fix scheduling while atomic issue
Date:   Tue, 26 May 2020 22:12:57 -0400
Message-Id: <159054550934.12032.14920097484832266826.b4-ty@oracle.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200525204125.46171-1-jeffrey.l.hugo@gmail.com>
References: <20200525204125.46171-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9633 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 phishscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005270013
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9633 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 cotscore=-2147483648
 suspectscore=0 bulkscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005270013
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 25 May 2020 13:41:25 -0700, Jeffrey Hugo wrote:

> ufs_qcom_dump_dbg_regs() uses usleep_range, a sleeping function, but can
> be called from atomic context in the following flow:
> 
> ufshcd_intr -> ufshcd_sl_intr -> ufshcd_check_errors ->
> ufshcd_print_host_regs -> ufshcd_vops_dbg_register_dump ->
> ufs_qcom_dump_dbg_regs
> 
> [...]

Applied to 5.8/scsi-queue, thanks!

[1/1] scsi: ufs-qcom: Fix scheduling while atomic issue
      https://git.kernel.org/mkp/scsi/c/3be60b564de4

-- 
Martin K. Petersen	Oracle Linux Engineering
