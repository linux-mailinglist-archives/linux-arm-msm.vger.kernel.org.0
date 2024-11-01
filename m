Return-Path: <linux-arm-msm+bounces-36645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F7C9B8806
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 01:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A38F3281D4B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 00:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400E0487BE;
	Fri,  1 Nov 2024 00:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A/KVrrhv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E04A33998
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 00:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730422777; cv=none; b=Nz/t+pbdeQkCU2ljYYVV1pkXSFauLTee+a/H6XMHuJJid7DRHCWWi4mS/lAbitmXMACdYaLk3ETl0pvr85cdLFaN0UckE3nLE7IvgkwvuzlUOnZ6P+/omC3PBbv4wSwLxIqrGxdMldM1hJvAdtBhiQ4KRAxEWKaGBmBtpx8qRzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730422777; c=relaxed/simple;
	bh=VCi6ONG+eExx5zVfektZQ7rdLcz1JpRnARHjJbjRWDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OP1O7pyX+HPhzL9eSsjrmGscUtuJCxv+5q0d8iCl8h1P5esdh6IVVh0etSHelZLJ6h3Eq5Oi44wT7kxmF64fz2Pm5MnxR4aiTbu/foafD/6gOrx6M4PO5mCsXIFogUdsARwR5JqRGbKgmedJd+A5p/8McyaVZ9z1HU9R8Vupw7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A/KVrrhv; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37ec4e349f4so940868f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 17:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730422769; x=1731027569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxmD4h7X2/jUK7rdCnWeAf+paKQ/zGmzscgZHwidemk=;
        b=A/KVrrhv+E/D5BHSkUTP5uJxmAJfQgH2CRerBzVe91ce+iSGXqzuTnXal2YtA/pf1U
         EPClT4bqb6i8gGQrEgoV9QFDh1c+2VrRP2sbxjx9hN/BZ5T+tVC07Ga/u1Vng26DeAp3
         exkQf+DzpJ1iYraS0buAw2lLHcF/3f6Wi3+WnJl7xvtInuYTcO/+ga7qNi+ZjWMp1Skr
         iLkHgz8i72yAZ0i/Wzh8mgU7feWnx/fUcV7ZMNmHBKs3kpepAGPqWtVDByrLB7ReUFBn
         UW6t9v9YUXxy4MaYSFR4UEpxCP3k8NOGcP6OJtaYRn0qwlyTfYEWSpx28RAjv1GanhVH
         fX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730422769; x=1731027569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxmD4h7X2/jUK7rdCnWeAf+paKQ/zGmzscgZHwidemk=;
        b=XWhctEpppQrfuYWg71aSgiDrrSe5pXbLoNu2q6VpoG6L9M6Gwe13DcIKxkltTS3NQg
         m15KhLXUtkZ/HlSqOvhpuHcYmPqhU17Qvj1W9B7Y/2Ck57ofivqrq7mG1rRh3KWQEJUi
         qXEy3qXae91jOAEcuwaDbHitvlDUdyT6Dho083pfA5LbmwhmVVMPhB2rfAUCrAWU6VVb
         ktO1Eu7QcVPKDWwmc5ritfuO+PHfHxr37YDi6mx49kEdOpqX5lIK5JDgaEuM9z0BSiXh
         oNI9DoDst06qGZfd0UqHkOfGc02E52uy4lDaOfNZKzSlWPMNcgoCIO0gAexjEfkeHivw
         BFOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxD4oBpxjqp0PVvLqxxHDFlXAVbZ3gUxinM2qeOK3Z4LWX/XaORUpCgArqGMEax61T6r+u9+Dm9kaaBrz/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6krX5RFsoNyIB3IGmE4S8QTnEmlL2dVdnzG9oGNxDnhOedsuK
	LPcSSPVhLiuycPjPIkBaiguAmeSJMjZAvzvEnci/4rK8Vz6irqx0VYRO1fXPdMg=
X-Google-Smtp-Source: AGHT+IGVabdH84m7Pxob8e3TXE04XGU6HyoNM5yVrAASwBiZxbSZH/+7nnWLPr5n3iVCWBga2Rf0lg==
X-Received: by 2002:a5d:47a4:0:b0:37d:4894:6878 with SMTP id ffacd0b85a97d-381c7a47dd6mr1323810f8f.10.1730422769484;
        Thu, 31 Oct 2024 17:59:29 -0700 (PDT)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd947a9fsm74208035e9.22.2024.10.31.17.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 17:59:28 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	linux-kernel@vger.kernel.org,
	a39.skl@gmail.com
Subject: [PATCH v4 2/5] arm64: dts: qcom: sm6115: add apr and its services
Date: Fri,  1 Nov 2024 00:59:22 +0000
Message-ID: <20241101005925.186696-3-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101005925.186696-1-alexey.klimov@linaro.org>
References: <20241101005925.186696-1-alexey.klimov@linaro.org>
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


