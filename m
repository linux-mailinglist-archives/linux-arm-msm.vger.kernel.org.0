Return-Path: <linux-arm-msm+bounces-84231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA065C9F316
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 14:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8DA33A4C30
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 13:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F7C2FB62A;
	Wed,  3 Dec 2025 13:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TdoP35Ab"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC862FB987
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 13:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764770042; cv=none; b=tQF2XGBsvoKXIf6vHrzvJwvCVgofgC9Y1zhqTEUBBOnqp5jW6h+8meJVff8WfPh6HcTSMVsZ/sRtHzCJ4KaL0D2ibW1j4PIikuWr6RSTyoGWPGCKhRzervQhxWmVYkyZDiqLg/2vsz+7W7icA9uqUPBbGL7EKNNOn1gvd5hqE/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764770042; c=relaxed/simple;
	bh=vMhda1+AxVHv3TrgQbdTvSItRk2i8ZQuMHNHAdy903M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bUCGXL9Yt95oLcETCzqg8nn+Zu/FMfLquIkEx4/i4oXyQmakTDuvthw3RngzVohUD5oE4+/H1YwXw7ml9D6nxMSWVvoidmEBaBziUje4He7dKMaE0dOPlaov/LOSXwJqSzeMuLiGKVQiIYVafN8bvgCNmXXNxjAaVwj0z3vZ2Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TdoP35Ab; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so62562505e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 05:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764770039; x=1765374839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aioLnfL0bmSCseYA1z3bCzauxJY/fb2sxvmbPwmSqFk=;
        b=TdoP35AbQpGy6nTqpk4xTaaWx572rIhdgaXrFa93mJGDzNeu0lKDFllVEgg+BdBUMk
         wdA7INALVZEZ26m13PhN+xjmqhB4Bz6BFVE4whC+eo4CnpI/dC15BQOM6R2VTkITtCyz
         Wzrw1Zvk4izL7z9J4V4xVvaXicbeOntWwm0jJxClb9UtrIFOvDbty6/m5AgJVnp/bcMC
         f6LyvO/OkNAioNFhPzaNVKUc9JC94nAxulhgkfgy/qT49yXeXn7Pp3PjC9iFD2SCdK74
         x30OEQNPgjSMzheN99ui3YHYFHwN6g2wNigAUORM3/Dj1emenyrD0lkdIF2afFhwMGZC
         SNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764770039; x=1765374839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aioLnfL0bmSCseYA1z3bCzauxJY/fb2sxvmbPwmSqFk=;
        b=jnQeRzHZ25MuJzcsIrlyGU2IisfFle/UHgFiClfYMO8S0KWNtQmdf8qkK/B3EjV9HM
         o8xUfLIRxtAZi32NYCGkbGKyF6HjfYl/a5dDwQXdE4kUPP39daUszKXTAmFX1BAFQAd0
         uQgBmhi/d0tc2YAU8x5GyQfowzHY2DMeV0laxJ8D+NF46bQ35u3Xsety6oxwyEcwmk6i
         tF0gd6LDMUBL+bz7mNjCf934bv6lO7gRad8K2+kV+WCVR9XHLzYGu+VExQVXLuGAFD+n
         nNmFPn25FcF8cN6tMl8INQUfUn0YHpQG36HTa05Jmi2Zk9sQi3ztiOIjxs1iTHxic9AZ
         NcdA==
X-Gm-Message-State: AOJu0YxkIyqqoCU4I262xEzZke0L5Ka9G9e7lan4s7Cl7V51sXPlfb7Z
	Ts8821xrKFkZofQNfj1F9UP7QXHTpm3dPLCZGwUDuvwW5LPfWtIHNB7h
X-Gm-Gg: ASbGncvVcbi/iQV7cE/xjvPg0Phee7uXFrA3SFmr2SukfaQu2TWjq3OyLxSc6o+04iN
	Mzm/D0GT+wxiBlB+4YQWPKjPCk3DRjW+qBCrwAA6/F5zQBWwi8q58qhVmoo6UCBItZ2BIIomaQH
	UNINJD9oQxDb/rRUVEsrhpQplb+Sgx6Uzl1LFZF2ArHsLLQQk3xk/q+eQUFqKGHlCbzIGvHwdqR
	qwASGVKuSlefmhALZV3IjHaWwpZptP2pPzsYmZnN4iw4sOZF09AntQWGBTssBHW6TpP5ZbTyAIF
	5NXxSD3aOEIiMTv/QY+tZ8WuOTKKpBSIrzT6KN0W6KHxdbRv+y7C5jjm/g+xJefbKASqXw+ZqnQ
	MutAIP9RhQPU20OMrCRgRVY0hKTZBWoQoeWNb+yhOZQgz5lFhg2yAZJyrv6qen0AVeTpI+8f6NY
	miu1TeMumvDxqBLVUoQZdRuIftDC7GGaqnkzjLBmrGUxOY/MomgcvwPzFWZRn1ECKX5Vr5h6eVI
	uIqUHzXvjbbZaFkbWISWd+1yCNhdPnwpSph9DFn2w==
X-Google-Smtp-Source: AGHT+IHLG32qs9q4BIvUufo8fRRc6s9UdvNAPM7SZhhOitCuO55lRlGiuwa7xpNAuNetcMHEaEZUYw==
X-Received: by 2002:a05:600c:3111:b0:46e:7e22:ff6a with SMTP id 5b1f17b1804b1-4792aef705bmr26681805e9.15.1764770038569;
        Wed, 03 Dec 2025 05:53:58 -0800 (PST)
Received: from labdl-itc-sw06.tmt.telital.com ([2a01:7d0:4800:a:8eec:4bff:febd:98b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca8e00fsm40433575f8f.34.2025.12.03.05.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 05:53:58 -0800 (PST)
From: Fabio Porcedda <fabio.porcedda@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev,
	Fabio Porcedda <fabio.porcedda@gmail.com>
Subject: [PATCH 6.12.y 0/2] Backport support for Telit FN920C04 and FN990B40 modems
Date: Wed,  3 Dec 2025 14:53:51 +0100
Message-ID: <cover.1764769310.git.fabio.porcedda@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,
these two patches are backports for 6.12.y of the following commits:

commit d2b91b3097c693f784393a28801a3885778615df
  bus: mhi: host: pci_generic: Add Telit FN920C04 modem support

commit 00559ba3ae740e7544b48fb509b2b97f56615892
  bus: mhi: host: pci_generic: Add Telit FN990B40 modem support

The cherry-pick of the original commits don't apply so I made this
patches after fixing the conflict.

Regards

Daniele Palmas (2):
  bus: mhi: host: pci_generic: Add Telit FN920C04 modem support
  bus: mhi: host: pci_generic: Add Telit FN990B40 modem support

 drivers/bus/mhi/host/pci_generic.c | 52 ++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

-- 
2.52.0


