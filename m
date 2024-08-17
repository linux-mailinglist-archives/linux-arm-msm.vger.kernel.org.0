Return-Path: <linux-arm-msm+bounces-28853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 978FD95560A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2024 09:11:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DAC81F235A0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2024 07:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3447013C9A2;
	Sat, 17 Aug 2024 07:11:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from gollum.nazgul.ch (gollum.nazgul.ch [81.221.21.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C4820E6;
	Sat, 17 Aug 2024 07:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.221.21.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723878666; cv=none; b=dGgGWEF0FCE6gKa3Mv0SBdNyjEL+RWOqFM+iownMDz+hKLQZ6tG3+daxU9J0dH3Z1AG8dSY6h194+4jMkVTB8OM/Tc16tnkbdG9/fPrIH1qwAxxTYEBsejOiwkUDU5ZEM5/04mEGuARKPu33UZPy0io/gPjJRaceV0S80Jmrv04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723878666; c=relaxed/simple;
	bh=RmPTMHik1Ww+as8nGPYipMDCD9r8HigdtJBXkQE/E1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BuztWNKuahE6uRUwAt2tjBvT9arlGEW8YFmFzvVjAdDvaXk+dg/qBEpfxtYBVZAZCsvHunWVKGwWB9JrYwis9/ymshyl2CwaIepm9npNLBETWFLtt2eTh8LMK55Mouoxtf+95hFaVj9kmsUeAiBN5PQb4vJGw4SaKL99Z842cVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch; spf=pass smtp.mailfrom=nazgul.ch; arc=none smtp.client-ip=81.221.21.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nazgul.ch
Received: from localhost (gollum.nazgul.ch [local])
	by gollum.nazgul.ch (OpenSMTPD) with ESMTPA id 6fd25548;
	Sat, 17 Aug 2024 09:11:01 +0200 (CEST)
Date: Sat, 17 Aug 2024 09:11:01 +0200
From: Marcus Glocker <marcus@nazgul.ch>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v4 3/6] dt-bindings: ufs: Add X1E80100 UFS
Message-ID: <vqdfcwwctbgrlamqecpevy7ycxdyzidy73joj6aqao4fq5235o@eithrqu3elp2>
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

Document the ufs host controller compatible for the Qualcomm X1E80100.

Signed-off-by: Marcus Glocker <marcus@nazgul.ch>
---
 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index 25a5edeea164..4cb3fea53651 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -41,6 +41,7 @@ properties:
           - qcom,sm8450-ufshc
           - qcom,sm8550-ufshc
           - qcom,sm8650-ufshc
+          - qcom,x1e80100-ufshc
       - const: qcom,ufshc
       - const: jedec,ufs-2.0
 
@@ -121,6 +122,7 @@ allOf:
           contains:
             enum:
               - qcom,sc7180-ufshc
+              - qcom,x1e80100-ufshc
     then:
       properties:
         clocks:
-- 
2.39.2


