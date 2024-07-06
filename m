Return-Path: <linux-arm-msm+bounces-25441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5C092959E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jul 2024 00:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 524681F2178D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 22:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD6762B9CE;
	Sat,  6 Jul 2024 22:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DujYR6Xc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823BC1CFB9;
	Sat,  6 Jul 2024 22:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720303519; cv=none; b=JGYrcM7VJMJFPwO5vJoWGpgQXSIZEWfhgQhYtjxZDVBzhEavwflRculujXgGj4BkqHXVOACQZ8deyEXo9W8u4d9XW8SZobVMCfBEiWEUD98/PDk/eub3vv/uaTOSeVBVIegaY+w+7EQb1Yuv8KaXhQvGC8zc36CAiW420y1Mmkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720303519; c=relaxed/simple;
	bh=65mpd2YvbOjm4vlGDUvttpAFiZpgPgTmIMFoMOQZad8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KtrBPfRGqdYbLm840ZD7iguOE8xMpNhrN9UrQXH6uTfdQPKh0J51w+SbKrmk4c7lB8yO2bPTmeDNNWKmJA5eQ5Yb4sUF0psawBPizaHF+aQLKS9Sx1dgBeHnRhUJ4Laj9HCfrj9BKd7nFqCK7KsEzaaCZkLj1lq+w0bVr5RP12U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DujYR6Xc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D69C32781;
	Sat,  6 Jul 2024 22:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720303519;
	bh=65mpd2YvbOjm4vlGDUvttpAFiZpgPgTmIMFoMOQZad8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DujYR6XcOHzgYWKhB6X6Q9L4ZmpSRWiGSAfdd8H1W5t9WDf8LNmXUURfdoWnHf528
	 hnDZ+4tTdxEpgTitS9g3XQuJ0h+qj81D2qvJi2lNge5/2cuF3Kd/mixzRiNu/qshe0
	 2DI4NTTheyftQUswe4FfXgo/NJvc4fMKFSoUzX+M19LHKrFWhEGGQ55jwIPdFQ/4da
	 31wdYEXe5SEWc+slHcHeCkezkDhei4tz+WbGs6hkz7dENQzmfjP+qI2k+CvtGlNHTU
	 mi5KuFlpW+PjNX79l5IjsxNzQdg6xZDrQYxJHDaghfq48M42TcuxkE8m9hKXa0bXTK
	 cosOKDP6Me72g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: msm8960: correct memory base
Date: Sat,  6 Jul 2024 17:05:16 -0500
Message-ID: <172030351410.29947.12860864193737934010.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240706220041.241839-1-david@ixit.cz>
References: <20240706220041.241839-1-david@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 06 Jul 2024 15:00:30 -0700, David Heidelberg wrote:
> DeviceTree validation requires a unit address on the memory node, adjust
> the base to match [Ref] and use this as unit address.
> 
> The bootloader will update the information with the actual values during
> boot.
> 
> Ref: https://github.com/msm8916-mainline/lk2nd/blob/main/target/msm8960/rules.mk
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: qcom: msm8960: correct memory base
      commit: c1842643a3df6004d1bc9df74e34d8b72997d886

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

