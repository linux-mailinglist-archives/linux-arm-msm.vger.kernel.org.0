Return-Path: <linux-arm-msm+bounces-25320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3A2928116
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 05:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0DF81C20BD3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 03:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5436873469;
	Fri,  5 Jul 2024 03:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fAWnXc2J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E825EE97;
	Fri,  5 Jul 2024 03:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720151656; cv=none; b=UnPQh3C1hxQUY7SAUO18Ebd18MLEPg1B1vL8C1ygYu55LN7H7jB/FbppfCx9NTYd6kuVtEDIe0necbZT8VAcMNuf/OmEvtdlAVa0hvdpDoc9QNYPNhGdeZaiHdyxgQGqmcmcdUyPhPz212/+C8XPzYkZpwnVqwqfPhfEZMBgVic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720151656; c=relaxed/simple;
	bh=BpuvriFk4tBTkcvIOJzPNcEZclOJezRXm2fUbGIypJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uAuBPU05VKhGJEWr+N5vk9XIsJ5v0FrPGm4cHAKX3dbPKXcKjoyITCxvziUFQKLdwqj2tciJN458fF7J9d+JEs1dCwRM06iUuTGqwrXlm6ig6PFVs9ibknKf1hJKNTpNteqjN3DdkGTpP4eO/QGtJpYIP6IKJB39UU2PHZs5Khw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fAWnXc2J; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 464DKuRn031090;
	Fri, 5 Jul 2024 03:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=
	corp-2023-11-20; bh=4BZCwtyO9t1QDe//Pn1bJXsdrZWpTamr8lKZHANnZPY=; b=
	fAWnXc2JjikunYCZ0PfMYExyvh9FQbm5l+WJjUWG1V+nmZ8uUqFf4a4eZPsUWwBT
	1H6XcBf+JsqdcA5F6gAUzBbh4IWSE97RGjtaYAPSFLCMj2d9tL8Pg0Ojh3+gVMbS
	khrI8r2SooDHuAsZHGN0b7eadCWuWcwrSpMtAZngDWY+hZKypadow0Eh+TI9D0ER
	5lqN8kkvI+toRj0VWtiVIVP6E3TU98dBT0pPXM0DbWTI1DOorWgt9OUc2UjZmpAR
	8Z4ZG1kyOM+/LvxTHPaHXRk1kBGcrsliXCKw6uwDyePmwAHLzUt0DBCENFktpdlo
	Z9ZgG7AMeIR3UUTYs0cxWQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 402aack5nx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Jul 2024 03:54:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 4653MCYE010234;
	Fri, 5 Jul 2024 03:54:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4028qh9y03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Jul 2024 03:54:07 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4653s6dM010018;
	Fri, 5 Jul 2024 03:54:07 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4028qh9xyf-3;
	Fri, 05 Jul 2024 03:54:07 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] scsi: ufs: qcom: add missing MODULE_DESCRIPTION() macro
Date: Thu,  4 Jul 2024 23:53:29 -0400
Message-ID: <172014707936.1511036.14365910924505005781.b4-ty@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240625-md-drivers-ufs-host-v2-1-59a56974b05a@quicinc.com>
References: <20240625-md-drivers-ufs-host-v2-1-59a56974b05a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-04_21,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxlogscore=820 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407050027
X-Proofpoint-GUID: CPO5hG50sh1jpqK62DIDCoAReyE_ur3T
X-Proofpoint-ORIG-GUID: CPO5hG50sh1jpqK62DIDCoAReyE_ur3T

On Tue, 25 Jun 2024 09:53:45 -0700, Jeff Johnson wrote:

> With ARCH=arm64, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/ufs/host/ufs-qcom.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> 

Applied to 6.11/scsi-queue, thanks!

[1/1] scsi: ufs: qcom: add missing MODULE_DESCRIPTION() macro
      https://git.kernel.org/mkp/scsi/c/4d66ecc6e5a5

-- 
Martin K. Petersen	Oracle Linux Engineering

