Return-Path: <linux-arm-msm+bounces-87087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F071CEBC6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 11:21:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1120305969C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 10:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D06931CA50;
	Wed, 31 Dec 2025 10:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gOhFVLaV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c3HS9VbR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62774275AE4
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 10:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767176426; cv=none; b=RFo5ff926jEHNMm8sk3sfiD+I+H/wt3LRJYh+rGQPqQdGqU7Jht1dc6GBETrUidwFI0UAsORtrICvQ5WvXKABcoToawGPaCQPtsBR7WDTEI2adOxD3OPKxcl29rMyFekDz2LKxTnCf90nDwHzSG+82OdbdVyy52JINMyQGoVvQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767176426; c=relaxed/simple;
	bh=+9ZaeYSITjqa9LaWH6LtiAlmb0JwMQ1G1kWe7jUvDrA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AR09N7Gas2tp/6VbjzM1kAQ48hDn5EVuKzShR4teF9JaRxJg1iMO2Nz/y3SuRdiH3h5W1J38UHhzntR8B4Dj7D+GD890WyePJyQDdov5xtBCqcm0ASyw3BHL7lXxFnuM2DGtx5uahB27f5ACDzAs0h12b9qnIqQX5DGHryAgim8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gOhFVLaV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c3HS9VbR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUMpbqe1751746
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 10:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EBm+C9txCrc0JpQP/cSYDwUBJ05oXh+KTPs
	Ja3/CzN0=; b=gOhFVLaV01MCt51zqc1hSSQRV2Eya9gg3BUNQj3TDg5/j7JwRNE
	okza17le6Acn1QJfJXlp/1Kolz8+HK6qYCGMVL6TnGIPudC+L1rRAFONKlKbWP4g
	p3PRyxfz6Tvv9RyodjayzeGxFzkPOhR5XF93cnleq0b0/ioPlJpJeyban17L1eb2
	dz4iBwI5ZiZPsIT+jaO/xww5FAG+8G1ywN9Mo2n9VckP1vV97VUl3nA/Xgvm6LLj
	gvKnsEOG+pjeFXNq4sLf3imkCdowbQ8GCFEQmoL3UJoXZaZOskvJHyXbIaIbHb+7
	WzuuYA5OXg2ClDYUyCY836z29zlDl9EOlcQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0sgv48x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 10:20:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c6e05af3bso23420906a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 02:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767176422; x=1767781222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EBm+C9txCrc0JpQP/cSYDwUBJ05oXh+KTPsJa3/CzN0=;
        b=c3HS9VbRhCFaFk1ZxK053hYdTcI2dtpTtJCrJY62hVeaufumo3kd/wL+ZiKiYvh73X
         uuceaSAwmdpziDrjlbz6Jg7e/jSCQvl2ccEcLu+nwxwNffH9gvIr0bxLXIWfSXJYykbm
         9zWBVyO9d3grTT6MGchTq0aDAxqG2DjSE5/6wI6yiE9NQYe/e6eHN3+5vQ9D024OhyNh
         5NbQjNI7j52oWa/qnjpN00GwP56XfZOiKRt+5PVZzISllhc38+rUTJymOZxDiR6XiD49
         y5ODK8SF3zIualbbEwvlQC+CYMocahGlgHnSDMcSalfWE7kARSueTfDthgsBJhQjLBJk
         cD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767176422; x=1767781222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBm+C9txCrc0JpQP/cSYDwUBJ05oXh+KTPsJa3/CzN0=;
        b=OjyUV8tUzifK5t0/KbrnCAP34qGTRoVo1VPa/mPckLIF/lMmXJ8o41frJRfY1px0AM
         2NXQ82WzzW3wuRpoJ8yv0D7yXTwueDTCDdQddUVnADcn3MJ5e/+MmfnslLYUdB+UqJ0o
         c8USA0KPIHofTHJvIx0irgxZSlvwZtepPjAwdcV5vQfbA+F+n94RgNuXMcHTMAq480e6
         510WwHjYj1U4pUAZgmw5+yWXYlLT9bc0GSrtnrsJ+9bbUpTBUNvPd0xPiR6y7og74IPu
         3rkTY6pDac86ciRXB6Y5S6v4fmgDG4LVJkl56hMkL4SJbcROncMCCauyncOWTM4jYc4N
         0GQw==
X-Gm-Message-State: AOJu0YyvMFtnAxJ42EkuH/Y/s23Zqp0Eh1L7EHn8epsL4+wd1bFWFfCs
	goxbOVvWIEbq6q27WjRFW/qv+hF67TKqQ5VFeqWO3nll4Ppfl2P+3b1wfEEYTlT/ZvACEMijKuX
	7C9sbakuPyqEn2ElNynsD9pjh5cJ5DE0VEfIqNqt3aV7h+uzCb/MgJ4VAsFWmd6nOo2NW
