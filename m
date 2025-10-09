Return-Path: <linux-arm-msm+bounces-76541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C9CBC7852
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 08:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C7CFF3514D5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 06:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B76B296BDE;
	Thu,  9 Oct 2025 06:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YjJFE0/r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5181D61A3
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 06:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759990757; cv=none; b=S3elRg/Mu+VlxMbWTMeXLSPy2jMe24F0uGgaZrVzM06M24zR6IpYgpBORQ8ohM+h20f2BtkxPgLILdJ4fGST7vmjMQWo9mo36rJgP46YQY3NsDHGeAe8+uv/eNu1/cjkn3K6Whvih0nIrPcmGmyHAthMEQ+aP3T2gNUkPVe8Elk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759990757; c=relaxed/simple;
	bh=RElW/V0Z435eecAoQxgFffr/tjQtz6OYj7jJiPqLdnw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tfJj/oX2/rSwffT+Mh1ocqaqzbD0ee9La8ksApJUC4vPv4m3kyIvw7ToS9JYUE91PvMXRun/KyE8GWIuorxbujS/M7+WxgP2B6+Tvpu++0ARNzak5O+nWjaBQ6pt8LlG4ATDyHvO5QtQitvvzm3svwXKQmPPPT/ayzjrNjNMMQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YjJFE0/r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996Es5i024408
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 06:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=27kHMdvwH0X0328kYvOzhu
	ArDwRqIDLbTEsO0hy9HCs=; b=YjJFE0/rII1owim/UA+hyfDgNMuDeEEDElg3Iy
	B+juKA67PUZwgbom6twBx2RXIt1JjYmLShtoasVUiZMnv5be0KwZ5NWvGScDroHO
	lD9xXANlGq1mSs7xJoUflN/8+fXF/aQAoXn+QDygvzO4nrkmNvei+VWz/S+O2xJR
	qZYD+5LBVLsnQWCNffzEpxK6lJ8XikT9KOznD4P9/7Wg9WCRN+xRcW9FOw5B4xcx
	xU0opuJyAZuTC/k1d93/faxE4qYXdGUZCbSFsSdY21JTd4c+M6NcUDpZXzMIWT+C
	RReJnx8vGiqeAMwagGmXhYmTLKN6SLRzg6twbWnxd4SxO0zw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m1pwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 06:19:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4c72281674so714964a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 23:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759990753; x=1760595553;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27kHMdvwH0X0328kYvOzhuArDwRqIDLbTEsO0hy9HCs=;
        b=NTeTEoA9+AvR4HqR+DIweTy8g3KnS1pKDPf82PcmxY1tXEJZ/M6w+kMWhjyVcznZZE
         YD3AA1yLP6DCCfh0edpyPYOPdGIXO8NVZHqlyMkLPrR2+BQ0yG+nbac1TnktIa1W3V1w
         P+YwuMWiC9aR0MZi8VsuS8HAAAdHESlQiSTUWgQOtFKNkZu1RBTjEyYrlULpfn32MP4X
         ul9joVh0Rgw2It8pyw0enyMdQVnNLqpPZyrFg7JCssLCXnDC6gm9IVz19segMsDrDTJg
         3CKErn0sCmmcZT11GEIoZSiqWJRTlbNWLuRcvtcc06Xksw2AFijnk5MvetaWaKgDjSF+
         T3pA==
X-Gm-Message-State: AOJu0YybryYJMVDTonkYAwcqVuqxGyNmzacxM4l4aCIVdbeWd5zewLub
	aecA0wouyH8Vil+sr3dLQq345lhIOI2QiF/c4vtHedfm0JCBwuZGGA+S2Sf24stREUhvVn+PkzY
	FiLWfSPaCkZFz+L0OdCuNQVkBoRchqNT8syAIVCOem5hTXDpSguGgt2ek6ag9WAtzpnUC
X-Gm-Gg: ASbGncvypQTU/Np44yNQCT04VrWZtZ6Jh0baC4BsEDTS2bvEthG27vTSruAdtSQeT5Z
	U1j/DcrKVE22HmwqyTMsSJEiz2Pbwi8qHLf4/XCk/U/0y2D95fL+wp1khNtpvCgnNYeYy9NuKf8
	307eduv7V0WQngOioOcYM41DTptnWbOrLbj3bBng3ljKLAS7E3Y7W+3iKOST7GwcmIa8ElmOQyg
	iB405nhwRZSafEGdoGIa8xarNW9k8KqQ0MYoZ65K1ZuMEMlepuUOsR4gbQpGo/8mAtJCAgTWt05
	gvu9S14/xDu1lfmCe7cTA/gHOX5w3ONtKRzGsS10jvytSZz/JEpEQ7oCbBfMCBrz9Xzaa0qfv6u
	ICW++H1Y=
