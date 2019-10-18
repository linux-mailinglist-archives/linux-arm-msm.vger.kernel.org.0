Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69F52DCC3D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 19:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404961AbfJRRHC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 13:07:02 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39144 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387714AbfJRRHC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 13:07:02 -0400
Received: by mail-pf1-f196.google.com with SMTP id v4so4262835pff.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2019 10:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=s4mBZS+ljuU08rW884SHkz0i5bxQ4SJXmq8jp6tRUPg=;
        b=yKhqYHL2pFUl4x0vzuSYcslNeVF/bHclgLn/jbiR4D31jUrWdwXJOkaY4oPnzZDaZX
         klcUgEiOu86wgFyATnDdOleKOmdqzEPxQNCjfbE8VyOenkKZGNlP9Z90fZLOWTmKCGok
         yl3Rz2uIwif2Uvh6c9EgeKbCUtKbF5dtcsB/oXeUEiLMe4KrpsGUbU6QQBjowWXagJ1D
         ARrvds73ksxjjg01m9PTHZ0NCMtz3Rw+CoT7iZeLrJwHGjeYSPWBdfNqGFpb4j1TnRLJ
         UzAfIkbLArZpKqcv0G8IeTQEGtfEYmRUviwIPPMCXFX0iqk0RpDIaDa9Z0GjVCRI8sIS
         k+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=s4mBZS+ljuU08rW884SHkz0i5bxQ4SJXmq8jp6tRUPg=;
        b=MSB435g1wS/F2GLgSmUP3a4kzgNZCx3rBO54fXJdRdFMrgBmQe9Cw6TWef/CInXWnG
         tqQPftLAAVgmSrBTdOSs4KND0cBPoJ0MDRLsPQhMQZZCbnA4W5BCP3ZqA/WD3BR2v+uw
         mLGpmnMo8L2asIY4bCTqhuV4VpPlql+xAq7IpLDlu6k+9VVc24V9sf5fzXg7P6LENJ4z
         +o+KuhR99xH7srVtZpfPGOYHF+S3JY/higP6JoDvD6hIJABAMJaGi+QGAxrCRySZH3GH
         CAHwd+n90hQqAPDMnakfUe15gVkieCSH97vnkvlw0Pcw0nuC9Zh/0P2Y7kZbqH6NcvC0
         5q3g==
X-Gm-Message-State: APjAAAWNjvLHmunpVoKknVID/cShLV/qAncFcp4IbDKmbU6x5yvEnZ/D
        2zGawQQKT7T8BR4G2kLnaDn0BQ==
X-Google-Smtp-Source: APXvYqzCsL68VirLSBGvWUCdpFt/+Zq1BrRbdAcnSRDaLPTmDpRsFdPQLecri/RwQRFAROsaxnc6qA==
X-Received: by 2002:a62:6842:: with SMTP id d63mr7792318pfc.16.1571418421377;
        Fri, 18 Oct 2019 10:07:01 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f13sm6753490pgr.6.2019.10.18.10.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 10:07:00 -0700 (PDT)
Date:   Fri, 18 Oct 2019 10:06:57 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     linus.walleij@linaro.org, manivannan.sadhasivam@linaro.org,
        afaerber@suse.de, f.fainelli@gmail.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        jesper.nilsson@axis.com, lars.persson@axis.com,
        ludovic.desroches@microchip.com, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, baruch@tkos.co.il,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com,
        linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
        vz@mleia.com, narmstrong@baylibre.com, geert+renesas@glider.be,
        daniel@zonque.org, haojian.zhuang@gmail.com, wens@csie.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, agross@kernel.org
Subject: Re: [PATCH -next 11/30] pinctrl: msm: use
 devm_platform_ioremap_resource() to simplify code
Message-ID: <20191018170657.GD4500@tuxbook-pro>
References: <20191017122640.22976-1-yuehaibing@huawei.com>
 <20191017122640.22976-12-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191017122640.22976-12-yuehaibing@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 17 Oct 05:26 PDT 2019, YueHaibing wrote:

> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 763da0b..62fcae9 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1150,8 +1150,7 @@ int msm_pinctrl_probe(struct platform_device *pdev,
>  				return PTR_ERR(pctrl->regs[i]);
>  		}
>  	} else {
> -		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -		pctrl->regs[0] = devm_ioremap_resource(&pdev->dev, res);
> +		pctrl->regs[0] = devm_platform_ioremap_resource(pdev, 0);
>  		if (IS_ERR(pctrl->regs[0]))
>  			return PTR_ERR(pctrl->regs[0]);
>  	}
> -- 
> 2.7.4
> 
> 
