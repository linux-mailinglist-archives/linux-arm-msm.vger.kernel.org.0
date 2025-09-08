Return-Path: <linux-arm-msm+bounces-72574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD08BB48E90
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 15:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4C501896B23
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 13:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6C83081B2;
	Mon,  8 Sep 2025 13:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bG/9Fv2T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFA5307AFC
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 13:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336669; cv=none; b=DiF8NpXKKDuxSG8nwFEDu/Y2YeEeU1PJjNHdsppVbFuyaMiEmUm6ndqiDdsCuCIbhljcgTfytbP9DfJtYX5PE4NauLXwQ47iCA2bKWtkakdLBWprblG/uRaetaLvuXzWTg0rxRI4kJlNXNV5x0i46tc1t2oSEOywGMRvc2+bVbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336669; c=relaxed/simple;
	bh=z7PAuGtYNvNlORz36aPmSnF79TimixozQax/x4u5xJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lCyBZv5uPSTIio06pN4MtqXK2PMHhmbmtu2TU+mxAsklwT8iPtgp1/NppNkqnM/RUbyn3xEuwwta5iGyaPMxb/Xr/xH6ULQr/4okH/CRcE33aE3NCLTE0SZ+mXoi5W+888++MlSdWkIK1C1nlegdYNbPMdJHFN7YRFIq+Aw8nUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bG/9Fv2T; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45de1e6d76fso14171435e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 06:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757336666; x=1757941466; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2GDdn26faX8+Rd19RRlHwI66hY8ZBEzdxwGwtCXn4n8=;
        b=bG/9Fv2TdfglV5SHJL4gjz8uAX/FRQ4VwzG+PQv0aTkPo+dRKax97L7DA6VTyMEMda
         huEVNBD+tB71SSDIWDkqkBWVY+dh23wAXeY0MmJCOHUoy+BUt48iuvXeoP3by0M6Jwol
         PYNBm16uhCczklLEomPcmzcprR794WT5hNL9awTexviMJC5q7zjBa1mJjPqu2910c9Mr
         k7CIewXY0VSZJYyAdDVWeuvvqfIEeUbnIyyQAYB21Z7QnnYb6NsEvZ4Hr/+VpfDMjbux
         V4sS2c+Q0iJ1C1RTcsjmiaovG2R0TC8I1mOdFZzD3tqfnwMSVTYWR7MMtcrD8nAsiDIH
         RQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757336666; x=1757941466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2GDdn26faX8+Rd19RRlHwI66hY8ZBEzdxwGwtCXn4n8=;
        b=fTTSerwNShNhC3pJluBX/Pt06yBY0Hhhkek49TeuICOC85GcphWlbz6mc9vlXgRKm3
         SZhnXFT77ukTJYStxCvtzPxr+zAq955g/dIjHxpqV9UySTkLHriVWJ60f2nYqnngT3w8
         2r/HdMWOHlGg+Di1GVkFfdSf+z50Sk7jK7oAtKUC+Bpagt8iwrZJcNP448k/rB5BQra8
         igV24cSaFccY/5Er/ESeCTDAejOXttPO27PZEouChEWVdOoPqMaSBdBwv1foH0XiEXO7
         YTyMtPhmpAtHiWiRbmp6ZxnRrS0DRMcmrYysOb11swc76GQkFAd5nLQem12m/pfHWdOC
         nH0A==
X-Forwarded-Encrypted: i=1; AJvYcCW+0X2KWXJNUVaR6Uv9S1/f2XEYRN3aNOY7/siketWvINPmDXfNYscLrejpAMaiYkOAIT7Y8zhlduQRSRxn@vger.kernel.org
X-Gm-Message-State: AOJu0YzLzODbNJmPddh7f7LJbI67LMtMdufzm+tBosF6pJNRwn2/w1qf
	X/EZXWcfgPW5r0bvuGWdsqvk1J5HR8IgPhKTBPjNlEdUtjYO1m99mQ42MqhJMExFU819OQePu4S
	ev88RlUQ=
