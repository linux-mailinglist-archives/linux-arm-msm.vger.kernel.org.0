Return-Path: <linux-arm-msm+bounces-96479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKa7BWqZr2lbawIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 05:09:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F091245257
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 05:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80661304F095
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22B33A785F;
	Tue, 10 Mar 2026 04:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VGxKFPZY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PfRBkzII"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5019E3C6A46
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773115717; cv=none; b=bG27RbP+M/kZNVu7IGrOynHyE+F1LNSlmh7L3FQ1iqntU1D/+9TcWVxFBKCePmHDAC3Su1v5qZMqlv1y1YI9kENvM2SL0xHUvJcHEeRUzTUnLHx3Kx3g6IzHvCMvVmhDkD3tdBFPFQJT6+t6FPQ7Ownx0w96coONkiHwl/oyEsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773115717; c=relaxed/simple;
	bh=P9s3h50N2DquJr7pozaTKWXlCMWFJrMhOTCcu89Ms4g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oKg+6C08zTE9YwtuL85lavP00vk/2CCxnvIwyKCbX7eztt3oWU118DaJTHC1I2lwAUOYhWUI/Qjzx8DNBUd1WZRhG3RW7zsrYpPGkklbdxEScAjnjRsf/t8OUH0bVu6/Ljn/EVjnyo8b4nXEJEqvOqI1nq/EtMSPzLlxVcBPG4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VGxKFPZY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PfRBkzII; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2ENHd2020557
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SK666/rm9G/
	ZqiycA8CRPRgTGGiOWM1qcx8cS/VavRg=; b=VGxKFPZYEVRYIMkTaiM1hJG+KjP
	MPqSGjNSq52yDWCJeiMootUCZEm/UTBRBXCpkgWUd9hFZ/GhfCJC0q14nyTD3bBY
	0ovXckVt8vNN3AnQCZcWsoY7CRffRc4S1rTo2lRw12opqSfAXynQPA94ueQgq5/l
	dfq1HrOcUNmnlFIg6iYZxCL2qA3AUd9ol6b5eFe1zP3YnsDmjvyMUIvy/XNhxIHz
	0hOKTskaBnFVPBRUZrGIqatPdlFkPEIk/avPqn6SUMq045v0CQ6MJ2IDDaIslVYx
	aDoIJm4jG4Sh85xx6/rNFUPnhlNeq9eENcMND7hHqWzbg1sUZQ3rQ6sH74g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbtg0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:08:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae57228f64so90214525ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 21:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773115714; x=1773720514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SK666/rm9G/ZqiycA8CRPRgTGGiOWM1qcx8cS/VavRg=;
        b=PfRBkzIIEzm5hVk56DK/C0znmF2orow7xC+z+WlCj6JYEum0ZuWU8wbXhwLG6YIyHx
         Lp5UiEftLZlFAf3sqcWzQ+0jmqOkULyYsNkroSi/6XAMWxOeqIRhn6JJOb3yg/Flqrgn
         IpuD3sk5i3o6gk18G2RVtZ4fQBs+Wgoxpe47HKCGojKIK+faRTRdZkeoQ1AHRP5r/+Bu
         Ds8TOsghQWjrBjvl3M+IJlSOciXLPQe4OpK00qbi3T5Xb24jN9CVgBkgQKxvjgJ0r7R7
         2tzt8IlHmKGkqCKA7bUZVb9jwhlw9Hau3FEZrJ/uJOwAUzfjScpw2zxB8k9cuS5X55hz
         sCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773115714; x=1773720514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SK666/rm9G/ZqiycA8CRPRgTGGiOWM1qcx8cS/VavRg=;
        b=veZTaS6v7VBwlM8VIAqo5TyZHUJCvXLtrdiJAZaFObS92fo2D+yHucNgn0gdvQnXmy
         Xg8IdO5BfOOR4H8ROq40WXsbKGRgT2i1x605imjB8X3X3RtQw0G9GxLEdzmfXrX6DB/1
         KfifCamhXza7NuvTgAGv1IAe83ai3+edxNuZWrfylCiTq5VeoU9HHiu1sKvxSNETx7F6
         7smc5Mz/SivRZO0fiqumwKE4Rmc5UbNCbX0fOWdOxk55d9xcPbR4mk13z6UqJfWchGxa
         W8YGsLu2YPMdPeJKt7qU9VrVBAOsyIKcYbfp30GDx9Xs22NoacP8hbui+k7+c7MnJa3H
         SNoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/UVpyrxUHS0BoPeGZ4/Hhq/dlL9OKk+/Q3u7arQ8FP2reIJ9q5yE284Bb59IXgOFFmse32ab6gDYtI/Rg@vger.kernel.org
