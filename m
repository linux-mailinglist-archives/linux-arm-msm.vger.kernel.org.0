Return-Path: <linux-arm-msm+bounces-82634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A68C72E89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 09:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E6AB8346184
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 08:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F603126C5;
	Thu, 20 Nov 2025 08:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NEmVBWay"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3DE31076A
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 08:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763627285; cv=none; b=sTdVlUOVhAjWWrmNDZstWGv/hnSJTmczemsHNLIhGJQwX61JEI+TqZGrDTtx1/YKqnwxvzhODhgApsSvfJnMD4UHRtYOQwlXZtL8rrbY4LkctM+wGkov2VI8mYx8KXHpTeg76BxHH2YbZJ1et8wMjqDqWectuTZ8OIi9Ec6cSTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763627285; c=relaxed/simple;
	bh=yhkpPxnqJDDLNcpmyWruX9obDzPE+LZGVXZ2KcFXexM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GcI3Hm3p33Qx8BRuIwWK6Y8Nnlfmn4mhDaOOQ6dqiSSqxH6s6ReRkHifV52pmByGXRUg+Sz9ehkb8+XcATpeq3XZZb7SPZk6KxlPbcURlIs6Ppnt9Zqiohx+97u0gJidmDr3fxmAvolt3XW0ethoMc+zk561nc5BSmBquXimUcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NEmVBWay; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b31c610fcso471137f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 00:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763627282; x=1764232082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mlo7c2AgCPZO22byEKaD7zpgLlt4/Jhg8EPgXCe2PfE=;
        b=NEmVBWayT10zNhWvI9x+3ERoFbXxYWyxeRyxB1knm2i+giftBrKl/g8IhdXuxCdSaz
         s7H5HfUgn/qqtnO4mRiZjTJITVnPGiH7TO0FYMIgRwJFI8vst9vmlgOyYWqqYRt4iUJ4
         fSBt+9zKiiD7X9qg4ZQTuaClWu+ZTnSNoWghtopXMmcVN/ltF4s2HYPi2eapHDH0C1fF
         ERuVGSJKOFOjIZMXIKAFS2D2i4rrrBf6ztKAJ9U5fiNAPCK3pOHtYX3eCSURG1tWOR4o
         cZH6lHnWFZWCP3vQHQLRz7VCKwVHcqoWkNycKhXWD8I2l7aEeIRbj8vz0V6Q5JcCN7QE
         ecuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763627282; x=1764232082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mlo7c2AgCPZO22byEKaD7zpgLlt4/Jhg8EPgXCe2PfE=;
        b=gDmPk4iE+lkDN3vgwc/a0vgpO6AjZ1B1Uel/1EszDT5qljDducVty1C1+jbcbG7b/p
         J8lcVJ//SxFEnpxT9bvUK1oKXIAj/LJITMv2NuUyoa8WxJ81vFGzn7zwc1PbceWUUCud
         A/X2EgLztmXFWSg5OZ/HvqqwF23yKWak/sowJR2CSVrz953jLN7tb0tKTbYkomQKPxmc
         G4IDqOWmdbShNkPy8n4OsbeMemVwN8XvWhVwJE94V4BAsO91etFE5Zyi5ruvPVFE9a6l
         eohXEO6tobCcMCEl0FmpeYSK0x1AtYgbcvYN/MwjTMruEoT8YTtvQKW5UGlSKri+4goy
         etWQ==
X-Gm-Message-State: AOJu0YxeGbUo2EO2IzZHolru2wKAxAWTB3cCqbvwPESKxZmFA3WXbKE4
	XoR0WSYkB/306y7t8eW13THP7gjaAkE0t1N4BpEFtYFLukotyuSrYhnpjk82Y1Dt01s=
X-Gm-Gg: ASbGncuYKHQkgzFECoQNz/ejOVoi44OiFkveLRrpwOx7M5kACT/Yy434eHIMqRaWYlI
	yQ/nXIF5x4kWl/e196bQq9SRPRH18Z83RDgq8eDLAMe+zeJfXv+ghyRiXPwY09L+5NwRlcowVBT
	qNGsl21N4Lsjo2NjUIrTYLHe7DqDqwfwtb5zYwooVH35ZVWOPs1upcDWqSipf98ksBPrkO2Mzzy
	eR+GV7zeq92Ri0pDMwcr0StUhAeloxpPHb8SDF0LIAlTDPX6gyJ2ZuK2lg18UmP4M8pvI1BiVSH
	IaHDQC6qBU1q2MCwFM5HDPxVkWC0PhduW8dQioP/Fd/Mp6i2ErVz7poIoGOXo0o1VOGfTpai5Lz
	zg5pw9JQZzhLgaGkKilfJDvDWio2oBKIxQP6tZlqsFARHVYLQvtoaDl+BqnW4HXL/GQYxmwfEfG
	K31c/vUZ7/26HW6w==
X-Google-Smtp-Source: AGHT+IGv1wI9Mex5MR6LhGondGBzHUMhvEHUwLQQRyoNfYLNUrW5taMy2GRtPkKsOOLc8k2rYMZtww==
X-Received: by 2002:a05:6000:40de:b0:429:c851:69b3 with SMTP id ffacd0b85a97d-42cb9a5c52cmr1470208f8f.30.1763627282223;
        Thu, 20 Nov 2025 00:28:02 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:37af:6c1f:28a:47d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8c47sm4159539f8f.38.2025.11.20.00.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 00:28:00 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] MAINTAINERS: add Manivannan Sadhasivam as maintainer of PCI/pwrctl
Date: Thu, 20 Nov 2025 09:27:47 +0100
Message-ID: <20251120082747.10541-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Manivannan is doing a lot of work on the PCI power control. Add him as
maintainer.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 59b145dde215f..549e51e57c4cb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20100,6 +20100,7 @@ F:	include/linux/pci-p2pdma.h
 
 PCI POWER CONTROL
 M:	Bartosz Golaszewski <brgl@bgdev.pl>
+M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-pci@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git
-- 
2.51.0


