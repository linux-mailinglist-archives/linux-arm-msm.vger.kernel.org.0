Return-Path: <linux-arm-msm+bounces-73679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 620BCB59404
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 12:47:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C24F61B249AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 10:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4322877D3;
	Tue, 16 Sep 2025 10:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q9XWoNn2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7473217722
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758019627; cv=none; b=fMqtTyd1RLyc9ZuM/sH2dKkh+I6OCZ86KllenFgaB25dDquzcRFULZtiEAfLcZvBTY8Bk3PKqQ+e41qMS/9HvnIuV5bOl4QYtROV8nJy+vee/+hnncZknwSV6ZjdA6RODBNBlolbRupyX9zYyV7Zaqiyv5JyqvNlY0+wHEnYnmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758019627; c=relaxed/simple;
	bh=1mI9ppTa+alHrPD8MYXRGEIzIpbRXrOmPpVue9Aa508=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QLrgfQjcgxkoeQ4hroLG1zQxsR1LqwYPs4vZpJM5IMVQN0svYI0jNSAGCbWHx3xlExTGEaDkRsdSwmqRi+FbnEP+UrMd28iUCDyBlvqnJBXUuSGWUMC90kgqWQpAElEXaR/DdLtyB4DGe66QdjP6xmj495phua628eZeLl+mmmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q9XWoNn2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA2ovs005547
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=k+LD0lfDicHs3z0SKSGb6Y
	rFHfIbrIvaBcdAM/oP0EE=; b=Q9XWoNn2Clg1BECWteCsjA9Fo6+cLaOJ67qqzR
	dV/Yw2dxtMC4WS37OIp/bCig7378ag75I/0iBrvsI6f2Jl/YVzOCod5pGWazCfJ6
	DvUnvWg+cm0dAg+KAiFk3xnPpDjwZTf3KrzbEhhguXi1vXRrJSc2Fv2sUMq2qu4C
	NV6s4oqrdYK5RlWoKpLBEjvmINgw0TbkEWU4aJPQCDwUcM2LjqfRWKb3Rl0GsXYC
	EVTaFMkF+/Zl0KR9+lQFR1Vkt76c5OVNdPRQJ/sAHnUjWIh9BjGpKlih/kHAlnUJ
	Hy6CvpMgFoq9H4EeJNfSq6QEM4Xnd4MqKRT/9oV75FLfunUA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950u58gax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:47:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24458345f5dso64766635ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 03:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758019624; x=1758624424;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+LD0lfDicHs3z0SKSGb6YrFHfIbrIvaBcdAM/oP0EE=;
        b=R1FuYaBsrj4L9KUZiuDmaeCDLGc0/CsW4NvZyUMjSEwAUTu4azBsphEDOWGznjwUH9
         7S6Jm4m8vJfzt/4PHLOQLN1+MOuznNZakbiKqzT+jEsOUHEnOSnVyEsHx9CLxP/yu9Sp
         oabdsFsZhUgyPBH0qNjuxCqDXx8Mq7tmwOZVWyqJ9anvxfWiPRvQ9g//sPx/sr21WFjq
         c7JhiDyHAVngRugiE+fEdTgbHdyRx9RsjR7cyh165NHSNd7ZgFIWJ6KbCcdg0FL65quI
         vRSpFPspP4CxYSqUIOampqAkZjj81jXSfPPAv6+7ZwNoKGmPRQeP+Gp9kpOHQLGAcLmY
         Ockg==
X-Forwarded-Encrypted: i=1; AJvYcCXwfvu7QP7Bt7C3fGP8F2AZoJncFvzc31AoEYTeo6TgDmmrVarW43unV4sbzToJVk4huzIdnbqXy6Gc1IWA@vger.kernel.org
X-Gm-Message-State: AOJu0YxSmG+Lnm1SxkeTVh+9hzQ4U1GaxmvHgMvdCxWx7yFHO9llwLHz
	/RfwgkWWlBFg2GJkQtwdqHwLFxT7rZgmcXCpNn695z5K/WgJh2JRn9x4L6fOW5xZrRYaIV1br6/
	FLR5UwTU06fLjR0a1MvfYfeMLnmcf3iU3GF41WaCEWZ3lO/+ajkPoQ4h7eM7/s4oxp6nu
X-Gm-Gg: ASbGncsqv8Aa6Woc04lFe7BBMcA1AywcmY8uDb7LlChQenzrP/TxdafKrkbb2+bFbDE
	Z3GKUrM7MbcJGNZiISQFXkUQhrVhoQxbJUS3/gPGBc6N9beci23PTMJx4cu4UdWUJVsVyPW+GJD
	cslbEuJ//Ug8wFEuDtg3V3gd3RfTSXGjny+uxB4yg1zFwgVoqDEyZEjaEhsLJ51HFS+YSLC5OF+
	1DRlCyf5TWjBncluW5D6hLTYybJlydi0d1OIeplUrmvlPk1BgedIWBnx5CuWfO/K7ems+X5q8bu
	ihXDk/RoD2W37wlhdJC4qQKeJ9SjxrRe0pb+ZQfUuncoAC1wnZEU/oA8jh8OrTgPRTnr
