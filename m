Return-Path: <linux-arm-msm+bounces-86364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E055BCD9CCD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 16:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25F20307D40B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 15:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438F93358BF;
	Tue, 23 Dec 2025 15:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TblplG+s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F7A5rS4W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2922832E140
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 15:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766503575; cv=none; b=hf++qpjxQcU+sXirzBwq0m1tBC4mA9JmboiJUnf38jiNDA0T6Ey4qKC7ewXOqRb6uzUqfLfPMnpwwFpzEXk7ldOFtm6f+FO9NEz0JHMlkU65mfWQ25nNgVvAOS8OjomiM5M2+2kSYaIlGz/QdleKttvh7mXduop3ToTH/wbrvZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766503575; c=relaxed/simple;
	bh=0CUlnqHNwlFJRp+AYApPStXGaWaesZJjUACCPpA8wSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dfhrKOikSnCVs9qalnif+fI9PIxitRn0flVoPBtZh/Hc/GHXyS7LGydu4m8kg4a9MizxUQ6z1uhJzA7wxRDl7ajIvMh6gtnjWSAzdkV4gKyNE0w1oONzC1GG+KBnRIx5HVQs9CaBSWhak7Vbr2ghvsRD3A7oYwnXs5e1g0CgRKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TblplG+s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F7A5rS4W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNBRIjD700895
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 15:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fJyzxinltDd
	SGRuCgEMUAgEIxqHit/CxQ2kaQl1iY2M=; b=TblplG+sFH1CRUNIQWqqJeVlJjf
	SwtH9AwT3Sw2NDH2YrDWTOy3NXGTH4lkxPzRwZwrCbs2dvb3RuTFevRmTtfetAc9
	D0i3nQGaNfJ35abjOevcCWRi+0hHgZIrc/8LzIiieTCPvQl3PbN72aHYjh7REhRA
	voOY9L4SqRfHA3CqfkYRPfnCOYmxyyqf0lelg7At4EatWYY0IDNdzJPbQq7fF/sY
	6PEsdDGUU684Xp5+nUcl4RC9IFxRsVRa8joGQigMVfD7Jnmvo7uRm4E9GS7XT6Qy
	IhB7J6KT9x85fyozSDn4/Y0Ktr+BFamBsuah0lKHWpa9zuFG+SZ98HKGTzg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jrmyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 15:26:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4eff973c491so125918941cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 07:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766503570; x=1767108370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJyzxinltDdSGRuCgEMUAgEIxqHit/CxQ2kaQl1iY2M=;
        b=F7A5rS4WN2sNfeKUnxtrqo7AtNgvOORl55Xo9RUFi21sVmn6I9Jh2g0gzViGVeOYSk
         5OP9GzXw0114sLRqA3c7op502e7839ccxn1fjtaFF5cc4eoP/DKMn5bFeIUl73mDsZ/X
         LbeXsOrxXdg7LPeL83KA97qZ/sfIOy6kqKry+pmyMHOrDf5hXHXWThjj+DYk+83ApjTd
         xB422k01OP+95RWjsKOHflkSAWyiWeYsqMk/e+WnGi+j8spvRQMEI0xPbLNgx59+0lCX
         nw2ZpvxVrDhRbZ+e+U7HLiC00Hl2wgb03IasqURTFexZCQUoBzleGDbzmRU/CcTViAMf
         v//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503570; x=1767108370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fJyzxinltDdSGRuCgEMUAgEIxqHit/CxQ2kaQl1iY2M=;
        b=QH/BtHKP/TvYQqsQGvIATSA7Hswp4/HfS1+uyZK9K5W/e20rv6XH05MKOVF0B4O38m
         CUNOnpXjyZJyw8RoR6V1gRKFF0MT/3kIVrebcF2iUZ76yF2c08O60j8H89x6l4Jeu2Tr
         87FpVLMnwmWG0F8aZM1MgCjf+wbGkGidFfgIXWqGz/CU84gSp7dnXscdXy7pPWmr6QtW
         doXJMOPn52uSo2v/CFJXPk253Iu6MRyMjpGD+tXyu5c2oCKpNrB4mMJmj5I53/dKf3gD
         +zGN0y7pyOV3xhBQNxmXFhGg6mCLeVot2YWc0MOXGKYd0dfWipaXKuKXPzuZQPsF3qNK
         XOkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFSULLmIL/G4ZbfW2thbiLprOE/ndf8DFT/U4P8SElAKgNwWwDUVJiMX2gFrmzeKSnqbxBmxhwNIHylQPr@vger.kernel.org
