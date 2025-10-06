Return-Path: <linux-arm-msm+bounces-76069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A1DBBE3CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 15:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C03C1898CCB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 13:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80852D3EE3;
	Mon,  6 Oct 2025 13:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p/ENZx0/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1422D29DB
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 13:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759758916; cv=none; b=RavvSry2dv3BrYVFpbEz6Ryae+jcpUvm+xLuAcZ0o8DaxTjez0YhK7N74Cbn/bnxo7LybkfhmjDobLkLD79cXQRYJzttSMXpyBNWbZ6aYkrAWaBwNjkLpdC8Sk4xMQB64eGy423M573CyVSrJz2t44XRef9JP4MkNweU+y+2AYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759758916; c=relaxed/simple;
	bh=ig9cw+e18YkGbrrRMzN7pt/NQWzGPEArmv/nwOMwc4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UmaikugfyNPO/ydne8iuMZHz96pso+F76tNjxjQc2kbTzMTLohKLWpEJ7QmzGzhtn9ckkpb8ctX5AX5YXMGq7wdiAGSWb7ft72lA2SSW/xPLDflbxKLyc8TdVEprUvZoy0V3PRMS3HqhOkO8xA9YZfGZEnbme9loK34X2Ya3E14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p/ENZx0/; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3f1aff41e7eso3778463f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 06:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759758913; x=1760363713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4SGKCFckOQgp39YYXuF7yxGe4SGyUZQGQh+LAC3kGk=;
        b=p/ENZx0/+FUJ4wDqnfC+45QhE/BMxDrnLIqc5ODDTsUsEaWAjWjDIJqy1+E0JVb/Ew
         we7brFQzQgLekOKfczkbyuGYAe9mgLIOy4l0kJ97ym8kGu5lp2p1BDkSXlb2JVy+MvAU
         vHTTsA+4sP9vFc6zhfM905GdKD5mTvQ5zN2T8ysAz0Ib5xQGbHWdKpyK6hY9WtDCLvAm
         q176MLIDFjIPCd7IgumSfi6x9w3WNzOxeKOjLSYJejofP/v3ppig6WcLj4uOYjuziCmH
         Wc5eeFl8jHWA1+6oenbUcqspoTCLxjUZbKqEeTxTG5BuLrfDbrvr3BZLw2cp66Uqden8
         i7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759758913; x=1760363713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4SGKCFckOQgp39YYXuF7yxGe4SGyUZQGQh+LAC3kGk=;
        b=TBYwE99rg9S/ilPo4yMNUI+dqAZ7l/bxN/pGVGW7LYgLdHG/OGNdaxTHlt89lR3PqG
         jz+XPw5deQNURVKy8gLlWhTIW9L+YVhU0UKoOsNhwEt3Xmh0ljCTL55ch6lBZRV0blXU
         +Lfah3lddSjHFYKF2gA7dRhTcTJey6ROwNt2+PtRvtAgo/PfqFQNycrL87p5/2YbYIFs
         nazn8+W1TjdibcwuKZ3TOddI5Sc0nHphe3yq8lLvTxhICGEWIz1lkRkdl6Ft1OIPzcAn
         2NPC5l3XCGzd/tv0VG3Ufi/n7tFGsmf6FTZr55XmVLy0H4sVdW1L3vuWyebwthwuU4WA
         oU1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoe8xWdn5rhuJfInEAkiny8S2Fg/99e8pwB5KxRJWW6GUGZ5q3yPXbqDJ1/O1yvGtjNzokda7NqufzJ3Wh@vger.kernel.org
X-Gm-Message-State: AOJu0YwVyINEeGkmwDftocCqhG11MEuA8K4N+ZjxtN1FT39ZkmjBzwmk
	O/oClkRySP1A1QAkAiupfnCT2MkIPq+HWxwS8NHzJOG4q5GKm6KIX3LiTWPjEOxRNJc=
X-Gm-Gg: ASbGncv08KExupmz3prhhHy0ebICTLvoBlaRT0sYQqiVnHDbpXWfPWzjhzAAnnqXfPt
	++yri2bGAuXH2HijucrXlrQ794tgXyk2lJke04U6ZfzeqieoPN6vbd6EmkSlTDrQ80y31T1Srm6
	qYF2MiGIzhcfDyq1wsynn0W0kTRE3eII53tvjCNdcjgesB4diYOm5HGFujjDVqf1cP03l+PaYJK
	okhrqOPUsPvi+aTPi9GYZgMko4mxgXeNGe0JaVbBH4IMMv4nhQLGvhLkyFFl5K1SeUUSMEe5tWy
	PFDW32f7YBu5XqFPKS+uNrd+cAKwT2ZuufRNSvUBu5yT2x7rIQaw7b61nprp8N5iikJugippqjk
	6RnpCisWQO29/YBq0z1U8o9tdrIWxjv4NJT6VAFq3yGtSTXFt0X8r/qclfuiJnjoimVDOsQJzUQ
	Hy2D6kRg==
X-Google-Smtp-Source: AGHT+IH498SCQSHRD5QBtiH0GzayP2zorpnGqsmS7Xs+r/EO/ywbcVtnGFGeiuDisgdYoPwCAuEGTA==
X-Received: by 2002:a05:6000:310a:b0:425:7f11:3159 with SMTP id ffacd0b85a97d-4257f113337mr1545279f8f.63.1759758912941;
        Mon, 06 Oct 2025 06:55:12 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8a6daasm21291921f8f.7.2025.10.06.06.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 06:55:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 06 Oct 2025 15:55:03 +0200
