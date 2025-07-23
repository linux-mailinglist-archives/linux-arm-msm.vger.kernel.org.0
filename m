Return-Path: <linux-arm-msm+bounces-66390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1F6B0FCDF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 00:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71C9A58768A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 120EA27FB03;
	Wed, 23 Jul 2025 22:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nrUci/AT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B6F27A91D
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753309696; cv=none; b=GOGA8yHuQUiPRwGGznKnrRMrkw0MjTX6J3LFc0Abw/oIIpuYM3WEW08hrvBAaxoJO5TRDTCJnEP435sLz6Jscn8Be4+ByqYp4C9iVTJTT7F1cyvgtuy+wcZQZGgAi/eZlDqqiDW8jidJwt2IGep9mfLdgkKqMjWfjK2z6zoUpqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753309696; c=relaxed/simple;
	bh=ykFPGrPOGWnGGhIHHDP+d7MLZZdfIM2eAi2YS13Bh8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XVxiOiE/Jw0/RvpheN80v1V4APRJnJcUteDqnOa7tYwodkm+kYgE5XBtg4nBapX3ObuL2/NbvFVsUFcU9DdEG/DOn6CHMKmEotPFUU8mIE36WEHyE0idu1Yvq236QZoCK7xg43PXLzETt/ONfPtjXstr1kQd5XZedwgiV8LzgCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nrUci/AT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NH7KM9025715
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hzMAWZi234T
	Oa1iw8DZ8oSKgpkGFxc2SxfIjqDIYDnc=; b=nrUci/ATm4HBY6LglW081rR5OOB
	XDauZn4S+RbjKeg1wuOl5wngjLT9ZNJs3/Qq9CBMQv2m1PurLsot7Nsfiig5eYt2
	pCYTw180GgjnUsZjwkhHYWuvdPZLEFeKjSMjbWelwim3BFA6zpZYPepQSh1dau15
	YMSoj/4t2ybZnZeEJFUqxbqDkAUTgw+DymROftLHX/NdHr7z9oh8ObktyK6DKQzu
	FhQQgP58GnwrsNRzn8UAVjjErqST8sDY1q3qQq27Ob2qnX4X3ddzJ/mxntmblqKl
	zr9ykfvcSVaKqjdzEs/VZoMe195Rrqu0faoKKjFX/9SzKGeN+HyhGq9y0kA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1ud937-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7048088a6fdso6127916d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 15:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753309692; x=1753914492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzMAWZi234TOa1iw8DZ8oSKgpkGFxc2SxfIjqDIYDnc=;
        b=Q2623tF61iFhG2PC15pQ0oiHO2924xwyHTnvFYiwHpugo+QJ2B1jiR/+Tstc10fylN
         1dCxj9TOI056qPpVu3KbE52BNFu+T/0n5ostE2R0I3CpvcOzAmNyZ4ZUBYX7KceFVIMV
         WcOvHbCgPOmWGd5EGirVFWP4uCFVsiKK94/Wxj7IRltytm9e3JAd95zb8vfK1Xx/SkP+
         26/U2c/5yh36FGC2GIGIfX5o9/hwuAn4cK4qZFWh/sI2cDlwBMq8BPOduWTh7j/W67IG
         ckAYV12xBMmyEBFTKZTVQoDmPplo/KmQZmeM0SsSKGtCtGODgkDvx/CP5A1wDeKfRr6q
         CM8g==
X-Forwarded-Encrypted: i=1; AJvYcCUikWLiJmvCtD8T/c+2fERHONHkeQb9F8zRLLg9p1qgeuiitI4k1Ai702NHaaZh6ZmTe/Cl+D1qMl/T0uTw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Sk6iH0OAW4s2ZDOqnU3lDgEx4zMjRfMiNxWZAvQblzkEJYIO
	rTwO2Q2DP5M8LBmePWf2UXS1/JIlWVAywO/z1IWgBSSHqb8E8oLJSQBOwLCqXJdMh7DtTm0zsMf
	7xHIZrvnBr7FAUUop1E+yIQYbl4vC4skOdOIZYRqT8gXi2nB1s3aIHtpUnNJUEcVQmLPb
X-Gm-Gg: ASbGncuPuCUeVHwcMVYgM3AY+dvz2P+s31awplGPVFu4LIxDTfHnYIc2neIxla5GIFw
	2gGpKa/8MgBbWnmlKA9tCYiGuyvIrVqr09ud63UeZt6LwEuVKXoYsfmr0ZC/q5xjjK+yrdSqkZL
	XaIaYUqvFDFUcydcUTE8GOoBdokxkrwsemzfnClwvpNZHVL9ppFHs0uQcdYIrNsNnkSJW3fgwZ6
	5rGWhVaKj8K7B7ScxacZPzOpTwvwQsNT+jmltwiedfVwrdStbft4mkKb5xxfFDpDj7nUWHAXLZ5
	o/Qt5VEkSSwERIROssHOX1JfCHfcDKfEp4TTdrTjpLjcdbwDtkojqw==
X-Received: by 2002:ad4:5c4e:0:b0:702:b805:276b with SMTP id 6a1803df08f44-7070057686fmr69408296d6.20.1753309692055;
        Wed, 23 Jul 2025 15:28:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyWUlhS4LFAGc/+dCYOgVXZ2FICM4/uGAeN9BFF1rIG5uhfUvUMsWIZYEPZHPu6AVe+2WrWQ==
