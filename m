Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11AC7625FA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2019 18:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730172AbfGHQTz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jul 2019 12:19:55 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33436 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730166AbfGHQTz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jul 2019 12:19:55 -0400
Received: by mail-pg1-f195.google.com with SMTP id m4so7955483pgk.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2019 09:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JjxNl+aiJVwEFW037TdFYNIV+aj3YXwaO56vKokp4fg=;
        b=nWoMlYKCccZZ2MjCx59nKlI6EYqkKIeBd3VbbpagSDmMYpRzp/OD3BgiOWEYuxCbHp
         hshG8hoxEOe+kukeVrh4/jx/TZ68YiQ66RN87l3xj4+ZHxgfZDiyKl8IZWSvBbLTAAhf
         PgVHA7EibMHH0dxw6zx2gu7c5ZpZcCE2yj/5kied+vHtvPfLpLoEGJ+dTcM46zew/26S
         2H7uqEwqttTzFLDDGyeaU15G3izIPwX1r4mDmI0TffWtxdrEyVFmBEpAEu+ADT4u1d9t
         +8FRZg7hem0ic92FEHU09XqaNFM+SsZnN9nnke+wZ7B5eTYn/uDMvQrkg5OlP8KeOdD8
         CvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JjxNl+aiJVwEFW037TdFYNIV+aj3YXwaO56vKokp4fg=;
        b=smkjl0C+R/wMWanvybYECfUmoaTxaslITpTOrL9Q53oszLVFvI6XaBiwH6y+p6TkCy
         rLufdsbz/fRgVG0uWuX4WbTGI5MZcUIEo0cXHbQo1+RRdLjiZb8aJ4iDiyypQttveWXH
         fwM6JUFUcEB1TmuqT4yocG/j5VfJAPAMooBf1SPqSndfOztoquix06MutLHS7gnPDptk
         U6QjbXSs5jGWWiwk134CG5JFTxsBtHugZK2QSCe0m9TPiulgHJ5TmltjM43vIe6uFVP8
         l6GuIzFsBA7v+BA6YXxrBqLGB8a9I9+AnH5L1z4bG2OdNk6U+uuUwd7ljBDQIKiFgYeq
         0oFA==
X-Gm-Message-State: APjAAAWkE9QBz3d1zOOKLgqdNdnC5+81qkayv8YJ3ZVWV1KEQNBCyjpH
        lRo4bFXrMeS0YLq5EbF4Jpep4A==
X-Google-Smtp-Source: APXvYqwij11T4wwzyudmfil9rmzXYXboSTKEP6zw+14xHbmF42E/H/8UkklpLuq3ltX0xpIwSD4NLg==
X-Received: by 2002:a17:90a:fa07:: with SMTP id cm7mr26270251pjb.138.1562602794573;
        Mon, 08 Jul 2019 09:19:54 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h9sm4072165pgh.51.2019.07.08.09.19.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jul 2019 09:19:53 -0700 (PDT)
Date:   Mon, 8 Jul 2019 09:19:51 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/14] phy: qcom-qmp: Replace devm_add_action() followed
 by failure action with devm_add_action_or_reset()
Message-ID: <20190708161951.GD27383@builder>
References: <20190708123401.12173-1-huangfq.daxian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190708123401.12173-1-huangfq.daxian@gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 08 Jul 05:34 PDT 2019, Fuqian Huang wrote:

> devm_add_action_or_reset() is introduced as a helper function which 
> internally calls devm_add_action(). If devm_add_action() fails 
> then it will execute the action mentioned and return the error code.
> This reduce source code size (avoid writing the action twice) 
> and reduce the likelyhood of bugs.
> 
> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index cd91b4179b10..677916f8968c 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -1837,9 +1837,7 @@ static int phy_pipe_clk_register(struct qcom_qmp *qmp, struct device_node *np)
>  	 * Roll a devm action because the clock provider is the child node, but
>  	 * the child node is not actually a device.
>  	 */
> -	ret = devm_add_action(qmp->dev, phy_pipe_clk_release_provider, np);
> -	if (ret)
> -		phy_pipe_clk_release_provider(np);
> +	ret = devm_add_action_or_reset(qmp->dev, phy_pipe_clk_release_provider, np);
>  
>  	return ret;
>  }
> -- 
> 2.11.0
> 
