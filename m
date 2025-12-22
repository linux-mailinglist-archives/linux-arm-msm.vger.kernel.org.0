Return-Path: <linux-arm-msm+bounces-86101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3BDCD4C28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 07:05:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CC5A300C289
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 06:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781B7219E8;
	Mon, 22 Dec 2025 06:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="doB8901X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cl8FNImL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8D52877E8
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 06:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766383418; cv=none; b=PqzzIY0w19Y4nhZBf3YXQTvTIy7BeFYQSq5ab8ECi1i9+Fwy2vgM9FdJWAc8A1TJr/UZUs1qbFcu8Zi/saKNIIhnUICXa4K+QREzHtUsFVvkm115C7PlVdDFKbko5wkXJHwxRvoIJZF0vu6o9Kpv+eCFzYqTEC9h+uwTepSOZtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766383418; c=relaxed/simple;
	bh=gAlux7lAziCE4oTDK3KPENbYwptBvXCPl0DClAT77Rw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=C11pcsc3VgJE6/gImCnhxPh4h4CFwIvShNe2bnddHQHI9LGfydOnQbApgmmyRA+8aPu3FRs9Z66yXHqOlkniNVGAFAbQDmLjU2hitsTWWtFvME5cqdmMGo/YLlWCKhUxaMuRsdgY8nCrr7cToSTDXT6ZqX7RHPvo1Inb2lKLROA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=doB8901X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cl8FNImL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLMkw0l3787547
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 06:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6hu25zxmhXZntuPiVUz2vx
	sMajsKOY6P7UhsCY2Ez90=; b=doB8901X+DQmwlXv8HZGZ+GbzA55AdieCtboLO
	3hNQh/L34VWfTuWT6sSDP3eONTRRE6XrXCP3eNlaRpnMT8a+8VBpsdG+6FCo8Cfj
	AZQGppROHp1WPcTiPD4wd/B/VLcN8VZ9ulnl1fQ1enUQm/J8Y/CYqtzY6dv8gVQf
	8mQ0BdJRLS+oZUITjQrlORzHaT5g1abj9hs33ThU7BD/a/Qxai1gHaBBCppp57zj
	cN+HYk+xLdPuWVjeuSGAlVjtRdd1CT/JrPVDlUtP/Cmz6tYZ4g9xyTFoF3BTPzfX
	qu76Kp2pcWr5SAhHZ+sieHJ3OSR7QcEbp3BX56yowJtdpSKA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mru3v9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 06:03:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c6cda4a92so7517040a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 22:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766383415; x=1766988215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6hu25zxmhXZntuPiVUz2vxsMajsKOY6P7UhsCY2Ez90=;
        b=cl8FNImLWPAZC3aj408yCAhXkDJ4obiep5D6zrExN32m4oMpErJ3OiJpqFn2buW550
         r0KQILizXsMPiZ5fJUozgoffJR9lOolfSHG8KxsBhnZAbpC59KfbeD9tksO6sytWgJbu
         IHuZc4Cp/iS5Ij3O50BtECc+xCEN5zB3f2O/gI4bOFmyH71Yr4Snhx+kiM3BItGdymfR
         p9qQjSpuwTqrlaerTBY1vsTKvUV1ri/kEiO8Ps08lMux+pVeT8vlpg8VAc4g5LahkJrJ
         dH6vBuT1qfSJ+I/LpgqWghcn6f32WlwAOeg1FjjR6D2Q/C9Z4KLbdboxV9rFyu/a3ngL
         qGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766383415; x=1766988215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hu25zxmhXZntuPiVUz2vxsMajsKOY6P7UhsCY2Ez90=;
        b=VH+Y3GXi6/MjH9jCsAekzQNO2ShCqvvT1VGRLZ+fMr5tmbPWay4q0mcKa3Zt1TkHG+
         ZbyqEo3ncBon77xfsmn/E4EixZRj9/5XZvzYyAVaa2CaUO31s2YcFzRaH2IVVGHHkse4
         W8FHa+TZsqxE3gDNg6o4mKntG2i+D9bIgFm7uiXJnMGuct3D7FYeEfh4f+OoU8sZlfLp
         k04+IosBQSQKe4zkPTKenmyk/R3pEvCNNGipymn+fp6+Ml7nN25DhrVPd0En7zGH4fV8
         b5lv4unXhtKes0+zYJs9+KajxKR7U/MAjPQDS4Q4fxcCgofIxMZhrHDLrEtQplQxskQ9
         LWgQ==