X-Received: by 2002:ad4:5c4e:0:b0:702:b805:276b with SMTP id 6a1803df08f44-7070057686fmr69408046d6.20.1753309691665;
        Wed, 23 Jul 2025 15:28:11 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcad23bsm248520f8f.44.2025.07.23.15.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 15:28:11 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 19/23] arm64: dts: qcom: msm8953: use dedicated elite-audio dtsi
Date: Wed, 23 Jul 2025 23:27:33 +0100
Message-ID: <20250723222737.35561-20-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=688161fd cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=NUy_n2JfxoLtk0-vLF8A:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5MyBTYWx0ZWRfX8hb+3VK7+oU8
 bIxHt5wqTVAUDZQh04p76nQm9oHegxl7eawC6/UiZ388bK0In0RUrYxrgtG24V8leo6ZyqGFClR
 6E1ZqpOhtfOdmTzkBxk3ss1F0DxPrtjNg/RVVee0+qzcvD8Y53rSk6NsgDW7uD7taFcNnJlxZgX
 h9h6uAGdIpoqNEnuFqatLp7mz+0XQQ0eCaDVQ7xc6B/NzBqXxfvDbdDgvNAm5PB/0DUwhb+TSMq
 lq2Aj4TDPYI5AUWdGMQPFYUo14YolSeIF8PAm8EW4aTW8ByEEMA8GujSGPExzjRWM7ikBSfl6YA
 OKHvUKjmRanN7MMzQn8Dxw38Hragpl+PNMWt6shKuUryBx0v0SxlPjBZ2ynQNwzc98f3t9aPp5N
 oGta5oFl533LCt4EI2EcAeMo2gUQjWugXoYaK7WFXq/kwYL2zTc6UafEhStNgIOjWfpCBj6d
X-Proofpoint-ORIG-GUID: R2tlt2rLi9YBZySGr9LMlz6LRIQIEMs1
X-Proofpoint-GUID: R2tlt2rLi9YBZySGr9LMlz6LRIQIEMs1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=681 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230193

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Make use of elite-audio.dtsi and remove the arp nodes from SoC dtsi.
This move removes duplication.
Also msm8953 SoC level dtsi has q6asm-dai definations that should be
part of the board level dts, so clean this up as part of this patch.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8953-audio.dtsi |  5 ++
 arch/arm64/boot/dts/qcom/msm8953.dtsi       | 78 +--------------------
 2 files changed, 6 insertions(+), 77 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8953-audio.dtsi

diff --git a/arch/arm64/boot/dts/qcom/msm8953-audio.dtsi b/arch/arm64/boot/dts/qcom/msm8953-audio.dtsi
new file mode 100644
index 000000000000..fe17bc28e825
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8953-audio.dtsi
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#include "elite-audio.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 273e79fb7569..aaf179c2eb53 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -2015,84 +2015,8 @@ smd-edge {
 				qcom,smd-edge = <1>;
 				qcom,remote-pid = <2>;
 
-				apr {
-					compatible = "qcom,apr-v2";
+				apr: apr {
 					qcom,smd-channels = "apr_audio_svc";
-					qcom,domain = <APR_DOMAIN_ADSP>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					q6core: service@3 {
-						reg = <APR_SVC_ADSP_CORE>;
-						compatible = "qcom,q6core";
-					};
-
-					q6afe: service@4 {
-						compatible = "qcom,q6afe";
-						reg = <APR_SVC_AFE>;
-						q6afedai: dais {
-							compatible = "qcom,q6afe-dais";
-							#address-cells = <1>;
-							#size-cells = <0>;
-							#sound-dai-cells = <1>;
-
-							dai@16 {
-								reg = <PRIMARY_MI2S_RX>;
-								qcom,sd-lines = <0 1>;
-							};
-							dai@20 {
-								reg = <TERTIARY_MI2S_TX>;
-								qcom,sd-lines = <0 1>;
-							};
-							dai@127 {
-								reg = <QUINARY_MI2S_RX>;
-								qcom,sd-lines = <0>;
-							};
-						};
-
-						q6afecc: clock-controller {
-							compatible = "qcom,q6afe-clocks";
-							#clock-cells = <2>;
-						};
-					};
-
-					q6asm: service@7 {
-						compatible = "qcom,q6asm";
-						reg = <APR_SVC_ASM>;
-						q6asmdai: dais {
-							compatible = "qcom,q6asm-dais";
-							#address-cells = <1>;
-							#size-cells = <0>;
-							#sound-dai-cells = <1>;
-
-							dai@0 {
-								reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
-								direction = <Q6ASM_DAI_RX>;
-							};
-							dai@1 {
-								reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
-								direction = <Q6ASM_DAI_TX>;
-							};
-							dai@2 {
-								reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
-								direction = <Q6ASM_DAI_RX>;
-							};
-							dai@3 {
-								reg = <MSM_FRONTEND_DAI_MULTIMEDIA4>;
-								direction = <Q6ASM_DAI_RX>;
-								is-compress-dai;
-							};
-						};
-					};
-
-					q6adm: service@8 {
-						compatible = "qcom,q6adm";
-						reg = <APR_SVC_ADM>;
-						q6routing: routing {
-							compatible = "qcom,q6adm-routing";
-							#sound-dai-cells = <0>;
-						};
-					};
 				};
 			};
 		};
-- 
2.50.0


