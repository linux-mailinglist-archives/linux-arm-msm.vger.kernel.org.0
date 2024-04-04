Return-Path: <linux-arm-msm+bounces-16440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82357899050
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 23:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 076B1B28F0B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 21:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945C013D617;
	Thu,  4 Apr 2024 21:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MoUgqwnD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6989013D2B1;
	Thu,  4 Apr 2024 21:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712265823; cv=none; b=tdQIBMpi+v3GLSCnP2W+aYmM/kW6FtR2jCDNvcncqpwSs7knkTSeZy9fp2YzkexKBF1rx3tF2g2u/KjQz6x9giPGL+weeyBzdSxkotlN+bmGucHCGIql0PDMdxiN9JECphp4XL9jgHZFU65oqkm/ghsNZFj/7S3Ea0lFAgX0PzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712265823; c=relaxed/simple;
	bh=5lf1q6AxyShmbUmF17Kdei2JYEzOg7HuvtM4QqJ2CSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TX6BaMGR3XJ88LM2FQT6eZhW+xtnpQtC48XRqCuQaOXZNKzDKFsnr8DZ+GkoIplwWYJM3pQ0O1Nyk0I5lGyRH2P9ZmgvrC85TZdE5l41NGfECx/GoZKOW39XAlgj7ROOGR16AQouDqeA6JP+5vVcPNQ8nKuBOWrmPCx27QoWXMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MoUgqwnD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 647FFC433F1;
	Thu,  4 Apr 2024 21:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712265823;
	bh=5lf1q6AxyShmbUmF17Kdei2JYEzOg7HuvtM4QqJ2CSA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MoUgqwnDkrLhamDgseH67s3Qoz4MIJA7FwGZUNAtroBMZW+GOqAXO5WD/axUTpMiI
	 7p8i2QNjD/Cb5PdwXBLMNsNlLJn6ARTHA+wt7cZIyrGJFSEQOD+Jq5rgF7vx3frE2c
	 gxQrscEWDx54gqB4oJEefZMv6WJ/t0rLqcSFVSrTUeIE63+TV5EmevtOAuqS25mIaJ
	 qTgcfOvA4gwHD3sXqA72kqxKSkFFNHM2pRfu6PjW1O4yjl+fzm8nYUpJDhQsSIdj46
	 BESHfMpxvTlV82PDLSBI2GtDkez189pXXSxbCwjmIka5UL/DyRuthjo1p3GzKnnjwV
	 OeIdg7UQbc7Qg==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
	Raymond Hackley <raymondhackley@protonmail.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Nikita Travkin <nikita@trvn.ru>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 0/2] arm64: dts: qcom: msm8916-samsung-fortuna: Add touchscreen and PWM backlight
Date: Thu,  4 Apr 2024 16:23:08 -0500
Message-ID: <171226578697.615813.16079470574814769657.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240404121703.17086-1-raymondhackley@protonmail.com>
References: <20240404121703.17086-1-raymondhackley@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 04 Apr 2024 12:17:28 +0000, Raymond Hackley wrote:
> Like msm8916-samsung-a3u-eur, the Grand Prime uses a Zinitix BT541
> touchscreen. Add it together with the necessary fixed-regulator to the
> device tree.
> 
> Most of the Galaxy Grand Prime use backlight drivers controlled with PWM
> signal.
> To simplify the description, add the backlight with the necessary clk-pwm
> to the common dtsi.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: msm8916-samsung-fortuna: Add touchscreen
      commit: f8dddefcb90eaa339c77b2cb3f5a87dec8b1e3b5
[2/2] arm64: dts: qcom: msm8916-samsung-fortuna: Add PWM backlight
      commit: 05c65922bd58cc3fc057b37628b143f76e524496

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

