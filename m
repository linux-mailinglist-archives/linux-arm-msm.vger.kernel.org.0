Return-Path: <linux-arm-msm+bounces-84644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA35CACC1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 10:53:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 79994300D4C2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 09:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1822F3112DB;
	Mon,  8 Dec 2025 09:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TPOzpkq2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCDA2E62A2;
	Mon,  8 Dec 2025 09:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765186946; cv=none; b=MtgvONYbd2o92GOf8sJTWMhvQ0w+/yED2i4NA2QJPmJI9XG2+2nEbMMxLZxUKUmUbrSn7hswZeTuHnJYpOk/4eHXDfrgvG6YO0Da3TIIXOH1itPidRVYwkngWs18KD5YtUdrHtlufDdUz6pNS3cxyEifRNw8aaco1qZyap2V6wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765186946; c=relaxed/simple;
	bh=HjJDMUd9VNGNyS2sUGn4tel1CQSAz6Tp6zX5Z6lzkq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QHVagoTms2nQpDtqC218bdiGvNChyZEQufKymQIN9T+uf+QkOUk6Rfi5AprkTFqehYlOi7YI+uyTA8rEjBSFNxod1pDllIF6L+LSSd4SzWa+77jGxPs40xzIeNGtUH/mVLY+hIsZL7CqmFThoh6+56B/4AHXBYf7VCgGHnXt9dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TPOzpkq2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82970C19421;
	Mon,  8 Dec 2025 09:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765186945;
	bh=HjJDMUd9VNGNyS2sUGn4tel1CQSAz6Tp6zX5Z6lzkq8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TPOzpkq2nTI6hKoaT3FSs7xzUbOt1FCByuASCr/x+nqkbmdwACHm9o60JqmVxJ7oC
	 nT9u8ZlaAtgFv+C+tIS8UQndvhVzKPMyQTWpyJ39WtZIsTDUBfSPj+1ouwPk33V4H4
	 YLvrJQg1OxU7IM+6hlvsU5wlk4SEf9eHnYAyu0lks6Mk3baQebe/abkng8OEQQ4LmE
	 dqGzJzLB1s+LdHQ2xllEryjmZoROeNP+AYKXX/dStyD4rIIGMoFPtgsOjfab8VNBLW
	 ojT6kA8Sciae0Bdny2GAFHVYwfCxAXbM5mhRqpFu0s3qOl97eN7yDP1A8s4iVpG6mh
	 +Dwh/HpMN4ZxA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDF5D3B7DE;
	Mon,  8 Dec 2025 09:42:25 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 08 Dec 2025 10:41:54 +0100
Subject: [PATCH v6 1/8] dt-bindings: arm: qcom: Add Pixel 3 and 3 XL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-pixel-3-v6-1-e9e559d6f412@ixit.cz>
References: <20251208-pixel-3-v6-0-e9e559d6f412@ixit.cz>
In-Reply-To: <20251208-pixel-3-v6-0-e9e559d6f412@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Petr Hodina <phodina@protonmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=765; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Vnt/xXHh7c01EXNWnpunAXvFyH2vLjx4UfYXxFc1+5w=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpNp1/qlP6M4fA/UAI9sFslieZ/vPbVdIWRdnrw
 sNMRGePcV+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTadfwAKCRBgAj/E00kg
 csCCD/9pw77H//blcdVh47TCMq5x3u0geMj+edvvECKlk1jqZQkeDoAACyJKOxWFTIesWIihVG9
 G8iNdshQeUF2v/ODkPkeCrM8iVbYbMzz/V7wBIxwJreiTM/FOQlcDJzfKC/0oscYQ+Rns+Kc2RL
 OjZgwCgBMy0JH3e6OVo9fWxyYJ4CjjLOhBIOxdiDgbq6xXXXuhEhL5QuRADK5bsAnlbmk2ere6o
 Wfpv41N7OPAape7rCm+Klcal8c+tVLH3yHU0sj7wfnssL+GF5vIARAGDN/wmubUf7VOtLpddnAU
 imeOPaDTfB6ewq4t9N00Me4+KXoWGz6MtabP2sWj/qDi9oj3fpdMJq2D20QgY61qfIEcE3mLZc7
 jdaufFk7fz3sVnPBMcioC8umAOmFNvfZJ+VmenataKIMUIxyiICtodu6wIpDUXZ7nHjlYinhhCA
 GLZ0gQvSdSOUcSc7K+yvhFRQpHbQ7zpkNjuIIHTKIMZWM8sQGKH3ThDmJRSLKyf+2V4f/9gR2Ad
 C9Bt3mt5jGaBwH3YgDUzxBMFHu/m+uwrx61IE7HduThDRQOGxcFho0h6I/P4WWHPE/63/R3SOs9
 5WIh6N3R0XbQQaPZ9AZAKIBRML8H1boVMp7kGShdvXXxAkwMqpSdeatqYVgtavpi4W8S6/Eyr7M
 QjAetK403TJj8dQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Document the bindings for the Pixel 3 and 3 XL.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
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



