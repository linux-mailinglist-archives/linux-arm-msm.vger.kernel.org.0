Return-Path: <linux-arm-msm+bounces-69660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B44EB2B9A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 08:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E39BD3BD470
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 06:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAAA22773F6;
	Tue, 19 Aug 2025 06:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+JMjzgE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4328C26C398
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 06:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755585417; cv=none; b=ljnBIIlr14gtWslZmn2e37PtRWXLA0J7ctXXPfaMUi2FpTOwGCoHIZfxiwYnjOi0OV1VC+JC2pVuvdoJvxSWOUnqxCsh5l9u+tEMTIVHanbyUeKHC96zGd99vg+BN/eoqFK6VsKVDo/uvmXXiZ0fdtuzp4AzykjEJWxBl3kJ7RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755585417; c=relaxed/simple;
	bh=ooP0tmuQEvh+EyQR6KnOEmMXb3H4OJjm1CP4dfl/QSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OMD5I5diM1rZLbNqCHKVDjseITVeqJkrsNMiEZHOcCaKJQ/YR6PfFXbAqiW2Y/g0OXkhnFlt/cSW9lQHcA0LmtwGdzMDnY7NDfxCO59U1zaMkHz+N/wdCPXddTpiEvlRSUfNsHQk8Km+Wfoo/R+rmMWXWw2Dl55f4Bo/+vzF5hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+JMjzgE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ILPds0006647
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 06:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NsIfrvTLDxKj7MQKwmdBE+vbOboHExWTllcv4P/M3bA=; b=c+JMjzgEcVFmcxER
	v3JF67q6FOkC376kvXdUcyupeLy+T1ZB7CInbTGMcmOqLH9pfIQJBW36EzhEpaBq
	DbrcoBs2lK955IEMidOTVzVyfT5r2YUqIRQ7qj6CO6diaagvPNHPsKGyML2HGMEv
	D2gzTc+lJMlCGsx8pbAtcoLHnJZyyTGWfK1a+H63aMZXvVqNOaLQGv64d1Thl/s5
	r//HcGmwGHFurajZqtmQHu4O0bsO/9P9ludM8U95If+lfO5bRdsdwjbVF7nve8cI
	sW7vTww3IVzI5faDIxEYcFwv5e/lDUQaHRioSqn+w4sCntTJn+Ks/YWsYccxhSrs
	pBIyVQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj2ufhmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 06:36:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24457f440f0so54700425ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 23:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755585414; x=1756190214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NsIfrvTLDxKj7MQKwmdBE+vbOboHExWTllcv4P/M3bA=;
        b=EHP+wQyRmDRxKl0sGTyIvrjREZvSRGtmProCqAI5Iy4bAEXEiNurqXBUY5+IQgSdsJ
         BHdA3Y9BtbrFppkCIoEocpWLVeTaT0z1AUJa9y+yZ2uwohdh+PWHAFbcNC58XMdHNNnN
         kIfHo0oI4+9FEucZXCVylEFKTowQBKCvd4q6YWsKJtz4AEdNAnKTC4IwHPdP0hnLgH+d
         2pdBjJkJFX1e/E37zOBnFbhhJlmbTP4zYuDFoU6cVnyi6Cv357OYXLFK6eHRWTAKcpEA
         uDMHrwzLBWIKd9ugWcVyvbBYelxuGCcFOJ3A6mJG/ff0Dujn8z/BogMQCpViRIPkQSt/
         7NQA==
X-Forwarded-Encrypted: i=1; AJvYcCVFpgspMO3NZrqPJ0ouKZenkUP0+RuWivf+RqvMIkwcCyuTNNlNn3sk+bKarpPgjUPqLb2l5hgfarATD/T3@vger.kernel.org
X-Gm-Message-State: AOJu0YyTSwIE40V74aal/PhooiWmnSuWcJuvs0uETqJc991lGUp50Zwa
	ZpdMdqS6v1f3C1dHVemXcDnG87ttPw+Ug6wRvEoyMhi/DLXZtQxZnwTKhic18e0fWJbni6AO9/q
	DHsDsPt0ZTZb8fM9oIQ/TJAhCORbvQyEGw3hO5DjmQwf0FNf5di6Bw6lFHlzqpKpnoW1j
X-Gm-Gg: ASbGncuUDF06unFv6GzAQ8QO6qPzvYGreLRQYvwi2WsAdCeUm+Gb3uIHPsrk4Tyg5rN
	Fqj8FTWHyZuQbm+upZ8tBq1v+IlRJimq93EEopS9TNsmshogdwJNywLCHFDrWXKYTpYi4k8RwMy
	voEhVPFWUknsQaMFGBoqiz3YERqeBQ8eU+IoMtW6TOAozy4oZeM8WGWtX6YEgmI0p+UXPhXPkqX
	Cn6JSwCnCjvEIXs4x+Bu6425D1H6gK34g+tw39iksJvs6QV0KZtiCF9dTv/3aagIbYymcP06yQs
	lb/cldWDRsXm4uHLkPe+qqtFDxr899i5hms/Owf05YLwop0ew9QDHygrRgVCK3Ra3j37aE6yC+Y
	u7C/g0qc63A8BmnpxLGlcWe7bFUMiruLmqQ==
