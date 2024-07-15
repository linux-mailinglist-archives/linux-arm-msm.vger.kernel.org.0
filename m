Return-Path: <linux-arm-msm+bounces-26155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 051879313D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 14:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B41582819E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 12:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B64F918A955;
	Mon, 15 Jul 2024 12:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wgAYISVh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E811836CD
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 12:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721045768; cv=none; b=AsUO3wXWrvrCJn3CFeq3/WhiqbnlFdyJ0c71aZ3QUDodKwYvkacycBY+jr46Xzxos2z65OdLupPsqjMlUX1MvMf7v5EMrkUa5D+YSzsF2JAVt5+u55i2nE5QnWEfk0Qi5c2ItyVif6xWRSKNXjSCrZXJDPE/hK6rQhDCWUnsmsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721045768; c=relaxed/simple;
	bh=J7WGTQBpJaNKFTWx2R562yv5x7E3DH7etc/yD3RZjww=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iU+4gJg6BuFgG8mwD5kgH6H0NAoNYaauqnsxMVlWi1HdiP30UsZkBm9XKhqsAE+qwAVyQvMfQMyvztXA9o/k5JS6w/JSKWbKTQdqs3kQ6OFzmpO42h/5udzjA2khw5/f6AYxvTeoiV8ff+OmlIN6OfMGsecIZy9gslpSMirZAa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wgAYISVh; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4267300145eso32505815e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 05:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721045765; x=1721650565; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Vr1Igs6Grx1TdlXBKwpA/hLnY4uL3rKsZy+M8J+TL0=;
        b=wgAYISVhtJwLP0d1jvz7QW3lm4WyTU56qP7PqeGeZGbIC7FqBXm+uUsI7dJkWwbWvm
         q0xhFa0+vhLwV1OcWtrb0sHBZ3oyHWVedJ8npXhqmgSZ1ER/C5+yI4V7/nunjzdosx8B
         N3n8PFtjIL9mu1Rom4pGj0sRJEUNW4XnCl7JrehzWKS8WGtlvQphw7UnIyDvy87TQP8/
         k2Lyi3hcEy1ZJG2KYzpHVhbFvMk8ryBBj9sQ0Ae8Hn7Q8dl45dWWgjPWqPifDAqkpF8o
         he/5bglctrNSXVW+G6vWh+n1UqcAM19rIzdTEXsHUqOU+PXIrDLlj3fUwxmfTcL2gwDK
         xmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721045765; x=1721650565;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Vr1Igs6Grx1TdlXBKwpA/hLnY4uL3rKsZy+M8J+TL0=;
        b=dF+jWZ34HaPc/kLYNC4ALTiPIVpRQB2L0MxifkM4fwQox3CwEBACTsLwOtFZFJzwct
         IYlz3K5LrhKzwNRfPtla/tuGhTNNNyn3iiFg0tvKG0qEVlM6IIjYUEuFAAwKO0TbmkkB
         ADdf+LDVf/Lcf0Mtz3QTvUjFbzIvebfVGzCNR16QuLAhC0lDcRaamPUbBY7Wf9FqlhJe
         6fy3J4objuXvWXsm933Bi0bqVSG1pclLk1OGUz9Su4t4vJbN8UAz90sG/49+B/CAPo3p
         7mqvAda1hyRXu1pXcnhzid2r5JkAejQHM8rTdOsjAXdc5VBsNvtvIWHNPKs7tzXAzw5/
         t3wA==
X-Forwarded-Encrypted: i=1; AJvYcCXC4yXqQqjSpMcrH/g/Xdd3ICQhjHLbie2LmO/LY/J2MW8I86om9zgRNfLKe5PwiMl4dJGejo34ZXHCczJ6UCGcceWjZCOf4SMu2LEYow==
X-Gm-Message-State: AOJu0YwfvFsjAIJv1gShHJTCnqTai8ogw7oogho5QWeiR1DBvY+Qk7Cc
	yPL3fcPzB25mDRy/WXAUBZXbyrcrXL2mAwaafQjL+hQn1tGEg7HhVZhrXrtRD8k=
X-Google-Smtp-Source: AGHT+IF1eIglBUYPcY54eeaj425QXF1pkXmSnnMaa3Z7nS7TIbwkFjDf7kr7CW/lZQwMQMB2loSrag==
X-Received: by 2002:a7b:c052:0:b0:426:5c81:2538 with SMTP id 5b1f17b1804b1-426707cf827mr140078155e9.14.1721045765216;
        Mon, 15 Jul 2024 05:16:05 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff1f:b240:886b:1a3a:7569:3d95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680d9771aasm6369201f8f.0.2024.07.15.05.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 05:16:04 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH v2 0/4] drm/panel: atna33xc20: Fix the Samsung ATNA45AF01
 panel
Date: Mon, 15 Jul 2024 14:15:36 +0200
Message-Id: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOgSlWYC/4WNQQ6CMBBFr2K6tmZmSlBceQ/DosAUJhJqpoRgC
 He3cgGX7yX//c0kVuFk7qfNKC+SJE4Z6Hwy7eCnnq10mQ0BFXBFsCvyDRDAttrZxrevUfphtqW
 jUDWhciUHk8dv5SDrEX7WmQdJc9TP8bPgz/5NLmjBckMFOURPjh+jTF7jJWpv6n3fvzY3h9C9A
 AAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.13.0

The backlight of the Samsung ATNA45AF01 panel used in the Qualcomm X1E80100
CRD does not work correctly with the current display panel configuration
and drivers: It works after boot, but once the display gets disabled it is
not possible to get it back on. It turns out that the ATNA45AF01 panel
needs exactly the same non-standard power sequence as implemented for
ATNA33XC20 in the panel-samsung-atna33xc20 driver.

Move the ATNA45AF01 panel from the generic panel-edp driver to the
panel-samsung-atna33xc20 driver and fix the panel configuration in the
x1e80100-crd device tree to make the panel work correctly.

The panel and DT changes can be picked up independently. Since v2 uses the
existing "samsung,atna33xc20" compatible as fallback, the DT changes work
even without the driver changes.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Changes in v2:
- Use fallback compatible to avoid changes in driver (Doug)
- ... this allows applying the DT change as fix, so add Fixes: tag there
- Add review tags (except Krzysztof's, since the binding changed quite a bit)
- Link to v1: https://lore.kernel.org/r/20240710-x1e80100-crd-backlight-v1-0-eb242311a23e@linaro.org

---
Stephan Gerhold (4):
      dt-bindings: display: panel: samsung,atna33xc20: Document ATNA45AF01
      Revert "drm/panel-edp: Add SDC ATNA45AF01"
      arm64: dts: qcom: x1e80100-crd: Fix backlight
      arm64: defconfig: Add CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20

 .../bindings/display/panel/samsung,atna33xc20.yaml      |  8 +++++++-
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts               | 17 +++++++++++++++--
 arch/arm64/configs/defconfig                            |  1 +
 drivers/gpu/drm/panel/panel-edp.c                       |  2 --
 4 files changed, 23 insertions(+), 5 deletions(-)
---
base-commit: 91e3b24eb7d297d9d99030800ed96944b8652eaf
change-id: 20240710-x1e80100-crd-backlight-632f9bf936ef

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


