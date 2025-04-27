Return-Path: <linux-arm-msm+bounces-55840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B151A9E282
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Apr 2025 12:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 789F2189ACB3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Apr 2025 10:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FAA2512FD;
	Sun, 27 Apr 2025 10:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mCLo/6n7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC2C2512C1
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Apr 2025 10:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745751082; cv=none; b=BF5Q1zn4unjj+cfoQI/fQOaRrgVpIIQ3uSR1YQDGkCVgKVdfK4/FAZsvDueul3pmYqcCgJLiu+hxB+5o6fcjknjAZY11WbGR4pZkOBtSVqXltY77DYHfC/qtnglrOHD9h8hPh2eJd1cB8MYyAaEVC57osz1WF3Jqqw2DwVOzFeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745751082; c=relaxed/simple;
	bh=VBNyX+A/EB/Cj4qU0XgLHNxhJ97XrYmyCZDdhGUIJhA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=peU5Gsek44jWrJWtmJDn6QS3NRX6wEdxvEGQQiYKDwrg+qR8LhvjY5qYLEwh4LP1NISv0b3ShlXRP514jAgtNTj7jtG/hqbU6qY5soFTj4qvvgkouMlVGTaT6NcqkEC9b6EfpgI6hmM29CUpBouY4xUEVeitXBu7J2xz8ji/ryE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mCLo/6n7; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab7098af6fdso68605466b.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Apr 2025 03:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745751079; x=1746355879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yljTxf0X+Iy2a+Dq+Yedd2V84jdSSx02dCrGHjuEXak=;
        b=mCLo/6n7YcacJpfy8sZkiCzpd5Yq/QVcgQOcktwXnQndQ4AN2/2WHDmER/KUXDMZB9
         McBmeP9g/lDHD2Q2U3BiyKwMKlKyc+AG3UWexEytt0BQ1EHGQORYehIu9z+XV30CWgG0
         3OrdfE3T7sKNqCPFoxJuKsAT+k3e+d4wCIycJiZcbj2+i0yTF66mI7sadcKHbUtqVIv1
         TL9Oq+m4Bzob8bRUwAdif0lSN6Fpcp+t+ev668rxCIrOyTZ27ax+sNvPEnWEp44Rd7u7
         Z4f2CQsvPmgO2RMfL83kbSFrNAxfKgvZoDzVxEbD+DwbiH2N844LYwjEY7Ukfk4AGHhW
         vqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745751079; x=1746355879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yljTxf0X+Iy2a+Dq+Yedd2V84jdSSx02dCrGHjuEXak=;
        b=pTZUBPkOemkWQdAxmsEzR718Ju4yhYuqXUjwVyiBZ026POqsryNMTzPdXTlclTN0P+
         orOMgwRbOcat4s48NivRANLRhKDL5in5ox0vNQoxauZQx1S2V8JmtpkDZ1CQKlSV6kQE
         IB05Jc6fd2SyTfskdIFfU+tKHMMLV7Kak4zDMzUa+WXC/eTD0kO5Iw5NSDkwNMVhWPHx
         HLsBTfj5XQlxUESMVDaylJR2ql5mbT7/gUKMkr4EDGdObTf2UMDb9iCkK+y5uVA/3bAp
         MVaeW9je+rRMxIeNq8K2ncN4MRetqt+Qz/mQtuSZ4aGwcVMferPW/EhtXAYNDRznKbXX
         SAvg==
X-Forwarded-Encrypted: i=1; AJvYcCX0uKhy+aE88SobzIBk1SFYntlYUu+n4tw7gP2R3/nobzq5P17LtLj3USRnPI+9aT05tu4GeknHhclFJhOx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6XocH55mNq9NfaV/3jLs0EF4LYgQ72BCCRMFG8hoWDLC3cPt0
	UG7+bIHHCCZX8k5TU9Ub0IECsThDX8CN4J1H/3GX8BIitoIp4GgIGjaet4UFRXw=
X-Gm-Gg: ASbGncv/LCUYcQ3xptuC/NHsp9Tg6FB4sHlSHbsUHzP/EtqMO4WdvblqadOkXFhQjAp
	3G2bZJ5fIfLgazae17EX1ySRGE2ISvUSMZbYdU3KYhCgV88mRLMFRhHqcJLN6CteNDhflibhc3s
	SdU+82GiqiMr7d8w+9/fAnks3m4FDiL9K79deoyh8dZj5eh5zZIx08qz8/mti8TPbeJb2Qqcju3
	4S1SjKLfF3svJas+WP7oPHEzv37jhndiVrFVg8lue41TDURY2JEzUoK/GCI4APkTtk+/S/gZaGt
	rMc+fglgrpfXQnIMfx3+/+enXQ1LQr875s4Bn/mnMW0s+wkoRw==
