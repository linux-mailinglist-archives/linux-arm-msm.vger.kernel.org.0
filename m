Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6675435A0A3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 16:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233409AbhDIOF4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 10:05:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232884AbhDIOFz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 10:05:55 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99096C061762
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Apr 2021 07:05:42 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso3866246otb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Apr 2021 07:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tkIKUPMXO+QFdcCr0Cncn7e2Yy8AxmvNLCntyfLt084=;
        b=TIG+FUkQld559rmVCY0gEmtzETrq3k+5Ylcqd7GIIfLK9Ip3FjUGkvtA+dxerhbAAO
         Jqk6Wj5bNXAgQgMbiRXNhY5I4gt79cYFiVwrypICkhrHHrSoAPgzFuU22zNzLMmYRf4A
         MLX1+KJhzuhFGRD//sPRJkRKPMmWAgpg0AKu8+C8C7kwV95gK4rLXJ5h9MabOpeQZMZ8
         hddTLBdgNNVZ7TZZSBt1mRFJjcXNVAiBTDdl/L/seez8aqgmOT0wC1ki5uBM/6B3O7dN
         oqZtTmbx8OqBo/JY4TfCrsuKdJHlksUms52o56s3F+2llimohgxTAYlBFGcaW1kDv847
         k2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tkIKUPMXO+QFdcCr0Cncn7e2Yy8AxmvNLCntyfLt084=;
        b=RzSPZmriff9Qx8OiYg1qzMfPtBK54H5NyLfqeCNm7NfZZvBbWSospVXN0Rn2krEhd7
         sBXQkKBUF5dbwumDTlZOjUwqsCkM61oXF7eLrHheiIqYP0GXAffjU4uCznW+CMPtlwa3
         op13LTk93ts9cdO/0z8wd0sUrg9hmwrALFVBEEPkAgvzMw5MCGso1P8Ic0hmJDzM5zEW
         v8zrp9T5W1+vfDggPfs5R2rhs3OIE+/bCTHsUsXCvNsq1SQq9b1cFMbCoQ7j8GMcL0xf
         ZP5lbs23etGqUMVHZRj70yN4MzTHwVyz6f8p8b/qXnlA9364rcG7vf6RnUVnvjcd/Ows
         emQQ==
X-Gm-Message-State: AOAM531dWycBuc560/KKG3+xtHabj+Hb1XjaLrIInDFcQUWI/OhJi+/5
        nJ4aDSXEozfaftt/Ot7vRi2kGA==
X-Google-Smtp-Source: ABdhPJyyOvm8nKA3I+vGRXHpCRU4PrLjeFgjhOdcnffp6Bp98FLYmIvZHl7Ompcu1vNUIEp1WMPhhA==
X-Received: by 2002:a05:6830:118f:: with SMTP id u15mr12135569otq.43.1617977141902;
        Fri, 09 Apr 2021 07:05:41 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x2sm617721ote.47.2021.04.09.07.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 07:05:41 -0700 (PDT)
Date:   Fri, 9 Apr 2021 09:05:39 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Andy Gross <agross@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-usb@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v8 6/7] usb: dwc3: qcom: Detect DWC3 DT-nodes
 using compatible string
Message-ID: <YHBfM1/ag5fR3Oyi@builder.lan>
References: <20210409113029.7144-1-Sergey.Semin@baikalelectronics.ru>
 <20210409113029.7144-7-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409113029.7144-7-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 09 Apr 06:30 CDT 2021, Serge Semin wrote:

> In accordance with the USB HCD/DRD schema all the USB controllers are
> supposed to have DT-nodes named with prefix "^usb(@.*)?". Since the
> existing DT-nodes will be renamed in a subsequent patch let's fix the DWC3
> Qcom-specific code to detect the DWC3 sub-node just by checking its
> compatible string to match the "snps,dwc3". The semantic of the code
> won't change seeing all the DWC USB3 nodes are supposed to have the
> compatible property with any of those strings set.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v7:
> - Replace "of_get_child_by_name(np, "usb") ?: of_get_child_by_name(np, "dwc3");"
>   pattern with using of_get_compatible_child() method.
> - Discard Bjorn Andersson Reviewed-by tag since the patch content
>   has been changed.
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index fcaf04483ad0..617a1be88371 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -644,7 +644,7 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
>  	struct device		*dev = &pdev->dev;
>  	int			ret;
>  
> -	dwc3_np = of_get_child_by_name(np, "dwc3");
> +	dwc3_np = of_get_compatible_child(np, "snps,dwc3");
>  	if (!dwc3_np) {
>  		dev_err(dev, "failed to find dwc3 core child\n");
>  		return -ENODEV;
> -- 
> 2.30.1
> 
