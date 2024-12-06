Return-Path: <linux-arm-msm+bounces-40769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDEF9E6B7E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 11:14:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1283418851D8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 10:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E13831FF60F;
	Fri,  6 Dec 2024 10:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MJJm0MO3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0190B1FCFC7
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 10:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733479989; cv=none; b=oaLN/ameLpNnSs6EXWsC1OeA3JEa3Vk4oxFM/3NkvZX/XUqyZtblxMyfPV7eCO9fkN0iODHtXRr6rcbZJu2dsAEfYGSUerCyRqEfLQp4nwDz5545gP/BsR4VaLR+/B8PO/tti77UCXUuob52kSAb6memJpkHJCXV3Axo8HA1uIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733479989; c=relaxed/simple;
	bh=HHt/umcpRq+rs/P2wbiPKSdjqZ1QwYbx9ZVZDypcOTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nWMhW1mF575z2kEstU5O2U8clkHtYttx7zylMGIm1XXgDujHvfQQBL24EVXn5W8vS4rSG1ZfqVY5QmjbUC0dNm5zp78hkziGhTCfb/7d7qDOfLAF66q3AdjBoN65q2TaTYqaTOxahmAGbROezoIuFKr0gSaxPW4tPbq3OaVpYg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MJJm0MO3; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-434a9f2da82so12567345e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 02:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733479984; x=1734084784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FVKyCHkPbEDOof6AiuTgileClIawd2CAXyMde6tHgVA=;
        b=MJJm0MO3+8lRflmTWps680Ri64lM1DE6dqit4b8t/PqTkT21Sf90zelMojdmjqMR6p
         6eB0qHPGv15OEjsJA1+dsG7PoLBFr5rumb8o52AuC3Sk1LNqrt13fk/YoC3iYn73DlB7
         N8Ay0//OODJrSJUQbRcE0vp1be9A1Ns3y5Hnurh+jzBdTxnEbWS8tkmMfdilvFMSCL59
         Eg6ujB93pzeGjF6Whi9ic9A//oNPqf7YybVNA9JOgMcscMbKQ0EBBA030JjsefSun/vu
         skvcY4ID1XEVKqMWhnOMfRob52upNCvmyv8zojKXAYDTdm2JrQrhHONfiI9DZGDh8CmZ
         p5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733479984; x=1734084784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FVKyCHkPbEDOof6AiuTgileClIawd2CAXyMde6tHgVA=;
        b=jICxInh6CuuU7jJZ6w6IKupYk7gbQJVYD14YFvejtjCYcxsWXJjdIcokBxv9llaF/6
         EEPyJdGbrYpk+5t+2LnJgRWAyzvl+PKstshTqcj9/hQSzHg0STXH8k9KF/s3JWRSBW/p
         VlwC7jLXRD03XCGLDvldjT5f/uw8ng3ctuHqWy/m6pwEHWa0EBaSJj29f1+rR/TF/9Nv
         9s6rDH7QhIHK1HE3Oy3XzUuN2Jqwgu0lGsX879e2ccpdG2yr15rWofMFAGyIq7xIk5Sz
         v9/bBGV5nys6BSxB40GAZRdLBR8NsdL0OKEETQC2DzqGo6NyDnNBzbv03GIuzZUBhFSP
         6cHg==
X-Gm-Message-State: AOJu0YyeXup9BH+pyDhLsY2e/QcOM4TDmRuM7ztZ1VvERaEMD0R/60+T
	MdpW+2YD9H9CrVcEQ8Xyl6lMjPZ1QVZ45O+Do0W/bJlXkaEgOQGaKUDENHOVVX0=
X-Gm-Gg: ASbGncufMJpbZ8cQGMzE+jDmehzSyrMuguF2lpv+qo+R8xMla+CQmUfQb5kmpXEw6NF
	/lcWA8boWZ92GDFVumPQh2KXwU3B9H9+iI/fGGdCq8A/ZfcJXOfYkuaa657oY5WLB8Nz1c5T6JU
	eu3wAQ+VizTxvi/djD/BRPLYtFdH0q0esLXJQw4eEc6AHbR3Glo2Mnvq8OUCEP4mnxiTrtCmTb6
	t4g0MU7lskSWEmgMJPJpsWMbAadmWxzMEGenoI/rwTFOLAFeweEwIlNis8Oyjy8Fo/pVKM=
