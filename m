Return-Path: <linux-arm-msm+bounces-20144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2608CB3AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 20:41:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86A21B20DAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 18:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC9D21494DE;
	Tue, 21 May 2024 18:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YJh/HUGQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DE6149000;
	Tue, 21 May 2024 18:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716316848; cv=none; b=oIIuOH+m1i0Eackbi/o0nFPuCydW7PFVyuaPtlfG4bPGB7FrCS2Gu0glmybasiVFODn+Eai7i+V9D7VT0bsc9or1Qf0shxmbA4de0ZEYyozF91wGnkfV/o2Vokya5qR+c7Yvw9kM1ElF6PUUUltQJcPtkwZIDhXe1sMXKBFp9S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716316848; c=relaxed/simple;
	bh=e4ygBOINpSdwHF3mQDHTXQMBIQSSSq90dYAi2ZOVZhY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=i37e45fyaIXRC40uyltZGp/CuUu+/vfUBKvWe4KctIZVLfeePDsXVXEgKN3kt7SSqDrdRm1qmqCTullMR9MYcZW0KrzGNfn0AGWgj4lcEHTfCL4mP3H9r4nSOBuWhgjSaCLdLvB/dz05UVwcxiPdg/NiPyxPL16tFRSpj/0OB+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YJh/HUGQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LE68Rb014675;
	Tue, 21 May 2024 18:38:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding:to:cc; s=qcppdkim1; bh=4uSXdFfximv0oQ
	RetrCZeXvAHa7zXbz/Qsqp9yfbIzk=; b=YJh/HUGQPHEuMOluteBSc6E/u5nC3i
	0/jEjrs9NsJGvkSDD9T8pxVTCE8/qLYkqSti30bPAsahNg8SuTeHU05Tt+C8ye0z
	6S7KNrabP6WHVFje9pdXjn0tbLJyX8wskGxLwb6I76QQHvcuiT8BQTjDGKIH6Lyo
	DXkdEyiaG30gFnmbebyehWcxpbOL3NAIE77VXs4tqAzomZrGaHXdMYsFOzWgpgqb
	5lmviy1u7KoMnHFjOb1gTuqc/JqP4tygm1sX8xCRE0TNL09gYzcJdeZlYH6fbU2b
	pYS2PnZibUn+AznbEr9qpGpi6SYaXcbLtdGDlPeK7cKOHipE1LU7cCZA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pqc6mbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 18:38:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44LIcPnt014421
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 18:38:25 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 21 May 2024 11:38:24 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
Subject: [PATCH RFC v3 0/9] dt-bindings: hwinfo: Introduce board-id
Date: Tue, 21 May 2024 11:37:57 -0700
Message-ID: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAXqTGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIxMDQ0Mj3aT8xKIUoGCxroWBZVqagZGFYWqqqRJQfUFRalpmBdisaKUgN2e
 l2NpaALIGQPFgAAAA
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>
CC: Amrit Anand <quic_amrianan@quicinc.com>,
        Peter Griffin
	<peter.griffin@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        "Andy
 Gross" <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Doug
 Anderson" <dianders@chromium.org>,
        Simon Glass <sjg@chromium.org>, "Chen-Yu
 Tsai" <wenst@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        "Humphreys,
 Jonathan" <j-humphreys@ti.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        "Jon
 Hunter" <jonathanh@nvidia.org>,
        Michal Simek <michal.simek@amd.com>,
        <boot-architecture@lists.linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        Elliot Berman <quic_eberman@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iMkoVwtpieLMiTIoo9Lf7718t7nbtrTW
X-Proofpoint-GUID: iMkoVwtpieLMiTIoo9Lf7718t7nbtrTW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_11,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405210140

Device manufacturers frequently ship multiple boards or SKUs under a
single software package. These software packages will ship multiple
devicetree blobs and require some mechanism to pick the correct DTB for
the board the software package was deployed. Introduce a common
definition for adding board identifiers to device trees. board-id
provides a mechanism for bootloaders to select the appropriate DTB which
is vendor/OEM-agnostic.

This series is based off a talk I gave at EOSS NA 2024 [1]. There is
some further discussion about how to do devicetree selection in the
boot-architecture mailing list [2].

[1]: https://sched.co/1aBFy
[2]: https://lists.linaro.org/archives/list/boot-architecture@lists.linaro.org/thread/DZCZSOCRH5BN7YOXEL2OQKSDIY7DCW2M/

Quick summary
-------------
This series introduces a new subnode in the root:
/ {
	board-id {
		some-hw-id = <value>;
		other-hw-id = <val1>, <val2>;
	};
};

Firmware provides a mechanism to fetch the values of "some-hw-id" and
"other-hw-id" based on the property name. I'd like to leave exact
mechanism data out of the scope of this proposal to keep this proposal 
flexible because it seems architecture specific, although I think we we
should discuss possible approaches. A DTB matches if firmware can
provide a matching value for every one of the properties under
/board-id. In the above example, val1 and val2 are both valid values and
firmware only provides the one that actually describes the board. 

