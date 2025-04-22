Return-Path: <linux-arm-msm+bounces-54902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF17A95AC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 03:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D8D41890FFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 01:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5A731A89;
	Tue, 22 Apr 2025 01:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k/MaKwZG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98E2C2ED;
	Tue, 22 Apr 2025 01:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745287151; cv=none; b=G0mtK+wktD9caxPCJpFwGoBKpXOEArm0PTKKLGPKkXaaH+2uEtKnZ2NQIBXdAbD35VIsn8ACoDoG47RLH1oCiw5FQ7+3vBi/X/A1hES+V87Lj5QORQLeWWrAB0qxGbBJCbIK28pZDWA+r5T2PG/6P2loBhKad96x6qaA1jlqZLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745287151; c=relaxed/simple;
	bh=lO8C/lxiz/hcIzhlxucykGknudyPv0eRAuZaDHXQXj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pVa7k4cnfy2FJCm+j0HaLeWRe8cJJFBojU676B0GePJEAO9BKscX8lmTzjh2uEgMhgEFlB2bhvrwY5osXZBz44UernJCeXehJb6OIOL7dSkabgZKx9d8QVO2LrKg54Vmk0F6dDuZkS9PKTr8Ph0FaNmVM0q5EbZBmGFhKnrBBto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k/MaKwZG; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M0gF64021737;
	Tue, 22 Apr 2025 01:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=bCv+LXjgnzxEsdWKBfq+4uHrOKdDTePNNUTUf0872es=; b=
	k/MaKwZGhts+icGwuqr9mq7ccEGmZ8BTd01wRrElHgDs62mIXGASgnvGGhG0Evcv
	PiCfJ6le9GYXDGw6VKysh6Wu4pISwXcNuJUQx9f9u4/Ps9pAGCrjBC/bJPfMg1N1
	qwvstRIsqnxFxTip/ICI6NADRYOGRkj+TlZgvNrmvtZY7zwzu8RLrpvok0Y+K+a5
	XobSoLMfcBPEkiUEzGWGu0vd644RjUYEWn2G8X+EL9x6EhRysZ68vcE6CKcpQDKy
	Jjj7Ojy9xrWQflM/GUMc2OL5jjcWnXO/4Yxe4GIFk6FBKS4ps5IHhQmU4gLJ0muU
	xx9h4oPyVhMG0MkBGZT/dA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4643q8uhga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 01:58:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53M10Vvo003082;
	Tue, 22 Apr 2025 01:58:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 464298r1sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 01:58:49 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53M1wn3Q010103;
	Tue, 22 Apr 2025 01:58:49 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 464298r1s5-1;
	Tue, 22 Apr 2025 01:58:49 +0000
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
Date: Mon, 21 Apr 2025 21:58:12 -0400
Message-ID: <174528706573.2687990.11863305784928158386.b4-ty@oracle.com>
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
 definitions=2025-04-22_01,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=814
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504220013
X-Proofpoint-GUID: MIj0yV2SWP7OWV_MJRHQKbdzuKJsveHo
X-Proofpoint-ORIG-GUID: MIj0yV2SWP7OWV_MJRHQKbdzuKJsveHo

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

