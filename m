Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD22838F8E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 05:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbhEYDkC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 23:40:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbhEYDkB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 23:40:01 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70563C061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 May 2021 20:38:32 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id v19-20020a0568301413b0290304f00e3d88so27306120otp.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 May 2021 20:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=l5R619Q1zWvoFWxXu9dLdrHOdI9Uxbo2XfaR/PsqP/w=;
        b=IerDmGwEhA8080Vgc39jnga4/cCYN+pcVLDsHy0yqapQfvzIs14sDM7W2+uLZ6t/Me
         H3D7i/ZoUgC0XoVw4sLROZ1ylqiZentIDBvs5EajzQT0XUnDH2tOvaYGcc3uMwAnuDgH
         hP4YnEYc8IVq0UTIMH9cSIhmxawddEmXoojv2++HQkR/UaMM1HOf+HqgHmyxwkvGC0rb
         c9mZXcv1hZDoH88sGbb461aDbg28xTgvqQsvo27ntxDW7KJLUq9VxA2qOdGGXW6P2GSU
         OoqMsT3CPxyDMxKqw1Y3axUY8zx5wqvphGcnbC42z0Jqqi0ssMRarmZYXco7NGyGQJki
         sVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l5R619Q1zWvoFWxXu9dLdrHOdI9Uxbo2XfaR/PsqP/w=;
        b=UL3qK/6PFugBhSF/akNmcVJd02L+lZFg+1xLhKyTEhCTbB2xac0OFVs3s/RUBEsVIS
         GGTjFJ4vS+mTTxhUyR3LRtXMwFtk1DSYUxTORF8GvQ7JKIarxLxG5Oq47IdFDhDCAZnt
         m4kcbespO5d1aKaz1k5OonQXYnoXPL+8w59EKiGWaUT4XAfJC68v1uCVhong+TQ1dESC
         XPcdSZ2Nf2R6UxLVw+3AArjMlitAVDK4WInEc+QY67erszZVfz3v8zJUN7QAjQvLakDM
         JVAKFilyX8gNh5Z8ylUgif4LU20kOogEHsycYgMSBF5KOG5J5Uz/6f0w4v8AhWg51Z+G
         YKoQ==
X-Gm-Message-State: AOAM530jNJ01T31dKMRPh8HKrhOYVeRWiO3SsmTRF7xGFtSL9syt0swQ
        b6vSAMvDTvpwPER9ZHgzv8xC5g==
X-Google-Smtp-Source: ABdhPJy+tUAVjYl81RpF00SVIPiVQYnS4lBr2iISxLqCvTBDx3I+NrN/q07EivJanpGKT10snnedyA==
X-Received: by 2002:a9d:6255:: with SMTP id i21mr21299550otk.284.1621913911778;
        Mon, 24 May 2021 20:38:31 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x24sm3499384otq.34.2021.05.24.20.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 20:38:31 -0700 (PDT)
Date:   Mon, 24 May 2021 22:38:29 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: parsers: qcom: Fix leaking of partition name
Message-ID: <YKxxNY8d/M1fXWr9@yoga>
References: <20210525001449.10386-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210525001449.10386-1-ansuelsmth@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 24 May 19:14 CDT 2021, Ansuel Smith wrote:

> Partition name are already allocated and defined by the ptable struct.
> Skip reallocation of name variable and directly lowercase the name in
> the ptable struct. The name variable was duplicated but never freed.
> The leak was found using kmemleak.
> 

We know that SMEM_AARM_PARTITION_TABLE is accessed by at least the modem
firmware, so I don't think we should change it in place.

I think the appropriate solution is to implement the "cleanup" operation
in struct mtd_part_parser.

Regards,
Bjorn

> Fixes: 803eb124e1a6 ("mtd: parsers: Add Qcom SMEM parser")
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  drivers/mtd/parsers/qcomsmempart.c | 22 ++++------------------
>  1 file changed, 4 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
> index d9083308f6ba..3d083f0815f8 100644
> --- a/drivers/mtd/parsers/qcomsmempart.c
> +++ b/drivers/mtd/parsers/qcomsmempart.c
> @@ -62,8 +62,8 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
>  	struct smem_flash_ptable *ptable;
>  	size_t len = SMEM_FLASH_PTABLE_HDR_LEN;
>  	struct mtd_partition *parts;
> -	int ret, i, numparts;
> -	char *name, *c;
> +	int i, numparts;
> +	char *c;
>  
>  	if (IS_ENABLED(CONFIG_MTD_SPI_NOR_USE_4K_SECTORS)
>  			&& mtd->type == MTD_NORFLASH) {
> @@ -125,17 +125,11 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
>  		if (pentry->name[0] == '\0')
>  			continue;
>  
> -		name = kstrdup(pentry->name, GFP_KERNEL);
> -		if (!name) {
> -			ret = -ENOMEM;
> -			goto out_free_parts;
> -		}
> -
>  		/* Convert name to lower case */
> -		for (c = name; *c != '\0'; c++)
> +		for (c = pentry->name; *c != '\0'; c++)
>  			*c = tolower(*c);
>  
> -		parts[i].name = name;
> +		parts[i].name = pentry->name;
>  		parts[i].offset = le32_to_cpu(pentry->offset) * mtd->erasesize;
>  		parts[i].mask_flags = pentry->attr;
>  		parts[i].size = le32_to_cpu(pentry->length) * mtd->erasesize;
> @@ -149,14 +143,6 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
>  	*pparts = parts;
>  
>  	return numparts;
> -
> -out_free_parts:
> -	while (--i >= 0)
> -		kfree(parts[i].name);
> -	kfree(parts);
> -	*pparts = NULL;
> -
> -	return ret;
>  }
>  
>  static const struct of_device_id qcomsmem_of_match_table[] = {
> -- 
> 2.31.1
> 
