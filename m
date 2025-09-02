Return-Path: <linux-arm-msm+bounces-71518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD603B3F962
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 11:00:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A06932C1CAA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 09:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3F32EA476;
	Tue,  2 Sep 2025 09:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v8HJrsCo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0407F26FA46
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 09:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756803639; cv=none; b=fXIMKJpNdmElkNX0vCVUS9kPoCK50Ota+XXP1CvUD50cWCenzcNLhjBk8PLvtxyNL4IYm9JCZk0ctJNlsvrGDSro9uzBs4X4bMFv7ZBL/hXPHjHMexf3FC1T6jXx8pwSK3Ki0Ai2SxW1bOyRMmZD1XTn8QXaISqQxgya8jON3tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756803639; c=relaxed/simple;
	bh=yi+yrbIzGW/iL1vhPwZbx/n4ZLKTnBzZ9NjoEtR61eM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H2eL7aKi6Fyo5bubcmpMqT0AEsDKuhdKrz/c5Z5SiHp9cE0M6Ax2Fh4WcTg0yGMOkfXnpS+7kUtW6ZPP+NpfMJUoFCQlp+aXI9LR9vbZQ4WbBwhevNYUGSDHwk0upn6Rfj5OT5q4OlBxHjwHOVbQ7Vh3BQbKYwV0WKXyYcBzaYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v8HJrsCo; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45b7d87b90fso34196625e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 02:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756803635; x=1757408435; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zGYSWAcPy26A8NcvE1GHC5uOZ8pXLq1QnhxmCLIQEEk=;
        b=v8HJrsCo9wfK1BIBPfvlU4/m5eKoB9iOUv+vKXb+8Uv1ShGZgkSFqzMmsdf5aJfQmn
         WwhB/LMc45SYN6/z2DgcQIBsS1YWbwImVdA8qRc2xUjgcdT1g9VOx12d221A5bjLQfsN
         H9zGiwz7oOJN6TM3ACL+ut9z988p+3luIKCVn5JRE4QFwOSd9ZDVLghtbKkfeCHBmfme
         h7baMqNwz0x9zOmU0Ob2gQs/bsZxPNWjiEKADDMTVqd0Q+tjzu29Phhvd4q3mXkkd7nR
         u18W6CK71YXRpJYOowh5CA2QOLww94A9q+TLHwkqfWO2khH6Vz/qOAjlmjpDjZz/KvSH
         Wkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756803635; x=1757408435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zGYSWAcPy26A8NcvE1GHC5uOZ8pXLq1QnhxmCLIQEEk=;
        b=mJ/XqihZ3GTiYmVRbFziQWtFOiSi1pK5xIFzfbQ5K2BinqxLH7Z+ybbzo1YjjtWRZx
         rEdRFe1cd+xLHXP85j1n36p86FDfPxgV7plE41uvYTZIcfYu0wr3xtSAbGhYQJuuIoj3
         jDng9jHfZoBES6jDCGPHQq58k/nYbTSMPDzC9cjQl1IfrqmMPuq7VdHukE4v3h7bYjoH
         l5/edVcX0ktcxYYq8Naem7HbC9lcrzW8qq4IrrrF4TgkD2yLDmb5cGyzYQ3fYKubVzk6
         RRhEciV4JBy9/luzRen+dqqtBlJ2vV5pwvRD/93He9802Do00fewsmT0gATR7sYUOcUC
         lRKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7yDzmm0nhfRc/QAfjkQeFQlFHZftYkKkL9hNAVPRFf8TuDYvvYTrZhm6ojYLwMMGRxfDOAblVV7lYZV3d@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo+00IfHqmBkzasTcHrK5i1hdQNaGrJBdw4ByRTYPWgjRHPm2U
	pxL1rpXWjnctE2JaA68hv1loNezfF+p4wDstkzJpjWJ8VcdQ2SYrktwsPyBuHWhi8/c=
