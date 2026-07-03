Return-Path: <linux-arm-msm+bounces-116237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aW7vBZJ1R2owYgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:40:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 85184700301
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:40:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=id9BZsjm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bSyG3U+r;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116237-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116237-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A9A7F3081E85
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E0D3546C2;
	Fri,  3 Jul 2026 08:34:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A27134EF0F
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:34:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783067693; cv=none; b=jBgt0s6w2UFrAKJKfWfpqA2zedr9vL/pyOHQEy+2G16tp80gIqpubZbpi5LyaSlm4pqgFBksesSnPAKWaXfNWSvCUkR2n843JnCwO2TjPKOjAs9dBIsZ0Vd96Co64EWz/NNVLmP0o+bYVl4Qa+bMMBlRFfoeMhKB0qNazzjYmLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783067693; c=relaxed/simple;
	bh=Emw89YyS7aMC2iiPdIgXR+7AqyMkbd8l52QT0jFD60Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nkom3+xVw85hJ4PeDt84Cn4GctNfADO8oyFXzIBwytpub85YzYkO0NfLApAWeHhsB/hLa9js8mVArGy9n0PYpJ7GV4/kLBLmEVc20wdObieUjPUEhCsCya3wA8KIqpWUszG+j8vjO7GLBuPR2YwOiCNMbZDJN+veEmecsZ59YrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=id9BZsjm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bSyG3U+r; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635ru1K3135377
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 08:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=14V1rnmhnaJ
	ZRipsOmqxV3ozYp1JadJvjsb1iPS/Wa8=; b=id9BZsjmQP9FVdzB3Z1fckaiOUB
	Qpl4O3c2jdywxHJ+YDpZDoFD0E2oPszl+/Lnfdb6JhM4MlxC1MInWcTtW8imzjP5
	hWGKqbw1TVTv1UZLZRXwJOjRozlOhOyCEQRWCEbFnrBTmHXYItrlRDheA1Fi1xfy
	EZ1hUEI3UpxOuXiCUfTvvSX2ddCN95tzgIbjqoQ+Yh8IZw+9FaxxwHX8kTXy/udW
	V3ATopwwuq2RqIIQ05zVEdr+nbrGdfCmGh2yIjNLjI58/aVmRRMiOLrY6D/i6+jo
	FyoYG4KuW6pwim4EaeNx1rBg5WTLbMiBT64GwsqAX0/ZNYzpg9W1pDBPdGQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qch660-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:34:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37e1f96b248so731963a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783067690; x=1783672490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14V1rnmhnaJZRipsOmqxV3ozYp1JadJvjsb1iPS/Wa8=;
        b=bSyG3U+rJmhIDaoaaf4sfD3vmFm3+8nxqIap19YXn/YtSRxUJO16obmEu5C/EuzbPQ
         A4mYYrqr52oFTKhce5Dln2byROIjQ9EyXhaR91DakvRWRGnmnUIHFuKKofCiGjFjUR3V
         BXsNH46wUseW50Z1WtIbdMYQLEc13b+JVVnI1ZUxpCzZ6BrLh6zOa3WNtbH354vcMdrp
         XwJVyMco2s7+2/D9SOz/gqSzC/fbhhyxwJp4H1wgCJzXnfeq9FogK57Ji9nQIUvtxQBp
         1h+GynKABCPhpgPNxkCLM/SjNqCCvQo0E36TNPaE6LmKTAFNnu5ctamM16nE/lPJe5Db
         9LSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067690; x=1783672490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=14V1rnmhnaJZRipsOmqxV3ozYp1JadJvjsb1iPS/Wa8=;
        b=p0JCezDm5cmdlhSmlJBnsK3KIAszOWHkFJk1b7xm/RG2mPLIwfySFe4Kxi1s+jyWX1
         Jnh1f1VjeIZlvZddUI1En7RK/SyfVBFxAs9+BL7M1GDFLHtz+5FBWTuJMDVwizMMpsEh
         rszwIY0nz+EuXVF8I+VCz4vADZak3uGQCxol4hPSavHNeAL7Icdh0JtrIcvlsTG6Vwfa
         JU3wwM37IsUntuIaXEWV3lFXgE+aAeCQ73Zz3zl+jUmrLtGedLJW79gVCn+t+DAYQOED
         tV1msyZMG2vyfoJ42px3RkA9xZ/yCU3Hd0ainlfTviU4YUljPsukq4hLOcUnsdTtveyv
         IX2Q==
