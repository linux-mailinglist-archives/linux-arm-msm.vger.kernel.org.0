Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 983A6464594
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 04:50:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241583AbhLADxc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Nov 2021 22:53:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbhLADxc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Nov 2021 22:53:32 -0500
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06BB6C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Nov 2021 19:50:11 -0800 (PST)
Received: by mail-oo1-xc36.google.com with SMTP id g11-20020a4a754b000000b002c679a02b18so7388193oof.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Nov 2021 19:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Vh64HlEJjPzjJ+Mpfa13ShJlj+Z94ObsnHICCNTz+Qs=;
        b=lgIhSMrQStWm/xh3G3jIw9VllTe2uKgdqLWQywK8mPMN+TqFpMnWA8BVqxedCNZIp0
         tfQc8DXMlTjFF4Mh5ojJuwIVQesS4v57XTZM//Z39i1QChQU1Dsu1aGMXjBCicJXJm7B
         Jx4/Ht00O9olvh5hPGd/uv2678KjeqEYOfEFNoSpPbBvGMtvgOvM6aGOQuYBcokK1u1u
         INobD5negB4q1vdB3i4zUVAbOYa3ZkpJ3RDJYEwBZe4oXxE1moESg3Vr5ni+nfJVs1BR
         mGOXt2ti5p+WmIiRwXIuxwkmdNPwAXIIkZ1XJEYTm4BEMnYkCekrCuJHb57FTkGemFsW
         hiow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Vh64HlEJjPzjJ+Mpfa13ShJlj+Z94ObsnHICCNTz+Qs=;
        b=fxxi9PV380V0t0hbT8CrKuZYC7tA3toObbF9lC35SHN0SPcaDGuepiKCVCmPnAh6wF
         5qXkpII401oGOE0on7YDkFRh3nBCWRZx7XaiyuH6b4nTK+eVu/2BnvfK/WGQoDt0Cy0r
         tjUI1ABylEiv/DC0he+uIpNfLeutxOQhkXdkbdCl9mlMoZutEFsw2c23CXnpRQxym76v
         xd/O0G9sJV4dd8n3c6JWAnrjS6tob5XLbEXn0Mk6/pAxs8qDwPSxzmLc9CwSi1ej0+nu
         g0AIOda0V2sNDVBgf4k4mOP7wPgZ4B2bliyZJZoAOndEjE30nTvz4Uoq3TuWJEnkkvQn
         ESSg==
X-Gm-Message-State: AOAM530WDVLbEqEhl3J0VydQA6kiWmpvTB2FeLrQOff5IfptoIv2oeIj
        bupLbEMaT5u0vgtnf+yryd/Ylw==
X-Google-Smtp-Source: ABdhPJzH+r5KszynhMHork3TPK+4l/u0Mu1pjmCk4Dh4XaNoVyejeWYQu/mXe80D4FYluMpd7xN6VQ==
X-Received: by 2002:a4a:a641:: with SMTP id j1mr2714339oom.63.1638330611085;
        Tue, 30 Nov 2021 19:50:11 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x16sm3574994otq.47.2021.11.30.19.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 19:50:10 -0800 (PST)
Date:   Tue, 30 Nov 2021 21:50:06 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, phone-devel@vger.kernel.org,
        Aleksander Morgado <aleksander@aleksander.es>
Subject: Re: [PATCH 1/2] remoteproc: qcom_q6v5_mss: Populate additional
 devices from DT
Message-ID: <Yabw7kCsbhE1EFhW@builder.lan>
References: <20211129132930.6901-1-stephan@gerhold.net>
 <20211129132930.6901-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211129132930.6901-2-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 29 Nov 07:29 CST 2021, Stephan Gerhold wrote:

> Some devices without own memory resources could be placed anywhere in the
> device tree but they logically belong to the modem remote processor. Make
> it possible to probe them when defined under the mpss device tree node
> by calling of_platform_populate().
> 

This seems reasonable, but other "child devices" of the remoteproc
follows the state of the remoteproc instance. So I'm worried that this
will create an inconsistency in that assumption.

> This can be used for BAM-DMUX for example, which provides the WWAN network
> interfaces on some older Qualcomm SoCs such as MSM8916 or MSM8974.
> 

Is there a technical reason for placing the BAM-DMUX within the modem
remoteproc node? Can we simply move it to / ?

Regards,
Bjorn

> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 43ea8455546c..69f3d1ebf1f1 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -1989,8 +1989,14 @@ static int q6v5_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto remove_sysmon_subdev;
>  
> +	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
> +	if (ret)
> +		goto remove_rproc;
> +
>  	return 0;
>  
> +remove_rproc:
> +	rproc_del(rproc);
>  remove_sysmon_subdev:
>  	qcom_remove_sysmon_subdev(qproc->sysmon);
>  remove_subdevs:
> @@ -2010,6 +2016,7 @@ static int q6v5_remove(struct platform_device *pdev)
>  	struct q6v5 *qproc = platform_get_drvdata(pdev);
>  	struct rproc *rproc = qproc->rproc;
>  
> +	of_platform_depopulate(&pdev->dev);
>  	rproc_del(rproc);
>  
>  	qcom_q6v5_deinit(&qproc->q6v5);
> -- 
> 2.34.1
> 
