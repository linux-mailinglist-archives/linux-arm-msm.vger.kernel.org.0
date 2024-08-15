Return-Path: <linux-arm-msm+bounces-28618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0700E952CDC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 12:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D159A282DD8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 10:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F651A01B6;
	Thu, 15 Aug 2024 10:41:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from gollum.nazgul.ch (gollum.nazgul.ch [81.221.21.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAF419F47A;
	Thu, 15 Aug 2024 10:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.221.21.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723718467; cv=none; b=iGWeSquXf7mPsbPDipwmwyuJvfvWYcawv0W7eyv3e/yU19vSNcOkg1ihkbOh1FgtZFCYL3Z8oAQwlJ01+vcHxtT6Tsjs4hZYpk+7qITU/ohGdgsXaNjOxIuRJQ/lAnH7T07ze7CcCJNsKuULiZ4crc+VsUBKVYFm8QbIidvbObw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723718467; c=relaxed/simple;
	bh=DRCh9Hn/zBfgF1mCF83AaVJu3s25m6zEa/bsiaWDkG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kq6WTS0dFEXjD9tGdhPm/bYLadgRX0BrbFQl1GXnT/zvY0nYsbIM/Dflx4R6MDJ+4Dyphhpgsj31XF3VZF7In0Ku1U9AEGHr0Ep8OB8Y7zTv3qFLBqt3uApgBhDEyuT9tGILFSbSEJrgsgrtgF9k5+gAJHKMCRQsPAs//sihIEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch; spf=pass smtp.mailfrom=nazgul.ch; arc=none smtp.client-ip=81.221.21.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nazgul.ch
Received: from localhost (gollum.nazgul.ch [local])
	by gollum.nazgul.ch (OpenSMTPD) with ESMTPA id 37917d19;
	Thu, 15 Aug 2024 12:41:03 +0200 (CEST)
Date: Thu, 15 Aug 2024 12:41:03 +0200
From: Marcus Glocker <marcus@nazgul.ch>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v3 3/6] dt-bindings: ufs: Add X1E80100 UFS
Message-ID: <3mjmyo45td4zpnzntphwqdbc6rogs7c7q6jkjvqgvyzxl2l7ie@wkusfdalqwj5>
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

Add the UFS Host Controller binding.

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


