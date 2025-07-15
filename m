Return-Path: <linux-arm-msm+bounces-65100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6286FB06806
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 22:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E009B1897529
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 20:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282752D5439;
	Tue, 15 Jul 2025 20:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCrVWsn7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0692BE7B5
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 20:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752612492; cv=none; b=YLYPDbyLHvSonD9Sftg5n9k+GzU3zlRtOdZSLG9eSHS/F/l+QeJ9/O49UnTxBEQVbiM5UvoIyvLrhGaF7v6meTl4x02jWFixP8YT8y7MgaRCmxyUUh9P0mXTQ+ibikixkMJaiRES3k8lcB71PAohTrBRwaRLL+EqkDxvWbQtuOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752612492; c=relaxed/simple;
	bh=BnlN8BH0y5miKc7waS4rKUqhxFa14KCTqJylMT6SIe4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ju2dRzWXh+CnGuqgEFpJGRuGQqbgxpFC4ax8+rAe1pqdp6H3zarETy9mJlRN95aaMkgR6+qSo3xH6Pz2mbyXnLeVe4wVwhbM23ud4eQmqZabj3om7ZZjzhcduwAaQNmlJzlL5vQ2PPN0WP/822Nv42Q+UgLm1vEECqimnJ3bOM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FCrVWsn7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDPGY029618
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 20:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ulnnyakmdjr
	TKRRwRremdAmueSN3wLLHqGlctDxytVc=; b=FCrVWsn7DwpAiRU03Bf7J3G10cA
	8p25K05EY7CBZRIGQM6AyjVxlOR2oIwb+DQI997+Iu4vcB6XSrTzDCFrC0dQb/xI
	Lxt8a+/oP4Seb8DmW8DUObqPyyACQYchIeaNbicANBF/pIQLlHKDz7giOsKzw3FA
	dHayKBpV9m8wbC0seZUTD1UHxcVO3dntGfzcPnBx8ve0fKr3K4VThehhsntDZPWW
	YNqnT0TTq5IMisspE5kfQ1GDHWA8D5KAOCPAG/IEZ/tF8TdgA1TLP3bXMPtgyYMA
	hdbTLK4pV73iw8411U5bEvioVR/tSq3CapeCa0KH8HWC+tbV4ZmXkk0HjcQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb1mmc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 20:48:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e1b84c9a3dso435116985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 13:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752612488; x=1753217288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UlnnyakmdjrTKRRwRremdAmueSN3wLLHqGlctDxytVc=;
        b=hEGHE3WjP3kI1IvaPcH/+WUmSbcIiHhL0tTFFqxTZItHOUROZcvIy4l8rsqE0cpJ0W
         k1mfiojiXcura+aRw/8wjHba2W/M5JAoA+fnBjmi6Bodb9P2FOOOUkGMNt/BUf8u/Tt4
         B9/zRui/iO89CCXPeDXiP594gnrae7cFnjAQVzVES8gXS6OyTXFrZyU3P/9U0mI8v8rF
         QHTSx6pG0KFxEBVxyt7w77iURC6GuXp06hXKElndq4OJOWzW0g8JaDbGJnWNOwejnNlY
         XsaqCl8FMstn9okmmekAH9zenRKeTlUkoI+IrKt64j0cezUsKX/qEAi9ktZdAJYQL8Am
         ANJA==
X-Forwarded-Encrypted: i=1; AJvYcCWoY+BZ54lfWZzpo46T+8uBCpbhgrOL8KVMMwneILuE3CPVqBP0AGDBPdEp6xBYdLiYZTqvyU11n2Ioy8Ts@vger.kernel.org
X-Gm-Message-State: AOJu0YxST4ZYYXJSiYYjddmS8L4roAtbirK4iPa9ey6amH0YCYdvLtaV
	OH4K3Es6EGdwuWcml9oXWuyqyJSDTDUAdT1H3KrbkWA/JhsbagKEljzmwMfCUl58+vOk2dYTGfo
	CHxDp9rrJd6R7XqDcje0SO0Ux9MHuu5mJUTftj2fvjGZPHtbG9UI25goBgJ3OUKtVsk6F
