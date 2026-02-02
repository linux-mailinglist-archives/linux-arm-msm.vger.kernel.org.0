Return-Path: <linux-arm-msm+bounces-91435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDQ+AuhTgGkd6gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:36:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BA37DC9332
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A48B5300888C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 07:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B709296BD2;
	Mon,  2 Feb 2026 07:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CinRKQwB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bpnF4hho"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8175274B35
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 07:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770017759; cv=none; b=e8bMCT/UxqjCu/FF4eZDIm5zQ52OaoMBL6daSVUIK/kviYRwo/RkYlc9vRkf5aqcTOTcAzrZe2DPK5A9jezvlhgazWLsSzECLMmkXTNWB/5pD7mxHQLPDb03p64FMc7fSOjVTaATAj1+NdQNG75sthqd5s4FdICJ29kKnTdYr48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770017759; c=relaxed/simple;
	bh=Cf+NXcgmuaoxEh24s0NWkW2CKYUE2ZNWAKwKpQwEoWc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=e1y/PCh7nciQg3e02lhELnO4NUfdhBekXSarvVua+8AZvO/uOAWB0BkzWOkoRV0Wrl0G8rXIj18ETHYhnFLly/+SaZOShyNx9PB6rj6AvAiNHEKQ5/BYkYbVTN46WyJRvzeGxgwsPoj5bbKM/sUoi8ETQtqBYUxDHJ6unqNQuQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CinRKQwB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bpnF4hho; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611LH7BM510179
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 07:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wWgb7WkVNEUrJcP311FBmx
	3OcHuCP8Uo86/jrzgi2Vo=; b=CinRKQwBKAtLuqYSuwQMP+2ALmvNtc4AEAGrg1
	UFbIZ+waVux4L9G0Y5Oso0JlzibxG1tCAbkV7meiLCM4Pr8jTAidNF6IApLq0Lln
	jYsPgYdwJWIVbMe7YUhkwseF6tLQYEkK579qy3nfDaSbwZYqUIzWAp9QdTs2ixAg
	NeSPBj2R2AQhcLrHVMe573baUxitCRvL9yVWAJjG1QmQ9zdJG/dgRr4UWJC8ueA/
	bQ/TxKje6mNjl3xV1h6MsbE5+D7SktBPRhI5Jlx1f3J9VSekRe3/KaFRd+xIB611
	W7a6Pj2B/6WtEpNNEHt4ZdyMcRvuJQ/slAOAYll+i7fgIndg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avx4cfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 07:35:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c314af2d4so3174900a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 23:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770017755; x=1770622555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wWgb7WkVNEUrJcP311FBmx3OcHuCP8Uo86/jrzgi2Vo=;
        b=bpnF4hhoBW6DeJeUeyWJiv2AylgO+5ukV6k5NsjPbJYaoA6iGfBKmr9/7oK2O3LqUj
         6Kob4FmsVgbVQu7jGA9Ib+LxRc9C0zG3vXpKd/k1z9Td4Wc6/N/rVVbZAG1FSBxUwO1K
         bZ2G6Cdp6MtQtynUi24i4Q8YNFyYCPVcAjtm5UJCHUQxi5W8KOsKZFiwFKxIosEzsovd
         TrQQEgcNC3i19w2VPbVlEbRaFKYEhtcQVJ1eaubrf6xjCpvv2vsB8GXkHIQnno1yqjWf
         arnAHq/c9bnNvW8WgjAPkwqV89YfmX049mX4BRGX7OE0Gjea1I4u+8ABGl1R4wuwqyaB
         L0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770017755; x=1770622555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWgb7WkVNEUrJcP311FBmx3OcHuCP8Uo86/jrzgi2Vo=;
        b=AMnPgokfvf9601Th184MatUGDQXiGNfbCyja7VQF/oxppnBVnKDr0OLx8Hv8Hi2jJr
         YnDlHxw7awbkuhDWzbLux0lPopgLckkrKj50cLq9N/W7Fl1T4Vg2QJ98SMgL2aG/OmrB
         HBDAdUMgpsM0hx9mv7KJXWwKixjfslBCS3gxanmy74/hHOwQqAJkgFP8dJ5yOGYB0HX5
         Qm7ML85e18TY97MUO6Kfi+PUPkU6rpGe7MKm7qsgAtQ8OvnhkExe663is5dHhvTZMq0C
         dVzn+OVMp5VlcdBNpX5Bsi7hUFygiYYL3vhCBXiwdkyVPLIqrHpA9zz8J6E39RV57z6d
         gozQ==
