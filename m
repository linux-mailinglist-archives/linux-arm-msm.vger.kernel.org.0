Return-Path: <linux-arm-msm+bounces-82322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBFFC69D74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:11:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8FA434EBB56
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BCF0355055;
	Tue, 18 Nov 2025 14:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BKiOybET";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="STujOl7r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398D8331A69
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763474662; cv=none; b=TpyDo4Mq8bMyxJLyCpbSXFGiXGDATNYr1XvhBbiNsbKdANWx+qbJEggyKL3AvN78z376tjlia8iu5rTasuctIVsuvIzOvD8fgGfAs/ZMV5P7lr5ips7/mlXZykxXyf1ibxD0zjwL+Iz/R6mRPpWq5pK3Q1lDDvZhC/e4+rZw0oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763474662; c=relaxed/simple;
	bh=58W4drVpq4sxNIxo4fhPSh45zjrOjXY8sQwqZo4rI/k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vFlk8chGutaXJmYVjlOFa8RgGYZOSCq19fzqOoROMo3pw6f3xyYoPRje0H9gRNnwv3NMYzySS53EsjheqCWEbBodaSY0dDaQjQhLKN+lZqGaxo1FLlOnyXP8BRO7mEnzJtUlAE9p/FuIyao+iSjTIypfudvXD3f3wB7DPNQuizM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BKiOybET; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=STujOl7r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8VRK02249923
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9lrAM7xXdDO
	V6c49KXuyewJT40PoW+o/goEI9xR1gZs=; b=BKiOybETwFyANiPKN5iQJXtbEpU
	RtrQm/PJLAlnViG7bu8r3JtGp9J22RpezC1cm25q/m1U00+G1RJNjj19PbRzsfAd
	+odvljfHd0lwa6gV7AzPsnel4EWjjw4W/MRDb8Z6+fVjviDDk8I25teE6o3GH9wB
	TV1lUpKk8Q53XCwKhiYiFOw2H2L/k4X4DWuehIGeoayBDl3GXxtaxtozCVG9mQ5R
	xm99V7eacEnsUe2XzQ1a9LqE94t3TjyPCD47INU5u/F8seWz35eyqjNLFq/bcwOf
	OPlbSj6D+wotNzukSUbRCsHRsURZvLn1xPtn16pEqDfn4k4lKsuX9u9iPjg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnc5gwsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:04:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297df5c10ffso23655905ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 06:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763474659; x=1764079459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lrAM7xXdDOV6c49KXuyewJT40PoW+o/goEI9xR1gZs=;
        b=STujOl7rq55Zvl40fah+Ymske/5bZf6hK0L3AC7DTHdPrzXggx+fsGnxkpzZJwBjyU
         0IQio2cPGcw2Ew/ei/k+Q0EWuydzKyKYf+7WBN9wi2qHdDAlrBQMYcGOkWRMmU7YWNoI
         bwbJNnAkDCWAoU4bCHwcvsFJ3ftIeTw67IhBTeOugGT1EYlrH93XGWBVA+fAQwG0+Ei4
         +Tr1BcAacYKwpT1r0ZA+/ci+DUGBpJ6JUcQaFXvSDfoHA9NSKQR5h+lof8T727xAr+QV
         vm/vZQ066YRUkSWCTRQGe6Ywct7QM9L4BIvY+3CS30iU4Zm8ss6iPX4HLhGpqSQV7wbR
         zltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763474659; x=1764079459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9lrAM7xXdDOV6c49KXuyewJT40PoW+o/goEI9xR1gZs=;
        b=dyTwj894KgFsKRhcNMchDBdBchYZXijJw6ceIXb1UEG0DnCLzLBOK518hFUEpyTwjk
         0I8T2uhDx/g4BwTiQu1p/D9lgFHKxPvVoiXmfc/SlcMD4oZbkm3NVrDaeJMkD8enq3Un
         ReBH0aLyC+2sT1xwLPgEM1BJt9Ao8kpcHRBz+itGkgnHxT9tPIILzb9CrtKN+PV2M5ST
         yf1Hda8Zh/T95YMx7+xlE5An2DvV7Jh5iwttAxpTANtvtaWC+KIB01AfNAREEe3OLvb2
         giTF0fBcLsge04dcVWNOWbeTWdxf++2XWOyFOyeKPfjvRk1P/XLtFQXnELPnQiAT9z2S
         m+Xg==
X-Gm-Message-State: AOJu0Yy1RikdHhmMpLx76aSHf+hQicIo+W0q4CdDFMshjiGGZbPbL63d
	cSaHnUTxGYP7mETWOVwE3zPFNGA2dkU52S1kh3gWdcnmqqCyvYfzNaD5F5DbTBzW/dfDusw1zJN
	pkB4YKPjg4HwDWo1JdEd0DNarJw9IguuoI1xf/zVBNrTQoq0QNraT3r/e5MiW3/dh2/0ViAG9NF
	TzNL0=
