Return-Path: <linux-arm-msm+bounces-27401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D6D940FEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 12:50:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1F0BB2C5DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 10:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C458F1A071E;
	Tue, 30 Jul 2024 10:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WT8RJLWt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2C019922A
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 10:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722335722; cv=none; b=X9ZoB88yrTOkk7EXNqjcon3CWBH+Ubsixb5EkS5umlmAIZ+Yn6Il4uEecJpWgq5Iob1h1gsmc9ZIuhdDAJUzuqdm7frvTNYGt+KaG7qnNuVc3l5ZaqFFEkrBKZWvNbS7E8z7asgSGMPicjOS3X8HBWZMakpF3HVaY2GVfaSh+d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722335722; c=relaxed/simple;
	bh=b75YOHBxm2lQYDbG5iuWV5yJhvgfQruxGNEGB+zBnrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p94UlVwQaspO/5PL6DLyh7mLIX+srabAcGan8EbxbwiGN7uXAUlzs++XhDi/fdyPanQSONUSJuFID6Xg1AK0QuOly0uO6apCgkPP7eKjvMgk24I4ORlbLjk6n6OQ4uZ6uNx9ONqeq2PEOwsy3Q+qtmXibYEKqbiIvT+SiUdOPN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WT8RJLWt; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3684407b2deso2036369f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 03:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722335718; x=1722940518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2k7WfqvNrE7q/baTECjG6uCgYMUMqGAXr8zev5hDQtc=;
        b=WT8RJLWtCu7YKXagIOYx7OpehU+d9157smwQf4ZrarAgu7syI5XKl72z9BAx8LbE7n
         w9pLqpiWoD2/HdS7AQkZBXllPCM1VUHWSBn+RViLn658BH7NUxzR5Gi49jM6EFecYGE4
         5Ztw/MIcfJuOMBgY9BA5e0Aa+O5gwsVfQiNSnMdv9scgEg6aVFkdWH1h/vRsIZdtDRy5
         +Zx6dCzDKFZ3ctr2cnesqPzxvl4TiJ5SJKSMlsJ7ou58LA0BHbiw8EDJTkhxK8AsE2Pr
         rJRzABsdCTBpNasXEyNqI+BD4/FaT1RL9OzbvIltKO3DPe6sRr3Njuds1kk1tpGHpDh6
         u12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722335718; x=1722940518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2k7WfqvNrE7q/baTECjG6uCgYMUMqGAXr8zev5hDQtc=;
        b=iXx/xtilVH2BYjDPEWOM2xPsBFwM/Gz007s16lAc9TIrJrFWR/s2Yxa1hQDmZYY/ln
         QAqScigNr6J7Dtlb/c+ri+uD4cDkHmZ1At32toD+HH0q0FfPwHnA8UMHmZOobsiE+NvL
         L/TM2s2BkUTOG+qoodNt52yabGTC34Zdyoptv178m5ZRgAdOlBqEHk1gUCnVZwd44EPC
         KkDdCZDHEBiuYatG80rLAPNX8nPD00rlo50aoGnPEd/uelAeCNXgIROk6ArLt5CTSccs
         jWiYKL2mgE2aIq+rMxzwjeDh+ppZVFb5YZWV4PTdJPBziRM2ZdokTbLQFWaIbAebhmKC
         pAzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY6HlRfH58QA+lRgasqE9sxV9MFfJWE99u1LdtB4x9T+9vfYRr34s7UOm2qUCZdPFKpk52fXo40gd0EEpDxrlAYFgxchd/BgLVrxs19A==
X-Gm-Message-State: AOJu0Yy3WU+mk9YNNYalfqjcFPnNMeI2taFWg0F/rPeaGhGH5voZL9bO
	bphWQ0bfr2tBFEZDIrz83GsCdjJO5CSiuWa8zoI5cuTzhfG+wy8GQfLsEvPJVm0=
X-Google-Smtp-Source: AGHT+IE9D+3MsMR02xuAhjzlxgXskiGjsFnlnKtGunsAe9F0MUMFrjLgF7vKlnZ2xqmjqZZBdUI2XA==
X-Received: by 2002:a5d:560d:0:b0:369:5d7d:ee96 with SMTP id ffacd0b85a97d-36b5ceee0dfmr7519309f8f.27.1722335717783;
        Tue, 30 Jul 2024 03:35:17 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36863d87sm14284048f8f.110.2024.07.30.03.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 03:35:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: MAINTAINERS: Drop Banajit Goswami from Qualcomm sound drivers
Date: Tue, 30 Jul 2024 12:35:11 +0200
Message-ID: <20240730103511.21728-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There was no active maintenance from Banajit Goswami - last email is
from 2019 - so make obvious that Qualcomm sound drivers are maintained
by only one person.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not moving to credits because lore does not point to significant
contributions. Just ~140 emails:
https://lore.kernel.org/all/?q=f%3A%22Banajit+Goswami%22
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c8e16a649a0e..43e7668aacb0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18419,7 +18419,6 @@ F:	drivers/crypto/intel/qat/
 
 QCOM AUDIO (ASoC) DRIVERS
 M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
-M:	Banajit Goswami <bgoswami@quicinc.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 L:	linux-arm-msm@vger.kernel.org
 S:	Supported
-- 
2.43.0


