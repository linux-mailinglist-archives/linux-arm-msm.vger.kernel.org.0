Return-Path: <linux-arm-msm+bounces-63605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9C0AF882A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 08:41:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCBAF3A45F2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 06:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76702620CD;
	Fri,  4 Jul 2025 06:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ODjua/nM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3842C261568
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 06:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751611286; cv=none; b=b/aQS/NcUbGxuylXBERUvW9IyFGQXUEvtQ7rF2kyf3l6YVlTYQxrX9ow0RqAMS9dpOSeQvMIhf0RPMOOjIucqE6nOUJ1Ls00xRZfnpm793WLUiaOoClZ+Wibz0X0Zr5K7hwTkmdDPihk7RiGN+y02C4DnLqkHZcAML/RHaFHElU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751611286; c=relaxed/simple;
	bh=zsNDOxtssyyXKwrA/Xqhu6xlTQfQcZiumpCvpHLeiVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V9H8l+SPMdtfWr11oIRqd9uXQCW5vfnSVIPAdIEMO/E/LMi284ab7MeWwh6jc3qnZPzyPJKX9xogqJUdZ19nAh8mDqAk7PL9JjihYTYR93Ofe1W8mm06pjL3hdWAcY+AfwUscSiD7OMkX4Y7iskFZgS7Zl4G7F60UdYpGWfBxvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ODjua/nM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5640Kgnk024441
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 06:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K9lCHtaEWJJtL5rVllaD+CR/7jxFq0pVmlc9VCIqSOw=; b=ODjua/nMk1mCMUfz
	w9Mf/0KBHIHfm3OM11HtyyGJpeGKm2xlcyF2Ifqovc2IzbiLt3wHF4noe3HfeEgL
	sYLsDb+TNMemYBFpgWq+gHEj3Ar1Z7h9B5HwESBHWWsqJ1aZnrPm4JdZBLb6tW1s
	39uO6QR5NjqRoSpxH/hOdcQPggc6R0zYdc9qHAzh6PhKYKHs7lC3bSIXNrlpvT0F
	4WS8Gf13UEhX7kzBQYG1iIHnp5+beCZilG3wuGCzAy3fiuuSy+m4KQnsnjaEERoN
	L03lrcIA0NRy7czInsgm97zWopU1sd5qzWPoHsmxpJ1mNBdqXPoOT/XmG7u0mATu
	PNVGnw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bw2x57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 06:41:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-315af08594fso728101a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 23:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751611283; x=1752216083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9lCHtaEWJJtL5rVllaD+CR/7jxFq0pVmlc9VCIqSOw=;
        b=BWwnEPTEHCjEAIAQTtDZanLiUkf49/srMDTDtROvTwSMWk+qwcDZ7dK/YTPPSw7P6y
         J/4O3xz7O4CzfhkaN8xNUpu+42bXW/nlWWc6B049qrz9joFJrXmNYsSlvLeIjZkVapjw
         HH/Zd6TAeHx3Yk6gPYHpUAsC8upnQi/RevD2AWlIwB72K1U4negYquRfcYYNjjPm0j+s
         95PTuwTAlLeE5zdE5czfkILfmFB13l49HhunAvTOvJ7EteEvwQKJTiZAUwXXDp0SE35e
         1/ILOUjgOdAEhSFgnSDNKEsVB3HtrnLccBV1wfgQMh+YDMIRL2yCOYrhis4srgCTG8JM
         I3aw==
X-Gm-Message-State: AOJu0YxjrhdeATpZsUxv298fG5qtehzI7tJreBm8ldvMreP1+OBpG6Ty
	IUe9zxxn1D0ZjjiddamD31lvIDVYmLt0yeIfPFQWkLFDnSEFiGxx9klxf5ILD+7mM7NTqy7gWez
	D7gDrDKOgNBbRo+/1WnDRUcyv20GGriSTNV9/kYH6/nFGoK9TncZnHtuswHdC6F53601nKqcETP
	/0/xk=
