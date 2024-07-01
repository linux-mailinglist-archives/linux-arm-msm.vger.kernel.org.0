Return-Path: <linux-arm-msm+bounces-24817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C279691E675
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 19:19:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 021E01C22823
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 17:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E977716EB7B;
	Mon,  1 Jul 2024 17:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iUpFkhh/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A26F16E865
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jul 2024 17:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719854365; cv=none; b=c0bRJ02p54PeER4HeIjlSxEwi7b+ozjbvxnTncId6f+5Qyq7ZxQk1pYWYdTXROmqHFSxm7xdFCqg74Oblayyy8qkA8AtoENWjy1AcnULqutQompizB4VRXGlUlRQhkSKcKis7sx+Oi+HqvjhtNAsdrN8UPDmyYAHMgG+20XkVDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719854365; c=relaxed/simple;
	bh=P21qd1OkbuiMrCjx3m8pH2sGiiMR71WkUYVgzpHXae8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VkuQzFNSPWO3AcJjdIuYbJ1EvBk/EMqUkiPet62Noyg2doWnYx5raCdilLheSN/n+fSfgpYzmlx56Lu77gvJUsblvVJSYsq6IqvjHJskuuKYSLHSi4Wf1w8lZE0oKy4dKNQOvGx5yMdZQquNghiIgxGqwNN3wbDZzKKg8Krbx/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iUpFkhh/; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52cd87277d8so3318870e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2024 10:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719854362; x=1720459162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqja86UDKTFIc+qc3NF0+FAZFhHDXQ4XzxpjOTJHZXE=;
        b=iUpFkhh/nSsOntn7LxJqxDqyniQjpbI6xZnHvMEP4jNzHazxAOJulCN9XGGoc2Kzgi
         7WWFDXupEr1tHXxLC7DhaNvVD79LkoJz/S0fKks/CZ7n13W5DieE4vVjkvcvTdyfp/K8
         DlqymiXUa4dJLZcAueyjs/iUdXUq+qypotFz8r2JR/GMO6yVoPRNiEZz3use97cLiWz8
         IDs9olCcy9m8uukiqQ1BTs456ONhXIwBkSTbft09sBCiEY/WZbOrr96O5U1Et0AKNHAz
         EK68FUvsgsC3RILJkAnb5Vsj+OVGM26wAgCwo+matXqBLxhkQENtscLRbRkbgsSAcY5q
         w6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719854362; x=1720459162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqja86UDKTFIc+qc3NF0+FAZFhHDXQ4XzxpjOTJHZXE=;
        b=e/EINScDgghlCtf+5XTKkebExnhxloAXVpgKJZCHUyZD/9ZpigpBre0SVur9rc8VIx
         3aNQ6ksSEFMzUUkPu15qpyvRcZtYVZU/yI6B0miwwPklgMuB6OGCejhkuvEb2C33eHF3
         A9oxHG3hl61BpIkDadSkiiz9yrOpzBHhjJlYJJ6srbiKZ/fZU7cr0Ze4+VDPRM/XQhob
         z0jIJk6txUB799zsGmMDwV1ddiY7FmDhxbDwoV45Srn/FX7GREMKoedscidZf7P+r2R1
         QlJb8kowAKw9EsJgiVWlYWmjyw85jIzYmhFFnZ5roltxOY8p4b65LbjaxW5LplISJX3B
         qntw==
X-Forwarded-Encrypted: i=1; AJvYcCU6/cVbSAt4mKFUcp6cVKhDcs0Lk/zKu+l0LCCViOoe+X/4jLG2iHq2VuLMEIXwGBgutlP0HKCwhRYlXBqk9gIxK2CQo6ID6gU1yBrrJA==
X-Gm-Message-State: AOJu0Yz85GBV6KQEpL5bE7Jmpo2WxGVTzyKUqF8dWZAcBXnSGIlztF6V
	j5rjYu6VKJZmYZIAtV4dq2FQwQxkM9JrZPer2YRkr6HVfD5JpV04oY6dxG6n+1c=
X-Google-Smtp-Source: AGHT+IEpcOPlfAXhpzDXXuXPLW36uadem/IXz8BjMrFDaiR4x1PqQz5+4iXhrAFqE4LAPZjFn+z0sg==
X-Received: by 2002:a05:6512:1599:b0:52c:dc69:28f3 with SMTP id 2adb3069b0e04-52e8270fa7dmr4370670e87.52.1719854362487;
        Mon, 01 Jul 2024 10:19:22 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a112e19sm10581137f8f.116.2024.07.01.10.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 10:19:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ASoC: qcom: topology: Simplify with cleanup.h
Date: Mon,  1 Jul 2024 19:19:17 +0200
Message-ID: <20240701171917.596173-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240701171917.596173-1-krzysztof.kozlowski@linaro.org>
References: <20240701171917.596173-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allocate memory, which is being freed at end of the scope, with
scoped/cleanup.h to reduce number of error paths and make code a bit
simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/topology.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index f4d62ea60baa..83319a928f29 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2020, Linaro Limited
 
+#include <linux/cleanup.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/pcm.h>
@@ -1288,18 +1289,19 @@ int audioreach_tplg_init(struct snd_soc_component *component)
 	struct snd_soc_card *card = component->card;
 	struct device *dev = component->dev;
 	const struct firmware *fw;
-	char *tplg_fw_name;
 	int ret;
 
 	/* Inline with Qualcomm UCM configs and linux-firmware path */
-	tplg_fw_name = kasprintf(GFP_KERNEL, "qcom/%s/%s-tplg.bin", card->driver_name, card->name);
+	char *tplg_fw_name __free(kfree) = kasprintf(GFP_KERNEL, "qcom/%s/%s-tplg.bin",
+						     card->driver_name,
+						     card->name);
 	if (!tplg_fw_name)
 		return -ENOMEM;
 
 	ret = request_firmware(&fw, tplg_fw_name, dev);
 	if (ret < 0) {
 		dev_err(dev, "tplg firmware loading %s failed %d\n", tplg_fw_name, ret);
-		goto err;
+		return ret;
 	}
 
 	ret = snd_soc_tplg_component_load(component, &audioreach_tplg_ops, fw);
@@ -1309,8 +1311,6 @@ int audioreach_tplg_init(struct snd_soc_component *component)
 	}
 
 	release_firmware(fw);
-err:
-	kfree(tplg_fw_name);
 
 	return ret;
 }
-- 
2.43.0