X-Gm-Message-State: AOJu0Ywpw9ocRb/iNnxfXtBvs/oRqr/jCVDBXvgIIOwQhGjzDpLxM4Pu
	T3/gHoRzUrukfBNySzVZNb3rxkeLq6aDqLGySOlR8x3LCKVyHXHn3pkIJP/Sjbzvez4mUCRkl8G
	z16q4rsasNpt1shdQC81wj3LsKFdAkoZA3fBQ4EmBG0+x6iB/uM8W+46J8o9+6DkOikip
X-Gm-Gg: AZuq6aL66WXEe1VhhvgsEY2xmE+xzeaQcGPAGsJS0WtczsrjL70Djd6Cr6t6ATg+Cop
	RNKEiSuLUfeSU9MUitr0tLmkQZuNzdjL0oZnMfOTPj211Jvw79/Qx32c3NHgdIL4PzXwD+WaUsn
	HNaMsQR9y2Ve+hQ8lBy51/UvzX48I7IJ2FWXNafemI3vkNcLOVCFdACwWVlxqAtEw825mnL0gmc
	dXpNEsxGIe8eftKgsJRIOy4RfHCnprNEK+d7ASGrndrpwYGkPWKNt9rggrdjsxxm3ucH84fPVvW
	Qpgb/usDShM8lwm5DeGBmaVmIM/oUcWkO7hlqelR9hrGq7mfhfr17DoKnuZpj0M1UAJxXH+kQLD
	MX+al51sFQMdKGaFZ6vMOdxkCyM55BGaU/1BL+YdeDjcT2K6j3Uwblplp95mcEaUoDHv+zXEPfu
	I=
X-Received: by 2002:a17:90b:1d8e:b0:341:88d5:a74e with SMTP id 98e67ed59e1d1-3543b3b0485mr10640408a91.29.1770017755475;
        Sun, 01 Feb 2026 23:35:55 -0800 (PST)
X-Received: by 2002:a17:90b:1d8e:b0:341:88d5:a74e with SMTP id 98e67ed59e1d1-3543b3b0485mr10640393a91.29.1770017755002;
        Sun, 01 Feb 2026 23:35:55 -0800 (PST)
Received: from yijiyang-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f3cc71bsm14129847a91.11.2026.02.01.23.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 23:35:54 -0800 (PST)
From: YijieYang <yijie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, yijie.yang@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 0/4] Initial patch set for PURWA-IOT-EVK
Date: Mon,  2 Feb 2026 15:35:44 +0800
Message-Id: <20260202-purwa-v5-0-1f5a93578802@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251113-purwa-907ec75b4959
X-Mailer: b4 0.15-dev-56183
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770015975; l=3672; i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id; bh=WvleuL1ZT7Aw0JTS+LnS/0YDrkO/vmuG90kkdvXWLsI=; b=PVtFgncMVOW46z8N9Mak8R7cEvkOKfKMdha8yqZW6qJq1FbOM6e2Qx6xCuBaRE1LkMhQiS9qy DDZbiD834/YAZDHhVFqOYtNe1jw6kdukL+4Wi91fxrs46pflNPVuUeL
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519; pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: n_GDjE0NnzDP0z0VIAMMKVECJfXXOXlY
X-Proofpoint-GUID: n_GDjE0NnzDP0z0VIAMMKVECJfXXOXlY
X-Authority-Analysis: v=2.4 cv=P4w3RyAu c=1 sm=1 tr=0 ts=698053dc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=saxfxs7kvJswxqIV9QAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA2NCBTYWx0ZWRfXw+9roy2IsmqZ
 E0gjTMLSc0CMHqKJ0tMviDLmgs3Pc4P9hgLBxAAxR+JPYxa+5ZugZaTVQIYMXzz4q2ufKWXnIkX
 McAvwOmu+a33XF8uW1Yi2Vdsl204zDXruQGZUG8R3xX/SCPVnyRiykWDmGZCCACOfSQOMZwvKLk
 JTk43ZvEvzSIsbzfwiBhj15iDLwHqyb5S6zkn7bG2uKk2xLCFV2/oiR7Knpr4ctw3fOme1+rib/
 vBnlyYsoD5RLCoSWid/g8UTQPwO9u1CjoyaLdB3nbxf/G9cKhGKBRft0ndKBHKomlaPFO+vpdYP
 N8j7JKtQZ5NX++O3gR7cQxfh2feUxAjmWUPqh0xF/0DO0zJajGdTcmJsSH4ardzxSsTJUwSri9Z
 Xypa3ujyxv5PS767FZz2sllKvPxx0AduvIfOGGZWQhcS81VT49P1YQxx407crcZN2zIQz7FaLrh
 +j8wGGVwP41JhUMxOnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-91435-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yijie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BA37DC9332
