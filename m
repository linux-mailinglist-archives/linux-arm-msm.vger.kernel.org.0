Return-Path: <linux-arm-msm+bounces-84241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21863C9F59F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 15:50:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id EFAED3000975
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 14:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4B7303CB0;
	Wed,  3 Dec 2025 14:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MxM2cbnl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qu/pAkPh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA419302CA3
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 14:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764773359; cv=none; b=GOm6jfZqtGUIQrzd8vFHmGY8ZxRTioXoUuJpZyb7bK8x4p4/TbVg632r/EO47O8g+FitL4WK6CDdIaipD/PvnHPbFVoxSb9rQjGzSgK+bWO+3y6XN3LLOcywh5QCjRj8aHFbg98U502lyKKlgaOHbW5tAUYSEDojkQiXuqNtbTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764773359; c=relaxed/simple;
	bh=TK4C26YG6YS1qqZbYDcKOj9J27rTVcU21dr5ItejpdM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C3Lz9apBAybOio7BDRXYFtTBfV4nnNL79EIdBQ5/C2WrAsSwI6q8d9J88ukDxeUBT4eU4TzU2y5VM+7Ify27A8Yj0JDaSh/FXTSTcy2DXRX2zyehqvJm9RqfS4MOIgNsyV0FHNyl6UpeHpI8Hfgb92MU5Tgk6SQO/3pZy6aRVUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MxM2cbnl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qu/pAkPh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3B3aL61375420
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 14:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Atr3pJe2kw6
	wZLpBUgQpWYOFtrNlIEChbDtnB98xDaQ=; b=MxM2cbnlfkRJ9YxYyxAzuvtzR3x
	qzm7hEgt5FDs9WCMw0RjCqgixRa0gyXhk7UyglfYHH1RdNrWLNiYrkn6b6KUpAVx
	L2KHUVgSpdAXJMQ2Nt0wDr/JRbG3H7r7iAMgPbiJT23MD3wjD40/Rj7+3ZPy+kaO
	lgK7xCRBb5A+OrrbWH6FUvcEUXlxW0JQZlWtpYL19e1cCszDmR5pcXEDPCTCox2m
	jkvlFWfbzu0qyYFGgRpkR7qi95llsNTjHO4ObHUpm89u42I9LaVS2Yca9bPiqt+U
	hLck2nklU+9ycxkQqptg/7K4/mXjUvRJNdAkO8Mn2DPkFVzg0i71FIJBK9Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm0b8jk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 14:49:10 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b8ed43cd00so6915271b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 06:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764773350; x=1765378150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Atr3pJe2kw6wZLpBUgQpWYOFtrNlIEChbDtnB98xDaQ=;
        b=Qu/pAkPhEdi0qhR4RakJFIau4wXqzhlFbFGpzcPEcoaRUEqcXCTfYzTQF9ynYruSG2
         r99aKmoboXT0LUBnr44iVcMtHcY4DKudvKQn3vZ4lXFNPaY0Ps9WMlUulE1ia78t3KOo
         ox2IhtSH1x12FgEMdPenVgObMCV1N7k2AdH2rm1ntr0EIhNsKJKqkqgRCzkawgcoSLCR
         wsJLnSlhT/iBKKcInqdNev1Yzn3zhg65l60aKQA48nUDJ7mIuPv9Hku8i/4978N0osns
         bBSytl7bN13/QQbm90w3TE3xGm2LqMTAkQbXQxsRxHuoqzfRiiAS1Qg3GaJmVe4vnE+f
         QBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764773350; x=1765378150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Atr3pJe2kw6wZLpBUgQpWYOFtrNlIEChbDtnB98xDaQ=;
        b=EiBsr85Im3ef9u0ZT76DPqTJhv4Bc8KkAoJdaVC0r7mckbjaiGCw0lPB5XOHw7BafH
         6QWfwLwm6VHjX87oh4bFeQ44+Rm+ehVm5FXi8lZqg/W2cSfY5zRc7Bu25BLQEUwpBy5+
         4mPgozjx/uE3oI2iqMwi/Cf84wDc1E6w9rcDMiqT4j4Pzi51e8TTthJfIDwEq+waqR5r
         ZFvNe90Es1+BjExeb/X3QGUwhML2MtbMv41gxTTyVra1fxXiHhXEXyrDIg/U34Vx2jpH
         JbHu9iIZSRGJ4lo5QLSieUNcSHXEAKkgj+3N3Aos7FZRyjsqc0DxGqnd5aCQeRumJKT5
         9MSg==
