Return-Path: <linux-arm-msm+bounces-84911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62563CB360A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 16:53:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A5193073D50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 15:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7002F26A1AC;
	Wed, 10 Dec 2025 15:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TRFis1JM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQv3Mkdd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A7E248893
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 15:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765381849; cv=none; b=MSrAN4CO12M5WJKxrm8uKaBR6iH5SnPTAwWIzD/M/V72U1rueAlvnSQqKrOHbGgSVmPKhjL4eCD866WD0F48txnS0+xXppS/aU4BF/nxatOpEV4Yv2Ssh+vzrqHNQfhIHiZcNluqIE3fPEbRaWgXSf0Vs+9Yi3DzoOsfjCS7KQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765381849; c=relaxed/simple;
	bh=CJC+DROpqAY4QNQLhqjy50fvpKfrxA/OYyGOujEXapE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=kGjqFJoC8CGjTZeS/ZsWzdLJGcM4RIpPCwOU0hM8dn0wxvggB40nN7hkmaN8lSt+asKOiQcW0vI49qSodFJTeSXt/ighCTWjlWw9UzilUVJzjT7gdBLos0KlCb7ugnis4+3T2QxIwos9YaT83OIS7ODRKBAgZrk3Xq7RQVCvqtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TRFis1JM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZQv3Mkdd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAAPl3D2303418
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 15:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NulxUS44q4FBpIRfW4Izyq
	Bq6K6Z/xTMYm+Fsi6EhJ0=; b=TRFis1JMuMahG2Hl5jQPYLG55r+f8IJlvE4fL1
	tqu+xd557fAczCjPJ7cx3nVeSREsds44EWlYHRT43aPxAduRq5O6bRGWo0ulitDp
	ga5PZ385yBcklLbBDdzbP7L6j9+2LVx6L1X+fkBKTfYdddvjRrB/N+TWWxjoswg7
	qHxn6p6sVG9ejGfiOiOsJQwBveW1lCPgPs7Tgs+sssu59LBpw5256HxmerAeLoTr
	ilRqp5pxUzzbo/k98blqNBAW3IpuTQzM5Ye5rV3IgWkyUj5zwoUPdGvp/kHBUiha
	LUHfEg592gHYY/JB3ctMirC0pI3M5kruCvsk0gHtEqHLZSxg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay73rgyv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 15:50:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29ea258c1d8so44791135ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 07:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765381846; x=1765986646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NulxUS44q4FBpIRfW4IzyqBq6K6Z/xTMYm+Fsi6EhJ0=;
        b=ZQv3Mkdd7OVeVco/q2GjpZ3Q2Z8nm6guM1ri7YAVoqYp+cAr9viRKS/U4VHWQXEnyC
         Ox0XYU219oZWQmZof48/6jIqEVSjlXVtYhB3iPxVbeZijcgD78WoabFOa1oBEoDoThFp
         DcX3hRXcs4PUnV8w+RDJF7aJHNAzDBpXUqrDstaDmybWG5vi3hFu9v+t0aPRc3VkY8Hf
         b2JcbJ2kgZPlKEoenElTs7ZJcm1Gn9QJBtQAErwkFZRu50GM4Ifv8m43nh4bTNMK71Py
         OwjGZOgRze7YjHraqdpm8M1guu/KmxCxkHuxLk+FEQ9vbShlSSoThKLO4L8Lku7u3hRC
         epxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765381846; x=1765986646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NulxUS44q4FBpIRfW4IzyqBq6K6Z/xTMYm+Fsi6EhJ0=;
        b=SgjTXWN0UnerIIsCDayoGje4gazxxyiJvMTVu1xIvPDyAK71jbEWe1M3FlOUfY3lkk
         lCRgkTjnVcq9PkliP/b3ZuLCJ6eHbNQRHxqrLS14rtpCjVQIdNtAWaTavt2w85Yz2RtS
         lx1tWZEjqfyTSEIb+NCDOgaF5xepJ1/7uiyHLlt1+uBu0c7ETuEeFpXzsm2fkYKqsMIO
         UvSSMIjbrtQCEzRJdqhAHH4pjNRu7GJ+/C1daodZuF2A6duCNMsYDFXl+SdgZAOK1d7u
         Bjq/Q69yjTkFrkAV+ewOKwX9585TxRwXiQIEqst17wjw+4eryE4V5i2kx9WCgLeKTV9y
         tjiA==
