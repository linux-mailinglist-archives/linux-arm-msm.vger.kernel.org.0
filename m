Return-Path: <linux-arm-msm+bounces-62075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C18AE418A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 15:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F38317386C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 13:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17592248862;
	Mon, 23 Jun 2025 13:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QchBsOF5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D70C244698
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 13:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750683870; cv=none; b=d6pQCHtuaMn7HroVGOj+wk0AnU4VMeYhdIJpjFRJnJNEITxpkIBDRtMzjZFzpEtIqgHKFBTIdwWpakRZ6tXcseEVjgwmnWarxhyHx8kMx+EDiXQYmZoPN2DxrKSQ2rjuqRX2IjM0XSg0u+7OzPEXSazPKFuMla+vnlzrr27Zq1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750683870; c=relaxed/simple;
	bh=4c5QAaF8FWCXjYjf2OT/eBU9e4Zc4tJ8Fgb0BtDON2M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=dNR+5npQGe+YkriizPVnZYAC5xY4QHkBuVwCmemfBJoK+5iaPlW3JoQy/q8xx+tAFlQSYlPaUK0PAkZPGEIkxsb07E7KXhjisOHCMjWLBosrA8vXGOxf1Be2A3GdSBzAxW3r1AhrB1Xz4OatzEQuaS5dIEqwhemrUhQoAP0TFyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QchBsOF5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9TPjM020843
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 13:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CHDw0gUyfP8fWV39O/SeiV
	52mAutq3BiJxP93zChCWk=; b=QchBsOF5r0wseOD4AyhzgxUE6G/cpX9nguWUSh
	SXj9xSikq8ITFxDZEHlNYUb/nHzNm7Lx9703bFWkeYB4S9zLUqmnK1gjLACTH99d
	57s8YmI74xbcWXlNZPODLDebf1UB/nKivvzrMatFpm1VV3Lax+yuNmdzOVY7g39G
	B+dw7Uk/zS2BIkn/V0Pay5WCrGP09SgWwwGP4tqqJBzGnGOS/WI3RsB7BZT2jSHG
	Fv9CyafuJCFvdyAfYiSUw4kULohgSNbG7nDlPa643iGPnip1obGfTW5S50gGYX/3
	1n7keBgV8MDxqO9LIuFR7kgOMrYRZgxltdnI7f6+Z0I1+pIQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b3rjp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 13:04:27 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-73bce82b13eso522453b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 06:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750683866; x=1751288666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHDw0gUyfP8fWV39O/SeiV52mAutq3BiJxP93zChCWk=;
        b=H9CajN9WtT2gnzK6FbG8UzXne4ib+mPvMcfSZ3xRlREqfaJ6B7aYWYhIS9zXRarxY9
         aQHPGRXMZsga5he2bBSaqTeTSTPa1Sz2EoKrWp1GNRKFEYXNlZeWG7EAUFC/FA5xHe7N
         LwBpErlTdFGNEGmV3j36/LOanFbqFBU/tzh8Y7/EI0n0IcNTR1B5yVKa0r8vXAI45J28
         cfHBkELJs7XndiakTxDiRQA8rczWcgYEuh5e1gPaB5j07l3aa89kpqovb82bkfgeHqmj
         yffg2S3IdY+pzbMOcxbR993uijVvMBxx2J4zGdF2MoOQuUwpzT0JDMSbJS9SKIhb73YW
         3gUQ==
X-Gm-Message-State: AOJu0YwNxFJgVGPuxGBPpOpH4hg3DuPA26zVQD6w4hOI35k+bu4k4obS
	ccUwp3SfTQgR8RuDD0K3Z+A+bTc0lWnRiMBF54t3VkidHPW10Bp+ab7ZwzSbQSjP6sLsT+02OWl
	jvQmQ9iutBy2IikghWdDaiZhy8qdjACC1rPr8VY037LDKMTOEHryKKD+72uE/2muKb6FcaAKsPM
	iv
X-Gm-Gg: ASbGncshBHoOvDlF13bHBvWI9+WmJaC4x6GTaMx9VOJ+SL9Jowgzve9Ydssp7fOIQmr
	kZl7miFusUQBp8csc5ZibvA/ogis7t35Gt+meXW5yC1Uif/SRhffUnz9fUftYY916gaUtyEFrNd
	hXTJ7i9p2ztasGn2k8r/BB0ULvIBlPGupGbJTjokXrKxmG6sSr6lXNy3hxThN3y0TL2YzRckcf1
	p57HZCpbnarq2I+mmPUoopiD9rtG965CTlDMWFb7nVDMajBJ2rO+3AKR9UwoO13W5+QDsTP/FTe
	Ty2xpGQNuFS5HMyoPMh/NX+OdeIptCiPH33eKeKwEwtvNvog3YQWcg==
