Return-Path: <linux-arm-msm+bounces-74930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D308EB9D98E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:30:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 132101896693
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E58442EA159;
	Thu, 25 Sep 2025 06:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hbD2kGQ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7DE2EA171
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758781760; cv=none; b=eObVZ40eDD42xDQGzg9hY67CKvI/neIvMZj+4umCz1pejTYEoibGifOHeGuibe8DR6fW7B6oSl1zOfsVtSfr2vYbzJEcqG1PJQBn3lIQPIdFuvihqUcz9JXa/fZOEOlBWMZh3o/ByOgYb6xlZempwQsI8rIFODklTKJQxn+mIdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758781760; c=relaxed/simple;
	bh=D3joMpRcaeR3gLLXU5PCwDBHjh3jgbSRLlNslB9/hYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pMXOUE6246yW9czqkqIyCWs3n2inDWCgMsrortx676ZFkqiMdXZv3PsKG9nI4whaeL2fZl7JDiN4K2h0Es7cgLJzs45BGCeoYx+AeVf3YuYpglX+ELC9DHwAzY5bLI+zU0+893VOqhasR6xNuLGzNjzTFzM5tW9jiDCLm6U9pxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hbD2kGQ8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0Pxl7025158
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4p33NgPxej04es67Nsx769+T5sIjjSqFb0zB/Kwm1+U=; b=hbD2kGQ8sZ566U9I
	78GIyL9K1zldxXPH9r7g1FBEDSSeHC2xpf4TxONeD8ndvBMEX3lll9SB/VQ2ff8a
	/bWHXqEYHuFj80FG4fjyh56Cf6uIVewR1zzb9Kaq4ChY0TiHR4N5R3uwFw2U2kQO
	aWDb4asp5ear/tE9tnponZl8MieKrRn/2Nki1L3tCDsRmzqHHwKz/sOKhuIAhvoq
	Y/3zRj2o8QZLJgPwqgoFZKS8k1Li3wjYXZlh0+Pw9B/kAECoYLjecOsi61A+PWkT
	c+o3Npx4g+axXBO3BdVlX+4+RMKZq0+YcAQbTwhKlzQo2/cHIszLzjts8m+oE9dE
	LzKVAg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv171m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:18 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-780d26fb6b4so565032b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758781757; x=1759386557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4p33NgPxej04es67Nsx769+T5sIjjSqFb0zB/Kwm1+U=;
        b=XpLQyMQ/NfNSHziGfwIYzX2qlXXVMg/GoMEil9PrijD8jevjT/ecjUGjuQDYu4foxk
         eXeRYl5e9llb5ushKoRZVGbrjWwRQSlCbGKojrnQrtHdUAGZvJ+YT83xWrhztbh3zAev
         HPomI5gpP5kzBwYIuXjBimcmtGsrcYVG4OFHF4TxQp2Y+YDbVh9E1ZzUT2D6CQaHaz/c
         1B1hp0d4uKDtdAKnpBO0A6UKMy2KDmCAPx7nG9oiTA0AWEhtNubyCImnWWo4AEoSeyaz
         pfnWy4z/ceOCO2+tBg1e1/ZQz3jv/4GG8K6l7Q5cQ4fXp8fRQexvdbfnMvkA9jvnwGSr
         KH+w==
X-Gm-Message-State: AOJu0YxN6fPy2dJX7XPjpCGnFkHTRVNlVqZ9X3DLclIeuXv0usjlzkqS
	KK8pPQo5LAMUsiCOhb7KnCURUfe/1RDAnB0YZ7pi8pRtZHrAQ4vGCQ6cpy6VF50tym2kcf0+j2Z
	uPK6jUMxmitw+29sNbjrOpM+p4tYCMdpU5EnXFpzQvLp30TmA4fIsgXeCUYupSEhYiyNlsvfCib
	Db
