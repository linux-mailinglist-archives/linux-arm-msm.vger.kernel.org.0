Return-Path: <linux-arm-msm+bounces-52947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E895CA77763
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 11:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 618B116A3FD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 09:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C481EDA09;
	Tue,  1 Apr 2025 09:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8ssTNxH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208481514F6;
	Tue,  1 Apr 2025 09:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743499024; cv=none; b=QRdRrgr0y1SoYRNgDXv271G/0iHvzSV0TwHXUH7uGpCXphjwHSezmgq0nc3lQgsPY3/qyWa60zIsKEpdpfuzv2d38Se0t+JqcV0NcrmFtFtZDhbnRlWHtjSHWbdkpxST50YwGpJ3cQqCQgXDQsRfclpY7KEiXIJFIRLkk+jzsbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743499024; c=relaxed/simple;
	bh=PXFATimqMqSBc1k8B3/5XU/qx7AM9Z/4Y86iX1AA+1o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tAQ1fiNHHSQOPhSGTULVbYi4TnLYiEIKCOCZtwKVWFDzeeClY+aBUoHe4PI4JTuj7XjqFGkkZPKYPSzJmlvyQUXfvZlF7ke9OHnQKybWTZHe+uaViDfvVXHmZeYQUdzN0NXUlJolDI8Ipp6QdBNP28AW26M6m9v1XqHgpM/om6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8ssTNxH; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-224171d6826so76646745ad.3;
        Tue, 01 Apr 2025 02:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743499022; x=1744103822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GLEyWRUn87tdAHFpsIgdK3yHHnhiGzWNhKJ4cVG5iU=;
        b=V8ssTNxHEn76vu4tZaSLUrHsqwWXNFCZvo8Tx/5mFNizbL33LZXrc4DsyZfSmhPg+S
         c4uUb6A20tUJydDF/izyc8pthOrMxBqrumsvI/gYKYPuZMrbmnSyXrWikQsrcBq5G5nB
         ZKJL8bUouIBS9lY+BgEwSMqAKCSjYn+Af6yxX+hexKceZiF4CJRtu4qV+PU3NqMx5GOh
         PNrOozIniwX47uOjmpNz94ymZDGBHe6gW4K57ADsm6vP8/ETx0laYacZw1LKH0gvsj0k
         ccwwrn311sdJKX5PVV5Fc7S2dxWE+uDOzCBD/L3LMoREp5p5K1Fc+Ig+fFGU/Z1wauB+
         9XYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743499022; x=1744103822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GLEyWRUn87tdAHFpsIgdK3yHHnhiGzWNhKJ4cVG5iU=;
        b=VWq71E88oVZS+xqYBpzosA0KpMI4FwD+JFl72KDljJCukHus8H5qznOL+YoZsRlZEo
         vPfAhQ5WfEqLPwBoBsgRRt93/Ox0OdfYHnLrrMmAjU1M8VVksiwcpvZiWXo2sfTrljBl
         5HjSI/dV54Q1kIpjHSkL0QwuVxYOJPNTOIdetHS2b1yI4ul8oFynUoAohNcJmSucrkaA
         jHLl7sIDDb+bg4BJT1f67kjYg2yvVbOItgsF0+inPZxdMmuONrKh0y5AV1kcclRQJen3
         imhCo9iXr0aeI1jhms0ZtrslzFnJVwjZaisrQ0W4tO/4ZvK1NqhKGAO9Lq53K7k1egrE
         5+kQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+DuoqGpqN4etZNo/Vb4uusE4DVX5yuUA1MxD7R5jX+6QZfqT7gM3pMSUu/z09JqWiRjVzEkAbXX5Gyc0t@vger.kernel.org, AJvYcCVBIoDMtDkXhQNbtqLkROVTO/yXJkPC9EHPUiLoVbRsV4d+jytNYaLbbzYnMAfaXxnZSuLatNVW2WAX9u7b@vger.kernel.org, AJvYcCWqi63rRC03sgeaavQ98JALkq22fdDRGfVN8GtAt+fz2G6Wm9/gTMDC9/iuaXyaH/oi2Pm7ZQWwLcYOZm0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsduIx3EqanNaC3lPLHS2fGChTXGDzmj1pmFOOg3GdCsVmQbDd
	BVeZuUeNec8evDi6k2vhZNIoHTDzTxRI/u2aASLLp/Fwx7xBrPbjyx7z/rKiUoE=
X-Gm-Gg: ASbGncunKtlaCZJ607Z/ea2Hh9ok7ieoPQwMBgvWdqOd9gF58ewuFwEEa4UXfufCKRM
	cQBvyJxmpOJV0vj4hUCfUD6vo8IpTUTywRgNVw7mGFkToB4FPYk/49qhMi5reHjiV/HleY0vouG
	vGXQY8v/CxoyLGgfxX+j5kVYL4ChSmfaOTpZS2tr7Dnbx6oVgEApr5axVSqsSnfsTqnNXGJbHLG
	qeJKfUmxV1QwZsGCIByisqZH9PabtgS9s34eSuZOQBOU17gY1SyD1GdTWaDYV2JH3CLZ1EEsDHW
	Z0Ouuf+XmRqoLJCgT8s8WeePYAqkE45fWRtAy3qC2ZQ7U3x/UcIdFBTUNcEBTGxbONPDAcmMUke
	+U4Tdsg==
X-Google-Smtp-Source: AGHT+IHunF5jyUL3TmPXi3AK47epCDZ22lyUsYqq4UiVJYVJRr74B+C/7SC7nQxjxJzTz0Tx+kvJng==
X-Received: by 2002:a17:903:1cb:b0:223:f928:4553 with SMTP id d9443c01a7336-2292f9f7646mr232149915ad.44.1743499022271;
        Tue, 01 Apr 2025 02:17:02 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedf9b4sm83492285ad.84.2025.04.01.02.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 02:17:01 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: danielt@kernel.org
Cc: lee@kernel.org,
	jingoohan1@gmail.com,
	deller@gmx.de,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4] backlight: pm8941: Add NULL check in wled_configure()
Date: Tue,  1 Apr 2025 17:16:47 +0800
Message-Id: <20250401091647.22784-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Z-uqpxcge0J99IPI@aspen.lan>
References: <Z-uqpxcge0J99IPI@aspen.lan>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_kasprintf() returns NULL when memory allocation fails. Currently,
wled_configure() does not check for this case, which results in a NULL
pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: f86b77583d88 ("backlight: pm8941: Convert to using %pOFn instead of device_node.name")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
---
V3 -> V4: No functional changes, just correcting the version number
V2 -> V3: Correct commit meessage and confirm this patch has considered
resource cleanup to avoid any subsequent issues, ensuring that errors
are handled properly and no resources are left in an inconsistent
state.
V1 -> V2: Fix commit message to use imperative mood and wrap lines to 75
characters.

 drivers/video/backlight/qcom-wled.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 9afe701b2a1b..a63bb42c8f8b 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1406,9 +1406,11 @@ static int wled_configure(struct wled *wled)
 	wled->ctrl_addr = be32_to_cpu(*prop_addr);
 
 	rc = of_property_read_string(dev->of_node, "label", &wled->name);
-	if (rc)
+	if (rc) {
 		wled->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn", dev->of_node);
-
+		if (!wled->name)
+			return -ENOMEM;
+	}
 	switch (wled->version) {
 	case 3:
 		u32_opts = wled3_opts;
-- 
2.34.1