X-Rspamd-Action: no action

From: Yijie Yang <yijie.yang@oss.qualcomm.com>

Introduce the device tree, DT bindings, and driver updates required to enable
the bring-up of the PURWA-IOT-EVK evaluation board. Focus is on two key
hardware components:

PURWA-IOT-SOM — A compact System-on-Module integrating the SoC, GPIOs, and
PMICs. Designed for modularity, it can pair with various carrier boards to
support diverse use cases.

PURWA-IOT-EVK — A carrier board tailored for IoT scenarios, providing
essential peripherals such as UART, on-board PMICs, and USB components.

Together, these components form a flexible and scalable platform. Initial
functionality is achieved through proper device tree configuration and driver
support.

The PURWA-IOT-EVK/SOM shares most of its hardware design with
HAMOA-IOT-EVK/SOM, differing primarily in the BOM. Consequently, the DTS files
are largely similar. Both platforms belong to Qualcomm’s IQ-X family. For more
details on the IQ-X series, see:
https://www.qualcomm.com/internet-of-things/products/iq-x-series

Hardware differences between HAMOA-IOT and PURWA-IOT:
- Display — PURWA uses a different number of clocks and frequency compared to
  HAMOA.
- GPU — PURWA integrates a different GPU.
- USB0 — PURWA uses a PS8833 retimer, while HAMOA employs an FSUSB42 as the
  SBU switch.

Features added and enabled:
- UART
- On-board regulators
- Regulators on the SOM
- PMIC GLINK
- USB0 through USB6 and their PHYs
- Embedded USB (eUSB) repeaters
- USB Type-C mux
- PCIe3, PCIe4, PCIe5, PCIe6a
- Reserved memory regions
- Pinctrl
- NVMe
- ADSP, CDSP
- WLAN, Bluetooth (M.2 interface)
- USB DisplayPort and eDP
- Graphics
- Audio
- TPM

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
Changes in v2:
- Update the GPU firmware path.
- Update the description in the cover letter.
- Reorder the patches.
- Use separate DTS files for Purwa and Hamoa.
- Update base commit.
- Link to v1: https://lore.kernel.org/all/20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com/

Changes in v3:
- Delete unused PMIC and thermal nodes.
- Add WiFi node.
- Add display backlight node.
- Add connectors and VBUS regulators for USB3 and USB6.
- Enable PCIe3 and PCIe5; add PCIe ports along with reset and wake-up GPIOs.
- Link to v2: https://lore.kernel.org/r/20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com

Changes in v4:
- Enable TPM.
- Update the descriptions for video and the USB OF graph.
- Link to v3: https://lore.kernel.org/all/20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com/

Changes in v5:
- Reorder nodes in purwa-iot-evk.dts.
- Update base commit.
- The DT binding change that fixes the DT warning for pcie3_phy is located at: https://lore.kernel.org/linux-arm-msm/20260119-topic-purwa_phy_shutup_warning-v1-1-997a692b31c6@oss.qualcomm.com/T/#u
- Link to v4: https://lore.kernel.org/r/20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com

---
Yijie Yang (4):
      dt-bindings: arm: qcom: Document PURWA-IOT-EVK board
      firmware: qcom: scm: Allow QSEECOM on PURWA-IOT-EVK
      arm64: dts: qcom: Add PURWA-IOT-SOM platform
      arm64: dts: qcom: Add base PURWA-IOT-EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |    6 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts      | 1549 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi     |  685 ++++++++++
 drivers/firmware/qcom/qcom_scm.c                |    1 +
 5 files changed, 2242 insertions(+)
---
base-commit: 6267b2da1b2d04847a1a8f441e138bc4a89435ee
change-id: 20251113-purwa-907ec75b4959

Best regards,
--  
Yijie Yang <yijie.yang@oss.qualcomm.com>


