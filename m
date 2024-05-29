Return-Path: <linux-arm-msm+bounces-20872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B15BC8D2A74
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 04:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E23771C252D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 02:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD951607A7;
	Wed, 29 May 2024 02:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LevB1H/D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0323D161935;
	Wed, 29 May 2024 02:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716948147; cv=none; b=kfzr940Z+SplqmvoDq5/EbCfOqTRemxrfF5JkGA1jmExBOrxCmVptseOk2MYngnJUtE3nfs5vzFIjAmnp4FPFlCdKPTGL/9+EU1mFqZu+e90X9fymmRk0njbhFHR2IapLK/36t82rZgqHRj7+xDQ1zVKlk2GQAgLog5CqKojZlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716948147; c=relaxed/simple;
	bh=XU5WPu1gwPIwO83oy0ulPSZYeOGgR4c91Iore08em+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sFcs0kE8aNSX/EdVKf61WOBF5PGi6TQBo3XhRpeo1utiMQ2DQ+8e8QNcv8/wfMD+yx/ixdClq/43AIX64wlg+zRaMZT+akmbZz4Z0C7RKusMxhSgHA2+OWZFC9KPTpv4LbC6mQlD8j6zIIZ8yf4z6fBRWa/wMU41PZq/Hy46+UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LevB1H/D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B652C4AF0C;
	Wed, 29 May 2024 02:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716948146;
	bh=XU5WPu1gwPIwO83oy0ulPSZYeOGgR4c91Iore08em+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LevB1H/DY2oRekSbRe0chbmFa1wqcS9dJT8sZekQfc3X4fg38oUtDid4cdomktYj9
	 OH4l+eXdkD6t6zY2ExYtc4w3pm/eezXwEcTevtccpNDInvGvu5GDjZKcKLh1CPXRrz
	 GaqPjFNQ3drDcTNaQfKzArk5XtQvGXHv6f5pGOYxFlBkAUXvcyr7pG5dXOpHg9Otwn
	 /oFmloJ5QrQiKkBit67zDJVLf7kVa0yJ+qgraJQ15YfuYuSggeFg65wsb/LET+aYTj
	 NLXyVN1Imv4VQraKJDB8rq18ugo2Ap16MM7efwcTAlPgImKuSmfMybFQRzhYhqOO0H
	 Pa9k/2rwYLPmg==
From: Bjorn Andersson <andersson@kernel.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bhupesh.sharma@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: quic_srichara@quicinc.com,
	quic_varada@quicinc.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] clk: qcom: gcc-ipq9574: Add BRANCH_HALT_VOTED flag
Date: Tue, 28 May 2024 21:02:00 -0500
Message-ID: <171694812082.574781.5852055342473098003.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509105405.1262369-1-quic_mdalam@quicinc.com>
References: <20240509105405.1262369-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 09 May 2024 16:24:05 +0530, Md Sadre Alam wrote:
> The crypto_ahb and crypto_axi clks are hardware voteable.
> This means that the halt bit isn't reliable because some
> other voter in the system, e.g. TrustZone, could be keeping
> the clk enabled when the kernel turns it off from clk_disable().
> Make these clks use voting mode by changing the halt check to
> BRANCH_HALT_VOTED and toggle the voting bit in the voting register
> instead of directly controlling the branch by writing to the branch
> register. This fixes stuck clk warnings seen on ipq9574 and saves
> power by actually turning the clk off.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-ipq9574: Add BRANCH_HALT_VOTED flag
      commit: 72ceafb587a56e26c905472418c7dc2033c294d3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

