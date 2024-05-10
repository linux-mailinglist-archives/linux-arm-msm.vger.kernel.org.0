Return-Path: <linux-arm-msm+bounces-19686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB908C24D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 14:27:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCDC41F2590E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2141170843;
	Fri, 10 May 2024 12:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="5NHiFOW3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBC14DA04
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 12:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715344043; cv=none; b=jvQkir8ZIo+amsPEAu8wV8Zxoc2xz+B9PSVtLfxxS+8MdHQbBjMCeD8Udwr0THQawon6FC3d/5PM5MLNT+KQzkoYvNrLEW6GVIYWK3sqhXvrXy3hF5L7Y20aRjhJAb10LG7l0oqvjNx05c0LGe82QqQdW1m9pWyRPTO7/ZTVu9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715344043; c=relaxed/simple;
	bh=YI/X1yQpHazLlMPIDEcyq57BX5ZwTRyw+vNUlPVa8tI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kr1GUeVFSK4EpBonjYmXU9dEFynrYo3OjgQ3so3F8o5SwwcOm3HEO7NyJcK6UkqXzLeWS6OiDb7jthIScPnwmwvc797sa5s0XwVwFGithu+LL4QKVewTkQOd3cb0dB5b2MEibBGoiRdp4e2vx1GK63YY+sKd3Rey6ZQGA50IpmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=5NHiFOW3; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e1fa1f1d9bso35552041fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 05:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1715344039; x=1715948839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBRk2f+1EQ0QzQMLpZj+en4CMV9rwE2n8DSDONNWf8o=;
        b=5NHiFOW3ehqwJ6pxOuE5PgEiLXoTWoG9cFBLXYuJI0I3oCGVARBL5QfvHYTJ7iRzCn
         xNnRcSq+Kb7LTC4Ob7ZtcRKrS7Umxfwc0SoAur/zdSdjfaFmCgjuXnHO5q1PAkabSID9
         zWtUXDBVPzcgGSlcFZiUOk9fAWZM1TGwoGEzYegb+SehRDMOj2fNt+153Nq/dxwp898S
         6G25wXE1pi/4OlTmhUeu5HYA4Btnss9dwm+SZQILflfzCoUcPYISKWm2xWVex3xivrOO
         D/CiY1qplPR1O9ANiwITBdS0M1P8hlwg4vul+hbLTZ1oHrLtl8mK6m6P0IlOGkhapyVg
         l8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715344039; x=1715948839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBRk2f+1EQ0QzQMLpZj+en4CMV9rwE2n8DSDONNWf8o=;
        b=CCD/xQtRd7RZIBsbDx+9IPjLpAaatUAbqSaW6XC8VNYfiyLz1gDKmx+Efjdefy1b2g
         sWl2dJb+4NLxheGRbL1gRbEmY4nTOpzJP64P8iWQAuBEiy6N+dS29Kd5xtVy6qUgz4/s
         D5CwSy3uxhg9fa8bn+rTjjFF0/cuptie6fULSE1NXptEA7JgFxFcwNa9ZehGB45+6d+J
         OFE77nQ2SYfmer694qqQlXlRgnl/VLaFUvhjUU9nQSu6JLZzmEi5+M/mX5T6BPRBPatq
         4ty/XE3UHEqq163VH9ZKm0wCk54hTZb/8cia2f3+ApJTNDj8cYRTYYffmYkwJpp7ZdOq
         OYDg==
X-Forwarded-Encrypted: i=1; AJvYcCVelsbuWkEgKKmwauEJPTfKTkpS8DuLuK5uYlSE2F/pH8nehDFLQ9+4eFT0lY/3yv2TcgnzDnXV1o4VwesFBbTj0kjoRV+uSUi60jhdbA==
X-Gm-Message-State: AOJu0YzdXnFiJlHe8j4Kg8L0swpXwf8DNIli/GVM7FCw3X1bGw8Kw1zf
	YkkBuNgGUAj/7YoTWarkLPs1OMIRPzLxIcZks1X2NbaI9EIq8o/Hb4TUSnYwfk4=
X-Google-Smtp-Source: AGHT+IGQ3LE2MmsyJ2Do33yJcWR7jZu7eJpGjImVL+LcRY5dCAMAdCFOWIUCBssr7yzD4iLgZbMKZw==
X-Received: by 2002:a2e:9e97:0:b0:2de:75de:5b0b with SMTP id 38308e7fff4ca-2e51fd45535mr19216561fa.18.1715344038892;
        Fri, 10 May 2024 05:27:18 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (2a02-a210-20ba-5a00-9ceb-707b-2d57-26f7.cable.dynamic.v6.ziggo.nl. [2a02:a210:20ba:5a00:9ceb:707b:2d57:26f7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b017b1sm178043366b.181.2024.05.10.05.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 05:27:18 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 May 2024 14:27:08 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: sc7280: Add APR nodes for sound
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-sc7280-apr-v1-1-e9eabda05f85@fairphone.com>
References: <20240510-sc7280-apr-v1-0-e9eabda05f85@fairphone.com>
In-Reply-To: <20240510-sc7280-apr-v1-0-e9eabda05f85@fairphone.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0

Add the different services found on APR on some devices with SC7280 SoC.
Additionally add an empty sound node in the root node as is seen on
other SoC dtsi files so device dt's can easily use that.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 73 ++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index fc9ec367e3a5..659212bb38c1 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -24,6 +24,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/reset/qcom,sdm845-aoss.h>
 #include <dt-bindings/reset/qcom,sdm845-pdc.h>
+#include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/thermal/thermal.h>
@@ -3762,6 +3763,75 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
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
+							iommus = <&apps_smmu 0x1801 0x0>;
+
+							dai@0 {
+								reg = <0>;
+							};
+
+							dai@1 {
+								reg = <1>;
+							};
+
+							dai@2 {
+								reg = <2>;
+							};
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
@@ -5991,6 +6061,9 @@ cpufreq_hw: cpufreq@18591000 {
 		};
 	};
 
+	sound: sound {
+	};
+
 	thermal_zones: thermal-zones {
 		cpu0-thermal {
 			polling-delay-passive = <250>;

-- 
2.45.0


