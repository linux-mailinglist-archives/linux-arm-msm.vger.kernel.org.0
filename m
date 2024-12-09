Return-Path: <linux-arm-msm+bounces-41046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DEC9E9359
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 13:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BABA1885B7B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE5252236EE;
	Mon,  9 Dec 2024 12:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wpt71GpW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D363221DAD;
	Mon,  9 Dec 2024 12:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733746181; cv=none; b=uj3B2CLgUp1lDsvgLLY0ccTP4b8duYXaKUdI72r6PDZ/LJWBDmkVykPxx3Ng5J9WThMYDEvd0GyKfF4ojsPqnDdlSnCt/BUht2XVFSqUimtTSfXBns9qn860nqW/5Df6vAyuoo3xrJLQrfn2LeVZJtoooPYhg3hZlT+CQzBRn5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733746181; c=relaxed/simple;
	bh=eOIOn3QlgApD/ENdOuFA9hKZGB/68p+jAtBg/Z5OlNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HiofgMU7KTliv97Kog4MIuIvIhLne29C/vby+I4OxBDZIWGbF7VBKFs+DD9bY4q69AvNC5ElzGjhaVZ+i19SMy9VOZWR5q/15KX9PsuFUgRpU2oB6ClFLb/YcoKcr7tXv8MBEbJ0u0KCDjfJwKWBmRkGnlMEptkz/ygeoq9LxGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wpt71GpW; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa69251292dso109382566b.2;
        Mon, 09 Dec 2024 04:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733746178; x=1734350978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U6icC5XFDf9W3w1SQon9f4fRnLynaXQsz27WhJ5gCUU=;
        b=Wpt71GpW0xAcXc7nYDJ+rR6knE3sJoFrY8rm/Q/o1I9PFscKzJ8yVKuKjHokLobFPN
         nc2PFZOt/pUOXuKwsj7wrrALadWMWddk1O0TJEnQQ2cWmTZXW56Vy2UcgW7DCaHTk71j
         CuYr1xiay2+hIncc5GUmtTRktRwSRgIMYQCkXkf4/LLu+kiZeeIxOtmZTZ+CeIEw4f8c
         5OObt6hRRdlzbr7rJHgQBaShEPl55g9a5hdOcae21U+Ii1AQ16lMbGXJXiLDPDnD1we3
         QN5oz7nRY1MQnNSbXP3Wt9e2dIvmCvGOgo+n3VfcW0JoUNKcjCNMM+LVmEtq3/+ViAno
         1lYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733746178; x=1734350978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6icC5XFDf9W3w1SQon9f4fRnLynaXQsz27WhJ5gCUU=;
        b=fgNPGLyneHrn17lRwIF6OHK0B9H49R1OrSpId79n92C75h2YO6r/Vltif2PpOYr9Dj
         nOaRPqfIgfSQ7umB4OZaLIQhpiKBT4I0Px6rdAASLukDDhaQZmUXQmixUL3rDLyn5wDd
         auhtUEUuXp9HL7qt9P04A1oKoEtPCQX/dshJQRmwn6TEWj8uMA4e6ysb0EHRaiWXBawe
         vHr45jly7+rEJ7ylIXm9ldGd3RIYupgO/nde9NHxvxxohhCjQ0ZjlODT6lValD7il3ch
         Z71hWhvYihBhTbqaCbzGcyIGFtU5nH5rJC/6aN4XDFghGMy7X9xhzwxD2Fnr+5xg6AnB
         Lksg==
X-Forwarded-Encrypted: i=1; AJvYcCW75B0zZWXpAuklwacq0s2LAGrj2h4c5Uao5tOim/9INrIMlDAc02u8JP76Db4llWeKnDD7slthPrwi@vger.kernel.org, AJvYcCWXuIv6s95RTI3x3q7TQsNGfYTZj6jv8DoeXuQ6aG/Ek1Iyuh2PU4sbwwiFnfwaUzbyYSbpTKrauJgHBDc=@vger.kernel.org, AJvYcCXCs47FlW/1XqQxRqgbwETN4lelrHjXyeP9DhmUIiY6sM1+3a3bvL5Tg7oKZLwTqPBhqFdrkUgWOOYXE9JZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7fgXkaXBU5iBI1yeSX7eMa2FF2VmCxuSfXgCrDr6EL1/PRRGc
	72OzBv4ZHThVoCKZi4i6UJzX5JbUcbqIHVgnnckq7Iy+NPhrjeQc
