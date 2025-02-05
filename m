Return-Path: <linux-arm-msm+bounces-46926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E60BDA2860C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 09:59:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8090A169095
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 08:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53BF21A424;
	Wed,  5 Feb 2025 08:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qsTZvYSf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B91722A4C9
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Feb 2025 08:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738745989; cv=none; b=bbXxRv8wvptO8qN0boP2ReKVlqmU67xF3hdBBUAJ34Rebf9J+9EkXjVXRI+9HHM+imvybcXNwiPbCKoB0g8FyzVoYJVEeAFXvFgBAoN7mIH4TeZvbV2g1Ov9K2KU5exgTrBT7Vq8iJQl7f5eAYUEPD56F/9x2zlsVlLOHgVfODA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738745989; c=relaxed/simple;
	bh=4rdH6GrIXB8lz8HjYqpZ22C0ajtDCyflT20HUHPnBBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eAjsmQkhAvHlkck0JW4DdCxan8zmnEUTLPEGlVENMbmLIBgLP1dYshStz7vJvFpT0EwusVM+uedy7cKSuhjxKO5p/BKv+PtAwo3pukCdRppMZvI2BIABqmCGixvwHUmtvV792G5qB1XkrCe8jf4zfW4I0OhScYyLhMuty7E2wak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qsTZvYSf; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4363ae65100so75786965e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2025 00:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738745986; x=1739350786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wmjz18zqFyKr/G/A4DW/iVZd6rNAAhBzVdAwovC+Hs=;
        b=qsTZvYSfA2iAaSvNAmjNIfOyMh4C4XDBJbJ8lEHGaDffN7K8UItLD8F2opmcBQGBbU
         4OvshB2mP8fSP5DC/dJouuENaIueeg1zN1v/q/ek8n1EhT9kaJnL+pq0ESMyhS5QXApi
         u5nUTgUPgVrel3MlJQ8n1kSiwHvoJyVjLe4T6QDnA2cisHp0ty/SoTB6AN7jczb3zCVU
         GczYmndR+a0IXfCqlvWXB003PQn3wApz5cJ66kr0/dxfrsFZKh1x6TYblP0bggXNbHuy
         7te44fmlbzVnwfi0zPYVp7vTM2QmmM8Veoy47SGXZr0kCplpWUjfZefVgHl6JRQQ6Eto
         jEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738745986; x=1739350786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wmjz18zqFyKr/G/A4DW/iVZd6rNAAhBzVdAwovC+Hs=;
        b=s4qOGc9spGXJTyRjxtvfr8s5CQi2Xr1zOIGsO0AKu8cWD9BKdWjPseS1WWuVKn0W5P
         y8ECOBNcCzZ1VUK8L02pSQWjwF/r+uolj7Q4s+QdbgtXtd4rT7RLdy+6qDn3I9404adF
         J8Jzjt0owj+FqKfnUlHqAcCu47E34mJSlP9QnJHuPXCVsBPUaT6YiDXZZ4dC0XoCvbS1
         bRPgGmPTliF00oNLjOJAC8q71YNWwu1nDBoeDG0uzXnm/hd+IsUD6jBe0qlnZ9RqaEwH
         SVGNPbPPrY7N3VQezQxT7Xs1EKpjCWlfzxaOg4/px2i9o7KGlzNRrcx8gX0WbFFISOQC
         +NhA==
X-Forwarded-Encrypted: i=1; AJvYcCXPvygy4Djv690a47pg3wVeBXNPIm+6taZb3gfVZSKTXiC70QzjgBHL1U98uxbgaQsDmrN598fOgH46TE0a@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5oalbVcG3QwuizoafqKwAG67Hx85xQVgUbGQQ71YApu3rrtvJ
	C4AlKVkbxEf/74g1EAaR2gCr7qNn6R/2lTyUroCV6HNGhAdwrGQGAwBu/fqwu1Q=
X-Gm-Gg: ASbGncsaG1NmnZgOfJzuADaQ4VH0s/R8U43kAZRe4oM4BrdIGYQtcargrAWHggGEmPT
	5b6JGxG/Jg6sZJtCmtxQE/wY5WPHAS1bCtHtFRdC8o6USS5RnPazZ9F7X35BcRysPI3tY/dvCHR
	YGVw+GImuHeRkDGUxl3PpIcoCh5CNZajeWRfFd/lrLj/GGQMsIK0A4V3SnATge6xlUID/JF+KCK
	YViuQ/Neod1AmPE0mo/RqNrD7QfZE/V/quyBvHaF4hJSJk/R7eh4aRWujnoFqZ0Y/hDbnXLDxlf
	KKNahCJbDp9/kjw=
X-Google-Smtp-Source: AGHT+IHvujR6ocyaWXRib9FJP8dFsztpMFdYT+nb0yAfmtcuRsRIBa6C6+A4Dxp5o66bjEcIRw+i0g==
X-Received: by 2002:a05:6000:2cd:b0:38c:2745:2df3 with SMTP id ffacd0b85a97d-38db49009a6mr1396467f8f.37.1738745985676;
        Wed, 05 Feb 2025 00:59:45 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a766:1fb1:99b5:1d5f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43907f1b570sm33940815e9.1.2025.02.05.00.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 00:59:45 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: brgl@bgdev.pl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	Danila Tikhonov <danila@jiaxyga.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux@mainlining.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH 0/4] sm7325-nothing-spacewar: Preparing for the cameras
Date: Wed,  5 Feb 2025 09:59:43 +0100
Message-ID: <173874597816.7784.10623106141376200723.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203111429.22062-1-danila@jiaxyga.com>
References: <20250203111429.22062-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 03 Feb 2025 14:14:25 +0300, Danila Tikhonov wrote:
> Nothing Phone (1) - sm7325-nothing-spacewar has three camera sensors:
> - Wide sony,imx766
> - Ultra wide samsung,s5kjn1
> - Front sony,imx471
> We tested the UW and Front cameras by hacking the IMX412 in our fork and
> they work as expected. Wide is a C-PHY sensor, so unfortunately we haven't
> tested it fully yet.
> 
> [...]

Applied, thanks!

[2/4] dt-bindings: eeprom: at24: Add compatible for Puya P24C64F
      commit: 78d9ee370ed33cd8b662981fe1f47cff7b4f0e43
[3/4] dt-bindings: eeprom: at24: Add compatible for Giantec GT24P128E
      commit: 03480898cefe9cb5ba921dba9304703f7574b687

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

