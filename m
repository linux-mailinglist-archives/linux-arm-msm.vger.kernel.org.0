Return-Path: <linux-arm-msm+bounces-78806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC50C0A6A2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 12:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12EFC3AEC96
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 11:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED6E21B1AA;
	Sun, 26 Oct 2025 11:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aauOFUDz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF9623C8C5
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 11:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761477507; cv=none; b=MLvv0ndEhnSlz+dRf1lBGtCiVS9X/u6rgy3XeFu8gjuoX9Xj4FcwBtsasKUH0cgagjwjOvxFdVzN8jKc0z/kjYOjjoUvvXxUBXq1sMQJYs9JbpwnO6unQ0LUmV9Aiilon7XkMjX9DtZ5VMT9Ke5XDX29QPQr02rwkiHUcaNyz+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761477507; c=relaxed/simple;
	bh=R5Iwm+p7FGWgomQXuQyXeJr0a6lDNiN5ZJM8uW4YGN4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MSmjC72EXAyf/DIWzS6FqBPduyErGEa2Q1kV95JbuXMbXFyZr7GwU5uj7USsqeNvkf/EVgAp6Y4u0tlJRF+QIm2XJDeGazBn6CMNk5VBJx1+X3wqjG/S0Q7ZDP+KhI7D1RBd8J9wXjqocDPXn/8hXAodNg0DRwSVWaA5PQE6RCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aauOFUDz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59Q4sboI3074599
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 11:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=n3egFmjPZZk
	XUA1mXAJGi4QA1hhYTOpuHfcukdRobdc=; b=aauOFUDzY8Nn22SR0q5Y9Pk3uwR
	oQF4xzfOxXjgy9Cn0rIAUR/9yeeeHUjWpIogkwhI93p2yMlj8kf+cnQxJ9hwiPmi
	kegkoZJIaZfA5VumD2g0TA80eizLzbmRTF4PlYuy5qkpbNwoUSBxyBJFS8/YqC6a
	4VdViCTWrgi8p/TFv08zStcHKHhAmBmbAG4d/1kvkcn6tGySVz1vvE97yQlqz6oF
	EaLPZBUz5M2M+TspywXIcSkuoQVPLxFVJ2I6wKAhFiyvUHkP6K5e5HtlnGmaqn9L
	gT/z5av0AuNu8rXjdJFedAG8q9aCOunPHiGGgfssFWnNV6uTSqMw97t7ykQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0pmqhxk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 11:18:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a286d6001aso136677b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 04:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761477503; x=1762082303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3egFmjPZZkXUA1mXAJGi4QA1hhYTOpuHfcukdRobdc=;
        b=bDSr1SIl12ZuOQGwON0hR2KiANC51vmXINlugIeeJeDQKENI9e3ynmnlaTZuT1nSDf
         uTr007YyPgayebwsqqvECNnyIXWLutSNceZCx8VOpXbZHydk9NNl85v7j2vwdkRc2rvq
         yDKS5b28jnthmwyC9V1QLAe4UDwAfSh/pHtWA3p+7vS0ZEaR0LysQkEIzjV07SeNZXep
         dKYQstIOE1p7ImDW2HTismcrBdiVnwr/TVaZl1+7C/5QmX5/tC/XbezYY4CQ/aXKPF5Z
         Y9K97l90HJnTc6TiqTj7y+KWKQqHHmk9+xgTvsuTNDQk341gNp4SMSujG0JZ6kIz40YP
         l4Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWgtMbVFkM0Uv5uTO7OFWlA8ZXRm9GSH+9vWJ+xqtpK8CZwc3LwwZ6oc4WMruAvxKRPUKdJXQZMX2l4bkxe@vger.kernel.org
X-Gm-Message-State: AOJu0YyaiMstvFwgR8xcwdmi7Nr9pVwG7kks4Y+ziKGNmQjl0ppk9Xv2
	h92K6BDzrbfjyyTX/mze2H9oMJ0WgkKcSEM0aUMIyqp3e/6gAiNMgr5QnQl/N+XAy/ZlHfLsV7k
	mnkQMLyi3CnsqbmPoQ72YZS4zKbdnEFvP4bL7qJvZQ+WRvMv2Gk3SKqZcaa4vo0hOHwQ=
