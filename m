Return-Path: <linux-arm-msm+bounces-23885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A97291442C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 10:06:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A0BAB20B47
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 08:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5091487A9;
	Mon, 24 Jun 2024 08:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PU88W3z1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E283F9FC
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 08:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719216361; cv=none; b=u39bWA3rJti6q/1AcQlFmZUMET0199h+HuGQxRkna23rAHVrlhnFrnAHctQMfo7JsJWVpeR/Ru0F6oTSHF97ijNNhG1ru6pFBtuksvD2tDb3wqroYcIxWXoyaggT15foA14L4rqUGjSwsAtqoCnwZEMjwRN5/yIjHOzqP9i6fTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719216361; c=relaxed/simple;
	bh=fROqvB+Ad/dr3e9qH35hLJWAl9z4Z2lzPyO6crozWGg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UOUHapWl9sSy8eXthjCsZDjHXBjrem2QZymjePpBUFcKRFbhmcXr+3x4gU9yVlLRGO9IoOaNr1Kns4bh6WS5cgFUX1EutljLjHbjigV0Ul8OKKhRG08CUOilzXcTLldkGt9+3FUw751Qri+oZUQ5MVQUYxYChfU+TBSD1ypTHXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PU88W3z1; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3632a6437d7so2284609f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 01:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719216358; x=1719821158; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=odzDRTU41Zr89t9SLoKeOkPoH6J2FAkixD8virEXbx4=;
        b=PU88W3z1uEX/C5c0DJ6MrdWLpB8Tw55Tj2WgGOA/2qG6lsb7M64lCFIJ20jZapsXX+
         wSxbN25JXAl2B8wt9dD0l8yP3mtrbTLqiSVGSyWR3WkU9x4gWavV5X+HWGz7S/5iZbs0
         OLmiPDsqis8jMJRcNWn9YZfDVGH8fv4w2lMyArIoEip7Mz1kbAIrw2klESEDPOXjTgcZ
         V+dF8l1aBeLxRt/wWbU6TIEnUaAH94kh5SGxVI5kyY5uT4BJPG0tRtv8B1UINOqVBykD
         n62d3LaZkAPVV/3ouSTgVB+Dh55JHJz6H2+2iGVzdHu/pKxKSy/ekTOo05cDl1VWpOo/
         LiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719216358; x=1719821158;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=odzDRTU41Zr89t9SLoKeOkPoH6J2FAkixD8virEXbx4=;
        b=Tkh1JR6CWPekbuo0oIhYSOc6BRYBekRMolnrf5fUpS00sKGDTZh9ohRS8k5rnzSzpn
         gNDioGsV2b0TBUQcu1+m3IznoZeWrlMuoBbW++TKxNvuUv6K9ZfVmaOjojV89KuI22Zr
         C/b0ePh2MgPQx9TyMB4oSxr3aIeIo4m7grApOs3ClSivVsLE2BEMNhrvC0I+Dk0N9DX7
         Rro696G3x2r5PR5FjgkkcMs68MmzJnZ0zNqw1qoZLIyaPtA1Xb6pVs3cD8K6n/ttEQJf
         DerGIIUCKOJPR6F3CO7I5TO7yHP9huXFX4b8af2c2zb9YuVZ239f8Lb1ooZzbgXugx4/
         gjoQ==
X-Gm-Message-State: AOJu0Yx0oPI5U4jLbbvAumNtkanW8G68OTAPm7WpnTLQ5U93ZWiG5XH+
	DOX7okyhCLoaztjCNcMudTtd9gWx0mf7MJok2mKSKKJOUqptyMgOULA1rZxIx08=
X-Google-Smtp-Source: AGHT+IGVnrS9IFTkUf5iQxnTJvMhFKWWjlFoG1vmOIjQd2oqxf/RQpUp7yIejwA3PnMQ3A9mBW7nQQ==
X-Received: by 2002:a05:6000:1a8c:b0:363:776:821b with SMTP id ffacd0b85a97d-366e31bc9f4mr5357152f8f.0.1719216357797;
        Mon, 24 Jun 2024 01:05:57 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a8c8b27sm9280284f8f.104.2024.06.24.01.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 01:05:57 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/3] clk: qcom: dispcc-sm8650: round of fixes
