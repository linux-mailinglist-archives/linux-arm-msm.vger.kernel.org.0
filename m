Return-Path: <linux-arm-msm+bounces-75311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42928BA3AE5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 14:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B0C63A474D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 12:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99FFB2F5A01;
	Fri, 26 Sep 2025 12:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BjPiMFiM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC1F2F5492;
	Fri, 26 Sep 2025 12:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758891000; cv=none; b=WxTkbxfSLId8qY1N1zScL6OiA9ebtcrH4NTJPz0TO/aXv6exrn/I8poAWxvBJIHccnHJriqMW7WbZ+PlOWp17shCMjaXbGoPCtMXnYKmiDWIyHXlTg/SXENNDY/d2fMjB2kV6vKxv8OKgXVe3Nqlk8SdqCcjpS9kDCbO55lWi28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758891000; c=relaxed/simple;
	bh=FWnr/zfaATY7ZTr5F73cJEy+iIid5ziQ7oMyK/6QzXw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hiVnVLJvZnTdwx8nt39SX2/Ev3ik7Z+lWKwuCB4Td7Q5YXGwfE7izaPu7RXk4Hiw6b2oPYT+zYDIexgg0cRwGVajqZCPfuwGTafVD6p+WoFHUiRLxHhiI4S2qH7vqZh5vvI/KvZqW+HVAbcqYtraPhbCNXK97r0qvXpUe3l5LsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BjPiMFiM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F86C4CEF7;
	Fri, 26 Sep 2025 12:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758891000;
	bh=FWnr/zfaATY7ZTr5F73cJEy+iIid5ziQ7oMyK/6QzXw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BjPiMFiMhFP3Wrsc+s3Z28zPX3YChImz26aJZsLWMQLPTJbZaSTuij9O8w6SelJQ8
	 PGqVJpucapeplF4e1ZNgu0FFnBUZssRdANMtFDz22ipQqSGWfBTvcEckctUiIcuBHW
	 JOg1gxShJB5wg9jj3LWLfpZUyxYU1fRyjbz6C/saoDl5I2M1FS6q3Pdg9W20NIq8he
	 aXqATGOk3rIlsQ/Mhv9LlZynwBg5r5P9J1wqV/3Pfu8R5aWzCKdZB9uM805Apyznqm
	 qqlEG4OU3xQnwDMqEXBjGvhaLSJddokfkQJYNXkN47KCv6M/cW/26Lfni+i1sVKrFe
	 J23L5Q5GEarpA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250924-lemans-evk-topo-v2-1-7d44909a5758@oss.qualcomm.com>
References: <20250924-lemans-evk-topo-v2-1-7d44909a5758@oss.qualcomm.com>
Subject: Re: [PATCH v2] ASoC: qcom: sc8280xp: use sa8775p/ subdir for
 QCS9100 / QCS9075
Message-Id: <175889099809.84679.3269862439261126656.b4-ty@kernel.org>
Date: Fri, 26 Sep 2025 13:49:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183

On Wed, 24 Sep 2025 22:34:02 +0300, Dmitry Baryshkov wrote:
> All firmware for the Lemans platform aka QCS9100 aka QCS9075 is for
> historical reasons located in the qcom/sa8775p/ subdir inside
> linux-firmware. The only exceptions to this rule are audio topology
> files. While it's not too late, change the subdir to point to the
> sa8775p/ subdir, so that all firmware for that platform is present at
> the same location.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sc8280xp: use sa8775p/ subdir for QCS9100 / QCS9075
      commit: ba0c67d3c4b0ce5ec5e6de35e6433b22eecb1f6a

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