X-Gm-Gg: ASbGncscI91lPMnnU7zYifETtnGcbFdZQbzD5gjRptLsGZF24rj6mxSjO9KAqOLH4Nw
	c7J71IJcWRaMQyYLmd6KNgdrG561rLDScrrsKiJCvnlqEw1pueFmrr6tnhg8z9T4teAz176A7Fj
	InuLL20oRZl3127AxZNMb7XAVXxs7R3Kb7gobKHUbFPfBIt8JxkRRGl/di9BRNErwsPtnilS7iU
	Jp5YdLmxOTzItqGST38sKUdgAf56VFA0caK7jTbPqqNYxIU
X-Google-Smtp-Source: AGHT+IHxiDLn64m+JcKK9Qf9i79XOmBovQ91OHxEqbb9Ynp/lK73w0C3qT61e+OP/hTDQ1CYF8UBuQ==
X-Received: by 2002:a17:907:2595:b0:aa6:88b3:ba4e with SMTP id a640c23a62f3a-aa688b3c0f4mr317323266b.36.1733746178310;
        Mon, 09 Dec 2024 04:09:38 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa69964876csm37308766b.49.2024.12.09.04.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 04:09:37 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 09 Dec 2024 15:09:05 +0300
Subject: [PATCH v8 01/14] ASoC: dt-bindings: Add bindings for WCD934x DAIs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-starqltechn_integration_upstream-v8-1-ec604481d691@gmail.com>
References: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
In-Reply-To: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733746173; l=1649;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=eOIOn3QlgApD/ENdOuFA9hKZGB/68p+jAtBg/Z5OlNg=;
 b=JcK3f33ZOFt0I7tl18mqAboMiWZL/ea8wfYaXQe0umj3DFBgRJzcH6PHV+DVMU1dlm3B4bGft
 5HgD3vGZbTFAhKGiJAE0Pmt5ASHvzv3Ahs1dy+CntmKs8f9enZgr3KW
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add bindings for the DAIs available in WCD934x to avoid
having to use unclear number indices in device trees.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v8:
- remove #define NUM_CODEC_DAIS, because not binding constant
- fix intendation
---
 MAINTAINERS                              |  1 +
 include/dt-bindings/sound/qcom,wcd934x.h | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7700208f6ccf..f69ef5851298 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19015,6 +19015,7 @@ F:	Documentation/devicetree/bindings/soc/qcom/qcom,apr*
 F:	Documentation/devicetree/bindings/sound/qcom,*
 F:	drivers/soc/qcom/apr.c
 F:	include/dt-bindings/sound/qcom,wcd9335.h
+F:	include/dt-bindings/sound/qcom,wcd934x.h
 F:	sound/soc/codecs/lpass-rx-macro.*
 F:	sound/soc/codecs/lpass-tx-macro.*
 F:	sound/soc/codecs/lpass-va-macro.c
diff --git a/include/dt-bindings/sound/qcom,wcd934x.h b/include/dt-bindings/sound/qcom,wcd934x.h
new file mode 100644
index 000000000000..8b30d34fcc87
--- /dev/null
+++ b/include/dt-bindings/sound/qcom,wcd934x.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef __DT_SOUND_QCOM_WCD934x_H
+#define __DT_SOUND_QCOM_WCD934x_H
+
+#define AIF1_PB                 0
+#define AIF1_CAP                1
+#define AIF2_PB                 2
+#define AIF2_CAP                3
+#define AIF3_PB                 4
+#define AIF3_CAP                5
+#define AIF4_PB                 6
+#define AIF4_VIFEED             7
+#define AIF4_MAD_TX             8
+
+#endif

-- 
2.39.5


