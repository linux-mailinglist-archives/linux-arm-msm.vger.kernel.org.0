Return-Path: <linux-arm-msm+bounces-41047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D4E9E935C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 13:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA1D71885B5B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B782D224898;
	Mon,  9 Dec 2024 12:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRuGZS0j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D60223713;
	Mon,  9 Dec 2024 12:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733746184; cv=none; b=HkOrxAFOLBM1OGzXgHEV/c4XFeUQ4C6jYa0rtWobgqdT2AF9lbcQohnNvMgyqZsts4rlpZYjIaIt90nJfshymvEjJ1eQLeRqWzQRxZGOztIrkNxMmV+k8Gao7eiy0/TOWoh1VxAOWLln/qhkgMjNlNY1lpCYcKt5dyPAZymlTQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733746184; c=relaxed/simple;
	bh=AkxJa9gm+QAzj6Sm1R/LAYObDvk7bZvdOrvTbAAam9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H0fmWYubiRRSTvbBdqUjMXibbXk3CW79EmNzQbY7RRHEoNb6v+9z5EV9SkYaVi2KPwwvWRw5vW7NbAmWHRLxCOzlJPgLoYn7pUAuutN4HZwLJx/vAf/XZpf8FijZxyh1O2QKjaFWqkkTrR0/r0AW+F7hboN+Wd8UpveELl6zf2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRuGZS0j; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso573217066b.1;
        Mon, 09 Dec 2024 04:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733746180; x=1734350980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bN76fDDDd4ByEAfIYdynyJ7hXuJ3DLoSmix7bYa4BD4=;
        b=DRuGZS0jQuiFAeb95y8zXPAtsmKb481SGev3uWZCsq4QJ90Y8b4DbQc4ZFx9n1mK0o
         tI11zhF9NI0t9xDIx5Rp9bC7eef7z4sNyEjqsyIjSKt9RnJ/aqZHmbJIZRNCcyYfgicx
         CNBIcjUYIj9YoT9BaYL52FcPCGLsbCUpxDwoXS8KNfttWW1MqzqpAmiFZmp53MarvKg7
         0VraZksKosNL514dtBAbimhRHml3dz0mFpm3GXmex3EPQ9G0yGam49qJih+p9QSBm4rf
         NgN/xRRfbdPMcLNAGEXBwwcNqntULfSxfhJgBrCWXwthyzQGsPVRJRN1CD+T59r9Oszp
         fedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733746180; x=1734350980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bN76fDDDd4ByEAfIYdynyJ7hXuJ3DLoSmix7bYa4BD4=;
        b=Jqv/SXH+WnttvEAvkqA7xjdkxoM4m4Rr0yRtrg/IStOKQipMOepnVbPacxjE/DvDNI
         o9RDEj4PiMNpYqqQdjREI2KXJjjrHw72y1qnafQzDKVOpupeGqQVJfQ9D2lSxPWxrxkf
         Xv1f0bLqYGMfawEJrWU75Bk4FdFxlm254tBIhRjTz8NWWYrUFkX7BIrl1OPpO5OeW0dI
         c6mxQs9kN9ANs1o83omafDC1FFhWnma5ta48tLd8nmUxRA9aSJ/64plNDLRIoNp0vqqc
         GX8d1A2lbCBb7xi1f/nJHS1bXtXuIIvr2veUBdvrTu9eCkvvhnk2LMvWxYrPV3BSVI5L
         g8gQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7SARL/ngB9sYEg8mFSfish6AR1zvZWRikry4R7J1rTGXvnOpkMJUcVJGOW3DiAiTmXzDG5e62x4AWdOKQ@vger.kernel.org, AJvYcCWHny6HGduKFr9xQpXSNELdges4+nI+cGY5Mbg1tvhuwK0hSlwZrsWh1FRFcxw5G+03b+i5BFVLrCfPs3c=@vger.kernel.org, AJvYcCXFLwxgbeF1VaGMCLkxHhsqufQKE/QZP5AyghzXBH9aqrCaHyu6HQrfXL1wAFEV/l5rc33bkMSf429A@vger.kernel.org
X-Gm-Message-State: AOJu0YyRySdhfr14jmd/v9RLR175A2x5mX2ECuY9y9J+kj7IeObZKUnn
	zaS4KUjmbYc1I8+fTLMj7+NpZRc+DYMf7FcM6ZTwG8hXwT9A0XiQ
X-Gm-Gg: ASbGncuxcgl8U10XbIEHuKA8QNkldu1ycQeff94nHzpiZqBAXIHleh4YcmhMA+9yO6W
	Ie6QeqEfXwbJOVWakgBFqCk2ZqEKXnk1Dg941BQGRUQwg+Ox/rPxAgnxE4RkGv4vYIBu+skGaak
	yvQ5fcdFVH3KF+qpChWdaQ/+4ouEz8psLIzE1FtrF/0N0X4kO5OebMNsq5Xa/BIvFBizOxIIvQn
	50KlVnUDbfuYG2T90bZPXOe/M8CGDs/QupJFALKBhFREHGz
X-Google-Smtp-Source: AGHT+IGjZyroqY0+NfIlv1yUCNLJXOhov1rW3il7vsd6V/ggAGAfGH89kDo8PKNMu4KIGVWuDgc3Ww==
X-Received: by 2002:a17:906:2189:b0:aa6:748e:d20d with SMTP id a640c23a62f3a-aa6748efc47mr548934066b.32.1733746180181;
        Mon, 09 Dec 2024 04:09:40 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa69964876csm37308766b.49.2024.12.09.04.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 04:09:39 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 09 Dec 2024 15:09:06 +0300
Subject: [PATCH v8 02/14] ASoC: codecs: wcd934x: use wcd934x binding header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-starqltechn_integration_upstream-v8-2-ec604481d691@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733746173; l=1288;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=AkxJa9gm+QAzj6Sm1R/LAYObDvk7bZvdOrvTbAAam9E=;
 b=ND2IvebE9Ede2YkIvAAdU8v4bxHegGZqKfeEOqFp0Z3+zv34ca9qUUlmw7Bun8wZeTq5c+5MN
 QtRyDf12dOoAjUGYVybKvsulwe43He8tGNefy+oY2LKl7Bt0/+nqhAv
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Replace AIF* enum with binding header include.
This allow to get rid of mysterious indeces in dts.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v8:
- add #define NUM_CODEC_DAIS
---
 sound/soc/codecs/wcd934x.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 910852eb9698..dd0cda394bf1 100644
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
@@ -307,6 +309,7 @@
 	{"SLIM TX" #id, NULL, "CDC_IF TX" #id " MUX"}
 
 #define WCD934X_MAX_MICBIAS	MIC_BIAS_4
+#define NUM_CODEC_DAIS          9
 
 enum {
 	SIDO_SOURCE_INTERNAL,
@@ -434,19 +437,6 @@ enum {
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