X-Received: by 2002:a17:902:cf10:b0:266:f01a:98d5 with SMTP id d9443c01a7336-266f01a9b37mr87189885ad.57.1758019623764;
        Tue, 16 Sep 2025 03:47:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd/ah4dRhxyJBnbbxfbJnqOEDhCK+vtcEnddej+JXs/E1YTJglxqY6A1uv8NoQtF7AGesKgw==
X-Received: by 2002:a17:902:cf10:b0:266:f01a:98d5 with SMTP id d9443c01a7336-266f01a9b37mr87189535ad.57.1758019623269;
        Tue, 16 Sep 2025 03:47:03 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-267b2246d32sm33122355ad.143.2025.09.16.03.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:47:02 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Subject: [PATCH v5 00/10] arm64: dts: qcom: lemans-evk: Extend board
 support for additional peripherals
Date: Tue, 16 Sep 2025 16:16:48 +0530
Message-Id: <20250916-lemans-evk-bu-v5-0-53d7d206669d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABhAyWgC/3XPSwrCMBCA4atI1qbk0dTUlfcQF0k6tcE+tLFBK
 b270yIoRTcD/8B8MCMJ0HsIZL8ZSQ/RB9+1GGq7Ia4y7RmoL7CJYEIxzVNaQ2PaQCFeqB0oOMa
 Vg5RpBgRvrj2U/rF4xxN25cO9658LH/m8fUsiW0mRU0aR4RmwQjpQhy6E5DaY2nVNk+AgMxjFB
 8mZXCMCEVsaqbkttTXiDyK/kfVPUSKirTXG8VIo0H+Q9BvRayRFRDnJc5flmdkVP5Bpml71hwn
 ggAEAAA==
X-Change-ID: 20250814-lemans-evk-bu-ec015ce4080e
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Sushrut Shree Trivedi <quic_sushruts@quicinc.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758019616; l=4914;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=1mI9ppTa+alHrPD8MYXRGEIzIpbRXrOmPpVue9Aa508=;
 b=SaRI+OQmMd3thxlP9vYKNdZw7W7qiuyLpzxw8uSxYM/n491tcIj81KrlCFhIdxQqKhVMpBj+B
 MGqY8U+u50TDJrTRb5ojGS5VnOZH4v+dYHOxfAiP0bl1knzVoFTmFXY
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: CUh-Txkml91-rrRQWMhya4CHQ4929JF8
X-Proofpoint-ORIG-GUID: CUh-Txkml91-rrRQWMhya4CHQ4929JF8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMSBTYWx0ZWRfX23cKArWWSGbH
 s0+f0cUZ6cVTTmjFCmBgm1HByiU4O+rnfwkknSNaSQejtQ2VpoeooIHkiG3T07nMSkrkKvp6WhH
 YjZ4hNns8jHopQXQRh3E6JncYPD2GM+V7BAL9RhEN110Y93i7CvrOpt3cKBecPmBKG1PukwA5O8
 X3t3GVmz4gwEefQO8FJUM8bHLsnPpvqIx85L04Vj/sttLCl80wOUn/eUfYsRsAtmdzc3Jjld4ys
 3k6avYIX9KzWQAuqqCHudm7jezildIV2Dn0SlRbpD4K9oJymGLzEUx+B3p2MRP3/nLn8yWseEUR
 +UCkPA31criQK92/ioqez2uUrEuAgLg8WHv5+I+7jg41jowLOUL6lZILwc+HBDOlWcSWkCm+TW2
 hYxP6mY9
X-Authority-Analysis: v=2.4 cv=JvzxrN4C c=1 sm=1 tr=0 ts=68c94028 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=UzDb-niT3-dnCAiDllkA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130031

This series extend support for additional peripherals on the Qualcomm
Lemans EVK board to enhance overall hardware functionality.

It includes:
  - New peripherals like:
    - I2C based devices like GPIO I/O expander and EEPROM.
    - GPI (Generic Peripheral Interface) DMA controllers and QUPv3 controllers
      for peripheral communication.
    - PCIe HW with required regulators and PHYs.
    - Remoteproc subsystems for supported DSPs.
    - Iris video codec.
    - First USB controller in device mode.
    - SD card support on SDHC v5.
    - Qca8081 2.5G Ethernet PHY.

