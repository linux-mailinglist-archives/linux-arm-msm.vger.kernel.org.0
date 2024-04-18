Return-Path: <linux-arm-msm+bounces-17889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AB58AA456
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 22:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31F63B259CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 20:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528A8190696;
	Thu, 18 Apr 2024 20:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V7ImgRe7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A7C1A0AFC
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 20:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713473268; cv=none; b=iGMqIX6n/Lvl2V8nlG5jiRPATyIp+Du3lVV0LseMnWO5G//KK1Ff+a/nmpNNGhfO1SmkscGg8Vva4+jnIjraS5Q+RFq+bZuhef8VspEMtBG0j6P3WgiX0Efjaycab7Dpl0VgZbTIQqCzY3w0wcwhF32M1YPIINb4KYR5cDA08z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713473268; c=relaxed/simple;
	bh=EM+PQeT/+Ayv+DqVTXJ6eeqpjOeHpKwRxGVuenJZOr8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wo0R9kFgHoSQ2673UhjRmZvOGsYifzu7AEFiF6Z/XVytjr7GVcAErOjWw7i80WNnZNRxL6UTrmtlAk+fYEQHO8yn3e5pM3QtR070KR74aoRIM4XmhFAfjKcLtrzPTdtxdKcF5+oYw9aZk6wNIY++IeVLsglp6K2NJJ3oqwIIpM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V7ImgRe7; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-234db9dde9bso654843fac.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 13:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713473264; x=1714078064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOsLWHf1aG7QjlwAYhzu9K+FfSOj8nw2eYMqyFikvmc=;
        b=V7ImgRe7jkpHOts93G+lm8ZfO9vtJki+bHJ0OYnS501S6N72QFl2VAqL0oZk92QG3q
         m02rMzaHK9lln9LRB+LTNpKjMZM8eEUfyD2J1i88LyKH7kHzLT25MnE9nQFjXSSa0nNA
         LZCG0xLUPXsSPUL7eoiKlZgCVixeEm3fhiN/bh+NLnpt4pdDafK0fLfYLL0RSWF9ZqPN
         Tt2ff0T86NtzDvaqQ3/zBxJpzMMar+O82fDKHWqoBt3Ak9Odhwa0bcnlHrzZSbNbBHWH
         WrtxPOv+FVFLhMoupMyksg6vgMYsANQq0WHtaV62EczENhL4tIsGr+Tu4JF1S1Hg7+ji
         dq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713473264; x=1714078064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOsLWHf1aG7QjlwAYhzu9K+FfSOj8nw2eYMqyFikvmc=;
        b=AWQ9sC6FaX+px353vYVZVi2pdpr09u5aBbhlyxobRdUZEr7h8IcgjIM9tVbjEVqw1L
         UhzOwUTXlpHmCLYs0WyEZ/uOrYQB2YbwqTVgA+ie86aeFRTaqr1fOGgYfmHLL6kmvM9P
         YkEmWHlXhh4ZQyOP0pIy6sZNNszh5irmmutF78bgtD6wrNs2UhWJuKAgb6RwlzS1m0wW
         ePeFlT7yxdCQocXwoK3OoJ4haJOOCqs24EMJx03jUO9m3TjA0VEDf0CejMtbfbjcUHLZ
         2YTH7rkCUZIGVQsGqKI08yf6tGl5J9LUNuqO+MruUmjkaUwfhEu00tmFC5lDtH+oCHOk
         AqhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ9VwYsvR3fmF5Dbj2gNmIuPcCJNNNCKwY7SivNSejgxkDJlZnpo4egE5u3YjHNiyEhf7CqymMqkdXhIUbVFIRbkCPM52kQ6fKZgbwQw==
X-Gm-Message-State: AOJu0YyqiHAvF4rLDIQn3bGXsqr41Ss7J8dmRteJCwZW47sBqeOCFcLo
	Woto7Fm5F3MDY2pFjuGQJKKCEygAwGrjgX43LHTJog0lCHnuJQ0LPYRbrwSsoQQ=
X-Google-Smtp-Source: AGHT+IHgblJ9h1CLqLo4U6C2hS5Ih8NHrIzQTKnvXZ8o0ZznahnKl3ojygI4TwopwZYSah+zGVzmBw==
X-Received: by 2002:a05:6870:d886:b0:22e:e1e5:b8d with SMTP id oe6-20020a056870d88600b0022ee1e50b8dmr240440oac.51.1713473264566;
        Thu, 18 Apr 2024 13:47:44 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id r6-20020a056638300600b00484948cb8f5sm626998jak.91.2024.04.18.13.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 13:47:44 -0700 (PDT)
From: Alex Elder <elder@linaro.org>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mka@chromium.org,
	andersson@kernel.org,
	quic_cpratapa@quicinc.com,
	quic_avuyyuru@quicinc.com,
	quic_jponduru@quicinc.com,
	quic_subashab@quicinc.com,
	elder@kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 7/8] net: ipa: fix two minor ipa_cmd problems
Date: Thu, 18 Apr 2024 15:47:28 -0500
Message-Id: <20240418204729.1952353-8-elder@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240418204729.1952353-1-elder@linaro.org>
References: <20240418204729.1952353-1-elder@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In "ipa_cmd.h", ipa_cmd_data_valid() is declared, but that function
does not exist.  So delete that declaration.

Also, for some reason ipa_cmd_init() never gets called.  It isn't
really critical--it just validates that some memory offsets and a
size can be represented in some register fields, and they won't fail
with current data.  Regardless, call the function in ipa_probe().

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_cmd.h  | 8 --------
 drivers/net/ipa/ipa_main.c | 4 ++++
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ipa/ipa_cmd.h b/drivers/net/ipa/ipa_cmd.h
index e2cf1c2b0ef24..100a4e1133b5e 100644
--- a/drivers/net/ipa/ipa_cmd.h
+++ b/drivers/net/ipa/ipa_cmd.h
@@ -57,14 +57,6 @@ enum ipa_cmd_opcode {
 bool ipa_cmd_table_init_valid(struct ipa *ipa, const struct ipa_mem *mem,
 			      bool route);
 
-/**
- * ipa_cmd_data_valid() - Validate command-realted configuration is valid
- * @ipa:	- IPA pointer
- *
- * Return:	true if assumptions required for command are valid
- */
-bool ipa_cmd_data_valid(struct ipa *ipa);
-
 /**
  * ipa_cmd_pool_init() - initialize command channel pools
  * @channel:	AP->IPA command TX GSI channel pointer
diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 59e7abb4a0d19..04dc0540ff7fb 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -866,6 +866,10 @@ static int ipa_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_reg_exit;
 
+	ret = ipa_cmd_init(ipa);
+	if (ret)
+		goto err_mem_exit;
+
 	ret = gsi_init(&ipa->gsi, pdev, ipa->version, data->endpoint_count,
 		       data->endpoint_data);
 	if (ret)
-- 
2.40.1


