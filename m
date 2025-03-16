Return-Path: <linux-arm-msm+bounces-51542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C7CA633B4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Mar 2025 05:12:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4942618934C4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Mar 2025 04:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7AD2FB2;
	Sun, 16 Mar 2025 04:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oqez6ZB7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFAC322A
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Mar 2025 04:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742098159; cv=none; b=RBBmnnky/jQJn3/UPX/rhiEGCgEhc28pGQtyqtb1eWSmSWCKLP9iO+7dcPGw9WSGm7Nst9L4mCsQGbH3qQ87L283AzrCZz7or0NL2k6gWBbRVH5VtCiLhNcgncCcX4wqVeNyPhYmqccuZrTxXEohAXZ74NTq3W0zlyhtYztUoUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742098159; c=relaxed/simple;
	bh=qaWWu0XubRBdsbo9d+4oRrNnwNoVBagfiN6TpjpNcaI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M9UbX778odGTUd+slIUgi2lkodQgK+ZJ1NXaDhjm7C1q4NR3HRYoefkkmdgkvyqMvCISOYY2zz/Ai4jThISxNzGrkiS3ddPH26MAuAVOwg1+vpUGLyCbJEpTeOA0UyY3sIAugtuJS99OV7ubft388VXThv7C1nO/3STI1Vst2Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oqez6ZB7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52G2IR89007401
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Mar 2025 04:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ly7vN9LS7zdd3ilfjBPyIa
	ufbarnxJGjGeE6ZL37MQE=; b=oqez6ZB7+xF0BNbH1gkKLcaJGur+/r3fUz1N1y
	nfLtvH60TV434IVOVLR4CXQjhdLupvwNA522Ew8XT0U+Diy4bi18oCUZ6d25CxdN
	sngAn3Pgp0JL4/SkP2mAWNQa0AFoKi78P2rO0W9T9F5b2kYO2oJgjbkjWzotQNoy
	fugs35Y+DeG87ckrTcKZcdMpvPy/sBwY9gjmeid7PcQ1DMDyGagiGudtwkv8a/u8
	wilBj+ghn58cZB6r2iJGL3zj0pQMvXNNLElChD5Yq9WWLJfwfG/t5SAk650Vemyj
	5S4Mm1Tl9jy4FXBWCi5jeIOSsAdBpMdQbEWd19yu4CU/vWHA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1u89pbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Mar 2025 04:09:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff69646218so2539814a91.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Mar 2025 21:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742098154; x=1742702954;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ly7vN9LS7zdd3ilfjBPyIaufbarnxJGjGeE6ZL37MQE=;
        b=M4RlzyFCwD2fDPkiGc38T52SMuU8/Q83LPbfYL7lErhIhEYmq6ZSsA1622CSVikd3Y
         UQVc2FA99Ra92jr39peJtxkvH3P7ecaoqXgKlgi+/YW/tXo8iJQQH0r8RrqUfHUxEanH
         d18WsiPuE07RvyddSqXjnCnggzuDHw6r02aexq0vKYEkSvDYiMfntF4t69h2qYplo6/y
         kfhOHwaLTmK0zlyWiDHcc6EZ6IUcTx57A2WBLPV4ttKBJlVafKAQvxHvxpKGBSsiRI3X
         kSzxwdGX3KzodaZE2jSb2R2XByU7veV75E1mM+SNT+eR/04C5noupeRCNcMDeDRrmMhx
         MD7A==
X-Gm-Message-State: AOJu0YySx0QLleRZBM0n7kfnZVWFG8rIf0nL0ZuWJ1H79cI7PJutqixd
	n5fx4/ePg3vHJc5gLC6QsZcL0fakZzDLM2HhHvmAREcG7Luqff/uUDxebVZq1j/Xox9qb19wUFd
	86v9opff0GLZVgg/CVaGi3ub3E8ywERwaNIaJJnckx9S1xWnH3yQjDPa+mjuL1/iRIi0Roy29
X-Gm-Gg: ASbGncseYnK93cO5fxo3gbLqsTKdZI6flYjsY16vOw99UjpRcGbt10QS2MwGBKeGrHx
	+ZIB1c2MJiqqr3R9CQOv4F7wW4t41yMtU0TA+YbmfF0TR+y4vjlraCYX6pUh1bukq04+oBLIR+W
	6xmFmO9TYGuTdsuXNEZsvvoLhWlMLraYhr9q+FARk/3m92upf1b9crtZjUR6mgqGdTzkaY8ULz+
	vB+fEKGN5/wBNaLOrJOClpPBXNT7ziu6sxvf6VLbNox9LDjpTXBmn4Vc+eVKh67C+kL9lYv4sWC
	O77KfMhShxUDcoJOgPRYZz0Ca1UST5dNBYh8ogNa4FQm+aQpTrQ=
X-Received: by 2002:a17:90b:2dc4:b0:2f5:88bb:12f with SMTP id 98e67ed59e1d1-30151cab3ebmr8484171a91.21.1742098154347;
        Sat, 15 Mar 2025 21:09:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLjlxYTdfNJqZhkesiYkuM2USBpUWsehzb+9Jry9ZoBFoQZCtcy0jiQ5jO8MhOA4QR3Rnwew==
X-Received: by 2002:a17:90b:2dc4:b0:2f5:88bb:12f with SMTP id 98e67ed59e1d1-30151cab3ebmr8484156a91.21.1742098153973;
        Sat, 15 Mar 2025 21:09:13 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153bc301esm3490438a91.49.2025.03.15.21.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 21:09:13 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v8 0/4] PCI: dwc: Add support for configuring lane
 equalization presets
