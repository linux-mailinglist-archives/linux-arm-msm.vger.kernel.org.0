Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24871391043
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 08:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232431AbhEZGE1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 02:04:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:51318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231657AbhEZGE0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 02:04:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 46290613CC;
        Wed, 26 May 2021 06:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622008975;
        bh=Px4RLhRm+fl/7hIdMPYO+uGgtTr0sXe6bUIxzTzzwQw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WEMmgUWHwEVFXB1PkX1xij4Xz97EIBpu0xIngzEIpiwZHJnUjowxHp89dkSv2XWjb
         MmkiK+rlLYmsOAxSP3apdMVwmzIgg96RbtgglKWkyJlwWUdQwa/3BwSr6OHGcpUCaO
         NzvWwdpz/qq6EnGNgjAaBIRAijjRmb2Fv8Cb8z9cpjqhRusb+5K691cC6+G0b+8FHn
         Y1iPRtsE0wXkW/W4O0gNvcsdsDHQV3wY/uIWi5BUd0Hnx++c3vEj9Tv0WJ4anolKry
         Eiq4AtxxfbAheIHtW9j0yatm+C6ZovTgbvm2Ydq5w2620YSY1lFXecaom6+x0L2vfj
         sFJQOiVWckFvw==
Date:   Wed, 26 May 2021 11:32:46 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: parsers: qcom: Fix leaking of partition name
Message-ID: <20210526060246.GA10723@work>
References: <20210525230931.30013-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210525230931.30013-1-ansuelsmth@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 26, 2021 at 01:09:31AM +0200, Ansuel Smith wrote:
> Add cleanup function as the name variable for the partition name was
> allocaed but never freed after the use as the add mtd function
> duplicate the name and free the pparts struct as the partition name is
> assumed to be static.
> The leak was found using kmemleak.
> 
> Fixes: 803eb124e1a6 ("mtd: parsers: Add Qcom SMEM parser")
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/mtd/parsers/qcomsmempart.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
> index d9083308f6ba..06a818cd2433 100644
> --- a/drivers/mtd/parsers/qcomsmempart.c
> +++ b/drivers/mtd/parsers/qcomsmempart.c
> @@ -159,6 +159,15 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
>  	return ret;
>  }
>  
> +static void parse_qcomsmem_cleanup(const struct mtd_partition *pparts,
> +				   int nr_parts)
> +{
> +	int i;
> +
> +	for (i = 0; i < nr_parts; i++)
> +		kfree(pparts[i].name);
> +}
> +
>  static const struct of_device_id qcomsmem_of_match_table[] = {
>  	{ .compatible = "qcom,smem-part" },
>  	{},
> @@ -167,6 +176,7 @@ MODULE_DEVICE_TABLE(of, qcomsmem_of_match_table);
>  
>  static struct mtd_part_parser mtd_parser_qcomsmem = {
>  	.parse_fn = parse_qcomsmem_part,
> +	.cleanup = parse_qcomsmem_cleanup,
>  	.name = "qcomsmem",
>  	.of_match_table = qcomsmem_of_match_table,
>  };
> -- 
> 2.31.1
> 
