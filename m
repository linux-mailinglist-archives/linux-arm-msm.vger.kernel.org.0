Return-Path: <linux-arm-msm+bounces-61757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD854ADF510
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 19:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EF5F4A3131
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 17:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7762F49E4;
	Wed, 18 Jun 2025 17:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KLn/PbA1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59702F549E
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 17:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750269002; cv=none; b=Yvz1Lb6+eAxKdq5ac2pUiFj/JK+jZX3hRniMo4lwuH8vb139PhwRWYY0I9tj7NXEFpWO1alkaaJR2P+wRFitRiGjfllpCZEdz7rjuZWA7pKGn9DHAD4KITo2+iG8HBuSAxJesTTBUTSg7ad/jvu8dPFIm1A6qqpdVe3Idum7XH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750269002; c=relaxed/simple;
	bh=lfDD2QXHizWUOUackdjjGT5IKXMqfv7alla6JQhX4ME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MD4FNNCTghEoxmNgE6RDTK2ZxNvNSv2RaJ0dkVY5Ea4XfCwMjqDmnJQz3fx9D9TshT1dxONSf6dtKppnRY7BpvXL/hdWIC/T7z1RtkdPnsEvpWhj8wefdlAtpA0IAG3CZ2fCnHOC6T1C5D1shnTF3pSNfMuDCo+pEXl49crCvWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KLn/PbA1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IGZn3c012463
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 17:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tWwHy3Lkp73ob9Fzw3Dzl2RAH2AqbDJudN6Ojoev3Eo=; b=KLn/PbA1DoTOGsW0
	0D3anwe30AvgNN6UN8j/lu+AM7QoJ208U2kdnwEhpEpMipvhiI8AYeV2NadATb+V
	D2mTewkO5kCwwyFewqc6HLhs5DRUXuVlEOajOkbm3MQPB+GjoE/shz0RsDfRw9mS
	lzopX0F7duM8L/t+c7DjVh4YEvOzy3Ci1LWEJoVoZUP91ve8yPG0qZWozJFcJLlf
	LtdwjrMMZl8T8/C8ZYWuwUIUadmdui4qFYM4Aqj/504TYn6rLbwLMO4fJNr6dQcM
	AK6TGOumO6WDLwWgCkJeJhcpuzackHEOV7QlW6ReE8VK557MBc9w4Dbv8j7qPX2+
	rs0YMg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfn7ed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 17:49:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so1221620785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 10:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268997; x=1750873797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWwHy3Lkp73ob9Fzw3Dzl2RAH2AqbDJudN6Ojoev3Eo=;
        b=rVdA8/XLuUH02lAX6CKYBNqJRi3vE8aHMmKz5d5UY3pYqU4d3ZIv8mBYrfYbO0Vjg7
         Be6OI5cmtTnYI5YNvjKvQHX1htN9/qdscuO3Kl38l3mfuoQQGLnAD/C+OtgH1htiWH/W
         bB5xZcbOeb0PH29J3XCleRmzWOaV0iCrwC5i00wOjy3D01YTqy2gsYmKt/VFyO229jyb
         tG1Q+zGonFgc+UzlGaQGAKZn3BR/l7wC+9ugPU2ajE/G53gbB1tOcM5XCj+mXMP0/4jz
         IViFbfXqRznAdVIT1zyqHwMghcpgjN1Ys7Mcuus4brtdxghtAriMnQWC28DcedxZzFtz
         6CRg==
X-Gm-Message-State: AOJu0YxZC+EtUhb3r48G0u10qEK2cJOhcEaeYR76EZhWg4xHoj3DXvkf
	0KmsVMhdB5g2HvsT4rKoHNnPZvroPzz8199F1MAPmZ9G3VlpnIHOjCBCZz+pyB1N04tQAUl4DIk
	NDljzq6949jVG1XZq9QiTPZlS3yaAlJdCNgJlCTw9LBEPLFh2gBgkRVDhG5wQwqPNslxj
X-Gm-Gg: ASbGncudPCjtMlifPE6zEhXCzIm8l+LcXFcqCQZhNyzsJWLW7JpA8g7Po7t0+OS6w68
	7ScacjYCzdQJmAPV6J01kGcX8mb6zNnrcYCiqbrTeFMovt28XlUxdjQ/UNaPAZtXD9Bv1GN0UZl
	QeXxuSaXuxOMy0cBjTiYh4biePHle6JVSew9uPp+V9qtB8BTJbXA4Ei+kMt6yFwks6imDhpD5Vm
	eYnInAvHEkKq8i++CqDHABL2UUF0jvK+/u4SgGXBXi0nr0YbaBULcRs9wNGpnY0wHEDbMOHlYe6
	V8MVruTEcfQ3NzV2w73VYy5p818Wlmm4JIxaws+KlE5Gkdbv+l9G8IEQPi2GCf2R2gCI51JAN1n
	1HVuIsk06nBwSGfodMfycKuToJa+FgyRRYcM=
