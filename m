Return-Path: <linux-arm-msm+bounces-46206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94547A1D1BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 08:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 657D57A2CD9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 07:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051281FCCE2;
	Mon, 27 Jan 2025 07:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6d8PCcO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E68189B9D;
	Mon, 27 Jan 2025 07:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737964130; cv=none; b=YJbk49n98gWro6xhgfwlUehSxjcVKuMZqVw2OHluwVnabsT8l/VUB1vthPo7nvwfgosUQIdpv0e2jR0Jj+YSxjHd6+ybT1X1eCTvPLKhtE6ZHRUlRNd5FqHHEG86G3eI3eg/h2ORi7iHj2mHrlm9ERgaRbLHKqxkvsG0lG+cns8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737964130; c=relaxed/simple;
	bh=3nuxaome5wnVCH/ofaU51EUCS8Fa/AolMa+4abymEYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g++b+BSKl/1I2y7naPJdLsU6ctNlQQUG0XX7WgGF5gAxYYrNktSRa/IZr3YAfwBPc7cbKLXl5UUxICEq1sSh4lS6a3WEBiJRqh8wf9XFdKso8oyfcDdIJDtVaBc8xXr4IpQU+WGj7iHhArAhik5g0pP+ge4wOOajRZm+8Aa4nFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6d8PCcO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6244DC4CED2;
	Mon, 27 Jan 2025 07:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737964130;
	bh=3nuxaome5wnVCH/ofaU51EUCS8Fa/AolMa+4abymEYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a6d8PCcOwcE94EcGSgtXpZejo6UMKTDUYlZuTLAZ3i0ftcfOiY4geUiKSEc7ZLGMB
	 yQVxGuqZy2742LCUYRZciB6EKQqytoe3It2mllbL4NDRh1w7MwlUJfAqBjPtEDJszh
	 uwr//1oAxgnv3PS6dUCX3HPOmowuCNu1N0wA+OJ0ck+0dZi1ElCZxI4ARevSpQbSjR
	 3uRcEZmDPjB/CQxfsdcqezv5PibUfRTnl44AkM2W0yMEtbaUDzBIvmjmcV7stt9LAu
	 9StvzyjBmaWikwDIOSH3Vjxm0X0710vuKnkUfPX20Duv5i0yFEog32gAVVsq4fbx5d
	 lDXS0arSD61Mw==
Date: Mon, 27 Jan 2025 08:48:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
	Konrad Dybcio <konradybcio@kernel.org>, Matti =?utf-8?Q?Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/9] dt-bindings: remoteproc: qcom,msm8916-mss-pil:
 Add MSM8226
Message-ID: <20250127-camouflaged-caracara-of-efficiency-b0baea@krzk-bin>
References: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
 <20250126-msm8226-modem-v2-2-e88d76d6daff@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250126-msm8226-modem-v2-2-e88d76d6daff@lucaweiss.eu>

On Sun, Jan 26, 2025 at 09:57:21PM +0100, Luca Weiss wrote:
> From: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
>=20
> Add support for external power block headswitch (BHS) registers.
> Similarly to MSM8974 also MSM8226 has the mx voltage rail exposed as
> regulator and only cx voltage rail as power domain.
>=20
> Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
> Changes in v2:
>   - Improve description of changes
>   - Require mx-supply for MSM8226
>   - Disallow qcom,ext-bhs-reg for other platforms
> ---
>  .../bindings/remoteproc/qcom,msm8916-mss-pil.yaml  | 26 ++++++++++++++++=
++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


