Return-Path: <linux-arm-msm+bounces-27833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE28B94691C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Aug 2024 12:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F01001C20B11
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Aug 2024 10:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B33D14D6EF;
	Sat,  3 Aug 2024 10:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j+cQvfFA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C535137764
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Aug 2024 10:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722681710; cv=none; b=K8Z2FtsOhZbbAWPU7EB9aQ84YmMxkeT44Sj9XRARd+KnAucmjHqrVHmd5P/fe8Zm1TQkJiwrZW4VRn4ZwMZjTa7R92ziv4O9/ow4fajQo3C4hJLwC8z3Ll6xO79xfFz3aHH7gDjQQ4lVMQtPrsFVi5jHo2s5eQgHIpxJkLe7L8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722681710; c=relaxed/simple;
	bh=8swDYCKlHMm/RjEDI1jjvRnoWAi33eYa7CllXV/57qw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YknzaN5zdCOmISbStygZOsysibpeklrqH48vyMsx1PCW3JQZloE8YnThZKv8AVsYi4yzu5WD/3uAPa0xXY5ODQyV0hBDHoEEQqW2kNGbRltMkOnmzFJlDz5XKEV80WluEcuOzuSfvvS2GGBRjkqsy2Hs9twj/thlFiNS9iH0x8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j+cQvfFA; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5b3fff87e6bso6841623a12.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Aug 2024 03:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722681707; x=1723286507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h2P5CUm71nRXIdibIz1zY1EQPaX8kSIUbjLIcJ8FN4Y=;
        b=j+cQvfFAKoUJVj/EbdjFfbDZ23FnLF/JmUTZqBzc22AEzxWPZkGMLcR6XzDFUEg07d
         O9zIzs2j5kUKFy4ZvCjwtu2FehhaDO6I7S7kQzum7SnZLyFJ54MnwaqByrHK6JlcX2ut
         OMcbjcFjepguGzuQY9dsZ1WCZCQe11ARaLiqGMa4u9RM8CIUXQz4yL0abDTqqzMIqCpz
         VHTy/TZB0p64pz4w4oJFAS4YWHVLVjPMoHIYJm8D7LejjUNW5W5dLWiA4xD9yWN5yMJP
         SRyEMFv5jv+FgfFXr43TBzRij5EpBLQsRM/iEN9/w1ClINQnnw/+opu5oOn/Ju08u3OS
         3sFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722681707; x=1723286507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2P5CUm71nRXIdibIz1zY1EQPaX8kSIUbjLIcJ8FN4Y=;
        b=JmMjw2BHw94A/wq0GXLUKf4KvfuMrX55pDCD5u3ADyBZAHxiKHei8K+q/pS6OSFteb
         jIdVhSknITnMnjKARUQrHmKp1vJKPMFHOYbqcxQGaIL2LlnE2JGUdp1vAl8qP3rU9aos
         8S/wS3ulpEq61taTREzwZzpyND254e6SXn+nhIIkpHTjNg0cLDh4z21JUByhZ17JRpWE
         Mz+Ls8ytX7UcJzm3DSAfz1G+C+4LmlaF7ijxOLqR4/oRILqBxch6G/dJycoxW3xT9xK1
         55bQx2P8b1NeTZuXBs2yIvMe5f6dOdWU6RUiTdT9FD17m2Hlf50mK3MRyofcx+Nnk7L7
         cAeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBxWYu/DDQEkmpM++YvNAVtzIAblcj4YDrrDvo23ib9gXhzqo5HNhOmugSrBG6IRFUkw676wSXioViA5fijaCUhlBJNLemtOwWuwMICw==
X-Gm-Message-State: AOJu0YyY59SGLvVxhfpigAq15i+wKYNW2VCiucNHr+Tv9R44aYdv69L8
	Kj7YnW7WJ4UNGSITEs81cYHIapa5zNgeMqkhzX8f86ON3pIN0qBJ5vIJaAW7Uvg=
X-Google-Smtp-Source: AGHT+IGx8JIglmqEtvVOloITy2p1V5U6PesAEG1DHceXHVPF+dkLXz1ocl5KFlVXTMxUWNwK3835aA==
X-Received: by 2002:a17:907:6093:b0:a7a:a7b8:ada7 with SMTP id a640c23a62f3a-a7dc4df97f8mr402428566b.24.1722681706827;
        Sat, 03 Aug 2024 03:41:46 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e7feecsm202086366b.176.2024.08.03.03.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Aug 2024 03:41:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 03 Aug 2024 13:41:41 +0300
Subject: [PATCH 2/2] ASoC: codecs: lpass-va-macro: warn on unknown version
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240803-codec-version-v1-2-bc29baa5e417@linaro.org>
References: <20240803-codec-version-v1-0-bc29baa5e417@linaro.org>
In-Reply-To: <20240803-codec-version-v1-0-bc29baa5e417@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8swDYCKlHMm/RjEDI1jjvRnoWAi33eYa7CllXV/57qw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmrglnQf2eSPxhCPoW50YyCE1b+UmchLkcoNa1+
 dvwTlj910+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZq4JZwAKCRCLPIo+Aiko
 1VfsCACUeTsaUC8cUzv19Lh7pPQnhShgpW6Nj2314n5dvpeCHe4zpggfLbi8sxpB6rdB/mz6e9H
 ILm68xJuIZXE+HtM5m0JwHucNwU7sNeTWqPL/vhcgNKyH4jZeoyAHwMYutMqkeXoIuspg36KcU4
 nMqEIszCdROdPeJ7pzaXs7pP05lW67SDv9bJi6u4YTCPIJuhlMVcpEl7nEWKHJ8xbRsDghHhf0T
 sQM/WWIddmjWKwEG298mvWjM6wsDDjfMLlSMkmH65C+EZctbnxD+EijiFMdjHhpRN6wJ0qUDUMr
 OhV4HE4+/VdZBtnQLKlXKDH9paR4HGoCR8FGMNvgSJPsfQxN
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Warn the users if the driver doesn't know the codec version. This helps
in debugging the issues with other codec not detecting the correct
version.

va_macro 3370000.codec: Unknown VA Codec version, ID: 00 / 0f / 00

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 sound/soc/codecs/lpass-va-macro.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index b852cc7ffad9..cdc090418d74 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1483,6 +1483,10 @@ static void va_macro_set_lpass_codec_version(struct va_macro *va)
 	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x80 || core_id_2 == 0x81))
 		version = LPASS_CODEC_VERSION_2_8;
 
+	if (version == LPASS_CODEC_VERSION_UNKNOWN)
+		dev_warn(va->dev, "Unknown Codec version, ID: %02x / %02x / %02x\n",
+			 core_id_0, core_id_1, core_id_2);
+
 	lpass_macro_set_codec_version(version);
 
 	dev_dbg(va->dev, "LPASS Codec Version %s\n", lpass_macro_get_codec_version_string(version));

-- 
2.39.2


