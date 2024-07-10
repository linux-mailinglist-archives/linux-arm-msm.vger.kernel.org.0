Return-Path: <linux-arm-msm+bounces-25811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A99EC92D01F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 13:08:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EAA328334F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 11:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3CE18FC7B;
	Wed, 10 Jul 2024 11:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLOyAksa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D09918FA35;
	Wed, 10 Jul 2024 11:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720609701; cv=none; b=JxfWuoOZM1wJ3ZVDctONuEwyjiF/XX0dI/y6Q3u6u49PJe4p/w7NCKd6otz3NEh0eBO6I4L0Ux8325TDg4Eegq8QJAdCkFx/aKvWhvHVWZxIb6fYaTM1skpb20DzjSWBLK6UwDkWUdQH7p8HPt7HOTGfmckz+7HyR8Cl0rH2hCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720609701; c=relaxed/simple;
	bh=SwL5TVDUykkBPz8CWYeHIj/sJyJG+DCt2K/keOZiI/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m/tznSEyJTYYJhZQ3fQOUorDRVU5MX3BoyNY/8mV9R00YO5tXla2iIoocfe8NMBp6YKIvvZvanj7Bkyo4ueSRYVNc9c93/1aeyRmEtGRLmXNIMxf5lQeghXnpOZdUsylnHraf9F118IppDcbCLGmIusjsYM1tQt5M9b9IbBXFNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLOyAksa; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-70b04cb28acso546028b3a.0;
        Wed, 10 Jul 2024 04:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720609700; x=1721214500; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9MLBAAq/8WgkXtZstYMuDUrrVfHrmeGeX9XzyNmKcDY=;
        b=iLOyAksaIQVRSDT9qSS7DvTCBH+H9zDW7zJc7+vXlzcx0530E4ZLyaXn9fwWUffW5B
         MRcSLjuaUize5gGeAg6g+ZhbYyIDLnxhmaAD9lDEuzcIS4O+MniVYiJSb+xyV3WGZ32+
         ANgX70M10ayoO6Zennoj8p+YR2C06ys2Ox3MEMmoK1kaPqqmj9g7zd4oM0eHI+JMrK40
         qDXQ5dYcklj3ZvwddCBoCkpxTPzuak879FePi69Qm/LNTASlD1j1Yc+EReT3fFxsjqww
         Vaj4VmopoTAjdac+S3SmC2Sc0mpCQwoXZmglJETeI4BIFoUL0GbJjSwEkQzUIhlhNiSO
         P0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720609700; x=1721214500;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9MLBAAq/8WgkXtZstYMuDUrrVfHrmeGeX9XzyNmKcDY=;
        b=IrmvVHrAUWrDzXZr+Z+Gk0aId6cgmZX39G4+vubkubXpKJF0xn9Ikem1MysjrsQBsF
         6gWoXHznGsxk97BjgmkdVv3OgbpbtIoz9B2C/zQ8mNcLckL9jCJEhI2SIM4uEa0pto1C
         QthEs7MjEn30K+ppFuG+mS5iSZ55R91ht033LKveKAODGQhgULCFA+SPAuqRds0QrO13
         3HTaaisIDrFJE9rMuwgBebLJft3TkxrPyXA9rEc5wD39M0Y8nmEkP9vaNkarwi21i6s/
         YigrwxUVAzFuuw99XjkLuW2auHyrTjj+RzscC1sr7XQWjE489l60Fg7YDjU3jPG+KXSH
         +mqg==
X-Forwarded-Encrypted: i=1; AJvYcCXIB7P4iEfNe5C/Bje8SsCCi86WulzOZ9uSMljBNelGcfelheuprWBGE1eTW8do43/j4kfCO4RfP7bYXlLtEgp7Z6DCwydLlmzEas/4sZZr//GHAana78LYF0JIXdg3VpPzCAivg3JQM0DXxA==
X-Gm-Message-State: AOJu0YxOYXgIoC7uDxM5b1bkn/MiZMtejM8jRVA8zctxLohV/nbG2yaU
	CQo0xa7dwA9Rn/vwuPZ6l7BJn3unr2AMhpjow52ezig0GafqR7P3tMKAOQ==
X-Google-Smtp-Source: AGHT+IHc7aGV3hUz/Oxgaox34zwvQkHcSeFQ8Mx+i7UcoqC1Hom/gQ3uftn0TTI5zfpnw+/wHiUMeA==
X-Received: by 2002:a05:6a00:6903:b0:706:a97d:ca1c with SMTP id d2e1a72fcca58-70b44d60dadmr5941791b3a.6.1720609699681;
        Wed, 10 Jul 2024 04:08:19 -0700 (PDT)
Received: from bnew-VirtualBox ([2405:201:3020:7812:b416:d4b5:f43f:6324])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b43899705sm3491936b3a.1.2024.07.10.04.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 04:08:18 -0700 (PDT)
Date: Wed, 10 Jul 2024 16:38:13 +0530
From: Ankit Agrawal <agrawal.ag.ankit@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/clocksource/qcom: Add missing iounmap() on error
 when reading clock frequency.
Message-ID: <20240710110813.GA15351@bnew-VirtualBox>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add the missing iounmap() when clock frequency fails to get read by the
of_property_read_u32() call.

Signed-off-by: Ankit Agrawal <agrawal.ag.ankit@gmail.com>
---
 drivers/clocksource/timer-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-qcom.c b/drivers/clocksource/timer-qcom.c
index b4afe3a67..a66fa7f8e 100644
--- a/drivers/clocksource/timer-qcom.c
+++ b/drivers/clocksource/timer-qcom.c
@@ -233,6 +233,7 @@ static int __init msm_dt_timer_init(struct device_node *np)
 	}
 
 	if (of_property_read_u32(np, "clock-frequency", &freq)) {
+		iounmap(cpu0_base);
 		pr_err("Unknown frequency\n");
 		return -EINVAL;
 	}
-- 
2.25.1


