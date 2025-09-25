Return-Path: <linux-arm-msm+bounces-74838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B763B9CED5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3912327E5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E8F2D8779;
	Thu, 25 Sep 2025 00:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mw1Y/hgf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A51C2D8364
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758761556; cv=none; b=M4cxOpfBa1/7eN5NCx59DWcww9HkS9ZQaNROB+W4BA+Aob3Xqu+YKMTqEYVW+JUwBdU4ooWmxJEdF0c7BjSt/dX/nFffTov9e5su6YTU3BjbFLIfona0euy8akbu8jIm2FRNMgOE+S8nUJozMOINPrxnpW7HQ6R53FARKz6ycAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758761556; c=relaxed/simple;
	bh=JO369MGgGMk171xFRwjVqeRFJxDWky0ek+7VCvbF/so=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jKFO55DA9Ys3/SH7gBm80FnjO4tWH1aotVlK0pS7KCd2jIbnk34wempwt313nvHMGEwNzpCAfNP+wrU7/Sb7zJETg4HdjtYoKzwKbWhBGYDf3/RYpfJTr7DGue4TwvsJugwK7SNjTKppSmbwuZvr5uesd0o+Zn6ASj7Y962Ibww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mw1Y/hgf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONqWgj023856
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nzXyVD9qAsVJZyPhyB0idDDfhpNBSjuyVh5
	MWcnszg0=; b=Mw1Y/hgfaRAUkNXuOLfG7N7fIOCYu0rN60W2g9HeVeH5DOjqemO
	vIVohzMTSOktedDH3VYOOiyYQ+Kx1CSK4aa1BFd4DCXfj7Qn4n0gMyQrep73EYmm
	+faT+2rAFgABGGk97TaWprDY4217dPvwAvYIR/qAnlV4dNd3Oec4ZU6PmhGYXa3e
	sMDGE2AabTpWyb1P3L3MS2le6rg9Q0CaIa31V+kc2rQOD0APEGJuBZW9iFusTzXF
	IacOhwmncFpauac6FoCCvnD4xApAc4LNaiSK4mcyt91DdJPEYj5U6Fx59zVQDeCN
	wrOAjeBqsyf122XE1hPWCo0OIPcmFk2NZng==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0d81c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:52:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24457ef983fso7480675ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758761553; x=1759366353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nzXyVD9qAsVJZyPhyB0idDDfhpNBSjuyVh5MWcnszg0=;
        b=LYzMw2gcCkBO6PK5PnJHu1rUgo8g0QbuPtLQicQ+57Pd6VvmYVLW0AuSuvsnCYiN/Z
         2esQGWR2A+J90n+bmflNWWhSfBRPZrYcA6XvyZbgshKeSztxdlmLEPASW4qrIIFRtPdw
         v1MSEZFVsx3AgPpG/F5x3dBSR/Pir6yajh8WsRr8kNwJFW94Vgi5dxnsJlXAcprxtm/G
         kf+5PExfj9PiRt5MqQHyoBd9QrMTsnHW9xaKQLuNGk9snmpoEWQR6RMwy/6bT5ygo+ar
         HF2nt/FgvCnYlMg7RBjTNdNLMdJt5bnv7/GzoLvkef8PgpPu4YzO0YzjUrzS69SNSeOa
         q9Ew==
X-Gm-Message-State: AOJu0Yzopr/f9fmSH0NQc1gGjEPK1lNHAbAW3ypj8k0aQFxwRZnr2bF1
	kfqzSw0AMMsMHij/CrUU3GD9ZCqLNwEBfpMuw/SyGuMUa0y2naW5DNSp7hDAP0wcowfR1s3exnt
	cMGF10OBXmSGOYqROeFFg7ImpF0ZKm4bUg+MCPm3i6k21hxOrGD84GXGNvOExU37AdApl
X-Gm-Gg: ASbGncuJGJXc2fGUo4SIYk8tqbu/qLm/p0nFdVih3LBE28IzDYLDRVEdvo0aYGjDLfF
	CNBeB5f8V8001F/LMkg5Ymev3Y/Qj2qx4SMwCbdkx1oSYRCNcI8cdb7CVrtiYFCyMc/vWnJ/gLp
	Yqd3u2xm1XVdHzffgGtK4npO8UXlSE80yctRVvDIx62pT9G6VSBACSmNvywmj3Zxk1cv9FRjqVk
	rgPZtZlkZOUrF19rEMI8AbNAAIL2he4q6YVfzes2bPqnIi3XVint3TxOqIBrzrhpIbeQTOPPp0T
	4ky3CCSjnbU8vKwzdezUxjofPQGK2zuLTASoTFF3KZEtac6oMtNrrIopB3o4D6AX1dAh5xH6Nq9
	NUmDFa58g/ZvB6ujJ
