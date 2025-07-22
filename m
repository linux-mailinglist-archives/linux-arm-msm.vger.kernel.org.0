Return-Path: <linux-arm-msm+bounces-66118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED257B0DF76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 16:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B43657B382E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 14:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4B12ECE8A;
	Tue, 22 Jul 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A3mPqrWL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3A32EBBB7;
	Tue, 22 Jul 2025 14:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753195799; cv=none; b=cHEmNku/tzazmlFXpoh8AhRm7jtAg0+reWHt2FCcO8OtJHTHuBqInpOU8mnQtWDsSzQBT4oXTiOcGD6HH9M7ggM+9nGQsmehwG2utQ4Hg3mZr2homRoReQR7/rLGatjFLb4gfeg9d0M+n74Io+ZtoUYWwCCvoP5d4K37qvzLcwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753195799; c=relaxed/simple;
	bh=Gkijum+/cF05sdiirQp7PG6Bg9YiZtxdPAssIVYMGdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oA3EZG8gm1WlLCm2T7hMl87hp/IWaXHIPquwaMCk+pae2qyB2PrgJ8So2KNwZv80ysTXq0ON7J9jy5fyx4HpJq6+z5zaxgbYVXnTJVHMWJUYvP4hAq4H1GlpXxR5dIbyFABZPcGn5KScq/yLOoRTrdgm+LA8jKGWdvRlful0+lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A3mPqrWL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7LToS013263;
	Tue, 22 Jul 2025 14:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=O/QsSZsXSgzmgVXTzIiUaQ2Gg9Y9QMw5v46
	xfMg3alU=; b=A3mPqrWLgz0TtUFAeIWsbBq++pfUlEHKYEVgeySFY864VYMyWiz
	fCYkCjtd3+xRPV3ZFTyHzJLmeHUhPvx3d7QsWrcD16/rEYuHEeVexqBvmnLb7HOM
	ow5S3CXlHTaf7Tjm4OmIJgnK/PIGgWh2teoDbmCS+9TW1XIQaP4Tl75zP+ExYfXa
	lCCnDmQYuvopfmPleazWG7wJNxP5LP0lob+ig78vjFGiLUuAz41kJDnPyKLy7oIx
	0tT5AgYNzhdY+NtlEiAtVskKtargqH0R9LMsKKhpqc1rm2R608WXS8MkjblozZA/
	M4eSInVxVs6gm6lpyAd1FBuFi/dVVtHCLYA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3emmw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 14:49:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56MEnlWm023766;
	Tue, 22 Jul 2025 14:49:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4804ekgevf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 14:49:47 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56MEnlWc023734;
	Tue, 22 Jul 2025 14:49:47 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 56MEnk17023728
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 14:49:47 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id D58A75B9; Tue, 22 Jul 2025 20:19:45 +0530 (+0530)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@oss.qualcomm.com, Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Subject: [PATCH 0/7] Refactor sa8775p/qcs9100 to common names lemans-auto/lemans
Date: Tue, 22 Jul 2025 20:19:19 +0530
Message-ID: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bQ2RvgxggAsLJMJLfpTNF3QyAA-8s_M4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEyMyBTYWx0ZWRfX5w3HvNbQndOj
 NSTJ7/ZfE/DmGaUg5M7jEL1T76Tn1ZBKoTKGOm/ImOF0k7zKZdHoavHhDSgmZhKjMJDkObWUN6O
 G51uFPTiupj3ChuLvhiZ50iscoCbLO3kbfe8NDxprL/ZvlUX17df1rr+jQAA7ZOQWHIVb8F7zRu
 rt1JYebMw+78ig+1s9U+i6dbNCJvqMfUpeGpgDxmucbOTOXVXdP8G+aEbPK56FsQxvOoyTpsx9t
 pmOojkQQZtkg48mSI20rVMaMzFeNsXkbVSaO7oXOwzXx/Udm9iLRKf9Hij/uB64liXWfFUZbRwh
 iaFC2RydIbgY6+okmSW17F5NjgNLCcq7cctNlCDeJ4/DjFL+xnwiMwxF7tuxd5SO/EGjGLB9+7H
 793QIjIxLwJIsXHAUpsQoiALIuST+LxPhbDgL8QRYafa8dUgbbu81WP903lhiOe3fUEDVRW7
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=687fa510 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=RWv2qh-SFfS6v_r1XzEA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: bQ2RvgxggAsLJMJLfpTNF3QyAA-8s_M4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220123

This patch series refactors the sa8775p and qcs9100 platforms and introduces
a unified naming convention for current and future platforms (qcs9075).

