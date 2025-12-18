Return-Path: <linux-arm-msm+bounces-85742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D98D4CCD8FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 21:46:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C6453089E4D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 20:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA332F83D8;
	Thu, 18 Dec 2025 20:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kDore7ne"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5F82DAFAC
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 20:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766090573; cv=none; b=f3R+38JOfkrtPCzc+KvQm1CtypRd2WCe6pA7d/rLs6pqqUVH1VLKvgRMzGrkvlfXegKBRcZun/LzzDNt+UA7BzPsT7omBkKWoNiWlmxrP/CmeFW7JApoT6NuOXRg0DZDrX92a95syOANj9MAGibg9Oprk7R5ZUAG5XA5F5bSU4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766090573; c=relaxed/simple;
	bh=dNB0PmhwKvuRZNdhHI14coEX6jfr7lJJHEa9kfva6WI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MVfX45b1JIBpDNViLNWW4LC9RfgMYLDE9dPp/bgSaz0amVcN3H+05MsDzY57cHRydUSdPvDcrJtyW++oTD+zur61tcXALqDn0wIwJSvTUCOKzXdua0e+z3qF5kqj8uAlJGrNAs4W2+73GreMc/JkBbdV1b0+iviSZPEZ0nZiZfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kDore7ne; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-63c489f1e6cso2072683a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766090569; x=1766695369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7XAkArI8TaofBn2k+TSYsotM1G/lLreSd7Oyuf53cT4=;
        b=kDore7nev7jalRhUQFGkdDb9N3jS2v5E8/S4Otk23c4/iD2lLYE1pQ20M/oM8HXjrr
         hgYhGfPZgvUoZk809unHnHY8AB/P+T30qDhStTMPsdmSY6TXteCiQCBimyJD1VyDDCLc
         hHr1MJbqjnKN7DnStYVr3NkhR5GCm2clQWkjDqR64lF/AGa/2vxKR3RwAjas/OMCt1jN
         LbG9znD3jrdToIwfuUgj+TSJmrJVP9vv3ecev/k16GL+ngOXNOPt+LUlkLKuUNpJGQlO
         7fKY6r7Uaei13sdTNmKYsPb3+Ve71NkK69Hobz138fitvKV5e5PNTbThGMTVhfGamU3/
         aIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766090569; x=1766695369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XAkArI8TaofBn2k+TSYsotM1G/lLreSd7Oyuf53cT4=;
        b=bCkeFRB7/hzOlMh58OSBGtfJBey6wSWW2q/jWnTM3uMP11CJgQVlc2jADc075HdWo5
         jtnvBfGTJqT8Th7DWQbeHui82Lsj2JSaryWJiX5UiYjTzJlbiBq5X5/vKm74hRyTo+Vl
         Ko8Ca6B6kdnz/N40vH75NVcHn+Z4Ng4dg2fQW6a8NP5ag0cSU2BGX0GipRm4g8qLWjmT
         mpdvOfNp4SCkSBYx9Etwy6+XdK02/webLUYH7xGOWtZU1D6c68djlAGT5rrGpRJtSjak
         mt01xtV5wTKfTgi+jeddZBAQY1LgHRDwOwIGFMScGq8Ji4KPYS1LAChivVyldRdjb5yM
         2CWA==
X-Forwarded-Encrypted: i=1; AJvYcCUkKfRriKs3KjhRG5uam5OuUEV91J7AjaLga96Q4cMG81rE9cegxqSei+wXF8cSSOpK6D+sVe1xT+rL8egH@vger.kernel.org
X-Gm-Message-State: AOJu0YwJacZnbSEiyJYhlvaoLArgrYQeq2KV98f0trbWbQHjfr76ILwH
	9QlX9nQ5dUxak3QtyZh4eT2EorilHU+jcBtrtKri5FQ1CV+7xdpyAij61mLXirsQ6PAMRo5tYQ+
	WW61+
X-Gm-Gg: AY/fxX6hkMYUUc3Spnu9oly4NZ4qz/sWYcdmTBzh0FigIL/QvI8TKbpdPqrmLKEHiwq
	DT9Rcke+IhVUWQ9gLdqExYRNsbFmQtTN0eM/d+qjSUQ26mt0HTOO7hyj0MAymWm/u3V8McE5KJu
	ytPxuIlcp5Y8aa53SLvHk4pNjeB1Vpz8jVBvMwa+3ulDU2htC1MSkJIYheYIV1iNHxjBStLsaCH
	J/xywjjeHDDnKHWcdTVFy25os57rSmAGCWkhcnpFT5qgn69a/VvvYGXJAsl4zzVwoysZLNnmdw8
	xM4BS9nMAx0g9Qi6XlCViPJlYHG2fCskcBaOSvTSZDc5TpZ+4nAPwqBStX5xHrFuUIFiusDhe4T
	r+I8OyL2ir0n/7MSpPcNsUfpTpBDNrw5Ubse2bu8WgBJ0VzNhGvYPGFO2AGeohHFJoAhO7Jn7sx
	HcmFyhdS/9R9rd/63i
X-Google-Smtp-Source: AGHT+IEV+YY07VOnpvPuBNpIWqe8uuKBpuHIeLgJMdjAizzdhO4CYKl4vVTvwZlrlL1Cjns9PjC6vA==
X-Received: by 2002:a05:6402:1bd0:b0:640:92eb:aa24 with SMTP id 4fb4d7f45d1cf-64b584ec823mr3000252a12.15.1766090568601;
        Thu, 18 Dec 2025 12:42:48 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-64b90f53c51sm360066a12.3.2025.12.18.12.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:42:48 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 0/2] bus: mhi: Use bus callbacks for .probe() and .remove()
Date: Thu, 18 Dec 2025 21:42:14 +0100
Message-ID: <cover.1766090211.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=761; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=dNB0PmhwKvuRZNdhHI14coEX6jfr7lJJHEa9kfva6WI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpRGcodGuNu6gXw9r5SvXhQunS8yvNv4OlMLejO fdPS/d5Ao6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaURnKAAKCRCPgPtYfRL+ TmvHB/kB0tg29WQDJssCLJqss8qXoPXpfrSe231c+rf0BH5h+Byvh3euS+IpTalGRz5XNwuLQzB uHo0PqxwsWyUs34uS49TCQLFRO2L8DU3GeE0Nk0MAIEOMEy+Hpd2cLwJIbhHWObkGimpUfYqG03 AR18qBiVFYFRH/tw6NmodoqZLhhlcYaXsfzXihuIg9B2CkyBT0mrEhXK6xp08IK0peQXwhKtWwG YD3Rfc8N1gSHZ7S1RUAg1DfFvDuFI7kdAelXTUP0DrvfB23RByqUqyGjRLcp8T79qcEpZloWvY2 5nlYerxCB6foAC/VCeowQ6OLnz4CswmmIzPNaOqw6bNih3+1
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

this series converts the two busses defined in drivers/bus/mhi to use
bus methods for .probe() and .remove() instead of the respective
callbacks of struct device_driver.

The eventual goal is that these callbacks are removed from struct
device.

There is no intended functional change, the series is only build tested
(on ARCH=x86 and ARCH=arm64).

Best regards
Uwe

Uwe Kleine-König (2):
  bus: mhi: host: Use bus callbacks for .probe() and .remove()
  bus: mhi: ep: Use bus callbacks for .probe() and .remove()

 drivers/bus/mhi/ep/main.c   | 12 +++++-------
 drivers/bus/mhi/host/init.c | 12 +++++-------
 2 files changed, 10 insertions(+), 14 deletions(-)

base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.47.3


