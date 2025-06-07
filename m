Return-Path: <linux-arm-msm+bounces-60512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8F2AD0DD4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 16:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AFEE3A2EBD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 14:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF53BEEDE;
	Sat,  7 Jun 2025 14:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FL8FIhGi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64528155C83
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jun 2025 14:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749305746; cv=none; b=gph/SX0eNqZZk1seRN1yr9v/dajVgH7V+/MI5p6C6GLsMZRihdwn5SwtdpLsXMiMYyO/ggnQVqdh7Uc4RvogFRvLZxP6WoO+8Cc1ZjDwrdpdP9HmsD9To6NebuR4SbM/pNrk7HX+oMVxbNzjIr6x8M9THo2MWyISa6jvcztRdwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749305746; c=relaxed/simple;
	bh=1R/4cAeIAzLJOWp/GuFrSGG6zEJyy/eVJqkUetChkPE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JY2I9EAyj7RTsuFzeBSvHN9iAE/lxXIti6cafbDo97Bf//dSN4G0Zl+ptRpIS140jVCN2XKeuOEJU9RDW3HwD4FGeZUHiYtuOpDPObqiT2VJR8YJsIJqCKuHytoZQiGwtJEI8kvfEn+1ru3GKiDOXTYynmaTgPIhkeri4Lj6J/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FL8FIhGi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557AnRsJ016807
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Jun 2025 14:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jQEDDMTmKsjlbrJ1T/mYsq
	l9DaM6HWHTltiou3XAwfQ=; b=FL8FIhGiYfRPpEb5zkLb6X5evl8aRpePWsUbgj
	woUE1/DwDvnrHExHMp86Y2NnGAGH8/6eHoXVwl16OL2JwcBbDMgPU+BeKCwWRkEX
	64IVk1M3Ymg5qahJWQOyE049C7C5MfZzR26IjVHAgH4DtOE8wXEoA5Il4rsHSqqG
	Y5HfoXWT4TSlOhEICgLJmvhmdl0qxpl8oWL9ND0t8lGt8H8nWaGhkJA2wk3qgPrE
	FD3O9AfKYzcbbK2+/46BQwXO/yiQr5e6FjlpJsbcZH/vOktcLBEcH/729bn7MLpj
	ZCIirVPQgI7MuWu0Fuk8GMWZF8V/fE3hPnGyhjop79OUPT+w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9grd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 14:15:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2358ddcb1e3so44068035ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 07:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749305743; x=1749910543;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jQEDDMTmKsjlbrJ1T/mYsql9DaM6HWHTltiou3XAwfQ=;
        b=cVIU0lj84e1s/2C5OBGFU36rtmKJaKvsPQN4BYieWfx2Y+ojt7bImpTI0f/gN4uYsr
         iLKZjE4UM7/WfqXJs9gTkVG5U39BQDyygsaxCDUWhmt9hgYeqqzMRZT0EaenRvaB6Nfa
         BFkzypTgQqBKw12LaGn3G8iXxgG903J+4xB51sRUKicpXt5dwN+ai8NgEUo73lVvxuOA
         pO4VwymGbAbIQAY59YfE34Ck1duNK5P9jGpFNhODAib4UcQFrTrRW7sm2ijGsruyoMxa
         B3Kk27KmLha/IVppCddRSGf2n9Mc+631VPFVO2vAL/uUgF5a4K6ST+labArNOm7tVpPf
         U3ag==
X-Forwarded-Encrypted: i=1; AJvYcCXFsj288/X7cjwACrYOPmpZ4fb6chXsfpl81HAqKFfrPxvMmNQXWEMSHENDMyefdbFuh9zTRXO8TDOYl+yM@vger.kernel.org
X-Gm-Message-State: AOJu0YwwiuSRgHCwxH/5Cc3vowwLHkemry80LrjZFNngK6Jys/sA2CyL
	6ejytMf1JSvKMMGVvJVZM9Hg6kv0hmIxxA+sxLsSaFVW2mAHC5UZj1/Qjte/ZbJUOrBfMW/cYQ1
	/hTjzqxeIA1kBMeGZt9gRtpnF6OFiBjtUO6ZDSbECgWIpJDVgSBhMIEOfVsVC8qnE+h2i
