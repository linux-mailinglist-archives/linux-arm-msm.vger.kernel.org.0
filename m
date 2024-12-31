Return-Path: <linux-arm-msm+bounces-43753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1182E9FF088
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 17:10:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD3721621AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 16:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075331A83E0;
	Tue, 31 Dec 2024 16:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="XpX8WPCi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7CA1632CA;
	Tue, 31 Dec 2024 16:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735661402; cv=none; b=XnS+9Mr5mKXcjneGYp4U+vdPuKalXfyPju6Hxewz+dg+lrA8WzuwyiTA2/4uqtVl21DbViw8AzvDBpPvpt4gNQdKFt3dzbva61AurHHB+lCuGuADMrIFTao7q6NCol+CM5ukn6w3FvekYyQ/D4bBM18XzunoITuW6vTzJiKtT4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735661402; c=relaxed/simple;
	bh=DpnrQEL6CozJF3mUatwwphvHvZU6Va/f8onXDizDmn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GVLTGsjCp94b4MkcR7+GtrdKau0gWvK8yCFpBmq+3TzbuvtEyh3AzkR2p5qc1OsMcOQzTiR/oiAJTTGH6tpCqKllGyFOZQeuh5FDtX3hlwXJjexfRl3j4uZF2Kh2j5+QJTo/nHfYmzbiJzsvVWijhI+Laf+Uap0Zr541R0hKHsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=XpX8WPCi; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.30.162] (254C25E0.nat.pool.telekom.hu [37.76.37.224])
	by mail.mainlining.org (Postfix) with ESMTPSA id 4BE83E484C;
	Tue, 31 Dec 2024 16:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1735660875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zIxIbqCYxjh+W+UwImRvIKQDMyiYsiBHIAlUhyBxUVQ=;
	b=XpX8WPCiSJ4k8VT8wT/BhivG4fE3esZn60UO8giXkiv8sZ7O7O95lcD2yLMrtH3cvxH0Xz
	Sr9qZPqyKEBnHsA+YXHa0EQoGNW0nKdnDbLwakAiNBZocRddTDwkAVQWK7N4ZEmlfoXG/G
	rOr481wZFdfwHU4ePs2s0bvaWpzINSC5ouhpAEBdqNBWC5SXYfrqwOay1WF29fBJN1ja2F
	4naYGtD2+ai+KSBGmrLM1oZ9eJc8MNV1GfGEISZY/hTtiNUDm0Fh6Z4eWbQiAk0EKj21fn
	dyDmvt6g94MpsvbQO6fsDEWMx1+sOwVbauQF2FVAd14ngmCkBtLrvDwTKx9wmg==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Tue, 31 Dec 2024 17:00:49 +0100
Subject: [PATCH 1/4] dt-bindings: clock: qcom,rpmcc: Add MSM8937 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241231-rpmcc-v1-1-1212df9b2042@mainlining.org>
References: <20241231-rpmcc-v1-0-1212df9b2042@mainlining.org>
In-Reply-To: <20241231-rpmcc-v1-0-1212df9b2042@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Daniil Titov <daniilt971@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735660873; l=1188;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=GC4Sxaf3yoPtDUN4BAwzx1GqbzDGKhrpINtUr0wJKoM=;
 b=siys6A3GvZkNo4eESS92Tdl5ul70rKklahGDaCaIaD8EBJo7w9YcKfoUGSAbaCs6hyB2x4EeB
 l3mDMaNwLtwDnF9H3CpnGH9imx8xiq8AZQUs1TMqXQ5zaJANcyiRBQx
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

From: Daniil Titov <daniilt971@gmail.com>

Document the qcom,rpmcc-msm8937 compatible.

Signed-off-by: Daniil Titov <daniilt971@gmail.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index 02fcffe93f1aa86305140bdc090f21a5503f9119..e58f43b1ab602a6fc8484a60dccafbfa52357dbb 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -33,6 +33,7 @@ properties:
           - qcom,rpmcc-msm8916
           - qcom,rpmcc-msm8917
           - qcom,rpmcc-msm8936
+          - qcom,rpmcc-msm8937
           - qcom,rpmcc-msm8953
           - qcom,rpmcc-msm8974
           - qcom,rpmcc-msm8976
@@ -110,6 +111,7 @@ allOf:
               - qcom,rpmcc-msm8916
               - qcom,rpmcc-msm8917
               - qcom,rpmcc-msm8936
+              - qcom,rpmcc-msm8937
               - qcom,rpmcc-msm8953
               - qcom,rpmcc-msm8974
               - qcom,rpmcc-msm8976

-- 
2.47.1


