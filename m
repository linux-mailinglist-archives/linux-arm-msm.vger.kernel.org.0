Return-Path: <linux-arm-msm+bounces-84282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBACCA23B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 04:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D9B63032646
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 03:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7E9315D50;
	Thu,  4 Dec 2025 02:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k52ZvTRx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9Clxf8G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B867314D10
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 02:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764817173; cv=none; b=LKpedw2ssfPIW2EhSwa/wBAizVZ/JeSXfrirUspZ3mKA8j0PcBIcBPXyrhqiPJ4tALxLzLPdyGkuhyLilW82IFxGn2IiifWVfCIhgSbLZ1E3tTxhVdLf6D1OPbMmhocYix00jH6TYm1LpquytsLTSMNZzXuG4+jJOjJKNgwY8Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764817173; c=relaxed/simple;
	bh=gz2HUWqRoSN4qTPV6zJbD2MZ1MnEwcA3pdB5ci8CmDo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e9+ffBhnNc/ngO7r0vRzaVCg8GD2KDppAzvAz4mn/NnPTBcieBr2N3xM6He6Gdn/pU+aYeo+gEIRDsKf+SfFqVADj2DbI7oD/jUixJ3vOmz7MExlv8Lrirqlrn6g3dlV05ruPat9hteXgMBlMAmzr9CZ6fYOUmtswwjSuxL1h5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k52ZvTRx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9Clxf8G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3H74Fb2844562
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 02:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YwRIuXom7r1n0md33heG9AVii9+zp0jquzu
	h902tAyE=; b=k52ZvTRx/AUv6XLl4Np8pf9E2amb8WFHgnJxLcxJuFmbcD/ARTu
	88boL9hpkf+X7e/A+JjBpgUKFIgxWCOeoAkEYNrPzi9r/OYusoYv1b19VGw6Vyb6
	3cncMm6MTfIrugsd2SUI8IRSCwh0rX3IaHv3Yg1kz6OFEfHWyE55kWknU3dD+EsE
	Wq+u0Brt0FggOB6FI0Cstc0GvTHnSiDKXvLNyVRyPUNH6Kad1Wdvgy5+OpEgL3Ep
	NiB0+cLI4tNtjE/ZoWhnTFM3Ra219l+9UWS0WkOQGUT7r8QNFvfPVXUoAsto2cJI
	sQ4GcYzxNZYuVMbiuPsN6Ac+Uj/cCP4xHeg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atsar1k5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 02:59:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2956a694b47so6602845ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 18:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764817169; x=1765421969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YwRIuXom7r1n0md33heG9AVii9+zp0jquzuh902tAyE=;
        b=B9Clxf8GPQCaBfjZ7m5LgO1Izegi0djd6Axp1JQZUlVWPdYh4OGdS6LZVRjFT78zBX
         Ic173L8JWNUdsDT8qXGts5W6imgGHAA64gJT6ka6be3By9EjDJBQb2Qohwd1/AiLjqJa
         slphyqhsIGrT3ahk0TvDpzpI6SIn9E4R6pWAKy5l+HXJgE5mYm8P58zs55oDOGA43R9S
         kDtYZ86vZXIgcxqXa8dx5frDeJtyDCriZaTR7wNqeOHjNuqv2jLhKIsFXGgh1M5G2JMs
         kHZSE8tBw+CmAXf75hFZmm/X6PpXIIeRQyjfn8j05K1PS7sgjKf4dri/1azWLsENQCpz
         n2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764817169; x=1765421969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YwRIuXom7r1n0md33heG9AVii9+zp0jquzuh902tAyE=;
        b=izACEr/Fx43weEU9Dgy/LAy8VsTrfBMRTDjaNJcNwWjxBju67IqYT7ioRaMd9Mn/Zp
         J7XEXNIZxD1nEIzT7o1oHqI/I29CJEN8Et+pSerfc/d0x9TORXiZkBGZsasRqvzaY4rg
         EEOj8va7tQ2xD8kFHE/x28FIpHwovYIPQfZa96NCnCrl/tM4at1SnGR37kz+suXUrUiL
         l8pavNba7KKFitA0vMkrpvGNfOZiwVqQVf3IUSZO1eqag7ecFVmOoszO9vGzaMUuaPK2
         /ehn0K7x7Rm9BJfPDqDo66jh8ouvWf+Rbs80+3Yc7S2L1mAHrcCOFNdpNnytsu4HnEvv
         ku2g==
