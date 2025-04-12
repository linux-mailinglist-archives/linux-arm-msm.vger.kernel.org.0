Return-Path: <linux-arm-msm+bounces-54094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC436A86C82
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 12:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA2958A68E7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 10:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD93197558;
	Sat, 12 Apr 2025 10:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TljbZ9Em"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A378C5339D;
	Sat, 12 Apr 2025 10:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744453788; cv=none; b=JU1Bw/P9AbdXZs4CkR4ot8e3uaqqLIedcbtqXGx9B+OM/OXqZKDDzWKAz1MeLLWFsTKK5S9Ods2m5spMMUm3GxsznM7YAOWTRWtgS3BPGzDOFmFJta9WadhROuOo4EdlcKHWfUmLPprxy1tglQO24Nco7FeLaWoxSrdn3IsoPSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744453788; c=relaxed/simple;
	bh=lO8C/lxiz/hcIzhlxucykGknudyPv0eRAuZaDHXQXj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VQHYgYWqeKqR5nUd5bc7o72SS9X12p4fv08yKs1bR7p79/2SKQw9xO+EwRm0k7CbbC3ZwagKERJevKFpvgoflTroYEUe7ysWIQzJPFo6FWAUtzZCvTiK9pf23gSfWeBTOF4pf/JeQxidAn+nsq/KARrfcIjmnUPunlw/oyTTq+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TljbZ9Em; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53CAEarI008932;
	Sat, 12 Apr 2025 10:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=bCv+LXjgnzxEsdWKBfq+4uHrOKdDTePNNUTUf0872es=; b=
	TljbZ9EmHKq2Lft2h2GU+5y78NqD98LaubCXNFUUFHPkON5e+EIPn6dwD1R1uomY
	wz6j8nNSQ2BS4H0NjQ4uX/+wijQw/BWkOIwf2LQ7TRhCfK6Y9Q4LRtf/ONw8GVN7
	w11Gzbr3PRkzFy2AEiYzNNt5JLMaMAVzWE75z/TY95ea+Y9DqmcJryBfFtHfeMbF
	1r+l1wcBTWzz1mAFf40KLrJXCbuaGEYIqw8iz38kIBPSVRK7cne2jU1a3ftgwxEu
	/6VXGEHZPOZ3d4LzlmBEHY7N0UojiX6cjTtcryluBHklYUq7tD5QO9nOJ0kVXzG3
	ksoDUgBHC3/XFghApoZnKA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45yp74r08w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Apr 2025 10:29:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53C71GSY032217;
	Sat, 12 Apr 2025 10:29:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45yem69s1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Apr 2025 10:29:28 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53CATROe038043;
	Sat, 12 Apr 2025 10:29:27 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 45yem69s0s-2;
	Sat, 12 Apr 2025 10:29:27 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Manish Pandey <quic_mapa@quicinc.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        quic_rampraka@quicinc.com, quic_cang@quicinc.com,
        quic_nguyenb@quicinc.com
Subject: Re: [PATCH V3 0/2] scsi: ufs: Implement Quirks for Samsung UFS Devices
Date: Sat, 12 Apr 2025 06:28:54 -0400
Message-ID: <174445370242.1751018.13232235248067319659.b4-ty@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250411121630.21330-1-quic_mapa@quicinc.com>
References: <20250411121630.21330-1-quic_mapa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0
 mlxlogscore=783 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504120077
X-Proofpoint-GUID: SQKq961hfoZzr6zAt_JTXQEpnrt91EjM
X-Proofpoint-ORIG-GUID: SQKq961hfoZzr6zAt_JTXQEpnrt91EjM

On Fri, 11 Apr 2025 17:46:28 +0530, Manish Pandey wrote:

> Introduce quirks for Samsung UFS devices to modify the PA TX HSG1 sync
> length and TX_HS_EQUALIZER settings on the Qualcomm UFS Host controller.
> 
> Additionally, Samsung UFS devices require extra time in hibern8 mode
> before exiting, beyond the standard handshaking phase between the host
> and device. Introduce a quirk to increase the PA_HIBERN8TIME parameter
> by 100 µs to ensure a proper hibernation process.
> 
> [...]

Applied to 6.15/scsi-fixes, thanks!

[1/2] ufs: qcom: Add quirks for Samsung UFS devices
      https://git.kernel.org/mkp/scsi/c/f8cba9a700cf
[2/2] scsi: ufs: introduce quirk to extend PA_HIBERN8TIME for UFS devices
      https://git.kernel.org/mkp/scsi/c/569330a34a31

-- 
Martin K. Petersen	Oracle Linux Engineering

