Return-Path: <linux-arm-msm+bounces-72362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0228B46385
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 21:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A6A61BC6E39
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 19:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2D0277016;
	Fri,  5 Sep 2025 19:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGZ/VsHA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105762741A6
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 19:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757100239; cv=none; b=lnTWY4hfz7TrWwGP/Vd4SpP3NyNJR6jzDbETA81XDS86i8ToDMFdCN7a+EVg4W2cdr2pv7e5mQNfx0JV5mKMZiKu0XeSgec10FH6veYADCKKt/4bHL5K1le1tB/jCMJ/0Yy7RTBQ7NwSIoHEpbbiSLV5j2tPb2J9shpL2ejaXFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757100239; c=relaxed/simple;
	bh=Ys7I0Vup5e+goKhaFRUnMnqwTwTRcNpk8G0crlrK/6k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Ph8lzepngHLwjV8HAaBawsBQof1slu4sRgc6pjuvLSUY3M5uKpUxhxfORTm3szoQi+8EddskiMVVixwNbV111MeaL7caNa5foRcnZdxewNn9iH0bLRZo2k+uFc+vASQfNmU6Lv/5AOvJAullx3JihDSpC6ACSj8xucLgBAyRLrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGZ/VsHA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585G8nJm002956
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 19:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rkxfFku32rNsgPlmlaOW3d
	U+2FHQgFK8a7/yM2c+LOY=; b=mGZ/VsHAAm8wnkDsGFQRWMKqaTWsfuNwrwqtwb
	khfZNHWYflRN5Roq+UxdEvA9lfTuEOJESKWrN/cNgX3FmnCfnVw3koG2RZY4mz3Y
	S6oK3vCYRyE/FXcwYk9P6H4CqwSnUnBhW3ShvPNg2peqimuaBo/TK8nJHhrYqD2M
	F9iilHkzVkBUofqbCCWEUWF7S8BLLCGj7X0zwoUpQumXyp16HTOtwl5SmJcaJh+Y
	NYhXGmsJlXlwDSVj4JAwqA/NdzywNUKw308S6uN7fZyfy6FSJ1OSA1L1zm0WdH8a
	cqFx4FFb2bnYQ3ykrZ/eVYY/ODhUIeCrwy1Bd/pg93NxfhWw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush3c895-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 19:23:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-245fbdc2546so5069735ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 12:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757100236; x=1757705036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rkxfFku32rNsgPlmlaOW3dU+2FHQgFK8a7/yM2c+LOY=;
        b=g2vLcUyI7RYAmHChzkj8jq7kxzAFzRa9JoJZdvSPweE6Zq5u5MZRzWqKIt1MdR4dW1
         AZhgpvb3RBnyxy0JnTB/Lsr6bsf8rqRtH3PL2vAMAB4ITpTD/xIuiCS0qnuo0iHsVP/B
         fP3SDCpYgJtFuWZfnnUQ65NPQzvTkWf4xXRFrmrX5m0kpfHZHtONjCo3rcg4VyXPvMC1
         AlO5y6b5SRWIX42HD6Svcx35qF5fe0u2P9T+bCWxvMnWw0gwOMeNemsqOEHha+It40/w
         RCU5SqR04Qtjo4IE11BpEK3PlxSKZ/6+sBXjI0aPE+6wM8HMYO1r/fr6CEsvGLveCM9E
         qjhQ==
X-Gm-Message-State: AOJu0YzWpm34T3dlxUKC2W6aGqjYBMscUCKU5YD7uXSG54p3O+9X3uEN
	I4WMvFGvJR1zUlYWPnGJRA1fPgI7ceJC856/T26QYoG0nY/975Tce7ms7uPaJLeNfiQ5tge4pVN
	ictUks6eyB1QVuVBMBldVhe5qNtuS6Vzq9tM/wEv+hJh7PctlJNyW/KiU/I3sxDw42q4m
X-Gm-Gg: ASbGnctuzDg9h5Yr5kjoIMes0vxT7JKDxQ2EHbySbo0xft9KbYqYVfr2BpOMTYTIuVf
	VniKniphRjQb1YNGHpkyK2AYfpMio9cARyg3felEcPGK3yCwNC+4iECx20s46eJvqjG478LknuW
	+IgM4za0ltWuhtP/HWejeyLeIFqFw1eD446XAF2TNlg24KOIf6MCVqeps8e+lGwbtpKnKKMI03H
	UexaQo5+GQkXeez3rmR2EcE+3Iijj2epto90y4oLeYeanbEPIg4sTdkjYUzsysYi/cz1x0kBQ+Q
	SNBOuX/+XnLPF1M7oi8TSHBFieP+bHesQdIx4PO9W2mW+dH8DAmEr6NCm5TAVzsGmYU1g4s=
X-Received: by 2002:a17:902:d487:b0:24c:cfcd:7356 with SMTP id d9443c01a7336-24ccfcd76demr52229715ad.0.1757100235723;
        Fri, 05 Sep 2025 12:23:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSve3MkXASk0rHIk8zSoxBNSXQLr2f6Tc6YJC3NXSYVl4cpZyjhD/y1aPYD+OSMduL45l4QA==
X-Received: by 2002:a17:902:d487:b0:24c:cfcd:7356 with SMTP id d9443c01a7336-24ccfcd76demr52229505ad.0.1757100235188;
        Fri, 05 Sep 2025 12:23:55 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cc1a82a34sm52397055ad.151.2025.09.05.12.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 12:23:54 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Introduce support for Monaco Evaluation Kit
