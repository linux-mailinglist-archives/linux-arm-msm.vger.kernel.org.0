Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E16792C96B2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Dec 2020 06:06:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgLAFFU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Dec 2020 00:05:20 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:55656 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbgLAFFT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Dec 2020 00:05:19 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B14nG8C008493;
        Tue, 1 Dec 2020 05:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=vvL4IJ2G7NlSTfaTAS4JXtLo8kry4yfNip+qSJGDInY=;
 b=DpKX57hKtv0Z6SiycceP2rThYUEKqHaJxjySUvdZhrKeidlfsHMrquLjYgMO1NwUcPhj
 SMzNRtB7maMaMoLcl8JJMbhFJz8MWZmOebQShpgb2yIr01DaabycSOnJi4x2CeiHVmG7
 d7h6yfrahdVwxahaChYIdHCfqCclzpyTapk5e8Ae9h/A/ACDrseTYsp6H+xUFwH/OCpx
 zsUkIbdSE5MuWl6mOUR7OkL5tPHQkC4BfWmdBQ4ekahvK8CXP/4iBD9o0aA7Ov3dYxgC
 /oUyT2wygaajla0wy7O2ZMkpYJG43UNuAc/M/TyOhhZtkt898sU0ociqlc2YjEYopZBT jw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 353c2arqdc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 01 Dec 2020 05:04:28 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B14oMqP134962;
        Tue, 1 Dec 2020 05:04:27 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 35404mdvgn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Dec 2020 05:04:27 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B154PZf022129;
        Tue, 1 Dec 2020 05:04:25 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 30 Nov 2020 21:04:25 -0800
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
To:     "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Avri Altman <avri.altman@wdc.com>,
        Can Guo <cang@codeaurora.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Chu <stanley.chu@mediatek.com>
Cc:     "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: Adjust logic in common ADAPT helper
Date:   Tue,  1 Dec 2020 00:04:15 -0500
Message-Id: <160636449893.25598.9433065109930517138.b4-ty@oracle.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201121044810.507288-1-bjorn.andersson@linaro.org>
References: <20201121044810.507288-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9821 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010033
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9821 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012010033
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 20 Nov 2020 20:48:10 -0800, Bjorn Andersson wrote:

> The introduction of ufshcd_dme_configure_adapt() refactored out
> duplication from the Mediatek and Qualcomm drivers.
> 
> Both these implementations had the logic of:
>     gear_tx == UFS_HS_G4 => PA_INITIAL_ADAPT
>     gear_tx != UFS_HS_G4 => PA_NO_ADAPT
> 
> [...]

Applied to 5.11/scsi-queue, thanks!

[1/1] scsi: ufs: Adjust logic in common ADAPT helper
      https://git.kernel.org/mkp/scsi/c/66df79ccbc2f

-- 
Martin K. Petersen	Oracle Linux Engineering