X-Gm-Gg: ASbGncsoJX1Rb6WFWn+juHR4r3R2IleNt07GpB3kgtZgOyZsKf9jPN4ES1I3jFBpaQm
	DyI1wscPs/Ik28bG3dOSU4P2EIh8iZNaHZ1DxiEs1XOn4tUtZa33vyrUC8TDEuQEGQmekJ+4or8
	F9jUgj+i9qi2vUkUgjRUtf/aa0XdzUOoyjwFEy9iRdpKSBhoRI7TYVZ9HYxmOcYTuAHgcPqVmkA
	H/K4WO9v18Ur6xrieLd5TZ8Nt4LWZLTzD37qsKdBaIkloUgLip0PSgxufguG2ly75AoMMrh8yWI
	vhi5qix1dxI3LmxTmWjUkwbRueVU+Lnb9o17SdxbdAIZxQjmociP7oBmAAU3aJp6+bkeN7Fey5i
	nJmoNtDT2wj7OedC5M3IXylcrpzX/n2A6NlJG5x7pm5xcwLYFPemfiw==
X-Google-Smtp-Source: AGHT+IE+QQMsvXfniwarXtFZkCcmmT2rZk6Fee10DBHIU433hV2b4Xz5UNo3Gvh1D6s/nDMeM1UWiQ==
X-Received: by 2002:a05:600c:4f03:b0:45d:e54b:fa29 with SMTP id 5b1f17b1804b1-45de8e21be6mr18156375e9.14.1757336665980;
        Mon, 08 Sep 2025 06:04:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd6891d23sm145632475e9.4.2025.09.08.06.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 06:04:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 08 Sep 2025 15:04:18 +0200
Subject: [PATCH v3 1/5] dt-bindings: display: bridge: simple: document the
 Realtek RTD2171 DP-to-HDMI bridge
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-topic-x1e80100-hdmi-v3-1-c53b0f2bc2fb@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1066;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=z7PAuGtYNvNlORz36aPmSnF79TimixozQax/x4u5xJA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBovtRV0EWZ3GTngV+VZoqNOfxTMbRfZ7L5uMzyt+BQ
 Gcxw7xWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaL7UVQAKCRB33NvayMhJ0bWGD/
 9FmFWdexA2fU+CtWIWKbFIwMNtPEpiwf9clzEvPTLk1asoldTXFdDdKzIqNt2UImqiqUFDoOcmXw9t
 gIsk4GdSeV+bFCJgNSDKS+ThVbkQ27MBqv1iG8vZLattjMV4QG6Gc3XTPr5CDWOzg1p4BcXzKz5m5T
 Z73ct5hdeSi9ZQEaoehnuS3RC2+0P1MwQtKOR9mvUb/Nv6PcNjr6QR7ITS6hNczvmuPJQlF7iWuW5p
 Wu+KIBDIiMOwtM9ShXzTLo5gRbY9Q3VsC/LXusa6s2qolctz4pQLoiE61Gn8RxbMpQA2Gl5DPwrloU
 0Nu1bbUVlgKrGwSEQ7YN/MqzWV0nN/8su7VChcF26g6yhxcTfibRYw7O3+bOzob6IAQz2JMco8dLTS
 knda27GBDE3ODLhBmsMBvfdPcDIVrdunRQzXUY0wbp0lPiI2FguqNxUUQHEEIu+vWyC4uEEYjDhw0W
 3deHkxjR5FZdpZNuKxBCkVSMhXGiZ7NBe/eY4LP62g6fuCjtLqkMA9F/CCq3RlV1scYO9UMI/a1RMW
 0JaH5uUXxE91HoAeVxZAv+v85t7ibs02J9/7oR+FAcLYp51VBgFuhV4TEEn+4jHhKJLKU/pKJaa9jj
 4Ozwu1O+JQcG7aMdmLl9jqU/yt1XqxL0uKfgeLrHYxygloky0Zp2auM7SE1A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The Realtek RTD2171 chipset is a transparent DisplayPort 1.4 to
HDMI 2.0 bridge.

This chipset is usually found in USB-C To HDMI Adapters and Docks,
or laptops to provide HDMI display output.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index 421f99ca42d9b75ba1963493d36fc89fa9d8252c..9ef587d4650602699efac634c5466eb2e8aafecd 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -29,6 +29,7 @@ properties:
           - adi,adv7123
           - dumb-vga-dac
           - radxa,ra620
+          - realtek,rtd2171
           - ti,opa362
           - ti,ths8134
           - ti,ths8135

-- 
2.34.1


