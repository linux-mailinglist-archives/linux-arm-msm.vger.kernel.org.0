Return-Path: <linux-arm-msm+bounces-46327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 58816A2051B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 08:39:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 098D77A350D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 07:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA001D47B5;
	Tue, 28 Jan 2025 07:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="afSusZeC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323C9A59;
	Tue, 28 Jan 2025 07:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738049959; cv=none; b=brsx7dYkDGP/MxrjHJt1U8iCC4ccQyxNVvkftV5A42OvyZE7fXZ7ofX9/uFCY5WzgscUHbSnn3NjSxfX6Z+jUe6qELh0hpQJynYWKQ0RRn8GT91AofAyfTZU//Tw8oMt00Bb1uQqSLNk4QXgQKbmmGePVjtYN7n07xMCnDVxrzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738049959; c=relaxed/simple;
	bh=S0KKKsv1Ew5ypO24Mt8w301TCv1TTgzsF/pDHDTHUso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZgbEgZ5jejbbXn6rCsFdJ5+DQDZRRKqaxoBoCyogX7xUzi/dAXnruIYN6mw/XfEbmR7zRuA2c93x189U4HDnJIjKnwKZUVIIdNCdhHyDQry8HJI8L31YnFBEthvczwiFJzBcFQHzvXoy1AlGspcSKOyPR/6V4FuBigOv/pccAMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=afSusZeC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB53C4CED3;
	Tue, 28 Jan 2025 07:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738049958;
	bh=S0KKKsv1Ew5ypO24Mt8w301TCv1TTgzsF/pDHDTHUso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=afSusZeCaSV0mBuJXitsEQkgn+BfGC1qbhihd1e1F2Rg4au6QVnT+nicFUgBgIwjN
	 i3uqufXEpAJj7RrKqCO91xBcZhGtPwlqCv89/4gp5m01rTCoRqxl5o/j8wGtkC1aA5
	 ClO6fqMisEwaitCsdMmtz7jY8HEjo+KoYL4TficgDyYzzV7P0q5cOSiBXiPbMg45ZS
	 7eW/SbpBbQov8oKIfeenMQY6ef+bt5OwAE5oQV3jSZNiLAwVjd45Xoprt899sHE61U
	 QGFvI30KdMGcmntocZ7t9TV+vLnWNKcBN3f4lFJszwFQLuZW2wlFAa97pZtdpnRE6E
	 eVJtFhOguTigg==
Date: Tue, 28 Jan 2025 08:39:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
	Konrad Dybcio <konradybcio@kernel.org>, Matti =?utf-8?Q?Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/13] dt-bindings: remoteproc: qcom,msm8916-mss-pil:
 Add MSM8926
Message-ID: <20250128-tricky-discreet-agouti-1f608a@krzk-bin>
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
 <20250127-msm8226-modem-v3-3-67e968787eef@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250127-msm8226-modem-v3-3-67e968787eef@lucaweiss.eu>

On Mon, Jan 27, 2025 at 11:45:35PM +0100, Luca Weiss wrote:
> Compared to MSM8226 the LTE-capable MSM8926 requires mss-supply and
> doesn't require qcom,ext-bhs-reg.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  .../devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


