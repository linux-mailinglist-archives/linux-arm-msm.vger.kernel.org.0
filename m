Return-Path: <linux-arm-msm+bounces-74533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B49D3B9696C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 17:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C679A483134
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 15:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6421B0F11;
	Tue, 23 Sep 2025 15:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ItV15M8P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979281A9F99;
	Tue, 23 Sep 2025 15:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758641471; cv=none; b=oqpUVP8b+pe8OOXvXW+csmU79FuoEf+NBL1FkoNLtIXNEkbe2SiqIblToeg3pUvD58GJqTvzvIdnTd8UpE8ap9IUFrSnXghUY6AwhE1XiNifE05OcoygJ6ITVfRVdZNtKFEJzJGr5FF/r6mjQz2DQSIRal6Bf0RC3wEW8JH5c4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758641471; c=relaxed/simple;
	bh=nucY3Wbe1cI6pkzZWAwERh6X+C3QqlkNxUNqauiRtlk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IwmlX18/dR12l7qAuPsDUbBaVF4icEQ++1vpvy/rL6DyOvJR+kTx0KPh0DFqy7lsVC5wUvjRfo4iuPooySn3IcV5MluGE8xyQXTAhEq99k17i06A7XGCOOOqvyfba00UgwWUgnx8CjE8mOGZVnxRUfCRn61qJEgTCyprtM5Qn0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ItV15M8P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA39C4CEF5;
	Tue, 23 Sep 2025 15:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758641471;
	bh=nucY3Wbe1cI6pkzZWAwERh6X+C3QqlkNxUNqauiRtlk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ItV15M8PyDVCRGXHYTvaqE1fqvU8n07E+pnpcKV81WH03o6Zadov0fSqbmkTqeB69
	 jZkUJ1Vtx+9Br0ixgbN12jKS1wkRvA+oIYTJ3WLq3cgSMRfhRn5XlJzPCztOc/x+3q
	 OKpXGfGA0bHsXZTcuX0BCTmBf+Bc8YV05YVwJvJ6Rg1vGKmHD50H+mw1BvyXvyjUdo
	 z0LZXVO4HoF4VnGwb3OmLm6AQZlIjF8zsULZgj/rTUbz8b872F2VtAmjWGT/18r7m1
	 3yCaLWl9jcAXCFhLxZ23uTUPcip7m1UEkX1QJpLRSjEQIoOjYur/khGCnfSS4KqpHB
	 KthvQDM3MvkiA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
References: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 00/14] arm64: dts: qcom: add refgen regulators
 where applicable
Message-Id: <175864146866.1117422.16276639582721125453.b4-ty@kernel.org>
Date: Tue, 23 Sep 2025 17:31:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a9b2a

On Sun, 21 Sep 2025 10:09:16 +0300, Dmitry Baryshkov wrote:
> On several Qualcomm platforms the DSI internally is using the refgen
> regulator. Document the regulator for the SDM670, Lemans and QCS8300
> platforms. Add corresponding device nodes and link them as a supply to
> the DSI node.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[01/14] regulator: dt-bindings: qcom,sdm845-refgen-regulator: document more platforms
        commit: e609438851928381e39b5393f17156955a84122a

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


