Return-Path: <linux-arm-msm+bounces-82266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D1FC691AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 12:33:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D2522381E2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 11:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCA7355051;
	Tue, 18 Nov 2025 11:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vF07eux9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25973502BD;
	Tue, 18 Nov 2025 11:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763465444; cv=none; b=UXnFfHei1DDYedb/kgAAhRWpihFSQxHx+0hXANGqvA7ZXGDypDDB4rJHcdevpDw+BySqfMCC66KdoyDza8w4s9K1AxNgzkurnqVV/Ehqnufy/NQSxSZYn7iDe+KflnTlxYT/4hqx1cFCUQPO5pkEUqyopEwHBBl8NRcbJpqjiVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763465444; c=relaxed/simple;
	bh=8aOZFPFTflbkscTIWZBhClsCIM9o4GWwmg9TXIcb2zo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RYQf1AKdmP2aYsOC7oE0iFK72H6hVmIXmQK5mkG/3aHvlcdBJDtISz1w+H8u0BGGc1fZa1pddXdOsspm5CIMgxFQZicQIip7tk1sYa0WnUjUHGpzE0sRY7unIg5lT+lGg1azmaT2ztKAt77QaCRFxYY1l3UZeqJrWH20n+/Is6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vF07eux9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5FF4C2BCB3;
	Tue, 18 Nov 2025 11:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763465443;
	bh=8aOZFPFTflbkscTIWZBhClsCIM9o4GWwmg9TXIcb2zo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=vF07eux9XSkZyvK3eQT+j/eZXoJ7u7Fae4jVybT32sur0SIsn+LhDrO2AYebJKZ8u
	 rxp+zwOivtzKfMCNL1h5Xb075mT00+liIrsM6XTT/sdXr/ZVPhuJGa5xVjLfe/b0ui
	 wGci7/tRJV1yL4BON0vLJOyhK3Unht0XCXqr5USnfvYI3cxTgMyHv1ie7lHLAmME/5
	 ampT5RBFWb1oSuUB+xFBELQTahkxzdZ+RuACGt3bjJMdkho6Jl1YtN1S7994rxwFGy
	 k33r9Lgl0HL1q3Lagn9iwZR6Gl/r/dmraK9suoTuX8W4uY1afNP5Ti0IvEcpIgK423
	 ejnqOoToAaHYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F39CED620;
	Tue, 18 Nov 2025 11:30:42 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 18 Nov 2025 12:30:36 +0100
Subject: [PATCH v3 1/8] dt-bindings: arm: qcom: Add Pixel 3 and 3 XL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-pixel-3-v3-1-317a2b400d8a@ixit.cz>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
In-Reply-To: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=716; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=DlXm2VUp7Ijt8uTzaBaBxliSbXJ4DoxMqfa5a4LztB0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHFjg6F+JThpLkjMmprBjtyfG75J8RRGnB/rUx
 kGMqVGVXCiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRxY4AAKCRBgAj/E00kg
 cpqHEACHSQC5WpfNbxcU5X0hYKyjt7Ul+jRuZeBhkzzz6XKwM4qYp+xE4v0ETdr3CZ8Z06hW/tn
 cwS75DfyP78LRQ8qAbiM8/3fmqpJ1yzuZZEjnSiSfCfwS5pCzT2a1ZoIJOKpxUeviavE5tVsmTO
 pI5U5sYc2qosloveYRFK3AzsQ4R/56nLBmNDmWYC3WBzY6jhi4Uaj2kC2B6RDuqTJ6UedZNH4KS
 AnZrFssyGnmNt+XYUKUM7V/tVDT3PwqfL0Py43jN1IEHIK4WDRa6sLNDKt5RyVPe+5XetpyshOe
 xNZ+Z0fewLYMvRBHp/j3tcT1xB7QARyV133q1kZoKY+29SKPQXEd9u1oW+aLDAXKfNvcx6L1r2B
 WLiGT0Qr9O4rxf/HOc0qg3tWtQo6m8l8JeYnyx133IQAyDb5Bj6fA1tEeWXG91OKBz6AuM6q4FE
 Bhd2YGrIlehIdH0Ot9R2mLwIOPYK64JzTKzKPu3pGRiH7pYKpZZ9T6rrQdAIyetpzOu6njtNXKO
 A3IhcOnDM4U3xwGes4nP45NIU4/8tyGX9ctKvmGS5QaHwiEFccmaOiXM8dhqiKa7cD+aK7V/ErR
 MY6jjpVcCzillKZmqMBc+Gd+giJGB12InEkPkmRyGDZiCKJl2yHphsRMvV/o2SeOigxGeHKxax3
 i19bGPqfvX54HxQ==
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