X-Google-Smtp-Source: AGHT+IGhMTLffqdEgqGOe3aQqJyYJ+B8VJatnZKsdwxT6z/hpa0miMBIbPX1H8NsL96ToaFl+7ia4A==
X-Received: by 2002:a17:907:70d:b0:acb:7dde:d88f with SMTP id a640c23a62f3a-ace710952cfmr213755866b.5.1745751078562;
        Sun, 27 Apr 2025 03:51:18 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e5087e4sm425679266b.73.2025.04.27.03.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 03:51:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	kernel test robot <lkp@intel.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: [PATCH 1/2] ASoC: codecs: wsa88xx/wcd938x: Drop kerneldoc marker from inner comment
Date: Sun, 27 Apr 2025 12:51:06 +0200
Message-ID: <20250427105105.18164-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2016; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=VBNyX+A/EB/Cj4qU0XgLHNxhJ97XrYmyCZDdhGUIJhA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoDgwZBz05ULqfGRWDmIA3VjNhzumOvxtTsbMlY
 dg+5GjAnS2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaA4MGQAKCRDBN2bmhouD
 15QJD/90D9EKpDVCJB3Q1L4eB3Pe5TU6dT1kGsAhZA+Pqf8oYw+k73PHzJOhdzxDcYw7Jh9APL1
 l0oPIwaq4Ss64RIt/2aX/hGXvBLrHLd0Pr3GtCvJxKa3G/Byx41Tjnu5L8IvKapft0iG9SeN2RR
 ZuH5GgxAf0H2j2r72Gq7SmxRm4T0B+fo3Tk9jcjx+2TExtvNy2/m9g+h1d3kSHGJkdC8yZILyZp
 /61MQ0I9T0hbCINYxg2LHvjmdmaVu4kdCSqTiFrltzPpFCFOfuB7uBNtZUd7u2hnN0Mb/cCCIio
 i/PftL0i2+SM3Qd63HLxjKKZL+28ztNL+e4rStAeAiWl+pUQngfGXKphkywZHjnVivsHmpKgGLL
 1R+N2W+dUj2TEAJnig7cEdtFqGF3EG+6brrpLNziAywA9oCF+V0dd0yka/51q4CKBWUBZ5hsQby
 8SwhWV6YnMnHr7WxQocZmHQNBSXZnT7dgkb9avwz2jg7J6YwhTJ+ZdTSlxhW7HIK9Jb4Z9RzEwX
 YDnrub4G93/Z4Ic4nEf3txXJKLJOdYwt+4QMhE8My4n4S/EVAuG2hWXQLjLqYyYfYx1ivv9fxzj
 tG9wxyJ7FtfBwbBS0kOyhp8H+BVPMPuWphQ1XRpxi6llC85FdFRrffSYg3Hmz79FRGP6w2l7JnC dbEzfqOuSPOcfLA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Drop the kerneldoc marker from a comment within a function:

  wsa883x.c:1402: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504261851.TJGZIvtl-lkp@intel.com/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>
---
 sound/soc/codecs/wcd938x-sdw.c | 2 +-
 sound/soc/codecs/wsa883x.c     | 2 +-
 sound/soc/codecs/wsa884x.c     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index cabddadc90ef..e822cc145250 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -1225,7 +1225,7 @@ static int wcd9380_probe(struct sdw_slave *pdev,
 	if (!wcd)
 		return -ENOMEM;
 
-	/**
+	/*
 	 * Port map index starts with 0, however the data port for this codec
 	 * are from index 1
 	 */
diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 1c9df7c061bd..f04d99c66f33 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1584,7 +1584,7 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	wsa883x->sconfig.type = SDW_STREAM_PDM;
 	mutex_init(&wsa883x->sp_lock);
 
-	/**
+	/*
 	 * Port map index starts with 0, however the data port for this codec
 	 * are from index 1
 	 */
diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index daada1a2a34c..fd6ebc25fe89 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -2085,7 +2085,7 @@ static int wsa884x_probe(struct sdw_slave *pdev,
 	wsa884x->sconfig.direction = SDW_DATA_DIR_RX;
 	wsa884x->sconfig.type = SDW_STREAM_PDM;
 
-	/**
+	/*
 	 * Port map index starts with 0, however the data port for this codec
 	 * are from index 1
 	 */
-- 
2.45.2


