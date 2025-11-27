Return-Path: <linux-arm-msm+bounces-83546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC02C8D50F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 09:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D79AB3AC9BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 08:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE55D31CA6A;
	Thu, 27 Nov 2025 08:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1fvDhN7c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EA1315D2F
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 08:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764231706; cv=none; b=obksPS3CPCQagqSeuzSfDNjZQ4fb+Q79UcTQ16H33TNsmBVZ450OG6fUXsnoGRjkyo9I4dobUS7ppBefQj+k5cAtgB/dIK8Z/itSQ/MGusea2OlkBxL0G4M33SvNG2HjibQCnxv5ZnT+PYAhSJhbY29C6QufgygEXUd50Suk2vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764231706; c=relaxed/simple;
	bh=Y9HbYHfS9sLGPwxxlfvNCTbzS2ssSvhlDBLvtPBhoLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QxJRhVdT6g3HtuWxen3A3X+GROWq2dHjXc1t1ti+jyUtFdqfF7BsTPeIKPAkNO6N+NqhzZdhCj0+FKo90Ra/bZCZGWB00N9sjS5/K5O92rqgY5H9uOtx0BMmBjipGQwLeAGkkDiLA3w5F2WZP71ev0lha+XMF9Yn3g24iHRZcvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1fvDhN7c; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47774d3536dso4441155e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 00:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764231703; x=1764836503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wFtUrQJYvhgrliY3ZtBCl2DhI7sZrvKomnUFVXMk4U=;
        b=1fvDhN7cPmoT9olXfcjOSH8lj2pnBAKxDEN6+y6ZQe1gXULiLvIqDVluB2rEqTn4hR
         0GoGx0YAs0TnX8U8CE1hW32yV7X6GFsQva4EJPhlhMGQ9tq6UrlHvZA5J47XJmvJoVkt
         eOBAGC+KyFVJqSGgNwF04HhvOXbrGThmUq1W7LkGxHCxVwZXkKoZlhmVAEpPNc6d6qAk
         sWloa03c/FHUtBLx/CzLMVt26pQZ2mtqMXy1krlfb/7ZhwXYsLepxT8t0g7LTkHWUgMW
         XOTe1HwbKJCihzRwmn/MgOHryvn3LJhrlBbk9/uPceot3M9n1DrjPqZO2tPALnRjalSu
         jisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764231703; x=1764836503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7wFtUrQJYvhgrliY3ZtBCl2DhI7sZrvKomnUFVXMk4U=;
        b=TRIBXPKR5oBZa8IyXAZ1FwahxDUEHgoaAARAmsQXDDv3UPIYH+Yhq0IInjZBvr//g0
         ZZPzms3AVj5kv4N2IP5qQwc20n9kRI1NWEi18HvsJEuz3iwF37omDGSf5xuIEJAG9Fsl
         5ZBcdpvrN5geBwVi/E9ciQBA3Pza73yGT9lAsn4OpDbCFXSULe4ZL04p/+kXjNvhqp9n
         Bk/LMA7eIG1Aa/wMegSuzO5VBVVLxJ9k4sqRqFw0emZuS8mXYi40zBqxkvHsw6oAOEV0
         aBDdETj6bRqGO60O/gAhAjBIck5csT9ySS6UeTjTypQU9GH39Z0Kv393ckqsJrDfWxc0
         KGKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfx7o+E6oHn1DgL5LvsrvBRH3IXkTOJJXtmfEuRnu3eRYHkhLKc9/MHEfTx1/DHLRHOa+P742Xo4RJC8oi@vger.kernel.org
X-Gm-Message-State: AOJu0YxhPlcqzVRk5IMOacAwygie6wIVMFRlTCkdW4uMDQpZ70PCKfmB
	Y0sF/zIV280byI/zCu9RhvZqO3OhF8gzN5x7GIJs+NJOthITNqmV74OfeSWwoNctC9E=
X-Gm-Gg: ASbGncuXCGi6rM6wGLNJpUSkkvlbyB2JLrMVBM1fbHYWZ5lFyv8ztL33rdJpLYNt79B
	CT6bt4W3aQ2D+qsOcKW3P0dnUmo7eZQ7UXby6/vduenjzVzTiIbDT/Bz35WZsUuk8oB623qMR82
	R86BfWNAFSr+5o12V+mZHmlzuyMP3aeyUFpwOjppNvqQ1+jx9J6ihl9jdesUgI6RhHygScI4vmS
	o8SD7z3OiiP+TXp5VIYP9S4qRpzB8UwoJt+nRoYEmyZ+xbcKWhhGaVSjJocWx4oSaqyoqsbq5YZ
	ehgkEsRIC8oHJUcGGEz/16s5q9ce+Olp0S9Wdr+P+SMXt5/Mqsz6iHhOtsMy+4ER1pqUERO/xZF
	5bVvtQrTWS5BzkGCrbDh9OLDtG7fJdQOYQn4YZNHHprh2FnaKI4ilbaOCAWWJAtwgJeayxYZLlL
	suykRkCw==
X-Google-Smtp-Source: AGHT+IFUSoYvvgrvfuRweTnB8dHyWguLhMvmoW128+Cji2p3fl3QicsjjyDtIeGjTkbHQJSh+55q+Q==
X-Received: by 2002:a05:600c:c8a:b0:471:5c0:94fc with SMTP id 5b1f17b1804b1-477c04cfb70mr246319795e9.6.1764231703074;
        Thu, 27 Nov 2025 00:21:43 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:bd28:e1d9:5af3:b39d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479111438b9sm21446735e9.2.2025.11.27.00.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 00:21:42 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Val Packett <val@packett.cool>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] gpio: shared: handle the reset-gpios corner case
Date: Thu, 27 Nov 2025 09:21:41 +0100
Message-ID: <176423169902.7348.9978985875894103087.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251125-gpiolib-shared-reset-gpio-fix-v2-1-4eb6fa41f1dd@linaro.org>
References: <20251125-gpiolib-shared-reset-gpio-fix-v2-1-4eb6fa41f1dd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 25 Nov 2025 11:19:09 +0100, Bartosz Golaszewski wrote:
> There's an unexpected interaction between the reset-gpio driver and the
> shared GPIO support. The reset-gpio device is an auxiliary device that's
> created dynamically and fulfills a similar role to the gpio-shared-proxy
> driver but is limited in scope to just supporting the "reset-gpios"
> property.
> 
> The shared GPIO core code does not take into account that the machine
> lookup entry we create when scanning the device-tree must connect the
> reset-gpio device - that is the actual consumer of the GPIO and not the
> consumer defined on the device tree, which in turn consumes the shared
> reset control exposed by the reset-gpio device - to the GPIO controller.
> 
> [...]

Applied, thanks!

[1/1] gpio: shared: handle the reset-gpios corner case
      https://git.kernel.org/brgl/linux/c/7b78b26757e0d997b31635d76eaa46d5ef5e1431

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

