Return-Path: <linux-arm-msm+bounces-108039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPv/LlXXCWossQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 16:57:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15503561C8B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 16:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B8C73022960
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 14:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F83A328267;
	Sun, 17 May 2026 14:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BS5neLj9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g+f54IuS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5953B840F
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 14:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779029787; cv=none; b=nd5yFz+yL2h4LrGhKxg2gpnUMdT+7siRVjIdBQ4nF6aOdFBoubrejDCPYZFz8GKUcqCi/fQqLYFM9alHcW5/fyksVdOmLUo49rl/uLrL04elkPS15q+ODidTBJN4aIUEQ9/PrUM8/AOwPBZ2cLDoZragCeph3Xo+bn3A2TB+Wz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779029787; c=relaxed/simple;
	bh=yAIROTwJQEaMU9ZjbTvKT4ixMEOUBZ9RwtnTNlDtTTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tTTlJNaewWTW6DTu+512Qjqiw+wB6CpgN0zi5WuPs2ADZNkTVWFTe4eCoVsvUcIQWd0fcPpHtJYnWYhDjl9vKTGkD7wIsPLxS7Kvl+/Kbm5z6efJgyNsu8G3z5yZOvQowaRxbzjYlW3ya/2Hhrr8BFZko6TdHJySgSG01K47/k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BS5neLj9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g+f54IuS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HB023D3335524
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 14:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WxYdNZ9fUmIg4LXy5NN0RD32UUYFv5Agl34kN8jfCGc=; b=BS5neLj90fG13HN5
	2AKmLP/koCwGhPbETGNE9xmGEgSJwSeXDgXRCmK7xjTC8gH67cbJmEJC0q07HFsD
	ID2AY0GHX/ahiIthZcbo2A/M59KV7fxdU4eTSQCEqs8/KGs59Jjxai8T/7s/U/FM
	Ij463yhaGTNHU+CCZFmbgzdEjm4DJWtzqGj9HmhDpTggIt/XMFgqU+VAPA0YrK7m
	clbAABC1EeozT7Pb1nazIqps36iq1M9lUeiJBtOfmeAkvPQB8RWIVvQtkk/d+OFY
	xCpAEsmOyIIoRYM4ghkD2/Vexq1hs9794LEE8YfyO1uNMDeB9iBgNOw4UaeJ3FLs
	EbIWcw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gx6u0q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 14:56:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d9a6a853bso47271061cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 07:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779029782; x=1779634582; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WxYdNZ9fUmIg4LXy5NN0RD32UUYFv5Agl34kN8jfCGc=;
        b=g+f54IuStzMcii+xB/6Nz2NPuYX+kSNUl/yYphKKQrII70Ti8v5kDa3+IJzehib5sN
         mXvR97Dqny7l5B6K6qOrjEGUtLUVSXHCGkHbL6cFrqOcKR0iZ4jhl+N1E3XJR4YpQYpn
         UBigrXNj9eXI8V/aAZDh5VH1nzGaqj++Dbj5IaSnSIQCF59ZM0s7Klib+lQdpXwHaHiW
         2x0TG1zwy7mXjvC35gaspVkFVnS6ma0BE81f9pZTs68A+OtRaQjC1heEtKCNxJjJCE9f
         iRPJXhFQSmg7r74Zx2bZQIB6V8FmykLM6GBhAApjkwds0dUqExUn5sbO1tSiymjBC9AE
         3lVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779029782; x=1779634582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WxYdNZ9fUmIg4LXy5NN0RD32UUYFv5Agl34kN8jfCGc=;
        b=fs2z7Wu30/wo9uWp3y+Y727aNzG26oxafTFDY7BkLa74JvJQb0+Uvq42c1Zt+hBsZN
         BLKOvhhjb5k2mrJZxT9rqf+pSLgW+YHnb5dFckA/4PzeYXJmlrCx3HdQQi28oRG2pKtU
         kVfJ/qlmqAznrH0xV544SYE3GlDg2aXVYIT1cfHCF4UOhvbpJu7f+qs2ahCDcCzKOAFu
         PDWAxxAmKv+5hxa78h5+hFkGmOGnn6Sef2U0i3rotKxR6zljjQUWC3p9cvuEI45iIl8h
         1NcaguR1uQf+OPVpU2sRlcwBo2P5V41wCN50CiYIWsOtQT4vxmciQWcUS1MpDkcpav3p
         YF0Q==
X-Gm-Message-State: AOJu0Yx0hbB0cCgO1/qEVVPCDfisDMVraOQemYATyZ+qXy0PV+3Yd/Ag
	Tc27MIdpmLDjhMPK05k/bhlaTqFRFmdEH63vytkK+9VDQQv9EPoiwHlicn+D6myiiTQteEFIQrQ
	1l9TStSrOc9Mtkjt6NM+6ImlR9p0vSUOej5OvFMfnBjN2a9bEnhF2efZYn0kFGtbwY831
X-Gm-Gg: Acq92OHWDuK3Z9HsbUR+bn017gZizyAdE5Z6uiT4dTZqtonw4KGkf8xjksHfFxo6xlE
	D2/1Pqq2vs7pMOdXJnW4D88PgdtNhp43pZ4X+BnzuPp9tnun+fEwBugXc92v1fAS2b6y/BkDRnl
	eHKQVsWunmb/G4bdnFtpLP6jgv8OBfENG09Pimxu2bJtogNd/UT/icHIYE78UM1S71xgyrWv9wv
	yc/EfjTp1cnJpIamt4FaB5pnHVKxZGotn4nYl1v36q99XGOQHVB9ITJu+W1LFEAjKRwEiuUnZ6S
	0DyfFqqZ5ya4iBIReYSSyufXLee/iUqDlnk8andoZkLWtuJhqN2nJPUahZb9o2bsmZecx4ljzPZ
	58xx2LKNwFMwBrDkuzJfG+wRgvAVNeKxOfaLYG9Q47QGytGfr57byPR25Q7jznP9s03e3iOT1H5
	D2s2D7WbUpxvb9M2zOnrhdao/qpd81nwJl/9Bj9DnSDLakqA==
