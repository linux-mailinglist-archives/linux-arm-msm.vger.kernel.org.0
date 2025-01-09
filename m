Return-Path: <linux-arm-msm+bounces-44661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6EBA07FC9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 19:27:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC8473A773C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 18:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94AE319D890;
	Thu,  9 Jan 2025 18:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ln4eXpGa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67600747F;
	Thu,  9 Jan 2025 18:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736447256; cv=none; b=dHNfjhHwkaGuMhHsVfRs/y41g+L5mnzyJIVnfkvx5EKTG96Ipuv7LgrmfOAqRqGFIxF7qswdxFyz7j+4cfqZuYQZl7pEZ872OBGrOot6g6uvKdq8Iwm2CiKvGaGTv3h5jxPjUQL0WvXUZeglJf12esOSvZQzXWGsKLkBsi+4cMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736447256; c=relaxed/simple;
	bh=7JtRwBFwNzluzPUJ5J3s1vtEzB6xDdjOI1Uuu7gw8zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DZoyg8eulL9jeTizGk5TScpEYafEJP4GcstO5lemU/dWsGJF9dxcXRlCSkRy+9HQKRetYtPlfe+sm6piAcVzTA7d92D74BOx7bSaUB9WisIrpAtu60cspPqvSpg3/YJWzqyB3smTeVMfN7NecnoBoNvBRfRHR1KxDYCkPRehvfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ln4eXpGa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C93C4CEDF;
	Thu,  9 Jan 2025 18:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736447255;
	bh=7JtRwBFwNzluzPUJ5J3s1vtEzB6xDdjOI1Uuu7gw8zk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ln4eXpGacDQ6+hfhHqR1cdfUczJHN+8UyRBuv9KpRskxY2rQkMmduRWuPBe0pfCH2
	 uE1H+U8d+Sr0wTgRBR70gI0ewYG158CJ17jiq876WMJcO+5e6tKW0zYIfJdDtnVwrx
	 7ZzW6/2EDPYf8Qr0ggvyZNhpfQ0uNtqQs8DR3SWWleJr+pIwv5wOT07/HbuG53K8VK
	 lmqek9nBd2IJcTER1s1kPuozdYgA6P9UvjUi6tCInSzY7Mw2BCUo6vphl5iAtv0nJp
	 8GYtD9t/6k125ZFiD0lIKsupWktN6L+GrFeq7V+VWRZas0k5SUhjDgXe+kz6/vg1vq
	 6EQBVKwxPgKJw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Jakob Hauser <jahau@rocketmail.com>
Cc: Stephan Gerhold <stephan@gerhold.net>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-samsung-serranove: Add display panel
Date: Thu,  9 Jan 2025 12:27:31 -0600
Message-ID: <173644724816.201886.7766873886728208466.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241114220718.12248-1-jahau@rocketmail.com>
References: <20241114220718.12248-1-jahau.ref@rocketmail.com> <20241114220718.12248-1-jahau@rocketmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 14 Nov 2024 23:07:18 +0100, Jakob Hauser wrote:
> Add the Samsung S6E88A0-AMS427AP24 panel to the device tree for the
> Samsung Galaxy S4 Mini Value Edition. By default the panel displays
> everything horizontally flipped, so add "flip-horizontal" to the panel
> node to correct that.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8916-samsung-serranove: Add display panel
      commit: 46316370e9257647d81c13782a6201a2256d6f1d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

