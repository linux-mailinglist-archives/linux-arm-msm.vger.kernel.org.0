Return-Path: <linux-arm-msm+bounces-79834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AE84CC2413C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 10:18:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E341634F93B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 09:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D16533030A;
	Fri, 31 Oct 2025 09:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+M6s4hH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465ED322C70;
	Fri, 31 Oct 2025 09:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761902272; cv=none; b=Hd/6gnlG9lH5YisBOuDkHhXOQal9/jXK5qV7Do/P8ldIoa3P3tfIl5KAf/5YSG3vn2GONSNb01qjgNmwpV2LmP/yRLcJVCRHuHf7fxCR7FokmDbSypsuYN+uZBk6MU31q+wwcbGjUnZ6J/vEttTCI4R8sYLpz6OGq5NM8OZFah0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761902272; c=relaxed/simple;
	bh=GpUSWKWf3PCcXc1TKc3PNAF6G1oqT4jCc/lUEIXS6/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fsDXhRQjO5xzv27zozpTqBkkgjPsu/BJnJkElAkvQ+iRJ7x/ZQiti7HvB62I48GRGD6Nmsnjgd3uYR7j+034ne7U4cM0ym417AR0/8zfimNNA7mhs17CO2CZfBCosjDHLHeC7xHoJutVXewbnDzqbUahjN7BS6VYD9J9dFUBy4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+M6s4hH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A7D7C4CEF1;
	Fri, 31 Oct 2025 09:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761902271;
	bh=GpUSWKWf3PCcXc1TKc3PNAF6G1oqT4jCc/lUEIXS6/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H+M6s4hHIM2XeJgJlCzNwrcQQF9FtZx/UukM0syLVqvAUy6SzBvTASPBwSQ7HT8p8
	 Vbrzrcul4U90L5eKnznB/QrMkpbiMkDmcKr2kU23/Ge7y4ilujkk+rKwjqKfIM2TJo
	 66JP5nml0sj/HIFwd5jTTCql+2uHP9MBSFCDWL7zmtvsYjflJcLmC4IVG092w7egVI
	 B0TE9xV5a1HlcmkSupJfe5hj1ERbdMJDcSIeI5Fyx7yIWjOectXnsDEYcZ/6gS7gRy
	 VtjwW7wNRVtaYCWzL8V20nzbOwWRmlNsJV2iXD85SIViWq5n7ubVcMOzq9gUXzM+MW
	 yIhkZK/imvBQw==
Date: Fri, 31 Oct 2025 10:17:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AlexeyMinnekhanov@kuoka.smtp.subspace.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: Re: [PATCH 1/3] dt-bindings: clock: mmcc-sdm660: Add missing MDSS
 reset
Message-ID: <20251031-loyal-lemming-of-poetry-4e900e@kuoka>
References: <20251031-sdm660-mdss-reset-v1-0-14cb4e6836f2@postmarketos.org>
 <20251031-sdm660-mdss-reset-v1-1-14cb4e6836f2@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251031-sdm660-mdss-reset-v1-1-14cb4e6836f2@postmarketos.org>

On Fri, Oct 31, 2025 at 05:27:43AM +0300, AlexeyMinnekhanov wrote:
> From: Alexey Minnekhanov <alexeymin@postmarketos.org>
> 
> Add definition for display subsystem reset control.

Please describe the bug being fixed here. Otherwise this:

> 
> Cc: <stable@vger.kernel.org> # 6.17

does not apply.

Best regards,
Krzysztof


