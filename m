Return-Path: <linux-arm-msm+bounces-66555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D7AB10C47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 15:57:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C5FE7B90A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 791B22E2652;
	Thu, 24 Jul 2025 13:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NnjTYfIk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B212E041B
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365389; cv=none; b=frxd7xPkBOc2QNsgfGOHXogCkC039M05/MAuLJHbtmM8KGMbOqQn8OQ623Tdsg9wZIO3/bI5YGLPA06jCfJK7nRCqkr5FNTQviue3u5gm6wl3pwDkP6LJqni1p4DwRNj6jUAPZRRt3qjHsTlcF6nwv7YadSsqOo17I/XR9luqQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365389; c=relaxed/simple;
	bh=I45+7S3jIU0dNMjyY0XWrWua5DCAvAPB8OAPs7f8VDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZarstr3a1Nu5W19HIHSZN7FXNAb9r2sOpAgf1w1RswTHUqbRCCVP99f17TGlx5DRtxR8Kba+MyUu/1pQHYCLkwL2YZXVzMh/QLgKWnYS/qJWkT/Oa9nyY7fizkXeexj1JnaxhWYb3MeXuQF21clK0zG2tjgyFKj7co4jRQNhys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NnjTYfIk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4563cfac19cso11040525e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365385; x=1753970185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6vaDGqz93WFfpGOQ4UOrak1EBQhkmEoatVxlVsxTPs=;
        b=NnjTYfIkoofWBpyRAUQVrPINFMHx6ciLZrAV3551c/s6Bj1eu732dX5Sw4jJritVva
         fnALdGP4ixmhlSo2YP+i2J5UVqKiq4Z/HvlNvym7QH1ERjo6JRMClZDHb2+uCVkKv6qA
         SSgQ/q3VMTU/BUyiKphTinzhE987stIVuRh59Nv/roytHJcP8ZDeI5/sX1+TRYO94HbO
         zkCevDJTtJIdsndC2GstqBIpVfeDvKB35SSg28H7MZ0nxa7MNiJzIka4YGQvxums+hZA
         uLxS0NOrEzL1WroNaPvAzx7yd1q0ilyUzo8DK6if+U60oMf010Icukd9OPspDyfp1CPG
         Zp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365385; x=1753970185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6vaDGqz93WFfpGOQ4UOrak1EBQhkmEoatVxlVsxTPs=;
        b=xUsPSLQuWzInH/u3groaB2Gtk878RE2EudS0EZxc36+OAfTzA3pnCcx13Rz3AHcASz
         94KOMlsxSKLcKhQ5f0DUTJmehJHELzCWesz9W1p+3CYm5hbH1FA9G8dZMzHyAeB0RkfK
         Q2n0MlvIrpVavz9Ud3B36oDPTPLMmzbx1Nt+2ogedEEvY+JlcqzLpsshJUKkF8fC26me
         l7eiNXZpHk0Nu9ZiWeX1gUQy/ndnT2kCVkozVREfEHOdAxs2fb1dO6NYgrinJ6W/vOvi
         auN9pQ540oP0mgHaJk0VzpnKK4ZHhCy4bP2/7iVyriNksMur7QwwfpH/5Racp4bgBYCZ
         2jxA==
X-Forwarded-Encrypted: i=1; AJvYcCX4b74xbrbux/IW5WMX31W2DyI0pxkyVz6eSUXmUPdXqXZT6v8El1cHQ4b49dTpoWua5wCdmPX39lN6mJs8@vger.kernel.org
X-Gm-Message-State: AOJu0YzgPfViHgY4fEt5lyYxEYSUk8wdIqXIAxXY9tBzEhbe6MrNEyQL
	KmauIyQxZG30KPZYfuUkzBMe5MjFeqAUQ/VUpu6ucJwQUGhKlp7ciKzlB89+IHSvVXE=
X-Gm-Gg: ASbGncs1ejnBsoKwzuB5cbLbReH+E2z6W0aX2Jabt8mi5VFzLxhysNaX8AxzmZiNqHK
	AviwenPlqYnd1DHglswSqoAyI03oPi935jPY5f89ioTY7X91Y29oAthXw2ko16E28CFOCl6VFlU
	n5Oogq3p13MgvCNeaGuJp76sRfiqyMpiD9MD3zd31O1wOYU3o6L166yOf6Th68Hd9lZnBpYM5He
	PjVUKgCxhDR0rPmJgHX/6fd7F4UXRCPCCbc3gYVSDPYo36njKpSQbbRSx8p/OY2Ki0HVcbTBY3v
	FScEQ6L1/X4ltdEbjywiS93TIO/w7PJJFH0VYrixqeOFHnTgAXvQCxYcRUXX111uS4x0hiS4lot
	xE+7DyjeDMzogBbrnKRkOq/C1v9y+grNICFew/nQdJapoZ/nwZubTqMW6fzkBq53e2skJMMg2oL
	dEhp7WBwTQBmne
X-Google-Smtp-Source: AGHT+IHYnD8d7A8aBh+5tnrqY0LYzarTFZbBZJYJd44Ilh6yiLc/UVbK9j+FmYRR9VqOWZQpLWbc7Q==
X-Received: by 2002:a05:600c:500d:b0:441:a715:664a with SMTP id 5b1f17b1804b1-45868d3289cmr52540145e9.20.1753365385393;
        Thu, 24 Jul 2025 06:56:25 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:25 -0700 (PDT)
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
Subject: [RFC][PATCH v2 04/29] Documentation: kmemdump: add section for coreimage ELF
Date: Thu, 24 Jul 2025 16:54:47 +0300
Message-ID: <20250724135512.518487-5-eugen.hristev@linaro.org>
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

Add section describing the utility of coreimage ELF generation for
kmemdump.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 Documentation/debug/kmemdump.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/debug/kmemdump.rst b/Documentation/debug/kmemdump.rst
index 3301abcaed7e..9c2c23911242 100644
--- a/Documentation/debug/kmemdump.rst
+++ b/Documentation/debug/kmemdump.rst
@@ -17,6 +17,12 @@ kmemdump allows a backend to be connected, this backend interfaces a
 specific hardware that can debug or dump the memory registered into
 kmemdump.
 
+kmemdump can also prepare specific regions of the kernel that can be
+put together to form a minimal core image file. To achieve this, the first
+region is an ELF header with program headers for each region, and specific
+ELF NOTE section with vmcoreinfo. To enable this feature, use
+`CONFIG_KMEMDUMP_COREIMAGE`.
+
 kmemdump Internals
 =============
 
-- 
2.43.0


