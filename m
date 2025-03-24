Return-Path: <linux-arm-msm+bounces-52399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A42F3A6E420
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 21:20:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF2F93A7ADC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 20:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F00819CC06;
	Mon, 24 Mar 2025 20:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P1lprcKw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0DE1C84A7;
	Mon, 24 Mar 2025 20:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742847576; cv=none; b=FvhAwB7e2IwNuWwUlgMP5jPjsaKTLo9i++NHmTlBhWlXbkWbx5bKaiNwGvo7kjXQYs6Hu9uf7BG1C4yEZ2UF6yGLFmTqQTAN+qUVA+x8KW8kzM1anmvPmKIjEo/Nrt0D50dGNKtcXR0xCfxv2VIVSHBxWXUmpUTAkoYLZdOpUVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742847576; c=relaxed/simple;
	bh=4lSwsDZweAnk6e54iKo1XKDY1IZV5PKE5RkkwNcBFOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=EaXOttLjG9CJAErz7O/gtu5gr+tSe2qdK9TAzxwCW2KgWInsZipk2x0UmitR7P3aBfYvP3O0r7UuU2XXaZAu8L4cNbeWLci8y+bJwHtMHYvThym0QOrxqB30/EUGEgBShPKeDSB1FCVtFenTqnop/l1d29mGta1kn7ipg1Gvbt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P1lprcKw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52OIIRQO025897;
	Mon, 24 Mar 2025 20:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DUkeSo7YC2+Gn2w1d+tbi/AOnqcGp5wOrds4KCweP6o=; b=P1lprcKwaSUMD6A8
	4zYwB5Q2iL3D0zoR79lfDqMt0Y+Eta0ulgHLS/BhfPLVbBKhvWrdI+sX6Z5brHDl
	4VT3bDMNgztHcsrjs9pPFwWBBOGeZ4hOLWXlOJxRtEOOqIiGyCx/6hS6F+5b2tt8
	Aw/hCowNecEocDob1SvPkbtIx8Xdn8NaQEXVjYb9ZeLA9mJhU6QGK2Yp6pVCsD9X
	L8hHqdJZ2mMEyxjoVv7hT79bwDIBVvXi1pvqojfLgmL7ElG8g1pTJp5M04IJGVoZ
	/NuVxT2SgelHcUtb3s6IVH4nDP221eGzzv7UX7DJLvnGJgSBFgHgQW+6mC7NObyt
	WIbB8g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hjjnnrec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 20:19:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52OKJH6c027848
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 20:19:17 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 24 Mar 2025 13:19:16 -0700
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Mon, 24 Mar 2025 13:18:29 -0700
Subject: [PATCH v3 01/10] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add SM8750 to QMP PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250324-sm8750_usb_master-v3-1-13e096dc88fd@quicinc.com>
References: <20250324-sm8750_usb_master-v3-0-13e096dc88fd@quicinc.com>
In-Reply-To: <20250324-sm8750_usb_master-v3-0-13e096dc88fd@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742847556; l=1364;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=lF4rP9lXDFjIz08ty8NJ8mDbnU5o8JXcLPPWxqt/0t0=;
 b=whasjRrvXK7yA2cHl3tWbtaCueTdB1I8bc+Kb2raYE6uDfZikyEJEGZlsGYK1RBa5CbGbtB7L
 L+uxIC9D2G6AeZQMEH0wNUjF/emIY2/J9qddiF6oHm7Gg2R9ccdcLVl
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=fNc53Yae c=1 sm=1 tr=0 ts=67e1be46 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=bbY3M6C_flAL0yJJl3cA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: c_DtHrmL6osST2vkxdvSk1qnhGz0AVXc
X-Proofpoint-GUID: c_DtHrmL6osST2vkxdvSk1qnhGz0AVXc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_07,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxlogscore=878 priorityscore=1501 mlxscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240143

From: Wesley Cheng <quic_wcheng@quicinc.com>

Add an entry to the compatible field for SM8750 for the QMP combo PHY.
This handles the USB3 path for SM8750.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 358a6736a951ca5db7cff7385b3657976a667358..38ce04c35d945d0d8d319191c241920810ee9005 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -29,6 +29,7 @@ properties:
       - qcom,sm8450-qmp-usb3-dp-phy
       - qcom,sm8550-qmp-usb3-dp-phy
       - qcom,sm8650-qmp-usb3-dp-phy
+      - qcom,sm8750-qmp-usb3-dp-phy
       - qcom,x1e80100-qmp-usb3-dp-phy
 
   reg:
@@ -133,6 +134,7 @@ allOf:
             - qcom,sm6350-qmp-usb3-dp-phy
             - qcom,sm8550-qmp-usb3-dp-phy
             - qcom,sm8650-qmp-usb3-dp-phy
+            - qcom,sm8750-qmp-usb3-dp-phy
             - qcom,x1e80100-qmp-usb3-dp-phy
     then:
       required:

-- 
2.48.1


