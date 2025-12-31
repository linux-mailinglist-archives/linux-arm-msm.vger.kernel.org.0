Return-Path: <linux-arm-msm+bounces-87046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A4DCEB3F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 05:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 270D730161B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 04:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7390F30F95F;
	Wed, 31 Dec 2025 04:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Id0mqPq8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GSr9X0js"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9422DF126
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 04:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767156982; cv=none; b=JtzYl9k76qBbkvn17ZaFsJWzW3R5iC3+lII2+B/SCRu9cBdGq+xCd/A2OZ2HLfLKA1Xpvx4jNdMMbWe3RiKIcfSWSmmAvzOocqBdsk66wuVce3++7LcClN6H1i4QSUuP8wv6dixkCIymnKPqcogbgUA84c55VyiYhc2TGpc4h24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767156982; c=relaxed/simple;
	bh=2dG3MDNKrqsWAhzawNR1aoHF/S/qOVLjUclYEMWpaqw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=U8aDgjnnZmtUqyua9MOJB7edKGKdJMasK4dZaNirnNL/pTU+2RqLiuYUyVaT+1iIsfwyCz+3X/hdplP+WJslV6h2pj2XbRcPoEWCb0DSz32mVIljk2bl4PJtCyOL8EOIv6m8hRaRnTqYB8K53ygxaG3rtuOy7O9mdkTqK1tLEvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Id0mqPq8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GSr9X0js; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUKkRi11478218
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 04:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=d7rvefi3WWPcYh3ySNgBvn
	5BaqhwKnptGAbYBu0AxzA=; b=Id0mqPq85mgCjfcRs7ruwqejhUhhsivXoke9CF
	EgPeUuqDIR6PViQzVBWBSGGjkWX09IrvlEAlw4J4zsQMxRGcBXadHLj/cgXzTvoE
	jB6qPAVGWdJGrBd8sJ+NIf33X8JNugpJ4EtBIEctnx3k6FB9wEXzKXBDhIQxHW91
	17+KvnwFP8XKhDQDZRIYV5CLwoD3TNMbkVskXbgO/0oGoQsXeGO3XbRaaOghW1Ff
	qiVF9MEcqM5AlgYEuumFobhids75Amx2OuWq34jyg1jdINR9YCIkQlvV8i+/gmcR
	pk196LT1YLglIS613FUCSYD02JG+U9Npz0ONVMdngzFX/EhA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc7462vg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 04:56:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7dd05696910so15754088b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 20:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767156977; x=1767761777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d7rvefi3WWPcYh3ySNgBvn5BaqhwKnptGAbYBu0AxzA=;
        b=GSr9X0jsFX+5ukc3FHsV+P0svk04yXEDrJIkQKMn0MwdFWlsxUSX0e2S/Ft9ry5KBi
         CG2RFdv0ZaCsTCV6Q6/lrGfNg2iegX5lOPbIyUBBj93KWVUKKpruWTs6N4jphOmOnPfJ
         9IOkbVRHnxpaOm81h8rfJt8V9WKFWxaiPUuTVmAYpy/gb5jESTpKEoYzH9pbNxfpxm5l
         Y6wJdcKHS1joQJiJr9uHp++P+pbY7pTjxoGPFhDs26fnYlc7dr1+6yyI3qPOP1FBcZt+
         1ILtC7y1VDUhUwWMtHrBfPbxeTH/Cf8o8mGDecgDi2167fEhNEztth016RblAXNveiUG
         T/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767156977; x=1767761777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7rvefi3WWPcYh3ySNgBvn5BaqhwKnptGAbYBu0AxzA=;
        b=fcfq6Q4w3iZDuJWOnWO9mqXis6SYFZH4ZjM2I2jm+XRmAYP8ubX4S8mE3mYafxx2DS
         DkbxNBIaWlJHJ2vKUAZaaZf9DI8IGiSJHl/Vd7rf7eQTjpGSe0OBoOizcvb+N/tgyCNh
         MrOahi2ao4U4Dkhz8wxV6V/U1ntv6iqzkIH/tP/HrCR2EQICDTBcnlB+X3glvSx/8MmX
         VvQvYYo6yEHyAhiWY7F1kQhJIT8pWk5Uf0f9p3Qb6sgBFP+OVMkutQoBXuGCdwjkXUPg
         i9Kqe/HQn5cU/NWLsqSlYualN1QH25HL0Os50uMRjHaiKIJlqcNUCGeHas0iXT8F9FyI
         cIyw==
X-Gm-Message-State: AOJu0YwZV3vdwByQfFLBTafAiekCWQGCiiCCO33/i8Di0HNxmPnuqy2U
	Njg7f8ihBHsnILq1KvQOmnsAWpT9UUpSQZmNqFEmtLhoSKJ5h+Mcj6vol6NyHA5ejlHvYaPXe5/
	gdUFi4wZkP4n9oTv1J+lxy9ioHdEeTP02HN199JfLLrQuoW2aZ+FJfiwyW3DBTMNPRnPu
