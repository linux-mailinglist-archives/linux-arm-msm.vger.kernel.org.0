Return-Path: <linux-arm-msm+bounces-83700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 76067C913DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 09:40:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 016AA342394
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 08:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5D82EAB72;
	Fri, 28 Nov 2025 08:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GocIyhMo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kujVmwEU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4B32E8B9C
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 08:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764319218; cv=none; b=oYPn7DtnK+Tb6vZIwRW/nt+zAeMCh936WhYfWh0TudlRRimt3mUSYphG+8bMqWtZ/rvvAJD78OiDgN4yXzTY0HtEHEXYh7teJIzEhNLu01DEgf+mXH3oww/C9iXqWeAhRPZo2mfDf70mz1ONmPqmtuDi+7WAeHE/KAsSFeH573E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764319218; c=relaxed/simple;
	bh=1LPipc2kKLFebvKgTNK8Y5aNJuXIWcXIdUWnSMq01L8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Gv5xyhgNw6dSqbCPZavpr2p420cHUya8GT1atO4dQIS211Xs0zNILiDzbyfV1b+JTY66rzNq49X62rP4hmDxFznszLdbL+N1q/rbHvSt+zTb+14vm6ehVdMl7ksU3Jl/ed+yoyW/09KpAivkZB8ADJ3kugKUNAQn02CHkJ3jHTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GocIyhMo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kujVmwEU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8O6Bn3476530
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 08:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FyjvOrT93IK0JdqBV0g7j6
	s6KnI/QOOArjhf+zENe3g=; b=GocIyhMo9coRqcRvYU9pbZB0yoRMEaW3UgBPvp
	kdrrW4iZJoV66kkoitblC1AeN2/kaEaBXu6vY3X0i79gXWVIIULM0qbrfjZG8jMg
	6ZHbsRqYxjBNpd4l2KisKFZthmPaql4mpzC07PQrZREUmgf5mndKhhnwpH8mmAN7
	Lpvif3L+deDBVz6Q+hoWkFE5emZiJ6jD2uuDCGXfaaUAMU6+ALHLgH0Qjl072QLl
	0Ckno40xpTArqOGHvcZkj5AZP3QUqcp+uxIb2GG/c+i+R/1WhwJi+RhYNmdMJk+7
	D9dUDEBvErWUe89XeJQ+kUQX9r4W/T7v1haLZ6WhBzJUk/Xg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aptpu9qqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 08:40:15 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b9b9e8b0812so2412591a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 00:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764319214; x=1764924014; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FyjvOrT93IK0JdqBV0g7j6s6KnI/QOOArjhf+zENe3g=;
        b=kujVmwEUeJb8uRs7eGYpflt1mOokp+t1Tz7R5drYqIPq4RV+o7nod33MnfGG+kgJjd
         EOE5lk/osuSGAVYyN2U83XzT5PfvDw47IE6OJL2RZZYWbCcEi2gP3L3nCECpfocrt2s/
         KjEzLnScy5Bn+PnBJINRVnm/fP169hGa21UJ2f7ELbX2Rq+n8SK7tnxlkXeViDfjiSGP
         SY+5ey/Y1NECumLiq6i3cFmqjwKlVwsPoOVDbZ2X6TxIosluEgrod/09Xp3By7wYYWIH
         dmFgU9geeh8JopN9+VpU0AnE7SZ6AaT8++2v9BJTa89FJbIQaPVF9sn9Mgs7f1FUP560
         wSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764319214; x=1764924014;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FyjvOrT93IK0JdqBV0g7j6s6KnI/QOOArjhf+zENe3g=;
        b=VlaO593yaftdKYCRGmRE0aOxJST4g5V863iY9OQFPealCQgfSSwdDE51AEMpXJc3c/
         FqQjhn4N7KtCLta/qrNsifYb4FMxhbAR1+eTtVp5GMwgZ1bdz8PRrTHWqYWSXMeXfltu
         06+DZee04Hm7s9XVMDBQdvJ7zpNcvr8TXCQzZneoIvY8XUznyd2H+rYJegDZ/SlK7wBu
         Fb6q0Ej2+coiagQ8+zZLNXZ3p0tqAz08pI/NtF74kEGZtsngRjX7AoVkSxBr9fobedfl
         /PUX7lJmwS6fPKU76nl7X+MmRjHgrakayzsvKB/iWz1LUaFsMVvQgIKyBeiZ8BhLhRQV
         g6Xw==
X-Gm-Message-State: AOJu0YyvsQpjf19hokEmgoy2GqLWe71BJnpJ3DO4cPLg+VaMRnVcee0v
	2yMeREWO9NBh9tk36Ypa9MejcrchNONKHRY89GdtGKCLhzTc7XKNKES637RO8LiMi7W5iatNSr+
	QMMIwSm9f7FcBatMWrg+sb0Zn8IWtFC6Yfj7wxUk656pZMyxkkJd5h3DjvFSQF3SLam2kt11WO1
	BsfzRk1g==
X-Gm-Gg: ASbGncuRi4Luk25tNHtboBm2fm+DvrXJGkC+F9Q/PhWqKdPmL+qiZs44S+DRMgaH1SB
	2RhZsf9dkMbESIHyMci0OzMrsHeA//4j3HgU9oBdbUd+XlyIksrum1runi1KIUB1g5K11KsTCr0
	61oEkJg+lnIoKfV4zFERRC+gnn0rrJZ21k5WUC7Z9GPV6fbePgZzorQfExMY8aXbQIATHZmu+r1
	CZ2q179MFdNtqnNoTiL5r48m/lPXAvVC4i83iba+8ff5s/HMsPeyNjXZ7z4L9d3gaXgUVYb16Mv
	Je78VEF+vCu+WGqVv0sQtBstGve5AiMxHtZS+9UApgp3zhDgAh4IdqLMb4sW7XG7VHkNitdiUyt
	OSKLckro46UhgQhTYC/TlQl2VxZMq+NtiEgoHTO/m6hdiZvX0Z34Y