X-Gm-Message-State: AOJu0YxqbJ4LdofV8ew6bgmlRtzgdiiWG5Onfv6e+uvdoWMHbu1pENaW
	GNJODlEmerZeQIE4Eu3mfQlZtOM9qEItHEt4avQmJ3yVNi/W6RGoZmkJ9xeEOITv2uo860ZkBjh
	AtEOsQgvuoxoAkYrjGqcxIS07KbtgxKMx8RilWkJRQs5/xh1Bh43SK2wXLfCXIL7FHv8a
X-Gm-Gg: ATEYQzx5CJPO/SmhNRpz9vXZxG9C5ei4jonJK9RiEz5soOxHIbHwzYZeD7GLZY68bSN
	Sa39y8tdNvD1UcaSigHi5dtRDMEVhrshI9zSHQsTh8+RgLCfx/1g4Fj9xoBAB+laXEOnTWH/daQ
	X2Qvf35WPHRnSvXKbaIA8pLxzttcB484lcReXeM0RjP+kMhwlpMRjCmSlVL/PLC8y2W1K2kjGUz
	wm6uOt9JR7yai2kEfA/0kEGLzSNUJMiKPbGjSs/EWdewi/LRxBdIjyB36Jy0i6EJNCmzg0tBIkp
	Li+BQGAp1vvu8fws6lxmiWW0mKTd2hKrf4dPLNOjrUJIAQTurp9SaKFcewDXKnWsheRivyy+jTL
	psZJdh6iyo9hEOiE3n5CCis1Ilt1GRX4lUjkx2NMAFmGsgtn9pc1EQ9AN8OMsiVnz880eB8VTIP
	qHS3AxCyujLpZfegmmKwD6HSIw6h51ladeobd4
X-Received: by 2002:a17:903:1988:b0:2ab:2633:d981 with SMTP id d9443c01a7336-2ae82433dccmr130308165ad.32.1773115714167;
        Mon, 09 Mar 2026 21:08:34 -0700 (PDT)
X-Received: by 2002:a17:903:1988:b0:2ab:2633:d981 with SMTP id d9443c01a7336-2ae82433dccmr130307815ad.32.1773115713671;
        Mon, 09 Mar 2026 21:08:33 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aea4eed00fsm9797975ad.80.2026.03.09.21.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 21:08:33 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: sudeep.holla@kernel.org, angelogioacchino.delregno@collabora.com,
        viresh.kumar@linaro.org, neil.armstrong@linaro.org, festevam@gmail.com,
        Frank.Li@nxp.com, danila@jiaxyga.com, lpieralisi@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, tengfei.fan@oss.qualcomm.com,
        jingyi.wang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH 2/3] arm64: dts: qcom: glymur: Fix deprecated cpu compatibles
