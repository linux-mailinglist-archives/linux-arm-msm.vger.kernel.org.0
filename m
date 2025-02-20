Return-Path: <linux-arm-msm+bounces-48738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C475AA3E0D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 17:34:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7277703A14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 16:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84239213237;
	Thu, 20 Feb 2025 16:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n5mN0vFR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFF6212B02
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 16:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740068970; cv=none; b=J2tkBWKxD4QEhuqyF37+UWhH0oBuGeZwaxV3qzyzgwFEmiIY1MqpmJ7LbKA9o+Lo8dtW0eAvZuhT97dGTLzKzqXK/OvpjzkLYrdT2k7aIVBzx+oy9Najw2KuLF2hciQkoBsKJPR9oJsMwSym0Dd70MA392a5IU9pttSo3xJ3zCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740068970; c=relaxed/simple;
	bh=/VfHNWugQzZOouS7hKpPuUUlotDhboVqpoBQsz75KJI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Air8OE04yyt9uJeBeH2akCfN75qYSKFFa5xmB8rppLmXBGWFRxSwuFGsif10t8POl8QCYN7OD6ZG1g2gpsrNaM6sRHeKwkDvq6e8kV2lWdwesw7bXq7YD6AF3IpOFXC5ElGuQ7aV/PNDh7CEhl47PuteVqN8zW0xFhbSLAypOrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n5mN0vFR; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38f325ddbc2so826418f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 08:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740068967; x=1740673767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNs8W2h+NxjkcVzoJNbEyvvCSIIo8azfvztr8o7DSmU=;
        b=n5mN0vFR1IPe65oQy+wbhA8osJ7mkeTeTJNjdDqudAuPm0weqIAeqMdiHBajOO5MVw
         BkJjvqaJeoDf7/zHNNLBzavmWK0x/uk+aB7vvoFr/TFssJLg0eYd6I4aRD9SO5xGmrKy
         LAumR0Q9NgNst1iJckuJLQj2jG1ckbcn7IyXXQG1ZBbujCN3g8er2BcHJog7tXAjI5tq
         c0Do7BFknFGODU2dp6+ObO8PE0HFD1xeJHQEA+lj/HNZJW2TkcILX6voJkE+nIOY5wxo
         wvzma5b4pTErJhKIAIRTo9NqZ368DWp67wCQL9/C9PhNLoQ3xmu5wMa2DY8Qbn5rq2Ap
         c63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740068967; x=1740673767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNs8W2h+NxjkcVzoJNbEyvvCSIIo8azfvztr8o7DSmU=;
        b=I7EOArpsfysV1j81IUgYQMAdRY6L6Cd9zlO/cRzgWkeemlPZt7GKLrwR4PMHNOQBGT
         38eB/nqLelnNbA5Jcikm/xi6cMFK/obFnuthttI6aVCltVxwrsk8FKJkrBXlqzhsVbf7
         Hv3t9ToqRcgopKPAIvgW0jNDWqli9him+em1tQXzlvkYdFxKRhR9ES7lljMecFFGnC7a
         9+x1MA3MEVRMWRePvIO8bdILly9cu3mAsmiP/1JSQfcJ6quLIujSC1T5PHL+Gf+IOZEV
         Ojgwv/e0uJZZ+lGB8pR0vlxdcYYI3gNUAyWkn/IUv+HFstXEXtTK8ioK+JUW6R/53m4Y
         rscw==
X-Forwarded-Encrypted: i=1; AJvYcCXPFBfu7JulLG7Z/iSj/9vgOCQYmbl/Rd9OyKdwsSNc40Guh992Sg10qPJiVR18cMKKDdOJMPAJmTrO6S/i@vger.kernel.org
X-Gm-Message-State: AOJu0Yxihps602BFna0PY4DRO/LzhEViBoEDjnqZAb5kbmY3NeBZqdWO
	tmdT3IiBIdqoH3tCl21QTbYXij7CIsN/sIMz+gllTgFF6zazGMHlvm3pbhOCQjA=
X-Gm-Gg: ASbGnctMETEvAPNTqqmutY1aH/J4ojjzRVZrpR+DL5Hvuo63f2RafLkXI0TV//aLvqK
	YDr0Sdq9fd5YQxFbTuOYFHv8SjNSr0a3LQDzvzuDPWJVch8yLu9GjfP9o/0Qt8o6SeeYTr7JHKQ
	hwEC4tNPyNoneJdN15a/RivGg88l5pH+a4bm3GhanLX5HpaC3R6PmUrqyEb/OhTHfBekpjpPJZW
	UGj+xrNudcqVgdu+pwXyuX0rIl1irjonIOJfh7iBa1QtC/RM+YUrOYbOGuTxuRIUWddcuM8psRb
	YYU/9TbizouGhT+LLXlElV+fT833jp6MR3MLpsv8
X-Google-Smtp-Source: AGHT+IHjLSNxeifF/38VMi7dEG8R8mOoiltOqfkJG6DXGhVBYkNfwPD9ab3HxUNuKUZ0XFxpl43IYA==
X-Received: by 2002:adf:f3cb:0:b0:38f:2a7f:b6cd with SMTP id ffacd0b85a97d-38f33f3dba5mr15018331f8f.20.1740068966979;
        Thu, 20 Feb 2025 08:29:26 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f5fabsm20813753f8f.45.2025.02.20.08.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 08:29:25 -0800 (PST)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	krzysztof.kozlowski@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 4/5] ASoC: qdsp6: q6apm-dai: set correct period size
Date: Thu, 20 Feb 2025 16:28:46 +0000
Message-Id: <20250220162847.11994-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250220162847.11994-1-srinivas.kandagatla@linaro.org>
References: <20250220162847.11994-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

For some reason we ended up with a period size which is less than 1ms,
DSP does not support such a small fragment size. Adjust this to be in
the range of 16ms to 32ms.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 7466fe0c661a..049b91fd7a23 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -21,11 +21,11 @@
 #define PLAYBACK_MIN_NUM_PERIODS	2
 #define PLAYBACK_MAX_NUM_PERIODS	8
 #define PLAYBACK_MAX_PERIOD_SIZE	65536
-#define PLAYBACK_MIN_PERIOD_SIZE	128
-#define CAPTURE_MIN_NUM_PERIODS		2
-#define CAPTURE_MAX_NUM_PERIODS		8
-#define CAPTURE_MAX_PERIOD_SIZE		4096
-#define CAPTURE_MIN_PERIOD_SIZE		320
+#define PLAYBACK_MIN_PERIOD_SIZE	6144
+#define CAPTURE_MIN_NUM_PERIODS		PLAYBACK_MIN_NUM_PERIODS
+#define CAPTURE_MAX_NUM_PERIODS		PLAYBACK_MAX_NUM_PERIODS
+#define CAPTURE_MAX_PERIOD_SIZE		PLAYBACK_MAX_PERIOD_SIZE
+#define CAPTURE_MIN_PERIOD_SIZE		PLAYBACK_MIN_PERIOD_SIZE
 #define BUFFER_BYTES_MAX (PLAYBACK_MAX_NUM_PERIODS * PLAYBACK_MAX_PERIOD_SIZE)
 #define BUFFER_BYTES_MIN (PLAYBACK_MIN_NUM_PERIODS * PLAYBACK_MIN_PERIOD_SIZE)
 #define COMPR_PLAYBACK_MAX_FRAGMENT_SIZE (128 * 1024)
-- 
2.39.5


