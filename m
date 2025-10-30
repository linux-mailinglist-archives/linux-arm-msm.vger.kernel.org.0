Return-Path: <linux-arm-msm+bounces-79585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2892AC1EBA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 08:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 745224E6AA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 07:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB43336EDE;
	Thu, 30 Oct 2025 07:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bv5q+2pm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4D019E99F;
	Thu, 30 Oct 2025 07:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761809075; cv=none; b=GgserRE91kpFL+MKO9kQ1bk0ppWCLvct/vr7+zXfo8yVnzyTNwNZIJXSpSfzbhQeD8sTu04ha0mn7nOUcqDnPtQa23gf1attZBp5nrBqKYLtYCaQlCf9I0cGl07UAp+RH2DhJ/l76w3SqlRlH1LK/+EMQK8qnh0tRvrhqFjZImg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761809075; c=relaxed/simple;
	bh=8aOZFPFTflbkscTIWZBhClsCIM9o4GWwmg9TXIcb2zo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p4ZaPpkHiBHhJefQ1nOgVRMRgs7zNyRuXVEWgbTm0OEiD8hP/G8FF319tDt5AKQlbQvsbFomEXivSKhH5acVVnW7SYxZdaZGOVpwEq1U1P6oxj0GYGLrbEeVBwtdrRnoUP+sAHJaIP81QQCnyNtOovlRkGH9v1Z0N/cUn33BulQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bv5q+2pm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D51EEC4CEFB;
	Thu, 30 Oct 2025 07:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761809074;
	bh=8aOZFPFTflbkscTIWZBhClsCIM9o4GWwmg9TXIcb2zo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Bv5q+2pmPcsi3F2BCg2gHy2HIOVw4b9FKgXsNcJKyJrS2ib1onF9Jd3Vs8SaNvI72
	 dMikeWhYcPZ6KS585ztnmaKN+TZGopb5DTtjwLiMdjAzwVv4NAmgcHj5umpEmBSc4X
	 cr8FtAFDjUMavoEWNWGTAe3uYHrbEKiPtYydt/ReOmRQb2JLJNiNOQiK4yaLkM1+TA
	 gCxDwsGmgYif8Wbj3cNzTGB6b2za30rzR/O0Xp3rI3bsCoHLrIPm5de5+PGMQeyeIp
	 /aDvvsOqK4XOWAf/LjSIS67R5Boc9YLOlYVD5EGEW7K/HUPbhvEVoze6qGMXx+3Ufp
	 PDMFL8RxAPztQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C800BCCF9FA;
	Thu, 30 Oct 2025 07:24:34 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 30 Oct 2025 08:24:29 +0100
Subject: [PATCH v2 1/2] Documentation: dt-bindings: arm: qcom: Add Pixel 3
 and 3 XL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-pixel-3-v2-1-8caddbe072c9@ixit.cz>
References: <20251030-pixel-3-v2-0-8caddbe072c9@ixit.cz>
In-Reply-To: <20251030-pixel-3-v2-0-8caddbe072c9@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=716; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=DlXm2VUp7Ijt8uTzaBaBxliSbXJ4DoxMqfa5a4LztB0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpAxKxVrFT1VwZwJfehm2IryQgQOjZpqH+tViW1
 WYBJWhGs2KJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaQMSsQAKCRBgAj/E00kg
 cs4YD/9qzawViIzkeuR6ctXUpYb+EpmYU5qpFlWeAUVuEnPSB7NgEML7I6C2/ZbSqteCao63Uf9
 KzddLsDWszBcyO7Yz6FxU21ZsDGEmGa8WQChHUGx2mexka5q+yYkK4m89T28PRKafIy2BGTD64N
 B8anhGaNFhItMQNfKGdrkHQ1oZ7MDK6u2Z5N3FRSMDaNGDTxhvdIJaCNw86jfdb5GlNwmTkISh7
 YZyA7KKePdnWkhrPJd6K8LMGEKsvxHbCoPCVndKnzmNqR9f11OxlYRVL5uM6HssybKy2u/XzQvK
 6iwLUeeU3irxdLJsXOME8cbTOsAmyhT3SX9oh5sGidkN88oQsAYKGPjqRbWICnqopKyYCpH1WMt
 zEB6TlYjEVi/hZPTmf0zTMI7hbLpSx0+xFO6hUcPYx7EqChU/TVmyTvSAZtznW40ugDMoZd7xuX
 UkIiTG0dd5EzA5VaExF+jKx6Y93N4jNzfHPCcb8x8bEZc0PFeYC+bh7fhx/nMccjMZ9ZI5PInPM
 65+0Lc+kzKK+gQsg0bOrZTtm43EKdT/3a6cW1LShmAoMSQ7GvAOTKUPCCMZLTU1BZdOnNzV3FQl
 e3Lvtre7KF6Awzd07ZhF4QeB7037yT6AvMQPwX7EnMIqEXL43nhBGcfa35QxDQZrvhaNpjNhtQW
 xTAGnjPYz02nFcA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Document the bindings for the Pixel 3 and 3 XL.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca2010..760b6633b7a55 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -900,6 +900,8 @@ properties:
 
       - items:
           - enum:
+              - google,blueline
+              - google,crosshatch
               - huawei,planck
               - lenovo,yoga-c630
               - lg,judyln

-- 
2.51.0