X-Received: by 2002:a05:620a:3195:b0:7d2:1a54:f646 with SMTP id af79cd13be357-7d3c6c0e558mr3239915185a.7.1750268997407;
        Wed, 18 Jun 2025 10:49:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJ8jb6poGFVV6F7nCpJD19udVvjHcsMylPEnQlIw1RC5gDDZlxn5SXdq6NiVC76favetUMrQ==
X-Received: by 2002:a05:620a:3195:b0:7d2:1a54:f646 with SMTP id af79cd13be357-7d3c6c0e558mr3239910985a.7.1750268997000;
        Wed, 18 Jun 2025 10:49:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b7b43a98esm2911131fa.65.2025.06.18.10.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:49:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 20:49:52 +0300
Subject: [PATCH 2/3] arm64: dts: qcom: sar2130p: correct VBIF region size
 for MDSS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-sar2130p-fix-mdss-v1-2-78c2fb9e9fba@oss.qualcomm.com>
References: <20250618-sar2130p-fix-mdss-v1-0-78c2fb9e9fba@oss.qualcomm.com>
In-Reply-To: <20250618-sar2130p-fix-mdss-v1-0-78c2fb9e9fba@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1096;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lfDD2QXHizWUOUackdjjGT5IKXMqfv7alla6JQhX4ME=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoUvxAVbrqbqI0kYsNshCkKkDoROrOWsCHDJBw/
 YeprufWKDCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFL8QAAKCRCLPIo+Aiko
 1Q0RB/4+ANzSYQzOdpkq4SzgI6yGHE1N30TAOErADixJS0Nrp5pV94L0zDF527fPuHXtljmVt03
 B2eUQOP04wSY6mjhcur/GiIvO5bEJl0BOavc0bn7gJ3Edr/6bg9lmLsqKZOJa52i7M3yW74z7M4
 SdUa/cAqAa0rfjYjgbVu8wnA/laxF5hyeQ39/HwO56WfpiB0rc/Exatem6l1L9+w30mXcb7MgWq
 m+O4pevSy1IKVyhETB06XQG+E9s1N3sUTDj49giulyvM09Sgw6seYV1slp7qdb38DrEbseMPUDs
 58KlVXAzo6HpfmE4S8GTTds9HtKyiM1fuNou0eASXf9tkU+j
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE1MSBTYWx0ZWRfX45zhpukShy1N
 3c2d7RzXYrmSXFt2hltl6Ss1XXZI6yq9iSgDUmHSwm66IS/+evOutK+Pd6OnL7Bs8NdmAlf2GPp
 yumbYeceDLDnM926xj02yb5/pWGthABNFc2aiOu748QLpuskFxINOgaT1AkgZUPM9EBMv9AxAwy
 YQfdBjTP91Drpr3Fs2/jukdVWZ3HWOegBNGZJ4AgUIZBkpd5qxVNx9KEaiCgZK11PfiXoBUXhmV
 2QAIqpPPoShq2Tm68KuSmAtnjMgIvqnX62uok/W+Ock2n7EqV++d9YBFrq8d8RAW5jXqXfNl4Gv
 IFY5u6p/Q+N2UFB+rhODizwsfLR2l3Bt4RRxnBf3Z+fTGVtFAbtPeGBsBrUIIZ3a875DjzWZ0Rp
 9IFhFe4sEnmh5XZLuMrD7aWcCHDcwEvxF+y20yOuy89VXm2tdwCWEt53LKDnbcZdOBm3G742
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=6852fc46 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nzbLNaof8OtCLlNVw1IA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: fOSj9b9iqkTINNHO_7f5Z46jXoTUYCwX
X-Proofpoint-ORIG-GUID: fOSj9b9iqkTINNHO_7f5Z46jXoTUYCwX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=744
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180151

Correct the VBIF region size for the display device on the SAR1230P
platform.

Fixes: 541d0b2f4dcd ("arm64: dts: qcom: sar2130p: add display nodes")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Closes: https://lore.kernel.org/all/c14dfd37-7d12-40c3-8281-fd0a7410813e@oss.qualcomm.com/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index 6d7d4f05d502049dd6dc404317412c438b11d081..d9948360cc0198a768598f60302097e1143cf1fc 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -2053,7 +2053,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			mdss_mdp: display-controller@ae01000 {
 				compatible = "qcom,sar2130p-dpu";
 				reg = <0x0 0x0ae01000 0x0 0x8f000>,
-				      <0x0 0x0aeb0000 0x0 0x2008>;
+				      <0x0 0x0aeb0000 0x0 0x3000>;
 				reg-names = "mdp",
 					    "vbif";
 

-- 
2.39.5


