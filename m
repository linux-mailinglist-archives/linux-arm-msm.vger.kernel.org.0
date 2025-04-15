Return-Path: <linux-arm-msm+bounces-54377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86592A89A1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:30:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1208A189CCA6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2172951D0;
	Tue, 15 Apr 2025 10:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkSLToHD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997D428DEFA
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712823; cv=none; b=lmyWiRBhV78fQFbzKmvDYOnnEa2dme9g0v3KLbGKzGxdShBIcxI3PwaKhL3EV6E50xgfmdF6qDulYcvHLuFjUpamC1JRdVOSu7l01/mpWTTNl20Cq8yzcVdRk3xPmB1XWfY0mXArrI1bIvY/RvtpXhV0RqYuS5eWZWWXjowbyCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712823; c=relaxed/simple;
	bh=jW/DDpfOxjsJnp2CFh2GLQmySmPD6CszwncVhPIR75Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XvGh6TJL1Yu6dAjb0PmQhOjvKmc3ALUx9bJSVjxgH9zEWO2Bt2Y0/ipFcCbZjhCzZl869lI4RBKdJmw3yY/7YqvLmWwkfPUx2B3asULVihgL4jnlf5+QAHfYPRCrIOpPSgeU/jUpQJ47Z9qmsxWi0nSewyg06kEVJmpgE2iVYYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kkSLToHD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tRlA006069
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DbMB4xwlSMn6GaWkSDGzSmbicpF6unMBuX3zyKKQblo=; b=kkSLToHDt87CPwNm
	cR4lWtQINK3tag22geb8hOqqxBgcp1zMOWaLjXNHmmniwRee/5ijazyHOMajLecn
	ywhJOgrfIPMKB7MSvYhHPXaFT3dp9banvhtaLMEo3aPHMbierjqghw7xwfTe5Pef
	h/WbdFOz94o1/biL+QZ8/AzJQcNTHpwfMMXAyrCoc1+DrtQgZmjpALqt5d+M+XB6
	52GUiqkAzgLumeN26I2V5TXEOIAeDhIIhPU0kMr4c7p3tJ1tfRcZ5dqhp10aZgTi
	2gqi7HJ59GoCyhj5PCECjjsFxCSxUdYFazVB+u1VJd4Qk+q9+SdphPf0Ed8z8oij
	L+FGmg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvj7v32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:27:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c3c5e92d41so829510285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712820; x=1745317620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DbMB4xwlSMn6GaWkSDGzSmbicpF6unMBuX3zyKKQblo=;
        b=UMyWnT1MtYkuzvMziCT2R/Lka/cXfP/ZHaQ99KLq0YiXSEe47nxIKNSMsCw22B7/0h
         K/SumKl4N1Fwd0QV+BG6HulHTknuO/QYm5aMY2G1z+NrC7bvf//rrWJhbsj+0xV8dvwH
         kXutqZB6mGudp+zRHC0+Qd7MWF2HweiqbMg78ebtxqsWkgOO70x0Nt2/lXZ1V3PVzTJx
         aKMDgfmlFX+xzJFAZRFZzA9kKpMjUFfzeUpPgQ81iC3IcYYD0P5JzD5/Vf/bBLQmuCKZ
         jxkmQ8bMZ39wZigU7XqAlman/P2/vjgMZZ782GPXSmRNqbMlEswXYgb9iSdaM5uSUrDl
         QxgQ==
X-Gm-Message-State: AOJu0Yxy/9asUU5FZglE10QnH2pczEUEBln6Jjv8FNeUVR0JypWgdR+U
	ecxy2gYTa68WQWNPHj8EhBNynS3l0hIOi+1apqSzLZHuXbJ6rA2fTw04j23z4F0TbnxALfr70Ea
	QjBYPPjX6pL7kIgKZ4rA1Nixsll8XI8IcM/Gadj/mEoDPGVOFhf7NzbYZI0vAfyhOEWkJ4A82S2
	TDLQ==
