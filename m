Return-Path: <linux-arm-msm+bounces-48041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB24A3610A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 16:09:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 634CB3AAEF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 15:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724D4266B52;
	Fri, 14 Feb 2025 15:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v1UY37yn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F372266189
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 15:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739545749; cv=none; b=ZMKq/q3bJz/LmTzzw+EYFnkECwnp4Dena8q2LrG/h9k4ALtHaPP9gJu5XJo9GLm+zLsBKBRwI4IfZw8vUfS+kScxFZ4aJ4r+wkqZ60iwQBmO0rgZOw5f93GNFvJKdfLKPSQdlpJhUX0YxzrwuI/O9f2C64Aj/q+8pUcGn+AIHBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739545749; c=relaxed/simple;
	bh=u4YT2mRDI9vOEz0E0V9HN6GrYA7SOM0GmXxkYSP3BpE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mj7R65fGxwBDP2bUegG0NohzbEQ7Ps+LP2COwlr/AJtJyjTp/cFo4e5ISnl0P6mGUZUnfqWDXx+gmisaYKzTV0d52R+/XCdyboIoz5zMLSoApEh3jRvIcgJz79GfjyAy5GpnDyJoqrDlc495YYFM4KoKQzxARmzuS+lncfPt/Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v1UY37yn; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ab7c4350826so37357666b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 07:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739545744; x=1740150544; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yTE3gACjDkJBHSXQFkTCbxcnRZQf61xIHWSy/iDp6UQ=;
        b=v1UY37ynH5e79M0GZ4U496POAWl0fVacHSsgcG5Y/ccVDQKxiCzSrEBbDLC4BCFnO+
         SYe/6N6WBt4sXLQBYFno33liaJ+W7JVVIJ/XxncJcZaYyVZq52LE2cBU/A4OwEWcNSvq
         bwSWneIwodaFg79iJVOUKPRJMGqxM4xWPAMSth9G7Tw86WOm2Ikn2UVFtoJxVh9CaM74
         FCHVCByGX7TlT1ojJQMddMktZ5+EUDbYNZtqTcRisD72o1SpzlGzrmWh8T5cshsB+kCi
         QghAdep6HfRsFcpvLYBINsuDeWtzqZGrVDz1A+qke5Nba/Dhop0SGpiKeROZY7jFX54a
         iSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739545744; x=1740150544;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yTE3gACjDkJBHSXQFkTCbxcnRZQf61xIHWSy/iDp6UQ=;
        b=FeFq8Z/ZIC18xHkfj6FAOrRTygBwYVhD6YIVunnA5NE/oHGIvz7YT6bVAmXX73hTbe
         WmX0QCHpCQOWf+kOF6iwl15b2VaDV8+ZNLpcpeIvKd0eRMJ8IBVUEGJHuCZuo2QNaDph
         FS7TZBS8JlGApzVkeIj7+bFSN8CKUZKSjtyybj+VD+iwtN5u71bL+WJfehm0kZ6mbwCr
         vXsRJO9xl4dvtLDJrEMVkMveg1uDm4cKbPGZoBwjIhUlHREQSIdWktqiOxgKv713QRjO
         RgyBNGZ0H20iDGjZ/mMuWMK1SbGdWN0BympBNCRFfTOVRO4VaEDPmMGiXEnCFo5bqTRM
         2RYw==
X-Gm-Message-State: AOJu0YzB807Cpap5sH7zJtJKvRwphbFMzyAyo1RbdAYtVep4ozM0+1X9
	K0SDIENfbZVQDQZJuUzz66roMfwjlUfiluzdxBUdbxj494tqvF4eem08Ip5dUyHLChA37fLAkA8
	I
X-Gm-Gg: ASbGncu6lca9M9eK30Ad3dRgXCyeksAMHJomDpTK7YTotD2aEcmd4zJt5FJdi0gV+2O
	c0p9uc4/8xo3Zepk2b5RYF+ISmxUDvMyHCjDzpWolfezXP+zyn0REWhPRtYy6eLs9xAdyyOqD5Y
	EBhVhaAwuOzDf3cNBU++KYtaWlp5nErlJ3Td4sNdXGttj4Rg0E6SGjufI7rroT38/4p6i4DmNDc
	AU1ny8JLc0wU9ePmAbSnd4jG+N5p7nr8PFcXO2IrjIgunBXw5eGPOP5NnQEl4EaVsEP3u+Qkjcu
	NWDyBelTz9hP1KTZ2bebgZVLoJ0SMis=
