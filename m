Return-Path: <linux-arm-msm+bounces-84810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F834CB162D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 00:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 002B33026A38
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 23:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A682FB96A;
	Tue,  9 Dec 2025 23:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kcHmPK4q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iJAVfFQI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6D02E173B
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 23:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765321792; cv=none; b=HbYjKwzjY9BFeaMcCKOh+Tzvm0uZCv1Dc6gLrOi2hF5yshtX7W1jM3ShuCNBRoSeZ6Wh2kyVVMATA7LwU2cdTtETSJO1wP1rNUjTtoMXq3flaTYnqJKwUhSuQuUQoM1zH2eD5eqi1z3bRLRj3GUTw8dE8PI/S/+JQiNpBwzjM2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765321792; c=relaxed/simple;
	bh=Z6rTFHHiYb1VQrnpwuwDd4bJjbnN5uIqeGkKCscPAgY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=qFdAr2lne2bTHXmiLrOVCtIpjSll1cbU+QAyVEat8aBENOaIj4L+864r67b9fSABXy8nXNY8oOpQBXBH9yUXcKxsyuQZXPZsyEpIwC02Ske8SiIcUaTB+y4pVlpSIIrSnrb7lIw3lOw2b3Akh6Jv2T9KgApQ/L5QziMOpXw85uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kcHmPK4q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJAVfFQI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9Mmqq4813534
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 23:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=A0uSh8vW9lPCtE6HyPxpqi
	EnW7ZnxfsJrUX3fT7dJJ0=; b=kcHmPK4qDLLHRbJKauP54fwyqSDrmHXicLSLxW
	uiesV8TY7tTz/ED6AqnpMX9Y6aeT6zNn5kOIXFm4BpI3qKwnE30cd5MahRHZSq78
	yc69B3rVuKVZZYDFaNusjw5D79ejheVAJzA4b4AtW+azz8QG/DdOSv0f27ryBx09
	wkq11Gs5BOUEvB1qaNcV/I8wzF744Jh4vKuq0+8j0ytQZZSrot3NVjKyEZJ+TZIZ
	yJJNzFGhENBVfHzuXcK7VSnaE8Fk5SLe1QMrFmuhuCPXK2iUXkj9uIWJlEQEZo7Q
	6ogcbEiucJpauxAms9wZ3E9/AOQGHCHouUv+B3MHyJKFfk0w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axpx198v9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 23:09:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso10551455a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 15:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765321790; x=1765926590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A0uSh8vW9lPCtE6HyPxpqiEnW7ZnxfsJrUX3fT7dJJ0=;
        b=iJAVfFQI2ZXMyuQ6/hwXSGNhOyZTw8MZ8FfEDb6xPsm4iRCmVl5ajAr2rpkHpqdatv
         Rv2ug4o2+ts61TgbQVbvu9sbULn6w0iawVDizTjrHDKbQyMghBFLgYdjhM0u3l1MqndI
         oUnW1Gh71Mw212nGw5e9inuTpjA88pVyGY6SCMU1FQi0/u5wYuUzxzqi1UvkumLG43e0
         EbpNlXKh8flajmjTPFe0CboxtBcaapIc4hFzUFdlOByMeEZ1K6ra8jYNzqDzQXPEP+w6
         3jjT+B9/6Naa0LokrxgfxalCmpExfaC2sDpSh4gNI8aE582minkYx4K6wDLk3fkuURst
         hiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765321790; x=1765926590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0uSh8vW9lPCtE6HyPxpqiEnW7ZnxfsJrUX3fT7dJJ0=;
        b=XijsD47y5ZUc81HmWAUdZNZONnB/D89ch/fzU0mWCJJHY1v46cSzE99fybYqyesK1/
         Hv20wOgnx2bMorTQa9XL8OcN0AzM5rJoE0QhejgYo1fltQHmx6iEGksuqFlRqnHOU38P
         dZ7UaO6TtrCvW6rw/k3rD/UDEGf0X/1krm9MUu5yaJXBU2G3r9gIfRWO053smwuVLzqQ
         zq7/Qp64zSpZ19TcUiIZ2nYggKZjeak53Z5Avz7O+bKAsooUceK+yZ0LcCOsoKKzgNPy
         6n9TLLO2crnTT2aGSRnqZyo4qcMUO2JMAx8iWTY2/aw/5lHZFHWCVkqaNCakbeGBx8yT
         WylA==
