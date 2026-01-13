Return-Path: <linux-arm-msm+bounces-88679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D29C4D17256
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:01:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8948F3013962
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB1436B04B;
	Tue, 13 Jan 2026 08:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dcZbl769";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RIbzLaoT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B28936999C
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768291278; cv=none; b=P6q6lzjcIigpCqGbePZg3PF6gUE3OvKgheH5TRIfyEypqpBgPrzJjGFS4SKfmzve8UOE0zEfru3IejF7ITMbvNsNk5DIxC1iEVpMFrY0OcQ0fFPY5qg4ejSSyyiFDcKiY+RIHGEDCNkd3ZRYme8SWdmQMdaC8ykgqbQgjdwRoZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768291278; c=relaxed/simple;
	bh=8pPIKnJcI5Mf+HjhRpi0stuvWU4pMxlGix40vfOJ/gw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=d7xQTPh7SRJN/JlaKiHKdHAx3dZgEyRbsg/ydkze0565oYmN+6u3SRJ6hDzX2h7YtrWBBhied/CwfD60WGfPm2J4a3eHHi+C//UuKrnCC5meEvWlESrzQhWIZJkuVt46BNIFlh72twlnMEE2A62PsFQYrGfNu9l7i6YD5K5V9ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dcZbl769; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RIbzLaoT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7Pxe9177711
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Gc3rkkafnnxjPSIOAIrhhn
	X/jj1SiI4kU3VTMma0oWU=; b=dcZbl769RtsVbRO+Dbs+8B+bYcqfZA/sx11Z0c
	AaxpJ5qVxc59dTFWdm1H3E0aGWrCosGW3lm8L0VdxwSZEWkRRXXm/aXpLS9I9cJ9
	4JAmkx5VffXg8dqRXKtB/jko2jcivkaS/0y+gP01GsDhpX8oGfnw56txiMuraG7T
	MUNv5ZvIBGPLzpzWCyLe8Zf/3SfM0aMLhEqMwa2fnrOJNgVyYaea5S+CYIypK+IU
	5Bk/EWYnq/HX/Bx2ak9dGmlHgbWc8PnlphFBQTlpneXjkP9t2wssjpYPHEHIZM5D
	vJ8Tm8XbLMj3YeMjKuvrT+oGdT6WlYfjRS69tUKl8aHq+1PQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn52f2ary-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:01:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f25e494c2so65796155ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 00:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768291264; x=1768896064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gc3rkkafnnxjPSIOAIrhhnX/jj1SiI4kU3VTMma0oWU=;
        b=RIbzLaoT/cKOdsp7T5bvii49sARsbQZOMziAOuFsdaJjY392Qy2RfjGA0mR1gVEiZE
         CpSOTm1bDZKzgJ6Xj7X2GG7hpLzrvvQYBnMYVh7wDiRR8SxNm6Q62hoArvFyojJikJjV
         L6hPEIj72wPO0zd0FusovtBviKo1VmI9IHu1vb7G0AYvEDBlPSDoT6tY1mxvmY27oajn
         DV4xFG2237WkIpDMAoxZ8Tl5hhbKJIR/WJyVfg42XDIcbC15zBjcYioDB5av6klQ8AwP
         +WVl0kfL+YDA15Tn+FoD7cw3o0ya3FAeyRqiS3kuBguKPMpsBMIgFXa1TOyK00p5Got5
         tfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768291265; x=1768896065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gc3rkkafnnxjPSIOAIrhhnX/jj1SiI4kU3VTMma0oWU=;
        b=CDQTaQf4iN5n7cxdV69NDrQ3oivyre7y0FrVnpet+Z2yJ36d9HlcZ53TDVmRZkum0C
         gJGpGzyHOVWBOJZAeXKsrgjrMkezLbtDsIN2jA9yTk60jDUdJdPDNmJFCBGNawAgpmna
         A86ydnPNdTzNzohzDm5uLGX+GjLexT8kwEoJsw6Wi7w5UYz37fp+QkMPgJRpTcyXNfAL
         UmlnoQTtzNipgila71Y5Pm/LLMaqF7l61rEP9ViVJlKmwgAlnD0Q5poDlIMMSENpeT4J
         sZh26SWu97oDiivrVWMcHv+LckiPdAfI8VoqXFl+m/I/ZPwHuUvFMlbW4mAYzeC3fTSk
         dmuA==
X-Gm-Message-State: AOJu0Yzq9QDKK4Dnttaal2EQqpzQpS2GYxkN3B0fWCCn1RjW/19mKtWc
	TUlL5x7o0FMTrhgpLERdl42BgAp/qVGfh8jCWFxuBjIRqZRB8I2wfIQYDBtrRx+gf6yFPkECJ6f
	VahfHfVo0WwixsV/TZLJw3YolA+KFHOcN1IxdJ9BTbcgpkd4BC/iZ8o6bM2tDs/aWQGV1
X-Gm-Gg: AY/fxX6JrwzenE7CmMFy1//1dRRVuawminSBiAdSciNs8oeUkMZY7v7wRNt0scvE8fy
	qWCcN95J+UMgLY8G7+mrv6BZbn0USDRGImPcU/R6gieFeu0MI7wm2QQWlcQS81PE9tBaUh4LRZW
	N7pniFxQBgiZBgansa2l805FnChXh/ZFAif0nf3gfAiEajk7nlIcNrIAjkQlziH80iZm2P7s2jY
	ZU1tBrD0gy/xe7SCoi2yA0LolD2wz9P8loCqFM0y9jfc/Esrw/+/b0uSSk5QqoCzeu5MgyHFa1N
	fnnFS0FBl/Hhmwb03rKkNBREsLiHVMlngrMT0H5SzsuikSGzc5vi/J/3BWNkC+IHrZ1E0GAoXRf
	Vwxb6zLEsmcM0Kij3zkMv7CAeLcUAnxIyj2EGTcIo
