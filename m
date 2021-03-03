Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC9232C221
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:03:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352348AbhCCVn6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:43:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346181AbhCCQZx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 11:25:53 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F2B6C061761
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 08:24:59 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id 192so9611094pfv.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 08:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=22eXr4vra9rpNLE/QH49970c8CJamZsqZaJDgMguOGY=;
        b=zwOu6m3orveqn59Tt2XlOGKTkxS48WAQZPw4kWeQvhK6XMR0H+x90PdKrt3pGc8Qln
         oRf+yvUCG6NOwWmhpo5uSyggwkVsTS6Z/vfivSOoTD5WqzIspXLsdxlfOQl8O0KAX/I8
         aR+biKBFc+efxM+Eft+65xnHA+WvA5Hfv0o0O1nLx6NVFa9vvHXhQqHOxchBQ1xEe3op
         CKXWJGJBCtUqIwbqAPjpj0ZqugBbNHED1F32BilMX6cNAe4q7T+rMZTNlMCJL7ADZiCQ
         Ut2W1k1HI6sTsLn4UVbnVnG9pgl8K3YFmix1ziOTI01S8pqyQsG1b9kmpVPwGYZC90hc
         PoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=22eXr4vra9rpNLE/QH49970c8CJamZsqZaJDgMguOGY=;
        b=iMUjsIPop/uVVMAC/jARnw5WtfWV8ZaIAdrjvkEBeVs0he2D6OB/Wa2eAFcyVM9piy
         WfDO3MOxKj+kjcpbkHgzwXWJfeHDs2/+81PwTUAdN7qrSrfx/vWyU3t7XyvidGEXfiTO
         UMsWZIvEG2G2vJPpmLOd0cG+P/Rzr7UnrtPGGWiEIXXkhwo4BwK+7GMxnMajmiOrVHJk
         yVSAuDEDk8ul1KwckUJEoeKfMmK/mRI030asEHGrIs/6XnixlbBhzxfc9AbJ38sDNeUH
         7lo589k55cuT7B0qp/aj4E/BRUCgNEuEvWGd8SOcg1CbC06gNyVte4priFNNKSDUEVzs
         fIag==
X-Gm-Message-State: AOAM531l206fY//g+Ou6baT1hCXj/gCQVy3iPTgPZR+vDKeDgYoJikKP
        9kReuK0s1IIUiwd58VxuCnTU
X-Google-Smtp-Source: ABdhPJxPltBTg/gxSy7GFFkRDGCXfCeGVfBIAL5O6cYLXxhbKHlmaS2zoPg1WReewfw/cE+YpkTawA==
X-Received: by 2002:a63:5962:: with SMTP id j34mr23432991pgm.331.1614788699065;
        Wed, 03 Mar 2021 08:24:59 -0800 (PST)
Received: from thinkpad ([2409:4072:1d:4075:f412:a448:6d6c:cb4d])
        by smtp.gmail.com with ESMTPSA id r31sm17993312pgm.11.2021.03.03.08.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 08:24:58 -0800 (PST)
Date:   Wed, 3 Mar 2021 21:54:52 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] mtd: parsers: qcom: incompatible with spi-nor 4k sectors
Message-ID: <20210303162452.GA4319@thinkpad>
References: <71e3fe832d35bd34a7da87146ba7d52f89278665.1614780732.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71e3fe832d35bd34a7da87146ba7d52f89278665.1614780732.git.baruch@tkos.co.il>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 03, 2021 at 04:12:12PM +0200, Baruch Siach wrote:
> Partition size and offset value are in block size units, which is the
> same as 'erasesize'. But when 4K sectors are enabled erasesize is set to
> 4K. Bail out in that case.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  drivers/mtd/parsers/qcomsmempart.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
> index 808cb33d71f8..f851574e1b52 100644
> --- a/drivers/mtd/parsers/qcomsmempart.c
> +++ b/drivers/mtd/parsers/qcomsmempart.c
> @@ -65,6 +65,13 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
>  	int ret, i, numparts;
>  	char *name, *c;
>  
> +	if (IS_ENABLED(CONFIG_MTD_SPI_NOR_USE_4K_SECTORS)
> +			&& mtd->type == MTD_NORFLASH) {
> +		pr_err("%s: SMEM partition parse is incompatible with 4K sectors\n",

s/parse/parser

With that and the fixes tag,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> +				mtd->name);
> +		return -EINVAL;
> +	}
> +
>  	pr_debug("Parsing partition table info from SMEM\n");
>  	ptable = qcom_smem_get(SMEM_APPS, SMEM_AARM_PARTITION_TABLE, &len);
>  	if (IS_ERR(ptable)) {
> -- 
> 2.30.1
> 
