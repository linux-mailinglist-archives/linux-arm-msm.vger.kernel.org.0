Return-Path: <linux-arm-msm+bounces-44361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF790A05AEF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:03:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7F9516689B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 12:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2328F1F9A80;
	Wed,  8 Jan 2025 12:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ejmp3rcB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA571F9410
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 12:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736337772; cv=none; b=ER61u/PGknjjkYwXDvartHGsqMhGPj2rKNeWxp0j1qk/ghHEOEqPEhKFrQb/wYGXGptey+DS5EeQ+6fewNfXrNQt5IX+nJBC49MO6YkIrE47PWZzlECouQ+1Q7t/u+8J9iNoThFHwMvJBU+iU6e5A5z1ZqBKAVCA0hxef2BSUQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736337772; c=relaxed/simple;
	bh=tf5tt0BwsPCPSLPP0H73t4FU8k2JMKXfyoSUw91MxX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n7d4MnV52VPB1/EmXEWTYqbo87fr5CiiZDPnoQUPG/W87Ury9pUln/Kj0ZO2hUHCxRGWYFGH/u/h4KBldTOtFT2r64rHNj5BkRndeKg+NF2Kf8xKX3X2WeWIT2QbV2lfNYoYwPw7mzxPTC6UPKyzDnMVdDOgTDvWTa5GdeFIoL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ejmp3rcB; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3d69e5b63so2731627a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 04:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736337769; x=1736942569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Fu/J7aLcA/6JcanW9gRS4vVtHfaRVS9VuYzk8LT6DQ=;
        b=Ejmp3rcB4sCcsaFIErGIy30v0gbfdg3YxxgCHl6gffuTfFBm3rxIlm35HB10ulskyb
         MhFR5xklpiy57oMFQycrDIZ9vixzQrobKlwKHg9g4Nwmpj+VXfBMLAsH0r98IPJ+/DrR
         iYKEvcGWl1v6voFrNqi/ZzrIH5UNp3/ZKAifhUgMaQWhyjkdQXRAoTIH1WxS89EUfh3/
         8ln9MWgRnnhzg9ZLds11otGsSUnHs4Tcv8sphVLn+23Qo4QytBlEvPoNvQHS+jd5iZrx
         UzmXVmylkdCfYqhVTnbHb9VY50hH7XY3DIOrOzu1OrXav89LJpkc9/kHFhsoR9Ajn5X0
         ZhGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736337769; x=1736942569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Fu/J7aLcA/6JcanW9gRS4vVtHfaRVS9VuYzk8LT6DQ=;
        b=W+Q2dtz1gICdvGS+FQhhFKXD1hSN4feS0zDfR4ZJIs8MStMy8KrEbcJOpSgtDcu72+
         a3yLcjRfaAVc+Lq7C4eGeDAwbpmzK/OIyJN+hvqu04GkxjrzLEEcC6+yaANUogaa92T/
         L7V3ZgCylMEO/IY8P44nuhGBpaAIivA7raJvOVjSc08zVy/K3G/SM8W8qB62L6ACbPXz
         e+09/9q/Nt5K0zCriU1yxbCV1xbrOm0sZVT3FoTDJxLVjUDZI3wnDOe4x3HBUOK1Y8Kk
         HZYum7X76vHt70yXAKNi4zMDzKITQy9pAeCJZ0znv8q7e7Lcougsl/q/DTbp9RjhWUD6
         uPbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXKcO0Iexc5HhFSlF5NiDzMcAoAKMgSBQuAyxlii4kXeJYsq+k3BVGiruqwmj7WFMwBg3ZQJBwME7J84rs@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjw3JGOwPhdibx7BPCWhVcC8b4M/1kDzv6MxUPTRymJABmYGJ9
	wMYHXAx06i3rEKCOdw03kII8QuLKCHqUWiIrMEGoTOTUMtOiX5ZvP9aM2KbcvH4=
X-Gm-Gg: ASbGncsMzbHVG/jswTnzr8NnGAK0RKBPiBP6DneIXCs4Qzt87xvXiNrTbghlMCqfcfS
	y4V1lhjYSp9kv+Ot+7DV3n7WD7VHBcnidtH5rYMvhqoqvOtU3/n9CY8FdI3mY7tsEntJIvIedz8
	x9UFYIsTxSEYqDauYtyH0cOiSSnytq1Km7TD6SYWB2OO10MWniU85l7Y2ahrj3eniEtU6AMlUcy
	BNKC7YhzBMe9fLW4fAN5mHAo2ahEEX41YheMATsRFaWBEkNCizX7emFbkFnvgPlJdRqWDk=
X-Google-Smtp-Source: AGHT+IHxvLCzAIC3B4tsUuo5mheGbuKfSphHrdU5pFDT/pfFnaWpUoIrvtESSJfsRkrVx8FBwhrfkQ==
X-Received: by 2002:a05:6402:2687:b0:5d3:ba42:e9f8 with SMTP id 4fb4d7f45d1cf-5d972e47d23mr814405a12.7.1736337768837;
        Wed, 08 Jan 2025 04:02:48 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80675ab3bsm25281427a12.5.2025.01.08.04.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:02:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alex Elder <elder@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH net-next] dt-bindings: net: qcom,ipa: Use recommended MBN firmware format in DTS example
Date: Wed,  8 Jan 2025 13:02:42 +0100
Message-ID: <20250108120242.156201-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All Qualcomm firmwares uploaded to linux-firmware are in MBN format,
instead of split MDT.  No functional changes, just correct the DTS
example so people will not rely on unaccepted files.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/net/qcom,ipa.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index 53cae71d9957..1a46d80a66e8 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -239,7 +239,7 @@ examples:
 
                 qcom,gsi-loader = "self";
                 memory-region = <&ipa_fw_mem>;
-                firmware-name = "qcom/sc7180-trogdor/modem/modem.mdt";
+                firmware-name = "qcom/sc7180-trogdor/modem/modem.mbn";
 
                 iommus = <&apps_smmu 0x440 0x0>,
                          <&apps_smmu 0x442 0x0>;
-- 
2.43.0


