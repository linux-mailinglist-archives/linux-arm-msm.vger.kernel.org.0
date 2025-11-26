Return-Path: <linux-arm-msm+bounces-83457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2222BC89F17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 14:12:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4E65834100D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 13:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC6062690C0;
	Wed, 26 Nov 2025 13:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mljQ7ex1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Thuy54kb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374E3236435
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 13:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764162721; cv=none; b=a+K9HACZFxEtkO50yrbCV5s0w4tB9ttNxwHyUKLcOaNGAIuQdUg9NhXsq5xDspQCuIBMwdadI5lO5Uq9p/WRJ2rhbXiadbvWqShWbhx5gzVHOpjBUVHPxg6JyMwjHjGEIp+biXgW3D01tMXyKV3fFHT7PPLsxxDJjQtkqaI0vWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764162721; c=relaxed/simple;
	bh=Kx6SDNGGmtR+vCY7Fvwx0dLzXDrGEhUQ+uAXXXTIdVY=;
	h=From:To:Cc:Subject:Date:Message-Id; b=S+oLGDFAZbSDsIKuaUZfOqkzitZqTpdWqJRn6tRktBaKrzBAHfZSvVdZ+rsCY6nZgjb1/G0uVc5dnK6NzRVGzvYB1ehKXfRKHbXWNSR/W3Y+3QZ0gTb38jNdmNkCRJXy3xZt7jdi0mkvlY/b4D0w5DmJ1WCJN9JEel0iOVt4tlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mljQ7ex1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Thuy54kb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQAsjaq1700273
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 13:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=atO2d0oj7Xnc
	utkIW7ClolzNmLa6YnG+2BwUOup5uEY=; b=mljQ7ex15eGMm5My1ngSgROk4Aic
	pc7M4q/4tEvIB8FtFsn3n5Pi5CJGMxHwd0vDI2UEc0mVvki1OmH1G3UqPyKyt/ec
	cIbHnR5mNpIw5JcMK6OgMEHHCuSHr/qNZ5Uq4jZ5wve8ssjnkYRCFHCnEZbU1S/N
	RXTJHxmBLv0sJiNhQM0U86cFRaWvkWAwCHJIcdkVNAgJqHiq2QL1z5FJ1aZpguUR
	+3RjVemxemxOfFdawEIIbjFo+KOoRzO3cdun9mPkBWiCIwil/03lkF+4y5GHTUij
	7cx4d0qly9tAOgn0Bn6KblE6c/Nury+oG9GFwlRlZEzyR+EVMPRfph7aRQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap07a0a5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 13:11:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-299ddb0269eso83594375ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 05:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764162719; x=1764767519; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atO2d0oj7XncutkIW7ClolzNmLa6YnG+2BwUOup5uEY=;
        b=Thuy54kbIyJMyUN5Ye57EvF0dCasKPBcXiYFUZNUSPyrXLGeRFTe+NjtmNX1/KmZDA
         gA7yROj0VnUq7JiH+GFWtpUnkrcCH06vU3dubi9lnXN6TvGYkethPWCg5z0IvHxIKLYO
         skD9XiK4A+HA7PTG6Ecv5O1Qwy2cDnK8wLT+jSIRVilBEPEgAXNvEm36Mbqgf0I5Ntzh
         imdpTivl7mU2BW2s69U7vYK820wn2rRGd9O4JWTQdBB4uxTXQUnqLXkFGMcnlxeNUa4d
         4KWTWgNRLD+RPGqCuanbpjQAw/UOEwvDcED03GOi1mQci8Gr1vd/bpdeWNTvzklfQD1l
         s1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764162719; x=1764767519;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=atO2d0oj7XncutkIW7ClolzNmLa6YnG+2BwUOup5uEY=;
        b=ZiL/tVJp7CtuisPbWYNINJ1PBTKFaizgb7X7qNrL48ToVHJj7uqFoP34XAf4GIWSkH
         5Pq3sUdFyDvsBkF2dlVY8XN760M2B2L8S6chtA3mdEv/40QyFmJiXw6BUZ5YQPkspo9G
         CmEsdjdR/0RRbJ5nDA8lbGSkwYNCvNrJsSTHMcwxdVUNECt/UzyXIfkD4qYLS2QLKr8d
         Sny7I6+VDjmKm8J0WyuBgocVAgk3ppMuM4EqF/7ttHcuK3e0gX3SUDLS9LGw6M3UC/eG
         47Ve/Ox6XVGJelTSg1YRIQnI+F7bARVI5FaVwDni1ZX0U5FfuM3Wn9rcFpaVJZlq6hVb
         oa3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVzsGO0WzzpHYypiudhuobw8kgMnpVS1FyHy52gEckEfNtfuSMh6pgsn96MeAWSBfekiVU4JtfcgzBqwcZr@vger.kernel.org
