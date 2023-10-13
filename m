Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 086827C8EB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Oct 2023 23:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232272AbjJMVEL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Oct 2023 17:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232218AbjJMVEH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Oct 2023 17:04:07 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40681BE;
        Fri, 13 Oct 2023 14:04:06 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39DKwxHp024337;
        Fri, 13 Oct 2023 21:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-03-30;
 bh=SL0h6z/vV7VfUut/S0ZVh8mKDOxERh3hMQRoIaPeuGM=;
 b=KHL1OLwDAMTVhBq9JBbc8MOU7S8UMBj0l9UaQdW3Vu6OU3xB5WhRBEB4nIsrLL/xYuZC
 Gjp8iBrfILbQQS1wGVvUxrK0HFk7HHPbHu0OpBTgUtuIPTuX6aRSTqMlgjbTTnZMCAPc
 O1S5MdIDir6E6guCmggmll48897R3A1dVDKGjkCMNLgqUbhbMX8+l9oE9/uLpJc3rX8j
 sA/GeBh0pwQp1rfzmIfPou9zkBc4sgtgzc5uVjlHXwh9E/2PrqqxlGJHfeTVTlGL1ZLd
 6a4Z+4HL4ib25MXWCl0X0Z59rbZPlKDdwz01Y0bclvfCL/st6r2h1RtrCw0H1+D43Taw cg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3tmh8a36xq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 13 Oct 2023 21:04:01 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 39DKhOo8036883;
        Fri, 13 Oct 2023 21:03:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3tpt0uxn74-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 13 Oct 2023 21:03:57 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39DL1kdh003704;
        Fri, 13 Oct 2023 21:03:57 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3tpt0uxn63-2;
        Fri, 13 Oct 2023 21:03:56 +0000
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc:     "Martin K . Petersen" <martin.petersen@oracle.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: qcom: remove unnecessary check
Date:   Fri, 13 Oct 2023 17:03:50 -0400
Message-Id: <169721547131.1657123.11625044048800486728.b4-ty@oracle.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <fe3b8fcd-64a7-4887-bddd-32239a88a6a3@moroto.mountain>
References: <fe3b8fcd-64a7-4887-bddd-32239a88a6a3@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_12,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 malwarescore=0
 mlxlogscore=718 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310130183
X-Proofpoint-GUID: ZBUGp6b0ICP-RIjqYNDJ1epwXUN3i8YB
X-Proofpoint-ORIG-GUID: ZBUGp6b0ICP-RIjqYNDJ1epwXUN3i8YB
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 02 Oct 2023 10:03:35 +0300, Dan Carpenter wrote:

> The "attr" pointer points to an offset into the "host" struct so it
> can't be NULL.  Delete the if statement and pull the code in a tab.
> 
> 

Applied to 6.7/scsi-queue, thanks!

[1/1] scsi: ufs: qcom: remove unnecessary check
      https://git.kernel.org/mkp/scsi/c/b6f2e063017b

-- 
Martin K. Petersen	Oracle Linux Engineering
