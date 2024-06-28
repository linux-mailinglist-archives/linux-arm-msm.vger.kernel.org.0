Return-Path: <linux-arm-msm+bounces-24615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6A091BC6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 12:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96390B2390A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 10:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B80158201;
	Fri, 28 Jun 2024 10:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BSrs1qSG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F357F15623A
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 10:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719569500; cv=none; b=ZAQCG5VqE56VziAYRPIlFkbH03RBATPx1V6piBnT9H/gvXUWHbOGOGsXz5a5FRI7ry5D+1Kbtry4Z8NX4RNDI0KCv3R47Wk1Kr1DB6JHkY2gyQzKVgYT27Hntnv34PUSsdBH19NZckMx6Ix3uDQmb4ffTZ4y7vN9/WgMERkteXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719569500; c=relaxed/simple;
	bh=fhQZZ4QjPKXRqv6gWUJ77jDFeIWxAGyZqof8ycl13AE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rMTFuYZRAoEbUzedcLu75annEfVtcy9CSHI6ru1RRWOdaKl7i4zIt6ix/AwudV7d6kNiMwtFzSwqylfzdcfu5uhd9unrDZHx1atJD6EGZQpXgNRoHShYEA2Q/8ayB2EsPaSmuCgs+YMaii6TCD/5QxPT6CHPo97ZJrLhXWkiZOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BSrs1qSG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-425680b1d3aso2921835e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 03:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719569496; x=1720174296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+rpmUsm4rhHiHlN8KJCEkTWbouDx20N7nNq4S2dVmc=;
        b=BSrs1qSGhfHibYqnC3sxWSAqJ8oJezNrPkysXT3KndW288UYMt7z+Gio4jeNDpDJmT
         nn//If9WgZ0O9Znd2tEnFgUNE05rjViH8ctrjUkltEb3ErRH8RkERtHUX/a9xGbutMxz
         a5xHperN2rxaW+5HHlCHFB1gKySTnnJj/hk4j6mJt9jMUrvBKaX3WH5dIXn/5V3zWZ/g
         gIxdVujUquJX6o2PVmrJLLrQK/KDYowzGkRBJ8K09iofi76oF/Uh3uURBGjK0dRoYAxD
         a7/50B/695PnSIZkCYMmrbhZbc4e4qz3Oxl9d9I2MD7suA/wlQ0YzLAWR9IFHiZ5KlMJ
         61Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719569496; x=1720174296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+rpmUsm4rhHiHlN8KJCEkTWbouDx20N7nNq4S2dVmc=;
        b=AkrmuYbEB5uRusC/31844KNvJmyT9CXhCKHDHHgX5KVlx/g1rEMQxt/xRN4CNoTaB7
         gcvbpuN2YChoGfbSZ/gJHh+sg9gXksw1qyKLwb2Z1vSAKF1kzyUdHqoTyHr5TThyjURf
         MZUoNnjmC+0FCXZP7tzzlYDBjPz/Q8RCe8xLGpPnHMhhwPu+FHslQvTdEH218NX7aelo
         6wmgwKYenYxqX+uQHimd0UxUfjGPXR+ujPAt1LlTihJsoFYNOPxA6G8gFDPF8kxOYLJ6
         GyEcvWZ+zR/XymLwCqD9c07sb5wfMBVmiO/XtpHUmEmbzKv9/3W/H6RxGiexySezusXL
         fPUg==
X-Forwarded-Encrypted: i=1; AJvYcCWjzd7mU77DEdRMw7kfo7mAThq/Zavd8QbNvRpUb32kfZQ9NKSgmqKPZgN7Hnd3h1XdtVd/TW6RT+smE5vKrDF2I/eJ/n2GcerXV9+F6Q==
X-Gm-Message-State: AOJu0Ywk9ndj40xxHA+zG8uBay6BQKryQUQty2uj55ZpPxRaUMXSm1kL
	Lf9g2RBtnjD5AURGIO3Ni9Nhm2UxZtraVgE0EtilmRb7KXcP3fLrv1qWhDehTG4=
X-Google-Smtp-Source: AGHT+IHonegirDh7c82kEa3PisDCySFJqp+wAI8RX/TRs3710R34yTI3kBy+elemSn3wKoSxmIZJLg==
X-Received: by 2002:a05:600c:1c1f:b0:424:8e3a:d02e with SMTP id 5b1f17b1804b1-4248e3ad244mr124740405e9.3.1719569496469;
        Fri, 28 Jun 2024 03:11:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b0c15f8sm27024605e9.47.2024.06.28.03.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 03:11:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 28 Jun 2024 12:10:58 +0200
Subject: [PATCH v2 4/5] ASoC: codecs: lpass-rx-macro: Use unsigned for
 number of widgets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-b4-qcom-audio-lpass-codec-cleanups-v2-4-e9741143e485@linaro.org>
References: <20240628-b4-qcom-audio-lpass-codec-cleanups-v2-0-e9741143e485@linaro.org>
In-Reply-To: <20240628-b4-qcom-audio-lpass-codec-cleanups-v2-0-e9741143e485@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1007;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=fhQZZ4QjPKXRqv6gWUJ77jDFeIWxAGyZqof8ycl13AE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmfoxAtvV6h0PC01XQmUzFGtHvD3AQF3zcnGj8C
 taRAiVUTmqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZn6MQAAKCRDBN2bmhouD
 1yTzD/45YqEc5uhFbMbSBNNU9dkOk2qQUblj+TJdVS1CIW3tMXjwpvGfZ2EgMouWgTcz2afrM4m
 ojDfVCYKekEAXfsmxJmXxB8j/7tSP3/X8N0w8t00Li1mZvz7owRSVfzuBNwOVL2q84aUHsuiRMo
 rS2OokjwAkyBMisqCTsIL+zeHodH8fP89yW8pO5qs4tE6cHuQKLAevWWlUNo/IhYECP11wt91AB
 oTgWswftId8J9ODsqHdEexwnEbdAxMazerRzqnG+D7ysICFPoYgaKxJh0UTCdGnL9H88K/cVP0b
 aK0B5Nb5UyzPkt8u6vkzT/i4HHggRVcrf/k+TRMZo4r2Kz1omfz3DdRDHWzXJT2WRlqg+aBKG1o
 2uDRekyO+GCnC1YSedO1NvDjlT0aakVvWscVK/nxtiNXNixDD6ASS8YANb/LqIqQE1fSca8OSvE
 rZGcD/+vE7efrAG/TClGGgax/qKYyOLgD6OkzYMDHi2mY2gNu7bEQ8XQYBVO7B7kM4fBA1j/sU8
 orjdW8G858pBkCMdi7gOCUBvCrbOAQTXKdw0raRamLxk7IWq0FWjdyU35ceP4cWslU+eKUkPXKA
 kfv3h9M3DyeKRw2YWYZbRkV83sCteLle+5kRMh6IsHmnBV9PZIfgsxuXtFlMSieb2JyV9rmJSCq
 MBGNjmdoo4g2Xmg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver uses ARRAY_SIZE() to get number of widgets later passed to
snd_soc_dapm_new_controls(), which is an 'unsigned int'.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 1d2dce1f600c..c101d0b8995a 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3612,8 +3612,8 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 	const struct snd_soc_dapm_widget *widgets;
 	const struct snd_kcontrol_new *controls;
-	unsigned int num_controls;
-	int ret, num_widgets;
+	unsigned int num_controls, num_widgets;
+	int ret;
 
 	snd_soc_component_init_regmap(component, rx->regmap);
 

-- 
2.43.0


