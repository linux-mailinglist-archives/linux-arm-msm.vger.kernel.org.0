Return-Path: <linux-arm-msm+bounces-87693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D08ECF89D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 14:53:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 599C9306645A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 13:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0A5334C06;
	Tue,  6 Jan 2026 13:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k2F6q1I8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ChhG3BmU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA8C333421
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 13:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767706825; cv=none; b=fXjudfPWCKVvCyaA8xnpwyOyYHdkvBRc4sdD9pXk/XJSFFIgMmlFXXyrnu77Q0rMVRjPNf7qoTULdSr/kyn1t8CcE0Dr+xJv/Tv9D/CdCDLwa421NLZuLCZw8+eMpc3k4DnkOMn8Q2n91w96Xd7SoQzEUjCkwy1hCGaRZUd4V1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767706825; c=relaxed/simple;
	bh=Z114AqKhZ7fyxmsm+pgxG1OQSMpnGQ+86ux2stbynqY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Hr7ovIfVqLsdZ4yCKiwVU+5NEnX1s59EguHcB3zn+3QIzby44T+633NpC5itdywA3bGkMQCvnUB6fTlcvIHjSm/RZ3LLWcNV6NRe7JJqS1cMyDhuWPfB7OuxnQZ/YMDccT7hboaTf8cWmy1YmZBV1mcUvBNC1O9D7Kf0XX+hQ9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k2F6q1I8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ChhG3BmU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606BfPAa308035
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 13:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZShKc1ZIfNAGy8feaknDOp
	tduLJ8vcLdIOJLoEhWH0Y=; b=k2F6q1I8meLToAkLx+XhoN0Ec5EnsY50hBUKuR
	/EWUu/l0kqBKUUqaUkXsqbN14uqyZmLb0jlTAIQd5kRspLhgjqqdqKL6mstQkFkn
	Tkw9omYY4GcbSHZ4GCCU8i2CIsk28Fb5OFqC4e123NhLPQrWrfbjI0D9dxu11Wt0
	noi6cwASIdGXIdMILETya16iVg9IpYKiW2Kmmn7lBu5ccLg0MOJmPU3Xq2tHzmC7
	07KTPoHpJTDKMn5zd/AbHRgUb3V6x54AyOqI96bjDWg2XVtimQCTjXh1w9MXOra4
	fcGZJvIj4EGvn814Tx91dY0+RQNKANnfwtkBx+Edw7/PNbgA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh1r6gagr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 13:40:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0c495fc7aso13732315ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 05:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767706821; x=1768311621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZShKc1ZIfNAGy8feaknDOptduLJ8vcLdIOJLoEhWH0Y=;
        b=ChhG3BmU46zqOVxhue9dBVX3Qbz4s+Vn+DionnYD3lFQZ7434LZPyHAuzsFAcvS6k0
         fbU/ij1UgsTFYa4hBjNfyWcQduI2SMYz0/Xv9xife3uDCfsDHC/Umos/5ltYqQzBbXz5
         hgLpUdbQo0uzumzI3LlhMjnUgjFIHNCP0308UaXdkiyBRE9P/Fb7/G3IpfQdEO4eL9A+
         IT7eyR/EJjvrInpNdFk/WZ8wJxsrpDyOR03F9HaipiVBQRCTUDGPbTqFyWg2Vf0o8avu
         1HVbH/710neAEpBeUd339aKuF5zK1HzZm0gzUmr8FaLcAz2nGlewdAjAZMIpP9eH7Q/l
         mU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767706821; x=1768311621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZShKc1ZIfNAGy8feaknDOptduLJ8vcLdIOJLoEhWH0Y=;
        b=gtlZ/tEOHuBN0GUCYl2cj91Xod1rIlDE95esa5+QmNGOECResSO8lJ5YPzqAh/yIB0
         c2dogDMnyBggJM4D9Q2wkPlqQF2u+FV9Lv7IGSrtcdu5vn2/+soCHa4+Af3U5Etw52pA
         VKNAiPfzOaNbY6ERThhfrA8emTiuwp6/Fk0081soCXaSiv5vGhEXDn25v8nLzXwcRuwq
         G83mkxclkizAKwT1zTrGLpUPg69opabTLeSLmuIGkH54q9ydqZqBwq5rDu1oCCn431dc
         3jlC5eryfaNSfCERjz3yxEPiTZIvrwkq8+Rt6zvztaGqzs9naEG6Z068E+PNbHgfcW+3
         ak6g==
X-Gm-Message-State: AOJu0YyrZYthZ5g8M9a+26MwCgA3KwoaRlK2E4n4/Oa44pIg+2ACo0L+
	SnjUTx4OtJnPLP64fnQjCyG7ndYqtbl90IbURYcicg/YEJr5EKthR59cG375muxPrl8H2lAblxM
	2Dlw4JLHrdvH3sbGrPj97aG0/s35e4O4m7r8CAndZpRHcl14TbvQhFtHRsj2PUy8DLOcy
