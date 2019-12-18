Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6D0C123F90
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 07:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725799AbfLRG3K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 01:29:10 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37905 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfLRG3K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 01:29:10 -0500
Received: by mail-pl1-f194.google.com with SMTP id f20so515347plj.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2019 22:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/by+L4g/+C5m3XNVzRHVEspKs3Iozq+e4I5ji8Ems7w=;
        b=NZAI8qdSrROIDeedHP0f6VVEZhw/u+x4uFTFmttJFMK6ow7gK5bpE6AO9mphl3E9rm
         2kDq+Yqq2a8CpeQUyqfyBAUpKX0S6Bqo5hvhZbeTk2zfMm8zpFBtL75QzPcu6p1I7hJi
         7GIB05mS4oijekmOe65NmWwXhKJLWDoeVzO2dVmoBu/EjhhbRYgtpY6xPTwUlPJUt904
         tnazHfiE0Gq+aS2qWRm15JhSZkOKHNB262oW7+GZ+ZmEExd8tuZSog4D+TNefjUO5mZE
         2tVrv7eG1vCGBP+CrC8sbT+ZT3LDeSc4jJmjZ7O91FVLWNelWS4Dmwp90mrgSHCQR52c
         5Piw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/by+L4g/+C5m3XNVzRHVEspKs3Iozq+e4I5ji8Ems7w=;
        b=eKuEctKv6otdxkvCNb5dJT6XSxKleoJ8MVdH/c4WkUBKLOumEFOPgb8NYeT4aeWwQM
         w0uw6+8KX6sR3JQl3eLfNRf5E1haq1WbTG8FJpqOlVSvshlfefwrvJJ/mMuzdgF/A6Dl
         B5+ieSS/7yngvCDy5dobv/lZpE/Vc+q3bheaonkqIWCZmmv9f0I6zhpC67PVRAoaX6Em
         lzS2+51QJeC4v73+3gKbQCWIImwKzUJq56XQ0DSZmokX5UhR8ZfvnZETh6gu+2McjaeL
         iWNiz+LErBAtiF2agm49g/ZIX00dS9ibULy/JKeYz+ayuINOx7BWLWBDXWZh9/2FJl3P
         yA5A==
X-Gm-Message-State: APjAAAUDMjy0kYHz6j8ANXubDikOT5qXkSUh3sa3LwTeBltXAh43z/z5
        WaAm8DhCtd6c87j+n8oHLgoQlw==
X-Google-Smtp-Source: APXvYqwLKDrc5vobgiWa/NXlSjrVAe3wW93XDA1LwPdFEReg5if6dlIWOxy2NecF8VtLF2CIhxEFTA==
X-Received: by 2002:a17:90a:a416:: with SMTP id y22mr878859pjp.114.1576650549590;
        Tue, 17 Dec 2019 22:29:09 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h9sm1328913pfo.139.2019.12.17.22.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 22:29:08 -0800 (PST)
Date:   Tue, 17 Dec 2019 22:29:06 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH] phy: qualcomm: Adjust indentation in read_poll_timeout
Message-ID: <20191218062906.GB3755841@builder>
References: <20191218013637.29123-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191218013637.29123-1-natechancellor@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 17 Dec 17:36 PST 2019, Nathan Chancellor wrote:

> Clang warns:
> 
> ../drivers/phy/qualcomm/phy-qcom-apq8064-sata.c:83:4: warning:
> misleading indentation; statement is not part of the previous 'if'
> [-Wmisleading-indentation]
>                  usleep_range(DELAY_INTERVAL_US, DELAY_INTERVAL_US + 50);
>                  ^
> ../drivers/phy/qualcomm/phy-qcom-apq8064-sata.c:80:3: note: previous
> statement is here
>                 if (readl_relaxed(addr) & mask)
>                 ^
> 1 warning generated.
> 
> This warning occurs because there is a space after the tab on this line.
> Remove it so that the indentation is consistent with the Linux kernel
> coding style and clang no longer warns.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Fixes: 1de990d8a169 ("phy: qcom: Add driver for QCOM APQ8064 SATA PHY")
> Link: https://github.com/ClangBuiltLinux/linux/issues/816
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-apq8064-sata.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
> index 42bc5150dd92..febe0aef68d4 100644
> --- a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
> +++ b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
> @@ -80,7 +80,7 @@ static int read_poll_timeout(void __iomem *addr, u32 mask)
>  		if (readl_relaxed(addr) & mask)
>  			return 0;
>  
> -		 usleep_range(DELAY_INTERVAL_US, DELAY_INTERVAL_US + 50);
> +		usleep_range(DELAY_INTERVAL_US, DELAY_INTERVAL_US + 50);
>  	} while (!time_after(jiffies, timeout));
>  
>  	return (readl_relaxed(addr) & mask) ? 0 : -ETIMEDOUT;
> -- 
> 2.24.1
> 
