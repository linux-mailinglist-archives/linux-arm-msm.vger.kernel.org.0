Return-Path: <linux-arm-msm+bounces-78202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E28BF8047
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 20:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4D367356E86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 18:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 110D2350288;
	Tue, 21 Oct 2025 18:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="qw5BLrfu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EAD34F263
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 18:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761070192; cv=none; b=epcaTYAT79qnjPoTijNXWSnGYWwmzPJO+y/dvdbDpeVEincFHV/5UJkg4UVkKG0mah/Czv2TwY7SW408hZPLoCJ/Qc1hXyhHDdDGv7p4C+yi3JxTDeXIrqG8YXaeWMhmWm2ZofyzkOlKVy6sZGJRpn2vjjRS0UpWmcSDqQn2Ko8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761070192; c=relaxed/simple;
	bh=aRp9PLA2Ky1tVA6uHK/HKcddWUGAl0+QPgh6k0eSPvg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PA2C3qaqcHY2Vs+c4J1DaoCw5++j2Hk2XzBirAJfEmbZUnRD4xcJPejQzgysi5fOkpaRvLOSdc6fISRyHJzXBOhRq/a8CDyi1MIQuR5I40IXeSHA96SaN3l/pF2OFo30LtnXH8Qqi9WYJjrxRM2JxFxkK0p2WD3Xu7v8AFrvBkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=qw5BLrfu; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b4aed12cea3so993026666b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 11:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761070186; x=1761674986; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ruRUvdvkZoLr2jJW0Z1cLwXXKdDFMs/zL2a1Mukfk9s=;
        b=qw5BLrfuRyqVv/RI69PT48U1aQMImgHG4w+IxtLVGQ507YWzAkf/bbWVpcmuHRJBzj
         K/Vxu8mvoIWV66ccb3pHFssuCO1P6Ominbff4HBiJfYnv++HhDU+M98uuD6UOr8D+RLX
         oX0nsuf8KhXvVQJlGjvb7gPKjKNGk1WtKBMrt+Jjo+N/yrJgB3CpMUoLnO2emKkHm8PB
         C7k/qkEGSTeoxabXWNsYdx6oUiVHVqluN2+SVLWiQG6GcU0pZsswroz6rJC1L3o7APtd
         wos/GbE5AL8udIAcGT9a0k7vueCaQMSkDi9f01o2hU5vdB62iztixttAr52d4dPcpT6u
         oNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761070186; x=1761674986;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ruRUvdvkZoLr2jJW0Z1cLwXXKdDFMs/zL2a1Mukfk9s=;
        b=D4XS93vwHR8e3+Mstx3c4d6qIoqIFqR+9e4lqFivQ2ppuVieWvGDFKuBBA6anOrL7J
         mU7elnFuuqdWUtQ+EXXwXdgLvWb50ZznTqxG3fF92Jrjxh771zT7AM278yTV+qi0Kmi2
         SsdcxhT84rB68qGwRrB0mpCat/hmeeGNDOlSvdpIxeFC9d3JRWxQil41/4dMqRXlqmeD
         h7ZwMYN/xiMmxvYa5qVSBPFr0cMXZI7sBtbyEZwwFaxCk6y4n7Zu5q6Yho+vzEawu8tk
         7E+8AjBF5d9eVZ9HTREYlduWZC9/Z0noEwlVYlyjOUgs9OAiKtV3O1bc17BLvi1beFK8
         H/cw==
X-Forwarded-Encrypted: i=1; AJvYcCWslQmUA9RgZgwxZvOvqryd9ZUsHO9YrV3Eqk0oH1b9BYFT+JM0UtX/6puITyH9FPFXE9K9lnRYONXJJf+w@vger.kernel.org
X-Gm-Message-State: AOJu0YysANfFOnP3QgUwrtzHqGoOmhsV3LS3ryYwDQkpwCPzhs0/5SSI
	AWuzuin/xe3AHOy/Kpdi13a4S+UnAao5A3KB/xR5Cd0m15E9xHCR6Ufz+Ie8XYUhN5w=