X-Gm-Message-State: AOJu0YxBI/W26tJj/55dRJSt9eZClelcLFZ30jQu6mqZNjkDDNsC8ro+
	emvu50I9qbDYTREl4K7haq2+cEQtPyDsnKiKi99xUUipY/G6Uexx0E6D6Q+t0fEnMBF42NQWFCV
	odDHl87eaMebkadkBhmglIr4DH6hD3JrkmvMYLuriINnalevemigoJyS8Wh6HYoiem6Af
X-Gm-Gg: AY/fxX7cNORcI7NEBV850DBoeiR1vhPMB88RxGEtaAZ1uis2PPv5DhTsL7AHGSPkSQU
	/sB36qGNz3Hd7V0O1R1uh3CUdQ1MbQV2ShoerKrcZY+Q7w4aiUV1VsRZujM4DK9dTGKb28oYwhZ
	VNTukg/Fq27NrT48SfltNfBGSzvX7B5L0ufVey/gxE/v8q8r+XP5FMCdoMVnQCWguzZfTziDMOA
	XzXhJEwdQdg0vnxk/X/9jQE5ibM/Abjq2Dc8/QWyh6+RD5Ta1tgtBvrdBSD9hPBCIOoklDvUnhj
	fIXfi44u6BF6mQxynLIkB0sKE1pDLTR+MDdNTzKFqPAI58QzYvP6MltKkOE7/NdaS8cz+ATHxso
	/jH0cFAran8ersUEiHEStJCFiKYqxDyhldzF+laVwD09rSPguy5xMl9A0m5SmwmJAR38TNost6H
	k=
X-Received: by 2002:a17:90b:2e0c:b0:34a:4a8d:2e2e with SMTP id 98e67ed59e1d1-34e921b7ca2mr8408770a91.17.1766383415316;
        Sun, 21 Dec 2025 22:03:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEN3ZnzQaO8Bp7dru6pT+9IKCWsaIfRNF27mKoA1q6vxsoenc4Yf7M9xKUwtNchkQaUZR40jQ==
X-Received: by 2002:a17:90b:2e0c:b0:34a:4a8d:2e2e with SMTP id 98e67ed59e1d1-34e921b7ca2mr8408748a91.17.1766383414837;
        Sun, 21 Dec 2025 22:03:34 -0800 (PST)
