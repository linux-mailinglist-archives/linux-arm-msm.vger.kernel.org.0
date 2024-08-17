Return-Path: <linux-arm-msm+bounces-28881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9BE95599B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2024 22:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64AD11F218A0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2024 20:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C258D154C0A;
	Sat, 17 Aug 2024 20:40:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from gollum.nazgul.ch (gollum.nazgul.ch [81.221.21.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5C62770E;
	Sat, 17 Aug 2024 20:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.221.21.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723927206; cv=none; b=b3tqKoDr0QE+HxDR6+X7+VVSkUBaNKF7Dd1CZaa0s59b2nqykGuMuLza3nKIqvw9bqpjageemnPplnZgLK29Xu1eqASc02foXj509oS+YA50O9+Q85Xk0+Jl5jtntY9R552vU+euAK0WyW3uTL1pnLT6/KBaMbG0O+HEHQai+hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723927206; c=relaxed/simple;
	bh=xNqhvZ+5iwTNh3r32fc1ulxA0PLb2iE4raHQrO5QVxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BnqUhRzez+Ussv/1W28+OeHHPgHMMJcMvFUemr6sJrHLeDFL2MMBWT3w3Adr/a6ECWfppS0k0S+AkXNKSrBN9pKMmeUag5WR4MyjCtnY4BdDfB9wzFCRmzEp8VO7rpQ3rvzK8lpxqccqCZGrG7nvIzL+2SpOOdolViluapb3qb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch; spf=pass smtp.mailfrom=nazgul.ch; arc=none smtp.client-ip=81.221.21.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nazgul.ch
Received: from localhost (gollum.nazgul.ch [local])
	by gollum.nazgul.ch (OpenSMTPD) with ESMTPA id 82cd3755;
	Sat, 17 Aug 2024 22:40:02 +0200 (CEST)
Date: Sat, 17 Aug 2024 22:40:02 +0200
From: Marcus Glocker <marcus@nazgul.ch>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v5 5/6] dt-bindings: arm: Add Samsung Galaxy Book4 Edge
Message-ID: <uwpfllxl7ngkxxf7msceaciz2kckjbfkgdpai4lmqrbekzkbq5@ne3lqvoijaan>
References: <p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms>

Add the Samsung Galaxy Book4 Edge compatibility binding.

Signed-off-by: Marcus Glocker <marcus@nazgul.ch>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