Date: Mon, 24 Jun 2024 10:05:49 +0200
Message-Id: <20240624-topic-sm8650-upstream-fix-dispcc-v2-0-ddaa13f3b207@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN0oeWYC/5WNQQ6CMBBFr0K6dkxbEKgr72FY1GmBSYQ2HSQaw
 t2t3MDl+z95bxPsE3kW12ITya/EFOYM+lQIHO08eCCXWWipK1lrBUuIhMBTW18kvCIvydsJenq
 DI46IYJUxlSxblLIUWROTz++RuHeZR+IlpM9RXNVv/UO+KpDQPLRpnDM9oro9abYpnEMaRLfv+
 xelPG+g0QAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=fROqvB+Ad/dr3e9qH35hLJWAl9z4Z2lzPyO6crozWGg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmeSji622feuGnejMViAuO0ml63MAo/iS2It7g0EpP
 J8dkTqaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZnko4gAKCRB33NvayMhJ0W5HD/
 4i2AzY1GczoM93DAhbkb2LNUpHRWWU950qeHoXS20r2k+oRX2MO+gBw4WQEmbBJwHbaxBpKeSzzWcM
 RglN9DpLFZ7S/Pk11+ljtxsfRmQWNEtzXH9kbCiX5szJ0g8MKViiWgFVb5Ss+yxRTVj8GGOgWXD7wi
 YS14KP1KpHghPZNT1ee+o6jqavYVwwZsvfEEskzVmIBTciYW2AM5fBKcdaduAk3FXuKx4Ut4/rxJVY
 Cf9czwg4eyfNLT/+01MMrRg4CMuIGXqWQ4SRDe6XAQXWVLqMGXD8RBeBP7BDnCt/kXKNEDzDLatYFc
 ymIwMnCAXxZ+PPt0Xc6rrQmQmHu6FMrn5h15332qBcerWjnQZLRksCkuktVeafQ/INHiJOvnLR9CKj
 HiGIPhUebYQFuqLiXkznHLo3VZwXC0IWaY8YkOe/QXC5yKEKGkI1tVAYtliaHOcz+0CVpfxFTHdKXY
 cpk/waCtRhg7TjOEUwIXbDBem6H+YUdn8zDV4bo5cjLacSnd7i5Nx5B4podhpYorYAKx4WAXDd3hvb
 xUjWUVMPyXN70xY3KQDJ/tHi/r+C16pjgLk3tNFIb5lq7ET5qGUUKVIhT8VuajcR/CH1IJIw57BW9N
 Q+JtGNz/CAvekpMr5C1ZnDASeZIwLh1bpoKcThBe3FyrMXCY4s8Vh+yP60mw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

While trying to fix a crash when display is started late in the
boot process, I ran on multiple issues with the DISPCC clock
definitions that needed some fixups.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Squashed patch 2 into patch 1
- Dropped shared_ops to disp_cc_sleep_clk_src & disp_cc_xo_clk_src as Taniya recommends
- Dropped patch 3
- Removed  wait_val fields updates from GDSC, this requires a larger solution
- Link to v1: https://lore.kernel.org/r/20240621-topic-sm8650-upstream-fix-dispcc-v1-0-7b297dd9fcc1@linaro.org

---
Neil Armstrong (3):
      clk: qcom: dispcc-sm8650: Park RCG's clk source at XO during disable
      clk: qcom: dispcc-sm8650: add missing CLK_SET_RATE_PARENT flag
      clk: qcom: dispcc-sm8650: Update the GDSC flags

 drivers/clk/qcom/dispcc-sm8650.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)
---
base-commit: b992b79ca8bc336fa8e2c80990b5af80ed8f36fd
change-id: 20240621-topic-sm8650-upstream-fix-dispcc-a1994038c003

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


