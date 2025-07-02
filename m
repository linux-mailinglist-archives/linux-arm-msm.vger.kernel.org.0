Return-Path: <linux-arm-msm+bounces-63359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C93AF117F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 12:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0FA77A8684
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 10:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311C525A338;
	Wed,  2 Jul 2025 10:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eHnbDhhe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22DF253924
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 10:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451477; cv=none; b=FFqhLUmHCW0VXQhJZ+PvJ72F9BeFIvFdtnZKubX9CKFUHcbuVWnovk8P+I1wneNm9gYXQJ7UrrHpH8JppqoZ8eokgZxrz+NmE0t130nCaD50I+RGzP8W39F223v9ei0ky0bFUW60bZkA1aK8E29+7sWPOLQzehWK0gXZhoVpTTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451477; c=relaxed/simple;
	bh=xzzMzwUChajbRnqt6sZCtMpudF62NJzRt4P4qkk4IBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PUZzhagec4sdowVdXyLtVE+lONDJN7/Hn21pTYLOMdrKi0vW3S3+ZecuAak1dNRWrVxRsfPWdzkvXiMzHJLuU7zQT7V1+muGkZDWeqOGiJqfOei3wfnyIBouNwO2RZlmB9AqNEwQRgnNFxRQX6Q7dfPu0BZQmIXdnCO3RNQ3VtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eHnbDhhe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5624A3Pw024827
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 10:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A5iIorz+E6POrscHAc8h3CoMG34cykm17D1uNtyhLRk=; b=eHnbDhhe0HEYTrqm
	bvcLHr91PmvrxdbzcJ6SjrL94ulTpzyRhhJzUaS+9qqg7c1EBs4d09/8CtAxPVc8
	cH9kpoM3Wayer6daAcIH1+mIhFk07ylN7xxcG4u+sPB73nIQm+ayQX7rNBJ6WPTF
	iEIluAyOv/jKTdqjnGJciNE//2qXJM3xCufTW4cUjZjTEMGgRbj4cyP8KgNxqRZk
	PciVaox5nNJeUJa0C0J6bbXu5aqzkP+H0wAkJD9zERj1LYBmzlthkWGhjm2Dcs4G
	gzIhU5IKPSWIONAZb6fe9vh4iupyDs2gmdELwW9uIyD8PxUL81B/Rtey9HS2F8IP
	Qd+8hQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9m835-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 10:17:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74b185fba41so510152b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 03:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451473; x=1752056273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5iIorz+E6POrscHAc8h3CoMG34cykm17D1uNtyhLRk=;
        b=vOVHnpg3vH4Ol4NbUBhPuqlyzeM01Ygr60RAMuBtAGiuVJJdNVdP9YDimh3mEQ/QXL
         rx1GZKQ0Jt4ujG/gXEOrfxrvqsGTaMKhwFSh3O/fta5ly33b/vzF5dMvPH5DT8hJ+jeb
         v5fun8TfCj/0G6qizuxvhs3P+Q/ykeK+qR1bXMay/7DEOfSzP+wkiAxwoD7FIj2399OR
         kPpCSwXRrCmUGQYxzpJrLytGGc5IXms9WXx3unkeArEEsY3yYgmhHxnTqstHrVaeO7fg
         WVMHjFwX7IMLiqnh46X/RPy/sx92tHcRnWnD0RdHqXRTxg/yigb6UEN3J+vgng1joY77
         4Mpw==
X-Gm-Message-State: AOJu0Yxxke4arheZMQIgYU2YolSPitUVfFxvOCIw6AS6wVcJhAG14Wgq
	aaLMxOo7HN3ycM3oOBjMNTdNDIWJW/nEJ9QmSvftlbOD2GTGw+UYvqEr3HOUHMWVKIoXT3Zq43C
	3Dsnvgk3rAk5CmL9+x5u7oxGIVvrwcUxTqNennN6ILh9Y+UrcSBZwOgD4Jl4Vu7VY6GfH