X-Google-Smtp-Source: AGHT+IEf3Jr4NkVG3qhWEDkzqbVNLNod6hlFYP+03yV/UAgelQshnrMvchEMoWL5eW25ib4d9QGspg==
X-Received: by 2002:a05:600c:19c7:b0:434:a781:f5d2 with SMTP id 5b1f17b1804b1-434ddea7f36mr19728975e9.5.1733479984314;
        Fri, 06 Dec 2024 02:13:04 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52c0bfasm91092035e9.32.2024.12.06.02.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 02:13:03 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 06 Dec 2024 11:12:57 +0100
Subject: [PATCH v2 5/6] arm64: dts: qcom: sc7180: fix psci power domain
 node names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-topic-misc-dt-fixes-v2-5-fb6b9cadc47f@linaro.org>
References: <20241206-topic-misc-dt-fixes-v2-0-fb6b9cadc47f@linaro.org>
In-Reply-To: <20241206-topic-misc-dt-fixes-v2-0-fb6b9cadc47f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2701;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=HHt/umcpRq+rs/P2wbiPKSdjqZ1QwYbx9ZVZDypcOTg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnUs4pMg+3TpC2R5MS4ymK8Q8oXqpzjDgaKHtGT8zG
 oPhcpOyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1LOKQAKCRB33NvayMhJ0Qj9EA
 CHq6bWxm0jbaWI5n++0IjFOln+i/vtGPhu0wf3YfzQKjpoaZMMVTQVPEhwQn6l3JMBdNkOo8Su4oC3
 RZdnK+nHPJI+awnEhHdT2EngUsKTDzyyUZcjDwIhgEU3DvC/TUOvELgz4/VH1KlgsJtJ0Fc/o0ZwmP
 P/v42En4YVSNfx2V73LqbiT62EswE5cbhmiiT2HjyRWwwtPyNq37DaxDS3wz/ATdZYfSXwFK6IL9lr
 cR8jtU/V79AGe03wxDwlJLs5n/wTaJFreGNntknD4znXzx9ypt/l1kTHxH6pRxFRcYX2u1MCycUCzd
 YMRvGl9OKcYgltIRzCc83pr724VCbcyHvU5pZofheWRV+vKcHEg5HZtttPCET8F4xpWqPdQ5avC2/E
 DUEvr7hB+7EtkNyY+184eRQZiBg7HESRjyumdMSt3QznLrjrYbUBjeoZggqirzDeVoJuG6BHYOwvzD
 9fhd/iYzPqSHTXNM4BlbVUV/i3yOPnj7V54dgl+mhKLOiem0VCZo24kZyT4Uap3yteAP95nE2S0HuI
 VFGYEcRIMOfzTbIgBEI97NiUnTqO5CDGg2M5Fepl+kwyLsiE8AHI3Y6Wqc2zH6t0W0JFZyUL/QICRk
 vNMw3saaLdw2GpXt3jfPJZpfnSGTrW4H8QP8FgbWz459/Op2hwxKvwCmFeHA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Rename the psci power domain node names to match the bindings.

This Fixes:
sc7180-acer-aspire1.dts: psci: 'cpu-cluster0', 'cpu0', 'cpu1', 'cpu2', 'cpu3', 'cpu4', 'cpu5', 'cpu6', 'cpu7' do not match any of the regexes: '^power-domain-', 'pinctrl-[0-9]+'

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 76fe314d2ad50d002ee6adf4659fa685ddae89de..e7773d215f34eba9a42808eb37fac7fa1fda87b1 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -580,55 +580,55 @@ psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
-		cpu_pd0: cpu0 {
+		cpu_pd0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
 			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
 		};
 
-		cpu_pd1: cpu1 {
+		cpu_pd1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
 			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
 		};
 
-		cpu_pd2: cpu2 {
+		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
 			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
 		};
 
-		cpu_pd3: cpu3 {
+		cpu_pd3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
 			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
 		};
 
-		cpu_pd4: cpu4 {
+		cpu_pd4: power-domain-cpu4 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
 			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
 		};
 
-		cpu_pd5: cpu5 {
+		cpu_pd5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
 			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
 		};
 
-		cpu_pd6: cpu6 {
+		cpu_pd6: power-domain-cpu6 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
 			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
 		};
 
-		cpu_pd7: cpu7 {
+		cpu_pd7: power-domain-cpu7 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
 			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
 		};
 
-		cluster_pd: cpu-cluster0 {
+		cluster_pd: power-domain-cluster {
 			#power-domain-cells = <0>;
 			domain-idle-states = <&cluster_sleep_pc
 					      &cluster_sleep_cx_ret

-- 
2.34.1