X-Received: by 2002:a05:6a20:6a1a:b0:323:cbb9:aa1b with SMTP id adf61e73a8af0-32da845fef7mr8847874637.51.1759990753255;
        Wed, 08 Oct 2025 23:19:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYwiXOhov/LxmRkYry+Q9grSkuraWC5lKuqWh3Ov3GOZp6ZzGWGHWrshn76JtzwZKRRdX/NA==
X-Received: by 2002:a05:6a20:6a1a:b0:323:cbb9:aa1b with SMTP id adf61e73a8af0-32da845fef7mr8847838637.51.1759990752738;
        Wed, 08 Oct 2025 23:19:12 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099adbcbesm19239671a12.4.2025.10.08.23.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 23:19:12 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Subject: [PATCH 0/5] Add separate ICE UFS and eMMC device nodes for QCS615
 platform
Date: Thu, 09 Oct 2025 11:48:50 +0530
Message-Id: <20251009-add-separate-ice-ufs-and-emmc-device-nodes-for-qcs615-platform-v1-0-2a34d8d03c72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMpT52gC/x2OwQrCMBBEf6Xk7ELS0ir+injY7m40YJKabUUo/
 XcXj28G3szuVFoSdddud00+SVMtBuHUOXpieQgkNna978fg/QTIDCoLNlytI4EtKmBhkJwJ2BS
 WlcqiEGuDN+kURlheuBpmuAwy03CemZmcjSxNYvr+D9zux/EDOpnIN5AAAAA=
X-Change-ID: 20251006-add-separate-ice-ufs-and-emmc-device-nodes-for-qcs615-platform-83ebc37bdddc
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX4NhaKjz948rW
 GI42LWUZwOgsOM+M7E8O7vmfNDVk4nFQdiAeo7i4PDNiM89nSYTuSEoyaRxeGBAd2iQnjYwrXCm
 E5R3+JNxQGWOEx7wP+E6bKyxSCay6ulNzxStHCwKg2YQt/uKZFhwJ9PgVn85N0jHa6JdAOgc6wk
 UQF5iXEyFNsyNeXeni4Tk1RCBvN73lWP23Tda8q7dyNhYc+u5ba9AWV9vuGuHActYBquxq/UvLt
 y/zjRyjVwCOIRJpKsTh1dE6shQrGSM3GO6knj0hA6UJ0KHfvy56HqEHhD3GM1+I6Z17mlnR1SC0
 RAHVB7eAUlGi0as//rDqR8llTeioz4OuKdAenrcQ67cutCosQ1Z7IUG8xOnkNz7KJMT4eUp2Pnx
 yiNLrnxooXA5yEyuYJn3/tcUS/3GPQ==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e753e2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=TE4wMAv-58-w6rAmtzAA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: ohLEDV4xe5xukyj7zi58rJmrdWUrBE1E
X-Proofpoint-ORIG-GUID: ohLEDV4xe5xukyj7zi58rJmrdWUrBE1E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

This patch series introduces support for representing the Inline Crypto Engine (ICE)
as separate device nodes for both UFS and eMMC on the QCS615 platform.
Previously, ICE functionality was implicitly tied to the UFS/eMMC controllers.
With this update, ICE is modeled as an independent hardware block, allowing its
clock and frequency configuration to be managed directly by the ICE driver.
This separation improves modularity, aligns with hardware architecture.

The change allows the MMC/UFS controller to link to the ICE node for
crypto operations without embedding ICE-specific properties directly
in the MMC nodes.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
Abhinaba Rakshit (5):
      dt-bindings: mmc: add qcom,ice phandle to mmc
      dt-bindings: crypto: ice: add freq-table-hz property to ICE schema
      dt-bindings: crypto: ice: document the qcs615 inline crypto engine
      arm64: dts: qcom: qcs615: add ufs and emmc inline crypto engine nodes
      dts: qcom: qcs615-ride: Enable ice ufs and emmc

 .../bindings/crypto/qcom,inline-crypto-engine.yaml |  7 +++
 .../devicetree/bindings/mmc/sdhci-msm.yaml         |  4 ++
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  8 ++++
 arch/arm64/boot/dts/qcom/sm6150.dtsi               | 51 +++++++++++++---------
 4 files changed, 49 insertions(+), 21 deletions(-)
---
base-commit: 47a8d4b89844f5974f634b4189a39d5ccbacd81c
change-id: 20251006-add-separate-ice-ufs-and-emmc-device-nodes-for-qcs615-platform-83ebc37bdddc

Best regards,
-- 
Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>