X-Received: by 2002:a17:902:fc84:b0:295:592f:9496 with SMTP id d9443c01a7336-2a58b5015afmr17274635ad.20.1768291264335;
        Tue, 13 Jan 2026 00:01:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERSW7Yb+/5CobzFAzu+FgCJlw8ZLQmnluW6ph/hOL/hrNL+RvpgwJ1qbt0YkWHtnX3dd/lKA==
X-Received: by 2002:a17:902:fc84:b0:295:592f:9496 with SMTP id d9443c01a7336-2a58b5015afmr17274125ad.20.1768291263603;
        Tue, 13 Jan 2026 00:01:03 -0800 (PST)
Received: from hu-rdwivedi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48c15sm191132725ad.27.2026.01.13.00.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 00:01:03 -0800 (PST)
From: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
To: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, ram.dwivedi@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V5 0/4] ufs: ufs-qcom: Add support firmware managed platforms
Date: Tue, 13 Jan 2026 13:30:42 +0530
Message-Id: <20260113080046.284089-1-ram.dwivedi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA2NiBTYWx0ZWRfX+tkKVlfazknP
 IX3CCxyg47usAHzYxRg8raRNk1G9nID2Q4XjglFZTTKQCGKscqByD9cqlNvFeKhU+de1LtHeM/a
 x6j9hqzVq99cW0z6IxeL1fqiM2DNUoHUYXFTTnpY419yUYOHR/3NxfgzdFw6Cq2D9AN0vCSToeT
 XObJFOv/19zmaxqKY/HejOrjhM0pm4+2wfO6VBuz7OfDxh5dgBS5aAniH6FFWTM8a2l5DrrWM1s
 ZU34JLo2zOhuVpNXt51BWD1GDAF07g+W6+FqyMIV+08ON9DvbcjltlCPLZ6mrhmWcAzDZSynhXU
 2K8SKItzCMRLALidGJqeFyJAi7zMbGtmRb4e0LhC8YGeRVBZ327aByqIE8CLlP7coFPpHErmEg4
 CJR5Vu6H2APlpnPfmRZfl+wHM+VmMrSfrhFIdZ14HqYX96PSyM/jOJ2+fNbTKdpY2atO6Bfue/A
 qMQibxUoIsH0G99vUAQ==
X-Authority-Analysis: v=2.4 cv=TcCbdBQh c=1 sm=1 tr=0 ts=6965fbc1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VSDEYizg4LtL04GxL0gA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: s1RIOOsorOK08otKuiUb2YyvedT9YYko
X-Proofpoint-ORIG-GUID: s1RIOOsorOK08otKuiUb2YyvedT9YYko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130066

On Qualcomm automotive SoC SA8255P, platform resource like clocks,
interconnect, resets, regulators and PHY are configured remotely by
firmware.

Logical power domain is used to abstract these resources in firmware
and SCMI power protocol is used to request resource operations by using
runtime PM framework APIs such as pm_runtime_get/put_sync to invoke
power_on/_off calls from kernel respectively.

Changes from V1:
1. Updated "dma-coherent" property type from boolean to just true.
2. Switched from QUIC mail ID to OSS mail ID. 
3. Added Acknowledged by tag from Dmitry for patch 1/3 
4. Added Reviewed-by tag from Manivannan for patch 1/3 

Changes from V2:
1. Added new patch "scsi: ufs: core Enforce minimum pm level for sysfs
   configuration" to prevent users from selecting unsupported power
   levels via sysfs.
2. Set minimum power level (UFS_PM_LVL_5) for SA8255P platforms.
3. Changed DT example in qcom,sa8255p-ufshc.yaml to use single-cell
   addressing instead of dual-cell addressing.

Changes from V3:
1. Removed address-cells and size-cells from example DT in
   qcom,sa8255p-ufshc.yaml.

Changes from V4:
1. Fixed indentation in example DT in qcom,sa8255p-ufshc.yaml.
2. Added missing kernel-doc description for pm_lvl_min in ufshcd.h.
3. Removed redundant spm_lvl check.
4. Consolidated spm_lvl, rpm_lvl, and pm_lvl_min assignments into
   a single line.

Ram Kumar Dwivedi (4):
  MAINTAINERS: broaden UFS Qualcomm binding file pattern
  dt-bindings: ufs: Document bindings for SA8255P UFS Host Controller
  scsi: ufs: core Enforce minimum pm level for sysfs configuration
  ufs: ufs-qcom: Add support for firmware-managed resource abstraction

 .../bindings/ufs/qcom,sa8255p-ufshc.yaml      |  56 +++++++
 MAINTAINERS                                   |   2 +-
 drivers/ufs/core/ufs-sysfs.c                  |   2 +-
 drivers/ufs/host/ufs-qcom.c                   | 156 +++++++++++++++++-
 drivers/ufs/host/ufs-qcom.h                   |   1 +
 include/ufs/ufshcd.h                          |   2 +
 6 files changed, 216 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml

-- 
2.34.1


