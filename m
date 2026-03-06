Return-Path: <linux-arm-msm+bounces-95824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDaZDkneqmlqXwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:01:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6DE2223A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:01:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27BDD300F19C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 14:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744B83A9D84;
	Fri,  6 Mar 2026 14:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nBitIpbi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97730384231
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 14:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805697; cv=none; b=Gd8tUY3cVNXDHrfk9Dq9/v6FEWgOd3/tod4hZxj4wtp0dcbCKiYiMn3rgf/Vww56CMWiHFoBVk2L/xgoItnrhkaz5dX7NiTlHhWY4xu6k9dzKjnOgN31By5uP5EGOvjNVRLu9RmtQjZXE9opxtjh1LDH+i9YHfPQILEKuVrCJOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805697; c=relaxed/simple;
	bh=oNf8mjFA1GbQV70M6U4bZQbgsBwYwBimof+pvRp6x18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wpo08gyzsZH7DAIZ7NU8XmxfbnvpzLw01CpViSMGA9HEaGnLnCVSEYS4zHqyzSc6wS9nwcI3Fvd4V2tjDq7bT6uQH0x8NfcSvnGLtRVZldKcQPcU4HQ8IF4K0Ob/Ukj2/RF+bY36rCdkFrBHAv5eXH+9h0m+Y6yo8vTuKfdRu+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nBitIpbi; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so1133530466b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 06:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772805686; x=1773410486; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/RRoRU++tB3z2PVmiWjOdu3p96Q4S+zG/ktvjfqzJM=;
        b=nBitIpbimQw7irWuwRc3N0UsMWVisTcRMJLZ8W0GjTwqF3UEqwSyUz29YxPME9Y5Rw
         ui1eBKyBkz8Y6qHyP/dpcePKK+9c5EQOOeuANP3LACLZRt2IEI3j+mpxrT5FCky1FaHh
         Jjm+Elq8RBYj1NfiAaroFUJMeQrT55yD7uq0ljHvoRBvU+qLCZ2SAIeEg8ocM0q4BxnK
         4IjY5Z0UMBy6r3rZrbOFLVYuNMPB4T61Ls/w+uG9HA9gTnROJCr1G29vlVyE9JmRpLXU
         7+VHS4nde9jA/w2rCCsziFFfLFU0aM+pQHLNU7/VYHBnfLydwvFVN7IO+whL36cRx9EC
         wj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805686; x=1773410486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c/RRoRU++tB3z2PVmiWjOdu3p96Q4S+zG/ktvjfqzJM=;
        b=RtwTkYnTnwUAp84NNdae0qhgbk26FcuM69TWA2gN+vQVrO2uUBYvFFjt0bESe7U5M4
         IcuZAXxrA5lZyxorY5GMUCENtgexAh8MJ/6PY2Bkw4nqtNbYUUoiO1XHQkBalBdNw6uy
         UXaNZZ9jd7/6BMawgaN2p3g3YtFr72hzgydoZVTRG7n4XB0DpPZlA4AC+Njw43qlqEkS
         n8309+L47gBZpfwcMtO6TOLRwXKMOHfe949WvDlcEsK46UygJN4SCrOryYSef7J/tU+3
         nwWs6IcIL6HIWWglSpYGmcxSXQS4HBC8gGGY6oFCnPCkcWP0lfqfhRmbKzZ7JDB6/PQk
         J4YA==
X-Forwarded-Encrypted: i=1; AJvYcCXKnv77qA3ZFIetsJb2OG9FN16cQgd6Vt1Gq8gVaGyVWjY4pd83vFgbdCkv0f+mdA3bXvzNp7zZS1TF5Ak5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1MxGf0oGKVL6nys671od7hMT/m2/h2dIiAk0eh4l/4W/jT143
	zSq4nFSQ6cUG5hoDhrKTz0hz+HevO79SNowwQabr6outls0pPpzypRwe8sHykEQHFcA=
X-Gm-Gg: ATEYQzzgL9WKREz2N+iB2IR4k0f4Lhm9VnZYq4Sq9K5Xw19GDFW1rMDI6xX+6JbS8mw
	0H+bGkUvQPdGTDVHVhKPtWDsin8ArGRRGOwFIo6mgEgQy8aY9jlJlkp86o2FuslXlhLF/JEIgW1
	xePXX4cFmrIMn8UahtMJ9ZIOLFpPeLZsC1f2Es3I9vhJ5SmCzKrcqqbgaXf2R9OGFILwsoC9xt0
	jPMYfKDqcbLA0ssEqs4a6dni2R+ruL/BHYa/EYmbsjXxODe5oZNnrIU2ZXXCN5Lyutv4CnurEvS
	+4ZjsRpm5+V5a4N410GMBBlWA/DZMHqnfYtdlMSTcXyp5itskW1jIy1Zq54YxmmlBxgl98nF1mG
	LvGm0NS/0T7yCbn/PGPIRAtc5vw1Ik9o7tYniFiKJ/HlG+59Suj5UrRMsgLJZF2j1Wo3dYf/Ovd
	W/ARyCvuRaMAU4l1wumbdIkrg6L64JlSy+apJnop/QN9WZO/TakGH1WetE7LMgLK/SVsHgC5IIB
	lDXbOfXRwuKGHE=
X-Received: by 2002:a17:907:7b8b:b0:b8f:8660:3cb4 with SMTP id a640c23a62f3a-b942db8aa4fmr126537766b.8.1772805686438;
        Fri, 06 Mar 2026 06:01:26 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad97be5sm4313828f8f.11.2026.03.06.06.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:01:25 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 06 Mar 2026 15:01:20 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: milos: add ADSP GPR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-milos-fastrpc-gpr-v1-2-893eb98869ce@fairphone.com>
References: <20260306-milos-fastrpc-gpr-v1-0-893eb98869ce@fairphone.com>
In-Reply-To: <20260306-milos-fastrpc-gpr-v1-0-893eb98869ce@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772805682; l=1907;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=oNf8mjFA1GbQV70M6U4bZQbgsBwYwBimof+pvRp6x18=;
 b=yIaTLUyI/HEGMXSPzzklPyfouzkUVLkoVgPkkDCtWfdX3tmLN6wwct4EfRDq9D3tbAsm9ai2U
 w8/9Qe8eb+GC8aCuRybZ4EZ5jjkFLJGGvEU5Gf47rnyWoMNORnV7TFq
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 8F6DE2223A1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95824-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,0.0.0.7:email]
X-Rspamd-Action: no action

Add the ADSP Generic Packet Router (GPR) device node as part of audio
subsystem in Qualcomm Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 41 +++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 83a454ae9bf8..5691eb2dcfd0 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -18,6 +18,7 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
 / {
@@ -1263,6 +1264,46 @@ compute-cb@7 {
 						dma-coherent;
 					};
 				};
+
+				gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu 0x1001 0x0>,
+								 <&apps_smmu 0x1061 0x0>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 

-- 
2.53.0


