Return-Path: <linux-arm-msm+bounces-74338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E074BB8D659
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 09:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF95F7A975F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 07:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2FE92D9EFB;
	Sun, 21 Sep 2025 07:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UNJp+CE/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FBA2D2390
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758438716; cv=none; b=Qwr77DzgOydBdgFoMeEwFdH4aKFROIDGfXrqu/1Fl2ytKm22wjhYiXrzRsvBnSC+BnZGJ2+DjqWWQ76FMb0aE0X468iGCggPcXSyyNBnNqM0nCWIifGMlwJdvI6l5V7yNqEWvNRzthbWwI3WIyz/S5TPPyZHWvdtcMHUT479SbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758438716; c=relaxed/simple;
	bh=gdZruk0srcqzy6/KhEGZDdfF3ktae7pNRxkyRa0+7Fg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H8hchYLufOz5Zvh57ptPeb84NxbzbX5uKMvwkhcUA/vlFoJkQ1LHnROI3NC+W/FJMDuffpGWCFr/GBAp93krVChOobvplOhmFxVHEgDIebiYjxeANag2+zegLM3WlaMN8KXs4wgdWLg0qPcSOqqpsYGkfKJbmZsLEXHH4jQhDR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UNJp+CE/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58L5vnFv022894
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qws5POK3y/Gd1qPYhifYTlDuaozSLRFNtSkU85V2wx4=; b=UNJp+CE/9GWtKuQc
	4R7KZLps8nbHQMjD2KgKXAhuJwnGKtWCduaYMuCvwZSTXc9OpqwZ36Zba0UXy5Vf
	0fXEPOUaBxsxwtGiggAcjijfn3vshrnhOl3MomeK/ef6j07R8WPJX4ybjgXYu91L
	pecTZyK5cMxNjJcGJSAhXKNpSNRYyH+cA7egWaImSUGGlqPkxCUVmf8bJalU1B/q
	Z+9XdVUdlAEdeO8agA/v7AnEcVl9EbjvRpKk8gl+w1kv01zzAzHPWbmS5LfuGP4V
	vAcy3+smy2RBjLGTDvyhT0a5WbzECd/2uMyEqJpgubDTHnZl96PbL9Vy9bnFNSEf
	h3NAGQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499neksnxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b548745115so72647991cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 00:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758438713; x=1759043513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qws5POK3y/Gd1qPYhifYTlDuaozSLRFNtSkU85V2wx4=;
        b=laB8qjjpikMMNjjytjMB6EOE5hNkExklNgTSpqLoa+nr2HGue8LRuZIHsFHwbejX9/
         qjjCPaPTo7lUpTzRO6V+jszqAnFB7dX4jlwY8k2+9SxU6PseM0BEhpQJvJwji9SPqE6X
         YxFl5uDExIJ6Y190ZFuZBL6Vrr8N3N+3kJsppX8OLmZUsZlI8ye7HOvM8Kua9s65EgJ8
         WzuodMors437ehpUaD/wLBtPpdI5oMICTwtYhRavxRMygNWG47doQHxuTaP7ureMvZEo
         KzN182qN/ckmNwCVQ7J2RQVl9+aMLPDF7GjY39hhwZaLFGhZ6dgzaUo8z2G6YWB/MLHV
         B7Tg==
X-Gm-Message-State: AOJu0YxmMPpgj79YLlPk6poYcFBv0zZgEGcM86KJ0Reh5lAZ0F6AKfB5
	80xwd8kh83TjY+/71GFD5+KZYM96uCreTB1lLU7PCSyEUwh15NTb/AKsrmfIkx/Y8n+k05nUDmh
	OI5ssOxBRP33S6H6KpULUBM3W0zxTg4EXRcxWfXmomlzQndmWnGfdlPQSrT9jGcUAXrXO
X-Gm-Gg: ASbGncvsmpeXmq1UrJVuIo0cFiBIXo3GMBSFla18nsSpbMW9ESVZvzFX82Rkjw9fe65
	+bhe1Y42/gwY/X4XPldoD/Yy3WVMyxefbteHp+fS7NzxY+8Uzm+2D6XoIVz9osgcqK0ukuka5Ub
	NMSRZF0BSBTuounTOo14/2SQEOaWL2ll9m+d4vUAczixB8m/IyC8od/GQ6W1xf0ZHXgza+aldAS
	8QuqgYi/yMrRh3r0Db9rVj+qvTKLUPGmvvNx1We/l2jmDnpIG1FfdKTvxfmRiCm8afzLYbQjQYv
	YSs8h97pf6FOt3IdCaDOH2CPfSMojm6sJIqE4IUqHdqet0KFjWHwp8H+GtpXyuTl73vjSrna7RL
	HmUbu0QiT1TFk4gEDaA7XCNFZuWkgpJW94uSg0osmTYP/tpJ/7NI3
