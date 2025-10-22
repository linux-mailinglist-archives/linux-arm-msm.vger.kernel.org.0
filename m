Return-Path: <linux-arm-msm+bounces-78288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AB6BFAF0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 10:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0DB1A505485
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 08:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53BB530B51B;
	Wed, 22 Oct 2025 08:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c8Da94W9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428EA3064BB
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761122466; cv=none; b=GWcMR0piz70irvazQD+nV0sA/yuxTN+sCaTIYpYaKi98+TOJY+pkD/a34hbCSHqlT74PnGgxdITlmSTnDMP7DIu07Eh0E34EgwpKI01M+0Fqd5bMpdzd0wPOmcSsVV4RFuOjLewhjFCLs8JX4rgk+dVWxJXMOJy0Mbjjc1EH1Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761122466; c=relaxed/simple;
	bh=rdFeIFxisvTqU6jYZ0ZEE5TCFjoK5SwdZxLsFPrdVh0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JiueXb9Y6vXM765c6Dm8E7JO5rfG/D46O9O2XggYmrg/6mk8k0KoRiWzY8wED+C2VHbe87YmpD1VtwgWyB3Y55xdxZa0HlN9Hw/yrFQCfLUr9WkuqOUrQueD6mQh+dCvSpmsUbhBCYvlSOT4bjDRYIUBZGfuztbx31Y8Bx7LEYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c8Da94W9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M7PJYN010315
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=r92a5EIGfnMjjY27uIwghIYMcmubdX5JDsZ
	+1buAxHY=; b=c8Da94W9p5yLLaOCB2yyIM2hMrIYB9GpgmF9qTxTALuMeuqKnI2
	/z8m0Chcq3NX7HXlbq68lYzm+N+wn+lmCRWRHIN4QU2w3P/xzJ5mkThfvU7WGmxT
	9R70ZHvuG8Us51tSjMWscOcQqo6kFU4q1051aAIxX3QOyI4u38AqXD6T/lG9zNw6
	lTiNi77fEM3IO7ZHtPzKnEqc4ioRAPmBNiL+sxqdeEnHPHV6dTINUiKoj0EDpPRo
	WRUnE77+cmxw2xFv6I+6iUcP3m67lS+0phmMkMjVHJOvX4EOwPE6RO9e5z1Pd+rf
	8g8sAcROUrvgkZQKOSuUQCJl+Ysdu/1AYHQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0hrsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:41:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33d8970ae47so3858879a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 01:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761122461; x=1761727261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r92a5EIGfnMjjY27uIwghIYMcmubdX5JDsZ+1buAxHY=;
        b=Mlhdqt9p1AKtB3FbM0nVT5wBeFdfT5GnJLZRadh/44hksuVHWMCNW5vOs26kv9Uuyi
         BXGKMLli6RFCx2IyUWscCxVdZGryS0QKdJJMd2yQSDCRCk0RJG8dmT+a0/p1ugW4o/G/
         nUr7ZR2KPtTv9XwMf3YmwD2n4LbYZfH16bD5R7hPKND5Y0iTzUU8UFWPTvaK4R1Nyrvs
         noboVeHgzsoKiEq6gn6W8up6jwuMDI9nqbwJPI9zi6kBTqjfFhDNJ7W37Q6kzlkvmxnM
         cS24miC80dTuHzThKh1h2uADBEtr6aHppNmRZZA0qWPKKkKHGa9EEmF7fmTF1msDVZC1
         ie/g==
X-Gm-Message-State: AOJu0YzJCYkJo3VrEuVdyKAeJdGpkpqQPjNAdyEDaeGPjwZIqKuRj9gP
	etxzPw8bSiKVtUg+Q/6K81PgJcWP+rQCYAe4eHLL9rqy0ZxHVhCut8w3p8fu7NaZZihk5H67jAE
	MmD8TJuzraVzjZ3BT/YUhw3uw9s3DDlzaHtR0fRKUQFNKpDRhSH7NDCT7b5eT4L5kiuO8
X-Gm-Gg: ASbGncs6ie/PXUUpPpmiTijj8uO9sTkvqePou69fyIw38m4qsxNraSsH0n/SbiXMwvP
	uJyBdCoJSnZOcDGtw6cS97ql3rMT1M+SarvrJAgfoQ0x8cvBV/QnmdJogaA+kzhOkxVMCgfR2it
	bJmyPyUR+uvUUCn5eBDj1IygUUiH5WqMkKDpNJry3FNSBX3zjv4sQE+4A+mUipd6CWA0j7bmx9M
	DygN7nLb83bSV63Xeglg21c7Xe/Sb67dedSEZ0drDVKTNVfBSQtfnucpmn0HWOoyzbQe3gci3UQ
	bVqqcm3FQYXZxNZG9QZwHPCrYIfqWZwEu/aEKd0uBIFK3X3aRMwxHnV+bagJhSo1iFYC9GecmFC
	KOdwsibWm4LWKZd4au9gDBXu1x+TnobMqK3d8
X-Received: by 2002:a17:90b:4c4e:b0:32e:6019:5d19 with SMTP id 98e67ed59e1d1-33bcf921526mr24014636a91.34.1761122460688;
        Wed, 22 Oct 2025 01:41:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8E/B6/RrZnxDE5MpvS1CD9RalhJfpfyU2LUBW8Ogp0hDSVDTBWgimPyATy6rs0zuu41/n+g==
