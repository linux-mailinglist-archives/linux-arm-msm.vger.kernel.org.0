Return-Path: <linux-arm-msm+bounces-63992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B23AFC5B5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 10:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E6E27AB550
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 08:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436DF29ACC8;
	Tue,  8 Jul 2025 08:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q1Cfx1hg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83866299AAA
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 08:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963552; cv=none; b=tk1uAu5BeE8vKNmoLdRKcU3RDTcRU/JhPU0IDuRDhFh4W2Fq31omlanTcjRWIhCTHVY3HAaEmulQ0cdYnIpoLmwQ3S/rCqJCVAb3D0LLcpDnMODgQoRKlWyYbuW8+RlwySwzyvB8jtPXEpo9lf+kSKQkB2pl4H5imMtnZwIipXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963552; c=relaxed/simple;
	bh=1YiweJG7PJKgZc7ct5gW5B7eOHZFvQdVgCTtKMPZJ6E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r1feBialjz4Duvrdf1NfxDGMs0tJkiOjQHIFIZcwYx+PuuGTdT/RQ3dEW2x/VsxMd1LDe+Jdf1JCrJoeUxusE/hMoDymo+rZgeYBb6I4veZXQ9v08GXBnawjar4PIOiZR9YjWx27LdaIGZ/OKTU+mqq8fny1KdDP1eD5ScZnPGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q1Cfx1hg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567K4eaB005213
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 08:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hDVPc02Smyom8gWGp9VQVfjqXXqRWspmOX7
	qSqClcY0=; b=Q1Cfx1hgntcw7SVNASlFOFPejuF2PPggOmzz68zcuGbXXckqOAY
	B/98SpuIAnfgHyRKgURrWml+z8mhPfYgxJlC0gDhRbWx8pVHUUfAViHI+KrVmiTz
	AOi6rcvaaHl/p0lUIDaSdbyCTPt5DUw4upPA4MDGGao7J529kRqFfWfZU14A7V4l
	dhLm/Zb7QotJK5ICrkhHZ+cNwyvvAL8tZ01MCl+NBNsll1jM4RAZ/sTQn/rAb+aQ
	hhO5Gnl67FEO0DTB7L4T3xnM9Hys7qdo8cv7gDn5QGQA7ZrfbYq6p2LKF7Ikjk/3
	UvrKNdwgK/SQk77Cs9w1P1bZhvFhAbk7jNw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2b41k1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 08:32:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d444d21b24so664006085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 01:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963548; x=1752568348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hDVPc02Smyom8gWGp9VQVfjqXXqRWspmOX7qSqClcY0=;
        b=Eqb52QOWj7ZHrzUn7C7RYZZWtAnR2Cazc38ew4Mvd3FymaD2Zh7yT2mUIX06FYknrb
         o5BGsPJocpJg0W8ni64TvH/hOko0otXSdVo+beJUR/TfIx5I4wbdNlNP82Y9sQWFQj6b
         18+cawQw/+Cl7mvRZvPTbEuAfNQ2VbvE8xkgejUC82s5gSuxwq23yV/qF+ix51SfVPZ5
         HP48rk4QHk94dTwBNGWwy2SMoeCAzVtb7h2vF5mywiu16VrQBit6RCjV/V3f3oyfT3Ng
         fMn/QtqHTt/C6lbt46QrYhIwS5vtqsJsrv9zOmFm2aCCvEnQZSm8zhbvgqLkf4i2i5QI
         nwlg==
X-Gm-Message-State: AOJu0YyL01W84az3vN7JsCMd4PBkgoDmDBv7obagEJ26hkt9r1ZMCGRU
	mS1Tp7vOwUm4Jih9i6OmL5X2WUpqGHhzsbyJNqO68x0zATym0wxk5aI8n/xBCpNsMIy5taLsEjs
	nQOe7Bysl0cnnQepwjQwI0OaWDG4sECjGyFj2Ml9uphPn1vcojeRL/aCp9bbZwoHmGxCq
X-Gm-Gg: ASbGnctw6ISLIbrTEpfQbyEMPOgM3BvkHrDAuEuduln4w/bkwfTIQgwv7HlQvDQjGbd
	BrgSmlDuZ/P5oHTV2RYLOJDFFrMuc/ijAFIVAhsO/u6N+a4TTL03Frh7N/iCYFGrLJdTGNSvtiy
	wFTbgKMgwda1m4TQK4njBKoEI+vkqj0Djk2xfrXlPueG4McQiiAgmbJ2BROOVxEHX0QcdB2xPA9
	4Exl1q/MDlUiOHq+/fqXLE6FIOoMvr1eYv/gA29zd9Hu62ywm2okAZP4rScy2kaYuhnykOmyAOt
	cf1togoIAJ4+43MgvpZkZO2TtJ6tc5fa2HNTZUCNaecy4m8b9RR4vENuTw==
