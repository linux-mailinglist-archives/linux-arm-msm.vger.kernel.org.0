Return-Path: <linux-arm-msm+bounces-34536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A99F799FEEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 04:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43756286CF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 02:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25B316F909;
	Wed, 16 Oct 2024 02:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mctE92Ti"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3801531CC;
	Wed, 16 Oct 2024 02:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729046456; cv=none; b=P/8qyT0r9yC0Ui6hbYuCv8Dq2lehxy72F/yBlTTsSZteSR79HrJTCeH+fM29L4uKrZ5vvvDHDtFyQNY3kDl3dOC6OCdU1MLsTCbjnIGMPzsyCA3ZJHDh0WJ0XA0GEoCwgua6r9Eou+1vivnG71EA6iFx/xBLGpEVcC52bO3E0BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729046456; c=relaxed/simple;
	bh=ggtukzDCBknstAUAiLxiHKD8g1ydzPlnIEK3GDf2m0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OGMpZbni+8CEdygCDOzVUP7uquZW88g+OXK9U7VPWwmri3KhgpHwfc/8cPk4BG3Kia5Dv69WuGWH0MKwG1pBikxbilfm2StbROOqwPH6wPzxbGPBAeLs+HzR83HmIJaOfvb7MMgK0DkgWgwnx0hMkHwv8t3Xm9lW57CfUydbQII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mctE92Ti; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G2Mj5x010633;
	Wed, 16 Oct 2024 02:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=NPGnedbp6j+8gxJyc2ONPp3TktwLVpibDdPSmnFFRgA=; b=
	mctE92TiiemlDOFAzTkz4WhJ1O+Mg/LyTx55tLhRPcYKNzdARIAQ6yPl0nmDWPDe
	rR9bQ8r9A13DbChsvP1Tj0R4ho+JAMoK4TBoguFumSCsrXT/tB7h9C4kjqd78K4l
	UbqQS+Jc0GTMtnRVIVQFKBLlaUKRVyAfKG96xaEdWLZKUxjpO1grXJCJlrgxzfyz
	0i1vgih5KcSFI8uCHkbAtRq7FUYUVYdfEyVpx7kcgvwY8ueEfwC6jSaUenyFeqfz
	OJIJ/wEKhB9aZnQYFchIJhWK+YLv60egyETfsFri0IiGmrDNJqZvnluPGd+rwkHG
	JaM8s39yIRE8PGdXeIiEhA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427fhcj8sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Oct 2024 02:40:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49G0osXV026718;
	Wed, 16 Oct 2024 02:40:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjesy0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Oct 2024 02:40:50 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49G2elgB001510;
	Wed, 16 Oct 2024 02:40:50 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 427fjesxyf-7;
	Wed, 16 Oct 2024 02:40:50 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Manish Pandey <quic_mapa@quicinc.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_narepall@quicinc.com,
        quic_rampraka@quicinc.com, quic_cang@quicinc.com,
        quic_nguyenb@quicinc.com
Subject: Re: [PATCH V3] scsi: ufs: ufs-qcom: add fixup_dev_quirks vops
Date: Tue, 15 Oct 2024 22:40:08 -0400
Message-ID: <172852338085.715793.11867555708797291362.b4-ty@oracle.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240903131546.1141-1-quic_mapa@quicinc.com>
References: <20240903131546.1141-1-quic_mapa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_21,2024-10-15_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=631 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410160016
X-Proofpoint-GUID: jp46JvLCA_rRzoHMDd2Oet5QCtUL0Xk6
X-Proofpoint-ORIG-GUID: jp46JvLCA_rRzoHMDd2Oet5QCtUL0Xk6

On Tue, 03 Sep 2024 18:45:46 +0530, Manish Pandey wrote:

> Add fixup_dev_quirk vops in QCOM UFS platforms and provide an initial
> vendor-specific device quirk table to add UFS device specific quirks
> which are enabled only for specified UFS devices.
> 
> - Add DELAY_BEFORE_LPM quirk for Skhynix UFS devices to introduce a
>   delay before VCC is powered off in QCOM platforms.
> - Add DELAY_AFTER_LPM quirk for Toshiba UFS devices to introduce a
>   delay after the VCC power rail is turned off in QCOM platforms.
> - Move UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE quirk from
>   ufs_qcom_apply_dev_quirks to ufs_qcom_dev_fixups.
> 
> [...]

Applied to 6.13/scsi-queue, thanks!

[1/1] scsi: ufs: ufs-qcom: add fixup_dev_quirks vops
      https://git.kernel.org/mkp/scsi/c/94c4c5d78b0f

-- 
Martin K. Petersen	Oracle Linux Engineering

