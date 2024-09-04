Return-Path: <linux-arm-msm+bounces-30701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C71596BA1B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 13:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 490F62828E7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 11:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DAC71D173B;
	Wed,  4 Sep 2024 11:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YeZQcuwr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D01E1CFED1
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Sep 2024 11:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448602; cv=none; b=XT+vaDKBgfg/2L0yB575TCFgJKr3oZdFTqaYPMRaVtimMujCq6qlWCA5XSVy83QkeYrG6QX35jyEDu//FePoKc82zhp8/RmvaJiavwCA0WnPqh3sEBPHMhaPn6j5Fwb6qnLn9AMSM4Ckbol97AZ57pu60eI97hq6Tkk7GvhB6pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448602; c=relaxed/simple;
	bh=mzWAaTg1vbJM6BrkME05/UHf2UP8i7OlZSJJiQURPLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fve2fBO8w/7eoVkcqiOav2pX/7X6e7sNLPJkq91zuSe7Ioh+z77H6PWIkY7dW8PkdzYrsEcKSuEc4IHNv8+MAa5yyAx1u371Q3h40GJph+Rrzm9EmEghfwZ64iz/o4VruIh71672cHr7TXNslVKYp3EiUJk3bpG2U+ADWCn2+g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YeZQcuwr; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a86984e035aso792946766b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 04:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725448599; x=1726053399; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tjGT+JlKCba1g954gJtXN33KdKuouaatEcokaL5FlZk=;
        b=YeZQcuwriMvLJQqJEd1nbUoy/AATRBh7SuN6FFBN6JATqrrZzUuTaAwTvXPjEUWjtA
         FBPLSIDUaiIiTU4N7XEWeZoksDbPoG4h5zw7jdWy8/8Ai6jV6UvoQkbmVAUKMwOUq3oE
         9YFgx6mm9EQF+cn6NKe4Yu0wUaMvVSSMtfXofCAP3GBEZLATnL5pTwMzXMAkTMK9h0oj
         zk1VCCuwiV5q5Ix+9qfQlRUG1BuwLfRnXtqXUb6wTmQeBwlgBy+SPL4t+4hYE+klt/CT
         FaZ4OH/OkjBoISYQCqhikYjMb2vUXQlQoVKgOBbc1Dawp86zH//rfkhUU6/bxCSzWN6K
         k8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725448599; x=1726053399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjGT+JlKCba1g954gJtXN33KdKuouaatEcokaL5FlZk=;
        b=LnL1AiZZDyhdwIzcXUWJ9lrIVJ5PRLf02YxXlo86TuD0bgK+TTmmdHKP3bqRFe7TWe
         QUqBf9O4walkEE56Ih+WQOShV35aUaifqJDetmucfgyxaq3WmLldRw/qmG+OXCFm3Em5
         0zJGhMAG3D3st0r6mNytjHGWXPgPA/bzvfEeDc6GwygZVvF3z63UJnklFuuB6G718gbJ
         CPivTgJ2D4pkF4x6ExVTVNa4QgvKAwD9+gQb0HsQ2yEmjHh43O7JCrZx2Iv8+elkrdF8
         0/UXdQFLRJiS6+b5TrmxtjrfkcF2IoepiFvSRC3/nH46/ibQOu1c15HHPYFQyfJrVzHU
         INng==
X-Gm-Message-State: AOJu0YwzlnAWI+D6GkAo50aFfOAiu2QbKSA3nm8ePwFGjc+LoK8wo8uY
	atuEVXaE/bM/5DYBJzupwGiBb6Ml1gCjS/PiWY5J1GXYcWdof0YF4S8lKN8pDewFkUQEj3MOOur
	P
X-Google-Smtp-Source: AGHT+IGn+GQbP5fd7st3YxaACzT0RTH+AVxqaXHB+qabpc91J5Tjh9FmhddLqjOldCVgfMgOy82hHg==
X-Received: by 2002:a17:907:e88:b0:a8a:3ece:d073 with SMTP id a640c23a62f3a-a8a3eced351mr177200866b.10.1725448598522;
        Wed, 04 Sep 2024 04:16:38 -0700 (PDT)
Received: from lion.localdomain ([2a02:8109:aa0d:be00::a253])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988fefc12sm793401966b.9.2024.09.04.04.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 04:16:37 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Wed, 04 Sep 2024 13:16:25 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: qcs6490-rb3gen2: make node names
 consistent
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240904-b4-rb3gen2-usb2-v1-2-b858e681195e@linaro.org>
References: <20240904-b4-rb3gen2-usb2-v1-0-b858e681195e@linaro.org>
In-Reply-To: <20240904-b4-rb3gen2-usb2-v1-0-b858e681195e@linaro.org>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=mzWAaTg1vbJM6BrkME05/UHf2UP8i7OlZSJJiQURPLw=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhrQbjpO/cs47+F1fJ+udeFWA+KYV+6VuvmO0PZExdSfvj
 vYp6zX3d5SyMAhyMMiKKbKIn1hm2bT2sr3G9gUXYOawMoEMYeDiFICJhMYz/Gbt6XaS/l8lk+r/
 ceYaIdEkv5JGvgW2c3T2cpRZ+jEFhzIy7D0TYbX016zPzeYXM+bf33fX+/NX2x3LLc4/Spvo5r4
 89CIA
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47

We like to order node names alphabetically, to aid in this we should
prefer naming nodes with the node type (connector, regulator, etc) at
the start, so we can group similar types together.

Adjust this on rb3gen2 so we can group connectors and regulators
together.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 0d45662b8028..513d5265bb13 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -37,9 +37,9 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	dp-connector {
+	connector-dp {
 		compatible = "dp-connector";
 		label = "DP";
 		type = "mini";
 
@@ -51,9 +51,9 @@ dp_connector_in: endpoint {
 			};
 		};
 	};
 
-	hdmi-connector {
+	connector-hdmi {
 		compatible = "hdmi-connector";
 		type = "a";
 
 		port {
@@ -195,9 +195,9 @@ pmic_glink_sbu_in: endpoint {
 			};
 		};
 	};
 
-	vph_pwr: vph-pwr-regulator {
+	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
 		regulator-min-microvolt = <3700000>;
 		regulator-max-microvolt = <3700000>;

-- 
2.46.0


