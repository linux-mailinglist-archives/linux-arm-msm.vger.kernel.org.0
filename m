Return-Path: <linux-arm-msm+bounces-40984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B67F09E8EFD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 10:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B45D7161BD7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 09:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F6121638B;
	Mon,  9 Dec 2024 09:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JvwHl3ez"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A99215F6B
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 09:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733737496; cv=none; b=DmKRcZ51UtWQkLTFv2eNTEllc3XLFnX9eJHd++IS843dkvahm3wyu5zy1G+91PwU35MdJzQULWFeKzQkCIysKD3MS8tdDSUi6FAZnd0vPnPpTzU/7cYlvNpomNzN1jAjWQ4K+PuozdImViI4FTAiy/pL0qJycJMh0Qtn1qz32rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733737496; c=relaxed/simple;
	bh=fjb9i990GoQpb8o7S4Y3ba1ibdKhHVEzq60SLMZRjGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OOGw3mW5b73opmAPurBfhycfQO485uzvmixKBn00qW8Uwn7ekpbxr84oq9nUuwG4dlZhvDyf1aB3Yo7kDkAyB6csVe++/d0hLxhsg8FHc+TwkEAKKRK3XBwtQ4ozmfh+01QHj2qex3CaDCZUhfYkFEPNHHw+LL2QDYCbmpRkHkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JvwHl3ez; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-434e9e22a99so730405e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 01:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733737493; x=1734342293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l1sUV7roJsGmgZfOhLBngscTUOda+ttUP/edvvhP//E=;
        b=JvwHl3ezHSEJaYCiyOrpmTuh9tSGsuLKg+QoRQEGtLp7pSd1qQtfKuP/pyu5GV7QIs
         fHIJ7NYZRwth/XPfGa6W6/O/diVe25HcsyvupgkBS0oupeIbQuotxlNBN50xAZb6xTkM
         c6h8syR8eUxmlzF9qt4Y+qu65Bw6UGKbN2WMAxQGRlJ6293fcbg465HZtxnFOYBxlQfG
         fJSIVoVGqZ9ySCXDnrnJefDGM7pPWtsyWon+eel7Ck/2lMKQN+z2JqDs41/10w7qLnpQ
         koJ6njV+VcC9osEbTvuspWlP6fDyYvmnfpi0zGSVv1rSR88EPVSMc5rHlBMFqc3tZeCC
         gfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733737493; x=1734342293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1sUV7roJsGmgZfOhLBngscTUOda+ttUP/edvvhP//E=;
        b=M26naCy3RSlyuv4QJNm7PU1DhCAJ0UGClkWzVh/blKGvO4gOYaTFN0U8rojj/RGGK4
         fhdHUotnhb5r99IEOakKANayeiCwayyOPekbK9j/yANlfXv64anW67tUGwgq7JAZ2+Yh
         az0vyI6maM/YNLgnF2zYWIYAw6iGCE/BdO+fV4CQbfmQFmZFxfTx8Gh97rZurnzmXjdi
         E/qa7S5Jtwss9H55M7zagtohDpBzsvrMhimbTQJFgSlTa/RE51C89FIwilY83dQAMKFk
         7ylkxGO4MdD1mddXZifAwjtsXLxK1h22zzimpG1okbzcFVVz3CvCw3Odhs+19FOq002Z
         6Flg==
X-Forwarded-Encrypted: i=1; AJvYcCVUoi1Ra4Zgaz2N1kZSuRSn629EkYfvgF2iar3TRfiWzRc60a1BWaytWKks7pck6zk1w1KryDDayvCbkZlf@vger.kernel.org
X-Gm-Message-State: AOJu0YzERpWzAbO3ka/PEKst486k0R4nWBmD1PN408c542f0enpsd9sW
	1MR/Lo+pyWujeMvX1ptl3ik2CmJL7bpMX+GWIDWAJu1UVE/trwXb2iD3pDrSpyY=
X-Gm-Gg: ASbGncuELkicbaOlIlBVjYP0sNwO34fNrynkaO5BjzQd5NmjNmG2iFTCdvl32iwAv2L
	P0HaryDKsxt9pTHXmQKJmrSnjyTjeQKZo0A1WvZSmChBINbbH3SwzQy0nTWDLL7ckctglWHAU+l
	xrjsYWtDG4AWULlzsev1xHJKPWpNyJZZcetY08iIKF+S1JSxO3zfQa2BwI05c6AZzTztThSt9p8
	INOb/LpRcyb5x3DeglW1bxksiuXWXdt6Ikbh2lem2HnyPYRVt0orPOiLxnFAuyb
X-Google-Smtp-Source: AGHT+IFfnWuaEEFQ2SCpKa35Hxvbxx4TbEd7vRGr3JaRGDSa3d6Pbtwvg8lyAMELgezOfxR6fP5yTw==
X-Received: by 2002:a05:600c:1c0e:b0:42c:aeee:80a with SMTP id 5b1f17b1804b1-434dded5411mr38198335e9.7.1733737492784;
        Mon, 09 Dec 2024 01:44:52 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434e962028bsm80503345e9.38.2024.12.09.01.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 01:44:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v2 1/2] ASoC: codecs: wcd9335: Add define for number of DAIs
Date: Mon,  9 Dec 2024 10:44:41 +0100
Message-ID: <20241209094442.38900-1-krzysztof.kozlowski@linaro.org>
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

Changes in v2:
1. Fix 'error: "NUM_CODEC_DAIS" redefined' error (Mark).
---
 sound/soc/codecs/wcd9335.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index a2521e16c099..7cef43bb2a88 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -159,6 +159,8 @@
 	{"AMIC MUX" #id, "ADC5", "ADC5"},		\
 	{"AMIC MUX" #id, "ADC6", "ADC6"}
 
+#define NUM_CODEC_DAIS          7
+
 enum {
 	WCD9335_RX0 = 0,
 	WCD9335_RX1,
-- 
2.43.0


