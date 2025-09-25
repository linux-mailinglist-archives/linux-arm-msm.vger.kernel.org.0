Return-Path: <linux-arm-msm+bounces-75120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BDFB9F7BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 15:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2534B3BB92A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 13:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DDFF2264CA;
	Thu, 25 Sep 2025 13:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QopSPyqr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E35A1D5CDE;
	Thu, 25 Sep 2025 13:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758806235; cv=none; b=QhRi3Qsx9fP1tGNHF3YaOWbKd1KpviKbqGkI1GJtIMWoMJ4TId6pkiVNcOgAAQl7SaRQJv08A1Nc4mljLTkgSrv+BPwBKDyUHOwO2MsBnqkcg8gLHWHVc6CRyl+n42PpJkOW7fGhD3vdkPgrct+keFVW7RsbL/5Kx72dK4KsdRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758806235; c=relaxed/simple;
	bh=MNwrSXcKXVb9lJE4Au9UpLgsiO9I5p4DtiVl03+qqxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aqrMGp6DWBloJr14sAw1FrSW8YBsm+gnNzoA8WnUfS1cJp9TGtLL7KuekaG/YVwXF8T7EoMJAojI7WwZt3UvclJNiOVxOE9tm8uvU9m8l3smifWmb6cYgkBz/xSJSgm2NpGhw33kgpy7tG65TikWOf1Ene7xg/KDNWYj2PT3R3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QopSPyqr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B39C4CEF0;
	Thu, 25 Sep 2025 13:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758806234;
	bh=MNwrSXcKXVb9lJE4Au9UpLgsiO9I5p4DtiVl03+qqxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QopSPyqrmZNIGVMaIf/FZsoqAWBgXD6Cg6leY8pGjgq4zEF+kymOxOHHIlmn53E5r
	 9Qml9Hy2DWQviqaFM+h/w2O40bTxtq+9KjK/Sysr3QOLUNCnt2Uv60rjpJUfcKaP9V
	 in6Cveusjb5LGl6xZPerUheh39bHNo7I6oLxClbCFfd+2rbsvu+fQ+Vvy0wEmvJtlA
	 1DQi3sfOnOodMpLgpinOE4BOZX0A8tYUrNJBgrS1CbyTyMFc5dAZlW6ugKm9Vs4LJP
	 b2yzb8DLpbuWw5fqjRLE/nRTPhdrhJvf2IM3VTFoAb/2U0MnOJ+kf0u9vyH1DKSE57
	 GR8y0ef+3tkUg==
Date: Thu, 25 Sep 2025 08:17:11 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 9/9] drivers: clk: qcom: Add support for GPUCC and GFXCLK
 for Kaanapali
Message-ID: <ba4vkdcbudvyoj3i7eufd27luhmn6ai4mgkefza6sfbjzfwgp7@rvnpins2bruh>
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-9-d7ea96b4784a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-mmclk-v1-9-d7ea96b4784a@oss.qualcomm.com>

On Wed, Sep 24, 2025 at 04:56:50PM -0700, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Support the graphics clock controller for Kaanapali for Graphics SW
> driver to use the clocks.

GFXCLKCTL is a new thing, please describe what it is.

> 
[..]
> diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
[..]
> +static struct platform_driver gx_clkctl_kaanapali_driver = {
> +	.probe = gx_clkctl_kaanapali_probe,
> +	.driver = {
> +		.name = "gxclkctl-kaanapali",
> +		.of_match_table = gx_clkctl_kaanapali_match_table,
> +	},
> +};
> +
> +static int __init gx_clkctl_kaanapali_init(void)
> +{
> +	return platform_driver_register(&gx_clkctl_kaanapali_driver);
> +}
> +subsys_initcall(gx_clkctl_kaanapali_init);

We're not starting up the GPU at subsys initlevel. Can't this just be
module_platform_driver()? If not please document why.

Regards,
Bjorn

> +
> +static void __exit gx_clkctl_kaanapali_exit(void)
> +{
> +	platform_driver_unregister(&gx_clkctl_kaanapali_driver);
> +}
> +module_exit(gx_clkctl_kaanapali_exit);
> +
> +MODULE_DESCRIPTION("QTI GFXCLKCTL KAANAPALI Driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.25.1
> 