X-Gm-Gg: ASbGncvXevmugL/wix3cB8DyjtEJw8IHQ3/tm1vuiiLo/gEu7ljQIHlOx6618t9xXIW
	/f34OHL+ZbHKdk4gr/CfsITiGwll0Ss86nDTq8DfSDlqVDlZkalxwc8vOf3qnNKifDuNeSLtnTT
	MnNnlOXEj0CxzJeoJLawyA7bjEt/b5chN378jYVLDfKZle4JmKoc9c45/kRl/F1VkLFu028fQa0
	tplEjvMWdoh0g1sUjp3qNIjjTWp0DbP5qWSem09+J2QpnCqb5L06U8KC0gQdOFiZeLDCXc1gt5/
	zUbsJdTy8Jk/kFZJuHPWoew2ijzsLCENQmrytWLdwVJx+yzjVMwtgsD61OJOMjxkyuoPMSqrWlz
	intt+7HZSb+XXe14fLTD+5cmx
X-Received: by 2002:a05:620a:440d:b0:7c7:747f:89d0 with SMTP id af79cd13be357-7c7af12e230mr2393073485a.18.1744712820287;
        Tue, 15 Apr 2025 03:27:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXgp2tV9C9icQBARoz5VnKdtwUEBJXMFFT7aIvfhUyyz4l1xh0g5ipC6d5BCkp59mSJBlwEA==
X-Received: by 2002:a05:620a:440d:b0:7c7:747f:89d0 with SMTP id af79cd13be357-7c7af12e230mr2393071685a.18.1744712819998;
        Tue, 15 Apr 2025 03:26:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5035f5sm1384005e87.117.2025.04.15.03.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:26:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 13:26:09 +0300
Subject: [PATCH 11/20] arm64: dts: qcom: sdm845: use correct size for VBIF
 regions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-drm-msm-dts-fixes-v1-11-90cd91bdd138@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
To: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=977;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jW/DDpfOxjsJnp2CFh2GLQmySmPD6CszwncVhPIR75Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/jRdFtoC5UHoCMgTqYOZmYPTop+yLUYlXp7SF
 pnzXuUbdjuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/40XQAKCRCLPIo+Aiko
 1Qk5CACg7Hb1/rQe+idlJJW5Ua678cr+23/zAsWmB6gkpud3h/ZTmgLmTGbgKMGoS3Bg2XBRNis
 B2drGwMYxaX8VZ+oyHsvd13r9aRdnnNG3eXOXdcwf5o7iQbXcsPK/w4LOids4JMxCIxZhIJmC3B
 8v0tMoPTRWVvpIRNCqW4Y1lKZUF3Di3RtWnfI+pb/Wm3mJZ6bnsxgGaEBE9VjozFBNI1sLSR9ac
 jUeJGQ7Pk1ZUv93/DBzaOVRChWAf6wjM1Pd21Q8Un+QhMUqdk98ZrIExpcDyUreob8slIn+jDy6
 7fVuFBNuih6dDsWHQ1TBfM/vE2K5CGx9qtY+RU6kD3CP3Udi
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67fe3475 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=9SZ4-cSOyNR5Keopn1gA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: oKs4JlTqK6m6uSSiL33vYiUEv9wkuIkz
X-Proofpoint-ORIG-GUID: oKs4JlTqK6m6uSSiL33vYiUEv9wkuIkz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=812
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150073

Use allocated region size for VBIF regions as defined by the docs
(0x3000) instead of just using the last register address.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 5808129e2dde061dbc79d63cce9f5254de2d7d96..19ece2daedbcf4019683e041766a8c4e816565c3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4546,7 +4546,7 @@ mdss: display-subsystem@ae00000 {
 			mdss_mdp: display-controller@ae01000 {
 				compatible = "qcom,sdm845-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
-				      <0 0x0aeb0000 0 0x2008>;
+				      <0 0x0aeb0000 0 0x3000>;
 				reg-names = "mdp", "vbif";
 
 				clocks = <&gcc GCC_DISP_AXI_CLK>,

-- 
2.39.5


