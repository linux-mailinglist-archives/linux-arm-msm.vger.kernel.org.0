Return-Path: <linux-arm-msm+bounces-29875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B319633E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 23:32:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 708FE285914
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 21:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B003B1AD9E9;
	Wed, 28 Aug 2024 21:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p+OD0URZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DF81AD416;
	Wed, 28 Aug 2024 21:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724880731; cv=none; b=qg0RhpcuPyhy3XwsW2ssos4rAlXWqOlqVXwyuWt16ZmkONcAGDTbRHo4TRSII/wtsfyLOOHVDMfmxJVSwUyvZW6eAh+fBLZoErB5TmJ3gI6YSaeJ/EyjTv3eJAyDxrpTlTvlnGJUn/Yx0cr1yNc6xX0BkzJXBUm4lwuqkzzHyjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724880731; c=relaxed/simple;
	bh=LWErol0e9PYRlUJih421c9rdHX5iPzogr43tGJDWXjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Huv+Q9oedoqs9RlNtKDSYpuO4hrQWpdOjcyaCIxwXBkH0CIcz8+L3reCpHH8r/HiC6V1EiYPlXf6VUw3FwGacCx97+d3qiMEa+he45zVMHBS6gYkb2+p8HlmSLefZgSOHD4y7wKlKSBnCE9GRzhwFkJtlQxDRnKoyO4gFFkPgOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p+OD0URZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60D9CC4CEC7;
	Wed, 28 Aug 2024 21:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724880731;
	bh=LWErol0e9PYRlUJih421c9rdHX5iPzogr43tGJDWXjA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p+OD0URZ6vERV6s7kVINolbfWP0zb8L//kUdptUJ4cVb0X3Yxd4+slS5DspX/Sb0o
	 YTiuOA4YM0FZpNC0ir6H7Mdc/SlAGd/pHs+obHN/RYd6ws136bxfDHxZLZrRfv+TxW
	 F7qQmEDDBrKTEMj/TjBtMnpuQDOePQbfwRfSf5w2WgHvLZqdJuHnuDVFVyyZsYrJJb
	 tDoLKKtWICikVqZAxdwRB2gQAoF/EwR4h1suhnnvUfT0sgobCkE1zjNRAOhkXQsiiI
	 sxEsD1orB1GdmpZFkGUFT5nXM7VsoKrHASCYYjD90SNd6wm1wXMUW8nVk1EzUGBpq1
	 8crj2/KSIaiog==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 28 Aug 2024 23:32:00 +0200
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Lenovo ThinkPad T14s
 Gen 6
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-topic-t14s_upstream-v2-1-49faea18de84@quicinc.com>
References: <20240828-topic-t14s_upstream-v2-0-49faea18de84@quicinc.com>
In-Reply-To: <20240828-topic-t14s_upstream-v2-0-49faea18de84@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724880724; l=906;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=laXZFLMcHPZw+7yrgzoPhCSUWV2HGFqPLnIlkGt0l1o=;
 b=AoykNJMauGrQkOW3h0qByPF4HphTLSPwxlfz7tKadK0lf8tC1qP5oJY+QqYi0YIHBMelopWXl
 bXLhkL40f9EDIGhIRCpwsz0rNhXbv2oxKWkGa69s8VL29mWK0m7ZF3W
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@linaro.org>

Document the X1E78100-based ThinkPad.

X1E78100 is a binned version of X1E80100, hence use the latter's
compatible string as fallback.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c0529486810f..31463bdba8c2 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1049,6 +1049,12 @@ properties:
               - qcom,sm8650-qrd
           - const: qcom,sm8650
 
+      - items:
+          - enum:
+              - lenovo,thinkpad-t14s
+          - const: qcom,x1e78100
+          - const: qcom,x1e80100
+
       - items:
           - enum:
               - asus,vivobook-s15

-- 
2.46.0