X-Gm-Gg: AY/fxX7z9G/3hWsjTYsYw/gM6r0Tcz7lDa6OQp0eZFFg3UIBiXSQhvVOSxNrCtzaKmc
	WVjIAjJz8TKpc2oJNRDnj2YWtrRkhLuS/xwv/mgJ7GiiKVy5NBLpwu1rrSXyKb0J2uQKmFwnGRd
	cpISwMpqCRxbQGtY9qAYY3nAyFZf5b5xrB9vT3OoKwa/lamomHJ1/X+h0GdS0uYCHT2IlwGt+9U
	FE4YlKsz8D1jf6Z3IQ5Hikts4B7JN78XN052juMssb+qqclj8G61rWa++EkIyZokZLiRkarT+Wk
	PBJsjuAExtKQtOCtWicsrIfWiTQdmBJIXQrG3v6jZNosFvOGn13pXBmDRLYucPd4UmwWa0eQ9lD
	6c3vw7dDXvenKMn7EJ941wqguJ87mtNnk34EvzjZViTx0KrjiX3l+
X-Received: by 2002:a17:90b:5843:b0:32e:528c:60ee with SMTP id 98e67ed59e1d1-34e921c3dc8mr30732587a91.24.1767176422157;
        Wed, 31 Dec 2025 02:20:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBBK2KabkmuNb8Z7SZE+KAlG1z4dXeua00bYwsikaNo04m/NZt3iH73LymmMzPuFxfkb4ELg==
X-Received: by 2002:a17:90b:5843:b0:32e:528c:60ee with SMTP id 98e67ed59e1d1-34e921c3dc8mr30732574a91.24.1767176421701;
        Wed, 31 Dec 2025 02:20:21 -0800 (PST)
Received: from hu-pragalla-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e9223ae29sm32163920a91.16.2025.12.31.02.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 02:20:21 -0800 (PST)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: [PATCH V2 0/4] Add UFS support for x1e80100 SoC
Date: Wed, 31 Dec 2025 15:49:47 +0530
Message-Id: <20251231101951.1026163-1-pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA5MCBTYWx0ZWRfX+XGRd1vCFYoH
 iyzDsMQzMtYGIWW2KBuGwPmUC7n1Pq+eAmf7vYtThmggg9GWV47yxDwkP1WDS2M/Hpacu/gaDqb
 HI12Hpq1kXfIOZmgZ+72EWaFL/lr5JqpXHQFtLAZCexMduqGCvT8EWT6VBTFNjrrRmWVNzI46W5
 hDVvw596NE7g8itrST9MZZjGOg0P6cOhY6lFOqjVijkp37nRo1VD89JEZrwBQoB9Cv0r6tTXi15
 3Y9DkmpJCjyZG8nugyvmrKcmTpeGXN/P4XdRcgf8RhyXUm1cKT4Pwuhv/hE8ezwXyjNI2IhIvlB
 lLE3DVN96UaaQhzErKYHgTU18yqEutUoLZ2mRwimTC4D4nGlAzIqZ2ruPo/u5/UNwUa20g0HvKY
 hIl7e/IoFMqzPqFSxl3fUfc4i09ctX7/OBydsRr0iVhVS0C6eDbKP3hsIu/GJ3YW6BzFTdNh0c4
 HEC0eVXnERT7V8+ZE1g==
X-Proofpoint-GUID: lWbaRDfpOHw-AM5uGkcebhrK-qnVO-J5
X-Proofpoint-ORIG-GUID: lWbaRDfpOHw-AM5uGkcebhrK-qnVO-J5
X-Authority-Analysis: v=2.4 cv=foHRpV4f c=1 sm=1 tr=0 ts=6954f8e7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=IsWZ5-T0EzXF7LRbJecA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310090

Add UFSPHY, UFSHC compatible binding names and UFS devicetree
enablement changes for Qualcomm x1e80100 SoC.

Changes in V2:
- Update all dt-bindings commit messages to explain fallback
  to SM8550 [Krzysztof]
- Pad register addresses to 8-digit hex format [Konrad]
- Place one compatible string per line [Konrad]
- Replace chip codenames with numeric identifiers throughout [Konrad]
- Fix dt_binding_check error in UFSHC dt-bindings [Rob]

- This series is rebased on GCC bindings and driver changes:
  https://lore.kernel.org/lkml/20251230-ufs_symbol_clk-v1-0-47d46b24c087@oss.qualcomm.com/

- This series address issues and gaps noticed on:
  https://lore.kernel.org/linux-devicetree/20250814005904.39173-2-harrison.vanderbyl@gmail.com/
  https://lore.kernel.org/linux-devicetree/p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms/   

- Link to V1:
  https://lore.kernel.org/linux-phy/20251229060642.2807165-1-pradeep.pragallapati@oss.qualcomm.com/

---
Pradeep P V K (4):
  dt-bindings: phy: Add QMP UFS PHY compatible for x1e80100
  scsi: ufs: qcom: dt-bindings: Document UFSHC compatible for x1e80100
  arm64: dts: qcom: hamoa: Add UFS nodes for x1e80100 SoC
  arm64: dts: qcom: hamoa-iot-evk: Enable UFS

 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        |   4 +
 .../bindings/ufs/qcom,sc7180-ufshc.yaml       |  38 +++---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts    |  18 +++
 arch/arm64/boot/dts/qcom/hamoa.dtsi           | 123 +++++++++++++++++-
 4 files changed, 165 insertions(+), 18 deletions(-)

-- 
2.34.1