X-Gm-Message-State: AOJu0YyY1GelPLsSmBokjU9AZ8Nvx7L3bltgXqS0IPFoTobtlJKRxfVf
	3XlRgzsNOpgsX2A0xj0CtbCc1PKvoXJ0bWHda7qrwDjmRHO7Jtxk9abl+B+NDExru/21wgpoVci
	g7AAUxt46GkgI50D+6Y2uFvdbxF9ytU799dqul0a5Urc+38U3ivreAHtuHPRyIflF6TVy
X-Gm-Gg: AY/fxX5GG8Ov6BL23+wNTEc8WMiFJXGuqgheC8P9KiXOHa5tHY3RtUOe+ouPy1Tg8LV
	FoahCUi6KJu1X19wBhEQ2Ok6znw0PryRhJim1ZKno4UUHkLFPb2LcX9BkvJa7xbYi75RWvddWLw
	oI4/rU0WkcAhlUgrqMA7qd2emxeqyJFGwTSiDfK19fw9Gag8ZwZ2WWAPoR2zPwyQ1OHVcsz3MWF
	vG/6D679C8zN0JUA7P8a+SrPeePC0DR0jEg8hOv2EO/Fb2RCcx5Zca7SKnnrN6tYJBVn7yYwbOa
	oHGHRMYVyXFrywxWxsWO+tzNvW32HquLyHbtPEBuRMzabyUhyt82DY17p7ldXhWxYZKyuCyuw/F
	wVVYcTv05l3mWGQjsHGXxBDeJWVWZLmsVDrw39nBqeX95DTG/gGezXmjBBrU+GvtbxrA=
X-Received: by 2002:a05:622a:1c0b:b0:4ee:4a3a:bd19 with SMTP id d75a77b69052e-4f4abddba78mr198796511cf.75.1766503570187;
        Tue, 23 Dec 2025 07:26:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCrCCmaOgNvOOTihnIyQAQdtYsYo5GXIn2ObpofQNTUCNjyEKmO1DXhrY+t12WRUSJwZXYnA==
X-Received: by 2002:a05:622a:1c0b:b0:4ee:4a3a:bd19 with SMTP id d75a77b69052e-4f4abddba78mr198796111cf.75.1766503569716;
        Tue, 23 Dec 2025 07:26:09 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9ef904bcsm13268409a12.22.2025.12.23.07.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 07:26:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] arm64: dts: qcom: Use lowercase hex
