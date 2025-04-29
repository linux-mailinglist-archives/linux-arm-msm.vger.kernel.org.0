Return-Path: <linux-arm-msm+bounces-56008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F88AA00F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 05:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9338A170C99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 03:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE88A26FDA2;
	Tue, 29 Apr 2025 03:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZvp3WpP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF0726B2C4
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 03:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745898797; cv=none; b=E3KQG7S9Qv7NJn45VZtue0f4Lod5LmyX1i0Yh7gzUcYJ/fmzTDAUCcA3ExnbPC7riIDlr6XUScG+gi/B+ynAzuCcfPB8WMBpLr/PPDoE7/mZOGXIRAqW4ROOsIsvcJoywhX/9jnKNMr72HNAc6iRRd7igo5Ylo3budTR4Uvnc9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745898797; c=relaxed/simple;
	bh=vNy7Hg/TiGtEZictJW89jX/dHyDjn42M2TrCGJb8CAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pOVM+4bmZUjucG9jXuCC0XfgaOehW09ivmZyC+lPUg0ScSksJIpaV77LTseog+N8axCKQCJQS/QKszqZNNv+MvjSQ3FkpERecTEdelX0vsZ2ZA/bBxe4JjoLh7su30c0HBlOfSZvR2MRNDBv0gtTUiRMF5AVGgnlR612oEiMaYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZvp3WpP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq5Vh030434
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 03:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5YbBsH4zeCrmK/Ek4rH6YPASrY2/sAhfKu9QU9dC1zs=; b=MZvp3WpPHdeZJzCf
	gCG0i4xY2pvHYfsv2cGDPKeriUzsGnNpN1YWrSxHSHNM0ExM2BZ0ZUYiEnjjZ6Q1
	IEK2ZBe+SZZ/tTyssqF7xjrOFX5pH6fjGPCrEa6MXRYDsDBKPffmZgv+6HEVClVE
	M/aWkOJcPKrg/7udwQWOStH9unnktuS3YBpLlb6NTAM9CB934/KocwwABri2MsV6
	V5hbzXjRabvpt9/rJzOIQWP+F8HT44YqLQJciWMPcFkz1TYwimW15gECVFz5762P
	ijdDc6wjoMUNauNbF+8aGZ0A4pV/TbWFWJDlWxNLq/lCgQihEBZ2uLHwnCWylFKe
	7hZgYw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pevj8rv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 03:53:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3087a703066so5312895a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 20:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898794; x=1746503594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YbBsH4zeCrmK/Ek4rH6YPASrY2/sAhfKu9QU9dC1zs=;
        b=CFE033wVVT2QneSOCwOm5qUoE96J/beTk3+Kz16wpGNa/W0rK9JQvshUXrdQNh9GAG
         R5lBUcVHw0TKflzMuWLU8BMvL9jslWwvEMq/XKpsl6G5C+hvJLAW9x2gP2G/NYzG06i6
         8iGxtzFxrjNHCETdh/EwZM1Tfj9Vc1r/JSKww9O/Q1qyvHK37S8T9XHJVzqzRKx7sYAo
         PFipdijrxlY0AzTwCfCChHfhGsxHka+H+3gBYxbmGYYq9vnTITWn6vaNkNvnX42jsQ6h
         NSdqy4K1RReXwA3z1YIw3gfz1Doj+NWYgrLQhzR8nXIi4RS/cL7P8Gy59z6NE52EXDJW
         ZiFQ==
X-Gm-Message-State: AOJu0YxHtBuqDVKosrcNVsCHCC6OLLH299SkCnah4K7qnxfVt8LsFp0s
	3e8O/PWSoeed/U7a6jQrlhOm4LDBrtj6Mwx8Q54H7MaBOXUy8xnQ3uYoHhzuRbvYaqqvy+BbNWN
	XJH7RMVS9pB274ngau2pRtph1K058InNtSng/2WhhvkopytJqNhUqdxBTnlB01XIE
X-Gm-Gg: ASbGncssW4+V4pge5Dr2ntnWIo4c0HCFRYmJVSrQV8bLtLs2+T+UjTDGocNrmLTUrhW
	RCGnXLc6ugEfn6vSmpgdjevrWghRqh4xxuLQ4ycc6N+b1/3hzHZOhZJpoEVdIeun8ZdUlGTO4+8
	U9nuJgXbonZJ3YA7NqjS/K+gZ1t++pj8QeDV7JED4ePgmM6IRetsAB96UYHVueb/RwGwcfTGo+M
	FsJVLJdD/1jSkcV2BzGAWg1ktkrt4Belj/0CQZVYrpAZgWy3onfVsIjJclFrhDSVfS4seH7L9KH
	wsdF8+Hc2ByxaESlRMU4ikaPRA==