X-Received: by 2002:a05:6a20:3c8e:b0:1f3:478d:f3b4 with SMTP id adf61e73a8af0-2202701728dmr6994341637.10.1750683866432;
        Mon, 23 Jun 2025 06:04:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWgVfAMuttAUlg7WI6XMGUkdKfM0WSYZDqh+gGj6Oz13qwWDpAB34ICIwSzWnzY9Vzvtgr9A==
X-Received: by 2002:a05:6a20:3c8e:b0:1f3:478d:f3b4 with SMTP id adf61e73a8af0-2202701728dmr6994324637.10.1750683866017;
        Mon, 23 Jun 2025 06:04:26 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46b8b2sm8713437b3a.16.2025.06.23.06.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:04:25 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        umang.chheda@oss.qualcomm.com
Subject: [PATCH 0/2] Add support for IQ-8275-evk board
Date: Mon, 23 Jun 2025 18:34:18 +0530
Message-Id: <20250623130420.3981916-1-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA3OCBTYWx0ZWRfX7PE9Wy9T8em9
 OKsoceRLgHaLKXyfYjcdW3HOe2ZdrUADz5k5cWefKe+XwGEqhggk1U9JEhuu/wshpb7gL3WmDTP
 zLd6fWnB49I2KW3idFVgzqV5QkIxZcl1TXVCU3k0KKjoO13TurFQ/SEY2QLFogH2cx0a0wZd0jU
 JqU69YEiIG36b3PtUU3qI5/YkdZ26XtETm3aO59rOitroA1GJe0RCOEt8zKQj/uU+HDuurbXuZm
 +6yyCj+gk0OzU/4tB0e6JxcW0alP0IknRoq0SyI9PNNPbsAmsmGrzbiYZqAU9zM9b3jyBiU3gyk
 wjxfaRGpeqBw2lRMQFHXrM6hsy38fqGlV0wKZC3Iv8tEbp1bTozRdbE3i+SCX12K3xNvtui/i3x
 ZufoHugNVhRsRQOdS3jyWnAeeQ797vsuHrOksDau7KvfVnDSUP0eOLZXZWjzUvcDVKzXqYO8
X-Proofpoint-ORIG-GUID: ha-Mrg0uYzBb5kXe6lwynFMsg7epY0o4
X-Proofpoint-GUID: ha-Mrg0uYzBb5kXe6lwynFMsg7epY0o4
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685950db cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=xyu6GANZigqoUC4sCMYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1011 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230078

This series:

Add support for Qualcomm's IQ-8275-evk board using QCS8275 SOC.

QCS8275 is another SoC under IQ8 series of SoCs. Unlike QCS8300
which has safety features, it doesn't have safety features which
affects thermal management.

IQ8 EVK board is a single board computer (SBC) that supports various
industrial applications, including factory automation, industrial
robots, drones, edge AI boxes, machine vision, autonomous mobile
robots (AMRs), and industrial gateways.

Below are detailed informations on IQ-8275-evk HW:
------------------------------------------------------
QCS8275 SOM is stacked on top of IQ-8275-evk board.
On top of IQ-8275-evk board additional mezzanine boards can be stacked
in future.
IQ-8275-evk is single board supporting these peripherals:
  - Storage: 1 × 128 GB UFS, micro-SD card, EEPROMs for MACs,
    eMMC on mezzanine card
  - Audio/Video, Camera & Display ports
  - Connectivity: RJ45 2.5GbE, WLAN/Bluetooth, CAN/CAN-FD
  - PCIe ports
  - USB & UART ports

Currently basic features like DSPs, UFS and 'boot to shell' via
uart console are enabled.

Umang Chheda (2):
  dt-bindings: arm: qcom: Add bindings for IQ8 EVK board
  arm64: dts: qcom: Add support for QCS8275 IQ8 EVK

 .../devicetree/bindings/arm/qcom.yaml         |   7 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/qcs8275-iq-8275-evk.dts     | 241 ++++++++++++++++++
 3 files changed, 249 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8275-iq-8275-evk.dts

-- 
2.25.1


