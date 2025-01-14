Return-Path: <linux-arm-msm+bounces-45041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5F1A111E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 21:26:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73ADB1693E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 20:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F6320B80A;
	Tue, 14 Jan 2025 20:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pCqxZ/vZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230A320AF90;
	Tue, 14 Jan 2025 20:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736886396; cv=none; b=FpHmQDJYlHZmkGOIULP57+G8NPhEHddX9LeVeojVS9bckv1Y9s0cIvwdmWPwwJNFyeBn7u2eZds8YZXQpt0JTGgLEyidAoPzLv4WcRgpHSpTS6EQHr2RTd+Vtfb9+hSBgNRQtItK5/jRtt2iGmkioX7OljXcFwWMu/DxhJRap5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736886396; c=relaxed/simple;
	bh=qxvuHUk1mHtLWLs28HD1nKDM5BKLuz+o1A3YZgW8khI=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Hsc1Rc6NtjMsT8irKUYS1buDZmA5CPQlkqjKzwPg9t8OsptAj7YcbGuDms/jvcT0S5JvyVUqzSObFsX6XKPP2I5sPVBooe2W6uKOSG4uqQx8hwN32Qa0j/NjYthvuirE83sDYlDBYgXuVfhAzZ5Al4wiA3VjQd4d3nbhFJ41wnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pCqxZ/vZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83098C4CEDD;
	Tue, 14 Jan 2025 20:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736886395;
	bh=qxvuHUk1mHtLWLs28HD1nKDM5BKLuz+o1A3YZgW8khI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=pCqxZ/vZEXunUa0i+v6xY/rnaGQKnxVMkcsmSc0MYN+pg4I17Zj6F5/VtTzHVBGre
	 h0rHKiL2OEDoZHhY6M4tYAclJHt+DpOn2olpkW3GYkD/rmg1HZNT/bxe4nQM5xeaVU
	 Gc8UYI9yX1OmC+wHaQXO7ljdqWZiP/pziL21a1o2l05XB35SlO/4jmk9SsF+AslbzC
	 fpJ0Mx2PdU3fe4ad7g/qibycCSKY+BxiTP0kb2WFGuFKfWTD9v4b9myspQHpdv+7fT
	 xbmHB5bC6bKrMi2UpoEU1rh09MVN+1YtND7R/QstL6ZskFnEQJtXRnepgKiw9nWX1G
	 ijvY8tWLNEzfw==
Message-ID: <05c9960be5d357e9b48e431d110797f2.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250114190612.846696-1-krzysztof.kozlowski@linaro.org>
References: <20250114190612.846696-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] clk: Use str_enable_disable-like helpers
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 14 Jan 2025 12:26:32 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Krzysztof Kozlowski (2025-01-14 11:06:12)
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
>=20
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---

Applied to clk-next

