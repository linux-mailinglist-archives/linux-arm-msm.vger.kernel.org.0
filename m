Return-Path: <linux-arm-msm+bounces-63056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3931BAEDB5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 13:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CCCD17895C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 11:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC487262FE6;
	Mon, 30 Jun 2025 11:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DOzOwMkA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C38261378;
	Mon, 30 Jun 2025 11:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751283625; cv=none; b=mxW0WWkZBInWQzkh+IkE3F8JFDi8c5BpffvVq+aTiHmB6u23nlG4T2n1SQysvAD8phSrN+xZJHCMAx897250XDNIZG+SmU29Vz0+TOVV9uOG6QPrUmAXUDudgQPCWI40cuhO6BbSNwZ6xcJUGX8agj9tRNc89M6h9kDdokMBdTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751283625; c=relaxed/simple;
	bh=N5nwle+Z07WArrrqBSVZE6m6izNoLkuvtuWlM2WawF4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UrgqYtugDt66RTQ1N/Uuc3S7iiXEA2P/nLtgL90AxHmlunECWB+Q6zxmUVpny0CWTo297g2ve1rZ4/6q2zEL2U/Zh31A+42DCrwRIAmkR07AynavmEYNfgKaNnhaziKX/mSzBPx1qPGOpIh8hrJiWkWduyWW+7NRosqEvzpXv8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DOzOwMkA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A41AC4CEEF;
	Mon, 30 Jun 2025 11:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751283625;
	bh=N5nwle+Z07WArrrqBSVZE6m6izNoLkuvtuWlM2WawF4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DOzOwMkAYVqljFUoAhKYKE31wda+DkQV+t/t4nt8MvAgdl5l/1S9YqzV7kZDTIgSE
	 S+BQVlIt5gssWHt80/6PkJBoUZ2RwjRIY/6o4B3576WgkW6fpvXFKYrcfxCfUQbS1E
	 JZJiXvvSgpx1MfhnPwNfMQ3of9aTFAJr9vxqP0la8tfb0B1hAI6GloKXbyy1n9eMFb
	 0yGJRlqSl7sQ7ip+wuwZzjrYM6n+QiX8ttXgPismb2qL6QE2tD0BljqurH2dxMeF7q
	 3Ym5UXnt83Sw5Yi3hq15w4xKUl0OlQE0CEIVbkhC77Wg676qUxcCGUlbtJxnuiXNdg
	 cqcMVqDhHDPNw==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20250627160329.442795-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250627160329.442795-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH] MAINTAINERS: update Qualcomm audio codec drivers list
Message-Id: <175128362404.28563.7607369612683502987.b4-ty@kernel.org>
Date: Mon, 30 Jun 2025 12:40:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Fri, 27 Jun 2025 17:03:29 +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> Some of the codec drivers like wcd939x are missing in the MAINTAINERS
> which is resulting in incorrect list from get_maintainers script.
> Fix this by using wildcard matching on both wcd93* and wsa88* codec and
> bindings.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] MAINTAINERS: update Qualcomm audio codec drivers list
      commit: be2e1a63448b35bd6736b5934f7720534649b51e

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


