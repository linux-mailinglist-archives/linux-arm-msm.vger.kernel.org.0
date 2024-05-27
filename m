Return-Path: <linux-arm-msm+bounces-20537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C85BE8CFA51
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 09:45:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 731EEB2148A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 07:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51BE5282F4;
	Mon, 27 May 2024 07:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z29yhp09"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D46C747F
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 07:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716795937; cv=none; b=TUgO/MiRs+G5IWK7grz4GiYfe8f8sjiZwjyMIYx7j4p5Onr0nUSmPer35axJ+1tiKsYg6I04DpPp759I5lOG1afEBC2ylfeGOmQVMbslPPjmbwRZN9jspU3pNKaEaJpSB8ewDV+Cx3yrTQnQVi8Nlc7jz5KxcjQoUpK0khkqHlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716795937; c=relaxed/simple;
	bh=L25LeAJvksa9NHLEzSxruzChrK53a1cBjhUfyi0GPpI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W1FsKck+Q7BGy+139jzWBhP3GQ3tc0WWR8JqT/U2iCqp/9CeLy+342muWhR3JGzh6YoNWHo//aeCwmQTGQ5x/PK7jIOtqbIxaFqxFNS2/iqVi26nVjxVWGDQDaaUkxfMVywXyUF+0oWthoXXP/pHsARTZPTCvRSt0SRboL6mOko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z29yhp09; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3588cb76276so399089f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 00:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716795934; x=1717400734; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r3W0IRzbYrdpGZO/IX0+cL20f8hz6Rtqdx3NFjQ6cU0=;
        b=Z29yhp09xiVc6+Lpj9OvByrDJjANJ4nF8Kx45ea4z4lOTl4FMNl3J4I67jFiqer8m6
         UYPeiSS4FDJ0Hc+8sn+fUxoJEJoEQFasrW6W4PGtYopUk1+KLu2UHns2rmVeftYGT0aH
         Cnxb+o22ezB14mPpfNduj6U/5lftZhrf6bQ3fn4JL9zsXMHqbVE9CW/ntuorlECGKNDl
         cR3SLgJC7K9AuTrlKzkGF4caX0IHKv7szpnkP0W4Q69QDSIWoYBbMD/ejlX8L/QcpHNR
         7sKJdN4EzgW0KPWYu8PaadkvO5rIHBclW6LBY2ppIEvruK1sfLh8N99lsrZUiGMLzYy9
         Bdsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716795934; x=1717400734;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3W0IRzbYrdpGZO/IX0+cL20f8hz6Rtqdx3NFjQ6cU0=;
        b=K01EbarSnkd77rKp5sDCUgDcmvxo5/NXyswtxCHVrybRkwsCEBSDy08SN+qnPUuJGr
         GUcSYAAPT5angHaO3Pkt609MWWwkJNgfe/QmCpvadSw4n3/LqL8xgBmRDGH3nnIHp+Ka
         WQ3wO/jIOJbzNGgAflzA/L/6tAqmb22LBBmeydf/3YZYRD4q2hyg8bP1R98j5P5a2/vt
         EnRm4F0UsB1zNpJ2UvJbMwq+CsCiEry91srvDsjFjRJzEJQYn4O/6WDmSLqg9WYZJ7E5
         BQMpd7Zvbi3cYkJPJA7xwnHIJCM3j8mZ0WAlShf2dWdpTlgmoD/+csOuCrkUT3EM28lh
         8f4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdtGHQyhM90PagkZToIsoslVNoENLZHhSVamtwe+LMeuXzd3kFNrCtAn+z+nnQzj612/B9obV9M8KrPfMDy1vKwIjC3F0zHkFTP3cFEw==
X-Gm-Message-State: AOJu0Yw8DoM0F35hYprT64NJpymKlUojbR3huh00CeybRAgiymN35K+A
	34tjhOtgz4rX1qAVxjP2T0qq+8CN3HxWXQO1cZhMPqlT72UwkKLRS2j4O1wBS44=
