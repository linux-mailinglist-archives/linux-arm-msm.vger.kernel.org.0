Return-Path: <linux-arm-msm+bounces-54648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A96A92086
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 16:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF54119E7E88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 14:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27FCF25291D;
	Thu, 17 Apr 2025 14:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLvAoc5I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F59252904
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 14:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901910; cv=none; b=k+2uX+6j71cF2c+6En7FqVI00dtBZ/sUGKW+6m10+WcIgVSPKeM0++xvMQhBYr3ZOezF61RpjgkCSULaBi680Mzk5V1ajQUvWcrbJdwXel9QwNHwlM3ZWwfKIQsY2BZvoEA39Z4z61zNwiX+9ddE65hYmvFdKSCNGizFqpOMLOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901910; c=relaxed/simple;
	bh=pMY/0jIG3lrEg5GZ5KFr6KvJdcNAhAJuMKM0H+1/Kts=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BO/ZJV+9yc/udm7ktg1glhmQ1PYKgQirJe5IDjDIN7nyCcT8dHDOGAUBkY2MAWXicyjkeS6NP63U75REAh042AfOctXnfeyDCNmc0FR4CxZgOdUOzurP8A3+AQJijE2SA/SQuBk4dmbkO09+bVrFNvj3jF9ozKM2Gz2f//t972k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CLvAoc5I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClQIi029005
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 14:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LfeP4sLjU5GUk2YiZ8K2Y7aMNcxds06nnNs
	GpShGCS8=; b=CLvAoc5ILoc9/M3HYws8E9cMTY6YpliwWiJ8W6W8w4D5BQorj8b
	s/BWFxF+3zrH8fST7rAK1F0aBLhCk969X1/GyRBrfP4jFDTKXwg/edLzl15LWHlq
	xXNNPIjidSTL2RgH8WGA+FuitdM4io1Xqc9zQBQ2JN9sNmHL27Lk6pz3wqGQFjl2
	TQXzh3VOq/498IRRxrluclXzxuvbY+zPnHSKdmcu3lsKHIcOKzR6AEiz7zHigcne
	50vLWzhqJhXTWFmpNqTlztBfHXx5nAkHk/qIgZYIzcTv23zKk6bSprWzOO3lBYdb
	4FAtWeUXHiRkO1l/L0mrxvQJu70++ucMbug==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj9f9wy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 14:58:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8ec18a29aso9437286d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 07:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744901905; x=1745506705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LfeP4sLjU5GUk2YiZ8K2Y7aMNcxds06nnNsGpShGCS8=;
        b=tRPw6mHV0JfyAETZDURISmoGqM5wtt7NWADhmFmVc4wxIXRWRE9IOscNbqk5LMuei0
         yaz7NditnXEqh7J1VrhbfGWnXS4S2W9S0I+YO4oX3ahspJjqwSXbwuJ3OnM2fiSARfqR
         WM8HZCHktXGZTDprv7wxn4yw73Ve2cG4ze3wpGvPBgoNd58yZEE6rMkblAw3Tw1RcpFQ
         3Ypdhjzm2dptSKnxm44YCVGg08TFCqwKcUbdaFr6+f5kfb8fNwk7K47ocoXFTqWEK0aW
         +SELXmvLk2ZK61ZrlwmW68Eq6tNMPxoL+iuldvPDu55b263B0weClXDURr/ImAQWIT8R
         yR2Q==
X-Gm-Message-State: AOJu0Yy+AHB0NsPK7icqRGqQ284mbRzNC9hFRisx+976J0haUq6CV2Hh
	KneiR5p4Sl3L+bIu0EkTRLn4on/csf97j/WOdn0TVd2F+Rif/fom2KLL68nUwR666IfAH30qA1T
	Jc0RrKo5FathrSbeTjsFC2HHy6do1oGA9UGSdQo23G2Q+2CPzIH+LaHHFLXYdcCcr
X-Gm-Gg: ASbGncvf5xd6tfyBExxnQCaJzCug42yPI/WEEwRcQKKTFBHoBcYZpeK7HZ+PCD9mNC3
	Ac0OnAEPL/CDrIHvJWd5Ch18IHreCUT+8piY6W+qFBpxCf8N7GK+TZwOVYMHjizbJZ7Mb19DYEe
	CPQAYWEL1U6qrHkrtGog08U+YB2/GUkPjCftKmJ59YVwe8SPoidfE0b1WKEVoisnADeJ8HaMoNx
	4OEURf23sh5rM99b9hE8E66cFLdLTCZgCP+WldjC9/3/dyoJ/ZrIxMMK/GqtPM47IffJhiwGQm6
	JzKPasDpirFVXKSWppGhmGeDIRiAVSiXqWgIZeZ7jAH3JaI=
