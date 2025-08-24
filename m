Return-Path: <linux-arm-msm+bounces-70512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E84DDB32D3B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 05:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7A2D7B6C82
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 02:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D68AA25A2C4;
	Sun, 24 Aug 2025 02:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ILSLiQ9R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9F725A2A5;
	Sun, 24 Aug 2025 02:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756004182; cv=none; b=U7TW+WtZvpG6ohhY0uU58PXOp00wYcl6vJnRpDRkFpNs4tHeqTXF/59hoeBPlFCjsDqL2rF0a8pfCFmS0D14/6gtPYQ/XUdWBBqCQtzJ1Q1892lULSGENYzgEuytaRiJwESEkHN70aQtuA2z5IJDjEH4cFwDmunhmrraIECK5lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756004182; c=relaxed/simple;
	bh=7uCO5QGKPLdTmQRErw2/3WU/j0xuo3RdC6BhuqtSQas=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tq8QCyt5ZJySZHdR8t3TPYb9+e7cFByJHFmsCprkXPQq/h9bbujtaPcTbHqxuO2no/f8A4ptZfLpIgpMbvf/AD3Xb1CXJs16VnT65fcl5iktP17/O8wkUIeEVnVDs8hRCbNfCzbn0G0tox/Hi4rQjIzdKte51LzR+vQNhevRAxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ILSLiQ9R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6D0C116C6;
	Sun, 24 Aug 2025 02:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756004182;
	bh=7uCO5QGKPLdTmQRErw2/3WU/j0xuo3RdC6BhuqtSQas=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ILSLiQ9RZ2wki2fsvcet2zD73wakvdfxmfiqQqb4gagYaq8Lf08VVt2P9BxN8rPZA
	 BZ2OHFjkveMm+mUWZ512K4vfeKBaoAgKn4n08/1tAoCdW+A4oIUe8Jr9Uf4jePV6lk
	 nWzt9XbBj95XFD41WFZyRKV1WTXhFNyFhuwFBn9jwMkBusdBjfMDoxKEB/fGwY0V73
	 Nr2cob4J40vegAvAs2oqQJlQJEbychvwnVt0qklc43pyXHAH4ojFqsqGQ2hrEsVXmb
	 A/iNGLgO9/afoBhCP0VF9hGpSJ4BoFK31sPyCdjPvessks8MIhAnj0ip3mp7sf7lMn
	 y3LWWIQjjA3kg==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Takashi Iwai <tiwai@suse.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Trevor Woerner <twoerner@gmail.com>
Subject: Re: [PATCH] ARM: defconfig: cleanup orphaned CONFIGs
Date: Sat, 23 Aug 2025 21:55:55 -0500
Message-ID: <175600415292.952266.3226011014636924307.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250819231652.15938-1-twoerner@gmail.com>
References: <20250819231652.15938-1-twoerner@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 19 Aug 2025 19:16:30 -0400, Trevor Woerner wrote:
> Drop CONFIG_ARCH_MSM8X60 and CONFIG_ARCH_MSM8960 which were removed in
> commit 99497df59427 ("ARM: qcom: merge remaining subplatforms into sensible
> Kconfig entry").
> 
> Drop CONFIG_ARCH_MSM8916 and CONFIG_ARCH_MSM8974 which were removed in
> commit 85148df36835 ("ARM: qcom: drop most of 32-bit ARCH_QCOM subtypes").
> 
> [...]

Applied, thanks!

[1/1] ARM: defconfig: cleanup orphaned CONFIGs
      commit: bcafdbaff25930db6c8866056e0f4071dc71ca97

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

