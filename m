Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D3F435E80E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Apr 2021 23:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239012AbhDMVNT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Apr 2021 17:13:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231424AbhDMVNS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Apr 2021 17:13:18 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAE68C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Apr 2021 14:12:57 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id e66so3117477oif.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Apr 2021 14:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rQq0/16a4a5XNB8IdpzVyiNn7MWUMs5g3rEBnudJ4vo=;
        b=Ln75BNotojOP6wyiKkOZYjqPMZ4Y0iT+YqvoPdFO+RLfEP15EEFWos1Eby/02ZMREp
         FvL1YHlNPp9PAe/2xbe6U/UcKbza+4k/PNQcdB0yP7VWCy8tCTWC/IgLlALeePm5BMm4
         yru1fbASD9kl5gf8cr9/YyKkyR3T8tMd9malilFm5IN6Cx2dWX7RUzaSl4dGGFw9+CN8
         SB/FhRRpcEsCZ5/NzZE0rdWredM2Bdp+TSSMiTS4C7Sx/s+MnU0AYq77FxaSXByLnACM
         RqUKYo4plYasBrUAcq8YWuqjweWriVGF0u6CWv6NTm9yczh16q48p5dxSQ1gkoeGXQIq
         VnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rQq0/16a4a5XNB8IdpzVyiNn7MWUMs5g3rEBnudJ4vo=;
        b=Ta5zf33xxI7aUScwCsLGGtWYEcm9d46GHfEk+NxO7mglr2jqTJn5oCpddHib5KdnZG
         lJwZRoK0QUkXgaZTbQjRqoSDTdnsKaA9lQ7kvtiCr3cL3i7bvi3LmxhVUR9ROq9+M9WU
         W2lZiIjg+zYJ8xzNwpVM/JNMj1cyc1FMqHEFJgVbrbyql6t7g3tt7PPxsUW/c2KXeWPs
         JuJLJtlh7KqL8qIr4XrZ9v5VhzDKjsEXEY4Pe863mMrURysdUKEX0uf0+s81uUZ5XhEM
         MVNSz0zdt50JI3GrEZPkBWcQQVS5T2ENcT9tysXLJOWL2N0Br/Cn1PS7LpqsVmgNagVI
         oy+w==
X-Gm-Message-State: AOAM5337Sn4m9uLPSwEChsuRUkbFCirHZlCYPBP4Pq9LGL2DUDjpheXv
        NCFLzCTGJPfp8Emsi2o0OGdefuho9L1cyA==
X-Google-Smtp-Source: ABdhPJy5AIluIQKxgfMZdF23/UEBa4cs19/OH/spwS2jU/GC1shnAaai9AxMu85CNOxvz3cSVYifTw==
X-Received: by 2002:a05:6808:1142:: with SMTP id u2mr1453286oiu.124.1618348377208;
        Tue, 13 Apr 2021 14:12:57 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v13sm1783497ote.74.2021.04.13.14.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 14:12:56 -0700 (PDT)
Date:   Tue, 13 Apr 2021 16:12:54 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Deepak Kumar Singh <deesin@qti.qualcomm.com>
Cc:     clew@codeaurora.org, sibis@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH V2 1/2] soc: qcom: aoss: Expose send for generic usecase
Message-ID: <YHYJVjvjUyXtrNmC@builder.lan>
References: <1617943188-23278-1-git-send-email-deesin@qti.qualcomm.com>
 <1617943188-23278-2-git-send-email-deesin@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617943188-23278-2-git-send-email-deesin@qti.qualcomm.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 08 Apr 23:39 CDT 2021, Deepak Kumar Singh wrote:
[..]
> +/**
> + * qmp_get() - get a qmp handle from a device
> + * @dev: client device pointer
> + *
> + * Return: handle to qmp device on success, ERR_PTR() on failure
> + */
> +struct qmp *qmp_get(struct device *dev)
> +{
> +	struct platform_device *pdev;
> +	struct device_node *np;
> +	struct qmp *qmp;
> +
> +	if (!dev || !dev->of_node)
> +		return ERR_PTR(-EINVAL);
> +
> +	np = of_parse_phandle(dev->of_node, "qcom,qmp", 0);
> +	if (!np)
> +		return ERR_PTR(-ENODEV);
> +
> +	pdev = of_find_device_by_node(np);
> +	if (!pdev)
> +		return ERR_PTR(-EINVAL);
> +
> +	qmp = platform_get_drvdata(pdev);
> +	return qmp ? qmp : ERR_PTR(-EPROBE_DEFER);
> +}
> +EXPORT_SYMBOL(qmp_get);
> +
> +void qmp_put(struct platform_device *pdev)
> +{
> +	platform_device_put(pdev);

I was expecting that the devres allocated struct qmp would stick around
until the struct device's release callback came. As described in my
answer to Mani yesterday I was wrong.

As such you need to make sure that struct qmp stays around until
qmp_remove() and all qmp_put() calls has been made.

I presume a reasonable way to achieve this is to not use devm to
allocate our struct qmp, add a kref to the object. So this would have to
be a kref_put() on that instead of the platform_device_put() I asked you
to implement here.

Sorry about that.


The rest of the patch looks good.

Regards,
Bjorn
