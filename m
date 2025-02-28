Return-Path: <linux-arm-msm+bounces-49862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 984F6A49CA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 16:01:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C8637A950B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 15:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9979C1EF360;
	Fri, 28 Feb 2025 14:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i27F/Wzk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2811EF368
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 14:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740754792; cv=none; b=uuYQzeChg/VyAMOlTmr2LxCkYwML5OO8qzddvwrvK0byXT6pxP3UdTn7WcSWjjnLECrvZnfHDvC3WAnd3zbmPigCoDWDBPXVaKS20AyoUh4yA0UWQn96iDL6bg6biDda5Dp/lImouw6IFdq5k9GdpzuvKsHBBduEQnkkDd+2ucY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740754792; c=relaxed/simple;
	bh=DN3OR3UNLTVv3BZYUZUuzBf8MA/QbjKRmT91vw7vVlo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sFGpZGvGoTRWvfjtbhMsVvc7UI9ws4GkB+NKQCZ4b3hTnvM7rTIlSFf9JUguvLTaYFqOm7P3lN872FMay0YsSnZhSwSoOLGK/ZKWGqBwLfrZ3R//OCB+LWTad6ggnX1Namw2LwoOJ8cIE/tsU6qvKcU2J2kQEXw2ayh0wD6UsrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i27F/Wzk; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-390f3a5b2d8so27429f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 06:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740754789; x=1741359589; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Aw1wgbpjG14q+kZJA/ykHz++iHt5asV20YBMvXwJ2LA=;
        b=i27F/WzkROLOKEHfVdRS1fFV/cbCMIa7zqgFyFi50Qh2Bi+Iq/0Dv1byuL+lK8bKg1
         CJZj/a/O7IcbXhLooDPY7Go2ssKZ4P45PeE2FKlLd6xUMnmZ+4Ta7FTVzSnFDU1Xf+nB
         S0p6oB9NRSQ40aTlHzZHd8q18aygfLyEDPYRl9OzL07g/LclUVpHn8gUmor3uptTQxN4
         pbewcdmETaLJkyEGeogtiFT4/tqidJlRbLNT4TGZ8cBnRSB8gEMnEcDWHET/1P0KXPVb
         D6x22rB/v0AsWrzFqDFfqPoWj7CUv2oawyj8B0u1Qk1xwUVKsLz/6eq4hnZM73ppczrv
         Km9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740754789; x=1741359589;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aw1wgbpjG14q+kZJA/ykHz++iHt5asV20YBMvXwJ2LA=;
        b=YUgbBpwKhq4ExcDC9E3NzArRBs5D4m4aomL/SgC3cjFscDKhpAWQkhvEwuWSIvqnGL
         09G+TCguuzTQj2szs8qTooFYBLyTu2Oe7lGdEtqWTbX9lPkCFytO45IWYYwgNb6FaOf/
         RITnYXuKXLe7uY98/1e2FK5L1WkGRR8Sh/S0SsSpal7Vp8WgXMzba2G7GSATo7p37RyI
         c0ENwhTateg59FyPdmileOZJ8R6v+lYVHcz5YvwZWsd0gypmY9+lSYSXmX0y/DPzqFnS
         R1LABoOG5CK5Bj2M1yEpZCR7uWdP+wua1hdq1AqwGkSmMO3cbRTYW2yoWXf1lRJUUcc/
         nfcg==
X-Gm-Message-State: AOJu0Yz3ay8uApTDWCagLBtnZIA1GvoAOB3PziJvIj2hdPDFgzJbeejx
	5IMRcQgLmtYQZK+e3rl3D+cIsSCh2+dE5VV0qZ2zgX1llajsZ5xBRqy30MTPjwCqvBM9Q9cFaei
	X/Ls=
X-Gm-Gg: ASbGncsygwH903i2ueeucZtJA2MIpm5brRQpaiMRdaadsOO6uRGKR4Kgibgz+Scf93Q
	NpUnUZhUmGVVPCoAP1v3cVYoiboYVSzRQm6DQfS8otnFapOjdEhjrXJs1E5yrWv72uEa3wEJOwG
	Ail9KCq+17z0M/wJR+D2vTafT0a5dLbdWkj1a3bFLNp4cO4qCzGf9vOcfC4OdO242rrV3osQYw1
	IievPlYDkmN+iT63gdGzTkl7sX6hHNJAq8VHNhV/o802G0TquiFo3LfpHkOuqb4BOGhMsZXt6U2
	CVcQ5+LR4YWOaIrQhcKJLDCPoNQI7m59Mjc2/jgK2g==
