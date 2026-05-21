Return-Path: <linux-arm-msm+bounces-109088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IP7gN3oJD2oHEgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:32:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7205A5DA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C67813170B39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8628D401A3E;
	Thu, 21 May 2026 13:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S6MoWRiE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JQj+0fZA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0AA4014A9
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368892; cv=none; b=Xq68U+L4AEGnx5C+uxNad/DsbVigITgJrApHS9GomLsjspIglZnHVknI03fmjgp1MOvOPNxNtpQqkw0pUGvzailOUXBkAuzEyP5FLPiU3dbDIKgfzi42aGSTeVF4w0NNNrniq3KMPdDHQVWYV0EsIpFSe9maZhpC+GluR2z3nGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368892; c=relaxed/simple;
	bh=PxFeE4iE8H+mop4PjNTz4rASGopPuOb04tpGCfdaBGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rEubehv4uBO92rodXtrCovqdQ3RBwbtRlwf+U6qhuw2zSXfXmoSd+4DgyxHHHdJry+YRtxDgjYNGHnrZI3f9V2t8jY+f5FfH+d5uyl/pXJzBR7LrGI+1kZUzT9Eus+ZpG1uAZydw+IFRgvNu+pD0VOfqfK1L6hnc+QfopjLI5f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S6MoWRiE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JQj+0fZA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99nXY3118945
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HNuNHDzkj7zsiUvpDWiTjAWZpkmlx5Eb/BqVvO8oXg4=; b=S6MoWRiEfJiaNvG0
	E8FOEtK5JKyFzHHsrwXQxX6l+IBVJgUyYLGFoqyvYyNHqGxzdnfRuI7xmyf1Lbka
	+2FheOJhwbIdJso+yBhscC3ohxlrW9ejf90ZHZEqAgzjCCbumE3Zu76+mq52Ktjw
	Y3TduMYTBJWtPmy+gu6WJGoTS5pPzvslV2u7BwsUXkRzzOJNiKm6+osgQX2dndMv
	xosCmmOUuLe2muTtdIwHX4fguPTzKwSrYFHcd6BVdHjs4YWnu9qFEpNHWlQ61LuR
	6GLxcNpwyR0IFXjWoP3ULS7eR+BKxMjqeiSwhXxPI+g7kEyepOLlaGRPMfO46e6r
	cTBwfA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9r962hvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:08:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba3245a43dso64103665ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368889; x=1779973689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNuNHDzkj7zsiUvpDWiTjAWZpkmlx5Eb/BqVvO8oXg4=;
        b=JQj+0fZAWi428ZLL6xgWskayeRUB1ja3D39ZGvkqJ/L2SvoWCuX8nSncLbFnuepXXU
         k6wQpWumf2eKtPCx/c8aSHKe63qCSMPaC5Qs6BvFQIRDaML5AdM4yTbQx+DYjOO4ST3u
         1UDXgw/UmwlF8h8etOQIs0vrtF9BrvX2I00Jh1p+BERZ5YhnEpv/YcgB4oUGdXZiITOK
         bveOXvbPwlE+/QAuT+cG4uiQKirQIjJfIP8tW8zYi1IZdffLYgitfY4it1qWe6wnPalb
         NgE48PPPTEs5hFw5EN1pFe01vg33fZDmYmJcesAxS4DjZ5frjBov3DPDtFfFuom3ZdPy
         LEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368889; x=1779973689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HNuNHDzkj7zsiUvpDWiTjAWZpkmlx5Eb/BqVvO8oXg4=;
        b=K+NV/BwHnmWWlvwmQeeC80ODV6284IMEuXZNtAIsQJQt5PKJLulp5Y9jGk0C2ZGIWz
         Kt00uvkqIfDLIbINrf+51jLEXdeFFL/r0GBXRVeTFNduEEsQZVXiysdI9PbJCR2L75e/
         JFiAv8BDXU5dkOiUkZL9ICtn3O1JyM2CjqNHmaotn7StmvH/01ooamOHD/yyPd7BJMwV
         HK72ZuZ9Zgt6VOjisYNnFceA/F1uq/wr2SMYWWpKGeaS2/AqJkRhTc1VlPIWR3FcryuJ
         PSAG2w6hop9enULLnbyDQIWUMwsZVZjIh4TxgwyxbxolOPT/JJdw154u7MDNDDbgyxXR
         CglQ==
