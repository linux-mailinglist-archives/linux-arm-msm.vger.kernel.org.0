Return-Path: <linux-arm-msm+bounces-104771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJOmBqmY72mLDAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:11:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1E9476DDC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B4AD430087D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA82834C98C;
	Mon, 27 Apr 2026 17:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RVw5UNdg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="frMlwUbo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1F93DCDB2
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777309520; cv=none; b=ePsoGIfakxXWlmJRkaYsrJ8GNJAD38ElhtwenTJtEAzQm5og5WjoVxrmnwkIJiK2pmyFcNupuS5lENOKuPsIsvvu3B6pWrrL7xPVtdWAd5AqoCjnJXJ2jFiHeXhWbOrW+fgjD8I+ErcWmAECajO8f0GL78lJi+dKuczdwHaXzjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777309520; c=relaxed/simple;
	bh=Pxs6TvCiWB1lclDikjkVEgwp4wfuL4sI+9FNS6TIgz4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gKUMXuvNNcGGrIEdO3MVvUg4Ibxwuf0pHBgizyWM1ta3bTlUxyZBOOX8oqk61jsSVCo5xXIWrwCElIU4pOMaDrEEPiM1VFg9c0PR0XXd99iWFormWegTcYSoIvyhNxfb2kD8R0Mi4Pe25SwZeV0qfB8b+GRMXS5rxA3QlUfb0/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RVw5UNdg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=frMlwUbo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDm1jt665666
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HKoHw8eDH/l
	flkddWt/ea5hWynNE/kZX92C7G/ZMMwM=; b=RVw5UNdgDHa+oMkBsVZONAk5Us5
	S+6pmX9zzfWCgcj9YcqarsmuPd+D+GDzm3mZ3Yr+uwTJCqa2qRr3i/UU2qFotYVp
	HQl5D4laeYvFQHMWal+0YfA4p8JpyVrLfoGCbFrG6YPHVj3DJ7Hy7x09xx07coKF
	AqoxE8VupZybxKMt+gbgm1NySUxqxhxvjrTatZHmx887nXqE0kPAAW5nxoFgxmNY
	POz4tHQril/JP+nXhbAJWmn5+kyeMiJnEvMHZiYw6lXIwf+QrAmIE8Mn+owV+JiX
	2/XT8M36hL1HDXftJrugf1Tlm04YcCg5+UgFtmmRBgC829MvpGeEvqUiTJQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n2dw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:05:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3586513febcso4610294a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777309517; x=1777914317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKoHw8eDH/lflkddWt/ea5hWynNE/kZX92C7G/ZMMwM=;
        b=frMlwUboCYV+3fgqle0YLCbitzGddSJktosJbK9G2jODYFVVhqcwAko1qokUFfTVj1
         5SqV6Dq8KE0ClpGJVc7Asr1USZmfqe77nQqLGCDwIsReXFWX+kOdGTB2Zb5IuzFIUL0f
         CJoPvrZOltJpco89IenT84+eK+qmIH/G+0Tne5jetF0tkHfY7/BBA23AFhnZQQQACgIC
         UQEjVSa/u0MIT6LfE3Auk4QxtIWLHkud1k4LUJCoxr2IIK8jNUGgWmprc6mE96DsPZR7
         NfUSmFytY6xuVQbzhm6naBOMgYvIvrngIh9MeBAeXHGRaPOZHViFIaWk6khuSL0IR21a
         BAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777309517; x=1777914317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HKoHw8eDH/lflkddWt/ea5hWynNE/kZX92C7G/ZMMwM=;
        b=WMwhIHLmjbHMMHUzj/vLSs0JOzj8KT8zIwCzq9yJG9z427NTsx+qHHvlaOskASv07y
         fuBi7oWvVRyUw4H9lJ8xrRi4OdXZyb38Ib8IEbP1XyPalOe6hWTciumDARZeiGKTTbfI
         jfxluhhZMgwx60SV//mrJPr20UEJzzY8jGYuuTvg6FlKNfkdq0BbceOvTE9w8oGu5Tr6
         0/5WqGJxciZxKPzEAP99vJ+Q6df2z4vas1kZomQY7BKL4G++qN2TdC30icwhEaocRSK/
         zijbQkc/3PoBTgrsczNYaCVWTrrqMWrrsWHg3BGmuibsy3dCzmiWVz2Jfhb1/g+HIdiR
         J/Rw==
X-Gm-Message-State: AOJu0Yx2rKK4I5+1NrLyMgyfyAVkVr0JMWywvtv3iQrlv6UYR2HcSsDq
	Pt76cXguwkuxATcpshs9XmqmeXp1onmAjkK8j45WieoAcJMkjvPgdMUOh1C/hckHhmv/ZzXWmlQ
	84WUFCT+aN30u6wJ7LvUR4qjKjFNhA2l2VGU5oos3VS1nb/EqFK2RFW9200imxIcHgSfO
