Return-Path: <linux-arm-msm+bounces-28558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A47952485
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 23:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F28D1F23E10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 21:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50981C8FA1;
	Wed, 14 Aug 2024 21:12:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from gollum.nazgul.ch (gollum.nazgul.ch [81.221.21.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361711C8224;
	Wed, 14 Aug 2024 21:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.221.21.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723669920; cv=none; b=GSUEaeQuGDflR8oWDakcu9MAEUKumePlKRZ2grn7/LhkqkVxNowIDp5iVX8jA7R8ogKw0xGmLcbiJYWmdMIkf68M/idxjPymcaHXM9gC5jdgTzH+J4LkB89mhNl/CduDYD2CDV7mnamtsy4gvsaXXfJaG271MX79DRUoG6mf4+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723669920; c=relaxed/simple;
	bh=dW79kIBZH8GUVlqCEOGpQIDbLfzIx6g/OTlLHcMZvcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/D2tZhhrHotlGceErPFBBJaBRLddabEFV/Grlb7e1BGG2knG1qYrWas44WYnJrHFipKY0G7GtLLHyO5/WsFDgC2Hd8E1ml014ljhTk0JZZwYTT49g87NbIpOkJk6Ui2BrVH+H+yVhsZMqytWMvAN0FWT9j0iPZBJb9CJoID0Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch; spf=pass smtp.mailfrom=nazgul.ch; arc=none smtp.client-ip=81.221.21.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nazgul.ch
Received: from localhost (gollum.nazgul.ch [local])
	by gollum.nazgul.ch (OpenSMTPD) with ESMTPA id ba6c537a;
	Wed, 14 Aug 2024 23:11:55 +0200 (CEST)
Date: Wed, 14 Aug 2024 23:11:55 +0200
From: Marcus Glocker <marcus@nazgul.ch>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 5/7] dt-bindings: arm: Add Samsung Galaxy Book4 Edge
Message-ID: <77ndpqiy4vl4oh2yd6sl7ghowincyq7erlqmiobcqaoi5xfahf@55hxbnry7akw>
References: <qv5pz4gnmy5xbxxjoqqyyvn4gep5xn3jafcof5merqxxllczwy@oaw3recv3tp5>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qv5pz4gnmy5xbxxjoqqyyvn4gep5xn3jafcof5merqxxllczwy@oaw3recv3tp5>

Add the Samsung Galaxy Book4 Edge compatibility binding.

Signed-off-by: Marcus Glocker <marcus@nazgul.ch>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f08e13b61172..c8a32e5d2c74 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1044,6 +1044,7 @@ properties:
               - lenovo,yoga-slim7x
               - qcom,x1e80100-crd
               - qcom,x1e80100-qcp
+              - samsung,galaxy-book4-edge
           - const: qcom,x1e80100
 
   # Board compatibles go above
-- 
2.39.2