Date: Tue, 10 Mar 2026 09:37:50 +0530
Message-Id: <20260310040751.3132523-3-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310040751.3132523-1-sibi.sankar@oss.qualcomm.com>
References: <20260310040751.3132523-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69af9943 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ISJSzXulsw8YtW9LTRMA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAzMSBTYWx0ZWRfX3kyr3uDaicgZ
 aUDtZxn7T5K9bmRt0ZTgIvdIOXgRfw72XVN5D/B3bOxz576Ko2a0WHTJmFaDc5A3zHnUj9Q+/LY
 O8vKIefM1o0r36zT9EKkCdvTuVwm5P4AvmIjTXvy3zQ1Xw0b0VzJqC/WQc0hj15zRuVToSHKN6e
 xpKJ68SpAB+dT/uTcWX9/XMhUYfWc0FBvsTJilBbFUkOt8kHBC2laU0rQZFdJZHs/3+0mSVqcg5
 jcFyqirXJxGAXIrZHL04Q7wTckLWZsqJXQROWxRoYY3LNOvXJdRnXToVsy9EkWr5zNlYHjkXJf6
 5RnWajD4WvEJtKGlxWQmaAbcjCvkxIDbiR0RYAMQYh0qiNi5ZuwQzHJ1pi/xmf7iKYmEZbIYSf7
 IXyOuyB8vM2iBLEy001gQku8q6v4LGgr+hBnGpxOf1XzraEoA+UK5gHSxvw76cQBLlL1rPUFGjF
 LNP+Cb0v8Fg33Y2cVHw==
X-Proofpoint-GUID: DJ_6bEvp-D4MxSgrARRIMN8K5F6i76GO
X-Proofpoint-ORIG-GUID: DJ_6bEvp-D4MxSgrARRIMN8K5F6i76GO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100031
X-Rspamd-Queue-Id: 9F091245257
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,linaro.org,gmail.com,nxp.com,jiaxyga.com,oss.qualcomm.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96479-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The generic Qualcomm Oryon CPU compatible used by the Glymur
SoC is deprecated and incorrect since it uses a single compatible
to describe two different core variants. It is now replaced with
two different core-specific compatibles based on MIDR part and
variant number.

CPUS 0-5:
MIDR_EL1[PART_NUM] - 0x2
MIDR_EL1[VARIANT] - 0x2

