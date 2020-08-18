Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF0A247C79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 05:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgHRDLg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 23:11:36 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:47424 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgHRDLf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 23:11:35 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07I37eB1032403;
        Tue, 18 Aug 2020 03:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=NMjehyoRdwcaIKTxw+C37+A1+p2Llic4cJZHZZ59yG0=;
 b=dB1qOqVHCLAHOd+6Kb9zguVQKSeURvR7COp08LwBSIAaYBMyMnBy5+tMOZiMPgTtaZrY
 VCafWsNv2hLJ2lqlkHg8gjcMmA1F4joYRTINyfkPPPtB8Rb8cMkNoRPqV5OLoaO2GcmG
 X9YEe282JtIgI7j2Rg3hu+pGbsqMRGBPuEP2wkuPLCwbKZSgMnc+aOl1LxNLOKdX1PrO
 yb4v4vGS0cYs6XKGCwUe3iCfC3Touw7OwPO2nkmDI73nI4LIuoSICWWZ9pS+bP2NVnIX
 oOrcf/jNnrqWc8IpmF3rcWLUmi5KiBM5N2dxd1yHC14K2fGsR7JsB1enCiSTwcpfQVaX fA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 32x7nma5ba-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 18 Aug 2020 03:11:23 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07I387fC131285;
        Tue, 18 Aug 2020 03:11:23 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 32xs9mf38t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 18 Aug 2020 03:11:23 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 07I3BLgB021986;
        Tue, 18 Aug 2020 03:11:21 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 17 Aug 2020 20:11:21 -0700
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
To:     "James E . J . Bottomley" <jejb@linux.ibm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Avri Altman <avri.altman@wdc.com>
Cc:     "Martin K . Petersen" <martin.petersen@oracle.com>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Christoph Hellwig <hch@lst.de>, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, Can Guo <cang@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs-qcom: Remove unused msm bus scaling apis
Date:   Mon, 17 Aug 2020 23:11:14 -0400
Message-Id: <159772022967.19349.11710994023015024776.b4-ty@oracle.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200804161033.15586-1-saiprakash.ranjan@codeaurora.org>
References: <20200804161033.15586-1-saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9716 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008180022
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9716 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008180022
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 4 Aug 2020 21:40:33 +0530, Sai Prakash Ranjan wrote:

> MSM bus scaling has moved on to use interconnect framework
> and downstream bus scaling apis like msm_bus_scale*() does
> not exist anymore in the kernel. Currently they are guarded
> by a config which also does not exist and hence there are no
> build failures reported. Remove these unused apis as they
> are currently no-op anyways and the scaling support that may
> be added in future will use interconnect apis.

Applied to 5.10/scsi-queue, thanks!

[1/1] scsi: ufs-qcom: Remove unused MSM bus scaling APIs
      https://git.kernel.org/mkp/scsi/c/d2cd212a2a54

-- 
Martin K. Petersen	Oracle Linux Engineering
