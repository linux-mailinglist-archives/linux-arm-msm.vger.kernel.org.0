Return-Path: <linux-arm-msm+bounces-44769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 997C1A09CF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 22:17:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9757816A60F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 21:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5EC4215F71;
	Fri, 10 Jan 2025 21:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dLaAD4WJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D94204098;
	Fri, 10 Jan 2025 21:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736543860; cv=none; b=Ijld0vlLKVaan/ll4B/3ustuAfTSu54zr68cRa93v9chVpw3swT23k517/8CUDhj/cO5k1QiHxpXNPoYvNTBzHqJQK6a0ZgoeyiQTL8UUgC7omrEL4xTLVmWVr+OgCiaF8zrIjXBa0SaqTUCOoIDrfz4RO/EuQ1DZX2rm+9R+po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736543860; c=relaxed/simple;
	bh=lf9+mcV6JbV1iptvUb3hMXGmcACe4sHQYUmure01PjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EkDss+zYfueD9x4kTm4oaRUEGn+fd1yk30yVHihwahYsQEfwzOJmz5e17xzqtxLJ1rb+SSLQKsnDL+yuKbq2kTqD2nJyQkNKWDLwqA6LxEUUB+aMIZIw0fpWrD/nhzEFJWSCJM2NfFIQRzVSnlHyfbK0KSvn1RXy1A7ITaIURlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dLaAD4WJ; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ALBwgi022287;
	Fri, 10 Jan 2025 21:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=eP848ZOFxSgl5pDt0ENZdkCL5izjjGR5jke3ZwY/cmE=; b=
	dLaAD4WJcdwmJczhjMt+wbsna16JMWEtzVzhtqf5Kw2oFnMQ0lqRiU/HBLWwdLG+
	Eu3ZVyEk7K6rtqnE0Y0LJWVscLl833byGPslJC0Gsf7bsg27Nk79hB1edfHESmgG
	D4ZpXHeOm/3byW8x8YKLhgbayd/7IfUkcMXvBgUhyxOoNMyAKVA0GleR2U1M9b2b
	q8H/jpz4FRIDGhWlcIjSjytdy0rkJYNfAxLuKfJRh+8sFu23M4i7IP9TViFpqGAS
	Yc/iMugfqrAY25vZZeWX1vEL/v065wSC2PSqQtHxZrOkAkIBF4mjlHDlhi0ky2ZH
	PPRNszsKKBi9cv86DhPgIQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xudcc0ss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 21:17:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50AKUL5b027457;
	Fri, 10 Jan 2025 21:17:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43xued5r4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 21:17:28 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50ALHQ1q034137;
	Fri, 10 Jan 2025 21:17:27 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 43xued5r3k-2;
	Fri, 10 Jan 2025 21:17:27 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Gaurav Kashyap <quic_gaurkash@quicinc.com>, stable@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH] ufs: qcom: fix crypto key eviction
Date: Fri, 10 Jan 2025 16:16:44 -0500
Message-ID: <173654330175.638636.9812514803908918382.b4-ty@oracle.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241210030839.1118805-1-ebiggers@kernel.org>
References: <20241210030839.1118805-1-ebiggers@kernel.org>
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
 definitions=2025-01-10_09,2025-01-10_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxlogscore=863 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501100164
X-Proofpoint-ORIG-GUID: e7F8E0kCmHLMdKdObNfSTUJlYOha8QYD
X-Proofpoint-GUID: e7F8E0kCmHLMdKdObNfSTUJlYOha8QYD

On Mon, 09 Dec 2024 19:08:39 -0800, Eric Biggers wrote:

> Commit 56541c7c4468 ("scsi: ufs: ufs-qcom: Switch to the new ICE API")
> introduced an incorrect check of the algorithm ID into the key eviction
> path, and thus qcom_ice_evict_key() is no longer ever called.  Fix it.
> 
> 

Applied to 6.14/scsi-queue, thanks!

[1/1] ufs: qcom: fix crypto key eviction
      https://git.kernel.org/mkp/scsi/c/7a0905caf566

-- 
Martin K. Petersen	Oracle Linux Engineering

