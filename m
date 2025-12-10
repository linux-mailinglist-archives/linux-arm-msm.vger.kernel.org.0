Return-Path: <linux-arm-msm+bounces-84861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A98CB1CBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 04:28:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 46992301C9F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 03:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C2D62C08AD;
	Wed, 10 Dec 2025 03:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n0MQrJtK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DUqV3zD7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F72266B6B
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 03:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765337305; cv=none; b=sk2UfVaVR//yzs7VHhcj+suw+NxbnGT4SbRg4sYXSo21DDqoF6Q6cnGso4OPcXGfOLW0XQ/NyamadVk4w7DDGYZ+BUOdA31wuTeFlqQjX9gOLGZ5eNr/vEJwJTO5MG79ewxPEdu3UcOUO9cmv0C0tN4Iv18H2+/DIHJBuKarWOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765337305; c=relaxed/simple;
	bh=mL8BQRSfSLpenJxOV2s7nY+cpLCjOlwBOvaf6QDbtWg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pxcsvm6/NxQn5FHtUI2FJUVACRax5Kj/S55S6wMMnHrGZ+p2lTXRuk1noHWLR1daH67UnZXt3Nrn9slYSbxVAf3YUrzT9aRryygZ9lN+H1/ZFeMKtMOu0CJLElfgD2PAzMQWuxoJ6nyCDf8K/zWlhXyIF04wqZzHUlVOYyrdJu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n0MQrJtK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DUqV3zD7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA3LKPD683467
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 03:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+kW8ODxAaz7QQNnJKbjUtVD2FLFWWdEaRp8
	Fwf6EPU4=; b=n0MQrJtKwLtgbRMld4C9vbsiA/8gwNHplb3tGuCd/z9aLIfWqKp
	2VlQSptEjy85n1L7DbwkWULKC9yPJLO81dk/BaQ8XAJ5ryNwAh1bHg3hvJ99TXYJ
	KJQq3iJtw3+CnjaUA2MquUIOdTlfa2OEbIrK9RsZqWjwF4r0HVsvGwL3xd15lGQk
	MqgS1+HQoBVXN8IplFSrQhCPOzYTpBcrHV7/S+RyWwp22tAzyWHN/6LJkxKGKi9Y
	sxC1yTHLnP5D2EUYsudBr+sT+Ks6l9E5SnV8QyY35xdV47R2yuGfNBuX6FhasQ5F
	bhIlYtqEnCY0Jbwga7K4gwkJeLi1jcRT4hQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axwbf0rsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 03:28:22 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-11ddcc9f85eso771107c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 19:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765337302; x=1765942102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+kW8ODxAaz7QQNnJKbjUtVD2FLFWWdEaRp8Fwf6EPU4=;
        b=DUqV3zD7OO3uwCodmfsyyu818nF/r+3AlCawYs14sSSrns5SNnCIa0KCZPETor42lj
         whFIGUNuEtqNp2+iag6SJon0YFaw2ItIYJS22FvtEfu2q2vFNJOJXaEgN7mwTVE5WBxJ
         SnV8Gu65ofxQb48Ms5OkwM2RP6iHo/drKdeuASksND6U2Uhi/pGDRuH3PImJIjfF8+TR
         59Vp3OoviLv0ys0tI3kSXKEiAkwN+FE/V+LEGHPq7qX5ixedrmepk0Dp4+wHvIFb6XxZ
         co18CsdSwc+sdkzr7rOI2a3Mzkp5YK0ABWZPEQpKTSH9SXVZO50f/ZBRDqwq3Q0Eq2Hd
         DqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765337302; x=1765942102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kW8ODxAaz7QQNnJKbjUtVD2FLFWWdEaRp8Fwf6EPU4=;
        b=ENacpIz1xGVm2anhBlAuoQIICyycBdsGkzOaGO7YJfk25tMbkpO3b9C73nzSrwLjcl
         U7xR/FNczEBWOR9TXHG8wkhod1V8poBnchZ+g0FQL0TAiBcfYeb4eHWKK3MLg0Za4u2c
         XTO+x8Pux6Z332nLiRMxdwObr1AOUjpVnmYIZz+V+DW9m6ssQDqgSk9DZARG0IqCydTO
         Wa5AoxlYGH5FrXwTeKabi/zFNeaFOjOP+4vqXM5jopq0CY0pi0mmS9EY7zWtWZf94PyS
         RIoZrGM2HTrdIvME2ZL1xw3guvCcTkWIgphOxpBVLWblWwYc1+UhKeP6NuT4nSN/iQai
         rzjw==
X-Forwarded-Encrypted: i=1; AJvYcCVsP9hKKWNv//zPO1i8gymjSqiLqrWwFw0cpjx/TTqAKF78E9T/7H8ywGktqRI38aZ4RBPMqk6lIDhj1k21@vger.kernel.org
X-Gm-Message-State: AOJu0YzWHzpMbdtntMtHIpaI5nNx+/AGyiAo9pAzd4pYlCUum6eaHhB9
	nwEbONXIRI8rHWqRzf3TEunbJa0QeSk6SBJXqBVumh9Dxd3fFUlKk5XG/P9CTAspMTGkEU9r4x/
	lUT6y00Ncb+79cUR5zi3xZb0q3BK0X5tAD8ZXkRcH/CDaBnvunywWVmhkCJ5Q6CNKhXAw