X-Gm-Gg: ASbGncuJWS7X4bn3qA5vzAWgbv3QfAfqdDAqv8lWVHluevueGc7L7F6qichyEeG+dl8
	QDnP2MmXqiCO9b8Qar5bCs4OtJdQZhFCZJ7djfVEUg8FnTDs5rAVb5qIxTcsZQ6pFHr+bfmDAz3
	jgL9tm/vIwm0M7VYiq/oWVK9jROFhtdXHW6iHQo36Mh3EHfqWYesLbA+99LYqXA4m1ZTzVfdshZ
	e3PYMFf0bRvahSHSy4SMkTimK9O57UPDhy+rcIJacdeyQ7SrKtRENpHA+F08xZO3OakTPqctTT0
	B79EE988m171dFIZT6aHxQ==
X-Received: by 2002:a17:902:e750:b0:235:f4f7:a654 with SMTP id d9443c01a7336-23601d09641mr109277365ad.22.1749305742556;
        Sat, 07 Jun 2025 07:15:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjF9YeOEhWSWfxr+m+2RrgoG06THK+k2+nMjTup1J4LstKl/tmEjXBkTr4o+5QwdlWwirKMQ==
X-Received: by 2002:a17:902:e750:b0:235:f4f7:a654 with SMTP id d9443c01a7336-23601d09641mr109276915ad.22.1749305742176;
        Sat, 07 Jun 2025 07:15:42 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603405732sm27500435ad.155.2025.06.07.07.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:15:41 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 0/3] Support for Adreno X1-45 GPU
Date: Sat, 07 Jun 2025 19:44:58 +0530
Message-Id: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGNJRGgC/y3MQQrDIBCF4avIrDugNg00VylZTHXSziKaqi1Cy
 N0jSZf/g/etkDkJZxjUCol/kiWGFuaiwL0pvBjFtwar7U33+orVLEg+cYhozd2TnXznqIN2WBJ
 PUg/sMZ6d+PNtZjlHeFJmdHGepQwqcC34d3sYt20HBKPUqo0AAAA=
X-Change-ID: 20250603-x1p-adreno-219da2fd4ca4
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749305735; l=1043;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=1R/4cAeIAzLJOWp/GuFrSGG6zEJyy/eVJqkUetChkPE=;
 b=T5B1TBD6n1ZXjWmBzYGz79OW1hjAwODNgkAjFeCeljEAqh+W/4n6lU8z1zkK0ykWF3R7mJUA7
 8yVMyFfn9g6BOOwS52MkZTyflD73udKJg7pyStIQ/5hNiAqyx8r065a
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: -6qPKg2TyjPMI9UjWi6UtBjo53tlVN0D
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=6844498f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=vb8sKYNj6oKrwasmUUsA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: -6qPKg2TyjPMI9UjWi6UtBjo53tlVN0D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwMCBTYWx0ZWRfXwYCGGKsgJPtN
 325A6htcFJZ6ENXX+pNV6vANBZgQNsccw38n7Ty6juH5byX5Z6cv+0Ch2UINR29mcAWxvF7GUro
 OsXo8/rzwd4laLLf/YrOjICt4Q1H6OmGoH2YeidO+CYJ/Knyn0SAab51nEfp5mmkAYyo62BKVLw
 ZFOJuEHlbuDQcr/pEoSz5caaZxvjBS8N4s8LtdHNiNl/embccFlwgA3S2Nl9GzWhqt1MK87QbL0
 FSnbQ2R+D+6gCRQ9qr98ytqAtWvxo4sdmQtkL3WkOu45cIl7ntoojh3VJb/967X9XEziuNba8XX
 5XabIEuGVPBh/1hO777f+0d9YXjsohu8t+Esz5bxRpZvDI9FWzGk40j0uMHXfQY5rh1dvZNLB83
 V3DvLnB5fuJaY01KOK3lMtbo4ZZpPXJx0xVL2cJts2hunzSDfOtHRttUb6+DGCZzjlpMvcA7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=534 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070100

Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
version). X1-45 is a smaller version of X1-85 with lower core count and
smaller memories. From UMD perspective, this is similar to "FD735"
present in Mesa.

Tested Glmark & Vkmark on Debian Gnome desktop.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Akhil P Oommen (3):
      arm64: defconfig: Enable X1P42100_GPUCC driver
      drm/msm/adreno: Add Adreno X1-45 support
      arm64: dts: qcom: Add GPU support to X1P42100 SoC

 arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
 arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 121 +++++++++++++++++++++++++++++-
 arch/arm64/configs/defconfig              |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  38 ++++++++++
 5 files changed, 170 insertions(+), 1 deletion(-)
---
base-commit: b3bded85d838336326ce78e394e7818445e11f20
change-id: 20250603-x1p-adreno-219da2fd4ca4

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


