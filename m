Return-Path: <linux-arm-msm+bounces-88778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E57C4D18C19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 13:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1BD3305A565
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 12:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768C53904E9;
	Tue, 13 Jan 2026 12:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JgVOlV3j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iKhaoOpM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6036038FF10
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 12:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307614; cv=none; b=FGCChQJt/Na10SRo4SYQPfQRZyf6OLCETqscFc4gSox9IhnWrZ+D9vLMvQ31IXbuW2OAeJGtxYlJUXzGztndglOj3rWSF3+ucLtuOW2YoffK+2dIVymIVRS4KID5oIpuGPy7BFpqFv4InwLhPQzl+7Ees+JF8k9WX30oFURcXF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307614; c=relaxed/simple;
	bh=jV9YVSmg0xmvxaDYubtemA6ix8Y6EsHbhfZrpZsrmIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y3xhFZRQTKFQPwsLUTkiZaGZJMJc1q3084cahiAV3m0P177u3sRIlzSMkrIDKnjPL/KpV+oVN7Xbrkfu1hJP0JD3sLdUzD+Mwx797XUy3iIlPQA11M7LPxGpmACnld3MG4l1mN4WxZX3VsMiZzXrNFvlyZV9/y0lB5ZObtaxIdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JgVOlV3j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iKhaoOpM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5ng3N3735288
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 12:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yxh6B8k3jihNeWs5tigsgEFI7JKeMCafOGI7nzIv30k=; b=JgVOlV3jNlq9P4mW
	Czkj5hJE8BiB8bsVSNLw719K2Qgk70tAq+E6QZ5xXB62PVAC1tzilJMg42nUPP6G
	2XRR5bt8U7xJ29YAl613gn7LwZEEUhj3kZVNLCDRS5aIepLW7gOT7uuk23tJa+Ce
	OO02e18QH5ZisYcXIj4bHd8FuDgfhiu1UuYyP+AnYJZfpXBcxlHTPuhjQcqFAdJA
	A3YBpk4YG6Yy5dFLqP5w+j9PjL4Y23x/xCvPn27C5/eWGdmZ0Nu7O6AG+RZZs5fa
	6RmIAAMTOX868R131OUi2tD4xpTQYYMpgkRAzgTgXzeE6V6Ona8Jk6Ah2WMomiaE
	Yt2ybg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng87976q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 12:33:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b51db8ebd9so2536115585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 04:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768307611; x=1768912411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yxh6B8k3jihNeWs5tigsgEFI7JKeMCafOGI7nzIv30k=;
        b=iKhaoOpMX7c646R8wCTB7+9PS3r7BrZDLJTS/6PdbpPDoCYPvXXBFLdoJDevcWvyGh
         I7vOwiDHmALfnWSCCY7fWbRVSuwk/IeKynOIfyAppMXVh56mvM+00+bsP0E1RaekgzFI
         4xySbRN891RJRkZNOcHicNs5+Wbg00nzcMWuByFDIx2O9vxKUGvxBqpywqJhbfq7DqPF
         n5sxWhrhyopSFr84xKLc9cqPSu8wRfZwh0KRl6IriuSUhnV3qPNsAWnebEw51/sIPF9y
         xWuqP1HV9t/t723hRP3DLWj8XouXSR3RFxHrTRQbS0bx3Gt9I0nVb7FEYUWKbkDjz9Au
         nBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768307611; x=1768912411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yxh6B8k3jihNeWs5tigsgEFI7JKeMCafOGI7nzIv30k=;
        b=OPCj+8fkzi7x6B/MRdzmp8P/YOIrV8AZLr9jcFp2ttYuyfFEAskDWF4ySvvY6vgl6g
         DerYMOdB2jvD4CRrtFTZdYS0L/BeWs5FS9UhbzMn9R0bgJZk1CJTIZB7HHESZnp/d+Ge
         xldbcDyMSKb+eNjlIIdNPjKcSUFtCnuHe3MBmAOvEy5yOioUcExGOnRYIEfJ01Jm332H
         hHPOSpWZeK7NANzwWa/YED4sHS4iMgHqFh8ctiuyRGjPywC+b8AXoHdflXb3RhbcBcco
         ltuT9GyecHVVjFHLKv2qL9NCKpRZYBK0MYciAsCGgZGMOhq0G9pEULrox3wG7qBgokfU
         TJGA==
