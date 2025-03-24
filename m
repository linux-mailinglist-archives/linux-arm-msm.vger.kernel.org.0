Return-Path: <linux-arm-msm+bounces-52397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2493BA6E424
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 21:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DADAA1894A48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 20:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5A91DE8A5;
	Mon, 24 Mar 2025 20:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QjFDS/9W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095CD1C6FE4;
	Mon, 24 Mar 2025 20:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742847576; cv=none; b=YjIy5vcQMaWZsXWY8CsmiqvZs62CqJs6V1ST9c0s9U3kBlIngVGVRcLNAZWK0bC4rLdxpySywC7SftDOpAoLfa1QIpIohdpu+tGa9LlF/48R1qCdmSEV4aH4navGHS7/8qoedivBF3OL7W2lIwVP3aIsD43OKSzZYDnR/wG9XeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742847576; c=relaxed/simple;
	bh=OKeCJyzN6SaEH50xyap3Uffbsoci15EVE1GvrWqjNOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qh+liIi2/omrgbOJUqPXxRAf7BIyFryeIzFDmI8ZxLNggNERyzZxLTIddM8DcB7bA2HMobKEutBbmxP1UtKnaq+8hPu+kfJONLjYQzwQfZQBI6P8RxnggsQxwb6XF2JYvExk+qMAyQkFg188FixpoGkT3Q+kpv2NcFb8h7K8+U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QjFDS/9W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52OJ9pPX004754;
	Mon, 24 Mar 2025 20:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UpFNbRAh//cdHjxJ6gv6hCpKQjJiA6pTR7bKNp1ho4g=; b=QjFDS/9WAzVTCGIO
	9HSKBPA+q2jYoopewc/b1LdpjL9nCfKq4TOo3tSKZqJ4gfSKGLvPcTof9JY+g73G
	pLLPV3EYtun5THPctW4XPorIARNP6TiNdlZPhm1Qek0Hp95v3VDTi07SocRfhAGS
	68yaF3cB9R6kdDys0YuAi1fanBCn+yHZVuX6hSFoIBWKv7/AAgTiLqNekHmqwXCE
	Wo1MVUH/IIiuT6PNadrI53xcwggo3y27qvyri3W+Qc6zjmJ8h7TYr/8bIXp+voIX
	PDFfyuhtrOA2+fsTAj+JZHWWBe/HnmuuuchCzcsBHjcNCQZbjZsHVU4PDToDxrh7
	ftDkQg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hm79nkvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 20:19:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52OKJLoE002454
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 20:19:21 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 24 Mar 2025 13:19:21 -0700
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Mon, 24 Mar 2025 13:18:38 -0700
Subject: [PATCH v3 10/10] arm64: defconfig: Add M31 eUSB2 PHY config for
 SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250324-sm8750_usb_master-v3-10-13e096dc88fd@quicinc.com>
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
        "Melody
 Olvera" <quic_molvera@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742847556; l=893;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=OKeCJyzN6SaEH50xyap3Uffbsoci15EVE1GvrWqjNOA=;
 b=/7NhWxL+xRQMCZ8HZsraLjw4HcZ6VpIRvi38Xx5ZVZQtqXvVfDvglGjKZtTNU+N5/65MboxvF
 XHbC6UQdwJpBf0xbjy+PTMClHjrzH6xsvvkNWNWOgPKvFpCp+Yh14Vu
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uonaYQ3R4czR-Rxhp2suhf-04eTs1uOB
X-Proofpoint-ORIG-GUID: uonaYQ3R4czR-Rxhp2suhf-04eTs1uOB
X-Authority-Analysis: v=2.4 cv=IKYCChvG c=1 sm=1 tr=0 ts=67e1be4a cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=yCBuECYR7Rf6QDnvud8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_07,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 mlxlogscore=544 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240143

The SM8750 SoCs use an eUSB2 PHY driver different from the
already existing M31 USB driver because it requires a connection
to an eUSB2 repeater. Thus, for USB to probe and work properly on
SM8750, enable the additional driver.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a22116781169611482179b10798c14..914881c02cf1d0426f102674437907ed77574462 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1594,6 +1594,7 @@ CONFIG_PHY_QCOM_QUSB2=m
 CONFIG_PHY_QCOM_SNPS_EUSB2=m
 CONFIG_PHY_QCOM_EUSB2_REPEATER=m
 CONFIG_PHY_QCOM_M31_USB=m
+CONFIG_PHY_QCOM_M31_EUSB=m
 CONFIG_PHY_QCOM_USB_HS=m
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
 CONFIG_PHY_QCOM_USB_HS_28NM=m

-- 
2.48.1


