Return-Path: <linux-arm-msm+bounces-89470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B682DD388C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 22:44:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21D72300943D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 21:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028DE22425B;
	Fri, 16 Jan 2026 21:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AkcZ82cN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XyY1vUSm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17EC304BB3
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 21:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768599850; cv=none; b=ViYBsiSiLKqO2t0D9F5udZvN6T8TfodaLsFDhbcQpQ/63BfHpcceAkq1XBZogvWp4nSM5hEm2pk1sjVtOgridH17sqyjlYcpeduTdkPJnebYtka2I8tFTeNv8NhBrsB/RmlWeNhgjjbacBj7iEKV2TfmYbuF58NXFRk9wkXTYSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768599850; c=relaxed/simple;
	bh=1J6bmU6eirA/+KNMMJTtt+K/c1lFfYNvywUQL7ovwSE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CK7wg4bLzLxjxe06HoFVzslfkLLxF3cM3KQtW9iQy1DqG+LZ3Irk1XWuWHKpJzmaMqsXcYZGi+44+BKEHKOIzhZOg63oHYwjXXWbljPLy8OGqBb9a/p91ozqQBVeYaTvYMLxJzKfSUL7Ko4WvCfwzWsLK95XIHrjYWJYOjmrwZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AkcZ82cN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XyY1vUSm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GKV7KR2485912
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 21:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=21tAcIenGBL
	sBPQ6P0gIMpjO9CMX7p5MUBcg5SPhEcY=; b=AkcZ82cNkOLSaWv9ogcDw5CFNI2
	2ajreYFzDVAUHB+VzigV/TDzs70Bng0HGSxbJjroNvKSvtUvGahhmHRmQrtSi1Ao
	Srp7qF18HxWgdp27n3kq3huoC01SWDuvxtGBo6GxQKFUwxAcEWueAD+lIvx1dCVP
	lf61TjW+lblIkiIoINphr1sV9fiP08EnNGBQF1nYk9WoElocREKJZRZ9qt7k78Zl
	TQ6/vBoSEGrO2S9s0mowRy+RMXBBgdWLqS3ktI4VVPOiYb83nqNuRfXb1csAENX7
	OaC2hntyHNZFVpzUk+4jGzrkgzIUEfgLPS5FnMUNdV4+WY2DJCHfMaQWxsQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqvecr652-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 21:44:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bc4493d315so721316685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 13:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768599847; x=1769204647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21tAcIenGBLsBPQ6P0gIMpjO9CMX7p5MUBcg5SPhEcY=;
        b=XyY1vUSmKMl8N2aEufU+vmnJWm0B4WI71SwPXcj62efY79+66e9a5rH442/nUhxn7r
         KYcgJ12NOyCPHDV6b6a/EGbGsuAgdsw8TrZ+Q/VtRNVqTzrpFzY3nNxmXOd8Uj79njXY
         jV24fMpnf/67YdfJ0ZKy7/KyJ98IIklyazXFbi1HPUPL0Ut0zQKJKhRVuEV1nUYIiJsq
         EOMUuHhBiR9AktrGzCh7goXCQRZO0OpKsQda4fnnlA7byRUEBV/ZpLctvqm1PuUBFxDX
         ng4EL41CLdReVG4g1PRxY4egBEF6sRF3LluayORsN81KzzuBNDJ3JLSzR4VUO1Qp3XKq
         HSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768599847; x=1769204647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=21tAcIenGBLsBPQ6P0gIMpjO9CMX7p5MUBcg5SPhEcY=;
        b=ixfQR9V0aZmAZLamOMhgTV5qOfYFvBVnxAHUnPtnkOUuGX62iQ23DtCb4LWR3qjRJ4
         xDjikjBPfCdChtEfAcfpegLXLGt8i2upU6RUUNiwZNx0nbABxpM3w3X7AgNNRv3yAefW
         pQ5XK8OrDGZjuKf/1E2dFRnOEqpfiKxJbJnDQKdV6+Jzrw3bPJ3Pwp5FFlPqe+xtZZLB
         Ll1xh6mfHaJ8E9ilEIQ4WFX4LzqUy0YxBi38ITCCSvZK2EaWIvlb/VF1fkIH8ze3G3QW
         asc7XJBSJdhqGlpazaL9LYo4MXciHRNPpamrqt7x3oS1X2Qh2WtD7bfBvwHqeLM8o4Iy
         homQ==
X-Gm-Message-State: AOJu0YyzfyC7zyNXm3NEP1pV/uBVhWhax07nA+fG9U/1CexnZkBCIVmw
	/cA4LWrKjtmJN7z2wOceh7P/CZW8Z0X2YyBWJKSuaVvGIfITpMi+BCisodIbA2eVy6lIKM+BSbT
	B7ahlccE1Bs9g4TF2LAHkxy2wwkxH4nwx7XBLDSX4vuCEd0EOLA1Opd8J8Dog+HPeZcvs
