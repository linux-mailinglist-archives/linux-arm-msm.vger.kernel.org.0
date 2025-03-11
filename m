Return-Path: <linux-arm-msm+bounces-51027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2160A5CCC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 18:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B683189EE28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 17:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98C3F25E47C;
	Tue, 11 Mar 2025 17:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kx3NZIpj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2B11D5ADC;
	Tue, 11 Mar 2025 17:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741715445; cv=none; b=eGcELU9barM16+AzOls1hzylAWDdVJFD2UYBhntAMXC3C0X+4wyENwX4wDqIN7XLsocc8lsbzpgHzDUyrXEmPntisi5v3q8gl10xplrWV0lCeTJVJPc1aUlkDFFQYt9QaOA99keSOQoOjsIUgFbbobee/lzb3P82sYBL0l1ylWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741715445; c=relaxed/simple;
	bh=kLDi5hF86QZHs0p/61H7Td0DURnQ7im8mU8C1Zlw5zc=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=DuzSIC+6N728ri5fpQUQUKtD5M+eTL0MAGioekQ3oS3+dEXG/epiV2lUB8kG7d1xb7ELdP+5nE70Q1r0AbKZ7Ic5lZ29cosVTerjrqbbq/4+j7EBNjyyIo0BcXtglMELA7shNdUNN6/od9glHKhnH5isD6PbFZYFkjgkHKJAxO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kx3NZIpj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B995C4CEE9;
	Tue, 11 Mar 2025 17:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741715444;
	bh=kLDi5hF86QZHs0p/61H7Td0DURnQ7im8mU8C1Zlw5zc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kx3NZIpjCvLI2hwgQQoYXNSbKXDaKKrlYc/uCkvVV7Au3BREVHUEsJCedXDxXcDQy
	 qqBuUAmxNnlFWtF1UJCjNKqXSpCdqSbe1mJKLlMP9KNABs3NeJc1MUDm25QdgGLl4r
	 dogi2SccbC44QbWPOC8V7MJVAaHDX+JP8AKIz/9nfGTzWMM43Go+7m20GhHEYrYjpZ
	 0qoKTDlBOBKSuYTjK5262Dz20+vzBxL+HVq5fX5z6pjxmjMunPAO0L6NE+XLtCR2I/
	 /px7Zu+XMgfpSrXVw4wHkMbR09nGaWFK/PgmqtMwRqb4uyWX1k9+nX9P8cvOv7LBT4
	 n2Embdqv9zxKw==
Message-ID: <899b71724428aaa16d424f54d5b1558b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250310191142.1208155-1-andersson@kernel.org>
References: <20250310191142.1208155-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock fix for v6.14
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Tue, 11 Mar 2025 10:50:42 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Bjorn Andersson (2025-03-10 12:11:41)
>=20
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f0=
5b:
>=20
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-fixes-for-6.14
>=20
> for you to fetch changes up to 787289a1d13d50ff4ce0f496947f8817ef3fdea9:
>=20
>   clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARENT on byte in=
tf parent (2025-02-26 08:57:46 -0600)
>=20
> ----------------------------------------------------------------
> Qualcomm clock fix for v6.14
>=20
> Avoid propagating rate changes for the MDSS byte intf clocks on SM8750,
> to avoid changing the already configured clocks.

I already picked this up to clk-fixes a couple weeks ago.