X-Gm-Gg: ASbGncuOurCo+pdEEb91HY+SX9HFblyREQQfJLV/Twd4iCWADC4/x632135v1+PmXXw
	w4PI5x1T20bCWFhZVL1mps7qVSKkjwr/R+L7BhRsQg5/zFQJIO3io0QU4Tmx/FRlFDxGSNTz+sW
	zdWZTu1T+lmMUV4PiO8MwEcTGWLpbcSLCXGadgUOtbOOSw6S1YLiYsFaRjQWaGS+IBpfT/0ZSTM
	yz6Nlu6jwODUD1fh7XMHqX6auYr15zxTFLlY2kbK8toP02zOcbP8RZ5YYSDIG4S1xa52awYw+HN
	ZkBXpFICF8Kz+1ujQmDw0gwLUq1z2CVi4QUMk5//V1zkSlSJ50Lmjb7O+ua6VQHeFF2QaTQwBfT
	vD+tpuNFbAmP+WA4IQpM9ZpgeZJVc2mFFn7XRASmjLrqO73Tqv5iQ6A==
X-Google-Smtp-Source: AGHT+IGo6pK1+48xuNgN3auTewN/EHFWBz9+Iiu+OQ7VN6pvjPbYNc8364yuEsgI32HicaXdpYLUhQ==
X-Received: by 2002:a05:600d:1c:b0:45b:8b95:7119 with SMTP id 5b1f17b1804b1-45b8b957228mr58823695e9.8.1756803635309;
        Tue, 02 Sep 2025 02:00:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7271cd01sm261112045e9.23.2025.09.02.02.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 02:00:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 02 Sep 2025 11:00:29 +0200
Subject: [PATCH v2 2/5] drm/bridge: simple: add Realtek RTD2171 DP-to-HDMI
 bridge
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-topic-x1e80100-hdmi-v2-2-f4ccf0ef79ab@linaro.org>
References: <20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org>
In-Reply-To: <20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org>
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
 linux-phy@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=933;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=yi+yrbIzGW/iL1vhPwZbx/n4ZLKTnBzZ9NjoEtR61eM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBotrIu1rzwhA3usNfOLqoRch32SVvHPgyil+fD4ZNq
 nNQ95BCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaLayLgAKCRB33NvayMhJ0c6ND/
 9lkmS7XWOeRpyO4D/IzKA6TOlXSIZbQjaXoiBZoCqEgQlddd6BnF+B4alveipEBm919yvs0w1oObaB
 B59pxJbpMnIYNDW+uZmhwvJBJTK/53NYszuzbVoIlqkj9xB97pt2CPdTFV2uTSc07gMqFi5X99dFtl
 eZYOzch/q449Ca3DraYde5kJWpk9SyCNzbGP5i3JXtZ3IT/oNLFFbQSavQ5k6bVPheGKHC3BsjydGA
 jIZ1XAQRSbM4WzLqtbk5UKne7vEabHKLtMhNv59vtVx0Wa0fDI/MCx5ex+3XrkYxcKMSO3EHlRFUdJ
 v9jJUv/Sj8dXnlMfNcnc6yj2Hhc9ioIWFvxHbVcYwtP/fU8wZxRoBH1esjHjMnsCH5iVijJg4bxplG
 nG6vT5YWAXPvoKgBFjSqWbhHZMv4Fi6Imi9pHlqEvXl4LsKqrjRA5ZbBFy7VqihvOftvruy34dI6ZW
 IAFs+aHk0hdTgD2LjY+TvqDAgKFbh79BWvZXm96KLxMXu2BgR5zRjmJCEetGeomk990fCaX7382nma
 R+AstoG0xrZ8ZbOj1HsfPBTTkyf2r7gaeWHotRSS/gxmbZctKhpFyrqbo0qAGxWJoi0u+ggzay+Kjy
 LrfDkeCFTU1rdZCgQtdOJH8u9CmnA6jSAf1dZP6spP0Kc7SbACB0DnK35DNQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add support for the transparent Realtek RTD2171 DP-to-HDMI bridge.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 3d15ddd394703a351c1a537e7ab5f1487e024ee4..acf8a6b639da4119f17e4a7c40605947495da0e5 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -261,6 +261,11 @@ static const struct of_device_id simple_bridge_match[] = {
 			.timings = &default_bridge_timings,
 			.connector_type = DRM_MODE_CONNECTOR_VGA,
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


