Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8590435D42E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Apr 2021 01:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237919AbhDLXyB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Apr 2021 19:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237250AbhDLXyB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Apr 2021 19:54:01 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42426C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Apr 2021 16:53:42 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id c16so15276489oib.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Apr 2021 16:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cgT1HApdmZ6zS0OsJ1xfBAFlpTT4bt9tHkmOVAqIDmE=;
        b=rLfqXGY3INUuJ2aRB/CzZnSw4KvS7BIaZPNNa/NJ1C6Dt/jGgiBhZl2iKVpg8KnTtY
         7MPjxY1QIymJLvhWtu9lX2CCNfmk4y2TeONlYDrYiocw2TnD2jtNeJESwir3O3aSb30X
         8AivrzRbyZLO64KNIsm0/yeVJ5bYFWdhV/anHLWvC+dcrkChxvWGjXgvDqKMhfr9NVAq
         uqzTsxGZkBkL+EAFLngxQnUc74zp5KTUZ9CBDmPrOIygQjfBgLBmTAnT9FXGd2vzTkow
         MBAD3KghXlIfSODGL/ftQxpjE9Cw3y+aAwyDmTs4yy1p3c+y+6Cc8eUmuzR2vK7K2QQj
         0GzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cgT1HApdmZ6zS0OsJ1xfBAFlpTT4bt9tHkmOVAqIDmE=;
        b=CY0CBwWpsv67boXO+h3lK7JAXJsq4Sy6WrXVwYAGIa9YAIQe9sD09V5S7ELG++LG96
         crZmkCiCDEoxi3VG6keF0oxk5+yq/rQRaZw/M0oIX4VIojcZ8qzn/x1gwfqhBhNeurv1
         83PO7zvZ0qJd6f6VeVimKAN/xb+B2Bc2AuUUbXNj9nO9XKC8uCqrzThKU369jPPyK2oN
         ZKJNw5rFqheuR+WVkjun0fp4by8hMf24Y8Zs798pGe0yvz0JvAAyqObodoOHCnx+U6dK
         swNIVFaAWcNPY8zU4TxXSjmaKfeibSEUgMJ2Cc6eyR2r3mnPl2ctRxtA0v01L3KvRQHA
         JBXQ==
X-Gm-Message-State: AOAM533H9wjZSbY5/+43Rtyx04ufj8IoHWqQJIejYx6wk/Mo7ibo3+ct
        4ANkK1XC43peHoPiI4x2ODfu7w==
X-Google-Smtp-Source: ABdhPJwB8eYTup93oYQNOALWr8lw5AXfKmpA25UytBaSHUI5Cm/0tYufSL5e57UWns9RDNfc9MMg4A==
X-Received: by 2002:aca:5d82:: with SMTP id r124mr1229083oib.59.1618271621720;
        Mon, 12 Apr 2021 16:53:41 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q10sm2451934ooo.34.2021.04.12.16.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 16:53:41 -0700 (PDT)
Date:   Mon, 12 Apr 2021 18:53:39 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] phy: qcom-qmp: remove redundant error of clock bulk
Message-ID: <20210412235339.GF1538589@yoga>
References: <1617937630-24832-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617937630-24832-1-git-send-email-chunfeng.yun@mediatek.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 08 Apr 22:07 CDT 2021, Chunfeng Yun wrote:

> There is error log in clk_bulk_prepare/enable()
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 9cdebe7..f14b8be 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -3598,10 +3598,8 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
>  	}
>  
>  	ret = clk_bulk_prepare_enable(cfg->num_clks, qmp->clks);
> -	if (ret) {
> -		dev_err(qmp->dev, "failed to enable clks, err=%d\n", ret);
> +	if (ret)
>  		goto err_rst;
> -	}
>  
>  	if (cfg->has_phy_dp_com_ctrl) {
>  		qphy_setbits(dp_com, QPHY_V3_DP_COM_POWER_DOWN_CTRL,
> @@ -4035,10 +4033,8 @@ static int __maybe_unused qcom_qmp_phy_runtime_resume(struct device *dev)
>  	}
>  
>  	ret = clk_bulk_prepare_enable(cfg->num_clks, qmp->clks);
> -	if (ret) {
> -		dev_err(qmp->dev, "failed to enable clks, err=%d\n", ret);
> +	if (ret)
>  		return ret;
> -	}
>  
>  	ret = clk_prepare_enable(qphy->pipe_clk);
>  	if (ret) {
> -- 
> 1.8.1.1.dirty
> 