X-Gm-Gg: AY/fxX5L3MCtYbmiY8q8SRqBoHUevFyT9+xzqLRjdntdM+HECVP+Oz5QZxswTEwHT3o
	04/E82tq2pSsi100Y/KsW3t7oB4uwOwWlCTz+PjJXtQ0SjmHofeNfhL0PTOhf7x0XrHO6HsTGmD
	KxogwJ+J0zaFR/ZIiEzaxElPygIUW4Dw8OJyr1ggDQtz05mPdSM199PshdI5JGRPluu1ertX8T6
	uqiN6cvTtRgioS4iM20VGsRpZQtNDtSM2zwMcYbBl2RTbILeL86yorb6DCB58aUTxpbx/PyoD63
	bZlepehruEJrSYPpN8DXdYRdFf+OehJ/vxzQ3AOiQOmpO5ZDT0yfj4TaWAjjsy3inc56E96kCTW
	7SeorSj1kbHuWmdsMQr7cmbjRktElC2FKvYvwMB6U
X-Received: by 2002:a05:6a20:3d05:b0:35e:3cac:858c with SMTP id adf61e73a8af0-376a8ac34f9mr34412531637.33.1767156977461;
        Tue, 30 Dec 2025 20:56:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqLBdf6uMV8DFh0VBlMSGuSu9XN2RqAwG0fovaAX+nmtfBnoxFFDcU82fQKsczTZQJYbMk6Q==
X-Received: by 2002:a05:6a20:3d05:b0:35e:3cac:858c with SMTP id adf61e73a8af0-376a8ac34f9mr34412506637.33.1767156977011;
        Tue, 30 Dec 2025 20:56:17 -0800 (PST)
Received: from hu-rdwivedi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d4f7d3sm34547697a91.4.2025.12.30.20.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 20:56:16 -0800 (PST)
From: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
To: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, ram.dwivedi@oss.qualcomm.com,
        anjana.hari@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V3 0/4] ufs: ufs-qcom: Add support firmware managed platforms
Date: Wed, 31 Dec 2025 10:25:49 +0530
Message-Id: <20251231045553.622611-1-ram.dwivedi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Do9bOW/+ c=1 sm=1 tr=0 ts=6954acf2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Nxr8sekpfmpq4ZlREHgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: jvMF1R-b10NrC9PSVPQX6Mh3nutXJRQe
X-Proofpoint-ORIG-GUID: jvMF1R-b10NrC9PSVPQX6Mh3nutXJRQe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDAzOSBTYWx0ZWRfX6JOebv7ffpPl
 mxNaw+OW2emiMeU1EkGBXD9IQf19m8q7j5wke+P60PQ5wR+G6EoGLvy0fLF1r1TdZX9fVcjlPM9
 irULtlQLEcJu25iRN5IaT5SfxsbRAB4r6r12vegWzjw1F19YZKDiNrBzyT63MCQaTlTwkn1hIS8
 1xy5WV3Jkc7QrMMgx6ToEbExar1XaJKQBtFp6g+ZjTlNfOPTTVU7E0jICnwxtnUcln6tP4wauO6
 jQaZImLZQ0qzBzjTRzsZun+4RhxZuYrKs67QCZlzeBbBIlKyz8OEgF/db5PnGK2KwLHYoAPx9SL
 /HbsNQs83AVsvaNuf72B4DMQcgvPYmmQQREa2RPMSSyGZfoVRWfqq8Yd4JW8f7yPWbP9PjZ7QNK
 XJkuVa7wvo5neDxLqnjrUfA6pg0xsWD42CAbzNUSQgkLJMXbiT1QJQvG5knAmoqYS5j2ZXv3UME
 5wpd6Hu8X7cnFEbGAuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310039

On Qualcomm automotive SoC SA8255P, platform resource like clocks,
interconnect, resets, regulators and PHY are configured remotely by
firmware.

Logical power domain is used to abstract these resources in firmware
and SCMI power protocol is used to request resource operations by using
runtime PM framework APIs such as pm_runtime_get/put_sync to invoke
power_on/_off calls from kernel respectively.

Changes from V1
1. Updated "dma-coherent" property type from boolean to just true.
2. Switched from QUIC mail ID to OSS mail ID. 
3. Added Acknowledged by tag from Dmitry for patch 1/3 
4. Added Reviewed-by tag from Manivannan for patch 1/3 

Changes from V2
1. Added new patch "scsi: ufs: core Enforce minimum pm level for sysfs
   configuration" to prevent users from selecting unsupported power
   levels via sysfs.
2. Set minimum power level (UFS_PM_LVL_5) for SA8255P platforms.
3. Changed DT example in qcom,sa8255p-ufshc.yaml to use single-cell
   addressing instead of dual-cell addressing.

Ram Kumar Dwivedi (4):
  MAINTAINERS: broaden UFS Qualcomm binding file pattern
  dt-bindings: ufs: Document bindings for SA8255P UFS Host Controller
  scsi: ufs: core Enforce minimum pm level for sysfs configuration
  ufs: ufs-qcom: Add support for firmware-managed resource abstraction

 .../bindings/ufs/qcom,sa8255p-ufshc.yaml      |  62 +++++++
 MAINTAINERS                                   |   2 +-
 drivers/ufs/core/ufs-sysfs.c                  |   2 +-
 drivers/ufs/core/ufshcd.c                     |   5 +
 drivers/ufs/host/ufs-qcom.c                   | 163 +++++++++++++++++-
 drivers/ufs/host/ufs-qcom.h                   |   1 +
 include/ufs/ufshcd.h                          |   1 +
 7 files changed, 233 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml

-- 
2.34.1