X-Gm-Message-State: AOJu0YwIk4tswq81R5/MtoCRkL821kPavRT0dVnPpMtXpEPGyEKq75F7
	ICXpSAqdPrATwUCFDMH3H3WRRbEK7jc2zGU0DIA01U8KeS5lwJ3gb8Zfe52/QLcAA1X9OLS4Cqz
	FBIom1B+SDsL38zBc3E7L9pjPH+XqamfJwpVcmV7G2Mwnrw3voxiBJ0sk83RclzM7urQ9
X-Gm-Gg: ASbGncuSTVMW24dCl0VSS1R6F6riaosO/DslnbMLDyK3VVzZgqm2bf4oHnU8ijmNoYF
	nQdbwBJ1i62I0/8BOmOYIAK8u2+deXvhdvDyupYAYAeEk+Cn5yilxNewEexmAtQ0SeQRQ7VRiKd
	P/bZci0rrz/VosRMpBWfwqfVxsD3AAGt7rWgL/9sIcxB+h/eJXkADv5pW8YtXuuDbHOYS/N0xUZ
	O5ybr2gF5Arq53HWKdCE4sAVbHhks4bnQwo8i6kUssbOcyj36yVZDxQIMeYT6/Cnas3Ey8E6a5J
	DK3yRpxoz+utTO1L8jYjRepR0LO6vhch3LbQYdue0SAE9mNS4AuTPupDntq2SdXfp4g6IiwqFRw
	YdMa225JYJDWe4suxSSFf0Lsegz4s3ad4I3JH/4R0vVW9ElFeRbFvU5M2Pov7ZQ==
X-Received: by 2002:a05:7022:249b:b0:11a:61ef:8491 with SMTP id a92af1059eb24-11f2966a032mr319415c88.3.1765321789591;
        Tue, 09 Dec 2025 15:09:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHevoqM4i/BbJgQ2JaDxCHV2AGELivaEW6uZMzJ/46mUwlajEEzJf/D2ChlpBKx4eQc671KdQ==
X-Received: by 2002:a05:7022:249b:b0:11a:61ef:8491 with SMTP id a92af1059eb24-11f2966a032mr319378c88.3.1765321788950;
        Tue, 09 Dec 2025 15:09:48 -0800 (PST)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f283d4811sm3338933c88.11.2025.12.09.15.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 15:09:48 -0800 (PST)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, abel.vesa@linaro.org, conor+dt@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, vkoul@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v8 0/9] Introduce Glymur USB support
Date: Tue,  9 Dec 2025 15:09:36 -0800
Message-Id: <20251209-linux-next-12825-v8-0-42133596bda0@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251208-linux-next-12825-cad8ef4a16c2
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OmpabSrMU6hNBdVdC2tCDu3DLsl5lPNg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE4MSBTYWx0ZWRfX4WnqnXNV+6Ux
 +U7KMfpwU+T3jMn6OzWQLHjqmZ6DzMKemyEXsUv0QSyqi17mORkmtLY6bz5wkA2OqEabWIdo7Vy
 E8p1coNmgEWVn0TdIMAlA3oQS1AMGW2HOUKur+7uqGVYSkl9diLMq71rsOlTMbZ8tIs4/EqMAVq
 cEyWkOaiKVPJO5/AXyH+CbUt4N45iRdrYl5d3RuCfmG6joSO99ppFb749Eou8T65UtakI2HWO5d
 sFIPZ6tFu7nkG5Y8nGstcNR2b7PS5mOKLgBM1JPpHFPpPyC5YAeY/WSnlK/AWSVvsfbsaZdGZyQ
 7x4oqT85bVKe8GW2SWJdSK3BFqq+e3kG9PhAcRIBIjb4MRpvmYGZH4aas6jqgW+XtQDpnmtcysW
 hSbubiRPytPAPTDMaWRlD50ZJ6q3Bg==
X-Proofpoint-GUID: OmpabSrMU6hNBdVdC2tCDu3DLsl5lPNg
X-Authority-Analysis: v=2.4 cv=Su6dKfO0 c=1 sm=1 tr=0 ts=6938ac3e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKvgRvfW_d-9gY9-AngA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090181

**Please consider this for -next