X-Gm-Gg: AY/fxX6PZ6DTypePua4SCQjDl3Vka71UC8EEydIOYuRaN1B3KK/L5e7n38js3S4wGCJ
	qum6eBHAoqIHTq2/mMJcsC37edCGjgkCt/iIgigH63f86GdZ1l/N6dqrbz9OQbssKj0PE6EDO/u
	fGa94m9lDcXjnYQb208eIQXpTND5CedeW3G2Z+ZokY9hamCS3wH6hsC8yi2/QgxpJt8cnmz3tHN
	JrLTSl2smhScZA3g5U0ek8jQoe246ZEY4kvd501LouCw3N/g+3KEyFBULOn7EPwsbHqJrA+p5C6
	SuxGaUmE26DgKbfAxM6XMSiFQnzxVy141RieMrUGeT5+tHP3gUdx3ma5Ej54OnQFiZK7yKfZKW7
	4lywVpap0R2yo5UonozPtkrSSQiBm0u3DXl19Mx9y
X-Received: by 2002:a17:902:ce8b:b0:295:9627:8cbd with SMTP id d9443c01a7336-2a3e2cfcdccmr28461225ad.33.1767706820943;
        Tue, 06 Jan 2026 05:40:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH20KerUkmE9EOO35y3hQiUE2qyD6/1P4ZPvZ8lSCXKRejHb10L/WCgPIFcRtjSCySynamsBQ==
X-Received: by 2002:a17:902:ce8b:b0:295:9627:8cbd with SMTP id d9443c01a7336-2a3e2cfcdccmr28460865ad.33.1767706820421;
        Tue, 06 Jan 2026 05:40:20 -0800 (PST)
Received: from hu-rdwivedi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc7856sm24112515ad.68.2026.01.06.05.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 05:40:19 -0800 (PST)
From: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
To: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, ram.dwivedi@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V4 0/4] ufs: ufs-qcom: Add support firmware managed platforms
Date: Tue,  6 Jan 2026 19:10:04 +0530
Message-Id: <20260106134008.1969090-1-ram.dwivedi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HwkqnsjjX6iLAX5xTcPLT82UF0nIhqFM
X-Proofpoint-ORIG-GUID: HwkqnsjjX6iLAX5xTcPLT82UF0nIhqFM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDExOCBTYWx0ZWRfX1g7/1iDnMynC
 G1p3lIpRUusAyqIEUTr1tUYi+1+nL4xVstRycycvySB6/+62nzxVhMh/fnaXFUgMN0En8MqcFCh
 43g02ZWbZTK5p2rAZ/+31NigviEFlYThPSUtB0b+DPeGUcEpgX9zg97aT39Ej4sJIShgKxoiUp7
 7XxCmJ4KAqN0SwAAa/0XeYRcvu2I1ydE1p8YB/oWVcjixu2R1h2/jZ2nkwmuPAn3jFZtAzG5B3L
 gquH6ZoDWeNK7yYZC3bZWgz/sDqRbvJdCwa2qnMDMePX2pIr02/lXx9QpL6sDBLBiPtY6O9+v4G
 tgRieAytNTxoMs5axBQxWZZSB8bY2QcKycMuFPTrKzUe0rx8gQta95fXIxy+QWMyrU62IOAfUdX
 i6spFP9+nhtzuOAMhwNhqNtswiKCH98qu47JaERMhTz1ksgWT4p4zDyWuyQWKTbRUZBAfB/Ivcf
 eiSCXcEPtRuE25dkzHw==
X-Authority-Analysis: v=2.4 cv=Ctuys34D c=1 sm=1 tr=0 ts=695d10c6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Nxr8sekpfmpq4ZlREHgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060118

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

Changes from V3
1. Removed address-cells and size-cells from example DT in
   qcom,sa8255p-ufshc.yaml.

Ram Kumar Dwivedi (4):
  MAINTAINERS: broaden UFS Qualcomm binding file pattern
  dt-bindings: ufs: Document bindings for SA8255P UFS Host Controller
  scsi: ufs: core Enforce minimum pm level for sysfs configuration
  ufs: ufs-qcom: Add support for firmware-managed resource abstraction

 .../bindings/ufs/qcom,sa8255p-ufshc.yaml      |  56 ++++++
 MAINTAINERS                                   |   2 +-
 drivers/ufs/core/ufs-sysfs.c                  |   2 +-
 drivers/ufs/host/ufs-qcom.c                   | 164 +++++++++++++++++-
 drivers/ufs/host/ufs-qcom.h                   |   1 +
 include/ufs/ufshcd.h                          |   1 +
 6 files changed, 223 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml

-- 
2.34.1


