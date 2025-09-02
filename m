Return-Path: <linux-arm-msm+bounces-71519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51518B3F964
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 11:01:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F16143A7DF1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 09:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FB22EA483;
	Tue,  2 Sep 2025 09:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K60edRK2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146062EA154
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 09:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756803640; cv=none; b=u+HwtQDN73ZYxua41GW5eKs/Cl3Ok25gYn8GQZ+7cNCqe6mTUZGN6ikeKT53OWGB94lxqvVnGMKaa6w4ob4Uh5SOhwxWKwBJ3tpliCkRjJEKBjUVuZjs0wcos7jycikqbvOJp42TkQopQ/OUvecRknMdpX5nTvS1onKoeFlt1dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756803640; c=relaxed/simple;
	bh=51R7ntqsrbjqkkbo9tDq8z9uhTW3d/VToQqy1+1C74M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S8ZMh1kToxW8cUSfGyAK+rRy1K0eUAYP+sP9NAE3VWo0TXgzdyvapmCLo7SZF83PkE4sWM/pj6rWHH7SEQuSE44vRK+R9j+9a/ND2v3EHWSuTk9f2FDhc4n5MgWlVeo4/Ui+gzAiDJ+lqpq9PGMhGEJtjinc1t1UgAQWTW/b9C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K60edRK2; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45b869d35a0so17551355e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 02:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756803636; x=1757408436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4Gc9lydW9tzAwiGsPKTUOmW13FumVd5+LLitcdezXI=;
        b=K60edRK2tjMxLq/pzEIfLo7g2RvpjJ2wDVF+wTXG46P1Cck3f3lDtbIfB2pyTEzztW
         ziDnAtwCnUvJVULo0kUHGT7Nwt5i11eDAVeLy4jbrLrEW6kTBlCsIDpG/RVXxu5aqjFs
         Gp3wTTzTAjvVHiRYHYkWgRUj0uGU+JdeQfRpvNy8a4hEyTChNefpc46+gAOmKIMqBrIG
         68eC4nXTwslocMt8EzLMuxbcaU6F/kl6XIWnEEM8npZFmnM0YofRuayEMxKFR12o0cDN
         mt53UB68i06oIr/Gi1+eBiysVz62uXe7uEoQQaZOu5bnb4qtqMgS8UYfANnc0dUFQ/Fs
         9WkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756803636; x=1757408436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4Gc9lydW9tzAwiGsPKTUOmW13FumVd5+LLitcdezXI=;
        b=nbhCjWDXcWBKoLGScayW7ysnBjbt1XB5tQYs7HnkDpaAj6lM3OLRz8+INp76ai0JME
         47XTJ1Q2d1xwT5YnI8lL83wEP89mCPvBm19ILDnxUurXVwZ/PXE4QnffK/dNWvUcj51n
         wl23Ms95jLYAfhxreFVKCAbiY4+AyZh8cTcF2UiBo8xdT4PA+P+vYEBuWfBsWt2CQBJ3
         l9yWXD5siWOHXnNTo3+wBbjTEkBZH0oGOxGtDdleNyJr08o+Rc5aNV1jyMPkpsNvE9df
         lZz2+8bb/Pp8ODjqSdb75hL6Hr5lyAYdkEgr3XXbVg9ZKWFdNXqdrxTrSTFdm6OQJOvo
         BRTA==
X-Forwarded-Encrypted: i=1; AJvYcCX+KndX7DwcvZom8Q9HILUJWP9AJt1WEDFXxfxPEbcBv5vVZDrOLM7f2WdgZAVYSV4DTcLe0jecJ0+/MI5h@vger.kernel.org
X-Gm-Message-State: AOJu0YzI/W+dUYeNfgqvXGSX5g6BSCbGC9Ef2R8gKp90E7/8yQT+DuYt
	CREUbWZI50X+1P4ynws3VBT1PLTq9PalZtfuckqEy2Hx70HDxzjX3QeUUIxQU9huspw=
X-Gm-Gg: ASbGncuHbX9V5oqYJiwnoG6IaWJ8CagrrsoW28U6XCawLHKpjUOt0lVKuyBuGg8prCT
	NspGqVQOXWDc2k/3i3XzzjtrI81K1yXbpfZXe3LRM2t+RcRcedHfF76fmn1tiY83l9uY5cpOhi3
	oV1h6VzpMQ1nKAiQ6Vfw4U6F98V1pJT3Uw1GosUB9avxMCGdrFwpz82++DVYaZIapz4JzNNkSEq
	g8AHH+g5Rw+qUWVJJDMmf92JQbG8yPcj0rekfUqbyKWmdZluI7/2pXEJZqqAaBSyVk3e/+wgBzG
	ScLsjCY5AcBk1yDNSFlBAWZjlDofPJAeW2D15v54TYJ3gEMCDrN2L/IDcNxIcdOlUV9ni9hu3ab
	50vDpQRzHSQoJFNAR3yZMNBOsHtozBDeZ7igWI7FFwoEdQOdV6+vBoQ==