This series enables the PHY level changes that are required to support
the type C based controllers and the multiport controller.  The typeC
ports utilize a usb43dp based QMP PHY for the SSUSB path, while using
the M31 eUSB2 PHY for the HSUSB path.  For the multiport controller,
it will utilize two QMP UNI PHYs for the SSUSB path, and two M31 eUSB2
PHYs for the HSUSB path.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
Changes in v7:
- Add DP altmode tables from Abel
- Updated some DP settings with new HPG settings to get the DP portion
working
- Link to v6: https://lore.kernel.org/r/20251024-glymur_usb-v6-0-471fa39ff857@oss.qualcomm.com

Changes in v6:
- Reworked the reference clock requirements for the QMP and M31 eUSB2
PHYs.  In the QMP case (both UNI and combo), removed the need for
the clkref entry, as TCSRCC clkref switches will handle votes on the
CXO clock.  For entries w/o a TCSRCC clkref switch, populate the ref
entry to the CXO handle, while others (with TCSRCC entries) will
the TCSRCC clkref associated to the USB core.
- With the reference clock rework, dropped:
phy: qualcomm: m31-eusb2: Make clkref an optional resource
- Removed the need for a clkref entry in the QMP combo clocks list.
Removed previous reviewed-by tag due to this change.
- Split non PHY subsystem based patches into a separate submission.
- Remove DP related init tables from QMP combo
- Link to v5: https://lore.kernel.org/r/20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com

Changes in v5:
- Moved phy-qcom-qmp-usb43-pcs-v8.h into USB specific QMP driver
- Fixed DT bindings for clock properties for QMP combo PHY
- Link to v4: https://lore.kernel.org/r/20251001220534.3166401-1-wesley.cheng@oss.qualcomm.com

Changes in v4:
- Updated DT bindings change for QMP combo PHY to have IF/THEN blocks
to handle the newly added clkref, and fixed the commit message as well
- Added a new header with v8 offsets for the PCS MISC register set,
and refgen current load for the QMP combo PHY driver
- RE-added the headers for the QMP combo PHY
- Link to v3: https://lore.kernel.org/r/20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com

Changes in v3:
- Fixed some incorrect patch ordering.
- Alphabetized Glymur QMP settings for combo and UNI setting arrays
- Link to v2: https://lore.kernel.org/r/20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com

Changes in v2:
- Updated QMP combo PHY to properly handle the refgen-supply and to
remove the primary core reference/tag
- Updated QMP UNI PHY to properly handle the refgen-supply and added
a separate IF/THEN block to handle the new clkref
- Updated M31 eUSB2 to make clocks and clocks-name required for sm8750
and optional for Glymur
- Fixed missing PCS MISC table
- Added SMB2370 repeater changes
- Link to v1: https://lore.kernel.org/r/20250920032108.242643-1-wesley.cheng@oss.qualcomm.com

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

---
Abel Vesa (1):
      phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms

Wesley Cheng (8):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Glymur compatible
      dt-bindings: phy: qcom,qmp-usb: Add Glymur USB UNI PHY compatible
      dt-bindings: phy: qcom-m31-eusb2: Add Glymur compatible
      dt-bindings: phy: qcom,snps-eusb2-repeater: Add SMB2370 compatible
      phy: qualcomm: eusb2-repeater: Add SMB2370 eUSB2 repeater support
      phy: qualcomm: qmp-usb: Add support for Glymur USB UNI PHY
      phy: qualcomm: Update the QMP clamp register for V6
      phy: qualcomm: qmp-combo: Update QMP PHY with Glymur settings

 .../bindings/phy/qcom,m31-eusb2-phy.yaml           |   9 +-
 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |  18 +
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |  16 +
 .../bindings/phy/qcom,snps-eusb2-repeater.yaml     |   1 +
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c     |  18 +
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 676 ++++++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v8.h      |  25 +
 .../phy/qualcomm/phy-qcom-qmp-dp-qserdes-com-v8.h  |  52 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h     |  12 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h     |  17 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h    |  12 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h    |  12 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h    | 639 +++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            | 163 +++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h   |  33 +
 .../qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h   | 224 +++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |   2 +
 17 files changed, 1918 insertions(+), 11 deletions(-)
---
base-commit: 82bcd04d124a4d84580ea4a8ba6b120db5f512e7
change-id: 20251208-linux-next-12825-cad8ef4a16c2

Best regards,
-- 
Wesley Cheng <wesley.cheng@oss.qualcomm.com>

