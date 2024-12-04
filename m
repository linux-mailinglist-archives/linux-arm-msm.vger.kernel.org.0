Return-Path: <linux-arm-msm+bounces-40377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBF79E46C3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:35:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10629188017B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 21:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F17195B37;
	Wed,  4 Dec 2024 21:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cii4oFpl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67F31925A6;
	Wed,  4 Dec 2024 21:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733348112; cv=none; b=CLeHnnC/WySXQJwsjkuB6btXvkUkrG7WERkxH2DNTUwC+IAwXO5gcyi5WGsy3n7tI726JhuTX2yiMSMmPmfH/MW760qWHXep/1J+lOXCf3z1ZlkEgLdKUhvS6ovsn/6pyq4Zb4DjzzwIcw9HqLktI/x/LBrKZrw4iBV2dNcQEBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733348112; c=relaxed/simple;
	bh=8GYNtMjyvlYyOVOr4Zbky3D7q11kPx9toIZISTyx+JI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ipVQL5l5Q+mv9bwr/pwsxQmpm7K11WjtexfJ4uhw2Weru5SZJib9oXMLvBYxIWOsCAQ3tEbZnJ3hwHI0vv09QGxkAs0/dgOOrY3fB9GWBbqxUKl1iHtmvnSCWhnOzY48HxBXJS4gtvFBpIk9fK/XmqkGEQA9KGRihgBdGzii9as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cii4oFpl; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa55da18f89so31331566b.0;
        Wed, 04 Dec 2024 13:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733348109; x=1733952909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LuV7cwmdwchb8LB/7r20k40yGp1R1NcwnamjAVAif6s=;
        b=Cii4oFplZi0U3u894yZB3oQT1213rvvMJmgYYTAuh48wpdigj8eZupbBkSeVnnrR4N
         6txTZgstMyMCSu7zI4zYXvcO651xhmX7lZhTlYuFqenYCq9lJ0o+TTsXKIcHbTVR4yrk
         TqSsJDkiJLJEXx1EyeSJDIVpxC4IjlpZz96fYqa2wqBhlapIJ+QEAdhDGbrpdrOobJnA
         IyvPbsIpDe9Q/nBqBx8HrWQTD89OJ560Or7WqI+2xZv3JZ0TMHmzpPU09BaqKFzTN7uS
         3PKUplA7irC2XiulpktJvaTsDzckSki3EVTXaA1uT6f5Oc7qOb6MnkH0y80We22RjCLR
         +rSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733348109; x=1733952909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LuV7cwmdwchb8LB/7r20k40yGp1R1NcwnamjAVAif6s=;
        b=bPBwZBu5LGLmd3T60Kd3xdiMvxrl8j5+I61cFTtIGI+zttYQzN2/lI0ULFX5DHvPZf
         sCeIE59Gse/oakKZL1k9AaI0dSSO1zGoCVUKSo29Gn7yQbDj+ByVRRt6Kr3Zekjj+YOa
         yeV+4ijn0o6jA2YcDuXaQsTjUt+XhpuRv0Fs5XCeiLEAQ0G9lTyXQZpYaTtIsfgVP9aH
         diMoiX1ICsdYFFq5Sig5y+PjBKRdg0sAs2NK1I7mKpIXqLppjaGbzPMH0tLOudqhXjYU
         wcPp/gac4ZlTA7EZkr1nD/m2aod3VVEs15c9P9odbPZgEJhSMgeaBS6PXegV2RFkdWZk
         lyCw==
X-Forwarded-Encrypted: i=1; AJvYcCWGI3Fx8T+s0K+qG4JLgr2tv/khnVJnw+ltGcOH48jDJ5vCTI6DwmFV0ft0Ktx0Glv5jda8dd5sMw/K@vger.kernel.org, AJvYcCWJ9Vl6sgem8+DQdCxNhYd6dDW/6IPylZvxMy1oWQx5qsgHzLS+2MvDU14Bsxd7qjNaIy8v8559vVnqh+0=@vger.kernel.org, AJvYcCXhXKIdLwCGFTLO7Lrg03JzUygmhm+lH14P2aOcYXNxYrPxsnXwHAdzLvs0nrVCx03Uzk7Y7zw4adyRru4V@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6OTUstrM+XRFzt/fLe3uxlt4MmZ6Msbtjpvk/Y8b9z36SazZE
	VpOszAnr8dsuhPBwrWMTjECyv/XfqbsEeIIWT+NvU/wld3wKtqzkYOY98g==
X-Gm-Gg: ASbGnctC8rvNW492xEED/MXY/bvRjjsFhRSN0Zs/RJLQL+7JnxVPtg7frYWdZ/cwVov
	mCawicwp/vmNRqbz8oTyP/zP12/nJ2uI0fRl3+wTwOo6j5A3hEwpnF0GJxdVAIwEAvaf59V5OAn
	HeQMUaw+Zocm7n7rn9w4VFG7/k49Ygo75j5fbN+YqgJLXcr3gpv8CfWR/pN0Ayt1iSbwObfWtKb
	YPrubFULj0CedgVNK8rLcPRtqr149fHPe8IyQxF3h7bcfAZ
X-Google-Smtp-Source: AGHT+IGtEruR6xCHbI56vFuwlvgypRehvg14vOTyoyTCYLyC22BBypixZhnXeVjhLwlC4wwLHSOP3Q==
X-Received: by 2002:a17:906:3ca9:b0:aa5:b639:e2f0 with SMTP id a640c23a62f3a-aa5f7dca34fmr511162066b.35.1733348108388;
        Wed, 04 Dec 2024 13:35:08 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa62601b5ddsm4506966b.118.2024.12.04.13.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 13:35:07 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 05 Dec 2024 00:34:49 +0300
Subject: [PATCH v7 02/14] ASoC: codecs: wcd934x: use wcd934x binding header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-starqltechn_integration_upstream-v7-2-84f9a3547803@gmail.com>
References: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
In-Reply-To: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733348104; l=1049;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=8GYNtMjyvlYyOVOr4Zbky3D7q11kPx9toIZISTyx+JI=;
 b=secSx3N9rzMzFuvxLewBFyI8nYxZuD1F3+W7BCUXxhpC2UF2Mztzt1ocxq5j3WfdLu846/mAP
 VpW6E/Cj88zA+6Ec0Iz+d+i5Q0Auojk7xA5OndKYkwkh4gZ6wW9zYY+
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Replace AIF* enum with binding header include.
This allow to get rid of mysterious indeces in dts.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 sound/soc/codecs/wcd934x.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 910852eb9698..a730d7195bc1 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -23,6 +23,8 @@
 #include "wcd-clsh-v2.h"
 #include "wcd-mbhc-v2.h"
 
+#include <dt-bindings/sound/qcom,wcd934x.h>
+
 #define WCD934X_RATES_MASK (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
 			    SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
 			    SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_192000)
@@ -434,19 +436,6 @@ enum {
 	COMPANDER_MAX,
 };
 
-enum {
-	AIF1_PB = 0,
-	AIF1_CAP,
-	AIF2_PB,
-	AIF2_CAP,
-	AIF3_PB,
-	AIF3_CAP,
-	AIF4_PB,
-	AIF4_VIFEED,
-	AIF4_MAD_TX,
-	NUM_CODEC_DAIS,
-};
-
 enum {
 	INTn_1_INP_SEL_ZERO = 0,
 	INTn_1_INP_SEL_DEC0,

-- 
2.39.5