X-Google-Smtp-Source: AGHT+IEILw7DEldBdS7IGmRLvi+LEZl/gvFjKbfhYpEStds1C/TgZH01vWw4ozqfSAy+3MiHrBhGUw==
X-Received: by 2002:a05:600c:1e8a:b0:456:2b4d:d752 with SMTP id 5b1f17b1804b1-45b8fe2bba1mr31627165e9.20.1756803636238;
        Tue, 02 Sep 2025 02:00:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7271cd01sm261112045e9.23.2025.09.02.02.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 02:00:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 02 Sep 2025 11:00:30 +0200
Subject: [PATCH v2 3/5] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document static lanes mapping
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-topic-x1e80100-hdmi-v2-3-f4ccf0ef79ab@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2711;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=51R7ntqsrbjqkkbo9tDq8z9uhTW3d/VToQqy1+1C74M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBotrIvc6t4TujnMpo58ede29xTmJGQdEWRpxV5GSqf
 h17tB6eJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaLayLwAKCRB33NvayMhJ0X+1D/
 4u4YL6Ysgv6k6MFx7QTE9Fi/CP4grEccBzfnrjMyg7+VSuEa694ZowkmTpMf08EX/FuD010Pjs2uhc
 J86s8vHTOcExjUoFmhz3QoDkMDUwn4PBZKxGVRa7xkgsadjEs9rKlnsRc56+X7AxMu6DX1AEu4be7Q
 471IeyJBoikRzPsZMFxKC7ai3e9OtbFoO4lWhnTmkSu5ByuAdm+OTqy9TH2m9rE0h1v4Dfw6L7AKoB
 EgN6WIjsjR/SXOGyPP3lgELCyni4+hPj/PvvGoyhZXXFV9wn4hrRJM+OoKzD0lXdmeb7sDA7+n/keG
 fP6XvhWQL0TOoWukD/8Y42HSn2Mqi6AAcG+sJJkpfXwl9wd4MjDd1LU74fGbd056V5NOPI0M8wIpGL
 As1f4pvje7+YN/eXdWJ0xM/+dKzJ54yw+xp8KdouBwhhu/eTDpMV/ti283/lOnSQIsGXODTIpUL1vV
 5/PMVXQsQ5L9bZJ9f8T2Lp0v/cybcpPvmLCV/frxtWSlR49L4DUfgMcYHrhTZcQrn1xuj7R9j+sYKs
 MDEWrxU+SPBcdvWgAvyHRqaOieELBxKvMCvSSTkrD74KcriI64wy0L/7ZBT3RpuVg7r0m/NyjD6kqn
 bfquLF1jGDVlthmN27a+ZWZngxTya5WD0OD4b3Fz0WfzuYKF27wiV2PU5Tyw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
of a combo glue to route either lanes to the 4 shared physical lanes.

The routing of the lanes can be:
- 2 DP + 2 USB3
- 4 DP
- 2 USB3

The layout of the lanes was designed to be mapped and swapped
related to the USB-C Power Delivery negociation, so it supports
a finite set of mappings inherited by the USB-C Altmode layouts.

Nevertheless those QMP Comby PHY can be statically used to
drive a DisplayPort connector, DP->HDMI bridge, USB3 A Connector,
etc... without an USB-C connector and no PD events.

Add a property that documents the static lanes mapping to
each underlying PHY to allow supporting boards directly
connecting USB3 and DisplayPort lanes to the QMP Combo
lanes.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index c8bc512df08b5694c8599f475de78679a4438449..12511a462bc6245e0b82726d053d8605148c5047 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -76,6 +76,35 @@ properties:
   mode-switch: true
   orientation-switch: true
 
+  qcom,static-lanes-mapping:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 4
+    items:
+      enum:
+        - 0 # Unconnected (PHY_NONE)
+        - 4 # USB3 (PHY_TYPE_USB3)
+        - 6 # DisplayPort (PHY_TYPE_DP)
+    description:
+      Describes the static mapping of the Combo PHY lanes, when not used
+      a in a Type-C dynamic setup using USB-C PD Events to change the mapping.
+      The 4 lanes can either routed to the underlying DP PHY or the USB3 PHY.
+      Only 2 of the lanes can be connected to the USB3 PHY, but the 4 lanes can
+      be connected to the DP PHY.
+      The numbers corresponds to the PHY Type the lanes are connected to.
+      The possible combinations are
+        <0 0 0 0> when none are connected
+        <4 4 0 6> USB3 and DP single lane
+        <4 4 6 6> USB3 and DP
+        <6 6 4 4> DP and USB3
+        <6 0 4 4> DP and USB3 single lane
+        <4 4 0 0> USB3 Only
+        <0 0 4 4> USB3 Only
+        <6 0 0 0> DP single lane
+        <0 0 0 6> DP single lane
+        <6 6 0 0> DP 2 lanes
+        <0 0 6 6> DP 2 lanes
+        <6 6 6 6> DP 4 lanes
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     properties:

-- 
2.34.1