X-Received: by 2002:a05:622a:90a:b0:50b:4337:179a with SMTP id d75a77b69052e-5165a011bffmr168695301cf.3.1779029782338;
        Sun, 17 May 2026 07:56:22 -0700 (PDT)
X-Received: by 2002:a05:622a:90a:b0:50b:4337:179a with SMTP id d75a77b69052e-5165a011bffmr168695091cf.3.1779029781888;
        Sun, 17 May 2026 07:56:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f118991sm2733339e87.18.2026.05.17.07.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:56:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 17 May 2026 17:56:09 +0300
Subject: [PATCH 3/7] arm64: dts: qcom: sm8350: consolidate IPA properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-ipa-loader-v1-3-3c3764c1b4a3@oss.qualcomm.com>
References: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
In-Reply-To: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2799;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yAIROTwJQEaMU9ZjbTvKT4ixMEOUBZ9RwtnTNlDtTTI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqCdcND813zJtOucun+6rI+vq5ZSlB2W2ZMY/47
 +AoyDhEwsiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagnXDQAKCRCLPIo+Aiko
 1ZB+CAChuInI4lBeaSbFLyIzLgBQhBpMW3GMIh35lWNsqejMzd32LpBj063xOyz6wyW80WrU7Jg
 Kj60ZnDea07q9eJAP7oE8hYiIsYiMwXOi3OebDpduu4xyXeMhE7Gb6Fua1/PytyDtWs74BYxd3z
 wWbeHHcevf8CbftYOSvgRcfPhZSm9k7RpH+bOxzhcXcqBuQLBkkR99sXxiGLRjLycTybxm5i+O7
 O4SXwWS6xhaSbczDLU4Vimde1QUtG0RuAYMud/ivGGve7E79OUEV0LeqFG4rE/WiebpCbgPhuG+
 xYjHL1ni/8YwW59Dy8T2AhgLLm2uS1opVMPXAuXt/SlYCLVG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: IKlUo8wHYKy94yGbbHWj7g4jHRPETkV9
X-Authority-Analysis: v=2.4 cv=f614wuyM c=1 sm=1 tr=0 ts=6a09d717 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=p0Mlc_S7HCjlhZA3N4EA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: IKlUo8wHYKy94yGbbHWj7g4jHRPETkV9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE2MCBTYWx0ZWRfX1oNQtT5r/F9K
 3F4/fTjkYh9U+FTdWZubZkdGm6k6gd3FGo8uF9Md775XUFtavlqyJWCd3RLDz35ap/TGbVFWfId
 6BimTwbt9FPWFpXjIwyiIpo/Eoknfj7ekvXWX93GCqPVD4kK4nbclzhO/+3CDj+hPZv+1GE9IgP
 UNBqIFRhSG5PeJblHGtCGIw3vWyYD3Y2DEbb+zg7Y80b8hPoNr2sDm6Jyy/OwXwV7DHBCBcc90G
 dfhdReQLAGpPYkVCxbQN06SudRwHzp9IuRb6q3EDr3khQbpq/TDdnmWWm9njxlfT6JC6mh5csFx
 KSsTWjIAqIwUi10r8L2ORH3V+nSkpju6HNVuRqifsx8nNkzOe35myYDn+VMvPymvT2scdlrj9aC
 jbQuZ9fE/ul/4/ua29NnRnZZZydraTLmRwIfaQ3kJJnsLDkn+JiwaRKkOp5NpAjgu0A6Q3fdU7e
 ORe76RsnwtDF43d5H+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170160
X-Rspamd-Queue-Id: 15503561C8B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108039-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Move generic IPA-related properties to the base DTSI file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts                    | 5 ++---
 arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts | 2 --
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts                    | 2 --
 arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi    | 3 +--
 arch/arm64/boot/dts/qcom/sm8350.dtsi                       | 3 +++
 5 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 5f975d009465..6d3f9c73a2cc 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -923,8 +923,7 @@ irq-pins {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&pil_ipa_fw_mem>;
-	status = "okay";
 	firmware-name = "qcom/sm8350/ipa_fws.mbn";
+
+	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts b/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts
index 3bd5e57cbcda..6b10464e8774 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts
@@ -290,8 +290,6 @@ &i2c11 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&pil_ipa_fw_mem>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
index 8bee57f3b25a..b25f223d6190 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
@@ -378,7 +378,5 @@ &usb_2_qmpphy {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&pil_ipa_fw_mem>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
index 7ae1eb0a7cce..ba862b4f9890 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
@@ -553,9 +553,8 @@ &i2c17 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&pil_ipa_fw_mem>;
 	firmware-name = "qcom/sm8350/Sony/sagami/ipa_fws.mbn";
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c830953156ec..abb4d46e2594 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1866,6 +1866,9 @@ ipa: ipa@1e40000 {
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			qcom,gsi-loader = "self";
+			memory-region = <&pil_ipa_fw_mem>;
+
 			sram = <&ipa_modem_tables>;
 
 			status = "disabled";

-- 
2.47.3