X-Google-Smtp-Source: AGHT+IHzgKaRbHiTLvYxrSndh1cA0zCykbFaeMqxfMqSMgTgRMaXFYxANRLGE/AUS2gP7blBaOGXAg==
X-Received: by 2002:a17:907:8686:b0:ab7:cd83:98bb with SMTP id a640c23a62f3a-aba6939dff4mr107008966b.5.1739545744014;
        Fri, 14 Feb 2025 07:09:04 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba533bf70asm356266766b.180.2025.02.14.07.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 07:09:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 0/4] drm/msm/dsi/phy: Improvements around concurrent
 PHY_CMN_CLK_CFG[01]
Date: Fri, 14 Feb 2025 16:08:40 +0100
Message-Id: <20250214-drm-msm-phy-pll-cfg-reg-v3-0-0943b850722c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHhcr2cC/4XNQQqDMBCF4atI1p2STIjVrnqP0kU0Ew2okaSEi
 nj3Rjeli9Ll/2C+WVmk4Ciya7GyQMlF56cc8lSwttdTR+BMboYcFRdSgAkjjHGEuV9gHgZobQe
 BOriQaqzSuja2ZPl6DmTd65Dvj9y9i08fluNREvv630wCOMimrslSg1SZ2+AmHfzZh47taMIPh
 Fz+hjBDVYmNkGWrDOIXtG3bG7tTcx4IAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1419;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=u4YT2mRDI9vOEz0E0V9HN6GrYA7SOM0GmXxkYSP3BpE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnr1yHLLYyDJehS+Lyl5tVRCFBKAPeBmUjWYfvx
 4mbFH7/R6SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ69chwAKCRDBN2bmhouD
 16LiEACVvDtCLRMfuiT8VpQkuEZNPQh4VQo2O3u0UY/cT0x4qq2KF8l36vj4gL5Dt+BVNgdw0S5
 h3f3cq22DDVS1SqE7I4jIq25kHBHC7so1BPzOGChBxRbhjshsWDVwsTMDdURwLcPYFpZ+I4J7RP
 7HfNUR5lBUz+DRnITEtsfrEnG2xo6+GQZFxD0OynwUUyv3+TvK4maJGI7IEHYDOY5oRgYMRESkm
 UTOchy/Pt7bbmzXCKyO7/9VToAh07H31wz/OCkkyYiUveXSH7jPrIoD5vwhCMAf2k/dHHTa8tec
 xAOuSD6Di44KoxAQgEl4hbAW6GCCC39rXAEVEiJj45iw1KfjiR8q8d9luZhFjEOjLskntN/YiZE
 HB1/hNkErm3URpdzohJfncZWf+KGeGQXg70GpsFj3HPQiDqAsHxWwWN0Lz7z7/8UDY91R3X3Q3e
 Xq/gydE4d2uJGTr5XDo83fmWKKtLTlFarHqH+g9yErvskpQ3kKuSO783sqabF0pBxs61NcPbvAg
 cBHZMYvA3BPSSXOutPYBvWXvh3iN62uQbguq8NzNNzpyjMQ52TeZqsW3h/8udSQf08yQNH/dByj
 fZUBLRk2bbtR/vyDTT8241tFnwQ9BKBPo0kaebPofsmWzm8SL7pHQADR5zRzLg4WMQNqbjG48Yq
 N8x4UNYoVNrekKA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

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

 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 63 ++++++++++++++--------
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  | 12 ++++-
 2 files changed, 52 insertions(+), 23 deletions(-)
---
base-commit: 883d3876ff4bb50d1b9431f525b4d3b257ead6f5
change-id: 20250131-drm-msm-phy-pll-cfg-reg-7e5bf5aa9df6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


