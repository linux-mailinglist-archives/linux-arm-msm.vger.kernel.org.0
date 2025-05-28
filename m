Return-Path: <linux-arm-msm+bounces-59644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 366F9AC5F3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 04:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A3CF1BA1219
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 02:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6551D5CC7;
	Wed, 28 May 2025 02:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bl8Lg4SX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723D11CDFAC;
	Wed, 28 May 2025 02:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748398878; cv=none; b=ppnvsuHyx4FD7l88soSNhi/APl2KdupSqJdn+NbV7rKFvRCcwhdxWvide2WK6Twu51HqoiaWay7lFT0/s3w7y5q3GJwCGSiqHTtI5Vlde3KUdq7ALuDtcpfgaanGG1hpNCvBlPmtJ514kw4ISBrC7AIP7p5CEPhsohIbq6xV31g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748398878; c=relaxed/simple;
	bh=cYJi0mO6FR9Fq9Mtr+EHKNmV4OJuY4yn7I3TnYQygII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bG6zW5snfvm7EzVg69isKEaIzcfAirAiBRwwbzKwBh8x/xpWk63TV1DDtlKLeLrWRavxMAJcIAHMPbW8mTrvrkihI03/zj72xNcNjVhB/Dct8bvpLurih1UDSKXBCYgQPgkff+Lx4oHwXiXbv0/0/oxbJpVDZJ9T3W4FfpwF0Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bl8Lg4SX; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S1ftSm004025;
	Wed, 28 May 2025 02:20:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=1fqCVYhAjEGSPxoFsPppZxpVEtdQgFVNs8w4MEiMzyU=; b=
	bl8Lg4SX2lExcizTAl/Sw3rEPEGoG0UfYVyN7b2kfKDHpoNus0yb5kg/vL5N9E97
	SBFCZriszLEv7A5uggl9hrcTzie09wS2ymx3t20Fcl4ps+6xKmFz7JmqvjztaJDH
	ElTwOcwZ99CT9Y26glMjbW686QyVXWkKBNchxALLWWXGVERckGFXudlWd55++IFq
	8O/gdL5B3Pe/eN/UWzvsjCx30l0Co4AL7Hy6yMuZNjLplaVUUD+vCVC3tS3HCYFB
	SQD+MXiwUkacyOfmhdNPzSx00cQJ7LKTkmrfYTvPpK64XXUoWZ/FkHz/jhgXOplv
	R1vc5W/iHP9d7KDYxVzIrg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v21s4t0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 02:20:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54S2D8Hw021345;
	Wed, 28 May 2025 02:20:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jgb226-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 02:20:54 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54S2Kq16017834;
	Wed, 28 May 2025 02:20:53 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 46u4jgb21n-4;
	Wed, 28 May 2025 02:20:53 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Manish Pandey <quic_mapa@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/4] Add UFS support for SM8750
Date: Tue, 27 May 2025 22:20:18 -0400
Message-ID: <174839736807.456135.16048184384727247357.b4-ty@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250327-sm8750_ufs_master-v3-0-bad1f5398d0a@oss.qualcomm.com>
References: <20250327-sm8750_ufs_master-v3-0-bad1f5398d0a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_01,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=889 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505280019
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDAxOSBTYWx0ZWRfX7eQNfEm6fume dz6Hw3CxnKVyE+oV0xtdM0JJ0jv/Fn7I1BTmS3yAqvPqwa7nBz3PAzPOjD032IT4c3VkPOElfgq ZINeRpcjwjRjcRgdyZITxbignie3p1qhtgoff1t7n4Rap5XCBiSUBjxTwSynGddof/AUKXaJqbY
 N1eaJlIaJ8QgnKrVpQ4bHBivVwc0xEg0td3I74uVV3JLuua487G8SbL3vNyE5DqfposnfT+rJpV by+tTQ7FeHZu+IiWwY11bqGkYbLv8dYtgz0Hk3KECkai1sQ1Kqu7qWWyEGEj7HcsHcT8gDNnVmu q1ZgQ/5SxdQGJyiW3aVFhKgHcpOySFV8ehhItL+fpeRevB12FngZdF8lRMsp+mammtdkbBG/MxN
 Ma5dcHgSN4qqS2Z9DfxdytvtQHUUbZ/zjOi6Qmo+3+vUI/s8GJqj1wK7v5Ls/QmZJZem/rOB
X-Proofpoint-GUID: g8bmLl87tRcic78R7hlBmSMBH6e7yZ9u
X-Authority-Analysis: v=2.4 cv=UvhjN/wB c=1 sm=1 tr=0 ts=68367307 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=QWG3RY-Bl80FByNc_ZkA:9 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:13207
X-Proofpoint-ORIG-GUID: g8bmLl87tRcic78R7hlBmSMBH6e7yZ9u

On Thu, 27 Mar 2025 13:54:27 -0700, Melody Olvera wrote:

> Add UFS support for SM8750 SoCs.
> 

Applied to 6.16/scsi-queue, thanks!

[1/4] dt-bindings: ufs: qcom: Document the SM8750 UFS Controller
      https://git.kernel.org/mkp/scsi/c/7727a9d414c9

-- 
Martin K. Petersen	Oracle Linux Engineering