X-Gm-Gg: ASbGncuMPPIWv9sbSZr+4oZMAZD+9XcriD7MqbVjdc4Enqm5VjcAANPcUn5g5aMPdFU
	/FWbxyZlVfZK3ciqAPCrxL5QMjqQzOzFa3jO2PXu1EkxhnQwG+EcdnBN3LzFnr0d2nnnxAtuoR2
	iyAf4Zgii3LvDB6ZAVPlwE/zuqDkIPlZQjfG1SR09pXqm0SkYQF53G4HOQfZmhVElWDf9pnhNIf
	+V08CJrUzaEqqEislJZJ0/EYnlgL91GGMZ3D8o+GK+Em92T9o/a5qMvx5v3zxyBeH50GJRErQuK
	2ovcLSoEFUar+qUrc/asBFrZ+GLWRcdQte/oJGq2o//ut5rRtn+Zn4FMaqQFGEwgLbVU4RXRGYs
	r6tEJ3kaxoX/AxwXV5VVPaQPM9l5owg==
X-Received: by 2002:a05:6a00:244d:b0:7a2:864b:9c8e with SMTP id d2e1a72fcca58-7a2864b9cf8mr5530992b3a.3.1761477503578;
        Sun, 26 Oct 2025 04:18:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVoEqBrpuDnh9tAPwwGRm/FFVYkw9r193nldCfCr9sEnaKUUISkGkIOf0DKuNkSXzwVcmXcw==
X-Received: by 2002:a05:6a00:244d:b0:7a2:864b:9c8e with SMTP id d2e1a72fcca58-7a2864b9cf8mr5530958b3a.3.1761477503053;
        Sun, 26 Oct 2025 04:18:23 -0700 (PDT)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a4140301f7sm4707829b3a.19.2025.10.26.04.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 04:18:22 -0700 (PDT)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH V3 3/4] arm64: dts: qcom: sm8750-mtp: Add SDC2 node for sm8750 mtp board
Date: Sun, 26 Oct 2025 16:47:45 +0530
Message-Id: <20251026111746.3195861-4-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251026111746.3195861-1-sarthak.garg@oss.qualcomm.com>
References: <20251026111746.3195861-1-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FfsVwsFOAaB_ZsvNvPSEideDR_ZzkAOT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI2MDEwNyBTYWx0ZWRfX49VhHnilDScR
 XuJ4i2ZLORTpGIhqz9Zm9p1NUCsOvCxmdo0psBYrwkzQgIguwRiMEpXog0Of1ZA/YMHXS7CG0FG
 8n+GB935dvzvwZN53MZbYYb6VKntNAlYNkswuOWwQ8fwD0BQknIneKQ4aeqULuT+mGpDBDDLEhJ
 /nGp7KZNPnsM9/k2nBfTQjQplm31Ro4K3ms1BWidyrup3CowNDLRpSdZyHuM/u5K8egVjeIRMT5
 0kqcqtV9PjWRiyIE7xZSe3XEIrhAN7UObZeln6CAkPj7cdDn15THKjMkvLoUxMRzgRzMnqlVdgh
 WzcBUFjbv9U7Y/VDoraR892KqjTiYNajnI8Dcy8lisXOIzK2b/qFsPntzt8KzFECx31ASPXsMeJ
 qISDzZwjUs8DihUYi7hxiBbv0gVKTQ==
X-Authority-Analysis: v=2.4 cv=Vf76/Vp9 c=1 sm=1 tr=0 ts=68fe0380 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Fl7qsps3WXD_dGGssnYA:9 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: FfsVwsFOAaB_ZsvNvPSEideDR_ZzkAOT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-26_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510260107

Enable SD Card host controller for sm8750 mtp board.

Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 3bbb53b7c71f..5a00603ec347 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1163,6 +1163,29 @@ wlan_en: wlan-en-state {
 		drive-strength = <8>;
 		bias-pull-down;
 	};
+
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio55";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&sdhc_2 {
+	cd-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l9b_2p9>;
+	vqmmc-supply = <&vreg_l8b_1p8>;
+
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
 };
 
 &uart14 {
-- 
2.34.1


