Return-Path: <linux-arm-msm+bounces-40456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 272319E4FF5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 09:40:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 016D816534D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 08:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7B81D45FB;
	Thu,  5 Dec 2024 08:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XLvQM6vG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EB71D432F
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 08:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733388030; cv=none; b=QECiyHMeZQMfUHVUJ7sK48oOuGAGF49b6I1JE/k0QjYDKEqNwAqLF9OcKs+7TOP5Ce37/UHDBDTKheK1Ds5rU9He8J97w8kuFomBajXi//7jEWB2JJkaKKhxbEQzl07RUoYA3LISpnO3kUumwo+xKhgq0Kroj8XTMauY9K4m+KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733388030; c=relaxed/simple;
	bh=xjXR+zk+M/gbXTMjCLEiAICwQMABoaPIj5xLhMiEpGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YoBAFjI9/g2PMn1KLKuFZPuBAbNRER1CRQBhFTJXqN+CBKPe1BfVByxRde3AVSZpFd6j6BlFHi5lFJF1hqFTQL2SR5CK4mCPXvNpPVlyM7fqKtZ5XBew59Hc+tNuOUIb1g/D9q/usTV9UwKjI4k68Ev8d1by8Ul23EXmRgnvO3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XLvQM6vG; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4349ec4708bso187825e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 00:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733388027; x=1733992827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DH+J2UQA3VOyjrU/P16pyU+YqVrTV2zl0tHrALJVR1E=;
        b=XLvQM6vGdICz/PvnTSce5Qqrors0BfOzfkuVAwKLamHvQ6+JWBS4ICkJpob+HeU327
         VQ9BcAA7gg9dhqkima6HTs+A3HrCbRu2ul4gJdW7u3kqMbwTJq3IDsl9NnkJWKGdKpIy
         ZgTHPTfyq0oRPn/Jo4puZ6P28Z0S3gLmzJWejK5k8g+ROP75oqn6n9je1cq9PgeBoKW7
         5CQ6NSWLheJdMTDV8mTXejJ67sbEfX0CqERc+6AaczTfpjfLW9XyN2rfYkWiHcGL3XP2
         9WKEoB36/4QqhcjHb7Sp6icO1H86lE1/1vzdzQo6j888k8lOPZfIOf1U3MmFClH4B7ar
         jxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733388027; x=1733992827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DH+J2UQA3VOyjrU/P16pyU+YqVrTV2zl0tHrALJVR1E=;
        b=EGpbeJIzjZSsrQIJUCtuBh/wcrHAa1i8RJe9gElfg0StlawwyncFe9mupS0enjtv/5
         jwHv34HnqIoUBoBJ4ZXIEB07UsnPhuLEM2Z7RNYhsj+vgrkULZsfz0fnzHibWgLc01WM
         PJhFkUatYII4SvRIzBGYLyVNlXlTEhYXzG5feke5eXe1DH61wBj3CDtFAkZ5ObaVYIJW
         cbSLMmqpv4hQBPPQGaTyYjawJx2DXN8N4tCFCpgxm9iMusYBsW3mMCmx0iPeE1EJ0d9I
         NW3GiXBcT9BtbCFYyXJuzRCvbaxdGjukL6wKu0bpYSnkjOqG1MKVa+xaPSNVjltOscCr
         OSIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF5NpCXI4ijovITbBM/wyTzJQMybvdaH6HHAIPqa+s7QDCEQs3Eauk6Kl1FjDZKUe+VWRvpuzTPHV98nGU@vger.kernel.org
X-Gm-Message-State: AOJu0YxZVDAR6msar9noyVY7sodtzr53/vMBUxnKzlTrdYrYuxNGTMZc
	JUByKm6vlW9kGtSk0eI35Ozc7Dro1xs5J4vxdS4w5GxS3NmN6Kv9Rfg4WCKrWxb4FMYAo1z95rM
	zdYU=
X-Gm-Gg: ASbGnctqpnDM2dekCnVlmIOA5vm5uUbe0iy62XqITYCkLQoCnvqzdFdBMyYRRmRV+GR
	Y5lDd+HLrPgHOpJ4rZmOhwVHKuhk8Xijr4Zvkhrms8HOmJAciUW9x2eK/GOIzivHTa09jca0Kkd
	DAe3DbqeRWyhEB28CpMxKuK021vweQ0MIFROrQdSC8gVvxXpQ6oY+pjJcR/ACnGcc2upStzSzOo
	fkA+n/TtI2Zp+YVI8eo0Ysaqm1pIUG3pABfX+Z7KpYUOfjQ4arClM717kdCuLRz
X-Google-Smtp-Source: AGHT+IH5z3TSEXxivD/BkQB0gvwva92E/y7Ua/n01z4CyjTb5eBwOSqHS1jSJiEwgXjn4T4axoxYhw==
X-Received: by 2002:a05:600c:3594:b0:434:a1e4:d32d with SMTP id 5b1f17b1804b1-434d08eef18mr32429525e9.0.1733388027475;
        Thu, 05 Dec 2024 00:40:27 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0dab9esm15935965e9.22.2024.12.05.00.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 00:40:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH 1/2] ASoC: codecs: wcd9335: Add define for number of DAIs
Date: Thu,  5 Dec 2024 09:40:20 +0100
Message-ID: <20241205084021.35610-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Number of DAIs in the codec is not really a binding, because it could
grow, e.g. when we implement missing features.  Add the define to the
driver, which will replace the one in the binding header.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Dzmitry Sankouski <dsankouski@gmail.com>
---
 sound/soc/codecs/wcd9335.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index a2521e16c099..d2604da619f6 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -159,6 +159,8 @@
 	{"AMIC MUX" #id, "ADC5", "ADC5"},		\
 	{"AMIC MUX" #id, "ADC6", "ADC6"}
 
+#define NUM_CODEC_DAIS          (AIF4_PB + 1)
+
 enum {
 	WCD9335_RX0 = 0,
 	WCD9335_RX1,
-- 
2.43.0


