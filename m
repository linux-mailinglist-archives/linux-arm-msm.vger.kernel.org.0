Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 882A62FB36A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jan 2021 08:44:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731311AbhASHmT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jan 2021 02:42:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730108AbhASHld (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jan 2021 02:41:33 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 996CCC061757
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jan 2021 23:40:52 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id p18so12450054pgm.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jan 2021 23:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9avt2pOBcvJfq1YOSVtKJyXRfPA6gi4W3HN8JdFkr7E=;
        b=H7u0aSET/08uKmaL90MaLtrCKKWIVTcDGAfQcXL7yEfeXS2W1ILnwX5b28nS5cuogI
         FcX5aPzkZvPi18mXmJ8dIcmiYm1Ry0ItT9HUaM/o+iXs6Kp8Dk20cz+ysMedb2uH112p
         xogjdOySkTDvzejIdx3dWdt5599EyodIBlZC79zC0RUqMJ7hgu8ZEdSbu5aPq+JUNOfd
         NuuWtk9YYCO8MJJpBHSZM/jazTzJB19IfAtzHHcOZ2HiiGGzrKBTIizgKCZ9J0MF5k/x
         HOaYdH1e3/Cx0i4n1C936ALNLfxuBo2AaPD6H7EVJC24AWaJDv91/PIWMxc3/HEHdsdQ
         z+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9avt2pOBcvJfq1YOSVtKJyXRfPA6gi4W3HN8JdFkr7E=;
        b=XBr7WL/ONWrjKWQ+vnOa8NtVcbqA60MXh26nCaYOyubbc8Gxz21E1w/fTkUmiwv9Sh
         71llruyrfF5JdfWtYDTNEyGmmAeg4W6dos/erEAYWrupkKTuBdg0Va8C6G6WPL4VV8+l
         4l11RQk4Tstpf0F9ysXcTFqnVbEO49zA66lsGeWgesxT6wAqosXvA0/gGzBPMR4eqOMP
         771Yxnjmh83hAECc3Y/jS3rwhjghUzXV2Wwvpa2R3nRHDbzHVoSB1DJnljtjw/OsKIaA
         0tRNyTu75Otc62kr+lOaVgB+YwoYtzq1skwLx0cS3f0fsPUCnmljy34eP9gMyGhgUGza
         PaBQ==
X-Gm-Message-State: AOAM5315lXtTEPrdZVzBNX7waqPnVYG6W4GiqudZovQEsJj2oRnNjY4J
        fB5wjSSXh9pI6uJ8Uoag9oSPw2AHO8j+Gw==
X-Google-Smtp-Source: ABdhPJy90mTIjMN6C//R3eawLVr0JtAtTzJ6ix8X3qtKcBMdssq6bTuEaSVX+ktT80LWYM9GFCIWNg==
X-Received: by 2002:a65:5244:: with SMTP id q4mr3354534pgp.50.1611042052159;
        Mon, 18 Jan 2021 23:40:52 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id fh15sm2057724pjb.32.2021.01.18.23.40.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jan 2021 23:40:51 -0800 (PST)
Date:   Tue, 19 Jan 2021 15:40:45 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: Re: [PATCH] venus: core: Fix platform driver shutdown
Message-ID: <20210119074044.GB17701@dragon>
References: <20201221095820.27192-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201221095820.27192-1-stanimir.varbanov@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 21, 2020 at 11:58:20AM +0200, Stanimir Varbanov wrote:
> With TZ system reboot cannot finish successfully. To fix that
> enable core clocks by runtime pm before TZ calls and disable
> clocks after that.
> 
> Fixes: 7399139be6b2 ("media: venus: core: add shutdown callback for venus")
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

Hi Mauro,

Could you help pick this fix up?

Shawn

> ---
>  drivers/media/platform/qcom/venus/core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index bdd293faaad0..7233a7311757 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -349,8 +349,10 @@ static void venus_core_shutdown(struct platform_device *pdev)
>  {
>  	struct venus_core *core = platform_get_drvdata(pdev);
>  
> +	pm_runtime_get_sync(core->dev);
>  	venus_shutdown(core);
>  	venus_firmware_deinit(core);
> +	pm_runtime_put_sync(core->dev);
>  }
>  
>  static __maybe_unused int venus_runtime_suspend(struct device *dev)
> -- 
> 2.17.1
> 