X-Google-Smtp-Source: AGHT+IGdH2qmH4oSCKqIKPqOphvmigtP0oYR69hECCBe35mqJksQQnWDr1GbP2Gygro+ZUA+rzOu2Q==
X-Received: by 2002:a5d:598f:0:b0:38d:be5e:b2a7 with SMTP id ffacd0b85a97d-390eca89669mr1148746f8f.10.1740754788946;
        Fri, 28 Feb 2025 06:59:48 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485d785sm5450770f8f.83.2025.02.28.06.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:59:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/4] clk: qcom: Constify 'struct qcom_cc_desc'
Date: Fri, 28 Feb 2025 15:59:37 +0100
Message-Id: <20250228-clk-qcom-const-v1-0-611ab80d45e4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFnPwWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyML3eScbN3C5Pxc3eT8vOISXRMjQ4tkEyNzQ4NESyWgpoKi1LTMCrC
 B0bG1tQC4PRM/YAAAAA==
X-Change-ID: 20250228-clk-qcom-const-4218c42710a9
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1409;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=DN3OR3UNLTVv3BZYUZUuzBf8MA/QbjKRmT91vw7vVlo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnwc9blSazgMczCJY+a4uFENOuZleWk2vJAA/pf
 +hHkFsdDNeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8HPWwAKCRDBN2bmhouD
 1zmiD/4+Kk7fGDoVklFFYQFk7elu4O4WZHQsWx2P0xeTLS8VoRAwjq8yenRESg0YmawIb1u1Zka
 Z77ZJaKWc5fysGYLRrYktBXYK//RfdwU3wCFOgAl8uenBC2m+xiCCIueSQuAWGJrsee0Bi7fOWE
 GWOVs+bL3/ZAPlRJp701WzC/o39QWxFPuDDwlUD40Asia2gGAV5iaXJEMW4UzPSF4EotaddYGyr
 e0rOUaaQZPpHCWhlx+p+ucayKTAggcLnADPoPDEBrKfTmAO0OAUzDylkWPucqOLLXb6Fdj8ELfy
 5pxTP7S/eARVJJbRyRssQNFaT/0nJbVdfdwjUUX2yrr0h7Zx+U4coCgnkpc1Io3X6m6mVw4teTa
 HXqXCkn4HvOuMNbuRy8hvLgHQb32wGekUop8JQ9XAgwX7GsYeDTwA06In07DIa7f0oEiMIoqmqU
 m+l2D7wge8x5lAZIHZ3U0cTwGdNegpNAO19P+c4woJMH3SCzp2PxqkZaqovwNmrPfu2XS9RQFZn
 w2siDi//Xn6nb8VR6qy2T/M4CUHufUdDCwjDW1DG+XHedznJsCUh9XxXubn3+wcK69y3AHQV0m4
 KhT2BDV5DUZQx5otspMy2SnT2FasDwcRmwf49YBewfbf4H65du/dfzO77nGH3nMxJA8RDX/aEp+
 qKaSMuOTQSodFMQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Make static 'struct qcom_cc_desc' const.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      clk: qcom: camcc: Constify 'struct qcom_cc_desc'
      clk: qcom: dispcc: Constify 'struct qcom_cc_desc'
      clk: qcom: gpucc: Constify 'struct qcom_cc_desc'
      clk: qcom: videocc: Constify 'struct qcom_cc_desc'

 drivers/clk/qcom/camcc-sa8775p.c   | 2 +-
 drivers/clk/qcom/camcc-sc8280xp.c  | 2 +-
 drivers/clk/qcom/camcc-sm4450.c    | 2 +-
 drivers/clk/qcom/camcc-sm8150.c    | 2 +-
 drivers/clk/qcom/camcc-sm8550.c    | 2 +-
 drivers/clk/qcom/camcc-sm8650.c    | 2 +-
 drivers/clk/qcom/dispcc-sc8280xp.c | 4 ++--
 drivers/clk/qcom/dispcc-sm4450.c   | 2 +-
 drivers/clk/qcom/dispcc-sm8450.c   | 2 +-
 drivers/clk/qcom/dispcc-sm8550.c   | 2 +-
 drivers/clk/qcom/dispcc-sm8750.c   | 2 +-
 drivers/clk/qcom/dispcc0-sa8775p.c | 2 +-
 drivers/clk/qcom/dispcc1-sa8775p.c | 2 +-
 drivers/clk/qcom/gpucc-sc8280xp.c  | 2 +-
 drivers/clk/qcom/gpucc-x1p42100.c  | 2 +-
 drivers/clk/qcom/videocc-sa8775p.c | 2 +-
 drivers/clk/qcom/videocc-sm8350.c  | 2 +-
 drivers/clk/qcom/videocc-sm8450.c  | 2 +-
 drivers/clk/qcom/videocc-sm8550.c  | 2 +-
 19 files changed, 20 insertions(+), 20 deletions(-)
---
base-commit: 8936cec5cb6e27649b86fabf383d7ce4113bba49
change-id: 20250228-clk-qcom-const-4218c42710a9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