X-Google-Smtp-Source: AGHT+IEewCQaS2JXdMuRvuS5ujtjvCFY3WzcrznMhPgggMKCeN4AQiw2HzeSuItoWxarSft/mG7ZXg==
X-Received: by 2002:adf:db49:0:b0:34c:600b:b016 with SMTP id ffacd0b85a97d-35506dc5898mr7269721f8f.27.1716795933614;
        Mon, 27 May 2024 00:45:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35579d7d96fsm8293353f8f.12.2024.05.27.00.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 00:45:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] usb: typec-mux: broadcast typec state to next mux for
 ptn36502 & nb7vpq904m retimers
Date: Mon, 27 May 2024 09:45:28 +0200
Message-Id: <20240527-topic-sm8x50-upstream-retimer-broadcast-mode-v1-0-79ec91381aba@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABg6VGYC/x3NQQ7CIBBA0as0s3YSRCmNVzEuKEx1FhQyg6ZJ0
 7uXuHyb/3dQEiaFx7CD0I+Vy9pxvQwQP2F9E3LqBmvs3TjrsZXKETVPmzP4rdqEQkahxpkEZyk
 hxaANc0mEfnTW+HEK8bZAT1ahhbf/7vk6jhMC9fVpfgAAAA==
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=L25LeAJvksa9NHLEzSxruzChrK53a1cBjhUfyi0GPpI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmVDobN1E65KFEsCOFpO948mxbN9rt74AlIlIzWnLp
 /r7tDV2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZlQ6GwAKCRB33NvayMhJ0eemEA
 CjdAr8cskG36GuOGrPp/Z5zZ3qN3RkJjH27XcPdWxw/+LKZNoSpyD2nxSDXXgIHn2mEPAOwNUy5dO1
 LPoGPM8xdng3JK7/dt++JVHJLPR4EH4gw827tWHsFTf6y6GIiZhPqQZcsSdQ+N8Y/4bp/6SUORE2Uo
 eYMebd1p8JX23qUfDJ/LKh42iB2fJF06wDCuuoCipDYvrUnmRCGHkGMhrProSsm65E5olPIj9GR/wL
 djUx+2E0xvjHN/SXy9Oz1NAelstFXvBFoLtLiLXH2QwAWWDkoWrzemJcxBWldqvjq7xL+d/y6kIYhp
 G4pavDoPm1aSoLa7lz/eX1ejryvkkS1kSssb0jao+CVaAnmyxuM96hA2eWEv6+mQg43bXR9HvIaNSr
 q3vhbOnnvmp24+cDIhCqtdWMKw8NRGp3cd9q6cHUNqAYx8DnFJyw5VwOCI+UYCWCGlZ2GRKhpYPOOG
 WUf2gwttxXMzpWHlViZN8yLpKeO4hMMgLkx9KKyZNAkpaF3NxbI3IfG4jtUG47maMPt5dXVtsckR5W
 jO+ysITtwnIXD8yz7SEuFaRNK2fd+zf1PMNNqyHewD4ZKU7QWlMOb/A+SUsC0jwNWDteGJPZ/JY8hb
 x5UVZyq2LDlzPdgylzV+rEGbai0fRhpXYG5PRHucYqWcWsW4foII+mODNJQA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In the Type-C graph, a retimer is usually in between the USB-C
connector and the USB3/DP combo PHY, and this PHY also requires the
USB-C mode events to properly set-up the SuperSpeed Lanes functions
to setup USB3-only, USB3 + DP Altmode or DP Altmode only on the 4 lanes.

Update the nb7vpq904m & ptn36502 retimers to get an optional type-c mux
on the next endpoint, and broadcast the received mode to it.

This makes it possible to support 4-lanes DP altmode on Qualcomm platforms.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      usb: typec-mux: ptn36502: broadcast typec state to next mux
      usb: typec-mux: nb7vpq904m: broadcast typec state to next mux

 drivers/usb/typec/mux/nb7vpq904m.c | 29 +++++++++++++++++++++++++++--
 drivers/usb/typec/mux/ptn36502.c   | 33 ++++++++++++++++++++++++++++++---
 2 files changed, 57 insertions(+), 5 deletions(-)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240527-topic-sm8x50-upstream-retimer-broadcast-mode-76520768ac3f

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