X-Gm-Message-State: AOJu0Yy17RsVxlKPkaWBGCN3Yr6WPEclIbUCiHCcHCLs1Lu243n8QxXX
	lBKJ7y6nB3xvb9ZOV1cVQO6vfjefk2tRM1N2l1KpLT33p7QZ9vEXPhm6zuo4mnfbXRzasfAT4Bv
	08+qoZblS5SVGBO4fM7Egv6Y8KlSXiRBhldnLTfxZN+nvTl8xyabjWKTyD80KSd4LY3jB
X-Gm-Gg: ASbGncutsCl5fc9AR4s4JGYHd2RejbcfFbTqiQK4EO4h4PZVsnwhWVsaVu6+10wGFX1
	vZmngwlAe7myoR3lbMxnrmmBzB3I6ZA44OoCbDlzJEzggOJiqayHzK2FcoPSUpeDgB5hiKzmv3p
	mJTZpWNdKRjL0GT5NLUGpdqT348crOsawqqQ7E8ttafHpU/UF20Km4b7nCnhACZSlyJEvLDK4Md
	SZkyv/24It3i81qdfOdgcDlHcj/UhB/C8NTnli+q0g3+6IyjwUoYNOIba4PffKdraDZvkTjxmeN
	M7BuILRQwhGkiD3LH2r9ioBQ3fy7mb8ha7GYeHwQ/QTmrpFZvAYfvrv0IA7ePVCx9n6xPqyebke
	O/Dtoog/Bkd7wWnWEXU3+kDz+hAV8EEW3Z5hGTBlkxTNIAHs=
X-Received: by 2002:a17:903:11cf:b0:295:9c48:96c0 with SMTP id d9443c01a7336-29d9f67cab3mr16299965ad.5.1764817169116;
        Wed, 03 Dec 2025 18:59:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtjTDf1CZP76hEg8vsEpyBRsRqFu57rxdigLgv2KzdxXp12bS6U3+fYtiBhGLQeZ0DNUaz3Q==
X-Received: by 2002:a17:903:11cf:b0:295:9c48:96c0 with SMTP id d9443c01a7336-29d9f67cab3mr16299675ad.5.1764817168547;
        Wed, 03 Dec 2025 18:59:28 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cf8a1sm3101985ad.33.2025.12.03.18.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 18:59:27 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: sm8650-hdk: Fix compile warnings in typec-mux node
Date: Thu,  4 Dec 2025 08:29:21 +0530
Message-Id: <20251204025921.3024179-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vGFtyNSBVGlJFIPkSnPjNiB4NCwTX7jI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAyMiBTYWx0ZWRfX+8Twefa0GMYc
 dhbpUKVK+IHg7QuhKaDCqAf/708O2+2mosGQMW6yN291xaKC/pfVuy71dfCN9i4mhtVFyKFafiJ
 hAAawZst8aUZ72eckDFhaIDiKbotGrBSQar7TxHzyNbyY4n9PF1AS7W9oHFE6bytX2fWlcyL0FH
 Uq/wnEhE2X2mcnTeFdIJSHAMKpj4Nmb1Y7vDRf+pv9H10cgD8upATG2izbs6zc3Cuh7xH8mfa4z
 ZVXWuRZspid0g2/1xSVhE5fD/8tqFpAFBj2JMvDAqavy/uisCdltNxgfzHwnlfyKCd/ewjxTHEe
 FYTGMtwtMXRlILmpRnmm+tiSseJafP36+CF60PWj30cFjuin0/uhVHJR1ZuMKBA+Yga6YZBtqW8
 BJi9AzZA+sF7rwXnL8Xj6e2YOL7aew==
X-Authority-Analysis: v=2.4 cv=dfONHHXe c=1 sm=1 tr=0 ts=6930f911 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=5_tdxaAtfjH2S0-cxRcA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: vGFtyNSBVGlJFIPkSnPjNiB4NCwTX7jI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040022

With W=1, the following error comes up:

Warning (graph_child_address): /soc@0/geniqup@ac0000/i2c@a8c000/typec-mux@e/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

Fix this up by adding only one port node.

Fixes: 01061441029e7 ("arm64: dts: qcom: sm8650: add support for the SM8650-HDK board")
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
This patch has only been compile tested.

 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index 5bf1af3308ce..46700ec9ac9b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -831,16 +831,9 @@ wcd_usbss: typec-mux@e {
 		mode-switch;
 		orientation-switch;
 
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-
-				wcd_usbss_sbu_mux: endpoint {
-					remote-endpoint = <&pmic_glink_sbu>;
-				};
+		port {
+			wcd_usbss_sbu_mux: endpoint {
+				remote-endpoint = <&pmic_glink_sbu>;
 			};
 		};
        };
-- 
2.34.1


