Return-Path: <linux-arm-msm+bounces-102570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGYODzhq2GkhdAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 05:10:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C945F3D1B9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 05:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C1E63044673
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 03:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406C431E838;
	Fri, 10 Apr 2026 03:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FOBY/ZxH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dPz0bjXD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD76318EC5
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775790575; cv=none; b=DZTssdW+zaWJAOkcOOCo1MmhvspdfwgwMVvBUGkzSuZmSqMxRF/RSC9ND+UVKZJcLgVSQga8J4m71HkcXZV3csFHMCLmZ/zp9eGC+0Ep6gA1RP5gzD4LskGTArJQgGBt7Z1CNKO/1J06ZXsVHGgsW7EEZ5rcrDBQp8htkPRNh+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775790575; c=relaxed/simple;
	bh=XMWO73Zot8bioBj1vtYtNgXBcxafZXLSmfZRqOOw4to=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ksPtOSKd4yxwMR9Xd1RT8OkD2/pBRHZql6wTIudNErOpB5oNJta3ms4MzqQG7XESBREnr6cUEq7If2k4D9NhyQ+GyzBR0tiR4FuBGT/A8+nVRozqz+3vkhy8icIxY5+jV7gv/CZ/0DTAKT1KL7FsBHOCCg8GH4eK7NbnjwLFQGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FOBY/ZxH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dPz0bjXD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639IEbQo3352631
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rhaPy8hUFxkAAthFXlrA+ivrwCq5DM7Rh5QVygs4MqQ=; b=FOBY/ZxHBA3Ue9vB
	D2S8Zpa7dDbDcK3fjhMFsgsyWPIjXtwBVj0rPY/NEfDK7MLceFKLFKQoGCp8yne7
	6fYTFvQVkyHmFIHOVeSwKqlzrnJ6ALdVRUpAfinQ2mR8hpUijwqIROuXg8dFS053
	ceWmKRVH9LXa5hNv3arRn+fqMW35ctfPW3LI9lKAVZsqA7S9B65uSfMVyPL/wT2O
	t53WkjJPc57C9jw36jQ2SKn4qTDyUpKzDewXsyIhzQ/+qAV0P4Gl6C87+PVIoZ5+
	Et+9icnnt3XNevmv0ARvIWo9ejHVe9Z98ceGLnL3TOeTDzuikTprrrnIBZHK6TI+
	3m3ttg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec1qtq75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:09:32 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c70f19f0f37so782990a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 20:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775790572; x=1776395372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhaPy8hUFxkAAthFXlrA+ivrwCq5DM7Rh5QVygs4MqQ=;
        b=dPz0bjXDUK5EmptjzBLiFtTesBQAyIgSbM8dYBRjxj4DUNqyB0brURODz7ctEH3Wr0
         CC2qIgFBABw5FKH1WL2Kn84xUKLs7scoSllBwUNDs1z31xoKhKJxYpy1fEFqetZ57JSX
         isuANCaOhkfx42G10gMcbmog5ybM2gjL3Ae7rleKwSF4KrxAHvwPW+HZQfpLfVYfuWFY
         0qPAKBjcbkvly/PM2Mx90v+OGZXG4mrBSWRhUKy187XgBp0JU+xinbs001L9oajF2Tuv
         QfLlghzvwPc1E2n2BsvZS6+0pmuH7h4eYOkSKc5DVaepE6ZdnQcjLfPeG7GwgYFQG6kN
         +INw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775790572; x=1776395372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rhaPy8hUFxkAAthFXlrA+ivrwCq5DM7Rh5QVygs4MqQ=;
        b=C73TFEqZjVVAM7A6Tmo18jeqacv0grn3mtclDOL/acIT76WeG6Jc1yWnFyiPLAuxQ9
         CXP3xbqVE216myuv0qP8LLIOp5fBDNuDyCoT3UcTvVkfG5OkRv+gSFuGYskIv8nR1bZc
         ZuFSSV52tm2orVa30jFs5CS05huPQeeAyaqbYbZPzLDMRB8Es3JDuGsxuHErKMXHJSZ4
         AVi2gkDhN6qpal7AdMeiBRKS23O4sNqg1vZHOt4yAIforctMEqzrmmP/fv8VaEuR9h24
         7olZg9k+tHooXTEzbkdATsvHw8/Vg/Iw9lAbQbSlAkFeFjcSefuFrEjTwH5NtluoTtyt
         Hurw==
X-Gm-Message-State: AOJu0YyJ1O1qfYuepE8LynTyy7x6KsJmSiZESgbb71b6cEPMvETka6Zq
	KIL8vBo4Z8lhaVoojWogeWAZ86BCR8zj1ML6bzXtoqW6BH4OSv3zVzQsKtN21uvRqqsqTOABUa5
	aID9vW8u5zUMpToHNS74tRQOkJgw027h/YjAxSaNRcByK16EFBAx+hLGi6tOrGTuTWQS6vvxO3U
	ekOvk=