Date: Sat,  6 Sep 2025 00:53:46 +0530
Message-Id: <20250905192350.1223812-1-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX8NcyL8YgAHtO
 aXCtOJDi9CVu7Bm1GEzZlDUXH13cBm6YD6fQ4Kju6+zG6Dw5o5wbZYApEPKWjHHKTX8WUhThP1K
 y4vfTtID3ECCXRE5IgK0iKF3oi6yJ9dOn7uce/K2/C5qsfi/KbfwtaGrEMBacSN91ksRngz5fn9
 cwN+JDVsqG//ZbQtD7SkaTzDE/f8IAMeHF9sw3vtpNoRZ7Rx+tvT724SrTev0A6yUiHb5ZpXrYp
 dJ2DDvhFHaT6GKVH08waF+xCBvyxciLPw/uXjS42ZMzqF1T1C4HJ+CyhvbZ86F6PmRF+wDTRbV9
 4oMtTbUmCfxlBakvJgOziNDjrYAsqwoi6EHrG9ft6FYGkaeg1BdIjv+H9oZVgqEgePKpMnYWhV4
 MN5kwfwL
X-Proofpoint-ORIG-GUID: tvoc1WHgCQ7t6qdEI7KACPG4hfIULskJ
X-Proofpoint-GUID: tvoc1WHgCQ7t6qdEI7KACPG4hfIULskJ
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68bb38cc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=1rJyDK7wihIfqwlA9s4A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032

Add support for Qualcomm's Monaco Evaluation Kit (EVK) without
safety monitoring feature of Safety Island(SAIL) subsystem.
This board is based on Qualcomm's QCS8300 SoC.

Monaco EVK board is a single board computer (SBC) that supports various
industrial applications, including factory automation, industrial
robots, drones, edge AI boxes, machine vision, autonomous mobile
robots (AMRs), and industrial gateways.

Dependency:
  - The ethernet PHY QCA8081 depends on CONFIG_QCA808X_PHY, without
    which ethernet will not work.
---
Changelog:

v4:
 - Remove LPM mode support for all the regulators - will be selectively
   enabled later for the clients which support LPM mode voting [Bjorn].
 - Add the correct copyright [Bjorn].
 - Refine subject and commit text of Board DT change [Bjorn].
 - Use generic node names for GPIO expander [Krzysztof].
 - Drop firmware reference from commit description for iris video
   decoder change [Dmitry].
 - Update Board DT patch commit text to indicate USB OTG mode will
   be enabled for USB1 controller once the VBUS control based on ID pin
   is implemented in hd3ss3220.c driver - Similar to discussion for
   lemans-evk [5] [Dmitry].
 - Drop Signed-off and Co-developed-by Tag of co-authors instead mention
   the co-authors in the commit text.
 - Remove the redundant snps,ps-speed property from the ethernet node as
   the MAC is actually relying on PCS auto-negotiation to set its speed
   (via ethqos_configure_sgmii called as part of mac_link_up).
 - Add Audio change to support capture and playback on I2S.
 - v3-link: [4]

v3:
  - Include changelog in proper format and make it more verbose [Krzysztof].
  - Fix subject line of dt-bindings change [Krzysztof].
  - Move the H/W peripheral information added in cover letter to commit text
    of Board DT change [Krzysztof].
  - Include 'qcs8300-pmics.dtsi' in the Board DT [Dmitry].
  - Enable below peripherals as suggested by Dmitry and Konrad to include more
    peripherals in this series itself :
      - GPI (Generic Peripheral Interface) DMA controllers and QUPv3 controllers
        for peripheral communication.
      - I2C based devices like GPIO I/O expander and EEPROM.
      - USB1 controller in device mode.
      - Re-enable Remoteproc subsystems ADSP, CDSP & GPDSP as fix [3] is
        merged.
      - Qca8081 2.5G Ethernet PHY.
      - Iris video decoder.
  - Update the Board DT change commit text to reflect the above
    newly added peripherals changes.
  - v2-link: [2]

v2:
  - Address Bjorn's comment to rename the board filename and
    compatible to monaco-evk.
  - Include the bindings for monaco-evk with the existing qcs8300-soc
    itself instead of adding a new SoC binding.
  - Drop remoteproc support as qcom remoteproc driver is currently
    broken in upstream [3]
  - v1-link: [1]

[1] https://lore.kernel.org/all/20250623130420.3981916-1-umang.chheda@oss.qualcomm.com/
[2] https://lore.kernel.org/all/b376d130-2816-42b1-a8c1-1962ee0c2cd7@oss.qualcomm.com/
[3] https://lore.kernel.org/all/20250804-mdtloader-changes-v1-3-5e74629a2241@oss.qualcomm.com/
[4] https://lore.kernel.org/all/20250826181506.3698370-1-umang.chheda@oss.qualcomm.com/
[5] https://lore.kernel.org/lkml/d6816cc6-c69e-4746-932e-8b030ca17245@oss.qualcomm.com/
---

Mohammad Rafi Shaik (2):
  arm64: dts: qcom: qcs8300: Add gpr node
  arm64: dts: qcom: monaco-evk: Add sound card

Umang Chheda (2):
  dt-bindings: arm: qcom: Add Monaco EVK support
  arm64: dts: qcom: qcs8300: Add Monaco EVK board

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/monaco-evk.dts       | 511 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         |  77 +++
 4 files changed, 590 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk.dts

--
2.34.1


