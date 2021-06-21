Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9454B3AF79D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 23:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231460AbhFUVqm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 17:46:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbhFUVqm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 17:46:42 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0299C061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 14:44:26 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id w127so21540643oig.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 14:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LQSQLsbU1k/DyH0v6dn2m/gWT8qIlpUZpsIbjBaYE5w=;
        b=fxUMo5xt2LO0NwqKooOZdVzGR8tQRpnw1YNIxP2A2HY/fFYXbkIkGwCko2edjNw/Yr
         VDghk1Lm5WbS7sbrwgprcozeFZLTTN3q0/1UAd8sO9p+fCErTa8jYPzIUpsnV4Pup2c+
         B4aNeLKFYJAPUV1AMmCMxjFIohm47sHcmZYJNiGmzMZ+y1396Nd5BBV+MazYUnEdm6Ia
         aTICxFEAGYfricTEXxX2JeiAtJdWKjYYgFE+w/DYTXo2DvAsKVx7ReqeU7o+dy1hdCTG
         4wi4gDwqSSJJ+0IVbNY9UqhSQk1JmTh/WCqG9lbphUQJofnt0Cfw8mpXbwWjRM3/7FaV
         CTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LQSQLsbU1k/DyH0v6dn2m/gWT8qIlpUZpsIbjBaYE5w=;
        b=NCbyyvbVJOr1iBAwvlGMf1MrDHEj1DMk359OXi5SfAkzYB0V7iLBcNnnHWxtYd/UJU
         bXAP7aYzqRAKhTRe/HfBFcC2TV+YgNWnl4OGDwZFv1nxw+XXgjaY2iRfX4TVqK597zOK
         Lt3EBL+GBCCvMy9aD8cZckYwxzNsOUNk/SUn4tLw+I1kLJbGdgpv2FqSPszCL951VTzz
         cvIMhh7+ciRvoybTsVGSOZzFX2uRj1xjGsoE2AGcuCiU01/zdysTiFuspIGTEpXVF5lE
         lW0M+z2MS27TI4GbnSdEWUi/pQShhbYRLYm0Fc2H5VN+rTqyRLUFSio5Km1xOCkAT4hj
         eQfA==
X-Gm-Message-State: AOAM5334rP2NtvWCOuHFLeVkI7aO1jD/wnjZlUGAY5jpDZmHmILf/0cg
        M4UBVzSk9N7WrGMkkg7QJGNoMA==
X-Google-Smtp-Source: ABdhPJxvYszHkbewbuCMsZuaCb0tu00QkdTkmqmIa/tlDp41W9XCj/I1dfXxDmYlQ54lVbFkyJhDMg==
X-Received: by 2002:a54:460a:: with SMTP id p10mr421190oip.47.1624311866147;
        Mon, 21 Jun 2021 14:44:26 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v203sm3889046oib.37.2021.06.21.14.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 14:44:25 -0700 (PDT)
Date:   Mon, 21 Jun 2021 16:44:23 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] serial: qcom_geni_serial: use DT aliases according to DT
 bindings
Message-ID: <YNEINzRmyn6bBQ9n@yoga>
References: <20210621211528.1607516-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621211528.1607516-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 21 Jun 16:15 CDT 2021, Dmitry Baryshkov wrote:

> Device tree bindings do not specify "hsuart" aliases, instead all serial
> ports should use "serial" alias name as noted by Rob Herring [1].
> Make qcom_geni_serial driver use "serial" alias and fallback to "hsuart"
> if one is not found.
> 
> [1] https://lore.kernel.org/linux-arm-msm/6dd1f5cd-03c7-5945-9fa2-1c2698405110@linaro.org/
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/tty/serial/qcom_geni_serial.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 23d729ed3bf6..85f1c1f96597 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1354,7 +1354,9 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  		line = of_alias_get_id(pdev->dev.of_node, "serial");
>  	} else {
>  		drv = &qcom_geni_uart_driver;
> -		line = of_alias_get_id(pdev->dev.of_node, "hsuart");
> +		line = of_alias_get_id(pdev->dev.of_node, "serial");
> +		if (line == -ENODEV) /* compat with non-standard aliases */
> +			line = of_alias_get_id(pdev->dev.of_node, "hsuart");
>  	}
>  
>  	port = get_port_from_line(line, console);
> -- 
> 2.30.2
> 