X-Received: by 2002:a17:90b:4c4e:b0:32e:6019:5d19 with SMTP id 98e67ed59e1d1-33bcf921526mr24014617a91.34.1761122460103;
        Wed, 22 Oct 2025 01:41:00 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a25e9be9f3sm3740317b3a.71.2025.10.22.01.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 01:40:59 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v8 0/3] Introduce USB DT support for SM8750
Date: Wed, 22 Oct 2025 14:10:49 +0530
Message-Id: <20251022084052.218043-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX4sUY3b4hzwh7
 zQgQ/dV1NSFtny7oiREGq64SPCT1NHDJKqV33SjWTusnRcU0exNrRqIPCckWwRSB6HrPTnl2QRG
 ca9jr8nDUnBNNyQHvFtg4bDI+F4tCVuJiDnzWomLDX+kYud5a/bq96VEfSpcjG7bnVO02U9g4io
 mlME2/hWKg1gsqiNZw0viP8oyzhu4b4HKEkwDdf8P3+Xj6tEeTa4ImFo1K+gWzcx8gfGtmDNnaa
 DVzwSMJ4wXlNDwMNXqBt6x+ZE3hIsPN55l3r8jrv6zUJ5mRlsU3sLtBwsI8cIOM15doYdM/5pmH
 V2ep72SPsKtAhrJ0xUTEVoliO5rAkdUfdcMxs+52beZ4zWjIYfXKQC6tGt/dQmDzdb2SaBLZLRx
 S2NoembYlhWd3g6uYX4Z0Wmcs8aIAg==
X-Proofpoint-ORIG-GUID: LlxmWvbOiOJ5A_IYnPQJV-1fJu6YnWc2
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f8989e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=UZ4tNvspqRR6S34ExfcA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: LlxmWvbOiOJ5A_IYnPQJV-1fJu6YnWc2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

Add support for the PHYs and controllers used for USB on SM8750 SoCs.

Version-6 of this series has all the binding/driver/dt patches acked.
But only the phy changes have been merged.

Version 7 was a rebase to get acked patches merged. But comments came
in to use flattened bindings.

The v8 for usb patch has been split and sent out separately [1].

Cover letter heading has been modified to remove phy context.

Defconfig patch has been resent by Jingyi on [2].

[1]: https://lore.kernel.org/all/20251021050954.3462613-1-krishna.kurapati@oss.qualcomm.com/
[2]: https://lore.kernel.org/all/20251021-knp-usb-v2-4-a2809fffcfab@oss.qualcomm.com/

---
Changes in v8:
- Using Flattened DT representation.
- Removed obtained RB tags since the code has changed significantly.
- Modified Author mail address from quicinc to oss.qualcomm.com
- Link to v7: https://lore.kernel.org/all/20251015105231.2819727-1-krishna.kurapati@oss.qualcomm.com/

Changes in v7:
- Rebased on top of linux next
- Split usb patch and sent out separately.
- Link to v6: https://lore.kernel.org/all/20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com/

Changes in v6:
- Change readl_relaxed/writel_relaxed calls to just readl/writel in the readback function
- Updated languange in the defconfig commit to specify SM8750 as a Qualcomm SoC
- Link to v5: https://lore.kernel.org/r/20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com

Changes in v5:
- Removed refclk_src from the QMP PHY driver as that is no longer used.
- The decision to move the TCSR clkref property from controller --> phy
node was made in v4, and the refclk_src was a lingering change that was
meant to be removed.  CXO is the parent clock for TCSR clkref, so CXO
clk will be voted for as well.
- Relocate the SM8750 compatible within the qcom,dwc3 bindings.  This is
to take into account the change in clock list.
- Link to v4: https://lore.kernel.org/r/20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com

Changes in v4:
- Made some fixups to the M31 eUSB2 driver
- Moved TCSR refclk_en to the QMP PHY DT node
- Link to v3: https://lore.kernel.org/r/20250324-sm8750_usb_master-v3-0-13e096dc88fd@quicinc.com

Changes in v3:
- Split platform DTs into separate commits.
- Fixed up M31 eUSB2 PHY driver with feedback received.
- Reordered DT properties based on feedback.
- Rewrote commit message for enabling EUSB driver.
- Link to v2: https://lore.kernel.org/r/20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com

Changes in v2:
- Added new QMP PHY register definitions for v8 based QMP phys.
- Made changes to clean up some code in the M31 eUSB2 PHY driver based
on feedback received.
- Added bulk regulator operations in M31 eUSB2 PHY, to ensure that
both the vdd and vdda12 regulators are properly voted for.
- Removed external references to other dt bindings in M31 example for
the DT bindings change.
- Split DT patches between SoC and plaform changes, as well as the
PHY subsystem Kconfig changes when introducing the M31 eUSB2 PHY.
- Added orientation switch and port definitions in the DT changes.EDITME: describe what is new in this series revision.
- Link to v1: https://lore.kernel.org/r/20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com

Wesley Cheng (3):
  arm64: dts: qcom: sm8750: Add USB support to SM8750 SoCs
  arm64: dts: qcom: sm8750: Add USB support for SM8750 MTP platform
  arm64: dts: qcom: sm8750: Add USB support for SM8750 QRD platform

 arch/arm64/boot/dts/qcom/sm8750-mtp.dts |  22 ++++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts |  22 ++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 158 ++++++++++++++++++++++++
 3 files changed, 202 insertions(+)

-- 
2.34.1


