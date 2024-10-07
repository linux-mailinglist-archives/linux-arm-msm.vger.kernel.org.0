Return-Path: <linux-arm-msm+bounces-33395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B4D992F3D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0F0A285B6B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9C91DA62C;
	Mon,  7 Oct 2024 14:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FZjQU9N6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47A11DA61D;
	Mon,  7 Oct 2024 14:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728311186; cv=none; b=q7dAXV0qqG6PU0mLy6m52TPhbmOQ7UgN5kBdQdAJ45V3dgPqGgylJlRfRF7Lbt5PaLmKOF8C4kyMvJ5I60Ai5/ENe1QMtzQbb9Ysy1Y+jLlg+miu8NC/Q6o4kRQgEq30Ym5mMzH8El4kqjsdMFXbElMihYCudOJmPq7/0uHv8lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728311186; c=relaxed/simple;
	bh=pIml4XrcqifM26NAc7A1yt2pveSIT4ESOTaj6iC/B7I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JwlMpH2qRFRlXIaeqNV6FfF1TQk9bB8eVkPyPki+OcE93xFGnMjO+6xqIekAPrNlLIMpkidA8l2mRmxosFH0G8bGDFIPa4FLq7wBpkjGRTExxS9qw+Xn7KYXvpnezlGdo29ZN1cJvgeldcNR8uijliVd3pURjZj1o+htXLnrs7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FZjQU9N6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F27C4CECC;
	Mon,  7 Oct 2024 14:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728311186;
	bh=pIml4XrcqifM26NAc7A1yt2pveSIT4ESOTaj6iC/B7I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FZjQU9N6/mXZoOQ7z2TaHJe1mY4WcS3jWM5lefYFVlV3u5wK9Q0U3CsBUNpVjYCuU
	 auLVGWwIGrOUlMjFUO647DGlyjqUzwZ4dScs83UTwx2WGSy5S3laoPFka3P3/1R/HJ
	 BJV/mamT4sikpmGDqkexne2AlF7Y0boBsTaCVKokhUMX76RWA+q+41xVeM0ZSgw64O
	 E4iaw2CQ0tpf7+DSjbK5td03KsiCG/55yPeiji7F6Z/Nsft9Mqur7S02yHa3O9mC36
	 lcgi6r+YnxXlojhvGX9VoWa0ugezjjjcuJXcuyxh//NEaiNdedFwjczA3MpXlRC6Im
	 sebssFvxxkz1w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] qcom: MAINTAINERS: add linux-msm IRC on OFTC
Date: Mon,  7 Oct 2024 09:25:59 -0500
Message-ID: <172831116171.468342.10809947735058079673.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240821102602.134216-1-krzysztof.kozlowski@linaro.org>
References: <20240821102602.134216-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 21 Aug 2024 12:26:02 +0200, Krzysztof Kozlowski wrote:
> Qualcomm SoC community gathers in #linux-msm channel on OFTC, so mention
> it in the maintainer entries.
> 
> 

Applied, thanks!

[1/1] qcom: MAINTAINERS: add linux-msm IRC on OFTC
      commit: 35791e5672a14a95cb45cb723566bae36de111c9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

