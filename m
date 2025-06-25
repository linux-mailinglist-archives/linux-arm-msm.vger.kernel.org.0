Return-Path: <linux-arm-msm+bounces-62342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D992EAE7C00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:18:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC5991BC8190
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C2132D5C99;
	Wed, 25 Jun 2025 09:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="w55maAI2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3038E291C01
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842797; cv=none; b=CmisJCzbiPvQBWzWgwFpKkJJxZcGihr189aZMKQUa1tgf4UVj8wNwhNXuQ0z1mQXthj9EFVwQ6WfPGUuvUe7POtvAPIpcEDo5TEK634JrwIUr4fIaIMIC4W/3ec+Xd1R6PXMb74hu8ZyLyrkk6Zp6EgPAopa3YN9trt/wUMrCT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842797; c=relaxed/simple;
	bh=Gwv86YaLq4nMyYuk8Ga+pLFqTHUG/EjtEAyeU2iFtZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OH98yHNXjyQLxNU4/Kju/gOyDZbG7zGbtXgh0CUy8GKkzVQLNv8yaINa4woJVlnc6/+aj7ivWcshAJsMPzeclGiJqha6zmew7fzUOZ8RlkeJo47nfpz4ZZpj7JjxZkN3NfctBaGct3F/MJyV23XM+kd9qwTHrLkIjqp31YfGtHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=w55maAI2; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-acb5ec407b1so1055525366b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842793; x=1751447593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QIonQPzr0yW+9KIT56dpfw0JEE8zh3WfbxaXN1wXE2A=;
        b=w55maAI2ViAGgCOVeC0bOEilvnyX84oSsNpmx4XY9AGM1IiE/Iu44HnvawufvNk9UP
         stlQ21LmVzeSpgmjsc5rHL1P0Q+VOdZvDMWMNi4Crs9+4xZzV02o6KpTO5VLU6wmD3cj
         dMbqX2xmjeFp5ukWbjn9armAmkORYRJWKnifczORnNiarvXblkkzydlFt8gTlYsPFBIe
         6jf7KImXkNG/HmF0xka4Ks5AjTSm1mRu12muq8Isdu2lLhbOL7X5hxtGQh7Z6iAkAnob
         WwOsaHtSoBoGnGvRItx4Mr1kHmSWm76lWPiBiPkR5G991S/DERb/CKYppEB9MvoozwWE
         uNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842793; x=1751447593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIonQPzr0yW+9KIT56dpfw0JEE8zh3WfbxaXN1wXE2A=;
        b=OwVeTJsZphpKqW9qTExLNowpk/1tsGeofA7lzE5eR1eqGWVzgcMmVYI+DXOJftQTK0
         sY1XmF1QgrxrkfRfCFroQcBZ0i5KxAYtGkuASeHv3teerwrGCHDRw5W9KVg7jXB3LC6R
         wDuQaPFMP5Ia1K4pRe6uJSm2TxFtR+SumthemLzw4VTTyApQJXc8yBNHiPLTgFOvaF3i
         aCvguQYB+xTdNe6dH5doUOu1kYdap5v076+T1N+h2InHfK7ZsWGRzYJekznL/tSx83ru
         cJOBzLzoNDwaYplk5KL+kDFdfbmcTk3hN59pv/Re/0Re1yFfmLCshEyu+v78AlWStrjS
         1XUg==
X-Forwarded-Encrypted: i=1; AJvYcCWMCUBrsVk9e1fetwkIT+K4o/8QYatJrsyMQ0YoivgCj0ey2j/GA+UWEQGtxZrFRgumWXZ1YPthtIO06ZWv@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+CYdrINfbXy5Kj+fxTTHqMgytDu/YF5reMnUi906BCRWkDpH6
	4MfmKR9tJ5ek4JyqLbJRwwEji61q2c/VC2jByO2zjZ+g//8iGn1m+MVTj9Na6mUDrl/OPjn5haY
	mSWan
X-Gm-Gg: ASbGncv8LO4DGRMi7sFGohSBbUvKrNkZkpe3/dZ57/mvgcmzRQ/nZSGNSnFMo+lZoOC
	9in94OQzrHsjgo30YwVBb7YsLO6KO3ZjptMC7A4thS0YeUTruD4U6a5OrwTHCzGTd35CqvOARwo
	WS+aRsiT5anBFfDEFIDpCzBCaV6PpknlODzBBBdTWM0GS0kVHD10UT/TbUn82HVRPR/TyyJrJPl
	XNdozNm2oXkCCFTiEP98HFwNX70EYYoR7e1lZ5Jd/Z0PmU80nVr3oT92idNfAQIctGEq63rImQR
	3xXlFIFAQqybmVE7baCfy0mV/4DJ4ChOrlpXZBcZ1X9IneMMyyWvaMigOskXlA4Q93vCyGKiXRu
	6WkxcUK/4yuAEFoCPNz3qPI8Qoxgp9BY+
X-Google-Smtp-Source: AGHT+IERi2KHtQmQ4ho4DAkM8LuxU28cCOfHg6BLub6/yIICgropn78NU/dR0TfXuDcxZ6KxmKngVg==
X-Received: by 2002:a17:906:4914:b0:ad8:8efe:31fb with SMTP id a640c23a62f3a-ae0beb3d1b8mr209242166b.54.1750842793405;
        Wed, 25 Jun 2025 02:13:13 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0a93f5e96sm272499466b.74.2025.06.25.02.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:13:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:12:47 +0200
Subject: [PATCH 1/4] dt-bindings: clock: qcom: Document the SM7635 RPMH
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-clocks-misc-v1-1-45fea645d39b@fairphone.com>
References: <20250625-sm7635-clocks-misc-v1-0-45fea645d39b@fairphone.com>
In-Reply-To: <20250625-sm7635-clocks-misc-v1-0-45fea645d39b@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842791; l=844;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Gwv86YaLq4nMyYuk8Ga+pLFqTHUG/EjtEAyeU2iFtZE=;
 b=dykpNwSjr0QLGEvzyK2lLZvCnvMi6GOSDRyxweW5VB0Oy8wkfDV3gYnxPAlaPGhVjMQEC9I8M
 gVc59G4W7/IB05nJrDZCgmK3yGnOuYo7iM0Us/OIXDZgypH5MsSxULX
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings documentation for the SM7635 RPMH Clock Controller.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index dcb872b9cf3e01f87d4fc546311eb758ee63af9a..340dc2613c9d8c6d1c5ca4fc74801ee6d4d197d8 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -32,6 +32,7 @@ properties:
       - qcom,sdx75-rpmh-clk
       - qcom,sm4450-rpmh-clk
       - qcom,sm6350-rpmh-clk
+      - qcom,sm7635-rpmh-clk
       - qcom,sm8150-rpmh-clk
       - qcom,sm8250-rpmh-clk
       - qcom,sm8350-rpmh-clk

-- 
2.50.0