X-Gm-Gg: ASbGncvDL2Zq+71+k9LgDi5675PNz/SJT7Pg9HqPwDQk9i1nECj2zrVLwoVpykDIwHl
	y1qCkxfFxLrA/vPMAYnaYpIZJPI8cffkneakiawSFkUH5pNrnofEariA8VM8M41GMlmTX+JXx9v
	HIY/qBRiIC5vPAs72S44KjIEQ5viFztRiZkbO8ZBehVxK0wekGv2d2S9WxdysVDfvPYzKBsKotc
	87cnoV3OvNBwaCWPDWIXP8pz/Y7CB2qDa9ylgadbgMChljmOGycsLXhxOHB/IvmqWX0haXf3AxF
	aDjHo1So5LUegH0WCbAID1FuCEgPZ1mbEe5mFD97A5GwxbbNVMBGklrFm81UZg8HQtZsOFIpubw
	w7iYsVmeRoNhgPX3O+w==
X-Received: by 2002:a05:620a:468e:b0:7e3:3065:a6b9 with SMTP id af79cd13be357-7e3433486d1mr52337285a.7.1752612488356;
        Tue, 15 Jul 2025 13:48:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlw27oAr+iNWanGODjwWubXZcxp8SV4xbSVfakE6bozSVtRFetzaqd9UG4J7kX9ItIp+YXDQ==
X-Received: by 2002:a05:620a:468e:b0:7e3:3065:a6b9 with SMTP id af79cd13be357-7e3433486d1mr52333885a.7.1752612487970;
        Tue, 15 Jul 2025 13:48:07 -0700 (PDT)
Received: from trex.. (153.red-79-144-197.dynamicip.rima-tde.net. [79.144.197.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc2464sm16331877f8f.38.2025.07.15.13.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:48:07 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, konradybcio@kernel.org, mchehab@kernel.org,
        andersson@kernel.org, conor+dt@kernel.org,
        amit.kucheria@oss.qualcomm.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 7/7] arm64: dts: qcom: qrb2210-rb1: Enable Venus
Date: Tue, 15 Jul 2025 22:47:49 +0200
Message-Id: <20250715204749.2189875-8-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: R-rc0GAPcgGagdRxn7DCIXm3dvS5bvsW
X-Proofpoint-ORIG-GUID: R-rc0GAPcgGagdRxn7DCIXm3dvS5bvsW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE5MSBTYWx0ZWRfX2YhazR9W5pet
 5aTmS32FLOCNw5NkkBQdfP5RixO6m4tVm+CVF3wLMwKhRLMl3Kw/5LT49E0Ldd4yIckF/4VD4+T
 FqyLVOUeIZG0ezK7twjoBQCpvehFzUiJwFtRoBPlT85fXGuzercs79+HniY9X617HDJatNqVqKe
 Isn9Cx7LgLsMR8VKF0TGEyx36fsgfDSGVQ5r9kbhNLAYkDClr8+7zw48H7gvIy7WlR3yL+72uer
 VLaakZ0iY3hnqmbyrfYrc+MQRnYmlmOQEMgxTc80T63utxTAzXfgiWdt2yk10HzZ9/bsRsvZ7dt
 WwlaBnbHStV+95PFMcg1f42KzBh1xcesdE+qBOxXprOuQ5z7eVrvbIT6HCL02+IHSOJrCEbp2Gj
 IwqsZyZWN/ECQt/j3ijbUryVXZ3xe4KB87XgK39c4CLQqmXSNat2Ho+6R6eqyhsBhwWXzuyX
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=6876be89 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Ki5fnJvzvo7yLsyA0quaxQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Qms5JgQ9tnEuTiNUcoUA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_05,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=730
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150191

Enable Venus on the QRB2210 RB1 development board.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index b2e0fc5501c1..8ccc217d2a80 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -711,3 +711,7 @@ &wifi {
 &xo_board {
 	clock-frequency = <38400000>;
 };
+
+&venus {
+	status = "okay";
+};
-- 
2.34.1


