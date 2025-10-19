Return-Path: <linux-arm-msm+bounces-77917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CEEBEE6B9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 16:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 825821898515
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 14:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5D12EA49E;
	Sun, 19 Oct 2025 14:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="qihzwUvV";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="KE0ywus/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488781D7999;
	Sun, 19 Oct 2025 14:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760883640; cv=none; b=HPof1sN/lC71YsJZmz0Na69LyitPJO0VzftWDhthfdWwAEdEgbEEQ99NOhYwfPRbAEn5UA4njXHIgzEaX8BBavdsccVcgWuKjp2dvQv5nUFsdG79C/nYjvWMqB9m35KTv6FRET1gwahge4FY7un4kjQilydnze17jnruefK1dyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760883640; c=relaxed/simple;
	bh=r1Ky16GNS/1SNPO/T5Wa25B3QlhNW664d/vil/k3XvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o94GgSjUwATiaQ9YWidi2TMp/dC2snwiuw3XSAu4q9EOTHxZjk9OCmkn8ENZBumJfcqNQ2lXF8JjhjrGyJj4E25FHlJ+/zhJ4s+bXex/YoQB7V4rFEj81fWjXJXTeNAHRBWb2EcX8p9dkeDVI6GhZb3iaSWZWyF9UgYVKKNUayE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=qihzwUvV; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=KE0ywus/; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1760883623; bh=uYnRvMOH1QB75jnXAbXFe5a
	IUf8OiZovJ64DYJn4+sg=; b=qihzwUvVtja/UGBy485S/o1I5w8a5pFyew8de7AvracY6MK3xr
	AnOyXPjEQVfni0jBCNoOTxzj6aeLrcTNMAWq4nSA97PhfxTuLsVnC5161yPn9Z7gHyU7BfREejH
	mmrW8L8NpNvdpXMHo7uOejCwfTbiVQNA/3wk5VxxqQk9fensJLwha7ZhOAoO7Q9ImhpTTTUE6T0
	3w4SReNdvdb1+VdQvOOqNgpbYBSGalqICbiqVDMwLjg9hNfbdRkpgljvgIu3iWGqTFQDzlSjSbp
	+3JZvwy5+9hf+yNp0TcWJLhutSgkhWTngSjFYn0B54xxQyVl64To9PXqWXrrzmT1PNA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1760883623; bh=uYnRvMOH1QB75jnXAbXFe5a
	IUf8OiZovJ64DYJn4+sg=; b=KE0ywus/XONLm+i8QVm0gD4jKJope6UAbYTQSfvdYa+zRZmyla
	Wgd0eVebRXT+6uOIvQYBahjziIZtVvZMVEAA==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Sun, 19 Oct 2025 17:20:19 +0300
Subject: [PATCH v2 1/3] dt-bindings: remoteproc: qcom: adsp: Add missing
 constrains for SDM660 ADSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251019-qcom-sdm660-cdsp-v2-1-0d3bcb468de0@mainlining.org>
References: <20251019-qcom-sdm660-cdsp-v2-0-0d3bcb468de0@mainlining.org>
In-Reply-To: <20251019-qcom-sdm660-cdsp-v2-0-0d3bcb468de0@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, 
 Nickolay Goppen <setotau@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760883621; l=1476;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=r1Ky16GNS/1SNPO/T5Wa25B3QlhNW664d/vil/k3XvM=;
 b=6TOG3taOwgX2xNtH9+beNf2aiXwyb7yjUrZexB3VBQ8MtPbSTdNfaNrB7EztBKefUOFyk7QRh
 XgLr/9rX+5GCyk7SWbaLXQI+2MCe3eUT/VMKkmaGRxLaDkg+xz0Rgzl
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

Since SDM660 ADSP node uses "xo" clock, interrupts and "cx" power domain
properties add corresponding constrains for SDM660 ADSP.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 661c2b425da3..c48561aae3a6 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -69,6 +69,7 @@ allOf:
               - qcom,msm8996-slpi-pil
               - qcom,msm8998-adsp-pas
               - qcom,msm8998-slpi-pas
+              - qcom,sdm660-adsp-pas
               - qcom,sdm845-adsp-pas
               - qcom,sdm845-cdsp-pas
               - qcom,sdm845-slpi-pas
@@ -93,6 +94,7 @@ allOf:
               - qcom,msm8996-slpi-pil
               - qcom,msm8998-adsp-pas
               - qcom,msm8998-slpi-pas
+              - qcom,sdm660-adsp-pas
               - qcom,sdm845-adsp-pas
               - qcom,sdm845-cdsp-pas
               - qcom,sdm845-slpi-pas
@@ -122,6 +124,7 @@ allOf:
               - qcom,msm8953-adsp-pil
               - qcom,msm8996-adsp-pil
               - qcom,msm8998-adsp-pas
+              - qcom,sdm660-adsp-pas
     then:
       properties:
         power-domains:

-- 
2.51.1