X-Forwarded-Encrypted: i=1; AJvYcCV41YhqHAxHokMVNu0vmujRJ2VuEJqGFrPE7H26IgetX737uVlhEcUtUXAUPgRngu2eDyMeSaaFl/ldOC60@vger.kernel.org
X-Gm-Message-State: AOJu0YyZykDo+YTFaEnQcW6fz2g80W1ao9jKssdqMbYmuV9ncMN5n0yn
	1JXT61kqa692wXb6rw1D6qXfkcwgX8W4ekrnbdVLD8QL1Yo9xfR3d4dM3K+4J/rcz/gqN5/5bAf
	wRz/l2Vn/vYaRlwFfEDQdmYsLQ2dTPLozb1g9HZQcnY4S5PNW93MlBbQV8dPJJJ/SKTBz
X-Gm-Gg: AY/fxX5WAyxoFRbR/SfitArxl/FttKaFxtIio/PVgmkhzviwEjF31WmJmj6kYVWFMGb
	rssLpnlps0dbrOPNUgVJ4NgvlR4XOUwmorYKv0GNRDQaIuZAHN2dnrzziUYizKXWK/7HdGrHtMr
	NCyh6r4fD+6ZuNhJX82jaXkyxlA+3Daspy8PTudp1ocneV3LmP+ag4GbiyJLNk0St7L3az+Lywv
	TbeHTgvWRZvwaYnZ5d9fnlI2Znwv5QyHCjQShWN7gpbyZjYBpYN0KQOq1yKj0h7tDm2wOqC4yuJ
	HlGoI2NK+VUdH+9d9jdicPMxrkEgRhwsLnTOT0bzpivJAz+PIOVbli2ZVdyjyxS4iwuJDj+VnJF
	DmVOM6mLYAKOKo12Dsg==
X-Received: by 2002:a05:620a:4620:b0:8b2:efe7:d82b with SMTP id af79cd13be357-8c389399f06mr2782052685a.30.1768307610608;
        Tue, 13 Jan 2026 04:33:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHY/r3WybAjncHTZdfiXmeOBR7h2+Uyd85HeRu2VOPW9Zqj1njU/vGizWB5hD1ZsyX+RzkweA==
X-Received: by 2002:a05:620a:4620:b0:8b2:efe7:d82b with SMTP id af79cd13be357-8c389399f06mr2782047485a.30.1768307610045;
        Tue, 13 Jan 2026 04:33:30 -0800 (PST)
