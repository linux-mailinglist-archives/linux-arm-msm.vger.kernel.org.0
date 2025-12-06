Return-Path: <linux-arm-msm+bounces-84580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAF4CAA70D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 14:35:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6838B31CC7B9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 13:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE952FC02D;
	Sat,  6 Dec 2025 13:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fc9TUIcp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD132FBDFF;
	Sat,  6 Dec 2025 13:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765028084; cv=none; b=fhurn1yfLdUevn2NxF1INc0Gcr75LLTXYH30DIC65dm7/oR7bNuc4eecweQ+CC2KhQME9LnaCzKGVN6syVMMFDnbyvXKgXcjn5I5hJsgYnbq27/wvQ8sf2jx5a+iTzlmufwujSYFTgh414OahCig3YG4kP/RkoyXW7womYjt7b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765028084; c=relaxed/simple;
	bh=HjJDMUd9VNGNyS2sUGn4tel1CQSAz6Tp6zX5Z6lzkq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iAVVGScyjqTIaCdAFCkwWzdp5Hne2yJSET1BHyLtFbrxQwPpH0JJI9RyG0fLfFfsiIRIJyMFvnxAD84H0npjqdsorzqFs8sgQAmXd46rZbQCybDUSbLzWQhfrq31r1S9dkahhwA/rpIdYUfbF2ZJlRFas92ONAuQS/bUEMl77aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fc9TUIcp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA53EC16AAE;
	Sat,  6 Dec 2025 13:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765028084;
	bh=HjJDMUd9VNGNyS2sUGn4tel1CQSAz6Tp6zX5Z6lzkq8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Fc9TUIcp14ROVpX2bXITLBwgo/+wwuJuCQrXQcFrWllQnh7K1vzWzT7pvG6lz8S9o
	 BCTX9TXpYAMgz/+l5QsPj3c9JPmec9gdxG3Udbh5Xrii1o50jGHJ9XSnYiPeV3yItI
	 99pgAehMAB6KDk+ghAnEZdK8+Lnt9rRPaW0025adiv1EcJzkm0U5eTYvRrj5iwBubT
	 XALoCwJt5hVvVKifakVXrWrI7hdPqMnZ8aPMNBpzP5i69SSjkBqqM4ZJYfv2uoXpvw
	 HEQ8buHcwSjvKUSowS6XuvhoRozXhDSURjYGIaegM3VhdAACH6AW+wSKW1L0+52Qkw
	 qk39374fWej4A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB36DD3B7D5;
	Sat,  6 Dec 2025 13:34:42 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 06 Dec 2025 14:34:18 +0100
Subject: [PATCH v5 1/8] dt-bindings: arm: qcom: Add Pixel 3 and 3 XL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251206-pixel-3-v5-1-dc99732e7d35@ixit.cz>
References: <20251206-pixel-3-v5-0-dc99732e7d35@ixit.cz>
In-Reply-To: <20251206-pixel-3-v5-0-dc99732e7d35@ixit.cz>
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
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpNDDwup2N1oiIS9xWiWvjTHX9KPfgx5ywx63Mv
 pnwSS8wgs2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTQw8AAKCRBgAj/E00kg
 ckxwD/9EqAjogwvcakPub3hc3GzFT7RcCSDhB3usRiY8qE0ulXukulIDRz+rOxxaXnOR0Epbq4I
 ngF+zXNNPnhjmZvu0JoijIQuFPP6U8N23jh9c/mP8v/PdkmkElF5TXxa9vUGumwzbthlSQ5VWwL
 n7TNQSl89hVWHz6abxBNJm2TPo9izfjhrcbQPjujc548O67sFPRIhSq/7xzIpb3yPfE50On5vwd
 mW72uk6l6kJhtGmUJ0IKEJXm8W6MchRTQlo9jDiYsa/DemSQrZuiDfLzsjDaIFYqG4TkjQXi9Of
 vRK+f+yIN/0h5f8m47BovNv7PamXxeyoWGZmY6YcNO4N9qev/HGCZpaA9oXV046IfRtyZDN0MuO
 TSKwuR/qXjNFO6JJP8yCmeGnrj1oYO7sjesuFJ5X2DDN2vQ7WFRIw0r6wDZQ+P0P8oGCO4H0vJM
 UM7e3TDhCl96O9ZkSFxvj8zM/7BSLOgDW7v6k3XAoRpaHbgbVUV8HTt6GdHazm+47DbWNhJxLoJ
 T+flF/ar7ap6GfMQBCzVXxOSDYlpS/MIcUzeuFNHan8sfBK2JezZ+kJRUTe6hr0qHq8OvwY8bBT
 3ANxlKpdBtAAs6tQaNyBuL4EqsTa2SeB/QO4mQERwzzTNjbahvS8BA7IXuWehEnTeZQtBGNB+zD
 StKM1bpQLCfCX4g==
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



