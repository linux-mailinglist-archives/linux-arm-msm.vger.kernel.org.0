Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0747C2F65FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 17:32:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbhANQba (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 11:31:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbhANQba (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 11:31:30 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56FEAC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 08:30:50 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id i6so5715745otr.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 08:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eUJxT7xNYx0Gs/N9eWI+FYjhOP8rG+Lulydd9Jaj3ds=;
        b=LPMwZK+Wz7xT42eu1U1ogPEQToTSUFCXKzBeVYe6CXZcKlnuhVFPdYtFq7I+2JGd+y
         JQUXRae958TMUyZsZTpWBPnjteBsavr2GZDsVar5+rZOBqQneHgct9zk+dEceJa/XN/P
         kn9hDeDTFV+0Py4ibdqTUYuy7vhRZVH5zu3ATnjBqxb+qV9B7FJspLh36aR3aNTEaUHV
         Ub6Bolp61OhHwc492JM/ZZPNw/3oBLeF6VWKIXHQ8TbW3dd5SCCxg0eT0HYG9U0OTyIa
         3CHMUlwz7NNbGuMWU0jV9F2xuZNFoJ0Wff6kB4WPz/Cs7X/uTpYwSSHJharejknoY0AN
         8FdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eUJxT7xNYx0Gs/N9eWI+FYjhOP8rG+Lulydd9Jaj3ds=;
        b=GBwO8ybM2tkJQojjB0lB1bQCqdzdaGE9OiYcjSOj5c5lJPczBhAvrjb0GsZtWuu9n8
         GekhjBWuG3+zd0xrHuJY/0PKolC9fEQDi9daAuDQBpr7Zk36jWzpBXPWTDswEQFxjQIr
         qgmIN1D439a/IKCQ3/CvoRRv63/dQK0wpzSudm6njP8eImKHZfBFhmTN249Rh21Agug4
         9zYEWnuvkgvMR3zT/xBXzZHm59hH7NLIr29XfCIsQ9BRrgmzuKxVUEqhMZfFCKpHfE6G
         I5kxHw7xUly3xpTFm4nxQXlcpLvT0Wi+mPA+pE5LPICggI74e8R4GekrMJAfnbxTixCS
         EBVw==
X-Gm-Message-State: AOAM531sgaAIVenoPuEQrGyJruXCI0TRqC3htHIurwpJ2zzs4VknMDFO
        97FGUvzf4viEGepWuHfZ4VY+H6QNBRPy/Q==
X-Google-Smtp-Source: ABdhPJy1YWK9v1m3W94zYMMb84cMsotTdnGJ42gOrBmPF/pqhX1eEKP1Ohnq8eKc9f5KeY4M/9mykw==
X-Received: by 2002:a05:6830:2144:: with SMTP id r4mr5114173otd.72.1610641849712;
        Thu, 14 Jan 2021 08:30:49 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o17sm1146212otp.30.2021.01.14.08.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 08:30:49 -0800 (PST)
Date:   Thu, 14 Jan 2021 10:30:47 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: geni: shield geni_icc_get() for ACPI boot
Message-ID: <YABxt0HYwWoLvakw@builder.lan>
References: <20210114112928.11368-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210114112928.11368-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 14 Jan 05:29 CST 2021, Shawn Guo wrote:

> Currently, GENI devices like i2c-qcom-geni fails to probe in ACPI boot,
> if interconnect support is enabled.  That's because interconnect driver
> only supports DT right now.  As interconnect is not necessarily required
> for basic function of GENI devices, let's shield geni_icc_get() call,
> and then all other ICC calls become nop due to NULL icc_path, so that
> GENI devices keep working for ACPI boot.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
> Changes for v2:
> - Only shield geni_icc_get(), as all other ICC calls will become nop
>   anyway due to NULL icc_path.
> 
>  drivers/soc/qcom/qcom-geni-se.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index f42954e2c98e..c7c03ccfe888 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -760,6 +760,9 @@ int geni_icc_get(struct geni_se *se, const char *icc_ddr)
>  	int i, err;
>  	const char *icc_names[] = {"qup-core", "qup-config", icc_ddr};
>  
> +	if (has_acpi_companion(se->dev))
> +		return 0;
> +
>  	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
>  		if (!icc_names[i])
>  			continue;
> -- 
> 2.17.1
> 