Date: Sun, 16 Mar 2025 09:39:00 +0530
Message-Id: <20250316-preset_v6-v8-0-0703a78cb355@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANxO1mcC/23MTQqDMBAF4KtI1o3khxjtqvcopaRmUgPV2MSGF
 vHuHV25EIaB92b4ZpIgekjkXMwkQvbJhwFDfSpI25nhCdRbzEQwoZjgjI4REkz3XFEO2qmKWS6
 NJfiPF+e/m3W9Ye58mkL8bXSu1vZIwWG0fdhaasuYqO0lpFS+P+bVhr4vcZEVy3oHCLUHNAJGN
 dJJcLJR/ABYluUPZsdjOOoAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_mrana@quicinc.com, quic_vbadigan@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742098148; l=4296;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=qaWWu0XubRBdsbo9d+4oRrNnwNoVBagfiN6TpjpNcaI=;
 b=+oB5sg62cYcczDindH2FLJ3cF92jLLKvCvrBc8qft6GnzFAaT6pC+HhVDeSD/MqaPQMeGudZN
 vgi7/521GWJBa3DZUeu5L0KLkPrrZsmQwQ+onLVuIBzP9gJZpxJe/LJ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: YN1iaO79X4iC2Au60jV344nLgsioSZjd
X-Authority-Analysis: v=2.4 cv=c42rQQ9l c=1 sm=1 tr=0 ts=67d64eeb cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=DYBN0Cp5FbWaLJN7M44A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: YN1iaO79X4iC2Au60jV344nLgsioSZjd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-16_01,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503160029

PCIe equalization presets are predefined settings used to optimize
signal integrity by compensating for signal loss and distortion in
high-speed data transmission.

As per PCIe spec 6.0.1 revision section 8.3.3.3 & 4.2.4 for data rates
of 8.0 GT/s, 16.0 GT/s, 32.0 GT/s, and 64.0 GT/s, there is a way to
configure lane equalization presets for each lane to enhance the PCIe
link reliability. Each preset value represents a different combination
of pre-shoot and de-emphasis values. For each data rate, different
registers are defined: for 8.0 GT/s, registers are defined in section
7.7.3.4; for 16.0 GT/s, in section 7.7.5.9, etc. The 8.0 GT/s rate has
an extra receiver preset hint, requiring 16 bits per lane, while the
remaining data rates use 8 bits per lane.

Based on the number of lanes and the supported data rate, read the
device tree property and stores in the presets structure.

Based upon the lane width and supported data rate update lane
equalization registers.

This patch depends on the this dt binding pull request which got recently
merged: https://github.com/devicetree-org/dt-schema/pull/146

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v8:
- Couple of nits by (bjorn & mani)
- Add EQ_PRESET_8GTS by (mani).
- Remove the logic not to update the DWC registers if the num_lanes is
  not equal to maximum lanes (mani)
- Link to v7: https://lore.kernel.org/r/20250225-preset_v6-v7-0-a593f3ef3951@oss.qualcomm.com

Changes in v7:
- Update the 16bit array in the array (mani & konrad)
- Update the couple of nits (comments, error log format etc) (mani)
- remove !num_lanes check as this is not needed with this series (mani)
- Add warning prints if the data rate is not supported and if there is
  no devicetree property for the data rate (mani).
- Link to v6: https://lore.kernel.org/r/20250210-preset_v6-v6-0-cbd837d0028d@oss.qualcomm.com

Changes in v6:
- update the dt properties to match the lane width ( mani & konard)
- move everything to helper function and let the helper function
  determine reg size and offset (mani)
- update the function header (mani)
- move the num_lanes check to the main function (mani)
- Link to v5: https://lore.kernel.org/linux-kernel/20250128-preset_v2-v5-0-4d230d956f8c@oss.qualcomm.com/

Changes in v5:
- Instead of using of_property_present use return value of
  of_property_read_u8_array to know about property is present or not and
  add a macro for reserved value(Konrad).
- Link to v4: https://lore.kernel.org/r/20250124-preset_v2-v4-0-0b512cad08e1@oss.qualcomm.com

Changes in v4:
- use static arrays for storing preset values and use default value 0xff
  to indicate the property is not present (Dimitry & konrad).
- Link to v3: https://lore.kernel.org/r/20241223-preset_v2-v3-0-a339f475caf5@oss.qualcomm.com

Changes in v3:
- In previous series a wrong patch was attached, correct it
- Link to v2: https://lore.kernel.org/r/20241212-preset_v2-v2-0-210430fbcd8a@oss.qualcomm.com

Changes in v2:
- Fix the kernel test robot error
- As suggested by konrad use for loop and read "eq-presets-%ugts", (8 << i)
- Link to v1: https://lore.kernel.org/r/20241116-presets-v1-0-878a837a4fee@quicinc.com

---
Krishna Chaitanya Chundru (4):
      arm64: dts: qcom: x1e80100: Add PCIe lane equalization preset properties
      PCI: of: Add of_pci_get_equalization_presets() API
      PCI: dwc: Update pci->num_lanes to maximum supported link width
      PCI: dwc: Add support for configuring lane equalization presets

 arch/arm64/boot/dts/qcom/x1e80100.dtsi            | 11 ++++
 drivers/pci/controller/dwc/pcie-designware-host.c | 63 +++++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-designware.c      |  8 +++
 drivers/pci/controller/dwc/pcie-designware.h      |  4 ++
 drivers/pci/of.c                                  | 44 ++++++++++++++++
 drivers/pci/pci.h                                 | 32 +++++++++++-
 include/uapi/linux/pci_regs.h                     |  3 ++
 7 files changed, 164 insertions(+), 1 deletion(-)
---
base-commit: 3175967ecb3266d0ad7d2ca7ccceaf15fa2f15e2
change-id: 20250210-preset_v6-1e7f560d13ad

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


