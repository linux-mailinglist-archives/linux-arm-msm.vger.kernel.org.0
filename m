Return-Path: <linux-arm-msm+bounces-48208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B20DA38252
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 12:53:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F9D31888198
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 11:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A41B219E9E;
	Mon, 17 Feb 2025 11:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="THjDOmG8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F218217733
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 11:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739793208; cv=none; b=LitIK/pYO55KYjxIIAJ3AiVmx7QJKeukNIAH1HWaSzByfWefV6oyB3n1wtyVw/xFc9ndRfFjt97ja1Rt49Gir0uD1jMfvYOECW6lKK1vFAsMbCjrrrWswpv/WiPvavGISEKSgN1pgraAo60xbhWCYIijjU9u0Sqxp4WAD2iBEVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739793208; c=relaxed/simple;
	bh=lYGI79sF49sjGrRA3iSrQy8gkG8eKmLodtq9CSRteIY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sHZeQnEzOlzgLsv3qLHX7lfts4YRw+vBWh9LCys1CCZv1x8rjssirrHV9d89JBIPWNpe8aKGZVELe54llMFG4hCQTIL81HYYVvHg+iTwoIZUVM2ur8a2QOC5h//LebysLwLNzwiMm654XbUoHH/Fgx1wSuWpYuXAvXrRAucBbfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=THjDOmG8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43935d1321aso3083725e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 03:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739793204; x=1740398004; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HcPAa73EYlgPsPvzqIdie5odjRJpV4trVI5pleQ5THE=;
        b=THjDOmG8AcZUbVAICUvp7YZ6oX/M3vgPSyOpHmjASvPcHx9kyo8/ZSDhiY9nNTQvr1
         TWbMzcdQaNlkTlJFMJWUxdiTevfBEsgmQMJUtX1HRGrIZhYxkhUt55l4+zuo6ZXzoySC
         jOGmFoo7AgAbY9GRGuxf2A1Fr0BUu8GKOP1PRKnto8pwh4Jj4CGc9yXc9CJ3MkTbyZZl
         hHy5gL8trncK5hG/JH8ydRLihNBwG3cHiUqbWGqPOzOrlSdZE3V73o82V6GqTHaps1ea
         8WEOuBTKkbKW3Q5MzWJD3QwJaVQ23S7mQL3FJPgkTngEqi9RDdPt59dq3Oixvs6JJ5rq
         SXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739793204; x=1740398004;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HcPAa73EYlgPsPvzqIdie5odjRJpV4trVI5pleQ5THE=;
        b=sWBHph185BdlK41TYs8OO1RHVqjSxGsTsqjTNY8lzSwcwhjZlxCMXctThXmQEmQuMH
         LFSnZ7o0cKgwAoE25B39zv9/NkfM+BwGTPre47oeT+bAIAyyfRy4FNY3gvGRQMnXfFLf
         ZCuQZR6PfoGNE6WVuSpuW9vosIt4rXAcKVRo2Ml1OMcVQpKblOOdIPm4t+EWpi2G+AyF
         c4QHLNGDy58p+CDNrPXV3x+Snz53DSyBwnuKgwhGGUF6ZK7F5EAAlNBJQ8qUCzXSidbK
         8zo45NxPv0J4l+UIYRf1N7IdarwbD5WiFIBFyoNCQqnHW4H9U/7kl352icbeKuGwvR/0
         CiQw==
X-Gm-Message-State: AOJu0Yy1BmhpdbBjEqexWZPjAL0GPl5PLuLS9IR4VIo7wq3gO0BR6+Ts
	NRHevKeZakMI0UIBS+wLhdZUyMvJnAGArVyZUivD2p5fQpv/Tn/95T+p5kJF9IE=
X-Gm-Gg: ASbGncvBtFCIq2LI84+ic8+OIpE4BD9tqBTPfq3HEqd39rQ+1fA2xyNSdRBdOb9Z5Vf
	0ivRqLitAqjuXBx7olROhgYLIfGVT0gzZzHFiF8GKu9VvCaMtsVk1fyq8aiRrPT4YD+MHVV6SXh
	3XpH5LmSSbaZxQ8GHYxYwYL3nHekQ+0ohjxcEaECwG3h1iXPPqwpcfbdW5g2HYAoBrQXLMIENmO
	ZEdnGUJp7lj+k6bL3Cc2cWyxnGvkO/JMM00RaSrVZ2dalfJyMG9Oj8QSs0Uek2ItAbwg689lBMe
	Rg6wInmu6pVECYQ+kfXvKJVLyM2WjME=
