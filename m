Return-Path: <linux-arm-msm+bounces-19874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A905C8C6538
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 12:55:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 645A2284741
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 10:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75606629E4;
	Wed, 15 May 2024 10:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pIXpOC54"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DB05F876
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2024 10:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715770508; cv=none; b=aWVcZCiexYSt15Mw0xbPn/0nPwjndEhJhdh3xpc/KhpnPCeMWam6CTdk0R3NybJWRV27eojIvv/U+phQTxTNE6xlf8+5aVTiJkyYuDteAm8s1k3XiVRSRBXzn7TM3VxCXdLMB1c+cNNfQKjP1JopedIDK4UTqWWOlVGdmH55llI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715770508; c=relaxed/simple;
	bh=rPfFrJBnAulSY0rHFnC89I3kUqU3f8YhptHrQUiyOjs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ppCioQhsQ7F6ULW/BYWfq2tMJsoG9Pm4eXLYOD8uiZwZFze1qVkyzgJglaWBeufuEhHMXwfsEuhCz/ScOdiAXgEnrs+CMEfmIBjAVV6rtw9+aJJCTwseyPnIao2NFPaj6xzPjPf1oJxcLIXLFTNl0Q4ncVBA2KNxsB145NMdIfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pIXpOC54; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1eecc71311eso55786735ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2024 03:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715770506; x=1716375306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BaoVf9eqjsot1BqIU97nmYIfRRMIaK539UE6et7+tDo=;
        b=pIXpOC54bmlwDCLhXRjCsoFfUnXAEKVxcCWFG/hQmlbXh+D/8VXALYiYq+VvzbyPuk
         rjgWwTNBqCH3m4020kXnllUQ55Jymj0q4GNlIffR9QG9diZgo6WU7OFqcWXKu1U8RIse
         +ylc9pep+8d+jOP+raEQ9G8X7Vf6i8Yk7ViMLlv8/qy3ubDowHfwk8EqHxYJAre2tgDb
         J7ywtk0fGF35eeMuYxB/RMsX6Dh5JHv7b2LHnuqxtUKPtfeL6kAbAG60WXH1PGd02aIs
         77H7Tr8paYy4Dfmhe0xuPgHMwfP6tGRNL/7Ovtegli2NJHnKHuXSrogLi/XFrUcJaBws
         dRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715770506; x=1716375306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BaoVf9eqjsot1BqIU97nmYIfRRMIaK539UE6et7+tDo=;
        b=Zn5dCy14bkImjhjxM3zwHyiFx5x4Rz7Jd4qae0BJu/yUFyBzIVMdEV4VpiR1+X3rQY
         xTCvxrpdArteQBsRr2vKpuKUd21GgRP2ecT+BkFD3gFqf2akJbjm067E1xlTrpNPNjYw
         5yYxXbuxJ5Y8KlLZvYF6u/5ae0chrh2Si7THax7o89qkmNGfMnOlN0QF/Prp2Bj08R3o
         MTy+eWOMROU+fVMzWcJI35YIiAkwZh8Ad9alhuBaJeXTzX57+l0ioBfgu7fSksCZI4PD
         l9gAeXfFJl7vNsISGeYAp4eDUds2XXegoc+pG6fhMdlO7/cCLPOndkyXfgBAqka8+OIJ
         T+9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXk0nmLsXFL3wh/mLPElBaAGmBzG9BETZwSCztSIdYOwWF2y1OIlmfF38XeSMCSZNVXHgEKafD3IdZKQIVge8e0RVo/RC1KMhiuH8wvZQ==
X-Gm-Message-State: AOJu0YxYGOD7gizkxMXHIC8U+eYX9OKs74H7t4hE2HWfdekcT8rhrUXy
	Vx8zgmus77ig7hOYHVvEmzYsUKUsdf5RLskLymDDzZFUpvGbC+U47flxtIPdqmI=
X-Google-Smtp-Source: AGHT+IEa8cD+NHaZ6nWyKLxA++Jr15uCVPBvC4soQiOj+YCFTQkTKTvJ2zwwy6AZreOga57EltuXGA==
X-Received: by 2002:a17:903:182:b0:1e2:ca65:68c2 with SMTP id d9443c01a7336-1ef43f4e240mr259590415ad.51.1715770506339;
        Wed, 15 May 2024 03:55:06 -0700 (PDT)
Received: from sumit-X1.. ([223.178.209.205])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf30bb9sm115092425ad.135.2024.05.15.03.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 03:55:06 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	stephan@gerhold.net,
	caleb.connolly@linaro.org,
	neil.armstrong@linaro.org,
	dmitry.baryshkov@linaro.org,
	laetitia.mariottini@se.com,
	pascal.eberhard@se.com,
	abdou.saker@se.com,
	jimmy.lalande@se.com,
	benjamin.missey@non.se.com,
	daniel.thompson@linaro.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RESEND v5 1/3] dt-bindings: vendor-prefixes: Add Schneider Electric
Date: Wed, 15 May 2024 16:24:44 +0530
Message-Id: <20240515105446.3944629-2-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515105446.3944629-1-sumit.garg@linaro.org>
References: <20240515105446.3944629-1-sumit.garg@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add vendor prefix for Schneider Electric (https://www.se.com/).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 1a0dc04f1db4..4ef38573e411 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1211,6 +1211,8 @@ patternProperties:
     description: Smart Battery System
   "^schindler,.*":
     description: Schindler
+  "^schneider,.*":
+    description: Schneider Electric
   "^seagate,.*":
     description: Seagate Technology PLC
   "^seeed,.*":
-- 
2.34.1


