Return-Path: <linux-arm-msm+bounces-65977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA443B0D097
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 05:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF39F16D14C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 03:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A17028CF6D;
	Tue, 22 Jul 2025 03:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AArSDzSu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CDA273810;
	Tue, 22 Jul 2025 03:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753156071; cv=none; b=ts1XGtJVcPh6bddPYYzjrgScPb5bMSDplXC1RIOPllKBPW0QafONlscaBH9dgeHFirs+BCKTHnvOSjP/uNKa/BRgv7LX5xBkh5oHrhvoxtsZBPIEoqFW6ATqy0Ujx084mYNq7XAHD5/BsQjFBosR6qD8tEuHRA2H3xbrx3E8VC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753156071; c=relaxed/simple;
	bh=VlZoKkXfILCyhXWvhcKL/QC8xzbbAYgtnW23SdG77m8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iDOQHAt9XtBV1VqNmN8PEn/dBsiJGVSUkBkQ19cbSzDQJKsHWQi38UjAuKUWG4NFVHW591j0d7YLa1LjYVmyTRq+x8BgIAHTb+fKRZkqrvbBM8k9AtTMP2b8C099pDqYIsv6ldq9ZnAMtWd1WrmcWO36vDEHhxl46qfE634Pafg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AArSDzSu; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M1C55d019819;
	Tue, 22 Jul 2025 03:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=0vRilnNnXZdvoasg9Ce1BQpVV8hGMzrXKEEvgSPViTI=; b=
	AArSDzSuQOfdjNlakSBXL0hlENtl2zmfH+TpcG41Lr/o5db6ls/Iw+TUHN2D+KyF
	tTgk3gE81SnQ/GSL3ojVFU6AEbsGmV13oUlyqiuf4Pd5L1wVGTiKGnJ0XXDE5NK6
	CuuPH70ADgYdWYX5Gbolqobhi2ipOw1DNqtiarW82urV4miISjF+Aesk0NyGeqTn
	o+LN6fQ8ZgJnmBDiUP6A7WyBLBA/KtbAZtcHbbUcvLDb7DsKxuBc14MjD30fE8Aj
	+bBJ8SFwBUEWyBOdTsRayPb28r5+fhHmmK9xlaGS4Xw+2quYdiI3Gd9V9pfx4zJ0
	M1+yqfwqSeyqRyvBu/N7yw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 480576m5vt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Jul 2025 03:47:40 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56M0F3XL038366;
	Tue, 22 Jul 2025 03:47:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801t8tean-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Jul 2025 03:47:39 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56M3lZjH031915;
	Tue, 22 Jul 2025 03:47:39 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4801t8te8u-10;
	Tue, 22 Jul 2025 03:47:39 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com, bvanassche@acm.org,
        avri.altman@wdc.com, ebiggers@google.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH V5 0/3] ufs: ufs-qcom: Align programming sequence as per HW spec
Date: Mon, 21 Jul 2025 23:47:03 -0400
Message-ID: <175315388541.3946361.263020629496331023.b4-ty@oracle.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714075336.2133-1-quic_nitirawa@quicinc.com>
References: <20250714075336.2133-1-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=615
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507220028
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDAyOCBTYWx0ZWRfXye+kLrXN52Cn
 EOWvh+kr5Iaw3eG0Jy1YUmg6vFaRLKk8WfdHZI0V77HLEpRjNwOdI+gPVX+J+6mmLZ2lBicPiCd
 zJG1/NVmT0k7IYQvVViYAWhdoZbznjfKUcphfbOkm37L+fdlaPwWHbQBGc82SGNNLws1c10fudY
 O/bLKof/isWpHe6r3BP7TCxRAi68gUI5flP2hp8vyFXTjPQzMZzEo/LKF2SyCBW55yiCRf41PEl
 NH1cK3bWSoEZF+fTRPQdCJuMR1vEXAnBu/dVWndgGdVd5NxvQ1BtMLnRUqKDp8eMqHnD+mUTOxy
 Lc07gwBK/Xbw0aBicQGVID1dVdHML/GoEHFRXPOCOuSbtBIRijqJ1b1Oiwn/TmYsjUQKqHWhAgz
 /0hMQ+g9pUU7OdsPUTrfOEHQCp4Qgt3b7YlGiw8GQhZgSwLpUlnezL5RQWSc1NUl+n8d3ET8
X-Authority-Analysis: v=2.4 cv=doDbC0g4 c=1 sm=1 tr=0 ts=687f09dc b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=lFOT_AtsMLTQ2iPLmPAA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12062
X-Proofpoint-GUID: w_XxEuUbPxr4JrUdnduw_VYbu86WyTNK
X-Proofpoint-ORIG-GUID: w_XxEuUbPxr4JrUdnduw_VYbu86WyTNK

On Mon, 14 Jul 2025 13:23:33 +0530, Nitin Rawat wrote:

> This patch series adds programming support for Qualcomm UFS
> to align with Hardware Specification.
> 
> In this patch series below changes are taken care.
> 
> 1. Enable QUnipro Internal Clock Gating
> 2. Update esi_vec_mask for HW major version >= 6
> 
> [...]

Applied to 6.17/scsi-queue, thanks!

[1/3] ufs: ufs-qcom: Update esi_vec_mask for HW major version >= 6
      https://git.kernel.org/mkp/scsi/c/7a9d5195a7f5
[2/3] scsi: ufs: core: Add ufshcd_dme_rmw to modify DME attributes
      https://git.kernel.org/mkp/scsi/c/c49601642f95
[3/3] ufs: ufs-qcom: Enable QUnipro Internal Clock Gating
      https://git.kernel.org/mkp/scsi/c/5a6f304f39c2

-- 
Martin K. Petersen	Oracle Linux Engineering

