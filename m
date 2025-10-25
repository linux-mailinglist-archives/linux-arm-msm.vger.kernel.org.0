Return-Path: <linux-arm-msm+bounces-78767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B7CC08764
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 02:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EB811893945
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 00:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA00C1EDA0E;
	Sat, 25 Oct 2025 00:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oyY0L3AB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34701E7C03
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 00:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761353277; cv=none; b=sIjnWxaTW0w3o78E7vKXYz/p5VQTOU2A8x9dd7+XlbbB30b+qLPG7yZQSQEKdSVXEUCgyq+diaFw61wb0wlds/4+V+aO3JuGCr0F2hTiAAkF5UOiG2qWG8EqUXxyfJ/TE00zxQNqZgJH/kIV+kpsiwvldE/nyWQ9D0ZO4qz9iNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761353277; c=relaxed/simple;
	bh=1f+SaJrbfLX2xjXPT7sMapX9Y8rP0T2mxE48gQoh8kc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d/Gw0ZsbqdqHwX5D8xEX7tuKvYUDMMyFaJkBaOINOYnxHJiuJyGyPZRpVcGwKaPiWLwAFINYWFfl1uzluasofyJ2JkMWPya+MeHefH0u5aHCKdtUroqDsG3lvnEV4QOobYJflE3Zjb3zVCavXXQX8ocoYitqX9ktgcPQPb8LLxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oyY0L3AB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59P0l93i012074
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 00:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=L6IpjpS1e585bisXA7MOt4
	/08rdI0wiNtT+dUHbEzGs=; b=oyY0L3AByn15neH3IQr5o/AF/dmDLMz98+hDc+
	50WZf/hKbMH5zljy3tXr+mjrZe+rZaUyJCSvnHeRxs0EvFp+/lUEZwO+xsTiaLyF
	FxY3DMuPehYISneS72ofWIStlU3KmLk+K/wlM1x7Ehx1LQHWLczEFpQ9OHpeIg3n
	SO8J++AVjkPtXQ0a1mHZkBvUJCwdK1O7UxYgIWYItBBHxI83v45UMBKkhazGvPWp
	+1RJriUFEkMWhlLhnmEMkJ4eex8on6JE5vcC3Ybd6bjoFJ8vAIX99MhykGSUyAe5
	iHJA3LWJ4i1DyUNEjD0H2JIL+sSKyYCU/xvNvk1krU5Ttyyg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0uk6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 00:47:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6ceba8968dso1842015a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 17:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761353273; x=1761958073;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6IpjpS1e585bisXA7MOt4/08rdI0wiNtT+dUHbEzGs=;
        b=js57t+veJ/75kaSCwT+DEBi0Q/LPsFJkdVDApQrc8rp+3eKl52npPpHFXW7dg7MjQZ
         so88J2YjQA/DkJjPvhmdBCEs6FTgLA/2vtAP12LrjAHNX19QUm/0ff9kTsstdSaebyVF
         7mJx7te3xU2adM9ZHaJBPxDCkrLE29rTE63lPN4/odUxPpS6bHzO3/4b8YgRQuME1vN1
         HCdCIgTcblBt775kYaxvdtvN+iPV8yhmOcK02z/b+myc0aJRigWLv/4vvT5TxLWLeGMV
         jk9U4tkqQSBtJKkCq794T6Y0xPelPM/xao8+n9e6rnFhx+3yO3z/4/LoTjz30VZmCWhM
         7Htw==
X-Gm-Message-State: AOJu0Yzeuf/P+KotRP1uXmT7EeNUttRmQPY4YMN5a2gVnGjcv4nZN6M7
	VJkAsKuE1JjMd+bruxZiGWnD6zaLo4QJZDE8cFiQu9LBgs2kp+VEh+gzYLwf+azgbC4EyPVAdPu
	FwCOg9+jUlV/DGd9BrXsT25HJJ7vVo5eigb4z39c9k2pASJbIKP8DGpg2C3wkMSGdI2jX5UwX6f
	yw
X-Gm-Gg: ASbGnctmSKmXgCc8qWvM5460Ssm9ESPwCITEPRqgNPrxTf4Sib4/HeqOuZ2SffqtSlU
	K2bAFH8YLrPkJvd8seQ9frm3GhFL0TPsX5AxIbeojn0XEzj0+CDVxLYT2r0HY2KIti1QALjaqKV
	AMvK6lRZmsQOOG2CmoJvgBp221RDTICyQM/toHJY633Ff7TDlT+SNeQIdaTujBxSOD9tqVuC70W
	nS2asz1bhG84vm+rGvlmUSYcsxqozUtmfWpwRK4WhJAzw08PNGo43H8ygF6j/awrFIWE7D48uRS
	VWBdlzPMhDlLRPypERAGLDbH1LLtzNLcHCSEdQs0+6wsChJbK9nKTaqsHkZQVUJVCoMZJ6Ra9Ll
	EX+batXZpeCpbRDTWiRU5OayBUbC+SlWMTugcz2Ymp/s6zxto6KM=