X-Gm-Gg: ASbGnct1eO4Q1Lw5brJQeikDtwSMhn2k4NONTvlnRUnc1FYn1KPaVBAUoz/IO6CSKUB
	83Lsgb/Ua3VQ7iiqsuJuFWSKvRjSF1EKOMjirm+AM/EQRCqpV75E477kkfof379wHmi8Cy0RTjG
	ec4BNTeCB7oGbJvanUEVsCsCQZavF0FvR97zJOHYbNdp3JjfoIO11vjPZ6nFuK9anSTkOmyRcm+
	Cjju9BB7Y4Oy2gKa4kPtCkpBfhffMjgoBLNDoPdbmVb26rziqjsVDNtoMHof9CVZz1LQyUSao4T
	83ttiRuoQa9QF6x/Rn0sdbIlD8V80C6I3uLy88Fwxs/9+0F+ycJnNFjujweTlvPv+zPRZ9qIrCr
	f/AptQ+RzDnivpuUauu+bPpnv1XMFXxqKVxbSw6K8ZHqV1wqwal5SqppmTg==
X-Received: by 2002:a05:6a00:1821:b0:736:a8db:93bb with SMTP id d2e1a72fcca58-74b50e698f8mr2908581b3a.5.1751451473470;
        Wed, 02 Jul 2025 03:17:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKCfh4xLcTR3PAnV1X3SJoB5NqIRJ+ET8NtGT7a1A8+qckiXtJhR1Gj7PXwK9Vi2UWumM5ow==
X-Received: by 2002:a05:6a00:1821:b0:736:a8db:93bb with SMTP id d2e1a72fcca58-74b50e698f8mr2908555b3a.5.1751451473047;
        Wed, 02 Jul 2025 03:17:53 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55749b9sm14486315b3a.73.2025.07.02.03.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:17:52 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 02 Jul 2025 15:47:35 +0530
Subject: [PATCH 3/7] arm64: dts: qcom: ipq6018: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-imem-v1-3-12d49b1ceff0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751451460; l=1210;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=xzzMzwUChajbRnqt6sZCtMpudF62NJzRt4P4qkk4IBc=;
 b=1j30y1CTb0BZgw0Xpu03TDce9YqyEJhLjbS6+OLhL7ASxY+nGNdRennrian6oAw4WtdtG0/zt
 WqeLsFyACysBDDKxL0Hu7X5rtuf9x4kpXfT16mfb9S/LctrLKRg9h1Y
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68650752 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=kuyrhOGAXNEpbtS0LE4A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 1k1_VaJqlEY4Tpsyb5mtaw6qUzpYweHv
X-Proofpoint-GUID: 1k1_VaJqlEY4Tpsyb5mtaw6qUzpYweHv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4MyBTYWx0ZWRfX44SMVbeNQBPn
 ukSM894O7M1Jgx0wqSz36Lbua8pPkhoAKuChddVFjfkWQyAKeDLGp9ccaQu294QIW6BVfY1X2hp
 Cks8UwJJo4ydmdG0jZm5GF6t8+J9abxEgrYY0DcjphI/y1Kg4eOKF1NLoygNJYtzcrjI7751BLK
 IFFcxUvtcwXPoG/XPcY2T+OePZ4gtOkvqlv35tu7Ujin+/zY4xn64c3Cc528f7PviK5tP7kBpZC
 54IFNQtN46XLktofaSMwXli9q4/GG3QYpmiRfsSz7Q10IfzosvsrXhEwQAj7vWAR0G51fpulWbZ
 VET8/vTz9Fib+hxiHhVb777bUn4kaAcnBp+ucO/PIM3L9GNH9qzV9AgxBaSeYL7kl2jJ/i/XqlX
 omvnKS815Jc1YU3VT0rcs3DZFfBF/mOALLK+158+9dM7dn19JrNh6fP11X01FXKxXRHOWUwU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=712
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020083

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is approximately 32KB but only initial
4KB is accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index bfe59b0208415902c69fd0c0c7565d97997d4207..7eca5ba416c2ef5ef1c4e0eb4f58f1ca94fc92f0 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -659,6 +659,15 @@ qpic_nand: nand-controller@79b0000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq6018-imem", "syscon", "simple-mfd";
+			reg = <0 0x08600000 0 0x7fff>;
+			ranges = <0 0 0x08600000 0x7fff>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb3: usb@8af8800 {
 			compatible = "qcom,ipq6018-dwc3", "qcom,dwc3";
 			reg = <0x0 0x08af8800 0x0 0x400>;

-- 
2.34.1


