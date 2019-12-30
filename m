Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E554D12CB85
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2019 02:05:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbfL3BFG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Dec 2019 20:05:06 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43274 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbfL3BFG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Dec 2019 20:05:06 -0500
Received: by mail-ot1-f68.google.com with SMTP id p8so7870244oth.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Dec 2019 17:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1uou/b60cIOsMB3DzOtWATQEv5uMUtNiIAyfu0e/7RU=;
        b=aiKcmfv+dEWo2le/tjhTAw8tcKlQ0CqkPBBHpVEJh7FgnksKRQ3+hLp0toLsq9RsYK
         CztWSrHHddNxP+qLAFQQEwsU2JX7my6RqveTx38RdovRZGe7CM1LBq5T/j4W8IdUmfSJ
         SdF2Bq+gg7r/0zAA0tHGRrmtabNkGkuCDOwU1H/rQ0LSZFVE+7qcNXHq1qyj1FjOJsES
         8HJTTK0LDo7QfVpfOSk5MnnY3Kcezzg6Q0a4tTfkQUQ/8geqnKdwgL4382LucumngyXB
         wfRe/fTehXCvD8htrQa36Fh5ZsMFYQ3P6ul9f9caoovpRKGiukaiVC3R67RiYPuTkr+f
         7Iag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1uou/b60cIOsMB3DzOtWATQEv5uMUtNiIAyfu0e/7RU=;
        b=SQU5UxGAvo+CCs2g1muqQJatoKNoEWUMwqRlh9QpQ2qXX8hxCLgcUhZQiRNGvReOv9
         UVNbLir2nBbS+zUYj1lm2yey3EYog891dMoYtMVibBWR2wcNnwIFMmtEfBilx3NH+NTN
         9ueTKjFFMOwOZ9DeqQQj1JWcEWNHpTAIh4ZLZw/wD79eqiuHi+bxmBeXBOcxjMGq/fhj
         WkjXqeW9cKbjtiMZQfYZjv6lV+4bSMQmDm5Pdt9v+rN0Pc4Cgqd2A5eW1Gi8Tx0QVJqI
         fPWsggopl/INsnm6jxAhQzyovx6rzElvqQsMDZDlzr1VEhyo/yubLE7Kexf3ktGF9Qry
         njSA==
X-Gm-Message-State: APjAAAVF8AU92DX6ckvazZqBKPuQq+D0o60uyrRlkAnEekGfm79Q7cTS
        oSEgUj97qx6T4BpQGITq1RUisA==
X-Google-Smtp-Source: APXvYqxjgsyQVJ4CLBiKYs6InxnmHCMDH1KJmdUI1mQYT+Cx0caVrZ1wXctdMcb1AJLR38bGRw+0+A==
X-Received: by 2002:a05:6830:304c:: with SMTP id p12mr41031309otr.214.1577667905418;
        Sun, 29 Dec 2019 17:05:05 -0800 (PST)
Received: from leoy-ThinkPad-X240s (li1058-79.members.linode.com. [45.33.121.79])
        by smtp.gmail.com with ESMTPSA id j10sm10043384otr.64.2019.12.29.17.04.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Dec 2019 17:05:04 -0800 (PST)
Date:   Mon, 30 Dec 2019 09:04:55 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Yangtao Li <tiny.windzz@gmail.com>
Cc:     jassisinghbrar@gmail.com, nsaenzjulienne@suse.de,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, lftan@altera.com,
        matthias.bgg@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        nios2-dev@lists.rocketboards.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 06/13] mailbox: hi3660: convert to
 devm_platform_ioremap_resource
Message-ID: <20191230010455.GC4552@leoy-ThinkPad-X240s>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
 <20191228183538.26189-6-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191228183538.26189-6-tiny.windzz@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Dec 28, 2019 at 06:35:31PM +0000, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>

Reviewed-by: Leo Yan <leo.yan@linaro.org>

> ---
>  drivers/mailbox/hi3660-mailbox.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mailbox/hi3660-mailbox.c b/drivers/mailbox/hi3660-mailbox.c
> index 53f4bc2488c5..97e2c4ed807d 100644
> --- a/drivers/mailbox/hi3660-mailbox.c
> +++ b/drivers/mailbox/hi3660-mailbox.c
> @@ -240,7 +240,6 @@ static int hi3660_mbox_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct hi3660_mbox *mbox;
>  	struct mbox_chan *chan;
> -	struct resource *res;
>  	unsigned long ch;
>  	int err;
>  
> @@ -248,8 +247,7 @@ static int hi3660_mbox_probe(struct platform_device *pdev)
>  	if (!mbox)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	mbox->base = devm_ioremap_resource(dev, res);
> +	mbox->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(mbox->base))
>  		return PTR_ERR(mbox->base);
>  
> -- 
> 2.17.1
> 
