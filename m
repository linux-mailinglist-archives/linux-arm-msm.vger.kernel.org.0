Return-Path: <linux-arm-msm+bounces-46548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 855E8A22366
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 18:52:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D010618832A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 17:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1434B1E1C1A;
	Wed, 29 Jan 2025 17:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="LqaYRNFG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8D81DE2D5;
	Wed, 29 Jan 2025 17:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738173123; cv=none; b=PdqjGEQB0QfSnxeTBeozVir4FfGuCSgoiNJYwwJHtVYF4C7BwY75MXk0p1uYwDmYnl9/1vsnPRR05GDXY8cv14dBMVSXljJJRl/wHP8KlUQDrpvRrptnf9e2tp9b7dtjlOCo7fUsro8GMP/X6hS/de88q++jrSLXExIZF8rgoYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738173123; c=relaxed/simple;
	bh=bl51jCmPkl7raDjWIIH2QMfKHNIfZgKJqh5kjYTEao4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PKFxclOB/RRDqvAyCRedT+yVoXtOaMP1R2Ij5PoQW7fO4ww88ziTrPaV6/M1b4ZkQXNFUmO7CG0T5jnPU7gvMprZDVk5/gy/fpuK9KWuDsWAKB3WK48oPYk+FQov9cE0mfqCWtuCuucO816Exp7YNa0ZE0+HhmQltbGp0Sil9II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=LqaYRNFG; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738173118; bh=bl51jCmPkl7raDjWIIH2QMfKHNIfZgKJqh5kjYTEao4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LqaYRNFGtKs7sFN/5G4E6tdTsxxS4a+xoDdH48pUrKp8KVkV8zEpGCGAnjSUxL8fS
	 W8eMr3Ike00CnMAZ7LhGp9CqkuTKyAs7iFmVeoZm6MrjkTv2yg2nK+XFKmG/mw4p8v
	 2whSArIB900n47Krd3vp3NI0SuRkq+E/eP4wnhSA=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 29 Jan 2025 18:51:43 +0100
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom,wcnss-pil: Add support
 for single power-domain platforms
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250129-wcnss-singlepd-v1-1-b01a6ba0b1bd@lucaweiss.eu>
References: <20250129-wcnss-singlepd-v1-0-b01a6ba0b1bd@lucaweiss.eu>
In-Reply-To: <20250129-wcnss-singlepd-v1-0-b01a6ba0b1bd@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=OQM+jP4ek4zMvnoNxUipzoNMJC2ebIUwi5vBO3iU64E=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmmq8t62EKC7g032HPSEGJYuUKyH9vSADO8cT4
 AaYk66pJEeJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5pqvAAKCRBy2EO4nU3X
 VlnrD/9SJh9ceWpHt4VX4h6f2ADDfuMW3tNfhTnZ7QpSZ5QIiUwqiuuDY/cX8fDxKR2zgPZ0mFM
 wjQsiyvAbFH4DT7xLDq34G9VjfmCFM1yHrg0W5I0nCsQvw+LtYTOqNMk9tzLaZWdLCk2BMs0PNN
 V6ZeDjw2pwvD1dr9tpeG8ZZu4Is/irHOjvq/e9/JS+2b2Ylf693tGXLRjdF02EBBx/0xqXH7aAP
 WRylLDJCHTEMlNal9d7yBDZGZ/4huC36XpSNQOJYu/CSftonw6BlIpdt/QRMKxaX5tad5FEOtov
 VpQ+Z5Cqo0MF1jcl17Uzzsld65BBVOSJ1bEi70Fkz0ZINmxiHiYGr0QnL58XjuSaPVx/Il9og00
 MsEexYJ3ZqOTBxnq/ydI7mbSnMi7XSfdFMcRFsKD/Oo3h1SGOMu+NBQWYC3LWXCPcioxGtWsq6H
 BGjYOFRJ43bufoTxGF22Ehy4lz09MZfiknf+8CCfGIQOC9u/d8LxUNh52zldC3arfkXbpjzPTrR
 6lBNGINGj0B0BN0pL+30QyOSFquM0AW1HHXCp6aABZCQ2ALheLBp39CkodPgBm9jHTeKzxNgY+x
 wCxwI2OGwRGbDTy5ddtt+z42MI7WiJXXVYbjPJOR5g6P3TVIPgUPFVTjqITuCa5Y2BTSI7xZPFL
 tv3DDMxYtBo0DmQ==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Matti Lehtimäki <matti.lehtimaki@gmail.com>

Support platforms such as MSM8226 and MSM8974 with only one power rail
(CX) modelled as power domain while MX and PX are regulators.

Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
[luca: reword commit message]
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
index 8e033b22d28cfa8203234f744b3b408e976e20c3..d3c71bcf0f02122eb0dae214f135d8d7f71a9600 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
@@ -69,9 +69,11 @@ properties:
       CX regulator to be held on behalf of the booting of the WCNSS core.
 
   power-domains:
+    minItems: 1
     maxItems: 2
 
   power-domain-names:
+    minItems: 1
     items:
       - const: cx
       - const: mx

-- 
2.48.1