CPUS 6-17:
MIDR_EL1[PART_NUM] - 0x2
MIDR_EL1[VARIANT] - 0x1

Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 36 ++++++++++++++--------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index e269cec7942c..5de4b2801321 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -33,7 +33,7 @@ cpus {
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
-			compatible = "qcom,oryon";
+			compatible = "qcom,oryon-2-2";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			power-domains = <&cpu_pd0>, <&scmi_perf 0>;
@@ -49,7 +49,7 @@ l2_0: l2-cache {
 
 		cpu1: cpu@100 {
 			device_type = "cpu";
-			compatible = "qcom,oryon";
+			compatible = "qcom,oryon-2-2";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
 			power-domains = <&cpu_pd1>, <&scmi_perf 0>;
@@ -59,7 +59,7 @@ cpu1: cpu@100 {
 
 		cpu2: cpu@200 {
 			device_type = "cpu";
-			compatible = "qcom,oryon";
+			compatible = "qcom,oryon-2-2";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
 			power-domains = <&cpu_pd2>, <&scmi_perf 0>;
@@ -69,7 +69,7 @@ cpu2: cpu@200 {
 
 		cpu3: cpu@300 {
 			device_type = "cpu";
-			compatible = "qcom,oryon";
+			compatible = "qcom,oryon-2-2";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
 			power-domains = <&cpu_pd3>, <&scmi_perf 0>;
@@ -79,7 +79,7 @@ cpu3: cpu@300 {
 
 		cpu4: cpu@400 {
 			device_type = "cpu";
-			compatible = "qcom,oryon";
+			compatible = "qcom,oryon-2-2";
 			reg = <0x0 0x400>;
 			enable-method = "psci";
 			power-domains = <&cpu_pd4>, <&scmi_perf 0>;
@@ -89,7 +89,7 @@ cpu4: cpu@400 {
 
 		cpu5: cpu@500 {
 			device_type = "cpu";
-			compatible = "qcom,oryon";
+			compatible = "qcom,oryon-2-2";
 			reg = <0x0 0x500>;
 			enable-method = "psci";
 			power-domains = <&cpu_pd5>, <&scmi_perf 0>;
@@ -99,7 +99,7 @@ cpu5: cpu@500 {
 
 		cpu6: cpu@10000 {
 			device_type = "cpu";
-			compatible = "qcom,oryon";
+			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x10000>;
 			enable-method = "psci";
 			power-domains = <&cpu_pd6>, <&scmi_perf 1>;
@@ -115,7 +115,7 @@ l2_1: l2-cache {
 
 		cpu7: cpu@10100 {
 			device_type = "cpu";
-			compatible = "qcom,oryon";
+			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x10100>;
 			enable-method = "psci";
 			power-domains = <&cpu_pd7>, <&scmi_perf 1>;
@@ -125,7 +125,7 @@ cpu7: cpu@10100 {
 
 		cpu8: cpu@10200 {
 			device_type = "cpu";
-			compatible = "qcom,oryon";
+			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x10200>;
 			enable-method = "psci";
 			power-domains = <&cpu_pd8>, <&scmi_perf 1>;
@@ -135,7 +135,7 @@ cpu8: cpu@10200 {
 
 		cpu9: cpu@10300 {
 			device_type = "cpu";
-			compatible = "qcom,oryon";
+			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x10300>;
 			enable-method = "psci";
 			power-domains = <&cpu_pd9>, <&scmi_perf 1>;
@@ -145,7 +145,7 @@ cpu9: cpu@10300 {
 
 		cpu10: cpu@10400 {
 			device_type = "cpu";
-			compatible = "qcom,oryon";
+			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x10400>;
 			enable-method = "psci";
 			power-domains = <&cpu_pd10>, <&scmi_perf 1>;
@@ -155,7 +155,7 @@ cpu10: cpu@10400 {
 
 		cpu11: cpu@10500 {
 			device_type = "cpu";
-			compatible = "qcom,oryon";
+			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x10500>;
 			enable-method = "psci";
 			power-domains = <&cpu_pd11>, <&scmi_perf 1>;
@@ -165,7 +165,7 @@ cpu11: cpu@10500 {
 
 		cpu12: cpu@20000 {
 			device_type = "cpu";
-			compatible = "qcom,oryon";
+			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x20000>;
 			enable-method = "psci";
 			power-domains = <&cpu_pd12>, <&scmi_perf 2>;
@@ -181,7 +181,7 @@ l2_2: l2-cache {
 
 		cpu13: cpu@20100 {
 			device_type = "cpu";
-			compatible = "qcom,oryon";
+			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x20100>;
 			enable-method = "psci";
 			power-domains = <&cpu_pd13>, <&scmi_perf 2>;
@@ -191,7 +191,7 @@ cpu13: cpu@20100 {
 
 		cpu14: cpu@20200 {
 			device_type = "cpu";
-			compatible = "qcom,oryon";
+			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x20200>;
 			enable-method = "psci";
 			power-domains = <&cpu_pd14>, <&scmi_perf 2>;
@@ -201,7 +201,7 @@ cpu14: cpu@20200 {
 
 		cpu15: cpu@20300 {
 			device_type = "cpu";
-			compatible = "qcom,oryon";
+			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x20300>;
 			enable-method = "psci";
 			power-domains = <&cpu_pd15>, <&scmi_perf 2>;
@@ -211,7 +211,7 @@ cpu15: cpu@20300 {
 
 		cpu16: cpu@20400 {
 			device_type = "cpu";
-			compatible = "qcom,oryon";
+			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x20400>;
 			enable-method = "psci";
 			power-domains = <&cpu_pd16>, <&scmi_perf 2>;
@@ -221,7 +221,7 @@ cpu16: cpu@20400 {
 
 		cpu17: cpu@20500 {
 			device_type = "cpu";
-			compatible = "qcom,oryon";
+			compatible = "qcom,oryon-2-1";
 			reg = <0x0 0x20500>;
 			enable-method = "psci";
 			power-domains = <&cpu_pd17>, <&scmi_perf 2>;
-- 
2.34.1


