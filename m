Return-Path: <linux-arm-msm+bounces-21818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 355D38FD944
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 23:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 485251C2563C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 21:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D99015FD07;
	Wed,  5 Jun 2024 21:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+KDNEWj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E658D15FCEC;
	Wed,  5 Jun 2024 21:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717623522; cv=none; b=Kow5mrCBf2JbrzD61wseFqw5XtqtEMMubpWuIzg/z0H1JaWD7QMfy1l05dM7h61/KY1fWizfEQlAya/nenyBH4SZwHIajWYozKAzx1jPkJb8bz1S7++lr5/B64BELVwlcUyEAV0yDoG6QnGBPN6mtExKyZXCc9YuvouxZPOFIRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717623522; c=relaxed/simple;
	bh=d7L5Jn4DXHIV9ypImFfx4lwVS/PZmpvP8HBZAJVoFxQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dCWsDWKB31akpGQPWQYPGrSXFcP/Th0JVDssqVJ/rfuEkZTtGjOOGoR0R/OvUKIl9TIzbJgS2kJIlWonJWK6l3qYVaEu+FLkQn6ut3mSraxfcscksY2I7scwN4/GuQgp3a6sXwrwpB0rmExe9kjs8YRqj6Ix4cE1ywZ1hOOBexM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+KDNEWj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85E90C2BD11;
	Wed,  5 Jun 2024 21:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717623521;
	bh=d7L5Jn4DXHIV9ypImFfx4lwVS/PZmpvP8HBZAJVoFxQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=b+KDNEWj8aAj2HseQpeKc4uy1vABmppf8DaSjnKfRvUmEIeZN/mR6inr/xlZEXCaR
	 np+GN8DSOYZW7bVnb3RFp0MdPCE7ls8DdNjxAn8rmi/yvrO+N1//mJ+suZPIsVI2Ii
	 j2BZwiHVsnl53M+/Iyk76tfO5HaJ6S+uBZX9TuW++L40QPdc04QZvRMxAThSKmV1V3
	 oM2aSRSaL7TSTsCkc1h7v40mbYo7ca2WQodkGkvd6WwWh7Yubg7v3Kmh1cC6IWLrYb
	 iDLLlvcCN0IVWGUJ2wLwU3GN4NscDBklDEViXTj4EinKBSkHrsDcz9+ufbJzWFvZ3n
	 W3ruhd77UG0YQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
In-Reply-To: <20240605121450.23697-1-brgl@bgdev.pl>
References: <20240605121450.23697-1-brgl@bgdev.pl>
Subject: Re: [PATCH v9 0/2] dt-bindings: describe the PMU modules of QCom
 BT/WLAN packages
Message-Id: <171762351925.565947.8740836669893756947.b4-ty@kernel.org>
Date: Wed, 05 Jun 2024 22:38:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Wed, 05 Jun 2024 14:14:47 +0200, Bartosz Golaszewski wrote:
> Here are the two dt-binding patches from the power-sequencing series
> targeting the regulator subsystem. To keep the cover-letter short, I
> won't repeat all the details, they can be found in the cover-letter for
> v8. Please consider picking them up into your tree, they were reviewed
> by Krzysztof and already acked by you earlier.
> 
> Changelog:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: dt-bindings: describe the PMU module of the QCA6390 package
      commit: b5cb34c93bd4e5559e64f57de9e67e926237535b
[2/2] regulator: dt-bindings: describe the PMU module of the WCN7850 package
      commit: 168ed1e8d0893cc4ad5963d5920dcfd24e0d7591

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


