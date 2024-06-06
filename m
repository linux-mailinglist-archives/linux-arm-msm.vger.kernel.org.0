Return-Path: <linux-arm-msm+bounces-21920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5732D8FE70C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 15:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3F481F260DC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 13:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165B7195F04;
	Thu,  6 Jun 2024 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mg3dRO4F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5044C195B38
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 13:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717679053; cv=none; b=rF2CqVVPZRhUGnqGKu/WkV5f5QqqFFhugwTNx3vlqFfaGOSvgYeUcYB6+gWVAMfGwwTPLsOEzDmVK2eIC8bU9xaa+SfxymdsTZtdgqoZ37/DjCY0vR9qdr01XiBRv6KzJ5MK/IzVJUUWfmY3L+rWr/Y7ANbbwK6Q3GqeRQ4tCBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717679053; c=relaxed/simple;
	bh=vzrrnrsPs++w+wuxgBiG4lQEuVgC7hadEd1CorTRM5g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o/+GoIPDxRkzG9vxNuUrN5G5r3FHLe29RJdXGXW6DaiSu8GjdzBu6bzAAxGBVXwIH+VjOlzQH8vQTwgtCNQDynWnY2mdF1MGSTldgXmXGtzNxHN4pfVZT8xRdwYqyhzEO/H4c+fUYZJmY8r7Y7olXGK+5psABXnjIki6eWusJDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mg3dRO4F; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52b87e8ba1eso1397465e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 06:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717679049; x=1718283849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AKOctS8wR+JRhxMzTY3nM1CjlScan5iuXQc5lzoQeM0=;
        b=Mg3dRO4FPQluNULhn0l8oeSoEw5r2xCbD254BzRv5u4Zhym5HtUkYfT0pCEa/DyazP
         enTpm1lMBUtKiOeQo40sb/+1eBwRl+JxrBjjdcJPznOwmce1tvTGtOUg74A+NTSdXSD7
         r6ficCVtQZNaaXd9WWGHeOKVpi1BQ2igSerCaMYGZGfgKDKcyWpryXUNIl9TKC2dK0Mr
         vr7FS6GkLfz3I/5qJclX4UouD3kP0LtEZa907lx7xe2gB3RCrtGWW03WjQFdHidRjlWz
         MOkQJ17AgZfzeN8vqnWkaaL83mXQQ8jAG3mR+fnH1pweeTez30UKSROj+d5feHwmamcF
         aPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717679049; x=1718283849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKOctS8wR+JRhxMzTY3nM1CjlScan5iuXQc5lzoQeM0=;
        b=fll6EcwHj4ijF1eek5Zku3WmV4cbWWPSUD9SabDnWgR7FkOdojW/U+UBSKw1QBgGrS
         K28SqWUw3uSn4s7AVBaJ9xV/WGdp9nL/joMSIVhtm5iB3GKlcKTYdBQG5Eku5Uz/xpjv
         BtWZ/HSouLsUL7qkGzWdB7uDoWYV8s5/LWdHpB0sWiJs1G/vPUtAb4ZLuWOO3sDUYroK
         1QQoOVvIHKZziUvvC5P3DmACGVRwPjmkW5jvKwJi5+pxdEpTctTHKLH7Fd1tFf75oAeG
         0jhGVPLXPh2dRdi76B812mwFyrB6eqmxr5y8aQnMdq3KI0O8ttkIIS7jWyq5I/O6bMWu
         SygQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrSVh8+aTi1A5DU4QPhzJgezI7L7XLkvdA4gP1T4isEHoPEJ7goSH0GoFxAzQdv9cfFbE75BxFPAhUWT+pALu9UUv9lZKSuVLgQJ+ZSw==
X-Gm-Message-State: AOJu0Yx7MsBNVbYzGh4GuSu1hoZUxnXbi5h9w304iFqkteDD5wlFDnhw
	QtaYuEdOGkmR2MTbQK1O7ClxPN8OdSdnqsPrvuQJQukHBb0nB7M4xWaRJVbwDXE=
X-Google-Smtp-Source: AGHT+IHAkM82zSzTg7E23bIybOGdXK2SBfH/dbKc5oL32jns+PWFQHQwA/GQ3GcMHsqZEYS5Y1oAow==
X-Received: by 2002:a05:6512:3b8b:b0:529:46e:b2a5 with SMTP id 2adb3069b0e04-52bab4ce9d6mr5269249e87.2.1717679049193;
        Thu, 06 Jun 2024 06:04:09 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d49dfcsm1505286f8f.39.2024.06.06.06.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 06:04:08 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: andersson@kernel.org,
	linus.walleij@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	srinivas.kandagatla@linaro.org,
	linux-arm-msm@vger.kernel.org,
	inux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] pinctrl: qcom: add sm4250 lpi pinctrl
Date: Thu,  6 Jun 2024 14:03:21 +0100
Message-Id: <20240606130323.138970-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Add support for sm4250 lpi pinctrl.

Alexey tested this on RB2 with HDMI Audio.

Srinivas Kandagatla (2):
  dt-bindings: pinctrl: qcom: Add SM4250 pinctrl
  pinctrl: qcom: Introduce SM4250 LPI pinctrl driver

 .../qcom,sm4250-lpass-lpi-pinctrl.yaml        | 119 +++++++++++
 drivers/pinctrl/qcom/Kconfig                  |   9 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 .../pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   | 191 ++++++++++++++++++
 4 files changed, 320 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm4250-lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c

-- 
2.25.1


