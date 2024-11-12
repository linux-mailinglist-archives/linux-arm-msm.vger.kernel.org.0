Return-Path: <linux-arm-msm+bounces-37536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AB99C4CD3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 03:53:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 263431F21769
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 02:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5892076DF;
	Tue, 12 Nov 2024 02:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rMAeRI6u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27071204932
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 02:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731379995; cv=none; b=qwpJWtI5Sf2l6L62iJyZdMROtscyC+Osss1x2oWqFnZRowY5ElW5T0gP9LP2QuFYhwYfqOoJMdMfnrL+23elwv0H8uedP4bL81JnWC/Phk7wTljFwa2rsZHT7xiaeiG6IcQfq+Eq7YK/WOrb/JLBByBMKv3Voj9ZKy5LXMkEW68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731379995; c=relaxed/simple;
	bh=Y88dxKTEB84Sy5sor9WVb8Lb3Eunx49GPWiCvst3MDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nC+2CeJkJYgKs4ms+I0anSFPVzoohfKN2r0hWgv8lVsinCg2AuuEt9TQGPfCiyezhSdC/VeydGYEJETBiFbwaBWuO1tMsmJnd2rbB3Go/ZnY01uxk8xeObQ9Zjp4XgPDNWIz7OYpC7kqNPC+trLihkSfr1iHO5y7jjQUrxBf0ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rMAeRI6u; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so44584535e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Nov 2024 18:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731379991; x=1731984791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNkMnvZSHVbHckJCKRyiqgolyEylIkwRfPR/FWi1wBE=;
        b=rMAeRI6uYErGM1DC4oYv3h7pn89xehhoeyG1jiy2LFh7wwRPHLQbhzu1qK+P3O0dhu
         yJy2BwCUAMPrmz8hxCF85SHbbjJcek1KKbpljD3v7P9bTNdXFZL4kaP9QlTKzXxyBmmn
         PkR2MKnJlsf8ZoHDyFZzOkRMM/lvadjpVCzoQJilK3avcTjMrNgwfqRX8d+kyCVskgLM
         8Ia6UgXPWhV2U03XM5TTgHV5c7n+4aH7kwjusEzYk6F0IWGzADcjrw/rh/Sc6V6tTrR3
         4z7VtlKjSwtjcRCWEf8+1FeIiU/7NIFeocuXO+7cGyMQwhMEsVL+P+2CH+kfMEYoJMzF
         Lekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731379991; x=1731984791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNkMnvZSHVbHckJCKRyiqgolyEylIkwRfPR/FWi1wBE=;
        b=h2NBRkvZlxI5DV5mx0K80JHZRUQFFeAG2OXgFzbcOcqrQR6BIWTpkY/7ow6IS00Rwk
         Y3hdnBhEAiq4OcAGUxUW5QSpd6ruadWkJhWJZRYijcMDfJCnq1AYUzWUrmfMIUn+bI0L
         ND12UM7IynxXQB6Wfo1I6lLCFTECI/pyeiGh7Gwiqk5VNufgQ5DxcSI1fr9BvF9FIvKF
         d2qku6VZMw5jfEd3CFtCRWj1sbgBdiZHcxgNAytrUb1YBbhG4djiH/XTKEt7LeU4zgZ1
         cgPq9DTvulwSN7sJ1bh90f3Tb5t2+2yXd+CnXUw2YRvt+JBU8dMXVf6HiW5Y0emnHu1Q
         GaOw==
X-Forwarded-Encrypted: i=1; AJvYcCUzOB7cR0t7zh43FrfjPKIgARI8DW5MbiPROp2ytwoRDrmd0ppcTOkvnbk+sX22OpbjIy4JDxFp/iekMIrf@vger.kernel.org
X-Gm-Message-State: AOJu0YyN3vfzrgUsritfbfs+pFWz3/iyVmZ0ARqwKHio6P5BIvhCmAPg
	fqVYLE1GPz7KjpzVa+iEQDab3BatsmX+voMQa75C+Y+Yr54OSIPSPu8bkgwRbKiP4GohC7P7grx
	s
X-Google-Smtp-Source: AGHT+IEfD+tJcD7cA0hU7+ropJkve1bk3ekvCpds1lfwTN/idzFvWLSQGdQvvyAOVZWbpqb4QDytcg==
X-Received: by 2002:a05:6000:20c3:b0:382:51f:60a7 with SMTP id ffacd0b85a97d-382051f616cmr2188794f8f.33.1731379991419;
        Mon, 11 Nov 2024 18:53:11 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed999e0csm14056380f8f.59.2024.11.11.18.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 18:53:10 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	a39.skl@gmail.com,
	konrad.dybcio@oss.qualcomm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/4] arm64: dts: qcom: sm6115: add apr and its services
Date: Tue, 12 Nov 2024 02:53:03 +0000
Message-ID: <20241112025306.712122-2-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112025306.712122-1-alexey.klimov@linaro.org>
References: <20241112025306.712122-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add apr (asynchronous packet router) node and its associated services
required to enable audio on QRB4210 RB2 platform.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 72 ++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 9b23534c456b..816b8331933d 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -14,6 +14,8 @@
 #include <dt-bindings/interconnect/qcom,sm6115.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,apr.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -2701,6 +2703,76 @@ glink-edge {
 				qcom,remote-pid = <2>;
 				mboxes = <&apcs_glb 8>;
 
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
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+					};
+
+					q6afe: service@4 {
+						compatible = "qcom,q6afe";
+						reg = <APR_SVC_AFE>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
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
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+						q6asmdai: dais {
+							compatible = "qcom,q6asm-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+							iommus = <&apps_smmu 0x1c1 0x0>;
+
+							dai@0 {
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
+							};
+
+							dai@1 {
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
+							};
+
+							dai@2 {
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
+							};
+						};
+					};
+
+					q6adm: service@8 {
+						compatible = "qcom,q6adm";
+						reg = <APR_SVC_ADM>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
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
-- 
2.45.2


