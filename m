Return-Path: <linux-arm-msm+bounces-52138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B6FA6B5D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 09:13:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E8BF481F1C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 08:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD02F1EF080;
	Fri, 21 Mar 2025 08:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="PV2nzyzq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52161EBFE3
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 08:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742544792; cv=none; b=cPb9eNDg4BSQq47OuuA7KxG+Bm5pJ1rrGhwAYcvFp0O9pT7VdQ/hpkrKiGIx0UpkIINNISPCbQMFa+jmW6T5qoupOV4mQK61jXB7q990eIKYZd8KUBvgpfjadwJLn3GkrwOUX9DbcD6RcqmscMvakfEPDyau0fn7v6cVrc3rgfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742544792; c=relaxed/simple;
	bh=i9GzDoeYHWXocHTV/J92qBEXkO6eo++ROgOYxc2baOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WpkXHUYiy9T1y4htQY27KV3V10yPzKar0xO3ONohC2Rp9Qvnk6tGQyauGjy+Qw15XkwYe9OwLLSmFZNuXKxhC4hsIB23u3MNL+Kmo68ltZnxtk9OC435b1JpBolAyQDqdtd1y2amxRMe6Y4V2EsPw03V/CEeUCr8ZDooDKHua4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=PV2nzyzq; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac345bd8e13so299319666b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 01:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1742544789; x=1743149589; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jev2S5q0Uq23ZefU3EZw33sQyKB4WKTRkFhU4RqrJYc=;
        b=PV2nzyzqpCInw/j8dN5reUbNXmuyRJVSHtBjUVWZlHRERuG+05StQwoHTfQOd3sqIr
         svmiqYAfkvoo0q7QrZgBma9ZFAxk6i2NJdmb+4DRt4jWX30NXLPbZy+UGkcl/HV2J0Fd
         jOzfA5XPfIafql8pTAiFXHOwYh/G72VYJRsJx2i6LAd0tcQLtWj4OCyQLw1+V/w3JNiG
         VWdhgX4Mmbit61r9RlDwHBNNk6w4+UkP+/Z7n2hakfVqp5xyFSEG6h8dR276lFHZds4q
         JIknrllwIIkWLYhN5HaeNywvBP7TfelEfxt7uYW7qjVxLePR/NSURNVU+wH6tTI4uHsS
         8Z1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742544789; x=1743149589;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jev2S5q0Uq23ZefU3EZw33sQyKB4WKTRkFhU4RqrJYc=;
        b=OVxbPeCl6vdfw1dAILkDkKTfDP60d1Ej2OD9YQ6Wbhe/4yjWeGPGbKMJdXs7ZVtMgn
         k/L2PjJNsciySRSgZLTbH5iHxZYPm1qhwG+sDKLoe57XmPL0s39eAWqBRaU8ULDzrGp+
         aLsHMw2Nx5tQPRJPTXoV+9FW2c4GSK8lyvQTcp5NHJ6N0Nt2ILIf0eauFp6vc5NQLm7z
         28kHO0EW6aBIE83zDVZdTuaAAvR5JCJ1c5cHga/HTyTfBpeZ2sBuHy9h5T/GdS7EN4iR
         RQD9dyaKbRpsDvk2BTjCncZbDiQmHWeBz81D8oEcao+z5xoPDymLHm7BpzlmCPh1yIcJ
         F+Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUiVOAgIew29vOgbs2hHBHBGmGZJRsn0qLuOS4htxEvG/0ROuNjNkR924/BhljBUTvXR6PQOYuqJq2yZqpl@vger.kernel.org
X-Gm-Message-State: AOJu0YyAjlbmRKQL4ZqLe+6xV2TZOq9gHyvuaT5OlsxKejczsiobrT7Q
	plHGOKl9bp29cQqH6RkU7YpOZLXjuqCyIyPWKhHKMZ2byx2EtaAhrJddPy2rVl4=
X-Gm-Gg: ASbGncuU92B371qalPpD26FGy7+QpikJY8Ip1GH2Nteo7tqtx32ZOFolEu8ny0C3ULf
	eX8UsyvEKz6+GyFQvPtSiAZvAnW/iN8R6N24dd7U43n5v4YF3aa/qZzlVIi2jVGjonW9lAEkXjT
	0fgGdYUPq8ryEOOk7BmXe25sgrsfQ/F2N2kgE0NdNKpM+s0xUay8KaYS9J8XZNEcv4mTEHAWWsP
	fYo5BWdEeC2LDI4roUjZg8DMfvwOuNFKENF2kMirjdOQNHW9wIlHUh4DKcQBUd7Yjg6mV/yw1uf
	rOnhCBcagY9ieC09OswpyZ1llxs/BaYveqioTdlqL/wi8PKXuxGFYM4zpjlnFisiY0ptaxNuQ4e
	TjZtUuRJEa+/bzOnjdw==
X-Google-Smtp-Source: AGHT+IGAzC8uX4v7JqMexA3WN+wQ+YLOprWk5/TUdTQL46LPhqZiEkYuSKewAa1iYNwiAYxSSLKZaQ==
X-Received: by 2002:a17:907:da0c:b0:ac3:f683:c842 with SMTP id a640c23a62f3a-ac3f683c845mr175817866b.42.1742544788929;
        Fri, 21 Mar 2025 01:13:08 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efdaccc0sm104891066b.185.2025.03.21.01.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 01:13:08 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 21 Mar 2025 09:12:57 +0100
Subject: [PATCH] arm64: dts: qcom: sm6350: add APR and some audio-related
 services
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-sm6350-apr-v1-1-7805ce7b4dcf@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAIgf3WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYyND3eJcM2NTA93EgiJdQ9M041TzVJNU0+REJaCGgqLUtMwKsGHRsbW
 1ABDZ8zZcAAAA
X-Change-ID: 20250321-sm6350-apr-15f3e7e4e5ca
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add the APR node and its associated services required for audio on
the SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 59 ++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 00ad1d09a19558d9e2bc61f1a81a36d466adc88e..30d5658665339bdfd803246054878fcb932a4a9d 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -18,7 +18,9 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -1319,6 +1321,63 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 				label = "lpass";
 				qcom,remote-pid = <2>;
 
+				apr {
+					compatible = "qcom,apr-v2";
+					qcom,glink-channels = "apr_audio_svc";
+					qcom,domain = <APR_DOMAIN_ADSP>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					service@3 {
+						reg = <APR_SVC_ADSP_CORE>;
+						compatible = "qcom,q6core";
+						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+					};
+
+					q6afe: service@4 {
+						compatible = "qcom,q6afe";
+						reg = <APR_SVC_AFE>;
+						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+
+						q6afedai: dais {
+							compatible = "qcom,q6afe-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+						};
+
+						q6afecc: clock-controller {
+							compatible = "qcom,q6afe-clocks";
+							#clock-cells = <2>;
+						};
+					};
+
+					q6asm: service@7 {
+						compatible = "qcom,q6asm";
+						reg = <APR_SVC_ASM>;
+						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+
+						q6asmdai: dais {
+							compatible = "qcom,q6asm-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+							iommus = <&apps_smmu 0x1001 0x0>;
+						};
+					};
+
+					q6adm: service@8 {
+						compatible = "qcom,q6adm";
+						reg = <APR_SVC_ADM>;
+						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+
+						q6routing: routing {
+							compatible = "qcom,q6adm-routing";
+							#sound-dai-cells = <0>;
+						};
+					};
+				};
+
 				fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";

---
base-commit: 73b8c1dbc2508188e383023080ce6a582ff5f279
change-id: 20250321-sm6350-apr-15f3e7e4e5ca

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


