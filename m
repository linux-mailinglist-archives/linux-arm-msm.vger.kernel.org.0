Return-Path: <linux-arm-msm+bounces-49208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA41A431DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 01:33:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38A2A17AB62
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 00:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A141A7E9;
	Tue, 25 Feb 2025 00:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CUi7gvqw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD11D299;
	Tue, 25 Feb 2025 00:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740443624; cv=none; b=OdmYVG9QMPSDr/5PH+1sFQjMXRaBVJd3iTIl/1oTMfybBeafnbPIchFlHtfNYPUR/U64RIcdhghX1cpsUT4kjWSsX/5tKwDggTEawt8Li9KGsljdbHfRH4JPlXz8dfMok0hzMMOrxV6JiW6XKpmQsttkNrk336ZMQ/Ei7TPgbXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740443624; c=relaxed/simple;
	bh=1VZfkv08qP83/ubSw+2Xn3dDZD1+KM2HyPhVAJ2GWHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DB2chxbeI+WTqJJBBSrorcnBHWQm5TgWuIXIpHWptgPzi8R75EFwpQVXSMXgZ7mP/PgHXmrxsZU8yyd+4MYRVAHOBclJW9/ylKUPcxsYQQgSrO6YhquU/C7HPM/MgB138edMYhOHCgCQ7ge4vPiH6OqRH4nPEEx3nXCuGIRS2rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CUi7gvqw; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51OMKO7Y031497;
	Tue, 25 Feb 2025 00:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=pSv1Wdf/Hm6RiItBgUnQHgACZrKqn9XK140tk2kZmxk=; b=
	CUi7gvqwVOiWGx2ziEN00FPzhmGWs77EBZ6GOvfFDro6RLJ3LIzPeY2zAlBcze9m
	gvGMcd5EFGiPUEyaCYRdgVTk1tEdFes5SscytomiBeGslAsSFkojHLl1YB8BWO58
	wGnL27FokaDTlMeXYm5F3TgjKfVL5yR30+Z219qlL+epwZMCBCQNbQMaHL+UeuO3
	+sQW/+sNp4TvoWt0I8H8Wnj/ioUmfaTHQL74NckiacP/dnrzbZ3VkJYhTRAUf6Bc
	/1/K+EBh5iAQfCk5L17th8OYAnTpc8O3okAxufSScOlxsZIaQg7Geen3fLjmhdc+
	TeqvxnpOwQ/XL3rblieHcg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44y74t3vw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 00:33:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51OMhW81025357;
	Tue, 25 Feb 2025 00:33:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44y51f0q8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 00:33:20 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51P0XI1v025171;
	Tue, 25 Feb 2025 00:33:19 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 44y51f0q87-3;
	Tue, 25 Feb 2025 00:33:19 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: quic_cang@quicinc.com, quic_nitirawa@quicinc.com, bvanassche@acm.org,
        avri.altman@wdc.com, peter.wang@mediatek.com,
        manivannan.sadhasivam@linaro.org, minwoo.im@samsung.com,
        adrian.hunter@intel.com, "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] scsi: ufs: qcom: Remove dead code in ufs_qcom_cfg_timers()
Date: Mon, 24 Feb 2025 19:32:48 -0500
Message-ID: <174044345136.2973737.17206426967568925750.b4-ty@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <547c484ce80fe3624ee746954b84cae28bd38a09.1739985266.git.quic_nguyenb@quicinc.com>
References: <547c484ce80fe3624ee746954b84cae28bd38a09.1739985266.git.quic_nguyenb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_11,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2502250001
X-Proofpoint-GUID: 1kP9L8xxV7pD0caR5q3YQ0zO5OJRMPLJ
X-Proofpoint-ORIG-GUID: 1kP9L8xxV7pD0caR5q3YQ0zO5OJRMPLJ

On Wed, 19 Feb 2025 09:16:06 -0800, Bao D. Nguyen wrote:

> Since 'commit 104cd58d9af8 ("scsi: ufs: qcom:
> Remove support for host controllers older than v2.0")',
> some of the parameters passed into the ufs_qcom_cfg_timers()
> function have become dead code. Clean up ufs_qcom_cfg_timers()
> function to improve the readability.
> 
> 
> [...]

Applied to 6.15/scsi-queue, thanks!

[1/1] scsi: ufs: qcom: Remove dead code in ufs_qcom_cfg_timers()
      https://git.kernel.org/mkp/scsi/c/476cda194903

-- 
Martin K. Petersen	Oracle Linux Engineering

