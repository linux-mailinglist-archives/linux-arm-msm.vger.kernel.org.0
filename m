Return-Path: <linux-arm-msm+bounces-67578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F37B1939E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 13:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59BE518946D6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 11:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40CF25B687;
	Sun,  3 Aug 2025 11:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="McnLcJt8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC971EDA3C;
	Sun,  3 Aug 2025 11:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754218896; cv=none; b=dF6yd6iiH31bB81dBQ7ppyoSm4VwuD1vwqOZatcfvISmtH18CSCo7NDVtirehL6CtVEjfWnpJyHEQ/0B2kFTL3EMY+p2zi5Kxp943S8aSEVlChsOC9TZH4eidIMQHoQSbW7L3Onb946xQh+WB0RS//+WO5xeJbtLZLQK3iBDysI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754218896; c=relaxed/simple;
	bh=BdVTBhN250wTa71M7/gUoWp7//5kAG9/3AKLXJNIMB0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=szNvg82fKaa84vLQTQpoChID06nVmktXizZkblNUckWfAxHNl3WJJYbSm2xZiT7pHQjRzNDW5fFtPI8iEVhFhpv+6ZN4wjUiRg20JV7nh6K6kGTX+9MkNn7rl6hj0mEVwxymENh10m/PaKVCOwRnRtZYQTsxA7voIYfDlCnScbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=McnLcJt8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5738qlNi013051;
	Sun, 3 Aug 2025 11:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WO7SkMKcc1s18E6/eOurgl
	qFs8lDS/zAgVaiETXpg2Y=; b=McnLcJt8JH+6PGH23LNJZNlVVGdUGPkczNgTc4
	8JlA46hoAdi8/ik6nzYNzj+ZCWQWcIEk8JZ65wwg4aV0NzA77zqpte9FoPCItC2D
	zQcXcfM9qMUoRLxZodcuqB1Fs93aiFZA6QDB/pt54YUQ9Efn/EqVCEPU9udeL9Qf
	nCYLaEBOKVQ0B5iwRL1UDqMIGAuiUOVTyNQzVTbB7SmbHnVmAudsyjg8CJ0tfch0
	txjQYiDnKpPncwlCuvbdibOdfhgaYukq0izwpTYCtMCBHr01VpH4nfIj6q/Gs0wk
	Nu58aO7ys6dCcVVUpWccv9wSjZmQGKZJAb08pDW80x0izsqA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489a91t7rs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 11:01:23 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 573B1Jhg015300;
	Sun, 3 Aug 2025 11:01:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 489brke03q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 11:01:19 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 573B1JS2015273;
	Sun, 3 Aug 2025 11:01:19 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 573B1JSc015269
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 11:01:19 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 727FE5C1; Sun,  3 Aug 2025 16:31:18 +0530 (+0530)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@oss.qualcomm.com, Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Subject: [PATCH v2 0/8] arm64: dts: qcom: Lemans platform refactor and EVK support
Date: Sun,  3 Aug 2025 16:31:04 +0530
Message-ID: <20250803110113.401927-1-wasim.nazir@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hteD-uGUueQJ3sEEvvH0aI_K92W6W2-m
X-Proofpoint-GUID: hteD-uGUueQJ3sEEvvH0aI_K92W6W2-m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAzMDA3MyBTYWx0ZWRfXzTOgNGwNu8Kp
 GlKT5tP5vfvAzybzVPTFG2XUzPkGBEX5bSKz/sI0xIo9IDH8BrksB+Q23S5UBfgXTvuNLL8odYQ
 6JWOn7okrd1fuXocawG9JT0kXKZ8f0hLQ800v00PO1tlfAlPvjgkAHzn/jmL+arj1yP6RNUBOUh
 4V53qhZSCeiLXRU3FJ3RGN7rUfIyrNKJCAM73J6I0gJXnfGHRV5p0oyjQ0zA+0IuSL3f98YPj1w
 9E5atmOirg1fEJ1dwfShNvKOxLmn1MuAzX3jsQw5dMGtsMEZynel8/W9TEWSqXbwqDwROCJP3MP
 S1EH6XuXSJN6PWx+A3YmUMZoIk9O/TzI0ntVMnLpZ8ICsnflIj5ZTq4fD6qYEOO3TtizPX37WzH
 EGsWlNq8MEpGoikSjHLmxTODnZwPSSgAmafJVW6+dYMtxbtLISBvRWAKhbk8Bm3pvTnaVtMT
X-Authority-Analysis: v=2.4 cv=UdpRSLSN c=1 sm=1 tr=0 ts=688f4183 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=9VDwho1jAwe4TvJw1f4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_03,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508030073

This patch series introduces a comprehensive refactor and enhancement of
the Qualcomm Lemans platform device tree files, aiming to improve
clarity, modularity, and support for emerging IoT use cases. The
motivation behind this work stems from the need to unify DTS naming
conventions, streamline board support across multiple variants, and
to detach from different product names for similar variants.

