Return-Path: <linux-arm-msm+bounces-63360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3DAAF1185
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 12:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40F225233EA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 10:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1CDF25C819;
	Wed,  2 Jul 2025 10:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fSz5qL7/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2795B25BEFE
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 10:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451480; cv=none; b=OaxBMMGx4lBI6XiWIUQ69tbZUr1V+SqcV6r3DamZ0qWIOSM2u6CnNieMRimW51ISwG/F/JuINp5e7QLKsVUcWcodEZO0fXvT4j95E+ck9X5MogIdXN15HN+xOGiUWK0VmL2SuGwVYhKVbSS0gIqbKwuYPpjhkL7REjQpfzmJDz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451480; c=relaxed/simple;
	bh=77ZuaHveNvhSKbkxNFyy95qf065tME6iiMrltKzTBxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WtWycmG6RSXOaKmQA+LWM8heZyk29b6MH92nf87F3187qW4PlZDPJLjXEj7U86CjXRPtdOxonSDs25KjmjAkU6MagP1+KSh5X9ce52ikyW/yzc9+PzPCjHpuizGi0TxXkdk1/u7jkLTVQiiYZCA0RM0Wb9Mmrc+gvM4v4z9rbPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fSz5qL7/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5626dEgl000324
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 10:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T09UNjHK+2hSBQr84lcaxG3C3fEEMAoZA13KF8lWGN4=; b=fSz5qL7/nS843xYQ
	uDx2PTWKJPw6smYsUPx3m80i/0aeuZrpyAsvYItMkCTCF4o4Jxk9dIAwv7EP2wGJ
	X4tcFn/Xk7ZG5fZPjo642LB64qXKaJBR3hmA3qfI6OpQdgruKNz4AVoMZqx5Q78k
	rwVgGrAHPo7cNSPUf9im5KDg1LRJcIvWOj/sxMn9SxmbhilowaznIZowFrZjTSfI
	Iw33hintisYsniUMth/gN8sbJTFfQUjDGlf7BOfNvroZoYu44jLQfCgLCzkNyPeB
	pIF97fP+FiXI6L/LvgcshD8k2UoesyPIUGxMosX80x6ZCTjWHRXWo3gKnedZxmsv
	NEhi9g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmc5c7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 10:17:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2fa1a84568so5127296a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 03:17:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451477; x=1752056277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T09UNjHK+2hSBQr84lcaxG3C3fEEMAoZA13KF8lWGN4=;
        b=OcF9jXqrE6Z9AJmBh+ok1yqOqfqAaKX15k3Irnok2iCsDnWDvoDpMeGbf1yQOxA1iP
         RXoDsF8GaNkgNJ4JLmpy2Li0OjkdRyaO8SJRomfG7n5tMBqiYKRDFPSSDJbYOLzeh6Br
         KV8kSgWsITFm68uP3j5rviPbugTtAaNpOSi7TgQ2Q40DvAizQIrQSbvulZBGC82aPVCb
         fowja1hTfI7WLV6nD3oFClW+4C0lP3Fjw1Dw780oh8A94cfKW2vEcivqtjHzO5ZzG0FZ
         3Yd98xkH/J+fmublR8D75orH6jjhh9UKu//CJiXySHQw1kI3BBusiukLzgqHpoCpTgso
         /isQ==
X-Gm-Message-State: AOJu0Yy5Klz8i6iFngvgixgd+psq/l7t8uvTo6u96LFMJPltx+BDYVUf
	HBEf05JewzModgUVeFNr7u3SvHdPXpMLh9wUTcRXs7TsrL1paKBIkjqGdEzqNGSkitYCXOj17+c
	hPDbXLNvYhCxo5lBHHCOl278hQwlG+US9rbxlWMVSvooooQZI0VqoS1XT2ThSd3zI82SX
