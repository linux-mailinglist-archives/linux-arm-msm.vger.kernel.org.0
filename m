Return-Path: <linux-arm-msm+bounces-20526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC458CF8CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 07:39:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5831281ABF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 05:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6267C152;
	Mon, 27 May 2024 05:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="llzHtWdZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5306E134B0
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 05:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716788332; cv=none; b=oTDcuOvXuzETyJ0+YoBa8nzb6HkirVBTiLq++wxczs03/LFTBXfZRBK1qzpKLDI0hP7kBM6dhZPcqx51dAopgcB62kGXwcc1jb3vg4FD8lUFmpMcyO2mkeOtpmLckcwyjJ/ZlJwr8djsslEVhMqS7CWf3ssMGKpcQXy7DSFTam4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716788332; c=relaxed/simple;
	bh=rPfFrJBnAulSY0rHFnC89I3kUqU3f8YhptHrQUiyOjs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dkwkC2on7aP1quSdznwlDWvWapDlqBnUSyYJHPeYyv+LeN1V2CzFE6fzWKNjgSu7xPzVFRSFrmLXYjPMz1k97TsH2uVeOkSwpkx7ye76t2mJ1iYxDJESp7DloTzlemWu+SV5SkDVbkDArFIdy8Cf8ZVOdDtfSAK6QVIn4AqXRRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=llzHtWdZ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1f4a52b94c3so3236215ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 May 2024 22:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716788330; x=1717393130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BaoVf9eqjsot1BqIU97nmYIfRRMIaK539UE6et7+tDo=;
        b=llzHtWdZETdpjrArQzPaOL8x9iLXERTfQOyOlSOAdDTxNQtLxlSEqBkxqOUA65h6YV
         31lY3M1FXCB0NqtIAWt2be4mGVU0c0WLQF+FxjSlSgz/649c/3rUjvJiUmMXjchQ6vGH
         Gb+Atf+uSmCxHP3yN0Hb4cb28+XeUBdEMi0PRqfzZfO4rh0yal9SJvr+eJHUb7YKEVOz
         ZZpSECMqB0w84qft7cMSi2kDPv/IZ/XR4NKNqFl8ILsNmv9i/yEAiaFOnCI8LYJ2x6NA
         rZf7l95Uq7StT5zBbYVhMbO42B2nW2ynb6TibWXsYURhKygwjl5rfHHugCcX5+vqYOb0
         c4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716788330; x=1717393130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BaoVf9eqjsot1BqIU97nmYIfRRMIaK539UE6et7+tDo=;
        b=YS6YOBtoNQUn66BYeQoheQNUJG6OKH2EL2oLWNb7fBrU/TUcpwAXp0ipdIO4sHRBMP
         eHIKjJFmGDZn2Br6VE8knmCCaXXRLFu4VENqDQQfNe91eGsy5zEpC4MJ49Qi6uMVcpks
         yVKcwnaOYe8pdvZzZs1zB4cNBMWDmF0Q6zDqwFaeXvZsQYFQwMfXuANQ3vksREDrA/N6
         C23rdH/R6hxgRZXpk+iYId5WbXHfgT9rK239cvDRc0cPPDewWX3oiFiiOmaCFXXMjCV5
         x1RvHGRrs1VlgZc2vIMfdwiRVCzXZ5lw40T43vY2x9CRfZ+R65Fp2HwY20gpVjOwL995
         ntHg==
X-Gm-Message-State: AOJu0YwQw8cmYzpmWDQ1Bw/j2HcBlKSfDf0SsavajV7wpSh2f+vrF3NG
	Bf8TBXlUJB//hE0frejf5Y7sydXbHK2DxA+p2ZKWdY+Rmjz7FlbIuvnYLevlYEs=
X-Google-Smtp-Source: AGHT+IFgjVG9f3Ott/fxxmfPHjXa9BW1PEsQItCSb61Ct/TUAu2hJBRMUrECg2TYxwxIN8qtRkc9yA==
X-Received: by 2002:a17:902:c946:b0:1f4:92d4:d126 with SMTP id d9443c01a7336-1f492d4d135mr31439365ad.28.1716788330623;
        Sun, 26 May 2024 22:38:50 -0700 (PDT)
Received: from sumit-X1.. ([223.178.210.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9684ecsm51903745ad.177.2024.05.26.22.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 22:38:50 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: andersson@kernel.org,
	konrad.dybcio@linaro.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
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
Subject: [PATCH RESEND2 v5 1/3] dt-bindings: vendor-prefixes: Add Schneider Electric
Date: Mon, 27 May 2024 11:08:24 +0530
Message-Id: <20240527053826.294526-2-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527053826.294526-1-sumit.garg@linaro.org>
References: <20240527053826.294526-1-sumit.garg@linaro.org>
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