The motivation behind this change is to group similar platforms under a
consistent naming scheme and to avoid using numeric identifiers.
For example, qcs9100 and qcs9075 differ only in safety features provided by
the Safety-Island (SAIL) subsystem but safety features are currently
unsupported, so both can be categorized as the same chip today.

Since, most of our platforms are IoT-based so "lemans" can be served as the
default IoT variant, with "lemans-auto" derived from it. Accordingly:
  - qcs9100/qcs9075 and its associated IoT platforms are renamed to lemans
    which needs different memory-map. So, latest memory-map is updated
    here as per IOT requirements.
  - sa8775p and its associated platforms are renamed to "lemans-auto", which
    is derived from "lemans", that retains the old automotive memory map to
    support legacy use cases.
  - Both lemans & lemans-auto are serving as non-safe chip and if needed
    additional dtsi can be appended in the future to enable safety features.

Additionally:
  - Refactor common daughter cards used in Ride/Ride-R3 platforms into a
    common configuration. Also, introduce new files for different ethernet
    capabilities in Ride/Ride-r3. Since Ethernet functionality in Ride/Ride-r3
    is currently broken upstream, this patch focuses only on refactoring.
  - Include support for qcs9075 EVK[1] platform as lemans-evk. Currently,
    basic features are enabled supporting 'boot to shell'.
  - Remove support for qcs9100-ride, as no platform currently exists for it.

Funtional impact to current boards with refactoring:
  - No functional change on auto boards i.e sa8775p ride/ride-r3 boards
    (renamed as lemans-auto ride/ride-r3), and it is verified by comparing
    decompiled DTB (dtx_diff).
  - qcs9100 ride-r3 (renamed as lemans-ride-r3) is having new memory-map
    and rest other functionalities are still same.

[1] https://lore.kernel.org/all/20250612155437.146925-1-quic_wasimn@quicinc.com/


---
Wasim Nazir (7):
  arm64: dts: qcom: Rename sa8775p SoC to "lemans"
  arm64: dts: qcom: Update memory-map for IoT platforms in lemans
  arm64: dts: qcom: lemans: Separate out ethernet card for ride &
    ride-r3
  arm64: dts: qcom: lemans: Refactor ride/ride-r3 boards based on
    daughter cards
  arm64: dts: qcom: lemans: Rename boards and clean up unsupported
    platforms
  dt-bindings: arm: qcom: Refactor QCS9100 and SA8775P board names to
    reflect Lemans variants
  arm64: dts: qcom: Add lemans evaluation kit (EVK) initial board
    support

 .../devicetree/bindings/arm/qcom.yaml         |  16 +-
 arch/arm64/boot/dts/qcom/Makefile             |   8 +-
 ...8775p-ride.dts => lemans-auto-ride-r3.dts} |  44 +--
 ...{qcs9100-ride.dts => lemans-auto-ride.dts} |  14 +-
 arch/arm64/boot/dts/qcom/lemans-auto.dtsi     | 104 +++++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       | 291 ++++++++++++++++++
 .../{sa8775p-pmics.dtsi => lemans-pmics.dtsi} |   0
 ...775p-ride.dtsi => lemans-ride-common.dtsi} | 168 ----------
 .../qcom/lemans-ride-ethernet-88ea1512.dtsi   | 205 ++++++++++++
 .../qcom/lemans-ride-ethernet-aqr115c.dtsi    | 205 ++++++++++++
 ...qcs9100-ride-r3.dts => lemans-ride-r3.dts} |  12 +-
 .../dts/qcom/{sa8775p.dtsi => lemans.dtsi}    |  75 +++--
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts  |  47 ---
 13 files changed, 884 insertions(+), 305 deletions(-)
 rename arch/arm64/boot/dts/qcom/{sa8775p-ride.dts => lemans-auto-ride-r3.dts} (11%)
 rename arch/arm64/boot/dts/qcom/{qcs9100-ride.dts => lemans-auto-ride.dts} (18%)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-auto.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk.dts
 rename arch/arm64/boot/dts/qcom/{sa8775p-pmics.dtsi => lemans-pmics.dtsi} (100%)
 rename arch/arm64/boot/dts/qcom/{sa8775p-ride.dtsi => lemans-ride-common.dtsi} (87%)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-ride-ethernet-88ea1512.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-ride-ethernet-aqr115c.dtsi
 rename arch/arm64/boot/dts/qcom/{qcs9100-ride-r3.dts => lemans-ride-r3.dts} (36%)
 rename arch/arm64/boot/dts/qcom/{sa8775p.dtsi => lemans.dtsi} (99%)
 delete mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts


base-commit: 05adbee3ad528100ab0285c15c91100e19e10138
--
2.49.0