X-Received: by 2002:a17:90b:1d51:b0:308:539d:7577 with SMTP id 98e67ed59e1d1-30a01033a09mr19761872a91.0.1745898794127;
        Mon, 28 Apr 2025 20:53:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHz/yoGOCtkxG61Y388At57vkidFm4d9jlbyUVuP2IvXjqVOZVOballcMOOvtXcLz9jntlNHA==
X-Received: by 2002:a17:90b:1d51:b0:308:539d:7577 with SMTP id 98e67ed59e1d1-30a01033a09mr19761844a91.0.1745898793767;
        Mon, 28 Apr 2025 20:53:13 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef1246d2sm9960522a91.36.2025.04.28.20.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:53:13 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 09:22:35 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: Add QMP handle for qcom_stats
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-ddr_stats_-v1-3-4fc818aab7bb@oss.qualcomm.com>
References: <20250429-ddr_stats_-v1-0-4fc818aab7bb@oss.qualcomm.com>
In-Reply-To: <20250429-ddr_stats_-v1-0-4fc818aab7bb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745898780; l=2423;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=vNy7Hg/TiGtEZictJW89jX/dHyDjn42M2TrCGJb8CAM=;
 b=m8vzzDztRzCVdUvyFvXn4roSIywRLgmQCPiNd+b9l29u4EfXBExYqBT0NFPXUd/tYfhPwRwRH
 qSMweHgCM7+BHqNJRzp/0oJgzFTDpF9Q1t38BG7/3isJ2Dm2Vt9dk/m
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: MjWnO8fWHmKWgi7S8obk4uXPjL26yhwa
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=68104d2b cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=GL-xn7CBy2CN3rfaf34A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: MjWnO8fWHmKWgi7S8obk4uXPjL26yhwa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAyNyBTYWx0ZWRfX0vGWst+lj3YA XFf+rSoQoGsTmN+LPJiVBoeyL2sN/A34YihKAwXr6g2QGDb/0Fxu7t18apyVVKExblDQCiAPGSV d1+oglqjWVGG0L+hHrajLfa2TQOZQAS5+sSPwEz6j8AsWcDT9PrgtBpHKWx3xTXG9552Ec/ThOr
 wDJhc6GkFzICM+WW4Ah88HsogioG5xFL+9MPTZtAcBTaIHcr8Gc6IR81YOsg4svitFKrO8ySqsn cciWypuzSq6anKGa+NMpzufSbO+NHu3V84+Bjay5Oj1CCB5afQwofqksyvgO9Yf91NmJldm5NsT /IJVdGQlTpvfxR26hAERSff3QGvIeB6b0fM5oTHGBxV95mTbM5JNgb8wBr78wk1Q0oW0E2Zr5tf
 /BqV6XU/WcPRzWScHcZG4tE2dv+th/4ricIhqszDHJufsm2DO1xqezaKrSYq4KUzksd2IZfM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=660 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290027

Add QMP handle which is used to send QMP command to always on processor
to populate DDR stats. Add QMP handle for SM8450/SM8550/SM8650/SM8750.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 54c6d0fdb2afa51084c510eddc341d6087189611..33574ad706b915136546c7f92c7cd0b8a0d62b7e 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3739,6 +3739,7 @@ aoss_qmp: power-management@c300000 {
 		sram@c3f0000 {
 			compatible = "qcom,rpmh-stats";
 			reg = <0 0x0c3f0000 0 0x400>;
+			qcom,qmp = <&aoss_qmp>;
 		};
 
 		spmi_bus: spmi@c400000 {
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 82cabf777cd2c1dc87457aeede913873e7322ec2..e8371a90b9b98fbc12a429def8f6246c6418540a 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3943,6 +3943,7 @@ aoss_qmp: power-management@c300000 {
 		sram@c3f0000 {
 			compatible = "qcom,rpmh-stats";
 			reg = <0 0x0c3f0000 0 0x400>;
+			qcom,qmp = <&aoss_qmp>;
 		};
 
 		spmi_bus: spmi@c400000 {
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index c2937f7217943c4ca91a91eadc8259b2d6a01372..875b5a89d2555f258665c881ee3d96965b6d7a6a 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5725,6 +5725,7 @@ aoss_qmp: power-management@c300000 {
 		sram@c3f0000 {
 			compatible = "qcom,rpmh-stats";
 			reg = <0 0x0c3f0000 0 0x400>;
+			qcom,qmp = <&aoss_qmp>;
 		};
 
 		spmi_bus: spmi@c400000 {
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 149d2ed17641a085d510f3a8eab5a96304787f0c..4c54ed84e2d1ec836438448e2a02b6fe028f4c24 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2490,6 +2490,7 @@ aoss_qmp: power-management@c300000 {
 		sram@c3f0000 {
 			compatible = "qcom,rpmh-stats";
 			reg = <0x0 0x0c3f0000 0x0 0x400>;
+			qcom,qmp = <&aoss_qmp>;
 		};
 
 		spmi_bus: spmi@c400000 {

-- 
2.34.1


