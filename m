Return-Path: <linux-arm-msm+bounces-76145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E71BC0008
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 04:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 718BF34C947
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 02:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABD6216E1B;
	Tue,  7 Oct 2025 02:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g6bqFfaO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73772135AD
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 02:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759802626; cv=none; b=P25bUXJtMj5sI6Wurl5cPOB60+AXM+r1w5pbB/Gs+5JWsDxEGCT8qnNxbFEp/Fg9XljOPDOOJzsJdGeyQM1SGA95FKt9LDRUXD6nA955V6sMItkqInpknIQBWGsIpYqhpmjXZuRNiHMRIfM8kmmxzdYQGo4u7rZM+055RWCQoAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759802626; c=relaxed/simple;
	bh=mzm8zjzGXa3bcj2hI1nuVqjf+8xVLhv71Tv/OMlTJC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J+caTzhpIDBhhfNOAEUtBgVeRW7nr6s+Yz1H32Sc7ul7ZXKq9lYJ/V0KlLYlvfAt/SkKOrFAqt5Wxt22MdpnA5OaztTtd1EFh/vw8aOWTzwuGormYa6FXA7vFx5NkcjBUuWLSB/c3WZtrje1QDIXRuFUz+GwE43IiOjWdqLciAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g6bqFfaO; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-36a6a3974fdso58121691fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 19:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759802623; x=1760407423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGUtKwd70bSCJqEqH6YRK5k2F3XmhHRzuE4jsE9R33M=;
        b=g6bqFfaOYJ7ZSkuQhlCZaUGoXNKvF1XSUh0oKEh4m9MNbTFf35fuYkSbdl3z1nhlot
         WALWuMa//rD1r2ASBZk6lSf3iCIj3MeJSlBBjJQtSE4atB4D3OdLM4rgalnJtX0lwPNf
         FJ4AxnWRO8kDryyNZIe+m0lfzI4HUGuFy1R/5eUxDAmDYTjgL8SFBY8rNjSYl3vRClWh
         b45bAinUL2NLgMrYPBeP2uuK+8zDPHOfG2GACFJYiu5oTNEw2Li+Y3d2KaKgVnH2pYmB
         hwNjiMRQpgVmllt4q7/grEJiR+8D6sxXKUFGl5BWY01YHJRZnGMht2U269Tzg5WNaQmR
         cang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759802623; x=1760407423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aGUtKwd70bSCJqEqH6YRK5k2F3XmhHRzuE4jsE9R33M=;
        b=pQmXcPG/aVgNZ30xNY+njdTJlk50Fb9CRXXd1g+w8MP8amcqVXWpTHIkQiXJcWnbt4
         i3hSRlqrc07qQlc8MVQIXGUH5EC0u5WBVe5vcF3MwXmCBQBSkzyF/IJXq8CJuqtp96Bt
         Oew6Ej/WME23h+ABKxmmVrWozmLLKOIwVN00PG8g3oULCTBYXy/XmLND0hKj9UQ5F0Q7
         Q4XL9xItPfn7g5wraXqkaSGirEBaqqZs7+w/6AYKShGWehV1ohy1y+yozABTDm43/Nhs
         N/H6w4xdzrHGx80zaqQ0TsKJiK5LfZETQ0qJ/HCc3HtTohpELZjduNmymmc1gqGLQXPr
         oGcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuGhgR1XZQoNx3NotWyxNDeB3dw2j4rWcWQFw7CnQAHxzRlLjp3/o5bEbjYVskceHWy5MfTduNO4DpIMpk@vger.kernel.org
X-Gm-Message-State: AOJu0YzvGsUqedLjQP3/utGYu4z5UipLCBeRjmuRducKQHG1oBARU+Cp
	xavGAs32QJwT43paxdQpQ04AN1pOMD6/sGyRM6ZoczPvJUbjFhjDJCEmdAUiUg9Lkt0=
X-Gm-Gg: ASbGnctN8TQ2Nm1ncN9Dh0dAlULpcC5P4qhsepGmEC+sHERBZtfoVFmhqktUOaYCnNR
	COXpffxKLy5YJvC54nFljbggno9J6c4M6noOO04KosePIK4hXpxZe7n087mjWWgFam5pQ3DiYmt
	jNxXHXp952yWRLqxYj11y9RRdd1Iu/u/jWkWa6X+K6sbpfI83FN74/BgIYyyQPgE0VoIBFpsQ58
	WbogipWJ20PYqGnI2lgLgq1MsUBVjAopqugDkc5J7+onMw+wMNdPRWFPLjFv/9yBZHuRn+4HMV2
	4vMEtYIdsp/2zY6aRBrxDooWEk9PqHMMDzt579LtX7sbjxr3jsoAO6Qj/iTjul8fbenfez370WX
	kl104uM9dXq+K50JrcOw4Y6ZUT87HPAQcLWTQ8xtKwTNc+YlzDHcM1VNp
X-Google-Smtp-Source: AGHT+IE4HQVkFdlKGXrY6xYmCUgYIpVGDsuz28td854iUk9lX9wCkBz74qKY5/pdVWTQuPzyDebo+A==
X-Received: by 2002:a2e:bd85:0:b0:36b:3a21:9c28 with SMTP id 38308e7fff4ca-374c38370fbmr41203691fa.26.1759802622931;
        Mon, 06 Oct 2025 19:03:42 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:22ae:baa0:7d1a:8c1f])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3b81e45sm5150391fa.46.2025.10.06.19.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 19:03:41 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 07 Oct 2025 03:03:30 +0100
Subject: [PATCH v2 2/4] arm64: dts: qcom: qcm2290: add APR and its services
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-rb1_hdmi_audio-v2-2-821b6a705e4c@linaro.org>
References: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
In-Reply-To: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2

Add APR (asynchronous packet router) node and its associated services
required to enable audio on QRB2210 RB1 board.

Cc: Srinivas Kandagatla <srini@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 72 +++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 08141b41de2462ce91896fd84644413fa46ac047..7303aff33814f256a2ea09a71a640db466370eff 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -17,6 +17,8 @@
 #include <dt-bindings/interconnect/qcom,qcm2290.h>
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,apr.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -2077,6 +2079,76 @@ glink-edge {
 				label = "lpass";
 				qcom,remote-pid = <2>;
 				mboxes = <&apcs_glb 8>;
+
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
 			};
 		};
 

-- 
2.47.3