X-Gm-Message-State: AOJu0YzEe5IYWCxVara/hlFrgkGyDUbD3ecx3GKrj2UIkpcfVDHMde6B
	1JG4fEyc0nTXk+baQ1/Qclt338n27r2IVQTUD5lDuoJBT/XcOflu9YAdP4LP/m+9wnzJqT84sdz
	yjiYFXkkwWZUlKRVBhT4aXI2hf1iFGINPjcy3jCzNHs9DhJbIwpwuIDswnWGqBv/nTd5N
X-Gm-Gg: AfdE7cm+Eoqx72erhAJCh4aZcZ/u3mboW+t9vlTHXJVuNJnlNcVRtCjz6upe8zj/1l+
	gb+T+RoNgTv7SIH1/tpBryT2SkGxCqYDYz4Rd8nUZVBy3yn+jRdfMamHJd3oK8QJ6PKzYcKKRSG
	RqEAbv2CIuerdowTEey4j0FRY3Mo/Z/c5xcqnUd0IbTf9YhtBNxOnBaYqbhqRQd5fMA9T4DLAxf
	p7/9QjTrZbd7lKlV8SmRPJVLloUbn76q/kYQAMWjNKQiGTIXklIaA/mHw3ir/jaMq7wjDVqPJ+q
	ITN6Y6Gt5y1HDOsvUd8RQT2zUMErccqL55qVjD/DBpddL4N+qkUiE2zQG/2KK452cSIdfkXpYNX
	DB02vHQZkAKDG53F63Jw8g1sSiIR7n6PWS8++2BN2
X-Received: by 2002:a17:90a:c10e:b0:380:83fc:431b with SMTP id 98e67ed59e1d1-380aa20457dmr10145906a91.27.1783067690470;
        Fri, 03 Jul 2026 01:34:50 -0700 (PDT)
X-Received: by 2002:a17:90a:c10e:b0:380:83fc:431b with SMTP id 98e67ed59e1d1-380aa20457dmr10145871a91.27.1783067689920;
        Fri, 03 Jul 2026 01:34:49 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm18797839eec.2.2026.07.03.01.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:34:49 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 2/2] arm64: dts: qcom: eliza-cqs-evk: Enable sound card support with WSA8845 and DMIC
Date: Fri,  3 Jul 2026 14:04:21 +0530
Message-Id: <20260703083421.2736184-3-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260703083421.2736184-1-ravi.hothi@oss.qualcomm.com>
References: <20260703083421.2736184-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ic29EjWB-hz4IV8iBOZjKSLll0_GIO2i
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a47742b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=RpnahtGIwcQnnQdoyywA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: ic29EjWB-hz4IV8iBOZjKSLll0_GIO2i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4MSBTYWx0ZWRfX/zLarHrtkKoq
 NafNhEQUEYgRvGm7mOqzJMj8qa/diZjNQQ2N1NeexgTtxu5N2PGhr2aNFfpb1mamldezeHI4AD2
 GwP2w9t7F9ut7tAH0j4/szReJnTWIAKJ3iHV9cPwJSDK+xuetCSNAUS4mI8Wxa/pJQdov/+GZ7O
 1tdABPVz6iw7ndnH/CFQmRpXKiHq1mcrhI8GFMrB5okrhShwzXYOMwb54xOEBkAvBzUGxCOkUJg
 csmqkzeiG8haWmuxwgrwcxT13z+owtvSJ3GG6+pS+WJN81qQl6JExi9uk2nhYlxNd7+uJHWj325
 dNdgxvBJ3iX7ndc+oknaScGlzrndGTLYkvc80KW+ekyqU94w7dZm0u5HrwWQNfScdOfy4/8LzbX
 ZlQD/4M8vseFPAMbLg1/p9/9HlL9UbGLLTJFBUy+43Aj+FtnPdCs4yZLEEf76l10e59U/Ng7lKt
 NIE/ocXx9gEP61IAdow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4MSBTYWx0ZWRfX+K3qYMasqxKj
 Z3QG1cKlkwKkpW35uZFogl1Kfa17LGLbhTJkMVKOeMJ/BLg0nxfAlnj8k/PsUxvKi77yjkSnxFN
 D2prDGc/rIgSDubFIJfNs9dlfUIZFJ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116237-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 85184700301