Date: Tue, 23 Dec 2025 16:26:02 +0100
Message-ID: <20251223152559.155703-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251223152559.155703-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251223152559.155703-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9897; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=0CUlnqHNwlFJRp+AYApPStXGaWaesZJjUACCPpA8wSw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSrSJjHWsyvx3WHKRIHoalcqXJ+WqqK+LEXrFn
 J8/d1UE4iOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUq0iQAKCRDBN2bmhouD
 1ygrD/9eaO/05h32RcwZA7Q+mkx+RBVPH/kvzaes00kTYC8F5qLtV4mQt+sDeZkV9ppC3ES1G5o
 OKnodVL6Bn7TF44Ri3BGKz1Tsa+gdTeQogIjMOsW/GIkLIy9Sp3Xc9XyWftxDQWiGAY+h2iJX5F
 Rwr0Nz2IYFV+DF2AP4GsD59oBpq+jLRT059d1VODD8w/pu38QFBYi2e9vDqSEZOvGwroUqCSMIk
 EjMJdfvYVYCpLaCTbpewUmhVllKd178iGSDBXfAGfVN2u3/LKcNQ7ZKyi10yd+CHZVARwMCGYpw
 0YPPNNK+cl6SFnSxix4gimik0kDLW7UjTrm5Ep9oas1diMVyJ2BTE+LjAI6dZXrMJuy50HJDldJ
 YOzbNTyDkTedNUcq8k37On4XFoW+9EZ6D7/yqQenhHwE01pVn+R99aWNIyPi1IlqKU27dS6dPZC
 74CR16nYLnjtKq1Pkwwv/1ijCFjEfl/gy23sgYognbUt1VB8BGkDU5a3pf79VqBnsrRPDfyK3/+
 A5xPkai4PZlZZF29piXahaez0KjICs9ogb9EkhrU//VrJIQM+9KWZIotOLcLo+rYJBnvIS0TJOg
 FDqr4d9F4yOOnsqcAtrAt8yPpBCk5DCUcZaqK++C+ur7UefcBfm/zfYykzO5Wh1+G/ck0x9OZYi E2V48Hw1ES2ctDg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyNyBTYWx0ZWRfX0TAIDC+ZPtjj
 lW1CRsZYur8/YTlhvH9B7q6Lkh9CA0GY9Al4BPmGDrfxlPg5Zjyq4k7kbj+lSkvmQ9C4FEvMkNQ
 rR7NauoP/DwVAFVasJ0mDN2GoZgoQ+58a0nphmqExCQwc39eAqBZsQa0BUKUQMX39jBzOTBzVkN
 mHVHvLfCaNtXEy6hxTFZT7QKLk81elWK5btU1KA9tF+zd1YOYe+/jZEpepAU7cL/R+WzH4Hksls
 MF+Q/FsFW5214vj5zSkl3reC6w1APcNg+3ITapmEi0l1Jtd4L3IYpVHRhSZMLJ3KDkFWYF0X3IW
 DgIxOuUouamnLd2WZxZjRpn4FBMRlWt4XZndCXVxcbK02onSdohNGPYEa2uyx9ZFem4KwpcrpEV
 6c2NQ3GzFZuFAYknQ9pZV0/PWWZPwqsfVdldkpPmC0rB6QSdTu3MLM7yCAbOKNI0SAp2DhE6d+6
 z1beOe9R2RvtgRo6zyw==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694ab493 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Cs0fXASfUYSKtnxK1F4A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 9dCtKrQBuZYg6_vc6YUo5phwQGDnl_X2
X-Proofpoint-ORIG-GUID: 9dCtKrQBuZYg6_vc6YUo5phwQGDnl_X2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230127