X-Gm-Gg: AY/fxX62ECHcYrLT6MfrzZbUwPN/N2xECaHTZYZzX6RYJYht0JFnBaI9mgaSLjpFed4
	vqnFqOHd600uWYWq+BHnOj8g2UjKrNvoKE++vtpasAKUnfPvY5Ebr1Yib3Dxk+kFpUd9FH60rRe
	W48e1LG6uagQCFe3y5OQanZ/LtiPIWtGkax2hAqmbQZmIZ7dYTGBCMTuhLD2nuBJFH46e2CClSY
	P8A+wVW0bzL5UCjib347ZLYd/s/o+DsiwdMa0IBuBpFEF5lT9pP57/peM8LVQuqB6KKCHQCj6D2
	RdE1DnrUv5uL79lM7OYME5CYOx+5C5IG72Nqi6lw0YEpH7l/sDSLINe8YmSHPrRH19JNWLiOTGP
	iRrlvgBrToAMPwFDyLwAMg7IC7n2D6TGzm4FMkHzZ0FODuGGJcSlK7rEv2ObFs1bEFPA76X5sZT
	zU
X-Received: by 2002:a05:620a:470a:b0:8ba:2b0e:fa36 with SMTP id af79cd13be357-8c6a68d8ec4mr505995985a.24.1768599847170;
        Fri, 16 Jan 2026 13:44:07 -0800 (PST)
X-Received: by 2002:a05:620a:470a:b0:8ba:2b0e:fa36 with SMTP id af79cd13be357-8c6a68d8ec4mr505993785a.24.1768599846684;
        Fri, 16 Jan 2026 13:44:06 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:910f:b77e:d7fd:93ac])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452bce433sm3479743a12.3.2026.01.16.13.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 13:44:05 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Enable SDHC1 for eMMC
Date: Fri, 16 Jan 2026 22:43:54 +0100
Message-Id: <20260116214354.256878-3-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116214354.256878-1-loic.poulain@oss.qualcomm.com>
References: <20260116214354.256878-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1-zB0Umb3wc21gq9si_R7DpyyPtGyqO4
X-Proofpoint-ORIG-GUID: 1-zB0Umb3wc21gq9si_R7DpyyPtGyqO4
X-Authority-Analysis: v=2.4 cv=L4YQguT8 c=1 sm=1 tr=0 ts=696ab128 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=zPoHXmT0fkef3cW368YA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE2MiBTYWx0ZWRfXz+uN27eeJMRt
 pedr7iVrt/b6nthcL7XpoMs1NDUAIP8iE56P8k8C+6KHTJy81xBESn0i1O3H81I0pS6BJ681nww
 /w/zcaxO8LZm9bd6P9RY3ocRgIc2BFaVvJhZYmxY2DeOouJwlImzR+79c5sW3gtl65smm62Qg8C
 sizldmbzo92kA1kv5Ov2x9lOb+Q360K5tmeoBkfQ4GrrTFaBa8GsWBqroZLHiQW4jQBzCSgxvOW
 7jZjAXxD8Lic6/OvtFUX4183bEqNYY+I80j4RB90tqDB/6T3ZIw2CKpUAZG0X3t8tjsHE9cMxqF
 3g5GsehAQ1LpVbTy5tfK6rNm/o0H3+9Lkl9ngGwG/1jCcOBNMsbTOk/gN9hkGgNnyu9TW8o8rnS
 eUvcOFYeHNBwayZ2GiNsUaLCFL88uit6h5CWt/nEPyJIEkFONkJCH2Y4dZSYSfQ/HP/qaqDJsE8
 d7IPiV89sgVPpdKHZIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601160162

Monaco EVK has onboard eMMC, that can be used either as primary
boot storage or as secondary storage when booting from UFS.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index bb35893da73d..c272d7db80e2 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -76,6 +76,15 @@ platform {
 			};
 		};
 	};
+
+	/* This comes from a PMIC handled within the SAIL domain */
+	vreg_s2s: vreg-s2s {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_s2s";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
 };
 
 &apps_rsc {
@@ -428,6 +437,17 @@ &remoteproc_gpdsp {
 	status = "okay";
 };
 
+&sdhc_1 {
+	vmmc-supply = <&vreg_l8a>;
+	vqmmc-supply = <&vreg_s2s>;
+
+	no-sd;
+	no-sdio;
+	non-removable;
+
+	status = "okay";
+};
+
 &serdes0 {
 	phy-supply = <&vreg_l4a>;
 
-- 
2.34.1


