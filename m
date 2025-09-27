Return-Path: <linux-arm-msm+bounces-75366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E58BA5897
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 05:23:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C72441BC6824
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 03:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB181ADC97;
	Sat, 27 Sep 2025 03:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="P0DNo63o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499E91E5714
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 03:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758943401; cv=none; b=ooy0tV3DQDK6CJTyx+g6cZPLg/pRfPnOGqFwX8IpdVWNvtE7IX1RLpzeOPJGcg4psc+O+hNKbDy0vqRnVOGZUbPoBDtljTXlvP1CNM2kn0yxHjO3tgqAb6OXxjEInArGbKSjxqBfeKTLZbvY20yvtio9FsNKb4trjaoTpE0w0z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758943401; c=relaxed/simple;
	bh=ibAp27QMck5+GCF2v6MZNNDbYsRl+c91cqSLQJktu5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SviUgBCOb2eZhMQJcPZ73eOjleSn5hZ6qa71Yf9v10hO2Md0K9MSPERQCdfZCerBTRuPn/xEa7LXfto6IzhMhdHBFGbiFS10XwgO7sAeWW0zkNGZjyLoN85gzHb2Sb1f/CbxButCOwzP6Xwyf4nGkD9jY7D7Z2aO6ZjfuWU/I9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=P0DNo63o; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1758943387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eG5FlfxeVXDWKvokhCaq7u1PWavtxnZJyjs2IS3VKao=;
	b=P0DNo63otVfI7bjvakwG3WZ7PLpQYc7dIyDvA+gNy57POI3d3Q4lA1kjaMEERYU69S2EtN
	9qlKkns34brJrT/WN6GJrloSAzKvqE0NETGpGUxBSfJkXfmlVMUhfMrdQRXA28yPQg86dV
	hVkkKFnBlx2yWIPFTlMR6CDv7XpKtyAx5VkJj+wQK8XEZWwauOdSBngWSgvWUqAGSbOo9u
	DAbpGsTggTp0MXB9ONWmvJsLoR/8l6QoZ7MxzPHiX9PsK2wVVIxWbtw3YW/Ark1sS+vFDV
	/IwhYoFgdndwyZ6Gh6GbzRWjN2M8T1O6FxWbxNT9l2N3nWP8W40sgcQ0d1UhVA==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Val Packett <val@packett.cool>,
	Laurentiu Tudor <laurentiu.tudor1@dell.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: x1-dell-thena: remove dp data-lanes
Date: Sat, 27 Sep 2025 00:22:24 -0300
Message-ID: <20250927032240.20759-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The commit that moved data-lanes into the SoC dtsi (458de5842) got merged
in parallel with the Thena dtsi (e7733b42) so these lines remained.

Remove them to enable 4-lane DP on the X1E Dell Inspiron/Latitude.

Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
Signed-off-by: Val Packett <val@packett.cool>
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index d71b67824a99..ef83e87e1b7a 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -1090,7 +1090,6 @@ &mdss_dp0 {
 };
 
 &mdss_dp0_out {
-	data-lanes = <0 1>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
@@ -1099,7 +1098,6 @@ &mdss_dp1 {
 };
 
 &mdss_dp1_out {
-	data-lanes = <0 1>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
-- 
2.51.0


