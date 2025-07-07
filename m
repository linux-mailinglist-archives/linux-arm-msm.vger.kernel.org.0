Return-Path: <linux-arm-msm+bounces-63874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B66BAFA9E9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 04:51:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBB197AB8A4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 02:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5FCF1D9A5F;
	Mon,  7 Jul 2025 02:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i0ZJvzJX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452811CAA85
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 02:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751856682; cv=none; b=qyg8HB46BEclMuGS4G2aklX5f0zbZEoGVO/+BLwD/YGemfd9pJgJlo7fY3Ib3G+oxIoW/V4df3rqQR/yTLTq4HJrlwDuHL+XUwsk0EKkv/yOfjZ1L1EJZAg5WV8FANiFrR9+o9CvMAvAw2+lvfyCEuvk4pV6eESH8ZWNrgv9w/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751856682; c=relaxed/simple;
	bh=zsNDOxtssyyXKwrA/Xqhu6xlTQfQcZiumpCvpHLeiVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eMEAtdLtK9au49LcumYmflEbqsztGNwFvVsg0XkmcHKh30eyWcUmBasHZPdU80Mkq1v9CQGBc1tgwzQnHZ+RZIGosp+gW7BzK5qjfBxV7M9aRcERxT0XhTf9QCKxoCTUnigwtZ+3XN3uH5iJ0vojUO/EYovxYdFh4AklydaBEkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i0ZJvzJX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566LWjaq017104
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Jul 2025 02:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K9lCHtaEWJJtL5rVllaD+CR/7jxFq0pVmlc9VCIqSOw=; b=i0ZJvzJXbVDkPZBW
	+CPfZSBE6VhPrLKaCiagYHJ1z3TPfBsKC4mfTLhr5v91Mt0WaZfYhUXqvnTxY4bd
	zsn3f0bOrtAEBdlHb3ZifoXw6Fn0jAwjZXFuB8OA/7G3magzi9FnPfoZ+H0BVpiq
	mz1Htozuh7Hm1t3suXUa3o/3DCkTNp/LZkEm9WHNdTeI2f8HxJpJVDe5l77txRdM
	BnfKcx9u+jWf7rHAMMtrkfSrJyza8S1WsOwMuxRiPGOczWArmLfVl0jAjP7NPkoL
	am1MTRe3UwOFwVShZ1RO9HWuCscC/ZWjTZNn/jZBoa65Rhh7EXGKROwqKRLWj87S
	FeIVzQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdqgq7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 02:51:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-234906c5e29so36741505ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 19:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751856679; x=1752461479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9lCHtaEWJJtL5rVllaD+CR/7jxFq0pVmlc9VCIqSOw=;
        b=TStrahGcr2RFHKqLlISDXIFTbsGidcTbnUGmVmoCJgbwPqBdShN2I74s0mN26qCVrM
         juPGAFLnoyNNA66KxPl1T1VUXCyPHHcoA5r61L+5Egch/oOoCHy33r6Y0FH+xnhLY96u
         nc/LChU/NHZaYXG7sPN13hw/pomssgRVzgnUmjgQb8VxrUuHiEyDFVMXEVxY/yyCg6C4
         MwH3UowlmQRxgSXl2olw8q+s2jH9XstNZNXVBEvap2YIXciSSjPn7F2DmNEnRFXLPjrZ
         EXxaFOAZRj960mV6D+rqn+5rVSNUkqiPzVsOHAsdhx+JDU9UZOHlM9M6vGmDdKLXkKkT
         n1Xg==
X-Gm-Message-State: AOJu0Yx+iY+490UGMxolb4S6N7wgw538XNwHnWDB/iuGld46VGP05/pA
	Y2U/7LoIQzQdqtBlArUBXAe5hgV85pLKvQmJy3T4vnsPDjw2Ni8Bl+AN0yDabC3rFU84V5gUKqL
	MrKOiO0By7QmnxNw79Zb+TkmiONoOluKR01DpCdudfe8hifBsFFbuIfYa5iJtpN/b+mmR
X-Gm-Gg: ASbGncumyK8TgarU7CKeVZcxTlsxAo9wWd4PUXhRkDz7O6oCNFuZcqL+kWw+Rmntd84
	v15ELiqGnRV7AxXjRVyYwoCWdOfDFSmvhvJMmjx/tv5wcMKMD/U2NGM/u4u072o6tqJBGqtao6F
	fG/jpJSBXPQJp58cAxcq///Mw52wAkOakGpKwbRjdRGEO9HYs8ai6a7MYdHXr4nBpZhvB7unMsN
	Vu/LZMPKl+keRuATO6nXbOYjXXqd3GrnStZBfAb0kQdGer+BE7asvHm4D39ZWJByIDURTq4466r
	wr7avkRfVF7z08Xj6FtpP/rGfQrH2gVZ/YJSEUA10KedGNO39qJ7283XBhSyjUk7w3J9eFs02y+
	vwRgszs0gPw==
