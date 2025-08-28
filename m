Return-Path: <linux-arm-msm+bounces-71059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40186B392B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 06:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AA883AAD12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 04:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E0ED260590;
	Thu, 28 Aug 2025 04:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m0LBHBYa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52631C84C7
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 04:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756356620; cv=none; b=c1uPoC3TdA+n70o08suiHq99BlNtdKP45xr25EWoUMhWhiJV/C7tQ2xHyKM8Z9jXS7/qSpP8CQmkhx0FRf9vTkqH0kxrU56piaMiA7HlzPahfepg7rGD1YnyJuMhjyx9ty30Bl72K4aCss5jatNGMjH5WiXa0vHTK8JiF55VVrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756356620; c=relaxed/simple;
	bh=RQ6jAyrO+xwo6TVRsgpcOpD82ufwGXt4E9JdVDRJY1M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dgKOScEx1pV9VPjFwZpCZJs6Clbb4i/3Nkq/F3i5sMdBaMsOll2+SRgpFnCZ9dKGc1cDkgoQdjW1Ld5PwHRPxWfE0craEBkUs5+NvC99ycdvGeGhaqj/am3m7Ui9Sklk/PVdk7SlQCDLNLRH1tpaS65YWUUOP1jttitndoCT2ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m0LBHBYa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RGxaOk014892
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 04:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nlXmD2i4djoaEB2B7FxLng
	pUB56YCDrA927rWvnzjAQ=; b=m0LBHBYakIgkZdiZCF/ROFNhCxBBAH34zWU58e
	YJif5MYar3ij07hcmH2kLhlNAPU+rrVE0hSp6LpvAmLYRZdQi0el7orX4CzeEwRO
	dKvaDJArJQOH0SyR1lvy/1amW3jooeyx9UDNHExWF9gDwor5wuosv1md+QPzUvei
	LlJOnFSLMleVWTWixwE60ovpH7OahNa1h6j3Hk/uVZNA7V4rNvOU0vTmVdD04xPt
	hKMb1U9R9HsJW1YrYhyTY1m97umLFVT4PKhZt0TuViz759u7Q7IKRlTcaqpdj8Ub
	/hjOd9PCJL9c0mXAtwz64WvCLo6aiXGFHHTCafOcyp1Cl4Gg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5we6n7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 04:50:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b47156acca5so425267a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 21:50:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756356616; x=1756961416;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nlXmD2i4djoaEB2B7FxLngpUB56YCDrA927rWvnzjAQ=;
        b=BztQSTwOCmh2Ugnk8yjX5v7pMuGynY6sLa08U56vOnZNPbF7bkToqg69/HzvcQ0GBI
         JZlstJJe0PvrbBF0K8kIw4NcYWrgkKsaP4o9/KO8994qwxQYIcvhzu6STs1XV4cVKtUB
         L/0XxkZjrK/y8qwpEjhjIs3zf0jJCG/B4vw2RxOElN40rqkDzraCCnC7VRL2age6VUB3
         VxyFdQLyyL0A6I/Ia7kATQbk8hF9b3XtCCJbtI4uUCBO+03h3anJXv+MDUDAPMn95bgw
         8BZvWLOyxFDri5QvRQPN9HRgUQ7dgnsozhb4xxe7sqXTyjUvJ9c96Of9YmAb8sTzyR+c
         10aQ==
X-Gm-Message-State: AOJu0YwEpKx2X6Bm0Uti+d2S8uuOLB3cUNC5fWxdeqtFfg9WkdvftGuB
	e69HrjW7MBdrvqMVjNnzUxcnp9ZjUkCvOmpJA8AxaBZCGqJ8WRySdZD9SXMBX/baUrMtEgMM4OF
	k6GIADVDejYuUto4ukffMqkCNrNB7INbcXok5yFevJtbRqWFCdflwvyTi/pvhqzAtHXSfVuJHtQ
	di
X-Gm-Gg: ASbGncuUr3VAV/FRSq6UIgjwKe/BcZACBT8m1nxgiDe1L9FdjpfZUUyReuM6Gv/FLLN
	VvYqZOVZ9uV9bawY3OoEOWLWCNGtjLP5BA4vBMtoXLX217P2f+z0dxTU0g8xLZr4UzgIuz91kTw
	KC0wBZh9h1HMiYjHBQWlVg/sj/q16yvico2FSgsIEvAd3HBhI1FONaaouSwDUIMu/ZQSeSyJQ2E
	leXyatIU8nlbzmMmMTIUw06o/9gGDD/YSavwsBBZSLfuHriCsyWvNHWyvWDNGYgxHIK59fw863g
	3F3GRKNENXz2d7rn5DzIRlIPxLdbLFg+q/Te5D0nvBil00pyOzA5j5ss0HcnX0IMCscL8fHF388
	Oe4EVUqjfuQfdDJNWsZT0gOd8D85yu+De4g==