The DTS code coding style expects lowercase hex for values and unit
addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi                  |  6 +++---
 arch/arm64/boot/dts/qcom/lemans.dtsi                 |  2 +-
 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi    |  2 +-
 .../boot/dts/qcom/msm8994-huawei-angler-rev-101.dts  |  2 +-
 arch/arm64/boot/dts/qcom/qdu1000.dtsi                |  2 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi               |  4 ++--
 arch/arm64/boot/dts/qcom/sdm630.dtsi                 | 12 ++++++------
 arch/arm64/boot/dts/qcom/sm6115.dtsi                 |  4 ++--
 .../boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts |  2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi                 |  2 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi                 |  2 +-
 11 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index bb7c14d473c9..9de6530fdf2e 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -3161,7 +3161,7 @@ usb_south_anoc: interconnect@1770000 {
 
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,x1e80100-mmss-noc";
-			reg = <0 0x01780000 0 0x5B800>;
+			reg = <0 0x01780000 0 0x5b800>;
 
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
@@ -4162,7 +4162,7 @@ gem_noc: interconnect@26400000 {
 
 		nsp_noc: interconnect@320c0000 {
 			compatible = "qcom,x1e80100-nsp-noc";
-			reg = <0 0x320C0000 0 0xe080>;
+			reg = <0 0x320c0000 0 0xe080>;
 
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
@@ -4673,7 +4673,7 @@ lpass_lpiaon_noc: interconnect@7400000 {
 
 		lpass_lpicx_noc: interconnect@7430000 {
 			compatible = "qcom,x1e80100-lpass-lpicx-noc";
-			reg = <0 0x07430000 0 0x3A200>;
+			reg = <0 0x07430000 0 0x3a200>;
 
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 132fe92f179e..512f6e004260 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -7022,7 +7022,7 @@ compute-cb@11 {
 
 		remoteproc_cdsp1: remoteproc@2a300000 {
 			compatible = "qcom,sa8775p-cdsp1-pas";
-			reg = <0x0 0x2A300000 0x0 0x10000>;
+			reg = <0x0 0x2a300000 0x0 0x10000>;
 
 			interrupts-extended = <&intc GIC_SPI 798 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_cdsp1_in 0 IRQ_TYPE_EDGE_RISING>,
diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
index b8f2a01bcb96..1e718accf8f5 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
@@ -24,7 +24,7 @@ / {
 	chassis-type = "handset";
 
 	qcom,msm-id = <251 0>, <252 0>;
-	qcom,pmic-id = <0x10009 0x1000A 0x0 0x0>;
+	qcom,pmic-id = <0x10009 0x1000a 0x0 0x0>;
 
 	/* Bullhead firmware doesn't support PSCI */
 	/delete-node/ psci;
diff --git a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
index 1aca11daf83c..7775532f154e 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
@@ -16,7 +16,7 @@ / {
 	chassis-type = "handset";
 	/* required for bootloader to select correct board */
 	qcom,msm-id = <207 0x20000>;
-	qcom,pmic-id = <0x10009 0x1000A 0x0 0x0>;
+	qcom,pmic-id = <0x10009 0x1000a 0x0 0x0>;
 	qcom,board-id = <8026 0>;
 
 	aliases {
diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 846e5e5899aa..cdfe40da5d33 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -1592,7 +1592,7 @@ cpufreq_hw: cpufreq@17d90000 {
 
 		gem_noc: interconnect@19100000 {
 			compatible = "qcom,qdu1000-gem-noc";
-			reg = <0x0 0x19100000 0x0 0xB8080>;
+			reg = <0x0 0x19100000 0x0 0xb8080>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
 			#interconnect-cells = <2>;
 		};
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index b9e0d9c7c065..706eb1309d3f 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -3041,8 +3041,8 @@ swr1: soundwire@3210000 {
 			qcom,dout-ports = <5>;
 
 			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x1f 0x1f 0x07 0x00>;
-			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0B 0x01 0x00>;
-			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0B 0x00 0x00>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
 			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0x00 0xff 0xff>;
 			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0x0f 0xff 0xff>;
 			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 8b1a45a4e56e..90314cb49177 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -262,7 +262,7 @@ perf_cpu_sleep_1: cpu-sleep-1-1 {
 			pwr_cluster_sleep_0: cluster-sleep-0-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "pwr-cluster-dynamic-retention";
-				arm,psci-suspend-param = <0x400000F2>;
+				arm,psci-suspend-param = <0x400000f2>;
 				entry-latency-us = <284>;
 				exit-latency-us = <384>;
 				min-residency-us = <9987>;
@@ -272,7 +272,7 @@ pwr_cluster_sleep_0: cluster-sleep-0-0 {
 			pwr_cluster_sleep_1: cluster-sleep-0-1 {
 				compatible = "arm,idle-state";
 				idle-state-name = "pwr-cluster-retention";
-				arm,psci-suspend-param = <0x400000F3>;
+				arm,psci-suspend-param = <0x400000f3>;
 				entry-latency-us = <338>;
 				exit-latency-us = <423>;
 				min-residency-us = <9987>;
@@ -282,7 +282,7 @@ pwr_cluster_sleep_1: cluster-sleep-0-1 {
 			pwr_cluster_sleep_2: cluster-sleep-0-2 {
 				compatible = "arm,idle-state";
 				idle-state-name = "pwr-cluster-retention";
-				arm,psci-suspend-param = <0x400000F4>;
+				arm,psci-suspend-param = <0x400000f4>;
 				entry-latency-us = <515>;
 				exit-latency-us = <1821>;
 				min-residency-us = <9987>;
@@ -292,7 +292,7 @@ pwr_cluster_sleep_2: cluster-sleep-0-2 {
 			perf_cluster_sleep_0: cluster-sleep-1-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "perf-cluster-dynamic-retention";
-				arm,psci-suspend-param = <0x400000F2>;
+				arm,psci-suspend-param = <0x400000f2>;
 				entry-latency-us = <272>;
 				exit-latency-us = <329>;
 				min-residency-us = <9987>;
@@ -302,7 +302,7 @@ perf_cluster_sleep_0: cluster-sleep-1-0 {
 			perf_cluster_sleep_1: cluster-sleep-1-1 {
 				compatible = "arm,idle-state";
 				idle-state-name = "perf-cluster-retention";
-				arm,psci-suspend-param = <0x400000F3>;
+				arm,psci-suspend-param = <0x400000f3>;
 				entry-latency-us = <332>;
 				exit-latency-us = <368>;
 				min-residency-us = <9987>;
@@ -312,7 +312,7 @@ perf_cluster_sleep_1: cluster-sleep-1-1 {
 			perf_cluster_sleep_2: cluster-sleep-1-2 {
 				compatible = "arm,idle-state";
 				idle-state-name = "perf-cluster-retention";
-				arm,psci-suspend-param = <0x400000F4>;
+				arm,psci-suspend-param = <0x400000f4>;
 				entry-latency-us = <545>;
 				exit-latency-us = <1609>;
 				min-residency-us = <9987>;
diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 5e2032c26ea3..88513b513871 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -870,7 +870,7 @@ cryptobam: dma-controller@1b04000 {
 				 <&apps_smmu 0x94 0x11>,
 				 <&apps_smmu 0x96 0x11>,
 				 <&apps_smmu 0x98 0x1>,
-				 <&apps_smmu 0x9F 0>;
+				 <&apps_smmu 0x9f 0>;
 		};
 
 		crypto: crypto@1b3a000 {
@@ -885,7 +885,7 @@ crypto: crypto@1b3a000 {
 				 <&apps_smmu 0x94 0x11>,
 				 <&apps_smmu 0x96 0x11>,
 				 <&apps_smmu 0x98 0x1>,
-				 <&apps_smmu 0x9F 0>;
+				 <&apps_smmu 0x9f 0>;
 		};
 
 		usb_qmpphy: phy@1615000 {
diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index 8848043f95f2..6e2bbf4f060a 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -14,7 +14,7 @@ / {
 	compatible = "sony,pdx213", "qcom,sm6350";
 	chassis-type = "handset";
 	qcom,msm-id = <434 0x10000>, <459 0x10000>;
-	qcom,board-id = <0x1000B 0>;
+	qcom,board-id = <0x1000b 0>;
 
 	chosen {
 		#address-cells = <2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index e3ec99972a28..d36a3d214db4 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2381,7 +2381,7 @@ tlmm: pinctrl@3100000 {
 			reg = <0x0 0x03100000 0x0 0x300000>,
 			      <0x0 0x03500000 0x0 0x300000>,
 			      <0x0 0x03900000 0x0 0x300000>,
-			      <0x0 0x03D00000 0x0 0x300000>;
+			      <0x0 0x03d00000 0x0 0x300000>;
 			reg-names = "west", "east", "north", "south";
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-ranges = <&tlmm 0 0 176>;
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 3f0b57f428bb..c0734f6185e1 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3471,7 +3471,7 @@ pcie0: pcie@1c00000 {
 			      <0x0 0x40000f20 0x0 0xa8>,
 			      <0x0 0x40001000 0x0 0x1000>,
 			      <0x0 0x40100000 0x0 0x100000>,
-			      <0x0 0x01C03000 0x0 0x1000>;
+			      <0x0 0x01c03000 0x0 0x1000>;
 			reg-names = "parf",
 				    "dbi",
 				    "elbi",
-- 
2.51.0


