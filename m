Return-Path: <linux-arm-msm+bounces-27035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3E893C0AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 13:24:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F2171F2214B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 11:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0DB199236;
	Thu, 25 Jul 2024 11:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SjY0E2H3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88088197531
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2024 11:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721906639; cv=none; b=n0XD9V+VZJgzm0+Ql07FJvladdTaejcA7Jr4KXxV1dssEPupwTzyv1CZnASGaj5mBWDg/BvC3xCF0NAnPPZ8fJCPJtQxNPtRUhxUyXlhQOMBNJWbn2MaF/ZzDPU8t7ms0MzLxLZNJ7+EknBjprkTjnMOtXTFra5XyJ8pLLCTVs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721906639; c=relaxed/simple;
	bh=NSh/MxvAORTdf3D+7kwYTnS9ComIoDJYQPbBNWGeExE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UZhlH5zNRqZ7sSMasiCNEwF95WD/Kx/wpUk66lpFkfs1DLqMB+Vhkoz1ew9vBR9EyrPWMMhNTfukUrpEOASmcM5o2EernogaMNgvzdrtgpk2Qy76NualWyfYBZ0C74+Xeanh1uN//FG/R9U5RX/TyOqUsY9fHS+QCMOOKmCpCTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SjY0E2H3; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-369cb9f086aso500099f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2024 04:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721906635; x=1722511435; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eyGKLde31br6MPKxdeQh6JIrl8xN/p2NTzkYMLO5nKw=;
        b=SjY0E2H3oGYis/AhjxxRGcQIf25IKT/BIZDq4MKce+qFA/Xn12oKeVfiMVbRObuW4v
         y8AKAiK7u0GSFU770w6iuOhsJSkX59TwDwQQYACsUpS2r4Uum3NP9jYx88+HR+iEeCWy
         Y0NhTLJbh83Cyv/Iexd9IkUqMAwvEFOUxCUDX667BTj4sL2wG5pBIZj7sDJCCb+1NsLD
         ovSNDdpK73BAi16ERhuC60UCoPA8NO6n2Sod/iC/bNiHrWAbqaLETO6osiiK1pfxRsuQ
         ouAabMid4D1A/UPte1JKGyVXNxrD3b82u4v9j9U7fLANdCGcbzfZKoevUDnc9KwCHYMc
         wFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721906635; x=1722511435;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eyGKLde31br6MPKxdeQh6JIrl8xN/p2NTzkYMLO5nKw=;
        b=Kf0bRnFrPK+IVDI7k/2x5krEgK3Mnhr1eQTVFy9UnfKGm9I1ttZpyKSXxeqauBkNDq
         ivCkKuysP8p6w6ekhswZaF3Zf2CNpj5wKuuCfUkiX+USQCfRXnhfHGNHQdfvqL/uMlMV
         6x6QDziYE+MMpTqLNfYCyq6YrZj5nIQZi1CuZuECpR+1pIEroC2AGRW2E97RYuZF/oep
         Io+o+tEvQ6imYEx0T7M4RxAPDXK9OQdvJAm36jaSO7nfpEXz7e8WYaGtEWU8Q9Lt5ZQC
         dMjcnUCKr786jSLVWQHxXDLa+KiEaZaXphmnprG51tmJ/I3xD3U05didejny5XuWILms
         lSeA==
X-Forwarded-Encrypted: i=1; AJvYcCURbMvBUrD5CrPAZQx+WEaVS6vHDo0iJLgL6Umo23tgvi3SWgqDTobJqn9ajcsfAsZPNR3chvLughXoFY4/Z2MA86FjERz0mnV+mWZGzQ==
X-Gm-Message-State: AOJu0Yz7V3wn7pMxtUgwwte3Mw4BwMfO7D71ofZRh39PnzFmLM4rqhrI
	EHrY7S7Oi6ShOmvM6exiEFqDxt6IFN9uoJBUUjOiEKOewatCy3L3SLqw+n7fE6U=