Received: from yijiyang-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e769c347asm5846668a91.0.2025.12.21.22.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 22:03:34 -0800 (PST)
From: YijieYang <yijie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: [PATCH 0/4] Initial patch set for PURWA-IOT-EVK
Date: Mon, 22 Dec 2025 14:03:25 +0800
Message-Id: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766383185; l=2948; i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id; bh=oorgR9LETBK1TGlnKXsZ5XmnZnFjahHvpfgKKD1aBHQ=; b=MyKntVP3lWYy3glGCW+k9ktIzbZdB2iH5UAqqP41xOXxr4tbys6UR6raReXdNbA019LqedfjI Or72NJK8EQQAwabP5syb8nK2TlMBm+PcUf88hQWLMC5AIcGCK3GUpTx
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519; pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA1MiBTYWx0ZWRfXylHDkDspknfc
 N7P2BUE805kSWq/XTCIhDxO31NzlWw/xubuVkB2zsspxqnwjEw3p88xsVhRticXHxnsFpvVYUDX
 /JUURr9Rrlf/HQMalfgcIZbIDA6HMnhrIk4YT1ERaqEps92X6fRYen4CynjEfRjZAuLcaW3+l+B
 qEWHTXY7Z0YsRvdPY0gFiNqX/6v2eQWIxKUN+tTX0VNtgoZFsBywR+c7Y7I5PU6kIHAljpyexO6
 ld/UjB3dGZnUM/kFKVpjvDSMFx8/cUlC+bOusZXW38i5JvS6RmiIres3+ASNuMHkuDM3r8yv2uI
 RaEMR09bMy3BbFn4HJSxCLYLC5zTOCsedTSCmL+M2O6lW07x/Whb/3L9qzTyNjZ5MUgYqeYGj6A
 ve2OI2FWXMJo7+ZEiG5fQoXcn1LcMk/HjT83KPUgyi6av+IHW/KqgHi6ak0oiJVU9cq0pc19aur
 Va16QgSxYBQsu8onGSA==
X-Authority-Analysis: v=2.4 cv=VMnQXtPX c=1 sm=1 tr=0 ts=6948df38 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=z2TZza4qrHSu2oSKIfMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 25v095twp0l-tjy3rw3mk8eVCHz6_cX-
X-Proofpoint-GUID: 25v095twp0l-tjy3rw3mk8eVCHz6_cX-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220052

From: Yijie Yang <yijie.yang@oss.qualcomm.com>

Introduce the device tree, DT bindings, and driver modifications required
to bring up the PURWA-IOT-EVK evaluation board.

Purwa and Hamoa are IoT variants of x1p42100 and x1e80100, both based on
the IQ-X SoC series. Consequently, the two common files in this series are
prefixed with 'iq-x-iot' to reflect this relationship.

PURWA-IOT-EVK shares almost the same hardware design with HAMOA-IOT-EVK,
except for differences in the BOM. As a result, most of the DTS can be
shared between them.

The changes focus on two key hardware components: the PURWA-IOT-SOM and
the PURWA-IOT-EVK carrier board.

Hardware delta between Hamoa and Purwa:
- Display: Purwa’s display uses a different number of clocks, and its
  frequency differs from Hamoa.
- GPU: Purwa requires a separate firmware compared to Hamoa.
- USB0: Purwa uses a PS8833 retimer, while Hamoa uses an FSUSB42 as the
  SBU switch.

The PURWA-IOT-SOM is a compact System on Module that integrates the SoC,
GPIOs, and PMICs. It is designed to be modular and can be paired with
various carrier boards to support different use cases.

The PURWA-IOT-EVK is one such carrier board, designed for IoT scenarios.
It provides essential peripherals such as UART, on-board PMICs, and
USB-related components. Together, these components form a flexible and
scalable platform, and the changes enable their initial bring-up through
proper device tree configuration and driver support.

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
- Graphics
- Audio

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
Yijie Yang (4):
      firmware: qcom: scm: Allow QSEECOM on PURWA-IOT-EVK
      dt-bindings: arm: qcom: Document PURWA-IOT-EVK board
      arm64: dts: qcom: Commonize IQ-X-IOT DTSI
      arm64: dts: qcom: Add base PURWA-IOT-EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |    6 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts      | 1188 +----------------------
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi     |  607 +-----------
 arch/arm64/boot/dts/qcom/iq-x-iot-evk.dtsi      | 1174 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/iq-x-iot-som.dtsi      |  609 ++++++++++++
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts      |  100 ++
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi     |   11 +
 drivers/firmware/qcom/qcom_scm.c                |    1 +
 9 files changed, 1920 insertions(+), 1777 deletions(-)
---
base-commit: bdedd93e9fe243f01c8277f81314560e352eeca8
change-id: 20251113-purwa-907ec75b4959

Best regards,
--  
Yijie Yang <yijie.yang@oss.qualcomm.com>


