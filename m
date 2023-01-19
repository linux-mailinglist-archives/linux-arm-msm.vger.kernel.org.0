Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 083CD672D9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 01:45:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbjASApA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 19:45:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjASApA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 19:45:00 -0500
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E291577C6;
        Wed, 18 Jan 2023 16:44:58 -0800 (PST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30ILmxVX008047;
        Thu, 19 Jan 2023 00:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2022-7-12;
 bh=GO2Z0ZHviyURBdvfR5AJmLQs5r5kf1lyD4v2iGNIJ1k=;
 b=ss0b8p3uYgeGTugsfTF08d66nPPryrTBkOZgxSX+4KHv/zJKURgy7T2NVATcTUArxtE6
 7+jjfP8ieow9KHyN9tGbkEb3/Bwehw6dnBu5dYkgghFslZrU/0gkyT1GRjowQUDA3Uli
 +3cmOy8FPT3GTdTVUdvMAZEBYzgEC23Y6BqD5ABjQsAcYZqDyT1OPlo/8wkvNavwcj92
 pgEwCf5KQSbljjBVVKOO4MJ7m81uTmQIThIYp5hn9PaoDpSlzldTi3NBVS3xIvu0MniH
 IbiznfRape4XphX7flNOWdn7cRa/A6MJwyF7LY97p14lF5pgQS1QW+Fl2YATVFg8govo pQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n3k6c90vh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 19 Jan 2023 00:44:46 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30INUfhg033974;
        Thu, 19 Jan 2023 00:44:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3n6rgcdnmn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 19 Jan 2023 00:44:45 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30J0ijFv007831;
        Thu, 19 Jan 2023 00:44:45 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3n6rgcdnm5-1;
        Thu, 19 Jan 2023 00:44:45 +0000
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
To:     quic_cang@quicinc.com, linux-scsi@vger.kernel.org,
        Asutosh Das <quic_asutoshd@quicinc.com>
Cc:     "Martin K . Petersen" <martin.petersen@oracle.com>,
        quic_nguyenb@quicinc.com, quic_xiaosenh@quicinc.com,
        stanley.chu@mediatek.com, adrian.hunter@intel.com,
        bvanassche@acm.org, avri.altman@wdc.com, mani@kernel.org,
        beanhuo@micron.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v13 00/15] Add Multi Circular Queue Support
Date:   Wed, 18 Jan 2023 19:44:39 -0500
Message-Id: <167408782522.3511660.1673114118879533180.b4-ty@oracle.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1673557949.git.quic_asutoshd@quicinc.com>
References: <cover.1673557949.git.quic_asutoshd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_05,2023-01-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 mlxscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 mlxlogscore=753
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301190001
X-Proofpoint-GUID: 2Yi9DElvndsguW6qHpp5o4dFwEPInyPe
X-Proofpoint-ORIG-GUID: 2Yi9DElvndsguW6qHpp5o4dFwEPInyPe
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 13 Jan 2023 12:48:37 -0800, Asutosh Das wrote:

> This patch series is an implementation of UFS Multi-Circular Queue.
> Please consider this series for next merge window.
> This implementation has been verified on a Qualcomm & MediaTek platform.
> 
> Thanks,
> Asutosh
> 
> [...]

Applied to 6.3/scsi-queue, thanks!

[01/15] ufs: core: Probe for ext_iid support
        https://git.kernel.org/mkp/scsi/c/6e1d850acff9
[02/15] ufs: core: Introduce Multi-circular queue capability
        https://git.kernel.org/mkp/scsi/c/305a357d3595
[03/15] ufs: core: Defer adding host to scsi if mcq is supported
        https://git.kernel.org/mkp/scsi/c/0cab4023ec7b
[04/15] ufs: core: mcq: Add support to allocate multiple queues
        https://git.kernel.org/mkp/scsi/c/57b1c0ef89ac
[05/15] ufs: core: mcq: Configure resource regions
        https://git.kernel.org/mkp/scsi/c/c263b4ef737e
[06/15] ufs: core: mcq: Calculate queue depth
        https://git.kernel.org/mkp/scsi/c/7224c806876e
[07/15] ufs: core: mcq: Allocate memory for mcq mode
        https://git.kernel.org/mkp/scsi/c/4682abfae2eb
[08/15] ufs: core: mcq: Configure operation and runtime interface
        https://git.kernel.org/mkp/scsi/c/2468da61ea09
[09/15] ufs: core: mcq: Use shared tags for MCQ mode
        https://git.kernel.org/mkp/scsi/c/0d33728fc0e7
[10/15] ufs: core: Prepare ufshcd_send_command for mcq
        https://git.kernel.org/mkp/scsi/c/22a2d563de14
[11/15] ufs: core: mcq: Find hardware queue to queue request
        https://git.kernel.org/mkp/scsi/c/854f84e7feeb
[12/15] ufs: core: Prepare for completion in mcq
        https://git.kernel.org/mkp/scsi/c/c30d8d010b5e
[13/15] ufs: mcq: Add completion support of a cqe
        https://git.kernel.org/mkp/scsi/c/f87b2c41822a
[14/15] ufs: core: mcq: Add completion support in poll
        https://git.kernel.org/mkp/scsi/c/ed975065c31c
[15/15] ufs: core: mcq: Enable Multi Circular Queue
        https://git.kernel.org/mkp/scsi/c/eacb139b77ff

-- 
Martin K. Petersen	Oracle Linux Engineering
