Return-Path: <linux-arm-msm+bounces-46931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC52A28787
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 11:08:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A1007A761D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 10:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B3A22CBEB;
	Wed,  5 Feb 2025 10:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qunve0Yx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A9522CBDF;
	Wed,  5 Feb 2025 10:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749963; cv=none; b=tGD510dXMSXsrSNX23T8N27hM2XoY/IGf99MBY267rmSt5eEYIoysRDKOnXIyaKO58FlaY8B0xA+W71f+8PIiVdiS0UnlOTBdISdFLbi7xdsNl2rmWtWDnQXARRUyycrjTjJT1j5pkY38WN6/udE7JilfaVj4m0H44SiIXbhOhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749963; c=relaxed/simple;
	bh=hkYngXU+6IeLPNhNvs13cKpx26XKj3YSH/OAeRpga3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yx8jX9EVcoWxSaHyBI/G5LP/MZjnTuhOj8snDvajDD0JbsMxn1JUM9PS/OYuASHrkCZGVN/afrJaLcsCNzC8uoASfHyPn+3xlqm/SO/Y6b83xr5NkTAQUxmwKXV/nv+nvb2t71pdeNK0JjAXxPlo/i0+8JbORUZTi6n8AC6WAGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qunve0Yx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11214C4CEE5;
	Wed,  5 Feb 2025 10:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738749962;
	bh=hkYngXU+6IeLPNhNvs13cKpx26XKj3YSH/OAeRpga3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qunve0YxKKubq7KmDTNg1Ed8RfUlCXKjxIzL3LUwAiVW1oCrwBK5KmsdpdmdLog6h
	 6n+BNwajJMcrhwjfhHINnbjyzOtnfW7+CXcTbMRF83YaLZpw/c17deWk5eDDDAPvos
	 Gvkcy+Mo/BdB31t1Bfg7hxlg5PW/8+JBtbOt+x83ZBTFKTonl2WC+atoe3V/1bFV76
	 KOrQk1YUV4sjzM2de+xrK7o58Y6OOy3ui3BKNW7JACcvTM1DKfrz/QaeqH+fz1cdWK
	 D2nFniznztdCTJjRskVTZBt1mIJShJ8WwchuDTQ4SUGZ5wSQ14tVKmBJU9awZ7FNJI
	 bu5WcyXuPSBIQ==
Date: Wed, 5 Feb 2025 11:05:59 +0100
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
Subject: Re: [PATCH 3/4] dt-bindings: memory-controllers:
 samsung,exynos4210-srom: Split out child node properties
Message-ID: <20250205-wild-classic-ringtail-98cbc2@krzk-bin>
References: <20250203-dt-lan9115-fix-v1-0-eb35389a7365@kernel.org>
 <20250203-dt-lan9115-fix-v1-3-eb35389a7365@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203-dt-lan9115-fix-v1-3-eb35389a7365@kernel.org>

On Mon, Feb 03, 2025 at 03:29:15PM -0600, Rob Herring (Arm) wrote:
> In order to validate devices in child nodes, the device schemas need to
> reference any child node properties. In order to do that, the properties
> for child nodes need to be included in mc-peripheral-props.yaml.
> 
> "reg: { maxItems: 1 }" was also incorrect. It's up to the device schemas
> how many reg entries they have.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/memory-controllers/exynos-srom.yaml   | 35 ----------------------
>  .../memory-controllers/mc-peripheral-props.yaml    |  1 +
>  .../samsung,exynos4210-srom-peripheral-props.yaml  | 35 ++++++++++++++++++++++
>  3 files changed, 36 insertions(+), 35 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


