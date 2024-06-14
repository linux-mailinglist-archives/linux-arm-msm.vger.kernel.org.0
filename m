Return-Path: <linux-arm-msm+bounces-22677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC300908522
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 09:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90A7C1F22D5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 07:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF4E149C44;
	Fri, 14 Jun 2024 07:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oYDe8sDP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3629B148FF3;
	Fri, 14 Jun 2024 07:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718350393; cv=none; b=RHy3UWUqVYgSJ0eYbJh6r++CXu/CD4XOiMUoG0dMfkfibDMP5sxSjdDg60kYYbaPebArlBIuKOcetScV97+xw5LWcIfpbx+v51gvHOFWDY4/5pwFWvD6SDuQjI/cJOyYJWWKR/HG0ys6z5C9sg6fiCkNC55yDaCb4E4ycSCBjCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718350393; c=relaxed/simple;
	bh=by145jrMPqTR8Tb9IcfyskZf3/iuYjl5Lrbqbe6y1C0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eMaJSmEyfbNhJAwiKs+zy7mqPwtOt3dIt1EnXTttf0BGcbHpoq+gm9H7lCWcW7M3lqmz/aPiDeCXSSJC1iMNXAGYSdVm1c18j5hIGT3Q946RuCHbczX1Vuch+VUBgCc9c5/qSycTbypHXL06+6aKIkWjbtAc6r3UTN2Vy7dEGYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oYDe8sDP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BBF7C2BD10;
	Fri, 14 Jun 2024 07:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718350392;
	bh=by145jrMPqTR8Tb9IcfyskZf3/iuYjl5Lrbqbe6y1C0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oYDe8sDP74X5kwGfL76oeuXw+wxDVXKNbpBsX/vW6POjKndikCYyxfvOe8hfsl3bz
	 TJXfdHAEw76Nb1LaI/Ka2QgM7s9sLwjyhvk7+t/B6kz6PaN3yMPSiX9SFREcOIvJBb
	 Tg1Hhb7UMkjbT6nNVJnAjB2y/BJqnsecTwS2QClZaHWkOOqGoHdjMf+gWx0OikgRvW
	 114Ak4jZ8uFxNSmPOzTC/707QiuXJ/vzMiGtsKEbTLDs4IeEZBosr5WKJYoWWhcUej
	 8/NfwfhGP4QLemKaTVBA0ko4ZDDtss0mSFPmDhnbeyCudTW+jvnyLqwGcOKoIzYgg+
	 Oumxq6gRI7sTg==
Date: Fri, 14 Jun 2024 08:33:06 +0100
From: Lee Jones <lee@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Immutable branch between MFD and Regulator due for the
 v6.10 merge window
Message-ID: <20240614073306.GY2561462@google.com>
References: <20240608155526.12996-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240608155526.12996-1-johan+linaro@kernel.org>

Enjoy!

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-regulator-pm8008-v6.10

for you to fetch changes up to 11d861d227ed1c4068597289267247aac5ac50fa:

  regulator: add pm8008 pmic regulator driver (2024-06-13 18:42:21 +0100)

----------------------------------------------------------------
Immutable branch between MFD and Regulator due for the v6.10 merge window

----------------------------------------------------------------
Johan Hovold (11):
      dt-bindings: mfd: pm8008: Add reset gpio
      mfd: pm8008: Fix regmap irq chip initialisation
      mfd: pm8008: Deassert reset on probe
      mfd: pm8008: Mark regmap structures as const
      mfd: pm8008: Use lower case hex notation
      mfd: pm8008: Rename irq chip
      mfd: pm8008: Drop unused driver data
      dt-bindings: mfd: pm8008: Drop redundant descriptions
      dt-bindings: mfd: pm8008: Rework binding
      mfd: pm8008: Rework to match new DT binding
      regulator: add pm8008 pmic regulator driver

 .../devicetree/bindings/mfd/qcom,pm8008.yaml       | 144 +++++++++------
 drivers/mfd/Kconfig                                |   1 +
 drivers/mfd/qcom-pm8008.c                          | 169 ++++++++++++------
 drivers/regulator/Kconfig                          |   7 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/qcom-pm8008-regulator.c          | 198 +++++++++++++++++++++
 include/dt-bindings/mfd/qcom-pm8008.h              |  19 --
 7 files changed, 409 insertions(+), 130 deletions(-)
 create mode 100644 drivers/regulator/qcom-pm8008-regulator.c
 delete mode 100644 include/dt-bindings/mfd/qcom-pm8008.h

-- 
Lee Jones [李琼斯]

