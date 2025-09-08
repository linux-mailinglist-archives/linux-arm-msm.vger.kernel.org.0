Return-Path: <linux-arm-msm+bounces-72463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCA2B48277
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 04:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54E4A17E521
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 02:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 072F722FE0D;
	Mon,  8 Sep 2025 02:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YKnBgkfY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9473922A7E9
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 02:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757296994; cv=none; b=FNQVtuh3sQ8WT7hzQwiaYe7owkAG6QPlOnC5Xu72SNleHXJRSfoNNZY6RvbFF74XK1KUVWKXQ73+azrH2yhyJiQndI4YAFRKGQK56qe34lxRGd2ml0sYkPFPcTP9y0BQgBUmVj90+F7wiOjQyYSZQSzOBonTi6YN7fjCqxHPg9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757296994; c=relaxed/simple;
	bh=9cRSlY2NurvnURIS4RORNBk1ASEWuw2jDevqbo6Yazw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ImAFR6snT6iwHJ5XxijzmLE8UZd53TiUfuMg1Y3KBYkgAe9GKQwv2sU6SLfhPUq/rPcjWyYRl3ciHUqRXk9ctCzB4yTeqgLOJ3HmX09LcUvdZsDAQR3wDda8Wp12sE6gRmF+ZIsorZfHsRSgDPhEassqT0HF8+k2BBvLnMfjTzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YKnBgkfY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587LGpxQ004713
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 02:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IZ0QPfKd6cfV3/gEri9raDeCAG7QUBZRVXE50fhUyeA=; b=YKnBgkfYRXGN832H
	az1L/4lkc9FISmLeT9cMttu7QGMCqPuyDwYPXMOYdo3D16SWc1B7AzUdtTe56PfJ
	GX4vNvw9tnqnUOVaGUNZ6Q2RUkSeX6g6y2IkhvdafxbenJOGyPpZPaOs0dn8kE9h
	4xxxrQUBHF4EJY+nAry/mYjwTKmoMTZOIxnVnW0jqKU2nR34bFnPdXuSQ1XAt4BQ
	KQl4P5k6IhDVydYA4ffiXj3cDKc+H4o5JoSP/XcmBRYPEw0ZHJJX/b+5gv2OwRub
	I5uMZ51v5psuaefB5e5MXqNGh6jiqbY/2BDstwCw6cOK4phwQBUjxZbvUQvEZqAf
	RKMCsQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490d63aw81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 02:03:11 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7723d779674so3446399b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 19:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757296991; x=1757901791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZ0QPfKd6cfV3/gEri9raDeCAG7QUBZRVXE50fhUyeA=;
        b=uChkuP7sm49wAUKtYUQ5HBie9zCGmGqeelJ9Awfh75cfPMNltQQc7SbpT1Hpy5kgCg
         +VBgWTC9SWbTUYRQoqvT4lKIA3aPMbl6pOB+ggkqRGl9QLkmZUTJdekUOoTfSpjzB3Ms
         7a6TLJSAooMuVogxkErCUnN0wVQxs1opRUb5Gjn/8vdUIRYf/poEaNW2lNGt7EE7U8kz
         aGWIwBYHl6LGLWtaKPGgxrPXwWjliwKRIH9QG5J8X1dtTbkaPhG6+5+2jCttWMbmvnjh
         Jvz9yxlsPa9FW3Q4WozqKg2ALtQ9J8ik2vLZHT+I5mAID101fHIMVRADYxGYXFkwJM4H
         W7AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgvOnqzaNcdqXF5ai6H7MYR3sp3/uh34R3N3kXenmY6bRknhkVwSh0EA2jDrkhgUFsbQg+Hz/bTaN8Odc3@vger.kernel.org
X-Gm-Message-State: AOJu0YwrK53CK+rOxLcIL62Zplrr9rJz0vEBjAkQMJ/d0jrBfP3318Mx
	1u8Z/D2dTdkeKQ7O3baO7g+YInq6JNN8Rkfg0UV1S3xGs4h3k83iyVRIw5eEWRaODR4vUh7fxeu
	T8kGSV+AXJOaQgLfe+OGKSCNSVUm5T2ZOmSSh4NGXjBL5+WyRHD9DEHb6l2sM0IcnqA6w