X-Received: by 2002:a17:903:2a85:b0:237:ec18:eae3 with SMTP id d9443c01a7336-23c85d9bf04mr201496335ad.4.1751856678746;
        Sun, 06 Jul 2025 19:51:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFc5s8qkeSZbv5wDCez5mkcb0QGqHhrfn4YDLFi9kCALY7pLII/zVBlA7LtNzhjAnxVK1Rxbg==
X-Received: by 2002:a17:903:2a85:b0:237:ec18:eae3 with SMTP id d9443c01a7336-23c85d9bf04mr201495995ad.4.1751856678286;
        Sun, 06 Jul 2025 19:51:18 -0700 (PDT)
Received: from yuzha-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c84593e0asm72478025ad.193.2025.07.06.19.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 19:51:17 -0700 (PDT)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Date: Mon, 07 Jul 2025 10:51:05 +0800
Subject: [PATCH v4 1/2] arm64: dts: qcom: qcs615: add a PCIe port for WLAN
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-615-v4-1-1a2f74d167d7@oss.qualcomm.com>
References: <20250707-615-v4-0-1a2f74d167d7@oss.qualcomm.com>
In-Reply-To: <20250707-615-v4-0-1a2f74d167d7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Yu Zhang (Yuriy)" <yu.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751856673; l=943;
 i=yu.zhang@oss.qualcomm.com; s=20250625; h=from:subject:message-id;
 bh=zsNDOxtssyyXKwrA/Xqhu6xlTQfQcZiumpCvpHLeiVE=;
 b=BD/wbKXjCXQ8kuvJ12mzIrI7Z2PnJYg+SAheI1K5cLqtEyIwlMBTiGR8eGhSwea1YX7HKVeCK
 sidzOQWEEiAB3iSVo7FZCWjunjmcm3f/mNb+Fxe2GjDh5FEIa9Wb6c8
X-Developer-Key: i=yu.zhang@oss.qualcomm.com; a=ed25519;
 pk=ZS+pKT1eEx1+Yb0k2iKe8mk1Rk+MUki89iurrz9iucA=
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=686b3627 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=dI-8CA4c5Xf8_vBnWYsA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: rr_ObCD88Ifwks4dQfyKet2XQY4uFN_R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDAxNiBTYWx0ZWRfX8knVCV7zVihB
 CeS5bG6h5hCgtlN164NJTQMrgZFxVZ2FJrw1UKZCxiPqnylu2xkFaloFO3MvmjgH93a4k5/TJmE
 gqEMjj3TI8uXZ3Qa7vlGeS8bj4RnoUOrF2zkD/+HGMsyXOSGTLzkvNmZfcy2H38bS3Q5SRfFbU5
 6v+pu44oOVN/O9AVYkYQz95G5G+0tWgDEzANLfMzkUHRqslnugNNdr5Q9UMxSwqotXPZeUsYjZt
 yZqZDMisFXSX110AU/YQaVHcsXVcgOWtsYQsJoMTYxMtQ8O6heT3ZTD7EI4YYPojc1JzN1s4DnC
 XbxaxPjgtkfL/EeFj2OMjuPMHFj48im3xncWYthkXmmpxrrSozu7WNuEtdxBVAeNHOFRSnu0PUI
 INzxOon853HHi0oHJP16Ow7IyCVlBUEtfH1HzeIOPD7TtPAqFqOnDKtgOWfcFqVuCUQiY+w7
X-Proofpoint-GUID: rr_ObCD88Ifwks4dQfyKet2XQY4uFN_R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=966 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070016

Add an original PCIe port for WLAN. This port will be referenced and
supplemented by specific WLAN devices.

Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index f4b51cca17de5518aad4332330340a59edfdc7ec..b4fbed517cde18e088096d182fe6b482363e403d 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -1173,6 +1173,15 @@ opp-5000000 {
 					opp-peak-kBps = <500000 1>;
 				};
 			};
+
+			pcie_port0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+				bus-range = <0x01 0xff>;
+			};
 		};
 
 		pcie_phy: phy@1c0e000 {

-- 
2.34.1