It's expected that devicetree's board-id don't describe all the
properties firmware could provide. For instance, a devicetree overlay
may only care about "other-hw-id" and not "some-hw-id". Thus, it need 
only mention "other-hw-id" in its board-id node.

Isn't that what the compatible property is for?
-----------------------------------------------
The compatible property can be used for board matching, but requires
bootloaders and/or firmware to maintain a database of possible strings
to match against or implement complex compatible string matching.
Compatible string matching becomes complicated when there are multiple
versions of board: the device tree selector should recognize a DTB that
cares to distinguish between v1/v2 and a DTB that doesn't make the
distinction.  An eeprom either needs to store the compatible strings
that could match against the board or the bootloader needs to have
vendor-specific decoding logic for the compatible string. Neither
increasing eeprom storage nor adding vendor-specific decoding logic is
desirable.

How is this better than Qualcomm's qcom,msm-id/qcom,board-id?
-------------------------------------------------------------
The selection process for devicetrees was Qualcomm-specific and not
useful for other devices and bootloaders that were not developed by
Qualcomm because a complex algorithm was used to implement. Board-ids
provide a matching solution that can be implemented by bootloaders
without introducing vendor-specific code. Qualcomm uses three
devicetree properties: msm-id (interchangeably: soc-id), board-id, and
pmic-id.  This does not scale well for use casese which use identifiers,
for example, to distinguish between a display panel. For a display
panel, an approach could be to add a new property: display-id, but now
bootloaders need to be updated to also read this property. We want to
avoid requiring to update bootloaders with new hardware identifiers: a
bootloader need only recognize the identifiers it can handle.

Notes about the patches
-----------------------
In my opinion, most of the patches in this series should be submitted to
libfdt and/or dtschema project. I've made them apply on the kernel tree
to be easier for other folks to pick them up and play with them. As the
patches evolve, I can send them to the appropriate projects.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
Changes in v3:
 - Follow new "/board-id {}" approach, which uses key-value pairs
 - Add match algorithm in libfdt and some examples to demo how the
   selection could work in tools/board-id

Changes in V2:
 - Addressed few comments related to board-id, and DDR type.
 - Link to V2:  https://lore.kernel.org/all/a930a3d6-0846-a709-8fe9-44335fec92ca@quicinc.com/#r

---
Amrit Anand (1):
      dt-bindings: arm: qcom: Update Devicetree identifiers

Elliot Berman (8):
      libfdt: board-id: Implement board-id scoring
      dt-bindings: board: Introduce board-id
      fdt-select-board: Add test tool for selecting dtbs based on board-id
      dt-bindings: board: Document board-ids for Qualcomm devices
      arm64: boot: dts: sm8650: Add board-id
      arm64: boot: dts: qcom: Use phandles for thermal_zones
      arm64: boot: dts: qcom: sm8550: Split into overlays
      tools: board-id: Add test suite

 .../devicetree/bindings/board/board-id.yaml        |  24 ++++
 .../devicetree/bindings/board/qcom,board-id.yaml   | 144 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 arch/arm64/boot/dts/qcom/pm8010.dtsi               |  62 ++++-----
 arch/arm64/boot/dts/qcom/pm8550.dtsi               |  32 ++---
 arch/arm64/boot/dts/qcom/pm8550b.dtsi              |  36 +++--
 arch/arm64/boot/dts/qcom/pm8550ve.dtsi             |  38 +++---
 arch/arm64/boot/dts/qcom/pm8550vs.dtsi             | 128 +++++++++--------
 arch/arm64/boot/dts/qcom/pmr735d_a.dtsi            |  38 +++---
 arch/arm64/boot/dts/qcom/pmr735d_b.dtsi            |  38 +++---
 .../dts/qcom/{sm8550-mtp.dts => sm8550-mtp.dtso}   |  24 +++-
 .../dts/qcom/{sm8550-qrd.dts => sm8550-qrd.dtso}   |  22 ++-
 .../boot/dts/qcom/{sm8550.dtsi => sm8550.dts}      |  10 +-
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts            |   6 +
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |   6 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |   2 +-
 include/dt-bindings/arm/qcom,ids.h                 |  86 ++++++++++--
 scripts/dtc/.gitignore                             |   1 +
 scripts/dtc/Makefile                               |   3 +-
 scripts/dtc/fdt-select-board.c                     | 126 +++++++++++++++++
 scripts/dtc/libfdt/fdt_ro.c                        |  76 +++++++++++
 scripts/dtc/libfdt/libfdt.h                        |  54 ++++++++
 tools/board-id/test.py                             | 151 +++++++++++++++++++++
 23 files changed, 901 insertions(+), 210 deletions(-)
---
base-commit: e8f897f4afef0031fe618a8e94127a0934896aba
change-id: 20240112-board-ids-809ff0281ee5

Best regards,
-- 
Elliot Berman <quic_eberman@quicinc.com>