X-Received: by 2002:a05:620a:1988:b0:7d6:f801:ed52 with SMTP id af79cd13be357-7da016a99b0mr396936785a.2.1751963548188;
        Tue, 08 Jul 2025 01:32:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXD9Pllxg6KGYJANDZeW4ePM0iPt4DqJifc9RKLUtfnMpxdb+VIeT4mznPEqnN6ckwJLhUww==
X-Received: by 2002:a05:620a:1988:b0:7d6:f801:ed52 with SMTP id af79cd13be357-7da016a99b0mr396931885a.2.1751963547656;
        Tue, 08 Jul 2025 01:32:27 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:953b:906f:73bc:cc41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0959sm12315812f8f.27.2025.07.08.01.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 01:32:27 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v6 0/6] media: qcom: camss: Add qcm2290 support
Date: Tue,  8 Jul 2025 10:32:16 +0200
Message-Id: <20250708083222.1020-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA2OCBTYWx0ZWRfX6lqLkY0oz/qr
 /3288xoiXbll3favA8zJn+1lSRMDRPsglaUK0mN5oNAGsPQLQpzBqEM2/y/Q4zXvSwmAJRjNI8A
 FUU3aXWkNkFmb/DL8NF7acmgnm6nZCHx2C0gW+lbhPR7FaZYFpYo7qIXzSLYpi9SFv7mmanuLp9
 OfNYpZyudtQECaEaLbNYnAfLKLSCbOaB+rccGRX863eseHbxHVGnzVnrYZ/skwweMU4YDC437dF
 w1DzFH967R3t/CRp56txDRFv92I+SNvdlrVyDrG0YB6wejmxdy1MAgKx39++ee3W0zHZs36sdQM
 OcCF00To+JQLKfnaabOY8Poc3Zg2JOVHwzmqsurO1rG2psqVxA+VC8bpmkfvFQnXOyCnLs2IObT
 B+f7suhqi1N83OLnks8HfC8Ye3KSo3I8aa4SNDoBvFtAmpCvhIWMpfLYhot8uQEkoGFDjHLw
X-Proofpoint-ORIG-GUID: O13p741TdA8hNA9QpegV7WjzrX3jHJtB
X-Proofpoint-GUID: O13p741TdA8hNA9QpegV7WjzrX3jHJtB
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686cd79d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=75QQF6Qy0Hqb6vHseJMA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_02,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080068

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
Changes in v6:
- dts/bindings: Move the main top register first

Changes in v5:
- Use regular bindings for csiphy regulators (vdd-csiphy-...)

Changes in v4:
- Fix dt-bindings patch subject (remove redundant media prefix)

Changes in v3:
- Be more strict with writel/relaxed usage
- Add more info about CSIPHY configuration
- dts/bindings: alphabetical order for reg/clock/irq
- dts/bindings: Use patternProperties for ports
- dts/bindings: tpgX => csitpgX
- dts/bindings: voltage in vdda rail names
- dts/bindings: consistent hex notation for register addresses

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

*** BLURB HERE ***

Loic Poulain (6):
  media: qcom: camss: Add support for TFE (Spectra 340)
  media: qcom: camss: Add CSID 340 support
  media: qcom: camss: csiphy-3ph: Add CSIPHY 2ph DPHY v2.0.1 init
    sequence
  media: qcom: camss: add support for QCM2290 camss
  media: dt-bindings: Add qcom,qcm2290-camss
  arm64: dts: qcom: qcm2290: Add CAMSS node

 .../bindings/media/qcom,qcm2290-camss.yaml    | 243 +++++++++++++
 arch/arm64/boot/dts/qcom/qcm2290.dtsi         | 103 ++++++
 drivers/media/platform/qcom/camss/Makefile    |   2 +
 .../platform/qcom/camss/camss-csid-340.c      | 189 +++++++++++
 .../media/platform/qcom/camss/camss-csid.h    |   1 +
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |  89 +++++
 .../media/platform/qcom/camss/camss-vfe-340.c | 319 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
 drivers/media/platform/qcom/camss/camss.c     | 148 ++++++++
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 11 files changed, 1098 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-340.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-340.c

-- 
2.34.1