X-Gm-Gg: ASbGnctzeuqTSemh7rl05NWazkNGsFU6TniQxfgBu96j3NAJS8z1eX1tykZS4SebC9H
	E+1eg7HRYQxEOR+ZV2Zz/P89qeoe+1dQb9Z/+DsZakTuEnU6FYRhPXVkIvgC/vnUT2RaJB7HseH
	QPVmvouusVDPa/VQWadahYmYTDHgdkVP10lX8dPca4pMoECDM7rUq0t4ZY4cwQpYnzzuwhIRlcm
	cga6kHGvZKymV5/6sQFxOYtUuU+Zx2/Vdv5s7bZb/8gRxnk+tZ4QAgsvAiN29ZsNsU3gFTPG19e
	mqYc0efXx2GGdGxxQqgnm8cj17CAWslY+9IJM6YRdec2VhTEyGHQRVu4Ug5zNUiiCggSWDKj3+E
	l2x0n5pIux0o/TcqGUtKB9O2itVQbSxRbQGcE//xfgkCHm37EaqwTS5T4fA==
X-Received: by 2002:a05:6a20:3944:b0:215:dacf:5746 with SMTP id adf61e73a8af0-222edc659demr3809120637.19.1751451476645;
        Wed, 02 Jul 2025 03:17:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyhtoak9EuObS5+zsZc5vBQamU5dSqk6hcFiDb6UWXhvdbnRmO85R7+EK94e0PzBqNb/9RRg==
X-Received: by 2002:a05:6a20:3944:b0:215:dacf:5746 with SMTP id adf61e73a8af0-222edc659demr3809085637.19.1751451476244;
        Wed, 02 Jul 2025 03:17:56 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55749b9sm14486315b3a.73.2025.07.02.03.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:17:55 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 02 Jul 2025 15:47:36 +0530
Subject: [PATCH 4/7] arm64: dts: qcom: ipq5018: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-imem-v1-4-12d49b1ceff0@oss.qualcomm.com>
References: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
In-Reply-To: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751451460; l=1172;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=77ZuaHveNvhSKbkxNFyy95qf065tME6iiMrltKzTBxE=;
 b=KJfuhcl/8ICPaBzaFfh/exbJzfleF8zPULmyFMS2dYsoSw+8BFtFP+sEdgQgTwO6Umy3eTkpC
 8/JauUBdLBRC+s9vu0KxtMM2gJYK11tHkZEn5X4/aoGaEpKLRXeEWEg
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68650755 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=LzuAw_qlYXXAwiqMVrUA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: bHqAp4SAWjZfuR-rCuSsDjcI1rZIm649
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4MyBTYWx0ZWRfX7J+ZxTg0Jyo4
 qlMTulTdkv2VVspZiil6lJrl6827jlla4Mu3eSuR/cbMR5vU80GtWlTEjfatCsCOiafgAy00vIE
 /BerUDUfS+ebaUByC4ln0U097XOGj33AxKIcIE/ZD1uTeEHzJbmyxrLPYcIfFicCUykFyTF93Jn
 Drb0RGpxaZsQ34n8bSqcxIpCZsmFdgD1vC+p8yl68tUdDSLM9C8/+2RQRomZVlpxvY1mUCpZCdk
 VG/ywFIGtowvLl/8fsz3ArpI55XY1g+1bRKGA6z+QMhdCfX1qXLs/v95n+LI9Wuh5qYu8hLMYXq
 ubYHSjvw02/VF3oOfAmOFyAPDa3h1t2PJp+BzsuJbBu9RJB4SR1VdOCDsg5Ei/jbqRBFL9e1FkB
 nxL9MW4h2onod19De9jwAde3zytfFN367EOUmTB9tjEQA4cHBVX81spNL2Oqdtdptmc1md3n
X-Proofpoint-GUID: bHqAp4SAWjZfuR-rCuSsDjcI1rZIm649
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=765
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020083

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 80KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 130360014c5e14c778e348d37e601f60325b0b14..c57d855e373b7cb26a3533f4651df078c1188fd0 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -278,6 +278,15 @@ blsp1_spi1: spi@78b5000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5018-imem", "syscon", "simple-mfd";
+			reg = <0x08600000 0x14000>;
+			ranges = <0 0x08600000 0x14000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb: usb@8af8800 {
 			compatible = "qcom,ipq5018-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;

-- 
2.34.1


