Return-Path: <linux-arm-msm+bounces-66577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5591BB10C98
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 16:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FC41B03692
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 14:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 029EC2ECD06;
	Thu, 24 Jul 2025 13:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N0iRzo/H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338AA2E6D3D
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365411; cv=none; b=Ysc6Eu4IV4gbuV/iKqmJTjvWxJeGiCs9loX3vn2le+kw4xr+rwua0gmhDFwnIjzh2pZOGx5SGvnEaTuOFuqIXNufS5wEUlazIUN2EPR+78ClDox/G6Hbp1JtVsVGD8nJi0PX/IiIPou4vmJfKv/Lq9+XkHXVKjGNZgwgfUBZHw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365411; c=relaxed/simple;
	bh=wEuXEElSEoeDjBLwM+2PEoqxG10Mf5YuozE9z8W97nQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c2I5aUU4ohHaUaKbtGwCmZ24GzEa+nQzdPXd0CW7WLwb2IKceMye04RhC2UfZwvA1ZcsXW28EoBkUOQ6oJJAci1ZSqdm7TkHBnG745oqtpSKCXm+ZId0zNqsF0KGyxQLPJyA4XPIxTpOCfdagSk2WNb3LYFjxhlQNbKph6cjn0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N0iRzo/H; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4561ed868b5so7223435e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365406; x=1753970206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrjIGy29vhQmG8TWG3X2445EHE3hkTtQk53xAku5ZzY=;
        b=N0iRzo/HSw4GpGt17bXx6b6/O6ZuRBfug9PwLPcIbNX++v94NlSmli3aFPaEPK7H5r
         iaY+TKWGEB5SfGBTAh7kaxb3R4rulLXH1c/u705kGj2fk5OEnziJZSORD+5Su9Df9h77
         SLXNpM5LJtstYeKvG/AH0aSMHepM9tbTUo5eL/B4hyAAksFCeDY9CAq9DFQlQEHRxTmV
         frlisfgdDdcs9lsDMmzS2iHl0vq2a6XGezRMSPMqVjbHSEIx3xFWhpPwCvrtRI10jRXY
         fC4BJZt4VUx3H60OGMoh0qoSCptGcgPQlwoEEPuFQKolRFeRV/gh7d0hfkHSSyOK/4y6
         sl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365406; x=1753970206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrjIGy29vhQmG8TWG3X2445EHE3hkTtQk53xAku5ZzY=;
        b=RbMwA99w5ENrf04aBw+FYDQZCyHzayvmtW7iTbWMP103/Z2SzqrVFsQvgSMPslOxVt
         p1gqncd55CTk56y2Igo8JxJTgvFfsb7g1+tUWNBPwQb6+pQAwpaaacYg1k+Jdl05Nksv
         /gtguBcPohrzEIht1q/yf+6bPl4kz3OlxAHhl5SF2VMMwzbINrjJ+kcmtoAgRAXXnggL
         MMqSkXp4Fu+Th60ZVWI5vLepyHDWlUD3m5enWUcvA569RIoHREniuhdtcD3XN4PNy51Z
         NHbZFpwrXF43gmmDWdOjE0fE3PzMgbeVShA31leIjDwQhCgJei5wT5Ulx4VgJ93j47e9
         dU6g==
X-Forwarded-Encrypted: i=1; AJvYcCWDHRSKc/QhvdadPlJIYOMkd77YlT44U6HTJF6WgwDU5RjX3pvynxSNL005JvIkFrCdLMdsLavay0WQkpD1@vger.kernel.org
X-Gm-Message-State: AOJu0YzIfaS0mxB7kcnm+lc8kkxsWa8xGus/pj3h8zmpiF+I3/dELM11
	fbrjiwpzuyioBQ+OmtVsd8QL/ZRZXR4OjBzqaDJvE7Z/qvDES7X5Pf4Pj9TwoaolNJA=
X-Gm-Gg: ASbGncvr0FYBNjflfdtA4eo1lBHrol9SAltLnRuuKrYq9uZ61/T611/dMPg1HiAAKTV
	HJ7vx7XF2KOKeLwIpQ7gE49/rlsdpyJ0oDbH9sQFBQeB3eVYIB8R7RxO7wLYJh+ZXoP2XMiAuEC
	sZpePxESD+EZP0eN/COhA3b7PPyWJ0rAEfRlWn3CD/vaTRD0H2m1uex2Mh4Wxkw6Zn8Ern4Sxxj
	X1pdJmgOuZL3wDOpBcLUd8QXaWO7R7jIA0s9Z+mRw1qNRNSyE6AfegBzmt/8bCAZdMR9DasLpeu
	/gRT3KYgYz7fn7KO02WHuVBFikHXi8Hz0cgdpzYwyAtmSLHe4Ldf30rRpkQtQFBG5XVXUl3QnWb
	4/Zy0USto5MjXaW1lH1i3Bo8gx2/G/61orq4jpiyxMsrmDOzm9Zv5Xb2CbOh3HwhjmNWm6n7mTy
	TNXW34FTWHEDG0
X-Google-Smtp-Source: AGHT+IEVcqWnuyhtVrHKBupbieg0QvSQq5CXC89YW4ucbe/Xkxqrak9r8AlJ1/jdx+SIbeQvU+walA==
X-Received: by 2002:a05:600c:8b70:b0:456:2b4d:d752 with SMTP id 5b1f17b1804b1-45868d2c4cfmr54619365e9.20.1753365405757;
        Thu, 24 Jul 2025 06:56:45 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:45 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	eugen.hristev@linaro.org,
	corbet@lwn.net,
	mojha@qti.qualcomm.com,
	rostedt@goodmis.org,
	jonechou@google.com,
	tudor.ambarus@linaro.org
Subject: [RFC][PATCH v2 26/29] init/version: Annotate init uts name separately into Kmemdump
Date: Thu, 24 Jul 2025 16:55:09 +0300
Message-ID: <20250724135512.518487-27-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some specific firmware is looking for the init uts name region.
In consequence this has to be registered as a dedicated region into
kmemdump.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 init/version.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/init/version.c b/init/version.c
index f5910c027948..364e7768da68 100644
--- a/init/version.c
+++ b/init/version.c
@@ -53,6 +53,8 @@ const char linux_banner[] __weak;
 #include "version-timestamp.c"
 
 KMEMDUMP_VAR_CORE(init_uts_ns, sizeof(init_uts_ns));
+KMEMDUMP_VAR_CORE_NAMED(init_uts_ns_name, init_uts_ns.name,
+			sizeof(init_uts_ns.name));
 KMEMDUMP_VAR_CORE(linux_banner, sizeof(linux_banner));
 
 EXPORT_SYMBOL_GPL(init_uts_ns);
-- 
2.43.0