X-Gm-Gg: ASbGncvxM13OsJBZzFncChh2o7Fjsw2aEzUmWWiYbpKD9LguGp1DLiZV6NLq+nrcrni
	1TQ9/rh5gwMoklmRemKmH/69yiME90NHafo1ONUSu1JA2oH6vIWaF/DjGxAnekYM9e8mEtCEYae
	7Nl0HJBbRAskPU/O12dXB0N9TH0Y3y9EOPnWZ9D4WaN/RA/keoyHicakNohJwMDow956Gy1aEIP
	fJXVc601B3z1MIfGC7I8sfYDW/uQu3qhWQS8z0cie36NzrN4+PxWsuQcgegGYOtuLaVai6N1FdJ
	TtdRzB3abBXbXbKaKP7Tgw11bO7H9isussKDzPZ8veTci8r22mBBPxld8SnjmijcU+OLvMeG+3Z
	ovrK9+bgzYwprXdXSkIADK/H18uE=
X-Received: by 2002:a05:6a00:9a4:b0:76e:885a:c332 with SMTP id d2e1a72fcca58-7742dede382mr8601108b3a.32.1757296990864;
        Sun, 07 Sep 2025 19:03:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOs9jKUV6cIHNdp2p0J8iG1tJf8wBzxm8yWSXKthNym9v8Uth94m5iXHGoZZxFhI1pYHN9pQ==
X-Received: by 2002:a05:6a00:9a4:b0:76e:885a:c332 with SMTP id d2e1a72fcca58-7742dede382mr8601060b3a.32.1757296990322;
        Sun, 07 Sep 2025 19:03:10 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723f4858e6sm24285076b3a.4.2025.09.07.19.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 19:03:09 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 10:02:01 +0800
Subject: [PATCH v6 9/9] arm64: dts: qcom: lemans: Add interrupts to CTCU
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-enable-byte-cntr-for-tmc-v6-9-1db9e621441a@oss.qualcomm.com>
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
In-Reply-To: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757296941; l=820;
 i=jie.gan@oss.qualcomm.com; s=20240927; h=from:subject:message-id;
 bh=9cRSlY2NurvnURIS4RORNBk1ASEWuw2jDevqbo6Yazw=;
 b=tbAut7V9y1GHLMtaEckyjFizzcfbfFKrXsRyaR051mOcnrkay17afbh0raaPOgNxvrZC7TC5b
 9r6YmIT3PiPC0Q2P2HRKUC5MJekXUJa6Xeq74ntPUsDPgLOyqJilyBz
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=OZh7JyRifqJh4xmrcGgmwa8/LCS8O11Q+mtx4aZGmi4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyOSBTYWx0ZWRfX83B2AlDiAxR0
 zN80WM80FgrIgO6NzMPD4Zz1saRBaI9BN4ONZCygbgql3Cct+kzv4RS1djRqe98P2x6C8pS/+L8
 WLLq6ibAc97XPLelrQrifLUwRJws11PEEpc0Ksmx7wPWTULTbS3M1l/dqd3sqq+TNj/ihanoVzC
 mSmKb+VG10o2pbNW0BdqREB5dkOQroherh6qOVtLhnEL2XGaIcwD0Aw7SjKaKxx1RujZZyVsLF3
 qym2gpumVtVJw7QL0v19/DI8fLuUuHpV6Zn1S1pD++2MAEzuogSicMuKF4CmHzlxMAAyMRj1LkA
 TdPS4b9OqLNkZeGFKvSKwhlRDgKGdaTujTTJ4EmBKBJWC5XEhRkjz6E2ObZPzdS60VhMAh4BMLP
 liPNmSmX
X-Proofpoint-GUID: AzdeyzzC1lAOxgB1kFYkSjiTJyRil3y9
X-Proofpoint-ORIG-GUID: AzdeyzzC1lAOxgB1kFYkSjiTJyRil3y9
X-Authority-Analysis: v=2.4 cv=DYgXqutW c=1 sm=1 tr=0 ts=68be395f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_10,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060029

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index f5ec60086d60..0a17a26f85a5 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2774,6 +2774,11 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "etr0",
+					  "etr1";
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