X-Received: by 2002:a05:7300:a193:b0:2a4:5a26:25e1 with SMTP id 5a478bee46e88-2a7192a889bmr17062828eec.30.1764319214407;
        Fri, 28 Nov 2025 00:40:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEN/8uTe+LMmFXvJwmlKjU4p0jxVW+ltrTmlqTwd9sFpFTR2g7sd+RuqBpMD5F/Y/J+D3xkJA==
X-Received: by 2002:a05:7300:a193:b0:2a4:5a26:25e1 with SMTP id 5a478bee46e88-2a7192a889bmr17062794eec.30.1764319213785;
        Fri, 28 Nov 2025 00:40:13 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a96560986csm21895872eec.2.2025.11.28.00.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 00:40:13 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Subject: [PATCH 0/5] Add CMN PLL clock controller support for IPQ5332
Date: Fri, 28 Nov 2025 00:40:10 -0800
Message-Id: <20251128-qcom_ipq5332_cmnpll-v1-0-55127ba85613@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOpfKWkC/x3MQQqAIBBA0avErBN0KoyuEhGlUw2UmUIE4d2Tl
 m/x/wuRAlOErngh0M2RT5ehygLMNrmVBNtsQImNUqjFZc5jZH81VYWjOZzfdzEb1CRrtLK1kEs
 faOHnv/ZDSh8Sc32zZQAAAA==
X-Change-ID: 20251127-qcom_ipq5332_cmnpll-bc27e042d08d
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luo Jie <quic_luoj@quicinc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764319213; l=1924;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=1LPipc2kKLFebvKgTNK8Y5aNJuXIWcXIdUWnSMq01L8=;
 b=TVcFMcuwsQL16OBI9wMcCOxo4rYg1lU4kVmQaKPmdaWwepVEJ35864isGuv9o+KI2yfGP2Xzu
 t8njy/VRUmmB1Tpt/KFp/mc7CA7q9PBF54P5JcAqDaWEs0nfvcWQxyQ
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-GUID: XCN_3KxWJVjxrw2hysE5bbT-sNc3OBGb
X-Proofpoint-ORIG-GUID: XCN_3KxWJVjxrw2hysE5bbT-sNc3OBGb
X-Authority-Analysis: v=2.4 cv=WIZyn3sR c=1 sm=1 tr=0 ts=69295fef cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=NSFUn7VNba4siFXGTuUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA2MiBTYWx0ZWRfX+d8g1ohjTn2j
 tiC5/0aVk7jsy/uVRzCpqtPGoPlL7xJQUL/8TcjunQK+hUOh8sSn0cUDlGFQxw92tPo+5Z2fdsp
 BjtIVoNKJHhfvbmMdXBtG/83Z6+XsED6LcrxybeQ77yKxYjQ1t2CAKt3+zawamJCcLA8pvpGkhe
 +TkjMXF7CZANkvcQ9HKLZBUXT+3hHWYUY0I6ot/SDdn1rpqIQu/m7IdMSYnJM2mWT/V2aP6+aPP
 tJ0JOcTtaLb0wLW/3sE11fUXsuuXPw5Zb7ZNyehL45qQv/5Eva/bNotRnMJvKBYh+2rVjCjfgvz
 yUxAQQX1oB9P2G9kk4YaV4C5SK7oXq/FppVcjT8h6yU7sP+/w8oGcLbi/ff6w/t9incm29UDobH
 USxjLCnyiaA1qMjDupGS+ou+P7BGjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280062

This patch series adds support for the CMN PLL block on the IPQ5332 SoC.
The CMN PLL implementation in IPQ5332 is largely similar to that of
IPQ9574, which is already supported by the driver. The primary difference
is that the fixed output clocks to PPE from the CMN PLL operate at 200 MHz.

Additionally, IPQ5332 provides a single 50 MHz clock to both UNIPHY (PCS)
instances, which in turn supply either 25 MHz or 50 MHz to the connected
Ethernet PHY or switch.

This series also introduces a SoC-specific header file to export the CMN
PLL output clock specifiers for IPQ5332. A new table of output clocks for
the CMN PLL is added, and the appropriate clocks are acquired from the
device based on the compatible string.

Account for the CMN PLL reference divider when calculating CMN PLL output
rate. This fixes the doubled rate observed on IPQ5332 and is a no-op on
earlier platforms where ref_div = 1.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
Luo Jie (5):
      clk: qcom: cmnpll: Account for reference clock divider
      dt-bindings: clock: qcom: Add CMN PLL support for IPQ5332 SoC
      clk: qcom: cmnpll: Add IPQ5332 SoC support
      arm64: dts: ipq5332: Add CMN PLL node for networking hardware
      arm64: dts: qcom: Represent xo_board as fixed-factor clock on IPQ5332

 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |  1 +
 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi   | 24 +++++++++++++++--
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              | 27 ++++++++++++++++++-
 drivers/clk/qcom/ipq-cmn-pll.c                     | 30 +++++++++++++++++++---
 include/dt-bindings/clock/qcom,ipq5332-cmn-pll.h   | 19 ++++++++++++++
 5 files changed, 95 insertions(+), 6 deletions(-)
---
base-commit: 7d31f578f3230f3b7b33b0930b08f9afd8429817
change-id: 20251127-qcom_ipq5332_cmnpll-bc27e042d08d

Best regards,
--  
Luo Jie <jie.luo@oss.qualcomm.com>