X-Gm-Message-State: AOJu0YxvyVvpMRg/WAz4Plip4TIZ5czbWRypsONARnv6/nk7Hkh99aUz
	4Erh5U3WdHCh82Ks0+kp3z+qCUmd/8Es6R6GJx9R/WOX2DG3IcsWT/mJCLb8ghG+jWTI1y8uSrs
	Or1QrIzNg4v1LrnZ1Mt4W/z1hn/W4srfg90IHGaJiIoyTYjWAs2BeM6nYPMpoIx7fphXy
X-Gm-Gg: ASbGnctnEQQ04csL0P6Kd+7TPr1AJbV6edZ4p1tVPVK/9vHXCUwINGjmhnOA+icFGcn
	iDWfU04wvIVBQzbCpFNvkjfcAuh0yQb1nAzBcCi6+JI+f0zTj+sgVuVWEEe9xd/E1ZjYRBLgT30
	jp1Z54Y3uzzC1xoTWELR2/IIJRhLXfg5gz/H6JpTqw+CSqCjjjnKjjo1ddlxbwoGe0SEm4vemfK
	8O4SsAUakZwJWZymXtudlrd43REDs3fUtXlzk+0HYjOM88ZtIsyhnOZiFOBGVayI0GJkMf2BEbU
	CzkJKWjnGf/llZ6BIlzAQ4zFSnK9Iy4muwOcS9+iqlY+x6FHqEa5tCIiVc36gmjQhmRx5P6SAgK
	ltsFJJpPrf7JjNrlELT6iiFiuq+ZB/UfiFcrs29SES9zt+4D2guEU
X-Received: by 2002:a17:903:4b4b:b0:298:35c:c313 with SMTP id d9443c01a7336-29bab30b2c3mr77442535ad.61.1764162718669;
        Wed, 26 Nov 2025 05:11:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGw2Uz2j8uYz6Je8kTb/xoW8pe2wn0hP1weQH0XaAMrTvugT5iKNhZx9dgT0F487YDp+nrf+A==
X-Received: by 2002:a17:903:4b4b:b0:298:35c:c313 with SMTP id d9443c01a7336-29bab30b2c3mr77442055ad.61.1764162718180;
        Wed, 26 Nov 2025 05:11:58 -0800 (PST)
Received: from hu-pragalla-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b2ac81bsm200049395ad.93.2025.11.26.05.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 05:11:57 -0800 (PST)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        manivannan.sadhasivam@oss.qualcomm.com
Cc: quic_sayalil@quicinc.com, nitin.rawat@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH V1] arm64: dts: qcom: talos: Correct UFS clocks ordering
Date: Wed, 26 Nov 2025 18:41:46 +0530
Message-Id: <20251126131146.16146-1-pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
X-Authority-Analysis: v=2.4 cv=ZZEQ98VA c=1 sm=1 tr=0 ts=6926fc9f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LC8b3lGDU_EJS_S-YZAA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: JCp-ggEOsPmQx8L6fw60VmordCQlJwV-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEwOCBTYWx0ZWRfX02KsQnJL8HB/
 gAldUmhNpFIiRAgvIjlzTGaCHkOkV5NU5zcoURk3I78siUdeKLK6BQ9k4swfaLJSZ8dAIJ38m//
 nH7slyxx2shJSde4MXjiBizJTEIXkyRbF9scfCtJR9st8Qz97pnQCPn0ouBg+XPEvo467TifRXH
 R4K1qDL5dLfo+PYNsyi15o9fTYKdHx+nLMa0HmfvgasNQFJiJyNv9p2Gi2ZdBU2Y3khcDrOIWdJ
 YLXv/2SWi/Xp7rHDU7X/ISgIQiOhJXRhbnE5JsxMapf2N8fuF2zOjgN77oxH2ybIasPll0eLTz3
 h9aX79tE7xjrnbI/G9gtM9ZdOfMb5NwRiYhX16YKS2oqvc8C9PloKjUvYdVn+DeDW792BUgx/bl
 O28tXg0Ox4oJ7flt3A2AOs87pV1Fag==
X-Proofpoint-GUID: JCp-ggEOsPmQx8L6fw60VmordCQlJwV-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 adultscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260108
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

The current UFS clocks does not align with their respective names,
causing the ref_clk to be set to an incorrect frequency as below,
which results in command timeouts.

ufshcd-qcom 1d84000.ufshc: invalid ref_clk setting = 300000000

This commit fixes the issue by properly reordering the UFS clocks to
match their names.

Fixes: ea172f61f4fd ("arm64: dts: qcom: qcs615: Fix up UFS clocks")
Cc: stable@vger.kernel.org
Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index d1dbfa3bd81c..95d26e313622 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1399,10 +1399,10 @@
 				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
 				 <&gcc GCC_UFS_PHY_AHB_CLK>,
 				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
-				 <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
-				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>;
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
 			clock-names = "core_clk",
 				      "bus_aggr_clk",
 				      "iface_clk",
-- 
2.17.1


