Return-Path: <linux-arm-msm+bounces-35139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 775799A5425
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 14:56:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FC45282CE1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 12:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929FF192584;
	Sun, 20 Oct 2024 12:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VszKozBO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E53137E;
	Sun, 20 Oct 2024 12:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729429003; cv=none; b=Js7oyizCh3bk0zUXmoKoqi7XKG+7hynJEGs5O1LAm9ioVQlyL77tbyZgmLPOWln6Eb5nNxK6aQ9mT5hBqXnXVXzC4RTvA4VCB4DXTSIoiJ0BmZLPMb6DQDqzKMl+e0PJAA65g1yuG3OuaC+fOZcTCdS7shsO+/74QUHsoGcpKEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729429003; c=relaxed/simple;
	bh=o4hRuDeci+lewqXrEpMnVxOP+77ejmgwOUR3uaBa0eE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PfWWLZFtjtAhgRT6PNjPiFXr36H/bz0JdJNhJnuaeoslQ21pkZiEqxysyyy++pRo3B3YT5tY0zaQOcXJ3JQMWySdWb0un2XCW6r05mLf+LA5xUwvz9LdQroHonHhG3Oq5LiuddrJfH5E7SnMe5YHQ6C/uA5o6YhBGRxOULzbHUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VszKozBO; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4316e9f4a40so7386265e9.2;
        Sun, 20 Oct 2024 05:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729428999; x=1730033799; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TgUWrWRIiNQfKrPYF7x5YNeRJ4uuAQZGRGkDi+8FGE0=;
        b=VszKozBOX3h1ORlbWORCctygT1boYtbk+oXFweszOMLuxE0tTGpsXDevNDvNmPw1Yj
         AMRd8EhHDP/5jL65oLNVZVkOOHMMCT3TinzbUd1suN9REp3vtQioLsGQ+czqAbPG/t5J
         ie5kIebVwApYGhscVy75R6gN/8OQcbZnSsrL/C8tbri5AcKgzApzIysLdsd4nyUQa8vc
         WRHUHLk4Dwl1zpKRre77dC5oKkfrFmQWzdiTs4nHs2jgJRwUU2OoxPcmA6mtxYpCmerf
         ZyXyP+r95c+fL4+XP1iIuEfZ54hDZVtRLVFxSxuN1ga+WFpDquLO59KHkxLmHUgkPQNX
         oXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729428999; x=1730033799;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TgUWrWRIiNQfKrPYF7x5YNeRJ4uuAQZGRGkDi+8FGE0=;
        b=GYk0yu9HK9aWk8miTLDIDrR+A7zex6O61Jn1rNWr0rBHD5wpGmg11UyAcC0hMlczNr
         IXEBwcgK7tSDiGBaTS0l5Jb2yssST+o7UhlCqSp7ZzMKbe7utATKQKDWL+PFm8D9kFDq
         eguTyoFYDYCX0uQHaIRaiWjREPgDPIaRZugac9GC3IGsJEfFL30muZXQNuDGaX5Gx1hE
         qtMUotgOUlX6pG1cT5jYl8eK8j2TvaEnVbpWHaiIqksnXF4y2u0ZX52fRrzhWhSzf6M0
         sS89A5CruPdkyBh0QSMAwlG/DwAxguAVaKi2GYlZ9gB5goqdIML+98GhVIq8fU+IqOzq
         rghA==
X-Forwarded-Encrypted: i=1; AJvYcCV1QATb2diNeVXksFgf4O5wRCWFelEGHjy1BEpjsGygByVtmpGbL39C1farGglxIUb07dysgvVFrXhG@vger.kernel.org, AJvYcCXX3ixL5KRRE/2IuEG3Fsn4YzxE9YTAIEQIHqIPNsREzV+wD+FukitdJ0njOJjWQIPCFj4R0UeS@vger.kernel.org, AJvYcCXb5nBFlMwmcGlLUqOwgeRAYNEli9OFXg9NQPGv0hDRtxslOKrTMjpL8QTL1t8m3iP03CYizkdSd8Xzgas=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbMf7dPx/Dq1AZHbKZEhZcH798HjpDfjuAR9Q/pN9lIPnkCoaT
	wSVeG8jSatjqF1K6p1fBHXpyuSKM8245usmk3PMYkNVI9ybxirnMJ6Wv/n+6
X-Google-Smtp-Source: AGHT+IFjVzRJTUQyEnMkRsreGeJvgRrpUgUffO0pWo1hLJhIubsHlRfX0VOhhcIfR+lgsMKjqURXTw==
X-Received: by 2002:a05:600c:1d99:b0:431:59ab:15cf with SMTP id 5b1f17b1804b1-431616595bemr57538105e9.19.1729428998355;
        Sun, 20 Oct 2024 05:56:38 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-5fe4-91f7-fa4f-9c21.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:5fe4:91f7:fa4f:9c21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f57fe00sm23010755e9.20.2024.10.20.05.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 05:56:37 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH v2 0/2] usb: typec: qcom-pmic-typec: fix missing fwnode
 removal in error path
Date: Sun, 20 Oct 2024 14:56:33 +0200
Message-Id: <20241020-qcom_pmic_typec-fwnode_remove-v2-0-7054f3d2e215@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAH+FGcC/42NQQ6DIBBFr2JmXRogtEpXvUdjjIFRJyliwdAaw
 91LPUGX7yX//R0iBsIIt2qHgIki+bmAPFVgpn4ekZEtDJJLJbjQ7GW86xZHplu3BQ0b3rO32AV
 0PiHj3Bql+UWZoYbSWAIO9Dn6j7bwRHH1YTvukvjZf8tJMMGaRulro7nUtb6PrqfnuYygzTl/A
 Zq3ebvKAAAA
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729428996; l=1334;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=o4hRuDeci+lewqXrEpMnVxOP+77ejmgwOUR3uaBa0eE=;
 b=OjvXql8067L0bHC8C+OSOEfo15pc9mk5DVD5q4S0WYLHGXm/GhSMkdNKTCR3a9+JE2Ki9xoSo
 PRo9R7sN0DQAvcGRUKucm4CUAyKpvXHckK/dQgb0xW/WTu50dAaRTFC
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

This series fixes the handling of an fwnode that is not released in all
error paths and uses the wrong function to release it (spotted by Dmitry
Baryshkov).

To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Caleb Connolly <caleb.connolly@linaro.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Changes in v2:
- add patch to use fwnode_handle_put() instead of
  fwnode_remove_software-node().
- Link to v1: https://lore.kernel.org/r/20241019-qcom_pmic_typec-fwnode_remove-v1-1-884968902979@gmail.com

---
Javier Carrasco (2):
      usb: typec: qcom-pmic-typec: use fwnode_handle_put() to release fwnodes
      usb: typec: qcom-pmic-typec: fix missing fwnode removal in error path

 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
---
base-commit: f2493655d2d3d5c6958ed996b043c821c23ae8d3
change-id: 20241019-qcom_pmic_typec-fwnode_remove-00dc49054cf7

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