X-Gm-Gg: ASbGncuNROucDjUVNmwZ0YCDC3HyHCFNZAo5TrfJeJPYFwq1WRju7M72B2UOMp53+pS
	1OAVKVoGSNKLkWZQLSlnmGq0SiIn2RRJZ89PmM+Fdcv7o4Yt2J3oJ+OFe2kPgEE7WpuLgpc9C09
	zCu3DLWvppb67UPbGt9DFFp9bb0E84lqxg42HDxoNkTQAS1+quh8ZDT/BN0U1m44dFGycvGubeD
	mpbjLS/MD+eet2nqC6IovzYG0hhA8rhxDWwLE4y9G6Pf6g13XSBMhQbkSPn7IWSzFETwv+j95R2
	DhZRTpgGPB8hvMsrnunsK593Z3Xs8JELHWsFNzi6PwOj10j6jTYcwt8/3hXmNUREJO/qWiuco8b
	+WOo5JQJoQg==
X-Received: by 2002:a17:90b:3c08:b0:313:287c:74bd with SMTP id 98e67ed59e1d1-31aaddb82f4mr1563534a91.33.1751611283390;
        Thu, 03 Jul 2025 23:41:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAKATJXf4IBf4ljh/+e7f0jLnuHlOXrFp416Nbsw5C1SbYqDCEGjEjACcmx0lg1dclD5I75w==
X-Received: by 2002:a17:90b:3c08:b0:313:287c:74bd with SMTP id 98e67ed59e1d1-31aaddb82f4mr1563498a91.33.1751611282945;
        Thu, 03 Jul 2025 23:41:22 -0700 (PDT)
Received: from yuzha-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae6b6casm1304746a91.18.2025.07.03.23.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 23:41:22 -0700 (PDT)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Date: Fri, 04 Jul 2025 14:41:10 +0800
Subject: [PATCH v3 1/2] arm64: dts: qcom: qcs615: add a PCIe port for WLAN
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-615-v3-1-c5f6b739705c@oss.qualcomm.com>
References: <20250704-615-v3-0-c5f6b739705c@oss.qualcomm.com>
In-Reply-To: <20250704-615-v3-0-c5f6b739705c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Yu Zhang (Yuriy)" <yu.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751611278; l=943;
 i=yu.zhang@oss.qualcomm.com; s=20250625; h=from:subject:message-id;
 bh=zsNDOxtssyyXKwrA/Xqhu6xlTQfQcZiumpCvpHLeiVE=;
 b=O9iCxy+leDK3wN7Fx0+x8rQSsKZkO+0GO8Ym1zoQNkQh6H5xqsr35kYmNLZHE8SzQMfJ6MV1N
 AWPanESNPxvA+df54Ls+NO9/dxCUVbjlrynusSC4qNNjreIIMCvNNCc
X-Developer-Key: i=yu.zhang@oss.qualcomm.com; a=ed25519;
 pk=ZS+pKT1eEx1+Yb0k2iKe8mk1Rk+MUki89iurrz9iucA=
X-Proofpoint-GUID: 0MYnjzMWjXqCotiVGK-DMG6EW4SEPXZb
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68677794 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=dI-8CA4c5Xf8_vBnWYsA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 0MYnjzMWjXqCotiVGK-DMG6EW4SEPXZb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA1MSBTYWx0ZWRfX0ltkLEGKfJem
 BbDp91YoWRgw1NmryA/xUPDEkLoS9cvaKullbKpbYhFd6vxkjKCPNk2RT3LDbg3fGATD56S27A5
 A+jfyOdThEXfu4ifE6jG5USB171KfGhfhnEYxPYjPMbqolrUTRWvyqsRYEkUn21oUaBqsmBpWu3
 CYxG2uHfAWPumuIxZnaqmh7ZRQtbkcSdc1n7zcYIu/l9nCYA7wWgmsiOy5HIx/PeSMHVJK98z68
 RKOMo4QB7LMGnilY7ZBj/ehLLRXdR7JfbfS8gqrJyZs1dfOtNweyNKs02AxjeX41eyjsHP4Dw3P
 wc+/r2TyypHtO0xjIuojNJNXPwTw9fKjmWGW8DOTDE/UJ2t/AKVgdZuPJPkYJpgOPwtpHsjiKgL
 moPtG2DT9L0uv2w5cPIQw1GHqbknnC/RucOheM7STS1sA2YyeUkFEQCGbyj277k3nuiwmBO+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_02,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=967 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040051

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