X-Received: by 2002:a05:6a21:3382:b0:23d:e6ec:5410 with SMTP id adf61e73a8af0-2438fad2e8amr11611072637.17.1756356615822;
        Wed, 27 Aug 2025 21:50:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFg87Lj9uGyUvHECJhDSGxBlwlMVVNBCV6mtR6BQqOuP2Zw6AuHZcfb3lNPDCfgeKnCUtS3Q==
X-Received: by 2002:a05:6a21:3382:b0:23d:e6ec:5410 with SMTP id adf61e73a8af0-2438fad2e8amr11611028637.17.1756356615296;
        Wed, 27 Aug 2025 21:50:15 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327ab094f00sm986699a91.6.2025.08.27.21.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 21:50:14 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: [PATCH v8 0/3] Initial support for Qualcomm Hamoa IOT EVK board
Date: Thu, 28 Aug 2025 12:48:44 +0800
Message-Id: <20250828-hamoa_initial-v8-0-c9d173072a5c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAK/fr2gC/32S2WrDMBBFfyX4uQ6asdY89T9KKdpcCxI7sR2TE
 vLvlZxCjZe8CAbNPToa6Z51vg2+yw67e9b6IXShqWMh33aZrXT97fPgYp0hQUY4oXmlT43+CnX
 ogz7mxDpBCu4ECshi5tz6MtxG3sdnrI3ufG5aXdsqUcbwX1/rL9d4XP9sfnba5nQK/WFX+1ufj
 0dKxCyBqtD1Tfszeg4wJsZ9QWCmNEBOcl0IZxg3lFHz3nTd/nLVx0TfxyUJPMPA18IlL5kjpdL
 Ai2U42Qw4NZgPZcAIKSRySh1B7fQLA1wNKzCEWCnRAWwYFBMDYHNIESGiRCU1Q4tcvTJQa2FJu
 CcKhVTObhjQfwO5nAGNEFDeGYOSC2E2IGwCgQWEJRMQWlnupaNiA8InEFz8B55mgZ56AprFh92
 AiClEzCEi/QtlJDjGabzTCuTxePwCwTimYE8DAAA=
X-Change-ID: 20250604-hamoa_initial-0cd7036d7271
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-5bbf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756356610; l=4896;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=RQ6jAyrO+xwo6TVRsgpcOpD82ufwGXt4E9JdVDRJY1M=;
 b=y2P0wZW81XDSr5isF3SVpQLJ9C+TTUGyCdvNwkeo7cJ1X8QtLqIRv+LWLsZzstKQcazVA2qNF
 kcjPXmUCgAiDRJmHtDN/Tf3rrpbpho6B/tAPw24OIgkzvGVnaVNTpuw
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-GUID: gFPHt7w-511VM9nW-S-3Y8kX6_SNr-kj
X-Proofpoint-ORIG-GUID: gFPHt7w-511VM9nW-S-3Y8kX6_SNr-kj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX/emcE7v58CQH
 rQssWJZ+5WCzs59vQZpG3BYQFFrsr6AFZXog8kY1kYkfy0JdU/5443HELXdNGY9ivMe62Qx+6fC
 hP84p1A3eqBa52HwDOXwBaw71xzVcVmmKBuadbZmWgEBKrqDqeJ+2h0Imt7br6A2tgVXiBFlVDF
 BGfBV9BXI3ZqK7HcA5302Ed8vYyrfgubbYYldSL8eqpVhe9711X33WbAb6pCPn9wtvaHL5hHY3/
 2gbLV8k2m25nutrSb/S54ssChgFMQDFQ11ofaTiUHehu3gqwb0s/IkeEZA+InrOP7jOBcnkGT8+
 ogko0On58+aVJhP2Jdp+9QurkCZNdNtK0fk2V/RPa7+mNi1Z7B3cYRgpRC8v5EGCAob7y+ndJBo
 CA+R/tRb
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68afe009 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=SVuyu6wvmbTLjiTTrX8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033