X-Received: by 2002:a17:902:fc50:b0:234:a734:4ab1 with SMTP id d9443c01a7336-245e02c1277mr16956185ad.3.1755585413800;
        Mon, 18 Aug 2025 23:36:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOco999Bi1j/ttDYbCi3adNC02Vim++BGoj+wK9RJiQcjLfwcPNu9Sf7OenyvPy4yfGschLQ==
X-Received: by 2002:a17:902:fc50:b0:234:a734:4ab1 with SMTP id d9443c01a7336-245e02c1277mr16955945ad.3.1755585413364;
        Mon, 18 Aug 2025 23:36:53 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d54fe38sm98120455ad.135.2025.08.18.23.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 23:36:53 -0700 (PDT)
From: YijieYang <yijie.yang@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:35:58 +0800
Subject: [PATCH v4 3/6] arm64: dts: qcom: qcs615: add ethernet node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-qcs615_eth-v4-3-5050ed3402cb@oss.qualcomm.com>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
In-Reply-To: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable+noautosel@kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-5bbf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755585388; l=1620;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=esGpkrp578FqjkRZx/3YPPX9onv/FUSUV77hdcvh6nw=;
 b=SUGbTSGQ410eDz8ELdraMbuF+QvX9Z7EjnQVSHXQrih713dfkqJqB0VRBBkKfxTattHHcRdCV
 LC73TCyJ5V5CFuy5wSYE3kML7+6fQj/5Yhsi4kHtiXSyscOKAuX5Nlo
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Authority-Analysis: v=2.4 cv=MJ9gmNZl c=1 sm=1 tr=0 ts=68a41b87 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ufJ1yBTjRq6Z22V5Zn0A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 5rAcYQU-ZKnC-GxtJKS8THw7g9QsMQDH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMSBTYWx0ZWRfXxVn51K0LcY4z
 aZuJLPOdInRvcyYh0vykEDoA9R2VIPjMKLqwi36LoUA6qRDkdHuYWcJttwK1XZjkMS3BoGVTZAZ
 UdLdvMhyqngBCBFtZ8jfpOmf7npjyNfeEJIr2VCzj0fMSX+SFi9MaTB3trroLigp3rv0QM0uNzu
 0QFWS/BkTC8BJbXZF8qMLWk3M9YA6UuoiSSlrThNScg6FJT1riSfffsDRef45HHs+WlExD1Udmt
 PjFKczPwNtnizQItHGtS3dvmQSGXP4m5nZED6cJH3APSvvaU6PlGFkUKhMCM1JE5fgXQ0Eea6Ri
 uIoGvD19vt/lkVP6VlXZOgymU40JDDW3YvDHdMoBtR6/6dXIoIEJVgKgZwPQv+uJXeP6I523Iei
 zw6hFgBJ
X-Proofpoint-GUID: 5rAcYQU-ZKnC-GxtJKS8THw7g9QsMQDH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160031

From: Yijie Yang <quic_yijiyang@quicinc.com>

Add an ethernet controller node for QCS615 SoC to enable ethernet
functionality.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm6150.dtsi | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
index 591fcb740259..8ec97532911c 100644
--- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
@@ -491,6 +491,39 @@ soc: soc@0 {
 		dma-ranges = <0 0 0 0 0x10 0>;
 		#address-cells = <2>;
 		#size-cells = <2>;
+		ethernet: ethernet@20000 {
+			compatible = "qcom,qcs615-ethqos", "qcom,qcs404-ethqos";
+			reg = <0x0 0x00020000 0x0 0x10000>,
+			      <0x0 0x00036000 0x0 0x100>;
+			reg-names = "stmmaceth",
+				    "rgmii";
+
+			clocks = <&gcc GCC_EMAC_AXI_CLK>,
+				 <&gcc GCC_EMAC_SLV_AHB_CLK>,
+				 <&gcc GCC_EMAC_PTP_CLK>,
+				 <&gcc GCC_EMAC_RGMII_CLK>;
+			clock-names = "stmmaceth",
+				      "pclk",
+				      "ptp_ref",
+				      "rgmii";
+
+			interrupts = <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 661 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq",
+					  "eth_lpi";
+
+			power-domains = <&gcc EMAC_GDSC>;
+			resets = <&gcc GCC_EMAC_BCR>;
+
+			iommus = <&apps_smmu 0x1c0 0x0>;
+
+			snps,tso;
+			snps,pbl = <32>;
+			rx-fifo-depth = <16384>;
+			tx-fifo-depth = <20480>;
+
+			status = "disabled";
+		};
 
 		gcc: clock-controller@100000 {
 			compatible = "qcom,qcs615-gcc";

-- 
2.34.1