X-Gm-Gg: ASbGncuj3KD88I+Rm4NzWeW9nSuZqIPV9DSfoHjZXN5hvxwIGsICbWgT63ixd/juDnt
	hnmozuAghEjHoIyX5oaxtvSvELca8WqW96kXg57mzfYLsLw/tOZSS0VIzHdtqtW0SAfBML9mBlM
	4Vdia53oWK7Umi4qjQ+HUTAvBqytRPfi4Fg2BKQ5avn0QKb6p2ksRjA8/AzAsWXuT/1hDoFXmF4
	QJ/miA3orNJG6jAUk3FGVVXN/stXjAdNREfQn3HxWUG2rhVwjVHmC9Ja7Tq0ONnQEk2HF7xZGmZ
	sFn48FvX2EWMn1NZXfEHBgtycKtUYTz2fXkRkUHTLN5rWd+RmCG/UGmLKbNrQ1NgiPhX2KwN9ge
	TThDhR25aLYExyWsb2sIgqKqva3dcyRRo51TLBVI9OtPNHP8z9XG7fXxMisvECUe82fWgeYo1cp
	WG18pLubQ7fcGeIu2JqA==
X-Google-Smtp-Source: AGHT+IE5avVzpvShmbvSnzjVvBNOm23bDLEnbiX6D+4Il8N66SDi+tTOysqbM0IZc2AcphKPy6ifOQ==
X-Received: by 2002:a17:907:25c5:b0:b4b:dd7e:65ea with SMTP id a640c23a62f3a-b6474b365c0mr1913226566b.35.1761070186373;
        Tue, 21 Oct 2025 11:09:46 -0700 (PDT)
Received: from otso.local ([213.208.157.251])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8393778sm1116758166b.24.2025.10.21.11.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 11:09:46 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Fix Agera PLL config of CAMCC for SM6350 & SM7150
Date: Tue, 21 Oct 2025 20:08:53 +0200
Message-Id: <20251021-agera-pll-fixups-v1-0-8c1d8aff4afc@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADXM92gC/x2MQQqAMAzAvjJ6tmAHKvgV8VBdnYUxx4YiiH93e
 AwheaBIVikwmgeyXFr0iBWoMbDuHL2guspgW9tRawnZS2ZMIeCm95kKOnb9QnYdqGOoWcpSzb+
 c5vf9AGVVLs9iAAAA
X-Change-ID: 20251021-agera-pll-fixups-dad6b12c715a
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Danila Tikhonov <danila@jiaxyga.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761070183; l=921;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=aRp9PLA2Ky1tVA6uHK/HKcddWUGAl0+QPgh6k0eSPvg=;
 b=ZZm6/NmPI1u7xNg8IcgQWaMv/5laGL+vT63Yqr0y0G9t5kzsMV4D43xY90DReDodb7sG5F7Ga
 lYwR2fsKLeEAlTe4FrguUevMwr8AIOwddbg+Pd5SurfbMzZ1i0MXvEQ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

On SM6350 I noticed that CAMCC_MCLK* refuses to turn on (being stuck on
off). The cause seems that PLL2 (of type Agera) is not configured
correctly due to the implementation in clk-alpha-pll.c differing between
downstream (e.g. msm-4.19) and upstream, and therefore the USER_CTL
value is not configured.

While looking around, it looks like camcc-sm7150.c has exactly the same
issue, so fix that one as well.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      clk: qcom: camcc-sm6350: Fix PLL config of PLL2
      clk: qcom: camcc-sm7150: Fix PLL config of PLL2

 drivers/clk/qcom/camcc-sm6350.c | 6 +-----
 drivers/clk/qcom/camcc-sm7150.c | 6 +-----
 2 files changed, 2 insertions(+), 10 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251021-agera-pll-fixups-dad6b12c715a

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


