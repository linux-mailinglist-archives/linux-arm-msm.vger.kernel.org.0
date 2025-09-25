Return-Path: <linux-arm-msm+bounces-74871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0523DB9D285
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8C654268C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E032E719B;
	Thu, 25 Sep 2025 02:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gHaJ1xfV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714D62E6CAE
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758767338; cv=none; b=qljG4dOHNx/rY9f8QANSEFUH3q51mLPDtYImgLPoIhIx8q6PN/+tZggZ/Iu8EClei4NPRFj0K8MiJt2AYPbEzyqpcTdyRiUg9/Fx7lwD7xjJ5t+41Jk5QjHFKJweFXckJVei//Ok3qFC19FT6GkYGfXjSBDz8SnhMcKbdO7jihg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758767338; c=relaxed/simple;
	bh=D3B612wqHIZ8dAE7hwWXIKwnog8Oa7HQK/30EwYk1kA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kg5hwjUjyMIsVcCiOmqk+TgWoPxtMYT1kViGNPwL+mdhD0ZfaTPABytEXIfQhKHJ+QSzBDixz4LGXWdssp85fGEQsU+hAEhF6XCMFbHS7a01cbmo7L8RvDW7fUZFwIF0iPdgceJL5xUgwhw/e/shYtFHvP4NECFd/FY9mQM1Bzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gHaJ1xfV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0XAqs027477
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pozgUr4Pa5MFZ7maN78woqc3uxqicgDaK8J
	oc7Ogf0c=; b=gHaJ1xfV/vBnMerYgWszNYnjEUvMrv/BiGaG1j5cTGI1MBlAwx3
	koXSLXrNN1aFea4RcFLQX9cmVxlRqZ9KMZwjGDB9D/l1KYiM95b4PAFGobSLMNK7
	7FYgQL769AMGAoufbWYe8Wbg9gFLvYIwwlpxo/dKSNBcQ36i2++UlzTxq/XmOoOU
	G0gOyx/jJZx+xZfE91mk+ydSFissDmr2kgax/Kw9L70hvNqjblZHZNTPJnx24hZX
	zBGpuzNSc3M9CNyS+q4d9cZPGAQFsCavPkBqPf4pM6xHZoqIrEvJzvAmvIUvmOwK
	KNB+YLwl50pV60Ydq/J9zJ9wVwcvL/74zvA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv16fd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:28:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b54a30515cfso1189352a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758767334; x=1759372134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pozgUr4Pa5MFZ7maN78woqc3uxqicgDaK8Joc7Ogf0c=;
        b=dCQC/99fMS5PAzmHV1Jswzs9cbw78iRq2NRhR0pi6tEaxmEtuMLb3s2xAcUaJUj7Fm
         q/8MP5hmAuPDYYAN+ug/idj4gH5XMNVz4ab4BpQq7l4W+Bq5FHzOTcsKdPUcVygI829s
         356RoqE/FazYeEIcl9sgCdRSoM46OFKaB7Uaqh7NGTkvSjRGgJrqzZ7hAPKiYhbs4ERt
         Gvf5TfmXcbDmL5EfIgITqoF4aL4VAnnsY9k064yvDuIj2wa1MgSyY2FWpqiDbG1zkOrp
         jn8HEEmDaBQKzJbc7tLbXxfzEYL9Ua2SQs0J0qeLj+UEdbet3CJnu1wNTLaKNOdas7U7
         l4yA==
X-Gm-Message-State: AOJu0YwFaFaQzIryyzsxxzGAxdDyuPZrgv7bkq5KYHRRTasApP9kJq8T
	BMfTyJ6k8cne5KQYMpVOBmw9I1FNSVurIEBj+jlnzUO65k/LhxTz8SADW4ZE9HLpTslMDoISi9a
	IpI29P1y/KofhE72J2mI17WaOkhJjy40cbhCnAwwDi7gaveE2aS63zAq1TJeEaSPIoZbr