X-Received: by 2002:a05:622a:315:b0:4b7:9a56:b076 with SMTP id d75a77b69052e-4bdaef577afmr148108231cf.36.1758438713404;
        Sun, 21 Sep 2025 00:11:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfyHNM0vbrXxYJJC/PFoXLo3Bpg+crKWScknsQAk2AFYJNIiz5xCXfVfgDo9Hy3N1WhQB6aw==
X-Received: by 2002:a05:622a:315:b0:4b7:9a56:b076 with SMTP id d75a77b69052e-4bdaef577afmr148108041cf.36.1758438712994;
        Sun, 21 Sep 2025 00:11:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57e06875c2csm144031e87.4.2025.09.21.00.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 00:11:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 10:09:29 +0300
Subject: [PATCH 13/14] arm64: dts: qcom: sc8280xp: add refgen regulator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-refgen-v1-13-9d93e64133ea@oss.qualcomm.com>
References: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
In-Reply-To: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=935;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gdZruk0srcqzy6/KhEGZDdfF3ktae7pNRxkyRa0+7Fg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoz6UinXpj8MqCA274oGiiTasJ1axiVCfZCKUFd
 ZXTggT1e5yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaM+lIgAKCRCLPIo+Aiko
 1d+0B/9XX6KZ7o6ch/9bnWXIKnxIZuF4WZeJJddCyC++BY7flJiufRsnXAWA2N4H07M59xcgzLT
 HZN4C9TpuKpeYp6/AEpQzx6x7ji5EuWBdbMKB7uIVb4nyfcNQCAxGpLJDZrpxF/sz1YyUOynrpo
 +x+S+tIS+HSEhFh4KRAXUP+W3ylxBfsZVfyMlV+QwTSj8uwrLAYUjhVczqoRJhQsHkdzeFS7cV7
 LcYJynFBotO6+TsW8/sNRzkVTWnSnBSZoaxvjWbywWo9AM8RvT6Zw4OznAa09rrTLe4tON0JC3Y
 mf6822CNHho36tcF1nxmtMGTkmU+rWy/rSNBg2m9N2JvjCiy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: FB_g0K_gN5Zm3Mm_P9ez8S09174bQaEd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDA0MSBTYWx0ZWRfX44c+Oj7zEvHD
 bUrQCgiY8Jawhcl97EDmLAzsRc+nDJuxEuLdE8MZca2KtlbAC0l63xAJqYWJb2YYtJ0A/Zyw4O1
 GTS8hQAuUvXhhGTEo1UpMV8IGPbx9QwU/Xw7MX2scwn1dVXAkuR0uElLdsbBdBDAVUMHm8/6RjZ
 FD/2tLVn/hck6GCovXcCsDXEP+UhYxawKVKL+Pd1sobJlI54wsWaKpyEPIdGXebtiFX2QoGEqhp
 6EqQQWatY5T1i5K5AluUzeVX0sGB9lyBKGS2/l5iFF0e3WediiudmkvTJQ6UQiFxZTznoNZZwCn
 kz0z0n87LTHxuCd/VMHhlE6k2EIK2p88t2m8fNDFAPBQyXLpEDh7l9V8rIRUTILni3Mvz0yhg/N
 4tAFgZhY
X-Authority-Analysis: v=2.4 cv=b+Oy4sGx c=1 sm=1 tr=0 ts=68cfa53a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=PBGS3k_iT5jBzarLTFgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: FB_g0K_gN5Zm3Mm_P9ez8S09174bQaEd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200041

Add the refgen regulator block. It should be used for DSI controllers
once they are added.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 279e5e6beae2099f26b8e0b8576cd6c99fa856ef..e48efbd13bfa8dba71928ef11b80ac27eb4b6f85 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -3723,6 +3723,12 @@ usb_2_qmpphy1: phy@88f1000 {
 			status = "disabled";
 		};
 
+		refgen: regulator@8900000 {
+			compatible = "qcom,sc8280xp-refgen-regulator",
+				     "qcom,sm8250-refgen-regulator";
+			reg = <0x0 0x08900000 0x0 0x96>;
+		};
+
 		usb_1_hsphy: phy@8902000 {
 			compatible = "qcom,sc8280xp-usb-hs-phy",
 				     "qcom,usb-snps-hs-5nm-phy";

-- 
2.47.3


