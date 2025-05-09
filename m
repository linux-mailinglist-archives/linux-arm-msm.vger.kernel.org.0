Return-Path: <linux-arm-msm+bounces-57502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C09C0AB1FCB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 May 2025 00:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35D63B231B6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 22:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594F3264FB5;
	Fri,  9 May 2025 22:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hy6Proz/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30730264FAF;
	Fri,  9 May 2025 22:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746828819; cv=none; b=IwcP5JBFMkcHgM6A5QhtWlJbgT3I7MMeJy+dwFuGMWnLpbFkotQywtX8K+ApNtPpv9b//GsfnyCxIPO8GGkqNBrhqf6U0Osgj1jPpgXY5P56WuNlrlwAwYkNYY6X/kna39OYM/UKnHmU4DF4nSJTepDHQsxclNG0D1P4tZGDdSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746828819; c=relaxed/simple;
	bh=dyDNLZLlo7IvLPpnr8siDNU045aNfecNQMzRLdQ1wGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KuD/QsTifrq3LsJbDw6URyQakfzf6Y1Iiwk8y8p6CJo3PD2h67JB3psrm1Xf2esMRc6VmzoyFOp4ulmqvzuEw8ut7q9+kU1kiRSdpeknCsRb55GvG+JCYtzACCbTN3NMXUAEGJQKrB4oTU9aQMjSMEckvAJBVWYBCjsk5RVSZoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hy6Proz/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F7BC4CEE4;
	Fri,  9 May 2025 22:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746828818;
	bh=dyDNLZLlo7IvLPpnr8siDNU045aNfecNQMzRLdQ1wGw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hy6Proz/qAvCmLW9g5PlYyRXsvzhjfYeolEAswi/kxEzMviqEDcCn42BztVlQtmF6
	 Dq+mL67D3YilSJkuK0UaNtfg26nR4dmRnS82/BjDQ/K+I/ZDEDx5IO09ZsJHuIXa8x
	 smTGA/Xdw7sYFGZl9F7CxdcixtoAviwra6DuiZ0/3QQXKQQwue38cTdtLc7KgWgvzb
	 vQp2FhmJyE8hAfA6QutAYvXzCZMMNMsa0Vj0PlzRb6hmTg3twkMxWGVSSyGLqyHtkb
	 PQ4ZGMk4oJ7+qUwTZVJsm0F90y8o3MIhu+rB1877Wirj9KxTPIH0B3j4qqmO9xvk5F
	 jSVMVf7nI+TZg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Clayton Craft <clayton@craftyguy.net>
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: fix spurious DP hotplug events
Date: Fri,  9 May 2025 17:13:25 -0500
Message-ID: <174682880460.49052.8140434549089739167.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250324132448.6134-1-johan+linaro@kernel.org>
References: <20250324132448.6134-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 24 Mar 2025 14:24:48 +0100, Johan Hovold wrote:
> The PMIC GLINK driver is currently generating DisplayPort hotplug
> notifications whenever something is connected to (or disconnected from)
> a port regardless of the type of notification sent by the firmware.
> 
> These notifications are forwarded to user space by the DRM subsystem as
> connector "change" uevents:
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: pmic_glink_altmode: fix spurious DP hotplug events
      commit: 5090ac9191a19c61beeade60d3d839e509fab640

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

