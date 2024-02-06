Return-Path: <linux-arm-msm+bounces-10018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C3184C0EE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 00:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D56ED285FBC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 23:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32E01CD26;
	Tue,  6 Feb 2024 23:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PxjrHLUr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C911CA8E
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Feb 2024 23:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707262435; cv=none; b=oqKQpXTHdNZDOp+OuYAkyrs8ZxhwNEx3Q/UPjaUMfpxgOrg7IFSK3dLPPCTa+tiTgPz77NAYty39m+7/zpeCSSAvEu/8dM6s5KwQchkLXFnYOzFByGGHpM7b0qTq7y0TZkVjAjLkjf4W6Bv9o7hbrMq963DPzxtLbsCMvEpavO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707262435; c=relaxed/simple;
	bh=uUa/Ho3Wm4SxUj+BbGgsm/fyqzW+5eMAhtSXlwrvm0M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JqrE+j/inGdASbYA3iLTIk8AzfuUzBxH1kuTygk1tZvDYiJbvP4+zehQ2S5OGqSEpB5iBNAkSL+ATsuXx6rX33lQMpFAWl0Ut9RoS+pmRhJy3egxHXA+FuU6xOKXKt6CLqKciLWaUXGaOdYw2TMaj7F3aS1ji3hPOwrx8m6IGMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PxjrHLUr; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a38291dbe65so3426066b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Feb 2024 15:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707262432; x=1707867232; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J3t/dCk69ENxLEtiFl6GrgXJweCO07ULmDgCmo0QZh4=;
        b=PxjrHLUrxUCNnGAcER0Beix+E3hGnNHyG4frZbI7umIFj2Xx61uFT8EygK4c0tH5hf
         7vJAyfI4iQxa1oUC+gSugV65SgpvGbGSbDxG6fhgc8GoMrrdtCk/25leDP1pqlUpuYwR
         FDA7xFNs8SlbJS8hi0vwuRFjFTVgk3vFMplC7XxIMT2sNgiBDp4qjVc7HGk3tf7tpdPS
         ooz2/J7pAyzc6rssAp6HqoXiCEfQPlX3tYNd2VOYqJ5pI8Iu/B5HBYUMEDZioKwKyR/1
         MWF3Edok2l39symWv0QduFymrIk9L0wWNEiUyrT2a60L3Tx/axm0/CG7fGPxXSErNevi
         7F4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707262432; x=1707867232;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3t/dCk69ENxLEtiFl6GrgXJweCO07ULmDgCmo0QZh4=;
        b=rHlZKtXclqFORrEckqZaY2+nqmQ5GIHPp1eCpyuRS2xFryxQd5R8qwRfMtSvHzs1Fa
         w0Y3jEEwOYnuXcOWz1KjP8k20K8WUXFF9jtbYgLmTRf1pI+bgaytSH3x3lYYXSRiFv8N
         5oyOPSDKRNkvE0fCgDyPYNWXJdHNmokkoPGpYo9xo2nMmM8Stwv/BNwVuOrcQqvWgVmV
         xdSHPLDjW5xj6Dgl10f7UmDu55ujtYjZpNVihzoiikuC4u54I7TkCW7cuccAs7IqxhTF
         rLm2ToxkBrgIKmBZ3SG0ehEgC845VoXWs7gjJiumTOELD2bsb2gJEmEVnRBvAPhmQ7iz
         E5zw==
X-Gm-Message-State: AOJu0YwWuBdatFaiFiqtgxZCxWYfKZUaS+TEbLh+ZBGADA37+H2WdD62
	mznJSq1/pspxN8n4sUYA9aFxVU9iNBLh4wSulMJIqgc+y306kCpIKhP3Oei9qv4=
X-Google-Smtp-Source: AGHT+IHChQ4b8HUl5ZWL3mUPsNr4TOqpEOvJqMc5tmddRtG1OJQD1z/pv6D8ttNAMEN6b8MIDkzaUA==
X-Received: by 2002:a17:906:301b:b0:a38:2694:46f9 with SMTP id 27-20020a170906301b00b00a38269446f9mr2007544ejz.71.1707262432016;
        Tue, 06 Feb 2024 15:33:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVSQTuvLi1jJ2nPud0S4+sepdTgNa2Nigx8K+PbWd4I4nELkynhotStbXMK3XK4l1oPPAlzspPSo7I5EUjyxzeYGtsOJ446PZEfG6TICWzDQKVYHF1VPjs7PKAps+L4kNOzIyuyGyaZ7Xc57+/I6qhT5nID5ty6ydEM5ssVOgApdNVxl7Y8rANft9+lA27/gn52HSi25F5H3Cz0zd0sbjeoZXTXww/rlOJRjY99QCdElgPMIIvVFP/E5NbmYqpuDPsC2safVHqDZfZM6h4SB8+s5jzhIjCBIQ0O9zHgiVMsg+ARJkCDHpEpFo/E1cQlddUr8/SbuUxuAW5f3uBoZ896CZHmM4frx0S/o60mN3K11X9oTCU39WxHPWOneUWS