X-Gm-Gg: ASbGncv5keklt6SzeJhNaCa6EvtBYW/4xogDqCQXBParkz67pRV4aHRqz65tAd6aLMg
	efbb273/a8NvYLLU/xAD6addf47cwMsmW3LSmUv5QOKiLMonG+3G67u/y04B6p2hr8Qceo0Q8n+
	esM5Rp1qvORCeG9OE4KduSlHtVkslLPBOau89Tn41JHm7F1yOgnZIY2z2OyaiBFGReNi5uJP4c5
	lK0KAky81CYrHXMx49TgtGGWo4+JWmB8xfV+Doaat20ORkBPXVpJ3wRlOvdQyD+WJlED01xTgKS
	TRJsibym6HwLyVpdM3zP3Sf1XHWknxXz9DDmM4wQ/KuFh/SPIfVgvfzBj5NTykvgElc3nXIsECN
	PsqfTKrrJ9DYV11SD6NX70/oWy9hnV7fJ
X-Received: by 2002:a17:903:2350:b0:297:df7c:ed32 with SMTP id d9443c01a7336-299f641a54fmr21484675ad.0.1763474658535;
        Tue, 18 Nov 2025 06:04:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOP7F7VRre0B4GU4GD1NcI89R7ec3DLibcn7RiLGcPvNDRnFETmmrhYAeGOnSNnTVMBj5I/g==
X-Received: by 2002:a17:903:2350:b0:297:df7c:ed32 with SMTP id d9443c01a7336-299f641a54fmr21484375ad.0.1763474657928;
        Tue, 18 Nov 2025 06:04:17 -0800 (PST)
Received: from hu-weiden-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2986a60b116sm142957695ad.79.2025.11.18.06.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 06:04:17 -0800 (PST)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_jiaymao@quicinc.com,
        quic_chezhou@quicinc.com, quic_shuaz@quicinc.com
Subject: [PATCH V2 1/1] arm64: dts: qcom: qcs8300-ride: Enable Bluetooth support
Date: Tue, 18 Nov 2025 19:34:06 +0530
Message-Id: <20251118140406.1551669-2-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251118140406.1551669-1-wei.deng@oss.qualcomm.com>
References: <20251118140406.1551669-1-wei.deng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: S5iSxLwMGpUXOvG-w7o1Bh5S-9j-es5H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExMyBTYWx0ZWRfX7r/G0t89QKBL
 h/qiPBAQm0nSeawt3g+yqrk2Ic3/ARht5La/fyUMWNcsyPZhB+/TpN1TM1cDx9XTHlFVUwyjWfr
 J/VbgGWaGrK7nKVcYGON9J+XyogDfiCXEZ4l9XMvp9wsJSKX6LPygW1wvIfob5gIXaJKHm/Ohp9
 +KgJFUIeyyMntmcEb/UZRpb1ltLiseFk9BQNbq+/whjaxVNkYLmg0dhQn8998Fp+6Oqo7VIId5a
 xW1bfnXTAdPEEI+q/w58+/6+Zpc0frGUqw5rS0MauVBKyng/4WVjcnkcWxOmr5vA6ekOIli3oYU
 Gn2iuIxbGN95cL7dBQo8+wBPAxNw6MPGwz3E1eMSJUWR4L9omdmUyimWyCLLdrw8de2HEKZPGx0
 bw6ge6AcVu97IkSthYkHFlnmIhoO6g==
X-Authority-Analysis: v=2.4 cv=BYTVE7t2 c=1 sm=1 tr=0 ts=691c7ce3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=vfj0strxkez5rotHyDAA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: S5iSxLwMGpUXOvG-w7o1Bh5S-9j-es5H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180113

Enable BT on qcs8300-ride by adding a BT device tree node.

Since the platform uses the QCA6698 Bluetooth chip. While
the QCA6698 shares the same IP core as the WCN6855, it has
different RF components and RAM sizes, requiring new firmware
files. Use the firmware-name property to specify the NVM and
rampatch firmware to load.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 28 +++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index cd8800a59700..08b705fe4eea 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -18,6 +18,7 @@ / {
 	aliases {
 		serial0 = &uart7;
 		mmc0 = &sdhc_1;
+		serial1 = &uart2;
 	};
 
 	chosen {
@@ -71,6 +72,7 @@ wcn6855-pmu {
 		vddpcie1p3-supply = <&vreg_conn_pa>;
 		vddpcie1p9-supply = <&vreg_conn_1p8>;
 
+		bt-enable-gpios = <&tlmm 55 GPIO_ACTIVE_HIGH>;
 		wlan-enable-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;
 
 		regulators {
@@ -501,6 +503,13 @@ &sdhc_1 {
 };
 
 &tlmm {
+	bt_en_state: bt-en-state {
+		pins = "gpio55";
+		function = "gpio";
+		bias-pull-down;
+		output-low;
+	};
+
 	ethernet0_default: ethernet0-default-state {
 		ethernet0_mdc: ethernet0-mdc-pins {
 			pins = "gpio5";
@@ -571,6 +580,25 @@ wlan_en_state: wlan-en-state {
 	};
 };
 
+&uart2 {
+	status = "okay";
+
+	bluetooth: bluetooth {
+		compatible = "qcom,wcn6855-bt";
+		firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
+		max-speed = <3200000>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+	};
+};
+
 &uart7 {
 	status = "okay";
 };
-- 
2.25.1