X-Google-Smtp-Source: AGHT+IH0c7gMfrQLIwTABjNUwrYJ9IQQat1tC7lPc3ehLehAhoiKKOhHkiCuOIvK05iQiXh9M03jCw==
X-Received: by 2002:a5d:630b:0:b0:369:e72c:876c with SMTP id ffacd0b85a97d-36b31b4cc7cmr1798999f8f.45.1721906634807;
        Thu, 25 Jul 2024 04:23:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367e072asm1823607f8f.42.2024.07.25.04.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 04:23:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/7] ASoC: codecs: wsa88xx and wcd93xx: Soundwire port
 non-functional cleanup
Date: Thu, 25 Jul 2024 13:23:42 +0200
Message-Id: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL41omYC/x3MQQ6CQAxA0auQrm2CE5HiVYyLplTohiGt0TGEu
 zNh+Rb/bxDqpgGPZgPXr4XlpeJ6aUBmXiZFG6shtenW9qlDjiz4CyYqBdfsH2R3/gdKRzLcZSQ
 ihZqvrm8r5/r52vcDOQVfOWoAAAA=
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NSh/MxvAORTdf3D+7kwYTnS9ComIoDJYQPbBNWGeExE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmojXA0ogIB0dmQNF6xpdWxrV44thmzvsZr5Xnv
 598mvqufVeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZqI1wAAKCRDBN2bmhouD
 17AQD/0ayevlV3V1cUR5xC1FkgYqZvKtgx2cr9+wRs8B2RMSi7PoGJWnzBQfHRKk/RwbLRYdVBl
 JgD4WxZugWPCIJYAmcwg/VShivK3yjjaL7sPVtRAGPNjWRmeOLXQekT7LYIJ/LacHWX/XJZLsoR
 sMDj/iXpBsPdghG70BZj5Ev7g2htpIiP73TAl1BQX6Nq3ENKSt9+sQ6ODc0nZ+femMab5j9AZyJ
 kBwRwRPWJCST+bYRAXh6TN0Jtd7awyY8zbxstCY91dmTzsgNw0u5NqMeo20yTM3US1fY4FCh0RO
 Sg6V+3xaUCzFw8BnuxP6jDS3UToSHTbVmzsT4l3UdaG47oVHXTANN0u/3oBaQRMSN9l4A1+3ISQ
 VL5nULVEVlwW7qwjdLQPzUrobPZM1tfck2UAuIyffiRONTI/HKDxLD88iDGpQ8pWPjH4jYdo9nY
 4gBtfZG8thqPRsa0YNTL65ux2QFlTKyU54l0KFit4Ess1YZL+OjTTlDtVCliiqzSLqFmeR+CySf
 UpKw+MlWtriu8sEhX0ZgvUvw6vwPdgLlzWFuVYEFzdtMAKnEfIOLPzc+pQA5RYkhT7zClux3x4K
 W1uQg+bD3eC9v9vFiLlw8j9+ZBLfWzmpiiJPUF6KcY0kuPeVKLyU0EnFHQo6PkStWnNi77WVyZf
 t4Qw1sJQrdSUVCQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Hi,

Few cleanups to make the code more robust or readable.  No functional
impact (compiled objects stay the same).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (7):
      ASoC: codecs: wsa881x: Use designator array initializers for Soundwire ports
      ASoC: codecs: wsa883x: Use designator array initializers for Soundwire ports
      ASoC: codecs: wsa884x: Use designator array initializers for Soundwire ports
      ASoC: codecs: wcd938x: Drop unused defines and enums
      ASoC: codecs: wcd937x: Move max port number defines to enum
      ASoC: codecs: wcd938x: Move max port number defines to enum
      ASoC: codecs: wcd939x: Move max port number defines to enum

 sound/soc/codecs/wcd937x.h | 34 +++++++++++++++++-----------------
 sound/soc/codecs/wcd938x.c | 18 ------------------
 sound/soc/codecs/wcd938x.h |  4 ++--
 sound/soc/codecs/wcd939x.h |  6 +++---
 sound/soc/codecs/wsa881x.c | 42 ++++++++++++++++++++++--------------------
 sound/soc/codecs/wsa883x.c | 42 ++++++++++++++++++++++--------------------
 sound/soc/codecs/wsa884x.c | 34 ++++++++++++++++++++++------------
 7 files changed, 88 insertions(+), 92 deletions(-)
---
base-commit: 66df68b9536e7465aec703733ea91ca39b787ed8
change-id: 20240725-asoc-wsa88xx-port-arrays-c58c96cd888e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