Introduce the device tree, DT bindings, and driver modifications required
to bring up the HAMOA-IOT-EVK evaluation board—based on the X1E80100 SoC—to
a UART shell.
This patch set focuses on two key hardware components: the HAMOA-IOT-SOM
and the HAMOA-IOT-EVK carrier board.
The HAMOA-IOT-SOM is a compact System on Module that integrates the SoC,
GPIOs, and PMICs. It is designed to be modular and can be paired with
various carrier boards to support different use cases.
The HAMOA-IOT-EVK is one such carrier board, designed for IoT scenarios.
It provides essential peripherals such as UART, on-board PMICs, and
USB-related components.
Together, these components form a flexible and scalable platform, and this
patch set enables their initial bring-up through proper device tree
configuration and driver support.

Qualcomm SoCs often have multiple product variants, each identified by a
different SoC ID. For instance, the x1e80100 SoC has closely related
variants such as x1e78100 and x1e001de. This diversity in SoC identifiers
can lead to confusion and unnecessary maintenance complexity in the device
tree and related subsystems.
To address this, code names offer a more consistent and project-agnostic
way to represent SoC families. They tend to remain stable across
development efforts.
This patch series introduces "hamoa" as the codename for the x1e80100 SoC.
Going forward, all x1e80100-related variants—including x1e81000 and others
in the same family—will be represented under the "hamoa" designation in the
device tree.
This improves readability, streamlines future maintenance, and aligns with
common naming practices across Qualcomm-based platforms. 

Features added and enabled:
- UART
- On-board regulators
- Regulators on the SOM
- PMIC GLINK
- USB0 through USB6 and their PHYs
- Embedded USB (eUSB) repeaters
- USB Type-C mux
- PCIe6a and its PHY
- PCIe4 and its PHY
- Reserved memory regions
- Pinctrl
- NVMe
- ADSP, CDSP
- WLAN, Bluetooth (M.2 interface)
- USB DisplayPort
- Graphic
- Audio

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
Changes in v8:
- Change the style of how collaborators are listed.
- Link to v7: https://lore.kernel.org/r/20250827-hamoa_initial-v7-0-f9b81d564bb2@oss.qualcomm.com

Changes in v7:
- Configure the EDP regulator to boot-on.
- Change back to a year‑less copyright statement.
- Update base commit.
- Link to v6: https://lore.kernel.org/r/20250821-hamoa_initial-v6-0-72e4e01a55d0@oss.qualcomm.com

Changes in v6:
- Restore the full change log for each revision.
- Merge the changes related to Audio and Graphics into the patch series.
- Link to v5: https://lore.kernel.org/r/20250814-hamoa_initial-v5-0-817a9c6e8d47@oss.qualcomm.com

Changes in v5:
- Update base commit.
- Drop an already merged patch:
https://lore.kernel.org/all/20250804-hamoa_initial-v4-2-19edbb28677b@oss.qualcomm.com/
- Link to v4: https://lore.kernel.org/r/20250804-hamoa_initial-v4-0-19edbb28677b@oss.qualcomm.com

Changes in v4:
- Update commit messages.
- Update base commit.
- Update the format of the node mdss_dp3_out.
- Add comments to clarify certain nodes.
- Update the configuration of regulator-wcn-3p3 from regulator-boot-on to regulator-always-on.
- Link to v3: https://lore.kernel.org/r/20250729-hamoa_initial-v3-0-806e092789dc@oss.qualcomm.com

Changes in v3:
- Add compatible string and dt-bindings for SOM.
- Restore PMU-related regulators to comply with dt-binding rules and enable kernel-level power management.
- Adjust commit description accordingly.
- Link to v2: https://lore.kernel.org/r/20250724-hamoa_initial-v2-0-91b00c882d11@oss.qualcomm.com

Changes in v2:
- Merge the compatible rules and remove the compatible string map.
- Align the ADSP and CDSP firmware paths with other x1e80100 platforms.
- Remove the regulators on the M.2 card, as well as those managed by UEFI on this board.
- Merge another patch series that enables USB DisplayPort functionality on this platform: https://lore.kernel.org/all/20250723-x1e-evk-dp-v1-1-be76ce53b9b8@quicinc.com/
- Link to v1: https://lore.kernel.org/r/20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com

---
Yijie Yang (3):
      dt-bindings: arm: qcom: Document HAMOA-IOT-EVK board
      arm64: dts: qcom: Add HAMOA-IOT-SOM platform
      arm64: dts: qcom: Add base HAMOA-IOT-EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |    6 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts      | 1247 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi     |  609 +++++++++++
 4 files changed, 1863 insertions(+)
---
base-commit: b899981540841e409e496083921f2e5c4c209925
change-id: 20250604-hamoa_initial-0cd7036d7271

Best regards,
--  
Yijie Yang <yijie.yang@oss.qualcomm.com>