X-Google-Smtp-Source: AGHT+IF5kgm+xVnTnZrtDvfg4SeEzWGW2ASBm+lr0GX0cZbGvOEuZS2cLnfU1mQ9DFuGqPQEsIxuPA==
X-Received: by 2002:a05:600c:4f51:b0:439:5556:7cee with SMTP id 5b1f17b1804b1-4396e6d4d8bmr38201225e9.2.1739793204416;
        Mon, 17 Feb 2025 03:53:24 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b8397sm150212575e9.36.2025.02.17.03.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 03:53:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 0/4] drm/msm/dsi/phy: Improvements around concurrent
 PHY_CMN_CLK_CFG[01]
Date: Mon, 17 Feb 2025 12:53:13 +0100
Message-Id: <20250217-drm-msm-phy-pll-cfg-reg-v4-0-106b0d1df51e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACkjs2cC/4XNTQrCMBCG4atI1o4kk6Y/rryHuGiaSRtom5JIs
 UjvbnSjIsXl+8E8c2eRgqPIjrs7CzS76PyYItvvWNPVY0vgTGqGHBUXUoAJAwxxgKlbYOp7aGw
 LgVooSGmr6royNmfpegpk3e0lny+pOxevPiyvR7N4rv/NWQAHqauKLGmk0px6N9bBH3xo2ROd8
 Q0hl9sQJqjMUQuZN8og/kDyAxLZNiQTxKtM6lLxArH5gtZ1fQB0JS6cUQEAAA==
X-Change-ID: 20250131-drm-msm-phy-pll-cfg-reg-7e5bf5aa9df6
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Rob Clark <robdclark@chromium.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1665;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=lYGI79sF49sjGrRA3iSrQy8gkG8eKmLodtq9CSRteIY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnsyMtuEHJN756qa6xmB6bAdE86vnyGM7/OxW60
 I5MdgNrJPyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7MjLQAKCRDBN2bmhouD
 197LD/9GmveXsb6wEfYbxNJldhdd2NR3krESKTxD9Ac7BtG0DcRFnZD+01mej+wZXYlkH0puYiB
 j01gppqqRGPBtUWVhKLZdmSswCKiENVLwMW5bbbxDwM1AXdBWBQZW+Wyfme7jCH4RECh36oBK5M
 3GJmLU8XjZddp7QXSnBjinEyfafaq3yzPOoYE1K6KxtI2bu38IOdd3N5V1D6EJ/TI4rPoMnO3LV
 0/AuUXkMz16k/RTB2ejaNKZxK1OQRvSGHUhfQxjUhJh9E+9565JUI9JrqqMISD1SPT2igp+1qVh
 Pe4yzAaUwxovSqA5kX32PPPSsf9dOH+OXHIQpUIblfpcXHvo1Rhq1E/s4FOeDq8dql1y7wuY0V6
 DolxXgF74ye9tICanr+KukKy0za10BUqANnAqZuS9O9b74MwOzspzSW+/dYCkMLWf+U5QpOAKQd
 1q+V9+SsOrb46v7LHwcO3Ls5zI4+iT48neepSV0UAjJm4LgJyVZX5YHs8t01Z+ZiGm3y1WCXwJy
 SxOrqWc9CBT4dIkt7NDufMR+sCpvAIDxfxeVOE013rOD2UE8euqg5+Y/qyXdf3Km1LvOLXpdu9R
 Jr+gXpLhJNrTqcXV3Mx1XLT37qo/OlfPTOzyq77VT1TsUO3QPLHzY7/jcFCKvC7ejSSu1awU9tM
 s8gxUWI5m2V/lFA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v4:
- Add tags
- Patch #4: Add mising bitfield.h include
- One more FIELD_GET and DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL (Dmitry)
- Link to v3: https://lore.kernel.org/r/20250214-drm-msm-phy-pll-cfg-reg-v3-0-0943b850722c@linaro.org

Changes in v3:
- Define bitfields in patches 1-3, so move there parts from patch #4
- Use FIELD_GET
- Keep separate cached->bit_clk_div and pix_clk_div
- I think this implements entire feedback from Dmitry
- Link to v2: https://lore.kernel.org/r/20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org

Changes in v2:
- Add Fixes tag
- New patch #4
- Link to v1: https://lore.kernel.org/r/20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org

Calling these improvements, not fixes, because I don't think we ever hit
actual concurrency issue.  Although if we ever hit it, it would be very
tricky to debug and find the cause.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated from driver side
      drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against clock driver
      drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1 when choosing bitclk source
      drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01] bitfields and simplify saving

 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 64 +++++++++++++++-------
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  | 12 +++-
 2 files changed, 53 insertions(+), 23 deletions(-)
---
base-commit: 883d3876ff4bb50d1b9431f525b4d3b257ead6f5
change-id: 20250131-drm-msm-phy-pll-cfg-reg-7e5bf5aa9df6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


