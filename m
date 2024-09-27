Return-Path: <linux-arm-msm+bounces-32671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0899883C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 14:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D944286101
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 12:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661EF18BC1C;
	Fri, 27 Sep 2024 12:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="l4mvowJA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E741F18B487;
	Fri, 27 Sep 2024 12:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727438458; cv=none; b=PnWByNoBtjvYEZH103LZY4zj7oD9MrZSNf7dretAMFOxlCGUvlhJHnZVHU7JaMXm/OG6NQUsbdc58nY2l9V/djUMJULkVeldjr5HzEvcK45sfxXsey64ccxFyLuy3Dee5mPtSCeRbffquhlgVPILxLcEXrINw395q6FGCWwhGSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727438458; c=relaxed/simple;
	bh=xh7V+lSwrXwnf6AkaZSV161A1PTv5sxV84YQn60rU9g=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QrEg+k6y05PCRAvlxAPGQ+71PsF8wFPfWIYpgThxXpi5OdvLYPXqMhXrtLF7pZWSbfRUY408n2XBY0hocgfUEV6G0uh9rXWLRLxFk8H7JfXntY6zig+I7aA4NunFnPYRhN4dxqy0tUBRH2piBCWYTZIXGUkxdcKj8dxXQrfe1Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=l4mvowJA; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48RC0MLi020296;
	Fri, 27 Sep 2024 07:00:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1727438422;
	bh=+jsVr4Ims5WSRmy2NLVUof7RpYlMYwogh7jR4rXlInk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=l4mvowJAjM9PJeOeJyl4Lw0IoQxGpHFoAmHIUeiriguabhIc4m8fYPjXtPvdf1o9e
	 px8xK7VGURl6MbTf1fWQDPL2/R8LqUjVVjmLijdXCKy1uRwXptRLzZLF2aA1vBTqVC
	 Bz/w2OXYV+xHs4q2SxmyjvE9E5mJ8nRaHRNMgeSw=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48RC0MQM110251
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Sep 2024 07:00:22 -0500
Received: from flwvowa01.ent.ti.com (10.64.41.90) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 27
 Sep 2024 07:00:22 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by flwvowa01.ent.ti.com
 (10.64.41.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Fri, 27 Sep
 2024 07:00:21 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 27 Sep 2024 07:00:21 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48RC0LAu068343;
	Fri, 27 Sep 2024 07:00:21 -0500
Date: Fri, 27 Sep 2024 07:00:21 -0500
From: Nishanth Menon <nm@ti.com>
To: Lee Jones <lee@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
        Shawn Guo
	<shawnguo@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        <bcm-kernel-feedback-list@broadcom.com>,
        "Florian
 Fainelli" <florian.fainelli@broadcom.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
Subject: Re: [PATCH V2] mfd: syscon: Use regmap max_register_is_0 as needed
Message-ID: <20240927120021.b6okbwrdpguv4hp6@spiny>
References: <20240903184710.1552067-1-nm@ti.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240903184710.1552067-1-nm@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 13:47-20240903, Nishanth Menon wrote:
> syscon has always set the optional max_register configuration of
> regmap to ensure the correct checks are in place. However, a recent
> commit 0ec74ad3c157 ("regmap: rework ->max_register handling")
> introduced explicit configuration in regmap framework for register
> maps that is exactly 1 register, when max_register is pointing to a
> valid register 0. This commit solved a previous limitation of regmap
> framework.
> 
> Update syscon driver to consistent in regmap configuration for
> all sizes of syscons by using this new capability by setting
> max_register_is_0, when the max_register is valid and 0.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> 
> Based on my search
> https://gist.github.com/nmenon/d537096d041fa553565fba7577d2cd24, the
> pattern of syscon registers that may potentially be impacted by this
> patch (that are exactly 1 register wide) is probably limited, though
> this patch in itself was inspired by a buggy driver code fixed in
> https://lore.kernel.org/linux-pm/20240828131915.3198081-1-nm@ti.com/
> I have tried to Cc lists that may be interested in looking closer to
> avoid un-intended side-effects.
> 
> Changes since V1:
> * Incorporate review comments by rewording commit message and $subject
>   and dropped Fixes.
> * No functional change to the patch.
> * Expand the CC list to notify potential users.
> 
> V1: https://lore.kernel.org/all/20240828121008.3066002-1-nm@ti.com/
> 
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>


A gentle ping.

> 
>  drivers/mfd/syscon.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> index 2ce15f60eb10..3e1d699ba934 100644
> --- a/drivers/mfd/syscon.c
> +++ b/drivers/mfd/syscon.c
> @@ -108,6 +108,8 @@ static struct syscon *of_syscon_register(struct device_node *np, bool check_res)
>  	syscon_config.reg_stride = reg_io_width;
>  	syscon_config.val_bits = reg_io_width * 8;
>  	syscon_config.max_register = resource_size(&res) - reg_io_width;
> +	if (!syscon_config.max_register)
> +		syscon_config.max_register_is_0 = true;
>  
>  	regmap = regmap_init_mmio(NULL, base, &syscon_config);
>  	kfree(syscon_config.name);
> @@ -357,6 +359,9 @@ static int syscon_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	syscon_config.max_register = resource_size(res) - 4;
> +	if (!syscon_config.max_register)
> +		syscon_config.max_register_is_0 = true;
> +
>  	if (pdata)
>  		syscon_config.name = pdata->label;
>  	syscon->regmap = devm_regmap_init_mmio(dev, base, &syscon_config);
> 
> -- 
> 2.46.0
> 
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