X-Gm-Message-State: AOJu0YxJ05N7imspG77tdHcHYrE7fftOT5Auv0sETUHWsSaYm6SK9xme
	fr/U5QHgnWuTvafez0DlbDJV3n9jemXBQi3FzrUpBECSOssMUDjrQd6NPmX5WYgsUdusVq/5yVn
	a8P+mhchwns3qpXJTkTfxSRkdp0PvvdMHfrDF2dNUZ8St485P8LXtefATT2RYypc603qk
X-Gm-Gg: Acq92OH3Mp4yv7AJ5CJUnEkZxYJiiT6MPo7pRXTksYP80/ivaPzi+vrHQzdEGY5ofN7
	uGA+yVUaVFV14Q+9S601f1mw5ZGsL9497VXQUbbF3mwBU00SRF+4IqGOyZmC1CXQFpIHUN5AhTn
	6LHcUrzSrnepB773HqsNCsxyhCNqhrzNSSAco0M/EtKs5H56nbKumrl9sBDqXfjYNGXhcMWjq7k
	9ABsHxFLINGzLcnwFVgKEvXD2t5p1Qemwe7h3IV3D3cct/0iS9n64FHJ2Sn7c14O5wz/COWY9wH
	/8oL4y4gJlfT2+A2t64r/+s9adbO5spXFUTegO3U+wLyniyic+m1DVMYBO1ZfTMzh6DnI92/2xM
	nnR17rLgDzX/sX35MD2Mhu6p6Dz7e2hc4wFGq1D5xLlhEP0q5J6L2T/y2
X-Received: by 2002:a05:6a21:6d88:b0:39f:acae:f12e with SMTP id adf61e73a8af0-3b3085dcfeamr3604293637.22.1779368888874;
        Thu, 21 May 2026 06:08:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d88:b0:39f:acae:f12e with SMTP id adf61e73a8af0-3b3085dcfeamr3604259637.22.1779368888402;
        Thu, 21 May 2026 06:08:08 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:08:08 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:51 +0530
Subject: [PATCH 18/18] arm64: dts: qcom: talos: Fix PCIe wake GPIO polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-18-d822567be258@oss.qualcomm.com>
References: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
In-Reply-To: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=1536;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=PxFeE4iE8H+mop4PjNTz4rASGopPuOb04tpGCfdaBGo=;
 b=6TCGJrr+ZfZzhC2d+ja/wZwsj3bPsczKKCSr13V8+Q0j1FCmaPMhWkSIzOe2FKGTwJoKCzye3
 h18aPT8VtAJDgnijkDKrmz1S9guP7uAI2sJXQYNI9WjFqPHCtpCuTuA
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: pRJhzI5LZYf0facpGwkZSM7pyxTYmLWO
X-Proofpoint-GUID: pRJhzI5LZYf0facpGwkZSM7pyxTYmLWO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfX+DCn2sadx2wB
 0fIjOqIOKQ7cpNlBcOz135pM5UqZjSVJp67OT9cX7qlTv45+WVy7FRKJY2hOj4Zzbiujv3einr2
 i9oOcY0oGx+FSne4Tq9wSkwPTC43kUOxhMprt1GMkLvwJ+kmw7CxV1VsFDlWWxHYw3UPs95VeYN
 yfCU6mK9oDNnxMcQnw/O9hSYyUy7X1JgbsM27PqYafkCaSVfvY8KAaT0k92EIwkMfeQryGt2ZPh
 0gtO9zruMKFM8v/nfkkC7puVV8q1VGL38Pg8UYRO5zf1WOoY97M3GJdITBi1/D03Hg6QIBIP83I
 yekgOD5Rn96Mce+cGNppmo4jAaibRzs5lgAzX1LkIOETHqOPct+xTlCOfuF5aV+4DJwLBktVml4
 9IWgYlyiWEQYruxaPHVRwoh+4hfBBm4sYvICD+K1mloCD4hmWo8AU4wAj0rRycJ6nxGpClWhH0D
 AwhqwBVfGfhF0QNO0Iw==
X-Authority-Analysis: v=2.4 cv=GqFyPE1C c=1 sm=1 tr=0 ts=6a0f03b9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210131
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109088-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3F7205A5DA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts    | 2 +-
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 7e05f873194a..d89548a2a3f1 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -445,7 +445,7 @@ &mdss_dsi0_phy {
 
 &pcie {
 	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index 294354c034c3..6eca3791e2b9 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -359,7 +359,7 @@ &mdss_dsi0_phy {
 
 &pcie {
 	perst-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie_default_state>;
 	pinctrl-names = "default";

-- 
2.34.1


