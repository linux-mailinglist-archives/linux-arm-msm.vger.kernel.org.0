Return-Path: <linux-arm-msm+bounces-34643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F039A1578
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 00:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 907811F22624
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 22:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D35AA1B6CF2;
	Wed, 16 Oct 2024 21:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hHYxRThH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154181D415D
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2024 21:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729115975; cv=none; b=Un/PcWpLqoWDcTXXQ0P8A2fMQG/JUBz89qkBrBn3+1UzxbDoDZZO7lasSudqoJgGiovs9a6c2vBu1NVX/tMT9yUq56thWXIbA67onY+EtJqXwmIGi56+iZCdc7rpN35aDlPMDD8etJvz61ng+1wsCO7JHpzZCdiwNf4C/rGPsrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729115975; c=relaxed/simple;
	bh=gZ85YJG7vfi8u4FQ8plCpOZj3X/b0SrmcIPg3BAgSxk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qvXW15ygyweP/11tq6dhbnbh82FiJmG99alkEk+aHORlkIydrE7lKVKnRIeGjR4nbKb0E7+fkL6yJeItzngEMztgq49pCIajUuYMUGITwNbW7wIrBkPhvd4bnIrrVLa8aXAbmq+jVYBKk3rXB9mRVQbwQb5LzsKJ2sdIQLkhkFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hHYxRThH; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43140a2f7f7so3101625e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2024 14:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729115972; x=1729720772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ki1tK0lXvAt5fjPsKWDnYQ8CptODlSuCyrJG5QK7fGU=;
        b=hHYxRThHAgoGtSA91y52A02RTY1T6zy7MbeZ74hLr6fiJHHWHsNG522tZU96JksAHa
         uqtvP0qR88MHrXl6CbB4vWar5+bO/VqLkkYJVtM7hd2DwaRHQO4XgutDc51CQUp9JiAb
         aBsosPaek2XT7mOWSg8yTdgKGqOPw7g5T5sKbbCqAzac9PE75fL/qwQbygguMADCdkaH
         AdrBE2/4AeimC9r7PW0eCnIkIeypQaYbxo2DM66WqkLDRQSQJ2HiPt593z7iFvJ10SBp
         mRyw7fVaEV175SBMhQoBvXMWyXinBTOIg5BLY9o1G9hwfJFmRh8LK7e3zFSPgehG1HIP
         oFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729115972; x=1729720772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ki1tK0lXvAt5fjPsKWDnYQ8CptODlSuCyrJG5QK7fGU=;
        b=hmrjidSQ7N3u0yf45XLIXEncfiOHiV25LJFmCinY5qB9B5kjy5QR+A0ZshaTeo1uNB
         xXMEtoTobI8nMZMghOjSB8XPOxBv2THVQRBiV7m1F6LyRXrpKULoCSDYfoFE15bQrJD7
         6//D7fibNA4famKXscqFeeOKtKVQxkdmG67p7jB+0hpg8OHD9gREB4XXfeK0wsGlvHBa
         58HK8JlKvMKmnz23K+fsWzBT6sZEaKmsFQj+agUGk2bzOGlyuo/oLLoIwc9/XBTj8Lf2
         0+0v9HN3vIViyrtJpxJ+xOKPFqxmjx4CEvIuCh5myQ1yzrjj5XUbIcAptBzODyKQCL9D
         yqEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK/0GXt3Nb1plRwGwvP6aa3+oq8Gb6wiIlJus81w5RgbC+Fym/4gg/PJ/JTqVOqOE3lZgmbYn0I3KK2aHb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz34pxO4m9xfsjgu0nGu4uzBbw6U1fvzyti9JkksVQT99Djdhck
	uc14aKSR1sTCLOZ/mQ2njTV3dRDBilgp93Feyax0+K22+ryVvRVKe6joT98hZc7Yfw8DEknc41W
	I
X-Google-Smtp-Source: AGHT+IFioaXXZK1Tmi+xpk2KBU077R3Z41+bL9fy1kfiTTA6z5vvkSfT0PCGZlciKZoWGT4OuQ40rA==
X-Received: by 2002:a05:600c:6745:b0:431:40ca:ce6e with SMTP id 5b1f17b1804b1-4314a3acc32mr45668755e9.31.1729115972185;
        Wed, 16 Oct 2024 14:59:32 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43158c3bc75sm5888255e9.12.2024.10.16.14.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 14:59:31 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: tx-macro: correct tx_macro_component_drv name
Date: Wed, 16 Oct 2024 22:59:30 +0100
Message-ID: <20241016215930.1144527-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It should be actually TX-MACRO rather than RX-MACRO.
Rx_macro_component_drv name is RX-MACRO.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index a134584acf90..74e69572796b 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2230,7 +2230,7 @@ static int tx_macro_register_mclk_output(struct tx_macro *tx)
 }
 
 static const struct snd_soc_component_driver tx_macro_component_drv = {
-	.name = "RX-MACRO",
+	.name = "TX-MACRO",
 	.probe = tx_macro_component_probe,
 	.controls = tx_macro_snd_controls,
 	.num_controls = ARRAY_SIZE(tx_macro_snd_controls),
-- 
2.45.2


