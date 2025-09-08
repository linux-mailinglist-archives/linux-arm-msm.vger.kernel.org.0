Return-Path: <linux-arm-msm+bounces-72575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCA5B48E96
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 15:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8ACF3B4B01
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 13:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E7130AD16;
	Mon,  8 Sep 2025 13:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gvsDVI2q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB338309EFA
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 13:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336670; cv=none; b=RVnznik+3RI6LC5CNfPqkzGbv50f2i5SqRpzp7AywXrkPLTQikzYfIgXkS1AYVnAaLB2pzduKGU8sPdBAFVGs9f6NK8J6gtLjn0VslA6OsQC20K8eSPbv7EOC0GX5wfxUgcnu4fVIP/+ayLL5uWkESVvf3yXQ16aYfWe/cUBz2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336670; c=relaxed/simple;
	bh=57wYQRJRg4ExArTqXm5cpG0+xrX0pV4cmaNg44EIRGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P76HXR7M00qJoashXyklIkC8Tcrz0LEfbOdwXdWzSFfnV8LWHCdJHMzyqCgy5QUhWYgdjsuecCpaTVuoLJfv5N31vqDfqqVo21TdlIIevMl2cr5EC/0fVsIAvS4KDAfWnO+5Z1aPl/QoetPKLWP+L8YjcO1y1ot5UgUjqIKjxyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gvsDVI2q; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so26730125e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 06:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757336667; x=1757941467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4X5mW1qB7suLhxQR7vN67LmE2/9l2QgAFiGjCe5Ekvo=;
        b=gvsDVI2qH1LMysWNZZ+CW2coXEC+b7YnbK/opp8ICi6WmYzgiq9dxCz268Ere+vcmu
         0+jdAGBkiEf3bHRya/USxlyz2bmpjTyG26rz4+2jMvnN8ilZRSIZTdmrQMf+YI4+NJRH
         ZPk8U2sSJa6jAanFc/kohg1VQ8OLjrbBnunyy+0Ao/TYMQ1qOz94y67e7LOPrAkRL9z5
         GPa51wnqyerMULt6UCrzidPBHpFOaqYzew6ZQKCn9J0INC7RZj8RrPZQcKHX8af4iARe
         Jn4u6XryQLQN/RNsPxf+Jm8a0ZejWm8PT6NhAeV/9Td6/SBOnPcb6MD+bAU3Im607KXL
         za3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757336667; x=1757941467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4X5mW1qB7suLhxQR7vN67LmE2/9l2QgAFiGjCe5Ekvo=;
        b=wQ8a7I+qCmTFGbZvcopGhNoZivFafUXtBeOGeGZyCw+IXyRmen4L7zNV65sW9/OwvQ
         u4knubUgu6r7ElweAqbdcfb+4roaKsKuGnF0QVKE6iSEohB4TkbJYOhbNNcZRtHq2lKe
         I0o4cfzUNFbflzBxaP9DGYkDNHta9VFEAzVhzHC7YKsJ44WR92qsl+ctLvC2+Sa1Rc12
         NXYKDNqyrdCCaaFm5oO3/ARoNduYg6K/vU/tcos+th9LNm1X0lx23CNtO6X3ZMfl6JXC
         IapylLLFCrJ6AmSYEN4qKxSi0G1AL0OX5VG0hKbx7T0o3gPBdQ8GJgmZRlRIifm2jBjg
         Y0LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAGkq9NUa7TORydMfZMcXw9pV5ao8FZ9hC9XfQozbeTt0sd2HGxUpuuHY91eZ1Ma+4ae7wVVxEdNPWTqwR@vger.kernel.org
X-Gm-Message-State: AOJu0YwwmvhsOyCTlVqhhdZmw1v+3muileiTmKG2bhqiAb8pFi26X+Cv
	CXCRX3Tfw9My9jEqvB82KopOw6K+QYTAEY1ZSkB6xCjvBqMLe5aXSKkWNfuBLoT7NY9iI0Xe3++
	9Q+ncXHY=
