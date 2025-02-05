Return-Path: <linux-arm-msm+bounces-46930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C712A28761
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 11:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BA05169E7F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 10:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED38622B59C;
	Wed,  5 Feb 2025 10:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="suPMxBHc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B367622B587;
	Wed,  5 Feb 2025 10:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749947; cv=none; b=Oiq5UR5gMhYoFUqwN2q9bD1qk/9cyHSdmmhdZ1blAkZpogXpnedRBPWwE9sqqZD5NVBS8iQCPO10mnFZ80yX21xqiYyiXZBn8X8GRbY56kVsJsQHmjKLAXHi9wV23B+oCBpjBplUOI1b99PZsI1NIalUMNajTa+4UoIJViWTRck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749947; c=relaxed/simple;
	bh=KbEFKDcO9YO05ffSaN68MjwT5lvzDBl0owN2twsZxVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPOFfnAboXoXZqxeGfn9N5U0KLaC4+S3ByS/sAhlT4/TdNHF5gu2phqirU31CNld0etgmp7qQ79VbHvayI9f+5uX6vx/2IQ5zZiaW14jOM9fD5WerFd3L0zR2dljLqSiun5BAZW9yYz6i6OooqTNRQhZouYDcPU7jKveNIoUVE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=suPMxBHc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648DFC4CED1;
	Wed,  5 Feb 2025 10:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738749947;
	bh=KbEFKDcO9YO05ffSaN68MjwT5lvzDBl0owN2twsZxVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=suPMxBHc8//jkuGVYHew4b4EOor217p3lUW2a+tg57A9fZ553ihWgLVGhNf5BuaZ4
	 LmdGIG4jS83tvm5Vxg7G5AeBNcYbtHK2UFTLUbtt+QGOrZBgz6fx8Wv6wZmETjhyro
	 J7j7NXrsVtzKLfzh/0NBCHpb8PDy1hcJuxOP9T4f3rXo5xKmBbPE7iIFtKGVXznAtZ
	 2kLqbUe0yh6rfTJ2K3jJsrVw1h3ypaCxo2fZJrYHvB6SfcDo2eYiCF1yzwbeUnmeqm
	 eyD5l4k09mQHhrtx388em9uBYirOvdPpaahfxS8C1biwwb2jkaDiTuXYdFwf1uwYcH
	 86x7+F6oSh/3A==
Date: Wed, 5 Feb 2025 11:05:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shawn Guo <shawnguo@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: memory-controllers: qcom,ebi2: Split
 out child node properties
Message-ID: <20250205-imported-versed-oyster-0f23ca@krzk-bin>
References: <20250203-dt-lan9115-fix-v1-0-eb35389a7365@kernel.org>
 <20250203-dt-lan9115-fix-v1-2-eb35389a7365@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203-dt-lan9115-fix-v1-2-eb35389a7365@kernel.org>

On Mon, Feb 03, 2025 at 03:29:14PM -0600, Rob Herring (Arm) wrote:
> In order to validate devices in child nodes, the device schemas need to
> reference any child node properties. In order to do that, the properties
> for child nodes need to be included in mc-peripheral-props.yaml.
> 
> "reg: { maxItems: 1 }" was also incorrect. It's up to the device schemas
> how many reg entries they have.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../memory-controllers/mc-peripheral-props.yaml    |  1 +
>  .../qcom,ebi2-peripheral-props.yaml                | 91 ++++++++++++++++++++++
>  .../bindings/memory-controllers/qcom,ebi2.yaml     | 84 --------------------
>  3 files changed, 92 insertions(+), 84 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


