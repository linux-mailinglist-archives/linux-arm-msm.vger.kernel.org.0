Return-Path: <linux-arm-msm+bounces-28843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFB2955494
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2024 03:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEF04B2249E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2024 01:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0674B256E;
	Sat, 17 Aug 2024 01:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cSpSARHt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9B04A33;
	Sat, 17 Aug 2024 01:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723858164; cv=none; b=pTsDIDOU0KGx5S5FLL1aVOgAWC1/Gf8eubloaUDv5ZEgslvw1RDnjS3dYzQUcvqWrlEqIm0ja1YBqkrfHM1q4i+H0yrF23GiLZMAhT38hdJbd5W00RDcF+GWjnHu1uYNA++vW+9+mfPu6FfeP2K8lwTXjjvhN48lDCw//Vr/lAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723858164; c=relaxed/simple;
	bh=V/d/6HnoTTWKblMGDKv3jp+2ukcmBYswNp0SW78fEy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PIvfAbZr/mSzat+nhlOCgahezqgmVhSTR0ZC9o74R6tC1RQWVMc8zlXCU4cB5v1UQLn+TB3Kk55C1gecY8I4Jt7RZSq8jzs71yasIo5+VoolFQqvuU3EKLY0ymYkyyHd9ny6cns+yNIgewnufiY9eaaKqXGKog3Km5HgmAzLVJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cSpSARHt; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47GLCcKb015131;
	Sat, 17 Aug 2024 01:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=
	corp-2023-11-20; bh=dIujAo9/K+/2O8m95Ui4TTzkZywTRmRL8xdIFrLX10Y=; b=
	cSpSARHtS2UXj7TJSsOgZUCsjiISDkPWd+0QP6gipGCefjDGoT4M8xNuv4XvxDJ7
	9aiW9a6iVy5pzZRkAUAFHj4T/NEZOplt/yv6DHWAE0krFKGv9R1AeD3wmCTJ14ce
	gwbEVLO722SQ+TRTcaKKJzKDWC0xJeAQYbwy3zPbZDvyeBtN7V+WCToLuesoOzkw
	SXxu4uO9bL99UVEkcR/Z+D8PWQhLVy/fsR4GC81ohLp3UTCUM5qWylz0zkdQhIM5
	5biZjS+zMAH+bxBp8k3R1mQET2LNQ8u3qQJXnQiCEpM6QsicbXvai3LeFVNghnmI
	z1MKy3B6OesUWjb7FTMCxA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40x039dhp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 17 Aug 2024 01:29:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47H1IGdK021064;
	Sat, 17 Aug 2024 01:29:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40wxnkh7w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 17 Aug 2024 01:29:14 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 47H1TDaa025300;
	Sat, 17 Aug 2024 01:29:14 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 40wxnkh7vt-3;
	Sat, 17 Aug 2024 01:29:14 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Kyoungrul Kim <k831.kim@samsung.com>,
        Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [PATCH v3 0/2] ufs: qcom: Fix probe failure on SM8550 SoC due to broken LSDBS field
Date: Fri, 16 Aug 2024 21:28:36 -0400
Message-ID: <172385808994.3430657.15574636404074767339.b4-ty@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240816-ufs-bug-fix-v3-0-e6fe0e18e2a3@linaro.org>
References: <20240816-ufs-bug-fix-v3-0-e6fe0e18e2a3@linaro.org>
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
 definitions=2024-08-16_18,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 mlxlogscore=656
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408170009
X-Proofpoint-ORIG-GUID: tTur6kplq6Hn2p1yAWjeJaLxbvhjq6iR
X-Proofpoint-GUID: tTur6kplq6Hn2p1yAWjeJaLxbvhjq6iR

On Fri, 16 Aug 2024 11:55:09 +0530, Manivannan Sadhasivam wrote:

> This series fixes the probe failure on the Qcom SM8550 SoC due to the broken
> LSDBS field in the host controller capabilities register.
> 
> Please consider this series for v6.11 as it fixes a regression.
> 
> 

Applied to 6.11/scsi-fixes, thanks!

[1/2] ufs: core: Add a quirk for handling broken LSDBS field in controller capabilities register
      https://git.kernel.org/mkp/scsi/c/cd06b713a688
[2/2] ufs: qcom: Add UFSHCD_QUIRK_BROKEN_LSDBS_CAP for SM8550 SoC
      https://git.kernel.org/mkp/scsi/c/ea593e028a9c

-- 
Martin K. Petersen	Oracle Linux Engineering

