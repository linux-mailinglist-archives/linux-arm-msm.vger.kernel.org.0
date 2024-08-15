Return-Path: <linux-arm-msm+bounces-28616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A9C952CBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 12:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F17651F2277A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 10:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77A757DA94;
	Thu, 15 Aug 2024 10:38:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from gollum.nazgul.ch (gollum.nazgul.ch [81.221.21.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B204A7DA7A;
	Thu, 15 Aug 2024 10:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.221.21.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723718302; cv=none; b=oAlhTEX2ctwQ4BF/JIwxayfOKMBoTJbnwA1hEfvdgCSLXjxwx6/q5mEmoGvjF/yNHcLIuWetMQ9K+u1nG7KKL3Ofy/XdI9GwGJcnaUh5D3/2FwLT8oqW6JlJ6Xtf8lvESOpLHNkQUyF5XB02j08E9JKmflhatTRo27z5rTiTP88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723718302; c=relaxed/simple;
	bh=v9SvzvoiPYT/2M8AkesZIeARCXGEFFkf1TLa6NpjKjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rh+QH05eoihLll1MdQZVRuI/DZUcXIGveyiuRu6H4YWwuu9jSDHLB9nlZCYs1MJ1G5lXMSoekM5Xe33kaNOzALQmRFs9gVzT/JaNwlJAkNKkrPT+5ob6Ycc0sK6IVCszRxeJtB93SKe3PPMmpkqgSxqTvcjsURK5P3bSGEuqO0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch; spf=pass smtp.mailfrom=nazgul.ch; arc=none smtp.client-ip=81.221.21.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nazgul.ch
Received: from localhost (gollum.nazgul.ch [local])
	by gollum.nazgul.ch (OpenSMTPD) with ESMTPA id ead706cc;
	Thu, 15 Aug 2024 12:38:17 +0200 (CEST)
Date: Thu, 15 Aug 2024 12:38:17 +0200
From: Marcus Glocker <marcus@nazgul.ch>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v3 1/6] dt-bindings: crypto: Add X1E80100 Crypto Engine
Message-ID: <szw5nxru6vwbsomhkpwdagnr4wg6ltjfbp6kmnb6sse6it3yzv@qwgui4kj2foj>
References: <v2iah5yrne4u6uzrnzg36tvtxzqrpiez6io2gyyfrht2x42umw@5ribqndiavxv>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <v2iah5yrne4u6uzrnzg36tvtxzqrpiez6io2gyyfrht2x42umw@5ribqndiavxv>

Add the UFS Crypto Engine binding.

Signed-off-by: Marcus Glocker <marcus@nazgul.ch>
---
 .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 0304f074cf08..915db3d28892 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -19,6 +19,7 @@ properties:
           - qcom,sm8450-inline-crypto-engine
           - qcom,sm8550-inline-crypto-engine
           - qcom,sm8650-inline-crypto-engine
+          - qcom,x1e80100-inline-crypto-engine
       - const: qcom,inline-crypto-engine
 
   reg:
-- 
2.39.2


