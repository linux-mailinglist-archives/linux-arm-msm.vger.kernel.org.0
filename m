Return-Path: <linux-arm-msm+bounces-25127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F3D925D6C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 13:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E2BE1F265F9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 11:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7918E1822E1;
	Wed,  3 Jul 2024 11:19:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABDF51822DB;
	Wed,  3 Jul 2024 11:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720005571; cv=none; b=DnVOdYX1U/0E3bcH7GpIIFw2/HXT3ScQjnzkFXYZSp/Dckge1+8GcDTnqFMPh/JENUUrVty0zxCMOjH7TuJFNxtW9wIz8B7OVUwZI+rQ8RJcHlV0IjKOpyK0Sk7rv8BvYZO6x3Owh+mWV+n6/hYFU0Hby8Hzg2y5+6EmlelGWPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720005571; c=relaxed/simple;
	bh=hukUt079kxdkjx7jrbgnYLZNHSKQOWaV9uP2j/uAXiE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rA++yYQfx9qIiua1TC02HiA3ucdEHtq+ikrx90aaI43pvb/iFl1CLXiUlb/DAcTJfcUIGpD4tFyM8fq3MIeKeQRhbaPEUdfLlcUOCNW6plUKG6GdMVl2MDR0RSqrGkvAXXMbrc2Q1igI+z71iTDpQyiIfSj+Oh1+0Zq2EI9OZvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BEA6367;
	Wed,  3 Jul 2024 04:19:47 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 524863F762;
	Wed,  3 Jul 2024 04:19:19 -0700 (PDT)
Date: Wed, 3 Jul 2024 12:17:50 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
 <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Vladimir
 Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 09/10] clk: sunxi-ng r40: Constify struct regmap_config
Message-ID: <20240703121750.0dc2eb3a@donnerap.manchester.arm.com>
In-Reply-To: <20240703-clk-const-regmap-v1-9-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
	<20240703-clk-const-regmap-v1-9-7d15a0671d6f@gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 03 Jul 2024 11:50:22 +0200
Javier Carrasco <javier.carrasco.cruz@gmail.com> wrote:

> `sun8i_r40_ccu_regmap_config` is not modified and can be declared as
> const to move its data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Looks alright, we indeed don't change it, and the only user takes a const
pointer. Also the compiler seems happy.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  drivers/clk/sunxi-ng/ccu-sun8i-r40.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c b/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
> index 984ad3f76b18..2f51ceab8016 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
> @@ -1292,7 +1292,7 @@ static bool sun8i_r40_ccu_regmap_accessible_reg(struct device *dev,
>  	return false;
>  }
>  
> -static struct regmap_config sun8i_r40_ccu_regmap_config = {
> +static const struct regmap_config sun8i_r40_ccu_regmap_config = {
>  	.reg_bits	= 32,
>  	.val_bits	= 32,
>  	.reg_stride	= 4,
> 


