Return-Path: <linux-arm-msm+bounces-66785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F4115B12F31
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 12:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8947F3B9E6A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 10:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6EB20C00C;
	Sun, 27 Jul 2025 10:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fOx5Na5+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2909207A20
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 10:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753611789; cv=none; b=hrSbOEJbXXQ/1UViXanf5hHzT5GHK516DyWgSttkWFxdxnQ5oV13/HaOK2nuGHnXsqqTHhBnsdvZOUgFlfWmF79ZEtmcgVHH+g81HC0Umn/v64vbVSMSQbksgYC5oxnZx+s1ILBUEdrwd07sdP9i5P1jlYL9Ug6IKEjeyQ32F4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753611789; c=relaxed/simple;
	bh=zsNDOxtssyyXKwrA/Xqhu6xlTQfQcZiumpCvpHLeiVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FPgP2Iz8/Fsrf293ylYmzOXf9vBHocOwhA43Lzk/sUrPufJRmsYeRFbgwiVjzPYZY9juzKiWyOk6FvwkRsHj1RFpPr/r9frP44MkIRwtkYAVieppZUR4RcMvAA/lyUCLZn8Fp2yb+ypdI8gTNsI8qUZ7nvdyOpCYxry4Zrxwb2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fOx5Na5+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56R4LffM019358
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 10:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K9lCHtaEWJJtL5rVllaD+CR/7jxFq0pVmlc9VCIqSOw=; b=fOx5Na5+yJX7QcjJ
	+D8ruVw5Bc7kYIcH7JxnxYR4LOO8gmnbhymhon63OpAPebOrApIwILcMl+NAjAEr
	6qZLYh9noYhXpzVeWMwgScgAZ73TyRcd0I64L3VJClQf0+orO482Vl1wvL2MspVR
	kYkt3MjMcua2sVOUV++zgPo56BkfEjtIfRnVJ43Kq+SNsimu53vwHsK2OLbEfltH
	QVpSiVV38N7xcsFr2dYoetYmlbKPEGzsojm1QMIPflVWUMSuo6tKCAxSwwMRL4Mk
	p1+z7NY02pWD91oipfv3VXPMR2z/dMNqn6KyRXdBp1TfJQIq5KAylMD6N71U13oS
	ufjsfA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm29yjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 10:23:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23632fd6248so34847135ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 03:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753611785; x=1754216585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9lCHtaEWJJtL5rVllaD+CR/7jxFq0pVmlc9VCIqSOw=;
        b=D8K8Dd4GMUGHXm+up4YS4qfr9nC+yCklK96gzYu1j1d/2p8flr+VHcqFAXDm0ZEZOk
         OpxovmISL8MftLVAuS+b6OI5qFJV6fE60PP3EATpkHeYOWDsnYiVaNoJpwJdz+K726Sv
         fn2mx0fRUCYkNkKiAm+SoTIIio5zcm7tveIVuMZTre/XvvZHCuf6+FABm9gOfyJ6Amza
         hbO1tWsFcgWSpIJDbOgAwpYTDNKL0+FpXf4gPkLU6aiu6qG0IJf02NziRuyuyKT/YA4F
         Lc+G3Kr2EJc47EYLgys8128ISwA4suln80hTqOFaUmrYYvPDE63dqrKr0IdopQvpEVRn
         w7yA==
X-Gm-Message-State: AOJu0Yw3OB+eTZaXLTd5iWV1mJXZG5GklJawbkzEO5V2Aw70YVjpKhhy
	0FmUweA+7J2ZvI4okSRf4fAhcqjgNoSk1c5Kmrx28EuEYAbS2bDY5SQLbI0Vbb3X+rhWQKzcvwv
	j9pfacIT5DvqqeBp9EO8AzFemPNz1gSb7nQWp3i3B2D2WgkkYGMEpjEN1U6ipn6dQHhYn
