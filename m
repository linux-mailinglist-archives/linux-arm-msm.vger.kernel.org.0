Return-Path: <linux-arm-msm+bounces-27474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F459425E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 07:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30D3A1C225D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 05:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906A04C634;
	Wed, 31 Jul 2024 05:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ajXx2497"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1614AECE
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 05:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722404684; cv=none; b=Ky4gDC4BqqoCfftiwjxCKouU2D1j5Hgza02qSmCP7VRnO4wCPGl7kBZFk2CuJQjrJ95kJ5sWqskaMOadPzbg9MULAIh/XGeVwBRDSL3yv9Pkl4nlFu2FKoZYR+8671MBEGFI/GnDjPCC2qrTnt7/A8bZU/ueDqWLYluXVv+z7Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722404684; c=relaxed/simple;
	bh=qmEk+HRbgjzJ4b6wsqa+XId/OohdPcTkLCsEGD8Cqgs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RRx7piSieKTfeo4Mjzqkqhrb+YevIHTWbHuRNFaRxW746oIbwQRhdKZZ5pmf82Nh159C8ZOyZrvqcempHTQyfClzVDc52FYOzAl9J/1Ko3BLiLQy/zN6vcuq9qGkJ1AJ4fDqvq1Yx2oNhd5Xs6Juky43yqKo1VgKAD8AiELQE7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ajXx2497; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-428163f7635so32469295e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 22:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722404681; x=1723009481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3aH3De4WIZtFbyS12dyd1qXZqBk4SKLj9OlpT9UkbuQ=;
        b=ajXx2497yx2stXCYakkQlKU9PoLGFA5+k24LZaVdOWtRaXNS00z62GlxEB4uK/jVST
         I6SRHfi9sXFzExVEb1lkByjdJBn1d7FAF4vefZnPNl7a69ZvP6QCQXWhlhuzMZ7+hwgm
         fFlPNxIifpyTDNgrHOUJpoXUMQesWwl+Hgfvp9WteVZchUas8PC3W8xtnGgWRF0CiX/8
         pQWoJJOBRmt4m6ZivDa/taxgZ5/1+PTSq0GWwz/aafHk1YdJAPMfdqdYw+UDoNmhzAPZ
         gAzM1AuKvhpE2gc2xplYyc3MnE3bJx5vbdAd+zZ/Kde6BHAK9GutElHqW2ZHYpB040bu
         hrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722404681; x=1723009481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3aH3De4WIZtFbyS12dyd1qXZqBk4SKLj9OlpT9UkbuQ=;
        b=EP3K9u5yzLnfivHIhiQXcWgXwoO1XowIOCh8JmVOA4UcT8F9feZR78ZHfPGKygBmEd
         Bc1RcWKYQ9yN5I8Yo/QmJtXtY5OmQLo9/iZY9RkPtpNqW8EOqX2DgmfVKey2AyTcCLKF
         UsXEyfd1rHq2uT9oNZXxTi5pVRRh8sVtOErmUNpxN6425F5PN32mFmO0PENaEwGnMRIg
         XAj1e2MjNfQktP8U+53B3zx3Z2eokYlmyAQ08dUpz+1ndN4YYRtlvPT4O8QTPRkuBb7R
         t47cVxNPp7nIs9mQJMwr6XDGsww8MwWLFx8N4KldQLzI6CUyjqe73gZhDZIsRc4d9TY8
         uE3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVaCajyk5uG+MOCL8GltjzogSrrJ3qLFMbSkQP4BsbKZlgH/k8E6O8PcskGDauRgGpdK0+LbUyv8dfXxApiE7yxYj9ne9PG0tP793ZX2A==
X-Gm-Message-State: AOJu0Yy5w5eN4ktCE0alJEI5T/h4QNcG+LVknAPuQF9YB9b8AoUPOUkN
	nyNuHvpk9n9marb/0MDXKYN99lpgaOdlB10/S2XII0u8TbcrlRRLj4/3pObdX5c=
X-Google-Smtp-Source: AGHT+IHx4zf9FG/L6T+0AuVPC0EZ26TemOB8izSYWzYFEl61KTs2n+sG4y/8QWnmw2anvLsYD9uQnw==
X-Received: by 2002:a05:600c:1386:b0:426:5416:67e0 with SMTP id 5b1f17b1804b1-42811df0e55mr88395835e9.31.1722404680896;
        Tue, 30 Jul 2024 22:44:40 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282baa9071sm7070605e9.13.2024.07.30.22.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 22:44:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] usb: misc: eud: switch to fallback compatible for device matching
Date: Wed, 31 Jul 2024 07:44:38 +0200
Message-ID: <20240731054438.9073-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bindings require two compatibles to be used: qcom,sc7280-eud
followed by fallback qcom,eud.  The convention is to use fallback
compatible in OF device ID tables, unless some device-specific quirks
are needed.

This will also simplify matching any new devices - they will use
existing OF device ID entry, instead of adding a new one.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/misc/qcom_eud.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 26e9b8749d8a..19906301a4eb 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -232,7 +232,7 @@ static void eud_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id eud_dt_match[] = {
-	{ .compatible = "qcom,sc7280-eud" },
+	{ .compatible = "qcom,eud" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, eud_dt_match);
-- 
2.43.0