Subject: [PATCH v5 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document lanes mapping when not using in USB-C complex
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-topic-x1e80100-hdmi-v5-1-c006311d59d7@linaro.org>
References: <20251006-topic-x1e80100-hdmi-v5-0-c006311d59d7@linaro.org>
In-Reply-To: <20251006-topic-x1e80100-hdmi-v5-0-c006311d59d7@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4554;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ig9cw+e18YkGbrrRMzN7pt/NQWzGPEArmv/nwOMwc4w=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBo48o+B4CiSwu7YrbOdHvfZcOGv5M4a9CHW+igZHX8
 DNr8JL2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaOPKPgAKCRB33NvayMhJ0ahwD/
 9Z0aYNK6A9RsTZP8ZIKhV4EhhQy2+Ml9Yyh7IvaphAJwyByCVUSvVD5oWeu9oFnBghX4c7ICldUAbF
 R7QMTt6r205kTteHuZ2gWsinO6k+CGdsvzlNv3laMptrsEfErxAEf7+lB9kzZ34q9aXCrlstxuSqmP
 EZbZ0k/1HQ/zDkvuNY9MgI3LeuZ7lvXjixOzOC6WN7P51mxBRCtNANaNJ6vm7Y1Q9UikBWez7LPDjv
 xGTqKo44vOW7IWdZJTcb0dGbs0dGciXnNVREqBGJoSs3wJ0UJy6EmM58M6UNPXNz8c5EFRBcI9N3ph
 o0GbuMrDUrsKfAcDdV4lMlcdPSwP64qWnStcxEMT13q82gnCf6gsIgw+3EQcupxdZAiR4rdm1mo+iC
 0naPN0CM7/WCkImYjwrypmThNs/wiH2IFdGcCLQKdaS9XHdrI3onZQJfLC3982v9WAQ6da4ZrOdltL
 83+uSHKy6b5iYS81aOj78QcxZfWSv3d1khCqAZ61CfWrkXC/QKgVnXb6jXKneZo4HWVWSUS1nFzQd/
 v+HTy4yRTBnsGWZD8v1nnK2VvPWrpDVJpPjtAZL52VJjbqGRnHz17M/Ausr2paNuL8LQKOLYAXIu9d
 XZ4pEU8FJFt4M8vyxQ+2h9CpUyYEaLdVv3Iooe2RDgaJrNM1bsg9F4IO2rGA==
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

Nevertheless those QMP Comby PHY can be used to drive a DisplayPort
connector, DP->HDMI bridge, USB3 A Connector, etc... without
an USB-C connector and no PD events.

Document the data-lanes on numbered port@0 out endpoints,
allowing us to document the lanes mapping to DisplayPort
and/or USB3 connectors/peripherals.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 69 +++++++++++++++++++++-
 1 file changed, 68 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index bdf7894ff84869030252f64f20acb4f920fd19e9..1d7a7f0f356b11e080fc8d6c88a0c97be88a25a4 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -85,10 +85,77 @@ properties:
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
+
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
         description: Output endpoint of the PHY
+        unevaluatedProperties: false
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+          endpoint@0:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            description: Display Port Output lanes of the PHY when used with static mapping,
+                         The entry index is the DP lanes index, and the number is the PHY
+                         signal in the order RX0, TX0, TX1, RX1.
+            unevaluatedProperties: false
+
+            properties:
+              # Static lane mappings are mutually exclusive with typec-mux/orientation-mux
+              data-lanes:
+                $ref: /schemas/types.yaml#/definitions/uint32-array
+                minItems: 2
+                maxItems: 4
+                oneOf:
+                  - items: # DisplayPort 1 lane, normal orientation
+                      - const: 3
+                  - items: # DisplayPort 1 lane, flipped orientation
+                      - const: 0
+                  - items: # DisplayPort 2 lanes, normal orientation
+                      - const: 3
+                      - const: 2
+                  - items: # DisplayPort 2 lanes, flipped orientation
+                      - const: 0
+                      - const: 1
+                  - items: # DisplayPort 4 lanes, normal orientation
+                      - const: 3
+                      - const: 2
+                      - const: 1
+                      - const: 0
+                  - items: # DisplayPort 4 lanes, flipped orientation
+                      - const: 0
+                      - const: 1
+                      - const: 2
+                      - const: 3
+            required:
+              - data-lanes
+
+          endpoint@1:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            description: USB Output lanes of the PHY when used with static mapping.
+                         The entry index is the USB3 lane in the order TX then RX, and the
+                         number is the PHY signal in the order RX0, TX0, TX1, RX1.
+            unevaluatedProperties: false
+
+            properties:
+              # Static lane mappings are mutually exclusive with typec-mux/orientation-mux
+              data-lanes:
+                $ref: /schemas/types.yaml#/definitions/uint32-array
+                minItems: 2
+                oneOf:
+                  - items: # USB3, normal orientation
+                      - const: 1
+                      - const: 0
+                  - items: # USB3, flipped orientation
+                      - const: 2
+                      - const: 3
+
+            required:
+              - data-lanes
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port

-- 
2.34.1