Received: from hackbox.lan ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8715952fc3sm635303166b.50.2026.01.13.04.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 04:33:29 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 14:33:06 +0200
Subject: [PATCH RFT 3/3] arm64: dts: qcom: glymur-crd: Enable USB support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-dts-qcom-glymur-add-usb-support-v1-3-98d6d387df01@oss.qualcomm.com>
References: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
In-Reply-To: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=6823;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ISv/PcwLMmw/6FOT35evAfeT0Eih0KQ5AmQhHuFmVmY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpZjuRJeSJfRJf4+w/KTS0n8e72/fa2eBfs65+8
 KAkLpv+2umJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaWY7kQAKCRAbX0TJAJUV
 VkPSD/9eDJ9ns+b1VweCi72uB0Lu2iasGrTCfe3BVVRQ91jvGYHw9GHH/+MGwgtMvX9Re1+4CWL
 BeQsN3FXTN0WNboOtk92S9dYWz0AO3u0NfGTc+PfSTgS3DTtCdAIRytrJshHs8wZujuY1G2Dg8p
 boZaghSal6gsceg/Q783POord3qOpGplw5AU3zAILlIo2ro0mcKBfigVixLJBapoJTUw7rZRzCw
 67WIqFQH7sWrVtrzmR9epDEYpncJxfMAiDlxzGp3azlUFwSuDFhV/H9pEGqt6n6RJKxK6e6ypmr
 A+pSn++GU5ZcBvZL+xZC4O8KOqSyBC1MQv8/zHW+OBWdvEjulOonrIt+IyOkYjWXyGvzxyna5A8
 fGXK+P9z+wHboUxeBXDWuv4r7IIzC/I+O2SQ24pOF3/Ca8cey8AJOM+rYQ9Hh4ODpwc3G0h4FDS
 9o8pbzLoxV+sKoBJ/rHu5jyIQ+/hTdDTZ4m2tE/1YoTClLwDaa4rI/qmE7AKwH5cvbVHjsbXP1Z
 d/XUEki8GL5LHv7koluOLK+LPEZt4HROyTNnhTrud5+U1Wk5/St9U6zu/i8I5qCXfHfHQwOW8+U
 Qm/MqEN0u+tSe9xDe7L1w/5SeQFOzHTV3W2YKVETWjumU7hVmfjQ8TqupPJ+R7s5R0OU2yaq41p
 xIai0OpgN99zkwA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEwNiBTYWx0ZWRfX/xHGPtYkaneG
 4NChfT35C5tc5297UvtGguJ5mLXT58f1Z4MNsbC1bg6YVrvybD+o63Ab/GqWr4pcUud5pTyVfLA
 jR79Tm+dM7frzfEMnqNxe/j++KIL+OXouns2TdxhTEqosWBQvd1n2GipxgMGJzRRN6VJMnmK+Z1
 ZVG2fETWxan+TAEzD4w5UoVj+WEOfnsxBigsHUl3a++XA72EEY4ubQPL0LLwF+s1+1W/EJm1hal
 db2M4mhOXxWHk3VNm8nk8gaunJfoE7ufFiBCNJNK62ODfpghMZSTnYrI8HefOqY6DNM7eqXfHMd
 xybuH6xtWuB0zV0x9nKXzfT4dyULzMQZok36h9FDiZUxUlddZmd0J18lqTq7gzu86rhtBWNwezf
 FPXxDZlZplRld9TespzWVWIesJBOOUy+UGvr6w1Ah5GUCu57/Ic2CzEsxkK0H5EIBEUEddlf0oW
 k7aXzbLR/SXsEYKylvw==
X-Proofpoint-ORIG-GUID: 983vs9ig1TfzHKmGpH1XU8fd5wIiXUE7
X-Authority-Analysis: v=2.4 cv=IOEPywvG c=1 sm=1 tr=0 ts=69663b9b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=IZckZgOlll8TeJU42_cA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 983vs9ig1TfzHKmGpH1XU8fd5wIiXUE7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130106

From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

The Qualcomm Glymur Compute Reference Device comes with 3 Type-C ports,
one USB Type-A, and a fingerprint reader connected over USB. Each of these
3 Type-C ports are connected to one of the USB combo PHYs and one of the
M31 eUSB2 PHYs. The Type-A is connected to the USB Multi-port controller
via one of the M31 eUSB2 PHYs and one combo PHY. The fingerprint reader
is connected to the USB_2 controller. All M31 eUSB2 PHYs have associated
eUSB2 to USB 2.0 repeaters, which are either part of SMB2360 PMICs or
dedicated NXP PTN3222.

So enable all needed controllers, PHYs and repeaters, while describing
their supplies. Also describe the PMIC glink graph for Type-C connectors.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 283 ++++++++++++++++++++++++++++++++
 1 file changed, 283 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 7c168e813f1e..3188bfa27bea 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -56,6 +56,97 @@ key-volume-up {
 		};
 	};
 