X-Received: by 2002:a05:6a20:1585:b0:334:9649:4754 with SMTP id adf61e73a8af0-334a85462d8mr39971251637.13.1761353273323;
        Fri, 24 Oct 2025 17:47:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaI6IX+J3gSXLi97PHwV59k1RCPN0Swx6E+HQYIPmwQxD+ZLzN0Beey+AMQrxU3ZXLo0dzww==
X-Received: by 2002:a05:6a20:1585:b0:334:9649:4754 with SMTP id adf61e73a8af0-334a85462d8mr39971228637.13.1761353272815;
        Fri, 24 Oct 2025 17:47:52 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed3eca8dsm167352a91.0.2025.10.24.17.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:47:52 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v6 0/8] Introduce Glymur USB support
Date: Fri, 24 Oct 2025 17:47:38 -0700
Message-Id: <20251024-glymur_usb-v6-0-471fa39ff857@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACoe/GgC/43Qy07EMAwF0F8ZZU0i++bRlhX/gRAaStpG6gMSW
 qhG/XfSLtCw68bSteQj2zeRfAw+icfLTUS/hBSmMQf3cBF1dx1bL8N7zgIEywTItl+HOb7O6U0
 2AMhU7GyjRR74iL4JPwf2/JJzF9LXFNfDXnjvHgxVINJgKhUMnNGS5bdPvV9V3fmxfZpSUp/zt
 a+nYVC5iB1bcA9YIguUypC2FYpzgv4v5HlLyrDWxCd3MH8CE3G+3mqjNDtniM8J9l5w+wMJCly
 iKE5csW3bLzE8uHWyAQAA
X-Change-ID: 20251022-glymur_usb-f222049165f3
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Elson Roy Serrao <quic_eserrao@quicinc.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX4a4Jl2TxdGTG
 RAU0C8S0m/qbB7ExcBktIez4ZBp+RpVwACXyHRpuhtUgYsdI5KqQC6ZX0Le/tnYFQeBTKoB69Nl
 otLfMT46H9deQiOvGlxWzYRiwHet/8XJF9zSe2Qd5J7M0C8MG06HM7KgAdFgmyIje4a74xj4/FO
 GXeja00SjIzDYAVcwMJJMsuUorgRd5TJ/gPhtfyHiNRQalmZ2HZhhiWzvxd2ftvDaLyokuP4QVv
 6OSnGUoo1+2aBPX266FxUJ99O7/ZftBEXLpGCROiWT39xAivAlZvfoiX7eoxKRW3ZxdWf4oJGqf
 KYktlzQxViepcojiu1c3DLwBcQqvPNfBujfIdZ5lgwyxYfO//oj8ktPhBmz+uRLvyh4jnoDin6h
 D01G+pBdlS4+RyKK/Kq01REyqrzESg==
X-Proofpoint-ORIG-GUID: _0W5UaL_BgzYnDe617uJcI3fW8euhYoL
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68fc1e3a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fXH650Jz_15WDPxxfBwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: _0W5UaL_BgzYnDe617uJcI3fW8euhYoL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

This series enables the PHY level changes that are required to support
the type C based controllers and the multiport controller.  The typeC
ports utilize a usb43dp based QMP PHY for the SSUSB path, while using
the M31 eUSB2 PHY for the HSUSB path.  For the multiport controller,
it will utilize two QMP UNI PHYs for the SSUSB path, and two M31 eUSB2
PHYs for the HSUSB path.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
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

---
Wesley Cheng (8):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Glymur compatible
      dt-bindings: phy: qcom,qmp-usb: Add Glymur USB UNI PHY compatible
      dt-bindings: phy: qcom-m31-eusb2: Add Glymur compatible
      dt-bindings: phy: qcom,snps-eusb2-repeater: Add SMB2370 compatible
      phy: qualcomm: Update the QMP clamp register for V6
      phy: qualcomm: qmp-combo: Update QMP PHY with Glymur settings
      phy: qualcomm: qmp-usb: Add support for Glymur USB UNI PHY
      phy: qualcomm: eusb2-repeater: Add SMB2370 eUSB2 repeater support

 .../bindings/phy/qcom,m31-eusb2-phy.yaml           |   9 +-
 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |  19 +
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |  16 +
 .../bindings/phy/qcom,snps-eusb2-repeater.yaml     |   1 +
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c     |  18 +
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 326 ++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h     |  12 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h     |  17 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h    |  12 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h    |  12 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h    | 639 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            | 163 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h   |  33 ++
 .../qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h   | 224 ++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |   2 +
 15 files changed, 1495 insertions(+), 8 deletions(-)
---
base-commit: 15ba5ae3b0ede7e355c88ac074e946fc1aa21026
change-id: 20251022-glymur_usb-f222049165f3

Best regards,
-- 
Wesley Cheng <wesley.cheng@oss.qualcomm.com>