Received: from [127.0.1.1] ([62.231.97.49])
        by smtp.gmail.com with ESMTPSA id un9-20020a170907cb8900b00a36ed37683fsm72404ejc.215.2024.02.06.15.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 15:33:51 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH RFC 0/2] spmi: Add multi master support
Date: Wed, 07 Feb 2024 01:33:41 +0200
Message-Id: <20240207-spmi-multi-master-support-v1-0-ce57f301c7fd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANXBwmUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDIwNz3eKC3Ezd3NKcEiCZWFySWqRbXFpQkF9UomthbJRobmCSZG5umaQ
 E1F9QlJqWWQE2O1opyM1ZKba2FgBmdoGrcAAAAA==
To: Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=uUa/Ho3Wm4SxUj+BbGgsm/fyqzW+5eMAhtSXlwrvm0M=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlwsHXBTBDUHkw22LNTcEGnFGBZ3ed0WbfJnF1y
 niQsAL7VQWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZcLB1wAKCRAbX0TJAJUV
 VnnLD/9XlbcGQXYnjM2J4ynDwPwRpDPDYJJrZSrHKt8dkZozLK0uEUvFivSsgRF0Oa2MrJNyeh9
 i4ixNnZwvFa4jB5SFVFJuFvwgja1dJwPLwCzdqIm+voss5v9XYt254D+N5uuCxcVcrfHQAPE78m
 pTBy6rnrXPVYzDjp2jJByWbXPZwPp2GdCQeBGrffVWQOqVfpGQZuU1/MnuDOD/3Lwv6qukgVTHP
 PrXx012Ts341rhufybu/z9dKotXDjg0kRPL0gdhoxxLpn2/lD3Dt/k2GSnHGutcTft2VPTRIzV2
 IGBwztmXS/ACt2EqGFNqEYxnFwu16buKMsusbjPB0fd8pdhXCle+2yHTUGQ3lzcjeBk9i99o+cc
 BD+dQqVlRWmpvTSmibrAbpGQWdc41TuOW+YAmE443hK3g1/mPrX6GQqooXF15+PMgYshkU0vPNE
 xZmFp7ilYWRRH9MiuxZfELbYURWAyiFIRxYKhka6XvT1KFD018ttajfW1gqcgY4F1rCfuhIPobq
 5bvuBXl3cgQbH2baq5QmIVI0nu5EWjwtMoqIqcZR5xcrECQ4gRl1aLVM5k0iLwdpDdpdDWrLeRJ
 SfmhNv233g7TsVX9ZE+Zffge/GXh6lfbb7vw8vbVBqEw+a1AfFEF0tGmven58863MIMLeJapq84
 W2uCzVA1cmdE42A==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Newer SPMI controller (v7) found on Qualcomm platforms
provide support for multiple bus master. So add support
for multiple masters in both the generic framework and
the Qualcomm SPMI PMIC Arbiter driver.

Currently, the DT child nodes of the spmi controller node
are the slave devices connected to the bus. This patchset
proposes another layer of nodes in between. They would be
the master bus nodes. They will not be populated as separate
devices as they need to share register regions with the controller.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Abel Vesa (2):
      spmi: Add support for multi-master
      spmi: pmic-arb: Add support for multi-master

 drivers/spmi/spmi-mtk-pmif.c |   6 +-
 drivers/spmi/spmi-pmic-arb.c | 711 +++++++++++++++++++++++++++----------------
 drivers/spmi/spmi.c          |  76 +++--
 include/linux/spmi.h         |  10 +-
 4 files changed, 506 insertions(+), 297 deletions(-)
---
base-commit: ac139fc7db67968e5061715508b5fc4aa7c40c56
change-id: 20240207-spmi-multi-master-support-832a704b779b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


