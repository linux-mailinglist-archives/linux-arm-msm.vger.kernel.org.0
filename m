Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DCF6482E56
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jan 2022 06:52:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbiACFwz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jan 2022 00:52:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbiACFwz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jan 2022 00:52:55 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D86E1C061761
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jan 2022 21:52:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1A54A60FA9
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jan 2022 05:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7799DC36AE9;
        Mon,  3 Jan 2022 05:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641189173;
        bh=efe9x2zqWKqz9Ww5zAplmpJMaFSnp8oSxrb1YNxiTqY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=khztlvo/E2gmtUqHXV8XczAThHrFMvXXbEe/aZ3GqYmciX3cPJ8BVlCFSVcCYeWbn
         fdtf39rppxXID6jaB03uVmxd9L8bRPzeuBq5InTVEwORQy7B55nE9T6ztOBIAnE4Kg
         XXQp0UxUFAMOhBd3ry2oFPc0f3/TBM9p2b/HD/jqfUfJJya1f+YPmyMX3D3t5flolC
         0idQL8/jPLezyUJLUyL62RTxilYDFDBxuwskNDyS/VYCLo4DCnijtElPiVinUoUI/l
         A8Q4MlV9ibuuK//3EK8AWDeEV//RVzoW+WHncdpN/Kb2brdiYjw1MfhJvPqgA7KHDd
         qjKat2dpWZ/3g==
Date:   Mon, 3 Jan 2022 11:22:46 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
        miquel.raynal@bootlin.com, architt@codeaurora.org,
        bbrezillon@kernel.org, absahu@codeaurora.org, baruch@tkos.co.il
Subject: Re: [PATCH v2 2/2] mtd: parsers: qcom: Don't print error message on
 -EPROBE_DEFER
Message-ID: <20220103055246.GB3581@thinkpad>
References: <20220103030316.58301-1-bryan.odonoghue@linaro.org>
 <20220103030316.58301-3-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220103030316.58301-3-bryan.odonoghue@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 03, 2022 at 03:03:16AM +0000, Bryan O'Donoghue wrote:
> Its possible for the main smem driver to not be loaded by the time we come
> along to parse the smem partition description but, this is a perfectly
> normal thing.
> 
> No need to print out an error message in this case.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
>  drivers/mtd/parsers/qcomsmempart.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
> index 06a818cd2433f..b2a57fe8479fa 100644
> --- a/drivers/mtd/parsers/qcomsmempart.c
> +++ b/drivers/mtd/parsers/qcomsmempart.c
> @@ -75,7 +75,8 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
>  	pr_debug("Parsing partition table info from SMEM\n");
>  	ptable = qcom_smem_get(SMEM_APPS, SMEM_AARM_PARTITION_TABLE, &len);
>  	if (IS_ERR(ptable)) {
> -		pr_err("Error reading partition table header\n");
> +		if (PTR_ERR(ptable) != -EPROBE_DEFER)
> +			pr_err("Error reading partition table header\n");
>  		return PTR_ERR(ptable);
>  	}
>  
> -- 
> 2.33.0
> 
