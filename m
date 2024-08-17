Return-Path: <linux-arm-msm+bounces-28851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD789555FC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2024 09:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B1EC1C2140C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2024 07:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E7F13C9A2;
	Sat, 17 Aug 2024 07:08:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from gollum.nazgul.ch (gollum.nazgul.ch [81.221.21.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A4213BACC;
	Sat, 17 Aug 2024 07:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.221.21.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723878497; cv=none; b=ABD0SoNbHslAVTPFPYTem1VHV5UWFza4skeifc8ULZIFL0wtN/Wzlx9bL9r/zXEg7sVdhLstPMep2ADuKe/Wg/sOU9P9ZNGQpM3G9F199M6l8wOV2rS9er8V87gzOwxSN0rZlrxCs3iVeZJhtYlcckvsWc2Oa6uuapQGq3yfZvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723878497; c=relaxed/simple;
	bh=yzE+jy8b8afb5issZkSmbEdmvFnKwx2rjcFKUOjTdLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GOCX5djk/ftFvPOSKTULOvXWhQDNrWRF3jCdklaTnllITwCVToA+5u8bKFUCkMYEx2o7r9w0uxPrEYQtLViKTsgWtjv0eqwYs8uExAarK95OthnA33Ent8z/FTvEHqJf9DLrbTmfq3/j5hlZ+cdTXkIeSmyTCGDi1pawBJfYAnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch; spf=pass smtp.mailfrom=nazgul.ch; arc=none smtp.client-ip=81.221.21.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nazgul.ch
Received: from localhost (gollum.nazgul.ch [local])
	by gollum.nazgul.ch (OpenSMTPD) with ESMTPA id 4bb5a486;
	Sat, 17 Aug 2024 09:08:12 +0200 (CEST)
Date: Sat, 17 Aug 2024 09:08:12 +0200
From: Marcus Glocker <marcus@nazgul.ch>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v4 1/6] dt-bindings: crypto: Add X1E80100 Crypto Engine
Message-ID: <6xex326bp6rwybul4tfviiry37oz6qerkzov2czfiig56khnfn@o6nuxcudj3cn>
References: <3lmcfffifsg6v3ljzxfbk25ydh6446phdff7w75k6gwoyw3jkw@ryc66frtyksk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3lmcfffifsg6v3ljzxfbk25ydh6446phdff7w75k6gwoyw3jkw@ryc66frtyksk>

Document the inline crypto engine compatible for the Qualcomm X1E80100.

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