X-Received: by 2002:a17:902:d60f:b0:267:cdc8:b30b with SMTP id d9443c01a7336-27ed4a873c8mr14727405ad.53.1758761552792;
        Wed, 24 Sep 2025 17:52:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZb/eqow/4MDtfwG0wirrD5pVGj+rZTu8owWBw6yjQmbqpouZLqrvcXW52IQPKF2b9fRjZOw==
X-Received: by 2002:a17:902:d60f:b0:267:cdc8:b30b with SMTP id d9443c01a7336-27ed4a873c8mr14727135ad.53.1758761552307;
        Wed, 24 Sep 2025 17:52:32 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ac27d4sm5238105ad.135.2025.09.24.17.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:52:31 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v2 00/10] Introduce Glymur USB support
Date: Wed, 24 Sep 2025 17:52:18 -0700
Message-Id: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d49252 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=uF0vjx2ZuONpqyvErPEA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: nL7z9bjOk9a_Wi2oDH54upxqLyIlfEE8
X-Proofpoint-ORIG-GUID: nL7z9bjOk9a_Wi2oDH54upxqLyIlfEE8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX0MXs8RzsMgh9
 QxgHB7A8+QjbfazHIXfBrE42eDjNeodrVlp9qZIMteL6PnYf1GXwOghLIdSN+PfmSSCbt6xhOfR
 WSLCMPDSNMvHdY+WQpqMvngUVt7a5l3c3PU8lPK8ZNo3KpAO0U5ya3HQRjBcLqEQI0kC77jyF8o
 bkZJxD8GdAKMkN5RcW4JSk4AqJKgQEVOGzqF0hlz+Gn2KsnLjTnOQKTXKhsDdvLvvJHzLeR5Ueu
 s2dRqY6/EB8Of3+hiwDe8+TE2SXNgKlx5Lj460aJSG/JIbFI0YNW7WfDEEGwPm06X28WZ6LKiqZ
 BDxoWKTmVXGZnv3I5tci7GTIsOXvq6dKWftF4gH8iXzcmH8HmI1QcihYME+/v23USnd7Jr3e3nw
 O1MLRRwo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

This series enables the PHY level changes that are required to support
the type C based controllers and the multiport controller.  The typeC
ports utilize a usb43dp based QMP PHY for the SSUSB path, while using
the M31 eUSB2 PHY for the HSUSB path.  For the multiport controller,
it will utilize two QMP UNI PHYs for the SSUSB path, and two M31 eUSB2
PHYs for the HSUSB path.

-----
Changes in v2:
- Updated QMP combo PHY to properly handle the refgen-supply and to
remove the primary core reference/tag
- Updated QMP UNI PHY to properly handle the refgen-supply and added
a separate IF/THEN block to handle the new clkref
- Updated M31 eUSB2 to make clocks and clocks-name required for sm8750
and optional for Glymur
- Fixed missing PCS MISC table
- Added SMB2370 repeater changes

Wesley Cheng (10):
  dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Glymur compatible
  dt-bindings: phy: qcom,qmp-usb: Add Glymur USB UNI PHY compatible
  dt-bindings: phy: qcom-m31-eusb2: Add Glymur compatible
  dt-bindings: usb: qcom,snps-dwc3: Add Glymur compatible
  dt-bindings: phy: qcom,snps-eusb2-repeater: Add SMB2370 compatible
  phy: qualcomm: Update the QMP clamp register for V6
  phy: qualcomm: qmp-combo: Update QMP PHY with Glymur settings
  phy: qualcomm: qmp-usb: Add support for Glymur USB UNI PHY
  phy: qualcomm: m31-eusb2: Make clkref an optional resource
  phy: qualcomm: eusb2-repeater: Add SMB2370 eUSB2 repeater support

 .../bindings/phy/qcom,m31-eusb2-phy.yaml      |  21 +-
 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   |  35 +
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |  19 +-
 .../phy/qcom,snps-eusb2-repeater.yaml         |   1 +
 .../bindings/usb/qcom,snps-dwc3.yaml          |  26 +
 .../phy/qualcomm/phy-qcom-eusb2-repeater.c    |  18 +
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c     |   2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 349 +++++++++-
 .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h    |  12 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h    |  17 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h   |  12 +
 .../qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h   | 639 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       | 163 +++++
 .../phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h  |  33 +
 .../phy-qcom-qmp-usb43-qserdes-com-v8.h       | 224 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   4 +
 16 files changed, 1562 insertions(+), 13 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h