X-Gm-Message-State: AOJu0YwkVt31C9Mt1Br/844B/IA4A1j1K58YGb7iUg9bXI0s5FIas9os
	6Yv85I+IGoAoB1WCVHrMFeIAhkkwWjatc5DDO+mZz8j3ejZwVHrV1RP2PcXNKezWeC2uOW7nUkg
	I7f5UjS5vYZPDsPadwJsU66lMBIgn5Nnpd4nWAB42JcMU6245xfteFP3kXD4bPf8zdcF0
X-Gm-Gg: AY/fxX6rkcaRgd6e9EFsUvehlPmYKi/9vQIKFmkNYj/ccs1mf41JWkfapuW6bMM//WK
	Hzvq36w3Vx0tL30aYT3ji8Iv1xfp31C5gNmblG0kv7eSL72kshxHUJN7qjGo5oNb2p2kbTedeU9
	osb6HwmnuM4FUM1096utkXbCwiqVTq9EpmxtJ0HoVOpQ+97QQfucNea2AvvTovana3KUAWWSWM5
	AlUrxSr42zEfKEZKoW6jUaz4rW8tJBtTBFvEphpOXpVGDAWy8NwGrgPmHGVPMftL88qquaexbXq
	+Xup47Y6pulwAFHEaHgXsY9YbEzRGUr1bwKmS0rvrDlPSXEXZ1yh4VAbeYvFLEKhobAhgUdKwbv
	zanvVSvvV18GEKdCKPrZw5W7tcB1qB7NhgIZD0itl
X-Received: by 2002:a17:903:2392:b0:27e:ed58:25e5 with SMTP id d9443c01a7336-29ec2336e12mr25888275ad.24.1765381845672;
        Wed, 10 Dec 2025 07:50:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3gH+i/zHIlcdt8+wxcqRZ+TZJ5GPY3sj88E5SWloC3HC6s6uzsDjv2kRl44b/Cx/Ft4XdOw==
X-Received: by 2002:a17:903:2392:b0:27e:ed58:25e5 with SMTP id d9443c01a7336-29ec2336e12mr25887885ad.24.1765381845124;
        Wed, 10 Dec 2025 07:50:45 -0800 (PST)
Received: from hu-rdwivedi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ed93e470fsm7780175ad.41.2025.12.10.07.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 07:50:44 -0800 (PST)
From: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
To: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, ram.dwivedi@oss.qualcomm.com,
        anjana.hari@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 0/3] ufs: ufs-qcom: Add support firmware managed platforms
Date: Wed, 10 Dec 2025 21:20:30 +0530
Message-Id: <20251210155033.229051-1-ram.dwivedi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ga1-vXv67TgT3Sw82WiMpNpbZ5hQ8DKd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDEyOSBTYWx0ZWRfX1t0l14g2JkJZ
 Bu40My8exen5XR5HqG9A67rqt4Mn4yfg63bPTJW8p8w8i02viNfEzLO5qRXd6VlSHjBi51bzhJx
 17Iw2dGLqp3qUPcc3YAwVMjDBE3X54cDbomy26jbhOsV9q4rTmiRmHYXINX0VFomyX2P5fop4jh
 U0GUMvsr9j4vdVI8rSv9Ge83jYI1R2ADMNiWRDthWMu1s2DTZsPmP3TrOcniFYu+VHj3g5AwoJm
 x85sQZDhlIl0+Ye2fPg1WyY3Zp1m5UEe/i8V6frFttRUIHz9Evwo3yCbhdg4MNrHS+pobn6j43G
 wDOfROMNtK3cOgNsQmo4U4vZUYkqMsu4OfQrLs3cZSmKcuCCY6uTkVEMjaEIJXE5fxj6miJmjjq
 RnSk0PAOO88RLsur9BszrHyXKWTs5g==
X-Authority-Analysis: v=2.4 cv=McFhep/f c=1 sm=1 tr=0 ts=693996d6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=fUx3pPj6L392ZWVjOsMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Ga1-vXv67TgT3Sw82WiMpNpbZ5hQ8DKd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100129

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

Ram Kumar Dwivedi (3):
  MAINTAINERS: broaden UFS Qualcomm binding file pattern
  dt-bindings: ufs: Document bindings for SA8255P UFS Host Controller
  ufs: ufs-qcom: Add support for firmware-managed resource abstraction

 .../bindings/ufs/qcom,sa8255p-ufshc.yaml      |  62 +++++++
 MAINTAINERS                                   |   2 +-
 drivers/ufs/host/ufs-qcom.c                   | 161 +++++++++++++++++-
 drivers/ufs/host/ufs-qcom.h                   |   1 +
 4 files changed, 224 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml

-- 
2.34.1


