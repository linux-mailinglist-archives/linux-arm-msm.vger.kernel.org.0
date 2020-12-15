Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7102B2DB599
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Dec 2020 22:09:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728250AbgLOVIo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Dec 2020 16:08:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727913AbgLOVIi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Dec 2020 16:08:38 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BE5BC0617A6
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Dec 2020 13:07:55 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id l207so24967589oib.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Dec 2020 13:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mr0oyFeW2WMShunStA/9/T24+fUeuQghubitiMhP6ek=;
        b=U+ui0jewvpcoRcg+Zyei0NVcTzeq/7RmLZqrxqmruYDpejIXqzDLBbRCjX8qpDo81Z
         5LcKdpo8yz2p4NlxslHj4UgwF3+Gv72NkovkBs/Y0UyWqQaXFJVGzuM4dvBtu2E9yath
         VIQqW4H+0p9+IVKODH8wdHx/kCBhmakqlyBZFssmT1r9/w4lebwiwR88c4nj41Jg6ZJA
         Jc0LOrbT7Xi5e3zf+PynysdqdnVjhpbFjrbymsPX9bOjadywehziw6J7Mqee2VGJrcuh
         7tvt+hqCIMBp5uESU611K24Dq2KSTkb12H1as9Vd53NKrJ/PStQvbAGYQkr11Xk+sbFn
         UBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mr0oyFeW2WMShunStA/9/T24+fUeuQghubitiMhP6ek=;
        b=R66eJa1LL8ni6TBnHRrllccSK9/iYMbEIEzJCjB5ZPtsUOukncpMl1ybPVt/0oe6iJ
         qLoZ/PoNKGtLLgTTOAJxNlW8LwVPb6KGRK6YuGiQF0N2N6SDWZwqws1Vfqb2vHJafMQj
         VGXna1aI9BTrIH2+hbcSzODh36iHdfZ8SSNwaYREr5EEnmSu+mD/qM0A+2FqMs66Hosl
         bFW6jqpCugH4lRJHFUKKqycp7/65Bf6NdESJWcv/PgM+ug1ZN2GW1yr0Gx+gLdlVV2Qi
         HCaFYcQcRDaJDMbhoGUiln8OS3lbYvnDU5Z0E9712fcIoXIPL4GJRBA0GbLx6kzg/WU2
         KDcw==
X-Gm-Message-State: AOAM531NeCS4vbD++2FU8GAQIrHUWRWzGiW80Fr4u5l4vTQQgQMXN1rk
        BCNAWiT1NwozqJxZ5a8Z6LDfuUpCOD4/3A==
X-Google-Smtp-Source: ABdhPJz97Uz6XziO940/hcjQxSZpaFHQuNCqrjqcaS+CKUrpBe4NMGVhAMpoNpWBYKqjXLRw2k0Qdg==
X-Received: by 2002:aca:3194:: with SMTP id x142mr500622oix.82.1608066474929;
        Tue, 15 Dec 2020 13:07:54 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x72sm5353148oia.16.2020.12.15.13.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 13:07:54 -0800 (PST)
Date:   Tue, 15 Dec 2020 15:07:52 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Jassi Brar <jassisinghbrar@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mailbox: qcom-apcs-ipc: use PLATFORM_DEVID_AUTO to
 register device
Message-ID: <X9klqNMoWxQnOsKr@builder.lan>
References: <20201013021241.5656-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013021241.5656-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 12 Oct 21:12 CDT 2020, Shawn Guo wrote:

> On MSM8916, only one qcom-apcs-msm8916-clk device is needed, as there is
> only one APCS clock.  However, on MSM8939 three APCS clocks need to be
> registered for cluster0 (little cores), cluster1 (big cores) and CCI
> (Cache Coherent Interconnect).  That said, we will need to register 3
> qcom-apcs-msm8916-clk devices.  Let's use PLATFORM_DEVID_AUTO rather
> than PLATFORM_DEVID_NONE for platform_device_register_data() call.
> Otherwise, the second APCS clock registration will fail due to duplicate
> device name.
> 
> [    0.519657] sysfs: cannot create duplicate filename '/bus/platform/devices/qcom-apcs-msm8916-clk'
> ...
> [    0.661158] qcom_apcs_ipc b111000.mailbox: failed to register APCS clk
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index 077e5c6a9ef7..3d100a004760 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -128,7 +128,7 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>  	if (apcs_data->clk_name) {
>  		apcs->clk = platform_device_register_data(&pdev->dev,
>  							  apcs_data->clk_name,
> -							  PLATFORM_DEVID_NONE,
> +							  PLATFORM_DEVID_AUTO,
>  							  NULL, 0);
>  		if (IS_ERR(apcs->clk))
>  			dev_err(&pdev->dev, "failed to register APCS clk\n");
> -- 
> 2.17.1
> 