X-Gm-Gg: ASbGncuta7SzbrGw9dhSlJ5gkrfTEXpP7zYSER+ts46QLcON/QLX7kf857QxSAI8Lw+
	1scyacTuMpFnpbxPPnWm6KSWqZ8EzzNOw+0bFpdbNu+3k5fA/oLIBxNtU/QOCNrKoPlL5N40Oan
	lctgc7qLnxUBSvn/3h42GRT09VlfMtg+qcjzOL3k+9Qac7quR1RFAGFPSSR1EGDTONyTbGXH0yl
	xVD2MGmU3j181m+x46N8wpKAGnWxpIjPZUt9ARUyrg5pn9PYp5ZbQPO65xZEjPa09jtUb/rZif1
	SPGKNlwigtAK65ABm+lZzHBt+kR7H0NlKsDz5MUS4Qlm0y7Exv8uW7Bsi7ooddQUzr/lHoI+U48
	ietBvbfNivMS9orbftsB8DeW1XoJuPdvXVDPKg9beOOxncE29S8ZwDCgiG/hI
X-Received: by 2002:a05:6a00:218d:b0:736:3ea8:4805 with SMTP id d2e1a72fcca58-780fcdf4844mr2785093b3a.7.1758781756882;
        Wed, 24 Sep 2025 23:29:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZfyzzBkh9JSOcHQ5l9IcBwNXFRuCu6kft/cJooGDvfC5mFxMmtPNbwwJuJwp/7HfaNUir+g==
X-Received: by 2002:a05:6a00:218d:b0:736:3ea8:4805 with SMTP id d2e1a72fcca58-780fcdf4844mr2785066b3a.7.1758781756446;
        Wed, 24 Sep 2025 23:29:16 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810239136dsm952962b3a.5.2025.09.24.23.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:29:16 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:58:12 +0530
Subject: [PATCH v2 06/24] arm64: dts: qcom: glymur: Enable pdp0 mailbox
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v2-6-8e1533a58d2d@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: TaOxSuFu3R3Xo84CDXEgsJ5ia9ZooJOy
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d4e13e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=nkVSH_9X_D7H38LkyDMA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX7AEiCiuNH9mZ
 KbTXiQv4nvpq+8yTrEIDy7Q+lc2jqokgjZP+/PrSWT1xSOIjBJaxco1rHzJF2u/Y/dIp4XUjSIO
 O/14X2rGsfOMXb9Zny9ddKvy3xLYOawh5CWrf2jd5WSsnIoSmt1C6i8Hu8G8NO42RXD2iYh5lwZ
 7jCC4/bQX7Zm6LuZ0JhvzsZurLfVAY28tqUfT7PTQ6Wmr/+hMbIB7SGkgxNQXc7HT8Sm2Fwq1Kk
 6+N06UrViKUy3RydFK7dhiRF8BYzLuSeZSmrf/YtK446hS8DWnhfioqQNhpmQ7IjQeWME7ZyykX
 ji/Bd8E4RmKqefeGHVLxfnD6tDkLXzqGdhUBUIvVciFzONyfN9p4dpK4Ak8zeTjk/v+V4mZ84nA
 SD5LDtTn
X-Proofpoint-ORIG-GUID: TaOxSuFu3R3Xo84CDXEgsJ5ia9ZooJOy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Enable pdp0 mailbox node on Glymur SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 66a548400c720474cde8a8b82ee686be507a795f..ae013c64e096b7c90c0aa4cfc50f078a85518acb 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4065,6 +4065,14 @@ watchdog@17600000 {
 			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 		};
 
+		pdp0_mbox: mailbox@17610000 {
+			compatible = "qcom,glymur-cpucp-mbox", "qcom,x1e80100-cpucp-mbox";
+			reg = <0 0x17610000 0 0x8000>, <0 0x19980000 0 0x8000>;
+			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+			qcom,rx-chans = <0x7>;
+		};
+
 		timer@17810000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0x0 0x17810000 0x0 0x1000>;

-- 
2.34.1


