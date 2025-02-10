Return-Path: <linux-arm-msm+bounces-47365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B08A7A2E566
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 08:30:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FC101642C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 07:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636A61BBBC6;
	Mon, 10 Feb 2025 07:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nxzkasaS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07F11B6CF5
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 07:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739172629; cv=none; b=Qyt9Kmg/vrMb4klUxlUTZvk6DgduSJD7hYSicFGZG7Whx8nTIW+rXk5KJlFWvJfof7f6X4F2ZPZTr1PDiNyVWuQpIAZYYtxxkUr7nFFIJ6cMxpb9GndrlvPwXIMhXDDW5Bjgs1rCjlpnDJs0OETrG10AdJMNZbszfYjlhSBQRY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739172629; c=relaxed/simple;
	bh=slLhMpSJJdwndSGj43LuZJR6xaoQ2VL4N7qxs/1ccWs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K1f/SFgFPiC/ABDZlMiE7Pj2XHPMuAFvTm5SmxzprvHT0cQKkzRb3Ejl2Zw496Ejnd+nZMacj8rSJSzAJVJsWBNIUtYfzfGGZGh6djuxEhvl7dafGBfUnVDjKdEoFFAkwpgbjm2DkCR44JcXx3FrsA5hD1CX6FLe1Tp2o1GbYJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nxzkasaS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A0Gkp7014454
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 07:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2N44XOUfRsiL9wdoBfQENr
	t7OwM73cjB5lGkBRnELKU=; b=nxzkasaSjzpAKeHrONU+HG2H87p9LHxB9QyCEZ
	eiPEy2mtx+Vyli0gf9rJLg64mOGhe4cRioyeaHecOAyGlMxTFX8MeWOzMqdjKpQV
	PwdZIJ9OkKZ0x2+0O3OnRfUi3B02ddX+GHorvyO5wASQ6V9Eq8A8nybrRwkN9hy9
	i4kP+NBys0vDVjwKFZYOCz7bKGRs4zZ3seBSSgqQDgtng2jo1VRPdRYqn7bFJeZF
	GiKx2dawKMePlY+ewSaktQzygBNyhi42QQbZkhfmL/d9rUSYk4mVPHx4UkuumDyI
	iEqVG88NFf5cPqIU4z6hAnyq+qAnIlGWrxYBD7H6NYL4KCcA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0e1kduj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 07:30:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fa38f90e4dso7055377a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Feb 2025 23:30:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739172618; x=1739777418;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2N44XOUfRsiL9wdoBfQENrt7OwM73cjB5lGkBRnELKU=;
        b=CYLy7cMl3xoj8LtyEgDXKQDKyxZI1jXMHPQEcrDq5SGdlMwL4+1nLOx4bT8EMWKill
         Fm7VquUPMQKzpF/Kt97913Za3Co5nKbJauBzvGG+ejWhXbvfzs2L0HwT04EKGjc6cm5F
         yM/5lo/dpesTw4AEHCeWhQZIh2tfll+vyffUbAyRAuZmmeZ2knk5izrEWt6ojAFYUerX
         IPhuXyIe6Jna8dqrWJ4OXCEExnUqRFLgQY3AsrCwfz9EY2IEwAXl+5oOO56mDdy9jqOu
         KsezPz1wEvedLXnyIBVITPvP48d6InLH7qcYojcRr+pd3tgWBR0dPUkbhAvaP72iBpDP
         +HcQ==
X-Gm-Message-State: AOJu0YzmiasfslTo2OGgcOmPpYNtE4ceRxo6MPao2/FdcwCEwg4YRsno
	kNah+5axvS7xQf4NoBRgOrFs70w/EDOvUbJSQUl4+LCKubjjpr5x446jwroLMO2MVkv6sDTHrox
	iN8Ak8cM1edFdAYI9ct79M6r4ClN4lE54X3+hGlJxFaTadx0iX+Ulq8rCYekGV2qV
X-Gm-Gg: ASbGncs8VpX99perl3cssUnDU1vTtLL65NL+G4bPrDQKotcQsFjtWdnEdpBDbdEjRux
	fGOPcnXHtvHGlapcgqlc97OLmi1F6Ep0XxX8jLxKL3Zr4/uD0E7oafHLD40q1bm+YUjqVQEMXlu
	EdSHq/Qp94/VtI+uokzD/5PIqlEBitgKyFUTL395yclfyqj1LC71WbBAkvm4OeQFGjWneivD8GM
	/JrjrsrdRBGmaz0712aAJ0KXtqwUBDy/b6Uxsz2K8FzIvR93dKSoQCfqWS5L0rlDKoctgIv9/IE
	C0KAsDPZnh8No4iqzpEZ0sKXBzgtSzGmUZNrwHHM
X-Received: by 2002:a17:90b:3e8a:b0:2ee:d797:40a4 with SMTP id 98e67ed59e1d1-2fa2406925bmr20502318a91.8.1739172617602;
        Sun, 09 Feb 2025 23:30:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGN4MPBj/gNkBJSl4K+uu0IlsMKlgud7xI9RdM/DkK2Nk+i4325OmVAwkbY/k1LkLrpv4l8SQ==
X-Received: by 2002:a17:90b:3e8a:b0:2ee:d797:40a4 with SMTP id 98e67ed59e1d1-2fa2406925bmr20502283a91.8.1739172617172;
        Sun, 09 Feb 2025 23:30:17 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a6fe28sm7918507a91.26.2025.02.09.23.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 23:30:16 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v6 0/4] PCI: dwc: Add support for configuring lane
 equalization presets
Date: Mon, 10 Feb 2025 12:59:59 +0530
Message-Id: <20250210-preset_v6-v6-0-cbd837d0028d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPeqqWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHQUlJIzE
 vPSU3UzU4B8JSMDI1MDI0MD3YKi1OLUkvgyM13DVPM0UzODFEPjxBQloHqgTFpmBdis6NjaWgD
 6TlWuWwAAAA==
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739172612; l=3582;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=slLhMpSJJdwndSGj43LuZJR6xaoQ2VL4N7qxs/1ccWs=;
 b=6jbZlKyuen3sErbah8kE22949DfBYXtgyzuwaUxenq72bkZkrEU2gdwJUybLu9B2j07m0m22p
 BIVkQnNmx03DgNGjz9vsNHQ27bDjvIjXuk6sZKHlqqP8p9M7+LKXeoN
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: gxEqeHh7tniySq459xjA9vteO7oKPiBv
X-Proofpoint-GUID: gxEqeHh7tniySq459xjA9vteO7oKPiBv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=974 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100062

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
      PCI: of: Add API to retrieve equalization presets from device tree
      PCI: dwc: Improve handling of PCIe lane configuration
      PCI: dwc: Add support for configuring lane equalization presets

 arch/arm64/boot/dts/qcom/x1e80100.dtsi            | 13 ++++++
 drivers/pci/controller/dwc/pcie-designware-host.c | 56 +++++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-designware.c      | 11 ++++-
 drivers/pci/controller/dwc/pcie-designware.h      |  4 ++
 drivers/pci/of.c                                  | 43 +++++++++++++++++
 drivers/pci/pci.h                                 | 27 ++++++++++-
 include/uapi/linux/pci_regs.h                     |  3 ++
 7 files changed, 155 insertions(+), 2 deletions(-)
---
base-commit: 3175967ecb3266d0ad7d2ca7ccceaf15fa2f15e2
change-id: 20250210-preset_v6-1e7f560d13ad

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