X-Gm-Message-State: AOJu0YziwZUSU8wVeex+XnWXyaYOQH5pLQ6R2L4aDnRYO5sadahCBN2w
	rtvJXVGzy0KARx+CErn6p6PDPxW8nvZkfDBaw2PGcBGcNnXkD948TIcbQHh7E+Fm7Joh0OtVrtC
	zm+p62UFrVe3UIqnEWxpJ+kMnRj6bXOvSgd7/ogilvBDokfPFs/tLxR7az5AbuVn4Axo8
X-Gm-Gg: ASbGnct9pTsD6dmYS05ivBwIRfr+hTIzRjPih6n6NGIAuLyNQkdi1ijc1SV2OyPQE5z
	Rkas11W/MSet+bUU/OWjRLmUkbmVfmZqnOrWnlXeZbrAhkpm4qXC481ZrvmR/HU2WDmwdLuiP+W
	TQTpBrrjXonRB+0CNGUlfhtNr7wIZK3MQdUGv6TpodZKf/AaTZRbeC/dfUM1FqDFFocvZASgLlM
	IDsM6g651tgmVd5FtcDrMtO4feQFBOCjh8h8DB5RxB8Wzux7C1OndfHHB0zWcsl4dlZbgK3sFD2
	0ah61VmnqZ5RZYJEJHCqKEeN5Zs3vzJrj1isJIhjcg1w+dx+FToBEIgoV+vYB63bT2prQeOmQyt
	vlpYttnNCCrSt54ch/pz8YI2qD1effK+Y5P5+7pBH3lk3m9Y=
X-Received: by 2002:a05:6a00:4f91:b0:7ac:69cd:ea0d with SMTP id d2e1a72fcca58-7e00dbe9ecamr3038604b3a.19.1764773349660;
        Wed, 03 Dec 2025 06:49:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHACWcicajFdpjYcyq79tcM5wcHdJLLDaB2okj0GdKNWcWKbqKQBmooZHpYlAjtIZCZ/1nTMg==
X-Received: by 2002:a05:6a00:4f91:b0:7ac:69cd:ea0d with SMTP id d2e1a72fcca58-7e00dbe9ecamr3038570b3a.19.1764773349150;
        Wed, 03 Dec 2025 06:49:09 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d151eb5bd9sm20719683b3a.27.2025.12.03.06.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 06:49:08 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: qcom: sm8550: Fix compile warnings in USB controller node
Date: Wed,  3 Dec 2025 20:18:55 +0530
Message-Id: <20251203144856.2711440-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251203144856.2711440-1-krishna.kurapati@oss.qualcomm.com>
References: <20251203144856.2711440-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=69304de6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=m6TBH6dnwUdo25Hfm4MA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: qEMknufiqFOLHxXEFQExSL8idnuthuAv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDExNyBTYWx0ZWRfX6N6OPNv84DRY
 dgp9w+OunPOCeDoY22xT4FQrh2caCwxxUoHWT/CsIqelW98lrp1UFBu11ePma97Nxx8ASMiQju5
 RHdEx6KaYrjlos8tyDKN/Y194zWTlZ5gPdGy1lyvwYFnb6tnqmziVyR9k6ce+DWc+SBGj4P87fs
 6jyQTocJVaLQ4AR0Gh5rVI/UA585v5QeI1IrZPrA6DYRfeinDKr0FWMlAH5VDqb9IdYUE+xsoe2
 afH71475m+d4Bxv0ZCTkMAHxG2qI1+ro9cubAgoKf94b6jHdX9b4mksJGs9M6LkA4iS9vU/xdwd
 DGN7ksM5qcGf32Ubq/jb3oPSm8rAyT9ZtXsw/0Y13AF9h+Vt/5K1te0o0Dc2cPPsq0MnkRpgH0i
 j8DWeXkm6cLFrFrTFNvZuZYQ0wWMbw==
X-Proofpoint-GUID: qEMknufiqFOLHxXEFQExSL8idnuthuAv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030117

With W=1, the following error comes up:

Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property

This is because the child node being removed during flattening and moving
to latest bindings.

Fixes: 33450878adfc ("arm64: dts: qcom: sm8550: Flatten the USB nodes")
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 2ca9e50ef599..e3f93f4f412d 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -4133,8 +4133,6 @@ usb_dp_qmpphy_dp_in: endpoint {
 		usb_1: usb@a600000 {
 			compatible = "qcom,sm8550-dwc3", "qcom,snps-dwc3";
 			reg = <0x0 0x0a600000 0x0 0xfc100>;
-			#address-cells = <1>;
-			#size-cells = <0>;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
 				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
-- 
2.34.1