X-Gm-Gg: ASbGncvX3EXWjZuBoGwQD4ItmspLg2h9mfeMpyLVKk4/mwqh18wKmPgC1V1BpikYSFy
	fHGHdxFn6F3AUOHbODkHuiocGPk7+lJ6E7jnWckXmv6rTglM5EgfmZBpvtdMvmf3k+FUydG3ISg
	q/J+XYhNwxjZCHhAV2GMtKMQB9dlCysg+hq1nlPhzHDaZfn2qjbtB4YvXtSWepj1gLgiAw2QTfV
	ZDzosyxTHw+vgotasFqMTUD4GOo9+O4xtaIksJ2JbUfv83p9GbmwgPx2cIzRcgecyNZxUsFYT2a
	JOy9cTMI3v2J/HghCvr87r5AAcPnvNXmbVxau30X5/pH4Vb3PCJTtLQ0Cv8FXPKoQn74Rri4ur4
	uHTkSFyOakLYGwp1AEmR1XhsMMxeiD0RcEb9BV03Cinfozec2DdmNgn4cRN5BZ4yy
X-Received: by 2002:a05:7022:6088:b0:11a:fb0a:ceca with SMTP id a92af1059eb24-11f251c3883mr2225962c88.16.1765337302154;
        Tue, 09 Dec 2025 19:28:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESGLVaS/XomA7cqH1pdh6XG4HmKelSneQo/8i5fnsVS/ZicQhfH10ecAmudlax9uKbEo8daw==
X-Received: by 2002:a05:7022:6088:b0:11a:fb0a:ceca with SMTP id a92af1059eb24-11f251c3883mr2225945c88.16.1765337301577;
        Tue, 09 Dec 2025 19:28:21 -0800 (PST)
Received: from hu-yintang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f283d4796sm4773715c88.13.2025.12.09.19.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 19:28:21 -0800 (PST)
From: Yingying Tang <yingying.tang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingweiz@qti.qualcomm.com,
        yijiyang@qti.qualcomm.com, yintang@qti.qualcomm.com
Cc: Yingying Tang <yingying.tang@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: Add WLAN node for Hamoa IoT EVK board
Date: Wed, 10 Dec 2025 11:28:17 +0800
Message-Id: <20251210032817.1264850-1-yingying.tang@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IDIQUdp7O0Xpm1RoC_uQfoZtYYo-UUG5
X-Proofpoint-ORIG-GUID: IDIQUdp7O0Xpm1RoC_uQfoZtYYo-UUG5
X-Authority-Analysis: v=2.4 cv=f/dFxeyM c=1 sm=1 tr=0 ts=6938e8d6 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=X6RbibbD_IlxcGgopv0A:9
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAyNyBTYWx0ZWRfXxY5/wx5VO3TL
 bQv7CFgu2XjyNDo6UHSek5KygO455HLqJ7bSU1hDo5MhFZgaXJ3fpa2ZdfLlRrHb0nC6l6ecX00
 +lEYWduDEPJ4MPm/JozRaPepOHsJDb78Pe/acjnapjRSyJKLa1GvpLvfs4kTdoP+F5qdmX1dHAa
 stYiJEZTseYqB8Y+KB7U5Hlce+ZQnPWPffWpUv9NlKxU74Swo5lZ3IWvl0hc9SRgq5ifb/iFOFQ
 df0wsk7rJnwiCyckPoMWSMLOgSQJ9diCbF3qdOZA/CioDeFyVfCY187X3TxeCdwbSt580tuU7XO
 /SWv9lRF9n/yAptTvljzb3wDxVDHX9NhrKdlDqEw3JQCecq0N/GPBkf4GveefBWze1TFBuvgZdv
 LMhk8M+R/vZxBZR9WdFFNKwoI+6b8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100027

WLAN card is connected to PCIe4 on Hamoa IoT EVK board. Add WLAN node
to support power sequence for this WLAN card.

Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
---
Changes in v2:
- Updated commit message
- Link to v1: https://lore.kernel.org/all/20251209115924.848165-1-yingying.tang@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 36dd6599402b..d66d337292ef 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -534,7 +534,7 @@ wcn7850-pmu {
 		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
 		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
 
-		pinctrl-0 = <&wcn_bt_en>;
+		pinctrl-0 = <&wcn_bt_en>, <&wcn_wlan_en>;
 		pinctrl-names = "default";
 
 		regulators {
@@ -844,6 +844,23 @@ &mdss_dp3_phy {
 	status = "okay";
 };
 
+&pcie4_port0 {
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
 &pcie6a {
 	vddpe-3v3-supply = <&vreg_nvme>;
 };
@@ -1143,6 +1160,13 @@ wcn_bt_en: wcn-bt-en-state {
 		bias-disable;
 	};
 
+	wcn_wlan_en: wcn-wlan-en-state {
+		pins = "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	wwan_sw_en: wwan-sw-en-state {
 		pins = "gpio221";
 		function = "gpio";
-- 
2.25.1


