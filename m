Return-Path: <linux-arm-msm+bounces-75978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AC5BB9728
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Oct 2025 15:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4980F189AB75
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Oct 2025 13:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D9526D4DD;
	Sun,  5 Oct 2025 13:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqMwoMXj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3A6153598;
	Sun,  5 Oct 2025 13:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759670193; cv=none; b=JhBjxnueLq1RQx4Xj7eUuCy1V0K6qcz7gtiuorf4RGfNks31gDshaSkXbQSjvBa6xQlmH/BirjvLl0SfRpcGjwQ2LCc3d/9eRmSQr6wcX+aMCsWILv4Er4LjR1iJ35MZTwol6GOZF6rn2DzP2b5aHkoqjI1qgp8dTbvtSY3IIRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759670193; c=relaxed/simple;
	bh=wJgWI91cWyF3Uqs70n5A6O21f0oNIboWxyC2rOjGqJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RAu6SV+6FESq2dBTWT079SB/IOcfTOHY82unKoW3eerAwQAtxCTDx1EnqooG72e9hEjZZv8G6WTTJRwvfWayXhX/oFClbURh0ZGiAniq/5Ws5fXV+ZKvqxcXPnIsZlAqSs+y2MTZgmXw9HwH3/q3dp70MEiM6OASTelp8t/81UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqMwoMXj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35B41C4CEFF;
	Sun,  5 Oct 2025 13:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759670193;
	bh=wJgWI91cWyF3Uqs70n5A6O21f0oNIboWxyC2rOjGqJw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XqMwoMXjUaX8z4hNICq39bIOdU5plxEnPoH6poSyawevMhCvoixBC5b9u9nZ6ul+e
	 OJzNF/QBXEyxnZb05FVd72L9jc+8PqPJwVaOB6jpoMKnx/h22PUMLWzdl1cCxjSFj1
	 rHxmk0j7OfSmSrdGxt4Jsln5q5cKYrkScWsBwo9reETHxh6mXUze9i++3ndYM/V83N
	 laKPg1ZHFG+9dsBaV4U4EZFc8VSOlUyVGe6UIQWSlu0hpPgSvsu+nbFo4QZw6qGNXr
	 SILEMqgil2wd/2Z6ncY77qwLw7lAPoYcCBZu8Up6UZMzgx4hbe0Ef2tyIq3Ss/zDmj
	 zeISoag5jhlwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C82CAC5BB;
	Sun,  5 Oct 2025 13:16:33 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 05 Oct 2025 15:16:28 +0200
Subject: [PATCH 1/2] Documentation: dt-bindings: arm: qcom: Add Pixel 3 and
 3 XL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251005-pixel-3-v1-1-ab8b85f6133f@ixit.cz>
References: <20251005-pixel-3-v1-0-ab8b85f6133f@ixit.cz>
In-Reply-To: <20251005-pixel-3-v1-0-ab8b85f6133f@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=833; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Zry9Oute08PFuXgBMRua9g6F4WxR5JBtWztXJ669S68=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo4m+vK70PPnFXmDPGBCf5VTogIOdQHpFgOaXxM
 vqQ1sgP7w+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaOJvrwAKCRBgAj/E00kg
 cgAFEACHgszhLKeosOPDnyoFJqBM5TQyoKCtzrdGs41wPHJGFQ5c8lbr+lYrSGM3j9Bnjw6te1x
 ryIlTAcE3dYnbJPIRuvr9WzeTcQL5cwwoHDpetnwjP9R6udiAy/Do2jsQxIS7D2xO18Am2xjXea
 MQ9xN5vGvg20068e9WMjnGw3uriE2rcWeu8m0JaGCz5VTKt+zFuFTmII/OFOQlisbnHTvz0rs9N
 woEk4nrQsf6G6bAbsxBCFjW85z1jF0H1NEoc1UOGRt+j2+3I0HJQeYeJ7XRkgHT4tOTgYbZJq1U
 +XiJVWDSISfxgkE1IqfhunoHHMmRjUlWZH5ZQbR2i0cWfF8z3YXkIhs/o/fapbRu4t0yIOF2eQF
 0smtA24wRGWPW75zvpYrqW9dQGuDMPhnCey4tdfYiXbM7jZtzj9io1HXBj354qBWTZ4fvJ1pEFq
 5A5khvO8ZO5tUwz9rTl5Cse38aqdvg/yNWVGR3M3lx/hXmHHxeK9yuvar9xoEoGtKzc2NSV+Tae
 onSIwxAADzRUU3agWJXwL02VIkuHqNl8XMzI5rtzY7kF3gqiyVNVD/8Rzhi0zobf1roPgDFrbgC
 pmbAcbyCG41fJys8NTgBr+RUXZ24Enwt9HkVq6eL7baZ660g6mhj65Ytc0SD+UFmwePbN+qCHAv
 OOGu6gVhuF3dFkw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Document the bindings for the Pixel 3 and 3 XL.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ae43b35565808..2190c5b409748 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -976,9 +976,8 @@ properties:
 
       - items:
           - enum:
-              - google,cheza
-              - google,cheza-rev1
-              - google,cheza-rev2
+              - google,blueline
+              - google,crosshatch
               - lenovo,yoga-c630
               - lg,judyln
               - lg,judyp

-- 
2.51.0