+	pmic-glink {
+		compatible = "qcom,glymur-pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb1_ss0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb1_ss0_qmpphy_out>;
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in1: endpoint {
+						remote-endpoint = <&usb1_ss1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in1: endpoint {
+						remote-endpoint = <&usb1_ss1_qmpphy_out>;
+					};
+				};
+			};
+		};
+
+		connector@2 {
+			compatible = "usb-c-connector";
+			reg = <2>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in2: endpoint {
+						remote-endpoint = <&usb1_ss2_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in2: endpoint {
+						remote-endpoint = <&usb1_ss2_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -331,6 +422,72 @@ trip1 {
 	};
 };
 
+&i2c5 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	ptn3222_0: redriver@43 {
+		compatible = "nxp,ptn3222";
+		reg = <0x43>;
+
+		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+
+		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
+		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
+
+		#phy-cells = <0>;
+	};
+
+	ptn3222_1: redriver@4f {
+		compatible = "nxp,ptn3222";
+		reg = <0x4f>;
+
+		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
+
+		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
+		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
+
+		#phy-cells = <0>;
+	};
+
+	ptn3222_2: redriver@47 {
+		compatible = "nxp,ptn3222";
+		reg = <0x47>;
+
+		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+
+		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
+		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
+
+		#phy-cells = <0>;
+	};
+};
+
+&smb2370_j_e2_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_e0_1p8>;
+	vdd3-supply = <&vreg_l7b_e0_2p79>;
+};
+
+&smb2370_k_e2_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_e0_1p8>;
+	vdd3-supply = <&vreg_l7b_e0_2p79>;
+};
+
+&smb2370_l_e2_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_e0_1p8>;
+	vdd3-supply = <&vreg_l7b_e0_2p79>;
+};
+
+&usb1_ss0_hsphy {
+	vdd-supply = <&vreg_l3f_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&smb2370_j_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
@@ -858,3 +1015,129 @@ &pcie6_port0 {
 	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
 };
+
+&usb1_ss0_qmpphy {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l3f_e0_0p72>;
+	refgen-supply = <&vreg_l2f_e0_0p82>;
+
+	status = "okay";
+};
+
+&usb1_ss0_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb1_ss0_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb1_ss0 {
+	status = "okay";
+};
+
+&usb1_ss1_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in1>;
+};
+
+&usb1_ss1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in1>;
+};
+
+&usb1_ss1_hsphy {
+	vdd-supply = <&vreg_l3f_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&smb2370_k_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb1_ss1_qmpphy {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l1h_e0_0p89>;
+	refgen-supply = <&vreg_l2f_e0_0p82>;
+
+	status = "okay";
+};
+
+&usb1_ss1 {
+	status = "okay";
+};
+
+&usb1_ss2_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in2>;
+};
+
+&usb1_ss2_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in2>;
+};
+
+&usb1_ss2_hsphy {
+	vdd-supply = <&vreg_l4c_e1_0p72>;
+	vdda12-supply = <&vreg_l4f_e1_1p08>;
+
+	phys = <&smb2370_l_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb1_ss2_qmpphy {
+	vdda-phy-supply = <&vreg_l4f_e1_1p08>;
+	vdda-pll-supply = <&vreg_l4c_e1_0p72>;
+	refgen-supply = <&vreg_l1c_e1_0p82>;
+
+	status = "okay";
+};
+
+&usb1_ss2 {
+	status = "okay";
+};
+
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	phys = <&ptn3222_2>;
+
+	status = "okay";
+};
+
+&usb_mp_hsphy0 {
+	vdd-supply = <&vreg_l2h_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&ptn3222_0>;
+
+	status = "okay";
+};
+
+&usb_mp_hsphy1 {
+	vdd-supply = <&vreg_l2h_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&ptn3222_1>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy0 {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l2h_e0_0p72>;
+	refgen-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy1 {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l2h_e0_0p72>;
+	refgen-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};
+
+&usb_mp {
+	status = "okay";
+};

-- 
2.48.1