X-Gm-Gg: ASbGncvx0qVfOoKwa5BMmaw4TjOecSsKxhcpOdkE+ugtqZ3kdqtX5FBr943a80tHrQ2
	QkZBMp417SMyGmP/Q9GpJ5Bw2OqfVAvq9sBygxFIIzJCDpYoHMLotJmWE1Ix2hrsB0OC+slW9zR
	3HKQ12Rgtx1JcWsrzSdQihcr9zYZrQ12PGte/JpslvtpbfvNIatwwlwzo84HSU+4tTQVQQyLvap
	Ybbbi6HLAjhk/o2HU4sTuItWtHyj2iBSkj882+I2t8eaxi2xJQdzh9zNiqKZfDGldaNEWPRYX5u
	rZHeK+QANGUNroKVNbGb2PSMo31gkup3ByY0Tz+BVKrJ6ybVV3rJRE+1DTYb1gCquSXoyYLTfdC
	Ba6ZEnI4Kv8iRpKjy0yFOhZLlLSh9vOLdDvJcQYS54yxTxcE4BMmx+Hh0OuB/VAKg
X-Google-Smtp-Source: AGHT+IEGJNo8lvHD3KT1nd3z0SZyukocp+3vpAes2A8i8fYAVWbJ1r9NqWQEV9vNhvmGaNyomqk4OQ==
X-Received: by 2002:a05:600c:3b1d:b0:45b:8ac2:9761 with SMTP id 5b1f17b1804b1-45dde20e5c0mr71641885e9.13.1757336666930;
        Mon, 08 Sep 2025 06:04:26 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd6891d23sm145632475e9.4.2025.09.08.06.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 06:04:26 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 08 Sep 2025 15:04:19 +0200
Subject: [PATCH v3 2/5] drm/bridge: simple: add Realtek RTD2171 DP-to-HDMI
 bridge
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-topic-x1e80100-hdmi-v3-2-c53b0f2bc2fb@linaro.org>
References: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
In-Reply-To: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=57wYQRJRg4ExArTqXm5cpG0+xrX0pV4cmaNg44EIRGY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBovtRWQc6EqvDQUILTPG2XMP0l4jGNYemvl7JX0cwS
 ZQL48r6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaL7UVgAKCRB33NvayMhJ0bWxD/
 9GOARmjbH2RhQfFuwESyv5NkmWCcN/CI2i9DNfY/SfhlryWRHAlztPNcY3o93MW3GOANYV7L0wAhTB
 C7qiw4uh10jFrOkhxeHewFGc55BdptV0ZuALp9fKoKpUSUvYU1rQ+jdgm0TJmWXoJUkrqbchBbMA4E
 pQsPkfWINXsZ3Km5s0bKu+j6e/2GfqhtLXnW07cjOEUfdr2MMNYK4JHrhU0iXSTtQMYh4txKmi2NkJ
 59htO8o93xz9hWLFoZWKKEyjm7SpZRZbwcwKN0Gfen/vSduFv/FNZYd5eDMbYwoqh7vSM1/pRhk5vg
 pnBHMDL+yg6zAvfBNvoSFPjqqTWlX8NySuam9JE1tluCspNls9s65c+U7eK+OKYvx/P5w3NGASQK66
 dNOGUz5/3160k52iVHpxgPdZMmVffGChGKctVoUbda98pR80nm2yEKmre/ky3IHog4ZqTBcIs2TU9u
 i2XqCudzV1iqvnxR70jMiGjVFp4yDTwq8ClGhFnkK6sfJwLfvK3wPjwYYhR5u/FSJdYmxyILYJgsBN
 cFvByrkVdDKR44TOtXhSXe7K11w2/z2u7pzCGzqrS8zpHXb/0BAqBpbkGDRPE3CT91hFnFlzd/6NCd
 lxp4tzknBJLQus3yJHTmE7pMiwLC8t+TXPiw+c1Pl4lu1eKClLhmFD8eYKCQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add support for the transparent Realtek RTD2171 DP-to-HDMI bridge.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 1f16d568bcc4e0fb56c763244389e6fecbcb2231..e4d0bc2200f8632bcc883102c89c270a17c68d0c 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -266,6 +266,11 @@ static const struct of_device_id simple_bridge_match[] = {
 		.data = &(const struct simple_bridge_info) {
 			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
 		},
+	}, {
+		.compatible = "realtek,rtd2171",
+		.data = &(const struct simple_bridge_info) {
+			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
+		},
 	}, {
 		.compatible = "ti,opa362",
 		.data = &(const struct simple_bridge_info) {

-- 
2.34.1