X-Gm-Gg: ASbGncseDeAUeQWF6O5fShJf1yUt6OZubn8FGJ9yNl+OA1Ne1l/F5WSxy+b4dqzmsgS
	MMo66dA7lRdtkVQDaWCsvXXGzXRt2ixfpOYtNhEb6xBChbq8JKUxhqg5F/jeyZ8BBMn5wwMONKJ
	JlTfwlWHL6/4VPndKnNKE5A6OaVB4UXk7vza4biGXzbSy75MmT9zwHwsk472xUuNP81mgOyE8UH
	4NTZ+tcmvg35LXVB31q5Ij6AqJv7BMzPdwuE3g4ObJv3zbecq4V9wJkeqTTD1fLqAfh+ABqFtSJ
	0JlHpToyu4dSwpryeMDjj5R3qLd0Ru4bVUNe1Kdw1AD4BDbpesNluJAed5ZCULNavobWc9xUlRi
	FbCdA1o2yU+1SdyySnHvjSg1VTkk=
X-Received: by 2002:a17:902:dace:b0:237:c8de:f289 with SMTP id d9443c01a7336-23fb30cc9damr120223075ad.36.1753611785246;
        Sun, 27 Jul 2025 03:23:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEffSp9Hod9Mf4aXUsaJsrmaY+GjvtK57/b+hyNJcIhI4juMtZi1jc/Zap/MP1wvUdJkllr2w==
X-Received: by 2002:a17:902:dace:b0:237:c8de:f289 with SMTP id d9443c01a7336-23fb30cc9damr120222905ad.36.1753611784809;
        Sun, 27 Jul 2025 03:23:04 -0700 (PDT)
Received: from yuzha-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe533b1esm31869715ad.158.2025.07.27.03.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 03:23:04 -0700 (PDT)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Date: Sun, 27 Jul 2025 18:22:36 +0800
Subject: [PATCH v7 1/2] arm64: dts: qcom: qcs615: add a PCIe port for WLAN
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250727-615-v7-1-2adb6233bbb9@oss.qualcomm.com>
References: <20250727-615-v7-0-2adb6233bbb9@oss.qualcomm.com>
In-Reply-To: <20250727-615-v7-0-2adb6233bbb9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Yu Zhang (Yuriy)" <yu.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753611779; l=943;
 i=yu.zhang@oss.qualcomm.com; s=20250625; h=from:subject:message-id;
 bh=zsNDOxtssyyXKwrA/Xqhu6xlTQfQcZiumpCvpHLeiVE=;
 b=w0R2/WhIyOdaw3Fhq8slMtc3HXofznoztUpoYdRqstMtPQPpAEfGHbxGo85HknOpeuNmAW5TV
 xTShKiJ9oojC1t5IHRHFwyFfWmXKexEdvENrdVXzQyPglqCuF4JfBcq
X-Developer-Key: i=yu.zhang@oss.qualcomm.com; a=ed25519;
 pk=ZS+pKT1eEx1+Yb0k2iKe8mk1Rk+MUki89iurrz9iucA=
X-Proofpoint-GUID: iYXYDurnCwuQRtHMHhqvJL5YxJbxZc4C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDA5MCBTYWx0ZWRfX6ltTSREBFNf+
 ajhUzpftOtUbmwMZDbDe1cbqGxHWMX+uO1qmyMQgP/09R3LTqQ1WofikeiY1+/87uWQLaEiPle5
 ojD7LRhcCHKC6YVKCQxpc6MSEkpJv5nPCDB80rGUIEyRKGVC4KOF3WE+FiY0BgwHDA36lYujoI3
 3T4VQ5Ik7OnWVy4IeEmkmvKD+EFus2Hv+ruMmOkLpiH2AHBs+ThD+oLjtyLHXRDqEo5EP2NiD9j
 WPhb1EhZRY86xjqD986QIh4CyJ/Jk+fmsKulhHZlyw5oB/NyHk0oUc3sOFdgYwwka6J57+nQtN1
 dw4w+cEJP12hDBiQIXwUPj2VwbO7jDA3sx6z7qL22gJBBWlCm7g4VBpPbyQvzOJS+q3BdOaW+dF
 SvFXZDFKLBPN0zhIiggKRGx8pIk7I8NYUyQii2Sj+f2UTz+FEfqcWqiKAUrCvr0+7hcW8sp+
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=6885fe0a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=dI-8CA4c5Xf8_vBnWYsA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: iYXYDurnCwuQRtHMHhqvJL5YxJbxZc4C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=991 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507270090

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


