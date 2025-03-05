Return-Path: <linux-arm-msm+bounces-50320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EC2A4F856
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 08:57:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A428188BA4B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 07:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1490B1F3D30;
	Wed,  5 Mar 2025 07:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5wtnzha"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0531DA617;
	Wed,  5 Mar 2025 07:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741161424; cv=none; b=R1jFFp9zumEXeEmlURZKsoD2bcH38/WTjhX6vm9pMm/N3bghrGzHBTCBn0HTnXnbG8oqQfp9+lscBaltEDj76FY+oGadWH4jQKBe9wj25zYiqeeNoiDMm0UvXlZr5W/igWLiFk5Ab16BnQ+4R7xhmoqH5o8740eDFucWCfwhZr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741161424; c=relaxed/simple;
	bh=8IP+iFERUlAs/RNgCUjK96QKjj05HNIgRHJ5emaWY7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XifUQq9mL6kIcqKzW+2E1TvO7iJztHn+kNFOJZSwlrvnKfR6+WiLLIZFdeSBkMR8jC+usY1y41dK5t/adQ7h8E/qQ8+iQZI3hYgCSQlwatF/2K5KEbKWII5kf1J9oYNn2XnCRXmaxukQ1vX/HoOD3rHrrKU1DMgMrHf24+joVdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5wtnzha; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86210C4CEE2;
	Wed,  5 Mar 2025 07:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741161423;
	bh=8IP+iFERUlAs/RNgCUjK96QKjj05HNIgRHJ5emaWY7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F5wtnzhaMlIjaMwLl/FU/V7kn/HDJYTOHA928pUoTrt1o71oMrhkud0nEY8YTUTSr
	 8t/7sdNTw89l18tfQrgOC/q+f9NHb5eIg9iF5inj0mZtykh9OBo1gjmseEt13TAsPW
	 XHQh1ybKCxs7eO9FlCxlwQ4S+dgvxVeekUhkcHiIUFCm5Aq4H8fnvoOXxdOdSUR9Kh
	 tLaKUGJAxx0d1XNCRm+lUVU91PU4TAYjPHGHsVHaR9CWCZ9C0BAS5yWB1SnQjTeb17
	 sys3CF7R3D7jDeg10mP2swgF868vn/fgnIUucuGd+hC27USPZrZbJ2YZWqsZM+E4ro
	 IaxnTjfEA7IaQ==
Date: Wed, 5 Mar 2025 08:56:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: qcom,x1e80100-camcc: Fix the list of
 required-opps
Message-ID: <20250305-little-frigatebird-of-calibration-244f79@krzk-bin>
References: <20250304143152.1799966-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250304143152.1799966-1-vladimir.zapolskiy@linaro.org>

On Tue, Mar 04, 2025 at 04:31:52PM +0200, Vladimir Zapolskiy wrote:
> The switch to multiple power domains implies that the required-opps
> property shall be updated accordingly, a record in one property
> corresponds to a record in another one.
> 
> Fixes: 7ec95ff9abf4 ("dt-bindings: clock: move qcom,x1e80100-camcc to its own file")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,x1e80100-camcc.yaml   | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
> index 5bbbaa15a260..938a2f1ff3fc 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
> @@ -40,9 +40,9 @@ properties:
>        - description: A phandle to the MMCX power-domain
>  
>    required-opps:
> -    maxItems: 1
> -    description:
> -      A phandle to an OPP node describing MMCX performance points.
> +    items:
> +      - description: A phandle to an OPP node describing MXC performance points
> +      - description: A phandle to an OPP node describing MMCX performance points

If rewriting this, then:
s/A phandle to an OPP node describing//
because it is redundant (this cannot be anything else).

But more important is that you introduced ABI break, without actual
reason. Switch to multiple power domains does not look like fix so
neither should this be. Reverse the items to keep the ABI intact...
unless ABI was broken earlier and this just keeps doing it to make code
consistent. But then please explain it in commit msg why we need to
break it second time.

Best regards,
Krzysztof