Dependency:
  - The ethernet PHY QCA8081 depends on CONFIG_QCA808X_PHY, without
    which ethernet will not work.

---
Changes in v5:
- Dropping these changes from the series, as they are already part of
  linux-next:
  - Audio change [1]
  - MMC dt-bindings change 01/14 (v4)
  - EEPROM dt-bindings change 05/14 (v4)
- Change bias to 'pull-up' for PCIe 'perst-pins' - Konrad.
- Link to v4: [2]

[1] https://lore.kernel.org/linux-arm-msm/20250822131902.1848802-1-mohammad.rafi.shaik@oss.qualcomm.com/
[2] https://lore.kernel.org/r/20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com

Changes in v4:
- Move 'bus-width' property of SDHC to Board DT and also keep the width
  to 4 bits - Dmitry/Konrad.
- Update commit text of eeprom bindings to describe the reason for the
  change 05/14 (v3) - Dmitry.
- Bring all tags from v3.
- Link to v3: https://lore.kernel.org/r/20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com

Changes in v3:
- Re-order QUP patch 05/13 (v2) to not break i2c node enablement in patch
  03/13 (v2) - Dmitry.
- Update commit text for QUP patch to highlight which all clients each
  QUP is accessing.
- Add dedicated compatible for Giantec EEPROM, because usage of generic
  compatible "atmel,24c256" alone is not advised.
- Update commit text for EEPROM patch 04/13 (v2) to emphasize on EEPROM
  enablement - Konrad.
- Put 'reg' property after 'compatible' in Expander - Konrad.
- Put 'pinctrl-names' after 'pinctrl-n' in PCIe - Konrad.
- SDHC:
    - Update interconnect nodes with ICC_TAG macro - Konrad.
    - Put new lines for each entry in interrupt-names, clock-names,
      interconnect-names - Konrad.
    - Put bias properties below drive-strength for consistency in
      sdc-default-state - Konrad.
    - Move 'bus-width' property to SOC DT - Konrad.
    - Move 'no-mmc' and 'no-sdio' properties to board DT - Dmitry/Konrad.
- Add 'Reviewed-by' tag from Konrad [3] on Audio patch 13/13 (v2),
  although the commit text is changed now.
- Link to v2: [4]

[3] https://lore.kernel.org/linux-arm-msm/b4b6678b-46dd-4f57-9c26-ff0e4108bf79@oss.qualcomm.com/
[4] https://lore.kernel.org/r/20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com

Changes in v2:
- Split the patch 3/5 in v1 into separate patch per author - Bjorn.
- Use generic node names for expander - Krzysztof.
- Change video firmware to 16MB comapatible - Dmitry.
- SDHC:
    - Arrange SDHCI-compatible alphanumerically - Dmitry.
    - Move OPP table and power-domains to lemans.dtsi as these are
      part of SoC.
    - Move bus-width to board file - Dmitry.
    - Change 'states' property to array in vreg_sdc and also re-arrange
      the other properties.
- Remove the redundant snps,ps-speed property from the ethernet node as
  the MAC is actually relying on PCS auto-negotiation to set its speed
  (via ethqos_configure_sgmii called as part of mac_link_up).
- Refine commit text for audio patch - Bjorn.
- Link to v1: https://lore.kernel.org/r/20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com

---
Krishna Kurapati (1):
      arm64: dts: qcom: lemans-evk: Enable first USB controller in device mode

Mohd Ayaan Anwar (1):
      arm64: dts: qcom: lemans-evk: Enable 2.5G Ethernet interface

Monish Chunara (3):
      arm64: dts: qcom: lemans: Add SDHC controller and SDC pin configuration
      arm64: dts: qcom: lemans-evk: Add EEPROM and nvmem layout
      arm64: dts: qcom: lemans-evk: Enable SDHCI for SD Card

Nirmesh Kumar Singh (1):
      arm64: dts: qcom: lemans-evk: Add TCA9534 I/O expander

Sushrut Shree Trivedi (1):
      arm64: dts: qcom: lemans-evk: Enable PCIe support

Vikash Garodia (1):
      arm64: dts: qcom: lemans-evk: Enable Iris video codec support

Viken Dadhaniya (1):
      arm64: dts: qcom: lemans-evk: Enable GPI DMA and QUPv3 controllers

Wasim Nazir (1):
      arm64: dts: qcom: lemans-evk: Enable remoteproc subsystems

 arch/arm64/boot/dts/qcom/lemans-evk.dts | 365 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi    |  92 ++++++++
 2 files changed, 457 insertions(+)
---
base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
change-id: 20250814-lemans-evk-bu-ec015ce4080e

Best regards,
--  
Wasim Nazir <wasim.nazir@oss.qualcomm.com>


