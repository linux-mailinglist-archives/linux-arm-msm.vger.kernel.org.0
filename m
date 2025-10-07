Return-Path: <linux-arm-msm+bounces-76136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E6EBBFF4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 03:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B9DD034C8E1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 01:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C2D212575;
	Tue,  7 Oct 2025 01:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Znpi7wxs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81F51F582C
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 01:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759800377; cv=none; b=SKyGNo8uahz8nyNbDUKbxKJ/E25PO8Kn+DPSqQsMNQKfsGQ/w/yhSNNEJj2oSN4i4HEKjPfRRDTWUNEZ3p6s+xwEHzHJVt+5OZTWIfmgKwGoK0bUKo6M85N8GrQAuQHgmKGdFl6RDtF4QRkpWjaeFBK2/tb2LQGtPyRubqaRtYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759800377; c=relaxed/simple;
	bh=6ffmg2XA9jcgewH/j6PAyG0UVV/H+4UiGg8CzD2bW8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fRliSywT1r3s3cUJpV5CRK99Ae0moGinbuJ4nDQtF/yxlJ7xV/UJkXIZMamM9E9MtcVz9lzZj5Lps8mM/3rvj+9A++3rYLpTxiA4HxioAXPYjPXyHHMPkTXiI797YVmpGJVmrSPARufMUeFlM7hOZsYufZFVdz/T8ciL8dmFcjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Znpi7wxs; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so4218642f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 18:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759800374; x=1760405174; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J22zbKLN45yOF238j0MViKbz+/v5EiBK0GTdWMuYd70=;
        b=Znpi7wxs2kbcUaWQ+jFgaL4N6Hn5p5tavSJ1MRaNg5J9cMW/DbqoHQe9xUFgBkWwBh
         +21cE3mbGYvS+tU40+98yzwcaFbC7V3Gfj6qXrvqB5xmgsxLD5fJu0/cfMrXu+dBgujN
         Jt35kOvL26skg4cI5BxJ9rfmwlZ+7y150E3XzlhvJef20ITlcCZztJi6bykLFj8tJdR4
         1Kt8DHDObmq6vQauBgEqcQ+ncdxtnVvKmPu7WA+RkrAaFkkBVmFKF3JV0x4uMKmG3ok8
         rUrcr959dg4qbaQgJYIf08Kj4YtOW6LvYJA2Np5GbafOMdc0kUGZ+jJg17TxsDAUKVe7
         4KFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759800374; x=1760405174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J22zbKLN45yOF238j0MViKbz+/v5EiBK0GTdWMuYd70=;
        b=GP7Tbm8rybXtgTiFzDQUkTVt3SnQ+9oKyYiTDy/u78HAn1VTAGxNfy0kM8mmYMuQ+A
         ZTx4tTWe6E+tJ6qsQ+lzSemng2cPVayKBARo2HYAH1cbkaFlpdWv8uFFPuEzgvOxaXWT
         GL1OXZ0KqRo4s/a7LYVRH35hxVZAuzaSu+3lFjoPJ2kDvd+DVlvIIhBkep4+RdR5WIH1
         l3v+32oaIS6ITDjcNgfNJMGWwwTmaHIYrmK3I+PkDglR0wwMs8CvCd+QJen4KfkUQhqT
         lb0Jz5JHAMHFHchXVe9lQH/s2jPsJMCRZLijR0GsTziWBlPBIfSacwxit8im+gBumaEv
         hUUA==
X-Forwarded-Encrypted: i=1; AJvYcCX9WuaDxKddKGKOOCNEoIgr2J5xbsrG66DyoElz3cF5NK3o4m6C4V4rCxn3t2fGSvMQtGsasNHrFAfzbRrO@vger.kernel.org
X-Gm-Message-State: AOJu0YxjsX6iB99kMz4zkL/u4np+aXUg8vOAIsSs30rZ8781jA6V/hAQ
	xyjaH3/SCx1nesn5PgOVCjL8KDeXnOK3G3S/q0MzIVKP5VhbZg/eB1752aQ6GdlOVic=
X-Gm-Gg: ASbGncvx85h6Gx7eewQPIyMXh7sc7K8scWHxKjzgM49Q3iH7uP5TnGkM0m/t+LvmkqX
	DXzT2tFWsvMb2bXDpCNclxRONVNfIDJanOgQne0i0w6PN0RIuoKYCN8H67QspoAalsnQVXoX1nD
	1OEuSgi+3uU0gczEoJN8Xvdzua6bmbhSYsv33XXfNDOqDe1qzZU6MmvrbAM7fRRlH8Xdo1sUhkb
	M5s3HjeJ2DlhPdoY00CxG27oUvc3ZL7PD4MTzCPbs+229im52F6Ru7Wq2BCxngljv2taABDWH8v
	k7N5qnwWrHQ/zVTrwRB0x1NwYB0qOmmB+ISohqckwNhyPLZB2GEYqDxbskchOVYnh0osTXprFw5
	u5YGEzi7W90KfknVvzgptqkiA55klXRIrkF5K0mkxZ+JUeexJjZitm6CN7S5EY7WKjbrZg46Zcp
	k/qg==
X-Google-Smtp-Source: AGHT+IEiz856XiSIMY0NkShrDp6YxZCYEJvBvhcMBG4LXiiI67BJKwpsD2QzWSuAygSdYHT/mIao1A==
X-Received: by 2002:a05:6000:2082:b0:407:7a7:1cb6 with SMTP id ffacd0b85a97d-425671c612cmr9480955f8f.55.1759800374073;
        Mon, 06 Oct 2025 18:26:14 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:22ae:baa0:7d1a:8c1f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa2d52a71sm7410915e9.1.2025.10.06.18.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 18:26:12 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 07 Oct 2025 02:26:08 +0100
Subject: [PATCH 2/2] ASoC: qcom: sm8250: add qrb2210-sndcard compatible
 string
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-qrb2210-qcm2290-sndcard-v1-2-8222141bca79@linaro.org>
References: <20251007-qrb2210-qcm2290-sndcard-v1-0-8222141bca79@linaro.org>
In-Reply-To: <20251007-qrb2210-qcm2290-sndcard-v1-0-8222141bca79@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

Add "qcom,qrb2210-sndcard" to the list of recognizable devices.
Use "qcm2290" as name to let UCM to use it later. QRB2210 RB1
and other QCM2290-based boards can use this sndcard compatible.

Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index f5b75a06e5bd20e00874f4cd29d1b947ee89d79f..bf71d9e4128873fd956750e71311a357d60099a8 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -210,6 +210,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 static const struct of_device_id snd_sm8250_dt_match[] = {
 	{ .compatible = "fairphone,fp4-sndcard", .data = "sm7225" },
 	{ .compatible = "fairphone,fp5-sndcard", .data = "qcm6490" },
+	{ .compatible = "qcom,qrb2210-sndcard", .data = "qcm2290" },
 	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm4250" },
 	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
 	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },

-- 
2.47.3