X-Gm-Gg: AeBDieveGmoUqUYnA96wo8tlkqXzmcQ8EFDaPDpA/niyDQ2VRaHQ+m9BynxEod3lbJ/
	qsaTB89EFGfWpdO1cx/TNhDsyxlbUeV0yZZmNWuhnf31AqoiGWYFULIQ7a9Me+YmJVkXIpwMUux
	fTQmO8Wakubp0zehU5h0Qh6V+sQwT2qjwWIG6MMPbeEFAhyE/Et1/qRbBDVIB0HwNoAE/5y64f+
	LwVesLa3Nv5UGWXXof0UlkWZvqy89xSuJmRDrbPoaVIo689JIAVmI0kBQj8s/zLW8P5X9SODd2m
	2D/ZBsbQiKrj7r7U00XueffgaPcRrrRWWxCITpiRjpVKrnqgOjwPcRU9VfgKSrOzSWgtBaRIx6t
	FUykr6saZyT0fZhiNNyQPepF8/H5yeXawhlqLwx/VEiF9We6rjKW5Qz9Oq2+8i9Q=
X-Received: by 2002:a17:90b:1fc7:b0:35f:27d0:23b5 with SMTP id 98e67ed59e1d1-3614047a9c8mr25569226a91.5.1777309515491;
        Mon, 27 Apr 2026 10:05:15 -0700 (PDT)
X-Received: by 2002:a17:90b:1fc7:b0:35f:27d0:23b5 with SMTP id 98e67ed59e1d1-3614047a9c8mr25569177a91.5.1777309514649;
        Mon, 27 Apr 2026 10:05:14 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490025d98sm99313a91.4.2026.04.27.10.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:05:14 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com
Subject: [PATCH v4 1/4] arm64: dts: qcom: monaco-evk: Extract common EVK hardware into shared dtsi
Date: Mon, 27 Apr 2026 22:35:02 +0530
Message-Id: <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4MSBTYWx0ZWRfX5J/knXLpLURX
 K8dl+1cMo1ViWvrcvm75Mag0g2smXwSAFd9PYMwC1/N79xt9jaDRMkkeVOwd0o666AjhGbB/naC
 VDeSafRSfrCgaDn/7A7tFPzEk8Qw3CErWVmMknYsW63evaKgNB1+hx6SI4+t1r0uz6fRELh/6J9
 yBZ1mEzn2uUzzvlQN3XWN4n+wtUbjaR4J+KJXRzLGvQB3LeJGlzy/hN+2O9t0Wbd1IMbYNtiNy0
 D+KQuI6I77/bkuA7c8MV2R99QKvcaacPgt1mO+Qr99FQKPOTZpiVKLAjRFzZGkvRbi9cOmIwtoX
 iNVWn7tPA4Xw+/YxUIuxYPvTQ/AZ5bmbROiwUJaq2Vnrg892e2PIfZnEeLOuSHLR2bil04AX0/X
 tbaVzve/Ck9MXOmx5dBNUF70tZuerd8LTVET74UpelYIhhnwN89Ht/Q7lE64xsb8YH1urUMZNWn
 Xnz7XOh2vjyRXK9khYA==
X-Proofpoint-GUID: olywYzSEkOuug9FiI3CeKD1cMPHxyp7z
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef974d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=m4GvGgdk-pu3HkIto4AA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: olywYzSEkOuug9FiI3CeKD1cMPHxyp7z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270181
X-Rspamd-Queue-Id: 8E1E9476DDC
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104771-lists,linux-arm-msm=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.454];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	PRECEDENCE_BULK(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.232.135.74:c];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Spam: Yes

The monaco-ac EVK is a new board variant which shares the majority of
its hardware description with the existing monaco-evk board.

In preparation for adding this variant, extract the common hardware
nodes from monaco-evk.dts into a new shared monaco-evk-common.dtsi
include file, and update monaco-evk.dts to include it and keep only
board-specific overrides.

No functional change intended.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 .../boot/dts/qcom/monaco-evk-common.dtsi      | 900 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts       | 894 +----------------
 2 files changed, 901 insertions(+), 893 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi b/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi
new file mode 100644
index 000000000000..12c847c03757
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi
@@ -0,0 +1,900 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pwm/pwm.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "monaco.dtsi"
+#include "monaco-pmics.dtsi"
+
+/ {
+	aliases {
+		ethernet0 = &ethernet0;
+		i2c1 = &i2c1;
+		serial0 = &uart7;
+		serial2 = &uart6;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	connector-2 {
+		compatible = "gpio-usb-b-connector", "usb-b-connector";
+		label = "micro-USB";
+		type = "micro";
+
+		id-gpios = <&pmm8620au_0_gpios 9 GPIO_ACTIVE_HIGH>;
+		vbus-gpios = <&expander6 7 GPIO_ACTIVE_HIGH>;
+		vbus-supply = <&usb2_vbus>;
+
+		pinctrl-0 = <&usb2_id>;
+		pinctrl-names = "default";
+
+		port {
+			usb2_con_hs_ep: endpoint {
+				remote-endpoint = <&usb_2_dwc3_hs>;
+			};
+		};
+	};
+
+	dmic: audio-codec-0 {
+		compatible = "dmic-codec";
+		#sound-dai-cells = <0>;
+		num-channels = <1>;
+	};
+
+	max98357a: audio-codec-1 {
+		compatible = "maxim,max98357a";
+		#sound-dai-cells = <0>;
+	};
+
+	dp-connector-0 {
+		compatible = "dp-connector";
+		label = "DP0";
+		type = "mini";
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&lt8713sx_dp0_out>;
+			};
+		};
+	};
+
+	dp-connector-1 {
+		compatible = "dp-connector";
+		label = "DP1";
+		type = "mini";
+
+		port {
+			dp1_connector_in: endpoint {
+				remote-endpoint = <&lt8713sx_dp1_out>;
+			};
+		};
+	};
+
+	usb2_vbus: regulator-usb2-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2_vbus";
+		gpio = <&pmm8650au_1_gpios 7 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+	};
+
+	sound {
+		compatible = "qcom,qcs8275-sndcard";
+		model = "MONACO-EVK";
+
+		pinctrl-0 = <&hs0_mi2s_active>, <&mi2s1_active>;
+		pinctrl-names = "default";
+
+		hs0-mi2s-playback-dai-link {
+			link-name = "HS0 MI2S Playback";
+
+			codec {
+				sound-dai = <&max98357a>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		sec-mi2s-capture-dai-link {
+			link-name = "Secondary MI2S Capture";
+
+			codec {
+				sound-dai = <&dmic>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai SECONDARY_MI2S_TX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	vreg_cam0_2p8: vreg-cam0-2p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam0_2p8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		startup-delay-us = <10000>;
+
+		gpio = <&tlmm 73 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam0_avdd_2v8_en_default>;
+		pinctrl-names = "default";
+	};
+
+	vreg_cam1_2p8: vreg-cam1-2p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam1_2p8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		startup-delay-us = <10000>;
+
+		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam1_avdd_2v8_en_default>;
+		pinctrl-names = "default";
+	};
+
+	vreg_cam2_2p8: vreg-cam2-2p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam2_2p8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		startup-delay-us = <10000>;
+
+		gpio = <&tlmm 75 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam2_avdd_2v8_en_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vreg_l3a: ldo3 {
+			regulator-name = "vreg_l3a";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4a: ldo4 {
+			regulator-name = "vreg_l4a";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a: ldo5 {
+			regulator-name = "vreg_l5a";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a: ldo6 {
+			regulator-name = "vreg_l6a";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a: ldo7 {
+			regulator-name = "vreg_l7a";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a: ldo8 {
+			regulator-name = "vreg_l8a";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9a: ldo9 {
+			regulator-name = "vreg_l9a";
+			regulator-min-microvolt = <2970000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vreg_s5c: smps5 {
+			regulator-name = "vreg_s5c";
+			regulator-min-microvolt = <1104000>;
+			regulator-max-microvolt = <1104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1c: ldo1 {
+			regulator-name = "vreg_l1c";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <512000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c: ldo2 {
+			regulator-name = "vreg_l2c";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c: ldo4 {
+			regulator-name = "vreg_l4c";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7c: ldo7 {
+			regulator-name = "vreg_l7c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8c: ldo8 {
+			regulator-name = "vreg_l8c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9c: ldo9 {
+			regulator-name = "vreg_l9c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&ethernet0 {
+	phy-mode = "2500base-x";
+	phy-handle = <&hsgmii_phy0>;
+
+	pinctrl-0 = <&ethernet0_default>;
+	pinctrl-names = "default";
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+	nvmem-cells = <&mac_addr0>;
+	nvmem-cell-names = "mac-address";
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hsgmii_phy0: ethernet-phy@1c {
+			compatible = "ethernet-phy-id004d.d101";
+			reg = <0x1c>;
+			reset-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcs8300/a623_zap.mbn";
+};
+
+&i2c0 {
+	status = "okay";
+
+	bridge@4f {
+		compatible = "lontium,lt8713sx";
+		reg = <0x4f>;
+		reset-gpios = <&expander5 6 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt8713sx_dp_in: endpoint {
+					remote-endpoint = <&mdss_dp0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lt8713sx_dp0_out: endpoint {
+					remote-endpoint = <&dp0_connector_in>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt8713sx_dp1_out: endpoint {
+					remote-endpoint = <&dp1_connector_in>;
+				};
+			};
+		};
+	};
+};
+
+&i2c1 {
+	pinctrl-0 = <&qup_i2c1_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	fan_controller: fan@18 {
+		compatible = "ti,amc6821";
+		reg = <0x18>;
+		#pwm-cells = <2>;
+
+		fan {
+			pwms = <&fan_controller 40000 PWM_POLARITY_INVERTED>;
+		};
+	};
+
+	eeprom0: eeprom@50 {
+		compatible = "atmel,24c256";
+		reg = <0x50>;
+		pagesize = <64>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			mac_addr0: mac-addr@0 {
+				reg = <0x0 0x6>;
+			};
+		};
+	};
+};
+
+&i2c15 {
+	pinctrl-0 = <&qup_i2c15_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	expander0: gpio@38 {
+		compatible = "ti,tca9538";
+		reg = <0x38>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 56 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander0_int>;
+		pinctrl-names = "default";
+	};
+
+	expander1: gpio@39 {
+		compatible = "ti,tca9538";
+		reg = <0x39>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 16 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander1_int>;
+		pinctrl-names = "default";
+	};
+
+	expander2: gpio@3a {
+		compatible = "ti,tca9538";
+		reg = <0x3a>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 95 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander2_int>;
+		pinctrl-names = "default";
+	};
+
+	expander3: gpio@3b {
+		compatible = "ti,tca9538";
+		reg = <0x3b>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 24 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander3_int>;
+		pinctrl-names = "default";
+	};
+
+	expander4: gpio@3c {
+		compatible = "ti,tca9538";
+		reg = <0x3c>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 96 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander4_int>;
+		pinctrl-names = "default";
+	};
+
+	expander5: gpio@3d {
+		compatible = "ti,tca9538";
+		reg = <0x3d>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander5_int>;
+		pinctrl-names = "default";
+	};
+
+	expander6: gpio@3e {
+		compatible = "ti,tca9538";
+		reg = <0x3e>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 52 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander6_int>;
+		pinctrl-names = "default";
+	};
+};
+
+&iris {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	pinctrl-0 = <&dp_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&lt8713sx_dp_in>;
+};
+
+&mdss_dp0_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
+&pcie0 {
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l6a>;
+	vdda-pll-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&pcie1 {
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l6a>;
+	vdda-pll-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&pcieport0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+};
+
+&pcieport1 {
+	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+};
+
+&pmm8620au_0_gpios {
+	usb2_id: usb2-id-state {
+		pins = "gpio9";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+};
+
+&qup_i2c0_data_clk {
+	drive-strength = <2>;
+	bias-pull-up;
+};
+
+&qupv3_id_0 {
+	firmware-name = "qcom/qcs8300/qupv3fw.elf";
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	firmware-name = "qcom/qcs8300/qupv3fw.elf";
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/qcs8300/adsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/qcs8300/cdsp0.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_gpdsp {
+	firmware-name = "qcom/qcs8300/gpdsp0.mbn";
+
+	status = "okay";
+};
+
+&serdes0 {
+	phy-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
+&spi10 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
+&tlmm {
+	pcie0_default_state: pcie0-default-state {
+		wake-pins {
+			pins = "gpio0";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		clkreq-pins {
+			pins = "gpio1";
+			function = "pcie0_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio2";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	ethernet0_default: ethernet0-default-state {
+		ethernet0_mdc: ethernet0-mdc-pins {
+			pins = "gpio5";
+			function = "emac0_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet0_mdio: ethernet0-mdio-pins {
+			pins = "gpio6";
+			function = "emac0_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+
+	expander5_int: expander5-int-state {
+		pins = "gpio3";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander1_int: expander1-int-state {
+		pins = "gpio16";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	qup_i2c1_default: qup-i2c1-state {
+		pins = "gpio19", "gpio20";
+		function = "qup0_se1";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	pcie1_default_state: pcie1-default-state {
+		wake-pins {
+			pins = "gpio21";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		clkreq-pins {
+			pins = "gpio22";
+			function = "pcie1_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio23";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	expander3_int: expander3-int-state {
+		pins = "gpio24";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander6_int:  expander6-int-state {
+		pins = "gpio52";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander0_int: expander0-int-state {
+		pins = "gpio56";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	cam0_avdd_2v8_en_default: cam0-avdd-2v8-en-state {
+		pins = "gpio73";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam1_avdd_2v8_en_default: cam1-avdd-2v8-en-state {
+		pins = "gpio74";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam2_avdd_2v8_en_default: cam2-avdd-2v8-en-state {
+		pins = "gpio75";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_i2c15_default: qup-i2c15-state {
+		pins = "gpio91", "gpio92";
+		function = "qup1_se7";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	expander2_int: expander2-int-state {
+		pins = "gpio95";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander4_int: expander4-int-state {
+		pins = "gpio96";
+		function = "gpio";
+		bias-pull-up;
+	};
+};
+
+&uart6 {
+	status = "okay";
+};
+
+&uart7 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l8a>;
+	vcc-max-microamp = <1100000>;
+	vccq-supply = <&vreg_l4c>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l4a>;
+	vdda-pll-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l7c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&vreg_l7a>;
+	vdda-pll-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_dwc3_hs {
+	remote-endpoint = <&usb2_con_hs_ep>;
+};
+
+&usb_2_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l7c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..f01eef1c2e16 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -5,174 +5,12 @@

 /dts-v1/;

-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/pwm/pwm.h>
-#include <dt-bindings/sound/qcom,q6afe.h>
-#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
-
-#include "monaco.dtsi"
-#include "monaco-pmics.dtsi"
+#include "monaco-evk-common.dtsi"

 / {
 	model = "Qualcomm Technologies, Inc. Monaco EVK";
 	compatible = "qcom,monaco-evk", "qcom,qcs8300";

-	aliases {
-		ethernet0 = &ethernet0;
-		i2c1 = &i2c1;
-		serial0 = &uart7;
-		serial2 = &uart6;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	connector-2 {
-		compatible = "gpio-usb-b-connector", "usb-b-connector";
-		label = "micro-USB";
-		type = "micro";
-
-		id-gpios = <&pmm8620au_0_gpios 9 GPIO_ACTIVE_HIGH>;
-		vbus-gpios = <&expander6 7 GPIO_ACTIVE_HIGH>;
-		vbus-supply = <&usb2_vbus>;
-
-		pinctrl-0 = <&usb2_id>;
-		pinctrl-names = "default";
-
-		port {
-			usb2_con_hs_ep: endpoint {
-				remote-endpoint = <&usb_2_dwc3_hs>;
-			};
-		};
-	};
-
-	dmic: audio-codec-0 {
-		compatible = "dmic-codec";
-		#sound-dai-cells = <0>;
-		num-channels = <1>;
-	};
-
-	max98357a: audio-codec-1 {
-		compatible = "maxim,max98357a";
-		#sound-dai-cells = <0>;
-	};
-
-	dp-connector-0 {
-		compatible = "dp-connector";
-		label = "DP0";
-		type = "mini";
-
-		port {
-			dp0_connector_in: endpoint {
-				remote-endpoint = <&lt8713sx_dp0_out>;
-			};
-		};
-	};
-
-	dp-connector-1 {
-		compatible = "dp-connector";
-		label = "DP1";
-		type = "mini";
-
-		port {
-			dp1_connector_in: endpoint {
-				remote-endpoint = <&lt8713sx_dp1_out>;
-			};
-		};
-	};
-
-	usb2_vbus: regulator-usb2-vbus {
-		compatible = "regulator-fixed";
-		regulator-name = "usb2_vbus";
-		gpio = <&pmm8650au_1_gpios 7 GPIO_ACTIVE_HIGH>;
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		enable-active-high;
-	};
-
-	sound {
-		compatible = "qcom,qcs8275-sndcard";
-		model = "MONACO-EVK";
-
-		pinctrl-0 = <&hs0_mi2s_active>, <&mi2s1_active>;
-		pinctrl-names = "default";
-
-		hs0-mi2s-playback-dai-link {
-			link-name = "HS0 MI2S Playback";
-
-			codec {
-				sound-dai = <&max98357a>;
-			};
-
-			cpu {
-				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
-			};
-
-			platform {
-				sound-dai = <&q6apm>;
-			};
-		};
-
-		sec-mi2s-capture-dai-link {
-			link-name = "Secondary MI2S Capture";
-
-			codec {
-				sound-dai = <&dmic>;
-			};
-
-			cpu {
-				sound-dai = <&q6apmbedai SECONDARY_MI2S_TX>;
-			};
-
-			platform {
-				sound-dai = <&q6apm>;
-			};
-		};
-	};
-
-	vreg_cam0_2p8: vreg-cam0-2p8 {
-		compatible = "regulator-fixed";
-		regulator-name = "vreg_cam0_2p8";
-		regulator-min-microvolt = <2800000>;
-		regulator-max-microvolt = <2800000>;
-		startup-delay-us = <10000>;
-
-		gpio = <&tlmm 73 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&cam0_avdd_2v8_en_default>;
-		pinctrl-names = "default";
-	};
-
-	vreg_cam1_2p8: vreg-cam1-2p8 {
-		compatible = "regulator-fixed";
-		regulator-name = "vreg_cam1_2p8";
-		regulator-min-microvolt = <2800000>;
-		regulator-max-microvolt = <2800000>;
-		startup-delay-us = <10000>;
-
-		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&cam1_avdd_2v8_en_default>;
-		pinctrl-names = "default";
-	};
-
-	vreg_cam2_2p8: vreg-cam2-2p8 {
-		compatible = "regulator-fixed";
-		regulator-name = "vreg_cam2_2p8";
-		regulator-min-microvolt = <2800000>;
-		regulator-max-microvolt = <2800000>;
-		startup-delay-us = <10000>;
-
-		gpio = <&tlmm 75 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&cam2_avdd_2v8_en_default>;
-		pinctrl-names = "default";
-	};
-
 	/* This comes from a PMIC handled within the SAIL domain */
 	vreg_s2s: vreg-s2s {
 		compatible = "regulator-fixed";
@@ -183,517 +21,6 @@ vreg_s2s: vreg-s2s {
 	};
 };

-&apps_rsc {
-	regulators-0 {
-		compatible = "qcom,pmm8654au-rpmh-regulators";
-		qcom,pmic-id = "a";
-
-		vreg_l3a: ldo3 {
-			regulator-name = "vreg_l3a";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4a: ldo4 {
-			regulator-name = "vreg_l4a";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <912000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l5a: ldo5 {
-			regulator-name = "vreg_l5a";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l6a: ldo6 {
-			regulator-name = "vreg_l6a";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <912000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l7a: ldo7 {
-			regulator-name = "vreg_l7a";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <912000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l8a: ldo8 {
-			regulator-name = "vreg_l8a";
-			regulator-min-microvolt = <2504000>;
-			regulator-max-microvolt = <2960000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l9a: ldo9 {
-			regulator-name = "vreg_l9a";
-			regulator-min-microvolt = <2970000>;
-			regulator-max-microvolt = <3072000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-1 {
-		compatible = "qcom,pmm8654au-rpmh-regulators";
-		qcom,pmic-id = "c";
-
-		vreg_s5c: smps5 {
-			regulator-name = "vreg_s5c";
-			regulator-min-microvolt = <1104000>;
-			regulator-max-microvolt = <1104000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l1c: ldo1 {
-			regulator-name = "vreg_l1c";
-			regulator-min-microvolt = <300000>;
-			regulator-max-microvolt = <512000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2c: ldo2 {
-			regulator-name = "vreg_l2c";
-			regulator-min-microvolt = <900000>;
-			regulator-max-microvolt = <904000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4c: ldo4 {
-			regulator-name = "vreg_l4c";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l7c: ldo7 {
-			regulator-name = "vreg_l7c";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l8c: ldo8 {
-			regulator-name = "vreg_l8c";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l9c: ldo9 {
-			regulator-name = "vreg_l9c";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-};
-
-&ethernet0 {
-	phy-mode = "2500base-x";
-	phy-handle = <&hsgmii_phy0>;
-
-	pinctrl-0 = <&ethernet0_default>;
-	pinctrl-names = "default";
-
-	snps,mtl-rx-config = <&mtl_rx_setup>;
-	snps,mtl-tx-config = <&mtl_tx_setup>;
-	nvmem-cells = <&mac_addr0>;
-	nvmem-cell-names = "mac-address";
-
-	status = "okay";
-
-	mdio {
-		compatible = "snps,dwmac-mdio";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		hsgmii_phy0: ethernet-phy@1c {
-			compatible = "ethernet-phy-id004d.d101";
-			reg = <0x1c>;
-			reset-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
-			reset-assert-us = <11000>;
-			reset-deassert-us = <70000>;
-		};
-	};
-
-	mtl_rx_setup: rx-queues-config {
-		snps,rx-queues-to-use = <4>;
-		snps,rx-sched-sp;
-
-		queue0 {
-			snps,dcb-algorithm;
-			snps,map-to-dma-channel = <0x0>;
-			snps,route-up;
-			snps,priority = <0x1>;
-		};
-
-		queue1 {
-			snps,dcb-algorithm;
-			snps,map-to-dma-channel = <0x1>;
-			snps,route-ptp;
-		};
-
-		queue2 {
-			snps,avb-algorithm;
-			snps,map-to-dma-channel = <0x2>;
-			snps,route-avcp;
-		};
-
-		queue3 {
-			snps,avb-algorithm;
-			snps,map-to-dma-channel = <0x3>;
-			snps,priority = <0xc>;
-		};
-	};
-
-	mtl_tx_setup: tx-queues-config {
-		snps,tx-queues-to-use = <4>;
-
-		queue0 {
-			snps,dcb-algorithm;
-		};
-
-		queue1 {
-			snps,dcb-algorithm;
-		};
-
-		queue2 {
-			snps,avb-algorithm;
-			snps,send_slope = <0x1000>;
-			snps,idle_slope = <0x1000>;
-			snps,high_credit = <0x3e800>;
-			snps,low_credit = <0xffc18000>;
-		};
-
-		queue3 {
-			snps,avb-algorithm;
-			snps,send_slope = <0x1000>;
-			snps,idle_slope = <0x1000>;
-			snps,high_credit = <0x3e800>;
-			snps,low_credit = <0xffc18000>;
-		};
-	};
-};
-
-&gpi_dma0 {
-	status = "okay";
-};
-
-&gpi_dma1 {
-	status = "okay";
-};
-
-&gpu {
-	status = "okay";
-};
-
-&gpu_zap_shader {
-	firmware-name = "qcom/qcs8300/a623_zap.mbn";
-};
-
-&i2c0 {
-	status = "okay";
-
-	bridge@4f {
-		compatible = "lontium,lt8713sx";
-		reg = <0x4f>;
-		reset-gpios = <&expander5 6 GPIO_ACTIVE_LOW>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-
-				lt8713sx_dp_in: endpoint {
-					remote-endpoint = <&mdss_dp0_out>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-
-				lt8713sx_dp0_out: endpoint {
-					remote-endpoint = <&dp0_connector_in>;
-				};
-			};
-
-			port@2 {
-				reg = <2>;
-
-				lt8713sx_dp1_out: endpoint {
-					remote-endpoint = <&dp1_connector_in>;
-				};
-			};
-		};
-	};
-};
-
-&i2c1 {
-	pinctrl-0 = <&qup_i2c1_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-
-	fan_controller: fan@18 {
-		compatible = "ti,amc6821";
-		reg = <0x18>;
-		#pwm-cells = <2>;
-
-		fan {
-			pwms = <&fan_controller 40000 PWM_POLARITY_INVERTED>;
-		};
-	};
-
-	eeprom0: eeprom@50 {
-		compatible = "atmel,24c256";
-		reg = <0x50>;
-		pagesize = <64>;
-
-		nvmem-layout {
-			compatible = "fixed-layout";
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			mac_addr0: mac-addr@0 {
-				reg = <0x0 0x6>;
-			};
-		};
-	};
-};
-
-&i2c15 {
-	pinctrl-0 = <&qup_i2c15_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-
-	expander0: gpio@38 {
-		compatible = "ti,tca9538";
-		reg = <0x38>;
-		#gpio-cells = <2>;
-		gpio-controller;
-		#interrupt-cells = <2>;
-		interrupt-controller;
-		interrupts-extended = <&tlmm 56 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-0 = <&expander0_int>;
-		pinctrl-names = "default";
-	};
-
-	expander1: gpio@39 {
-		compatible = "ti,tca9538";
-		reg = <0x39>;
-		#gpio-cells = <2>;
-		gpio-controller;
-		#interrupt-cells = <2>;
-		interrupt-controller;
-		interrupts-extended = <&tlmm 16 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-0 = <&expander1_int>;
-		pinctrl-names = "default";
-	};
-
-	expander2: gpio@3a {
-		compatible = "ti,tca9538";
-		reg = <0x3a>;
-		#gpio-cells = <2>;
-		gpio-controller;
-		#interrupt-cells = <2>;
-		interrupt-controller;
-		interrupts-extended = <&tlmm 95 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-0 = <&expander2_int>;
-		pinctrl-names = "default";
-	};
-
-	expander3: gpio@3b {
-		compatible = "ti,tca9538";
-		reg = <0x3b>;
-		#gpio-cells = <2>;
-		gpio-controller;
-		#interrupt-cells = <2>;
-		interrupt-controller;
-		interrupts-extended = <&tlmm 24 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-0 = <&expander3_int>;
-		pinctrl-names = "default";
-	};
-
-	expander4: gpio@3c {
-		compatible = "ti,tca9538";
-		reg = <0x3c>;
-		#gpio-cells = <2>;
-		gpio-controller;
-		#interrupt-cells = <2>;
-		interrupt-controller;
-		interrupts-extended = <&tlmm 96 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-0 = <&expander4_int>;
-		pinctrl-names = "default";
-	};
-
-	expander5: gpio@3d {
-		compatible = "ti,tca9538";
-		reg = <0x3d>;
-		#gpio-cells = <2>;
-		gpio-controller;
-		#interrupt-cells = <2>;
-		interrupt-controller;
-		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-0 = <&expander5_int>;
-		pinctrl-names = "default";
-	};
-
-	expander6: gpio@3e {
-		compatible = "ti,tca9538";
-		reg = <0x3e>;
-		#gpio-cells = <2>;
-		gpio-controller;
-		#interrupt-cells = <2>;
-		interrupt-controller;
-		interrupts-extended = <&tlmm 52 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-0 = <&expander6_int>;
-		pinctrl-names = "default";
-	};
-};
-
-&iris {
-	status = "okay";
-};
-
-&mdss {
-	status = "okay";
-};
-
-&mdss_dp0 {
-	pinctrl-0 = <&dp_hot_plug_det>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&mdss_dp0_out {
-	data-lanes = <0 1 2 3>;
-	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
-	remote-endpoint = <&lt8713sx_dp_in>;
-};
-
-&mdss_dp0_phy {
-	vdda-phy-supply = <&vreg_l5a>;
-	vdda-pll-supply = <&vreg_l4a>;
-
-	status = "okay";
-};
-
-&pcie0 {
-	pinctrl-0 = <&pcie0_default_state>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie0_phy {
-	vdda-phy-supply = <&vreg_l6a>;
-	vdda-pll-supply = <&vreg_l5a>;
-
-	status = "okay";
-};
-
-&pcie1 {
-	pinctrl-0 = <&pcie1_default_state>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie1_phy {
-	vdda-phy-supply = <&vreg_l6a>;
-	vdda-pll-supply = <&vreg_l5a>;
-
-	status = "okay";
-};
-
-&pcieport0 {
-	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
-};
-
-&pcieport1 {
-	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
-};
-
-&pmm8620au_0_gpios {
-	usb2_id: usb2-id-state {
-		pins = "gpio9";
-		function = "normal";
-		input-enable;
-		bias-pull-up;
-		power-source = <0>;
-	};
-};
-
-&qup_i2c0_data_clk {
-	drive-strength = <2>;
-	bias-pull-up;
-};
-
-&qupv3_id_0 {
-	firmware-name = "qcom/qcs8300/qupv3fw.elf";
-	status = "okay";
-};
-
-&qupv3_id_1 {
-	firmware-name = "qcom/qcs8300/qupv3fw.elf";
-	status = "okay";
-};
-
-&remoteproc_adsp {
-	firmware-name = "qcom/qcs8300/adsp.mbn";
-
-	status = "okay";
-};
-
-&remoteproc_cdsp {
-	firmware-name = "qcom/qcs8300/cdsp0.mbn";
-
-	status = "okay";
-};
-
-&remoteproc_gpdsp {
-	firmware-name = "qcom/qcs8300/gpdsp0.mbn";
-
-	status = "okay";
-};
-
 &sdhc_1 {
 	vmmc-supply = <&vreg_l8a>;
 	vqmmc-supply = <&vreg_s2s>;
@@ -704,222 +31,3 @@ &sdhc_1 {

 	status = "okay";
 };
-
-&serdes0 {
-	phy-supply = <&vreg_l4a>;
-
-	status = "okay";
-};
-
-&spi10 {
-	status = "okay";
-
-	tpm@0 {
-		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
-		reg = <0>;
-		spi-max-frequency = <20000000>;
-	};
-};
-
-&tlmm {
-	pcie0_default_state: pcie0-default-state {
-		wake-pins {
-			pins = "gpio0";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		clkreq-pins {
-			pins = "gpio1";
-			function = "pcie0_clkreq";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		perst-pins {
-			pins = "gpio2";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	ethernet0_default: ethernet0-default-state {
-		ethernet0_mdc: ethernet0-mdc-pins {
-			pins = "gpio5";
-			function = "emac0_mdc";
-			drive-strength = <16>;
-			bias-pull-up;
-		};
-
-		ethernet0_mdio: ethernet0-mdio-pins {
-			pins = "gpio6";
-			function = "emac0_mdio";
-			drive-strength = <16>;
-			bias-pull-up;
-		};
-	};
-
-	expander5_int: expander5-int-state {
-		pins = "gpio3";
-		function = "gpio";
-		bias-pull-up;
-	};
-
-	expander1_int: expander1-int-state {
-		pins = "gpio16";
-		function = "gpio";
-		bias-pull-up;
-	};
-
-	qup_i2c1_default: qup-i2c1-state {
-		pins = "gpio19", "gpio20";
-		function = "qup0_se1";
-		drive-strength = <2>;
-		bias-pull-up;
-	};
-
-	pcie1_default_state: pcie1-default-state {
-		wake-pins {
-			pins = "gpio21";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		clkreq-pins {
-			pins = "gpio22";
-			function = "pcie1_clkreq";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		perst-pins {
-			pins = "gpio23";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	expander3_int: expander3-int-state {
-		pins = "gpio24";
-		function = "gpio";
-		bias-pull-up;
-	};
-
-	expander6_int:  expander6-int-state {
-		pins = "gpio52";
-		function = "gpio";
-		bias-pull-up;
-	};
-
-	expander0_int: expander0-int-state {
-		pins = "gpio56";
-		function = "gpio";
-		bias-pull-up;
-	};
-
-	cam0_avdd_2v8_en_default: cam0-avdd-2v8-en-state {
-		pins = "gpio73";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	cam1_avdd_2v8_en_default: cam1-avdd-2v8-en-state {
-		pins = "gpio74";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	cam2_avdd_2v8_en_default: cam2-avdd-2v8-en-state {
-		pins = "gpio75";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	qup_i2c15_default: qup-i2c15-state {
-		pins = "gpio91", "gpio92";
-		function = "qup1_se7";
-		drive-strength = <2>;
-		bias-pull-up;
-	};
-
-	expander2_int: expander2-int-state {
-		pins = "gpio95";
-		function = "gpio";
-		bias-pull-up;
-	};
-
-	expander4_int: expander4-int-state {
-		pins = "gpio96";
-		function = "gpio";
-		bias-pull-up;
-	};
-};
-
-&uart6 {
-	status = "okay";
-};
-
-&uart7 {
-	status = "okay";
-};
-
-&ufs_mem_hc {
-	reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
-	vcc-supply = <&vreg_l8a>;
-	vcc-max-microamp = <1100000>;
-	vccq-supply = <&vreg_l4c>;
-	vccq-max-microamp = <1200000>;
-
-	status = "okay";
-};
-
-&ufs_mem_phy {
-	vdda-phy-supply = <&vreg_l4a>;
-	vdda-pll-supply = <&vreg_l5a>;
-
-	status = "okay";
-};
-
-&usb_1 {
-	dr_mode = "peripheral";
-
-	status = "okay";
-};
-
-&usb_1_hsphy {
-	vdda-pll-supply = <&vreg_l7a>;
-	vdda18-supply = <&vreg_l7c>;
-	vdda33-supply = <&vreg_l9a>;
-
-	status = "okay";
-};
-
-&usb_qmpphy {
-	vdda-phy-supply = <&vreg_l7a>;
-	vdda-pll-supply = <&vreg_l5a>;
-
-	status = "okay";
-};
-
-&usb_2 {
-	status = "okay";
-};
-
-&usb_2_dwc3_hs {
-	remote-endpoint = <&usb2_con_hs_ep>;
-};
-
-&usb_2_hsphy {
-	vdda-pll-supply = <&vreg_l7a>;
-	vdda18-supply = <&vreg_l7c>;
-	vdda33-supply = <&vreg_l9a>;
-
-	status = "okay";
-};
--
2.34.1