X-Gm-Gg: ASbGnctEYWFb+pRZbeR9P+Sdb6PB8RTvGGeWYiwwc/2LINIbBMGT+kVsuuyHv8KOJO/
	mhzpYDcF2k9TptUEcnlqpM1nwdDLm/D/qYXpj4IHX5HDTuMy7DEO3/LxHOW2/LUBNxR0XlZIenM
	TcIaANfzgoY5ec2Hjjm9K/VhsbpAXSl8EOOR8QH6ZxpmFqbev5h1EExVHonj8zu1BeC/TA0lFYE
	Kxj7Upxjm6knEzdS1cyjRt9qm0Z/c1OTMFk1lH+TUilXEpN00JoscICbicziMa8cu1ekKUk32mz
	0nfMhvWKu31oNOICGALh6WHl1ZvLYucL2SavmQr+bO7s7j1TkPHVpY9AJN111UFbSzd1I7rFUfE
	svHJr6gN4/41AB1Yy
X-Received: by 2002:a17:903:2403:b0:271:6af4:17c with SMTP id d9443c01a7336-27ed6abbab3mr7476125ad.1.1758767334030;
        Wed, 24 Sep 2025 19:28:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpDQAb9zhwAQk2cn3fm3Sj/BbBznzSAqjeAN+5V7NHD0Qqpd9x8hSwTL4ww8Ou3qnnfWG26Q==
X-Received: by 2002:a17:903:2403:b0:271:6af4:17c with SMTP id d9443c01a7336-27ed6abbab3mr7476005ad.1.1758767333526;
        Wed, 24 Sep 2025 19:28:53 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d711ecsm499881a91.4.2025.09.24.19.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:28:52 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v3 00/10] Introduce Glymur USB support
Date: Wed, 24 Sep 2025 19:28:40 -0700
Message-Id: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: korjs7WPXr3en63rfpk3Aojr4ejuXR_e
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d4a8e7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=uF0vjx2ZuONpqyvErPEA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX3occ46QuEZoY
 UO2KX5VJ2JhS23sRUMFmDH4pchntgOkJGSRWbwr2pvF2cuOQUE+UC8dop0lAEDCdEvTaTR1y6KX
 IGM1F8DJWnMrwDC4r7oYLCmHHuECAA+l2YfHVbk2adNCbR3f/siVlAbrNWBT7CIwLWUJlO3f64x
 Cf1h9seWiQXS+T4AfS3K0WGGgS20iYvvX6NYGgZUgaxgFSVkUmXqdSQs6Zbn8BbxgfgiCpXXg4k
 ntFaarTlKpiFCLPSitry1a0LH+J7Nf3RrL/aAEhEWi44O0fFepRR+pBxAr9z0wAsHEpekuLDDCw
 iQCRoHJBeZCv+0JKqMj08DNZDnoIGqGL77Nyiwik9EloasfcoJy/DMu3txkzvmrgEfUTXtcel7G
 MuDY8sUX
X-Proofpoint-ORIG-GUID: korjs7WPXr3en63rfpk3Aojr4ejuXR_e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

This series enables the PHY level changes that are required to support
the type C based controllers and the multiport controller.  The typeC
ports utilize a usb43dp based QMP PHY for the SSUSB path, while using
the M31 eUSB2 PHY for the HSUSB path.  For the multiport controller,
it will utilize two QMP UNI PHYs for the SSUSB path, and two M31 eUSB2
PHYs for the HSUSB path.

-----
Changes in v3:
- Fixed some incorrect patch ordering.
- Alphabetized Glymur QMP settings for combo and UNI setting arrays

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
 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   |  35 ++
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |  19 +-
 .../phy/qcom,snps-eusb2-repeater.yaml         |   1 +
 .../bindings/usb/qcom,snps-dwc3.yaml          |  26 ++
 .../phy/qualcomm/phy-qcom-eusb2-repeater.c    |  18 +
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c     |   2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 349 +++++++++++++++++-
 .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h    |  12 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h   |  12 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       | 163 ++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   4 +
 12 files changed, 649 insertions(+), 13 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h