X-Gm-Gg: AeBDieuLXgJSQWN2dMZtOP6zzGFyPtyRDTbB1R/gKeX8XKRtM2gUugo9hzskBZKp8aV
	04qGdcFJF4hhGRvfICHiXRTcQp07G+fUSwMHiGuEn4nQ/U2hbCIsagW/jgQNzIO7su845c7y/Fa
	BbQ42UDSe6Yp/5DN/9GKspy/RrEX0ab61Hdb3Aui5BgrThWcEYmz9Vf8bW1r3O3G0CG76ThnMkg
	zz4TDKTLWmQx+bGoccxIwT2qqR4mjKhaCgL+574Pp9gx0PHXfPJq9VsMjvfhV4YGMnEQTokKxbP
	fSd1/0IS1D71YHfaGLQA1ppHSMrjXDbv7rfMZQXTnMAuxCilzj+SHSGvB1qt9AdLdEoi9VC7sKU
	XqkFbTjzqr2fT2dbIV342YBcYO7Fb1BE37kQ45N/e+F9RsAlRCs3vkJH8wGfEy/3nJy9FfeTP8k
	3M9f8erNHi
X-Received: by 2002:a05:6a20:918c:b0:39f:441:492f with SMTP id adf61e73a8af0-39fe440eb9bmr1217493637.1.1775790571697;
        Thu, 09 Apr 2026 20:09:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:918c:b0:39f:441:492f with SMTP id adf61e73a8af0-39fe440eb9bmr1217458637.1.1775790571168;
        Thu, 09 Apr 2026 20:09:31 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50cd34sm987452b3a.54.2026.04.09.20.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 20:09:30 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:08:47 +0800
Subject: [PATCH 4/7] arm64: dts: qcom: kodiak: Add label properties to
 CoreSight devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-add-label-to-coresight-device-v1-4-d71a6759dbc2@oss.qualcomm.com>
References: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
In-Reply-To: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775790553; l=2756;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=XMWO73Zot8bioBj1vtYtNgXBcxafZXLSmfZRqOOw4to=;
 b=GTLSVG5nQ8wwWbHUc4ipSXz2ysgMMRSO5eLYdPyFmlqIBt9zHo6KTRFFzgnYmBdraoAUO+cyx
 1oqFY3mMZ9BBz5ToNx52zneM/JoXD0mIzSzyol9OGGJfesbN5TrQWWh
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAyNiBTYWx0ZWRfX9KSDBCokyQ9W
 OVfPL6mIIIKVb9CmWyS5B0dVKURu93SAJ2CegtKDKVBPOyCEGhZzomYU8cWpgWK9w4rMxEdQzJi
 7IvlU74ga/ydt2kRnxZaKEd7gzwtU+wf1fPGcd1j5AIhSvpRPt6b1dS1Y9G+Aw+/Jt5L6lM/bJw
 bCATXFJGg0v+T3XJBwYAjV6gAOCbc5KBLHQaFjvvgCMGaFzr/h1M974RxfH8fcD5nCfyAWafngN
 caaIrG4bptiicI1X/WcdGfCI4tQ6WSYkWNsea6b0qshVVScSRRw4lKmt0CvAOdKWJ8vLKbAckwQ
 WHziNZtW5U4c6r8Gr4BgY0xR7x2va40vB6lkFAummumus6PblUCNY38De8q3k9dBzs6m9bpRhWl
 JWbG47zbr/nl5UYeoBBohdL1YKy0DK5clOuUKdwj9kFqjucFoMMGKUjHh2ebOH4TA13qCQYnl0Z
 hb12L+BadjYOklMEIBA==
X-Authority-Analysis: v=2.4 cv=eOcjSnp1 c=1 sm=1 tr=0 ts=69d869ec cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Ft2vuo7JNPNZdQlk6TEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: Lai4CaOeI4lJDp8bYhoo5-BR5HqS-D1F
X-Proofpoint-ORIG-GUID: Lai4CaOeI4lJDp8bYhoo5-BR5HqS-D1F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100026
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102570-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C945F3D1B9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add label properties to TPDM and CTI nodes in the kodiak device tree to
provide human-readable identifiers for each CoreSight device. These
labels allow userspace tools and the CoreSight framework to identify
devices by name rather than by base address.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 988ca5f7c8a0..3a2c28752e31 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -3513,6 +3513,7 @@ tpdm@600f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_spdm";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -3532,6 +3533,7 @@ cti@6010000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss";
 		};
 
 		funnel@6041000 {
@@ -3681,6 +3683,7 @@ cti@6b00000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao";
 		};
 
 		cti@6b01000 {
@@ -3689,6 +3692,7 @@ cti@6b01000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao_1";
 		};
 
 		cti@6b02000 {
@@ -3697,6 +3701,7 @@ cti@6b02000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao_2";
 		};
 
 		cti@6b03000 {
@@ -3705,6 +3710,7 @@ cti@6b03000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao_3";
 		};
 
 		funnel@6b04000 {
@@ -3859,6 +3865,7 @@ tpdm@6b09000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_0";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3878,6 +3885,7 @@ tpdm@6b0a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_1";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3897,6 +3905,7 @@ tpdm@6b0b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_2";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3916,6 +3925,7 @@ tpdm@6b0c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_3";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3935,6 +3945,7 @@ tpdm@6b0d000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_1";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3954,6 +3965,7 @@ cti@6b11000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_aoss";
 		};
 
 		etm@7040000 {

-- 
2.34.1