X-Received: by 2002:ad4:5ec9:0:b0:6ed:1651:e8c1 with SMTP id 6a1803df08f44-6f2b2f2f506mr78612516d6.13.1744901905159;
        Thu, 17 Apr 2025 07:58:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs94tMrUJU6Q62wJ271EI8ckueD3aicioYZneDeaoprC9wGbLMO8noE1UoVIR9qzr6m545Lg==
X-Received: by 2002:ad4:5ec9:0:b0:6ed:1651:e8c1 with SMTP id 6a1803df08f44-6f2b2f2f506mr78612186d6.13.1744901904817;
        Thu, 17 Apr 2025 07:58:24 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:15e4:d866:eb53:4185])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef48e5csm3966166b.148.2025.04.17.07.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:58:24 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 0/6] media: qcom: camss: Add qcm2290 support
Date: Thu, 17 Apr 2025 16:58:13 +0200
Message-Id: <20250417145819.626733-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Hb0Jg_FHxUhEhpvGjxQJNurS5RZpIC8j
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=68011711 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=ZpVVgv6hLUNts_qYB94A:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: Hb0Jg_FHxUhEhpvGjxQJNurS5RZpIC8j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_04,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170112

The Qualcomm QCM2290 SoC camera subsystem features the spectra 340 with:
- 2 x Thin Front End (TFE) - 3x RDI + 1x PIX per TFE
- 2 x CSID
- 2 x CSIPHY
- 2 x TPG

Support for Pix Interface and TPGs is not part of this series.

This series has been tested on Qualcomm robotics RB1 platform (QRB2210) with
the Vision Mezzanine (OV9282 sensor to CSIPHY0):

```
media-ctl -l '"msm_csiphy0":1->"msm_csid0":0[1],"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
media-ctl -V '"ov9282 2-0060":0[fmt:Y8_1X8/640x400 field:none]'
media-ctl -V '"msm_csiphy0":0[fmt:Y8_1X8/640x400 field:none]'
media-ctl -V '"msm_csid0":0[fmt:Y8_1X8/640x400 field:none]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:Y8_1X8/640x400 field:none]'
yavta -B capture-mplane -I --capture=1 --file=image.gray8 -n 1 -f Y8 -s 640x400 /dev/video0
```

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v2:
- Use RDI_NUM instead of RDI_CLIENT for consistency
- Add comment listing bus clients
- Static maps for TFE ifaces/subgroups + Warning on invalid line
- write to write_relaxed for reset function
- Use GENMASK and FIELD_PREP for register bitfields
- Fix coding style: lowercase hex, unexpected line break
- remove inline for reg_update_clear (pointer callback)
- Change avg/peak interconnect bandwidth to match downstream
- Add IDs to camss CSIHYs
- Reorder camss dts node similarly to sm8550
- Fix camss node name with first reg address
- Ue RPM_ACTIVE_TAG for APPS->CNOC

---
Loic Poulain (6):
  media: qcom: camss: Add support for TFE (Spectra 340)
  media: qcom: camss: Add CSID 340 support
  media: qcom: camss: csiphy-3ph: Add CSIPHY 2ph DPHY v2.0.1 init
    sequence
  media: qcom: camss: add support for QCM2290 camss
  media: dt-bindings: media: camss: Add qcom,qcm2290-camss binding
  arm64: dts: qcom: qcm2290: Add CAMSS node

 .../bindings/media/qcom,qcm2290-camss.yaml    | 261 ++++++++++++++
 arch/arm64/boot/dts/qcom/qcm2290.dtsi         | 103 ++++++
 drivers/media/platform/qcom/camss/Makefile    |   2 +
 .../platform/qcom/camss/camss-csid-340.c      | 190 +++++++++++
 .../media/platform/qcom/camss/camss-csid.h    |   1 +
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |  89 +++++
 .../media/platform/qcom/camss/camss-vfe-340.c | 320 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
 drivers/media/platform/qcom/camss/camss.c     | 148 ++++++++
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 11 files changed, 1118 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-340.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-340.c

-- 
2.34.1


