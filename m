Return-Path: <linux-arm-msm+bounces-21436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 951548D7B93
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 08:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE87C1C20B90
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 06:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ADAD29411;
	Mon,  3 Jun 2024 06:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XNoRql90"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B47336124;
	Mon,  3 Jun 2024 06:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717396146; cv=none; b=NhnZAOeb4K7SL4bJKH2y/Lo9a0wdlNrH18+Sg/LuSd4XE/zc7YH8ZB75B8jWw/nMOOPO9CHGHBAPZLSmeCBPYG/l5dFgfb3KYnfwafsvjBNddjniVbn3G8yDApZfy1ua+VRX7yzpIrEyJGLY52Yx4OX5t4KqsRD2/jV8JpGjXs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717396146; c=relaxed/simple;
	bh=Y/ZJBAgwGHtjiZ/QrCucRgtNYeoRoJVqtLRD1/eVgyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YzHqvi/b9nXcX/ARoMgluCPDotOMftKE5bYxnXo0W49euQwlO9TYUg8EAnlIEMlJeecm2IeCa/04R7IvJ+JHi6mOyBBj+ATHgM6vW8GVTFmaG6bsmem4a48HUwX81ibsbbuqkGetUHgPP3zRHqlpN6XWZXCjA0wT6ZhKrbVOi4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XNoRql90; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00FBEC32786;
	Mon,  3 Jun 2024 06:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717396146;
	bh=Y/ZJBAgwGHtjiZ/QrCucRgtNYeoRoJVqtLRD1/eVgyE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XNoRql90dvqxbGKJXIEW6Vl1hPdIpDnkp2iw2OYEbLS9cfvOB39nWmYolUt0Y9bnR
	 +a6DJU/BCv7uM8XjlNjf5XvaxgTUPscZ1X/+RczIdLExc9jQq6AthxPRKlBaDQS3GA
	 fE84s35rehvghsQs+jEz95rhRX3oqofU1MHER3Bq1tgrhBO43MKUmQvczwXYyZITNy
	 UES5vjQ1Ey9c2EuINmB1O1o8lDGsMbWqexwQlwv4bdO0usTX5bwPVNI5xaot9pt4i/
	 iRPGCbvCZee5Bkys2zAld+EH+DazujDNFbOOG9tqrIrpG4X3wStqIguONQtNUHOfNY
	 TN4uEfa484dyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB751C25B76;
	Mon,  3 Jun 2024 06:29:05 +0000 (UTC)
From: Alexandre Messier via B4 Relay <devnull+alex.me.ssier.org@kernel.org>
Date: Mon, 03 Jun 2024 02:28:56 -0400
Subject: [PATCH 1/2] dt-bindings: arm: qcom: add HTC One (M8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-m8-support-v1-1-c7b6a1941ed2@me.ssier.org>
References: <20240603-m8-support-v1-0-c7b6a1941ed2@me.ssier.org>
In-Reply-To: <20240603-m8-support-v1-0-c7b6a1941ed2@me.ssier.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@z3ntu.xyz>, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Alexandre Messier <alex@me.ssier.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717396145; l=736;
 i=alex@me.ssier.org; s=20240603; h=from:subject:message-id;
 bh=9wMm6Dj0sMnvRZ2OjIbKpkpq+Ek78nwbjC5uOcxtyfA=;
 b=Ztc9yREx0yJO9Qs7ZsSIzn2Cz05Ma7ndN1uSeLihX8mFU26J3X8hr1T36XJCdoGe8m4UQezt1
 4ls9Pz2emkAB30mkck35Q/Q6SGlPWglFIYZ3K4tm1vkvzY1FCgjgw8l
X-Developer-Key: i=alex@me.ssier.org; a=ed25519;
 pk=JjRqVfLd2XLHX2QTylKoROw346/1LOyZJX0q6cfnrKw=
X-Endpoint-Received: by B4 Relay for alex@me.ssier.org/20240603 with
 auth_id=168
X-Original-From: Alexandre Messier <alex@me.ssier.org>
Reply-To: alex@me.ssier.org

From: Alexandre Messier <alex@me.ssier.org>

Add a compatible for the HTC One (M8), which is based on the
MSM8974Pro SoC.

Signed-off-by: Alexandre Messier <alex@me.ssier.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ae885414b181..9a29cc614b6e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -182,6 +182,7 @@ properties:
       - items:
           - enum:
               - fairphone,fp2
+              - htc,m8
               - oneplus,bacon
               - samsung,klte
               - sony,xperia-castor

-- 
2.45.1



