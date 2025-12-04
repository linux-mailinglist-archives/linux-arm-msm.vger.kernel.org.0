Return-Path: <linux-arm-msm+bounces-84359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9073CA39B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 13:30:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 726413069576
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 12:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F4C33FE13;
	Thu,  4 Dec 2025 12:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1ZVr+/oZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A721633E37D
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 12:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764851356; cv=none; b=FGrIMEjPCAvACPLZlHEdpoieuoqGlt6nbpoCWXSsLBQSz3MM1641YjzCR70Ud4qDW1lBznd/MF6HDaCsV7PI/kEwfYZ06t2Tt+KBoDzHdDclAMKb8hIV8UGcaw4waEP6mGPqIBL7+uVPel0rwuNXSv4On/HfUO4GN5yeqb1jfLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764851356; c=relaxed/simple;
	bh=QYmrgdDXqT1aWWXJG0G1BjIqfjRA9W45tZLonXGa3jQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dFnU40YoLsAOvRp5J82VO/rU+/uj2ySA8OERfCCuK76IyzqjIYFmMQzVDm2X68UW/CQ9p/IbLSeXFOBXf1+1Rn79kZiF4OX3QiL45uPcl+qpiJZ58RIvzbvCUSF7zg029rcNtpc90bRTXx4aF+V+7i0XeqtruWHEWA/FlgMJZEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1ZVr+/oZ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b73875aa527so127459266b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 04:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1764851352; x=1765456152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+iuRvFxHsbSvTzobdKClKZ4UVAG0qRuCMrY56/R0rKA=;
        b=1ZVr+/oZVfXtfyPUT5qh2tJQn6M6ZYlBC+Za2f/Z3YrIC+BrHEROnVTELqP67+Hqp6
         WH6bhNguhy2MDp464F2Dmi9pWJ7rBan5PqPxfXSWPUzQzYQXBmAqtTMrEgjf9YlQotp+
         VIWuqdIhN6Iz4berQcTXD8DjNGC9nvRZQjjdHWwGbPH3a9k62iYuiK2qjCIGBaxdKH1w
         EYxA9SK6qiClO/q2CZWJ4aco2Xf5/7Uh8q6sJZJ7b5dJVqShRitkzVJVvzH75kz4K4/B
         XoIYDUiwB5mizIXCGFmZuKPjp0DTb8KTQV/2MTZg5CDa1fgK37nNv1YLmecCVqSlzCQ/
         d4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764851352; x=1765456152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+iuRvFxHsbSvTzobdKClKZ4UVAG0qRuCMrY56/R0rKA=;
        b=OQHDSIV7SRD+W78GXGzw05gX4hmkesRadPIoVb5wnwjvVvI5SwEzPBppxHf86gGlvG
         1sNX5OMMlpb1GqvTfinkTxjsgAY+DSZudnfDroAikUH35M9xH/R/ls3+kfSlAZMLrKo4
         x9sgmvo1woDPCSETmX8xiVdVuc1yEVoxb1akQJqBbweOkzcl+cxkq+so3VZiGZO1fI+d
         kFAsfB5e4QpcsSS2aibPXJLS12Kw32QLYUiabTOVjVZdzIqbTn7IvjU3QQXQFsSBC7BG
         c36rkDgHOvHQUSLruHUV7KJpRqXUkZX2tOYFZ81x9QxSo4UTGa/TPzX4tcn9aNM/QDN5
         o2QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPEAQDvyZm1y1xqlMhs8yaflTFlJq8lQyoP3VJriq/2jVpUh85JrfofcMOXT1dOiDj153gw/fQLn2n3xaI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqii6HMzo5LrEh3v11U8pL8xSIXSv2JsC8xY77grOzo4Ylj3uk
	06l/AXs+SRyiJ68iFoT7764Wb7Zt5AGKh7+I3ebrlkw7gPfUm31szQFw9ahjyOH8g+k=
X-Gm-Gg: ASbGncuK7LXZtOxOLzNwiSM9YY1g+pUz1KfImbwbeK8AKOjRzKDHbrpPLx71r3DK2t0
	dHss6w5CXJgK+k9JMynSWkhbx5v0iw6/qLkTMkQLaIC1RgqSYnct6+ktLorUCql++DPs8sKUPQc
	k6KbR1EQIKM2UX7dFxXl06sdF6QEDK+cHH1DktLrEAl8UbzDmbXrQ21fG5DYS0PiIsijcyozbOh
	5aJQsIMEIwnH5Y78G0FTTSblhLedd6d9JJASI7eZJWM1UMqpdePFoK70PwiR4ABeRp5ikbYpUig
	aElj5bV7sNOyWq2iXhEFeS5v588mXHUH1NzZGfIbin58eh6iwmZtlJydh9+uKbVfUjlozet4OM8
	k4YOaLhu4ZNtr/a2nNG24qFsGh8Zn1+tD0j7JqIvHKofNqwfQMYRmM1zp11WfFo8ZYU8CXPe7Vi
	JqtmFUMPcTf2wpWrleCNRglfmpdNtLPpSmCf6LPgU23kKb8Tyfp8/XreIl1lIRjK52nbxELeYZm
	mrlbOI=
X-Google-Smtp-Source: AGHT+IEeLWVpcgpslRVn/NQp2VXf89zJAX9UXM8RzNCcJdJCNhZ/TlipgM2kHb8Q2HjLSF8XiPMNCQ==
X-Received: by 2002:a17:907:9448:b0:b73:7158:d9cd with SMTP id a640c23a62f3a-b79dc77dffdmr685538066b.52.1764851351828;
        Thu, 04 Dec 2025 04:29:11 -0800 (PST)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4a2f19dsm121351666b.64.2025.12.04.04.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 04:29:11 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 04 Dec 2025 13:29:00 +0100
Subject: [PATCH 1/3] dt-bindings: input: Add Awinic AW86938
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-aw86938-driver-v1-1-ebd71868df3a@fairphone.com>
References: <20251204-aw86938-driver-v1-0-ebd71868df3a@fairphone.com>
In-Reply-To: <20251204-aw86938-driver-v1-0-ebd71868df3a@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764851350; l=849;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=QYmrgdDXqT1aWWXJG0G1BjIqfjRA9W45tZLonXGa3jQ=;
 b=ZFDj37TSZ3tYnwNR4KtpLow3cMBXaX8FcWGKPELphN/73nUGxmYvtUT3R31yeUttW/CaJN06U
 gU22RcQC5IIAyYZxF8v3tBy2J1LUHme1xxDWwlW4MfssR/YrbyByhlf
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add bindings for the Awinic AW86938 haptic chip which can be found in
smartphones.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 Documentation/devicetree/bindings/input/awinic,aw86927.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
index b7252916bd727486c1a98913d4ec3ef12422e4bd..c3dee660422192720da3cf63851cea27db819742 100644
--- a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
+++ b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: awinic,aw86927
+    enum:
+      - awinic,aw86927
+      - awinic,aw86938
 
   reg:
     maxItems: 1

-- 
2.43.0