For example, qcs9100 and qcs9075 differ only in safety features provided by
the Safety-Island (SAIL) subsystem but safety features are currently
unsupported, so both can be categorized as the same chip today.

To better support IoT platforms, the memory map has been restructured.
Previously, the automotive memory layout was applied universally, which
introduced unnecessary carveouts and misaligned memory regions for IoT
boards. By establishing the IoT memory map i.e lemans.dtsi as the baseline
and introducing lemans-auto.dtsi for legacy automotive configurations, the
series ensures that each platform inherits only what it needs.
Accordingly:
  - IoT platforms, qcs9100/qcs9075 are categorized as "lemans" with latest
    memory-map as per IOT requirements.
  - Automotive platform, sa8775p is categorized as "lemans-auto", that retains
    the old automotive memory map to support legacy use cases.
  - Both lemans & lemans-auto are serving as non-safe chip and if needed
    additional dtsi can be appended in the future to enable safety features.

Additionally:
  - Refactor common daughter cards used in Ride/Ride-R3 boards into a
    common configuration. Also, introduce new files for different ethernet
    capabilities in Ride/Ride-r3. Since Ethernet functionality in Ride/Ride-r3
    is currently broken upstream, this patch focuses only on refactoring.
  - Include support for qcs9075 EVK [1] board as lemans-evk. Currently,
    basic features are enabled supporting 'boot to shell'.

Funtional impact to current boards with refactoring:
  - No functional change on automotive boards (i.e sa8775p ride/ride-r3)
    and it is verified by comparing decompiled DTB (dtx_diff).
  - qcs9100 ride/ride-r3 are having a new memory-map and rest other
    functionalities are still same.


---
Changelog

v2:
  - Update the subject of the series [2] to reflect both the Lemans EVK
    addition and the broader Lemans refactoring. Also, revise the subject
    format to align with Qualcomm’s convention for DTS submissions
    (arm64: dts: qcom:).
  - Refine the cover letter to emphasize how detaching from product-specific
    names addresses previous limitations in supporting emerging IoT use cases.
  - Improve the commit message for patch 2/8 based on Bjorn’s feedback.
  - Remove board-renaming change to keep backward compatibility intact.
  - Include separate patch to fix DTS inclusion for IoT boards.
  - Change copyright format for patch 8/8 as per Krzysztof's feedback.
  - Carrying Krzysztof's NAK from v1 to only those patches which were preset,
    though tried to address the concern by retaining the DTB compatibility.
  - v1-link: [2].

[1] https://lore.kernel.org/all/20250612155437.146925-1-quic_wasimn@quicinc.com/
[2] https://lore.kernel.org/all/20250722144926.995064-1-wasim.nazir@oss.qualcomm.com/

---
Wasim Nazir (8):
  arm64: dts: qcom: Rename sa8775p SoC to "lemans"
  arm64: dts: qcom: lemans: Update memory-map for IoT platforms
  arm64: dts: qcom: lemans: Separate out ethernet card for ride &
    ride-r3
  arm64: dts: qcom: lemans: Refactor ride/ride-r3 boards based on
    daughter cards
  arm64: dts: qcom: lemans: Rename sa8775p-pmics.dtsi to
    lemans-pmics.dtsi
  arm64: dts: qcom: lemans: Fix dts inclusion for IoT boards and update
    memory map
  dt-bindings: arm: qcom: lemans: Add bindings for Lemans Evaluation Kit
    (EVK)
  arm64: dts: qcom: Add lemans evaluation kit (EVK) initial board
    support

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/lemans-auto.dtsi     | 104 +++++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       | 291 ++++++++++++++++++
 .../{sa8775p-pmics.dtsi => lemans-pmics.dtsi} |   0
 ...775p-ride.dtsi => lemans-ride-common.dtsi} | 168 ----------
 .../qcom/lemans-ride-ethernet-88ea1512.dtsi   | 205 ++++++++++++
 .../qcom/lemans-ride-ethernet-aqr115c.dtsi    | 205 ++++++++++++
 .../dts/qcom/{sa8775p.dtsi => lemans.dtsi}    |  75 +++--
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts  |   9 +-
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts     |   9 +-
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts  |  40 +--
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts     |  40 +--
 13 files changed, 875 insertions(+), 273 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-auto.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk.dts
 rename arch/arm64/boot/dts/qcom/{sa8775p-pmics.dtsi => lemans-pmics.dtsi} (100%)
 rename arch/arm64/boot/dts/qcom/{sa8775p-ride.dtsi => lemans-ride-common.dtsi} (87%)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-ride-ethernet-88ea1512.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-ride-ethernet-aqr115c.dtsi
 rename arch/arm64/boot/dts/qcom/{sa8775p.dtsi => lemans.dtsi} (99%)


base-commit: 05adbee3ad528100ab0285c15c91100e19e10138
--
2.50.1


