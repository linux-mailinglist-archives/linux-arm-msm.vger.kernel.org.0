Return-Path: <linux-arm-msm+bounces-82054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BEDC62B36
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 08:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0275D3AC9E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 07:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1332B31960D;
	Mon, 17 Nov 2025 07:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NpDdK7xo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CD730F55E;
	Mon, 17 Nov 2025 07:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763363907; cv=none; b=AXRbH61poWgsrV/E1Gj+aoO0E/Lf712b51pTn9u3xfZ9kmWabtoHDfcpTkZW7+g61aEBeoMHAkUWibUqIlB84yYJT+MFU4sqASuGFyg4LrVhE4Pl4moICRmSgT4mn6mqbsklFsu0hG0EpoZFjISjA6XlT4Tr0VnS4kDhpS6fQL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763363907; c=relaxed/simple;
	bh=RvqVYrKXNRDbBgSHjt7RkZPzI9eCZ43Lcxz15Yz1XkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgLbXUcciFx09lU+34Z83yCiHzFD+0iMTRVvQLz4GwPNdUb4q03XK5ySTyPturhPf7KqSf+bipid4nEJdJ6AE3fP0PiaI3HfvDlW6rF5UkwuUP0G4PZjz8xRqz4jqecfhoyF0NiOpreUirUH3Mt2Ws2YYd3W8JhenfK6C8tz6PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NpDdK7xo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D40DDC19422;
	Mon, 17 Nov 2025 07:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763363907;
	bh=RvqVYrKXNRDbBgSHjt7RkZPzI9eCZ43Lcxz15Yz1XkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NpDdK7xoGAPIGyay9dreHFKHiK3kF+AQYAwDPbdVlxdFiVtmSdwon03ZJKA7M+eVL
	 Mwwe+YdLCW19hX/v5DtQKtkqWj9RV0x9nq0TySQraYbua05TbJ4Yd+MxrymF0fu3mq
	 40JNciJcDgr6IeffEb1oPViJ8LOdmG361abghEqALWG1HSJoUSnFubTYsF6DM85qsn
	 ceiJscVwrIwTJea2uUiSS1crYalmiUl3ggba3BL4nlQzwOKG/Xm6rIqiTSUWLntst0
	 /m2qgehIAB+MW5gxUaMcOUEmnAwwsRuTnFgTp4rnmJMYe7sQGqus1ljvSfuni6Rcw6
	 B5v9TjFScrQlg==
Date: Mon, 17 Nov 2025 08:18:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adam Skladowski <a_skl39@protonmail.com>, Sireesh Kodali <sireeshkodali@protonmail.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: clock: qcom: Add SDM439 Global Clock
 Controller
Message-ID: <20251117-opalescent-obedient-groundhog-8cbef8@kuoka>
References: <20251116-gcc-msm8940-sdm439-v1-0-7c0dc89c922c@mainlining.org>
 <20251116-gcc-msm8940-sdm439-v1-3-7c0dc89c922c@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251116-gcc-msm8940-sdm439-v1-3-7c0dc89c922c@mainlining.org>

On Sun, Nov 16, 2025 at 10:35:58PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> Add devicetree bindings for the global clock controller on Qualcomm
> SDM439 platform.
>=20
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