Enable the sound card on the Eliza CQS EVK platform, including the
WSA8845 external speaker path and DMIC microphone capture via VA macro.

Enable the required LPASS WSA macro, VA macro and SoundWire controller
along with the necessary pinctrl configurations for DMIC and WSA
SoundWire interfaces.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 156 +++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
index 43d428a4ed2d..e06b0b79e950 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
@@ -5,10 +5,166 @@
 
 /dts-v1/;
 
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
 #include "eliza-cqs-som.dtsi"
 #include "eliza-evk.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
 	compatible = "qcom,eliza-cqs-evk", "qcom,eliza-cqs-som", "qcom,eliza";
+
+	sound {
+		compatible = "qcom,eliza-sndcard", "qcom,sm8450-sndcard";
+		model = "eliza-cqs-evk";
+
+		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA_SPK2 OUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb",
+				"VA DMIC4", "vdd-micb",
+				"VA DMIC5", "vdd-micb",
+				"VA DMIC6", "vdd-micb",
+				"VA DMIC7", "vdd-micb";
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&left_spkr>, <&right_spkr>,
+					    <&swr0 0>, <&lpass_wsamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	dmic_eldo: regulator-dmic-eldo {
+		compatible = "regulator-fixed";
+		regulator-name = "dmic-eldo";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vreg_bob>;
+	};
+};
+
+&tlmm {
+	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
+		pins = "gpio59";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+
+	spkr_2_sd_n_active: spkr-2-sd-n-active-state {
+		pins = "gpio79";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+};
+
+&lpass_vamacro {
+	status = "okay";
+
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>,
+		    <&dmic45_default>, <&dmic67_default>;
+	pinctrl-names = "default";
+
+	vdd-micb-supply = <&dmic_eldo>;
+	qcom,dmic-sample-rate = <4800000>;
+};
+
+&lpass_wsamacro {
+	status = "okay";
+};
+
+&swr0 {
+	status = "okay";
+
+	pinctrl-0 = <&wsa_swr_active>;
+	pinctrl-names = "default";
+
+	/* WSA8845, Speaker Left */
+	left_spkr: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		pinctrl-0 = <&spkr_1_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 59 GPIO_ACTIVE_LOW>;
+		vdd-1p8-supply = <&vreg_l7b>;
+		vdd-io-supply = <&vreg_l7b>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 1  (SPKR_L)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 2  (SPKR_L_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 3  (SPKR_L_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 10 (SPKR_L_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <1 2 3 7 10 13>;
+	};
+
+	/* WSA8845, Speaker Right */
+	right_spkr: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		pinctrl-0 = <&spkr_2_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
+		vdd-1p8-supply = <&vreg_l7b>;
+		vdd-io-supply = <&vreg_l7b>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 4  (SPKR_R)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 5  (SPKR_R_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 6  (SPKR_R_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 11 (SPKR_R_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <4 5 6 7 11 13>;
+	};
+};
+
+&pm7550_gpios {
+	dmic-eldo-en-hog {
+		gpio-hog;
+		gpios = <7 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "dmic-eldo-en";
+	};
 };
-- 
2.34.1


