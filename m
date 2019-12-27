Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8620A12B21F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2019 07:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbfL0GwI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Dec 2019 01:52:08 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39950 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbfL0GwI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Dec 2019 01:52:08 -0500
Received: by mail-pg1-f195.google.com with SMTP id k25so14007567pgt.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2019 22:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=h10PX8DJZLkPTns7u+7EuYORpZ6ZCEapdli54+ecjxE=;
        b=IlEGowUjJh+UEXHDSpv9xzRlUtyRJqnj18TeES1zEeZ0Ufgd4cSTU3pujZA8pWrJqY
         uUK//86SVklBs+lGleyGtdF9p4m9bCd5BUNNyn6E4Kn5JpaK9Dnc3n6Gh1fLrN5JBU8L
         6N/VQH+jlyExVwxkxI5uTStVd1CPYH6Kbr9v0SHtP0n2vZW/sWlbG8AT/xlEpQJUTrQR
         tcUX6v60Kwfqu4nw3g8/qFeHbc0xJ8w74d040mqbnZHu1/h0B26yq6IARvcHcwyfS1xe
         ogrA4NkzcVMA7rgdR5I51p7OoqMAeForma67L7imtjVH73lq8vvk9ma5eAMoEPQATA0J
         ZJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=h10PX8DJZLkPTns7u+7EuYORpZ6ZCEapdli54+ecjxE=;
        b=Rg160DzEUQfShuGKmpllzwOtBffSvvd+EQcP5dRJWT/NRxzp76lXmny+9n42VtTWI4
         pzAbkAfGWsshfzHN5VtjwBJwNsZJbrBqY1q3J9/JSza/kTwTAV0gRxaOy8VBAetnQNK+
         Bj8tawotVSiSlsQlW6HZQEGWglDif6W+DrYuFxdC8UTe5vHnVrYWPYJFzl8BwnzeaZF7
         geD9mnQYtoFZYTwzEN4F+Fldgry6+RggcAIGaJenaLR3lKBmulCaLkbvgEsuG0ct4CEM
         nTOiq42upjqfn5IwZGs2zof1bAPhr1ns4KLYyGIz1xAkXCr2oyag30H87hast3SIAuLi
         IgfQ==
X-Gm-Message-State: APjAAAUkworcfs8EHm/eHGJqBZzqrpWwNgVtYR4kop2c9qF6Zw6phwBL
        zVNaxSR8z2kbBAhGXLZ/yZTwkA==
X-Google-Smtp-Source: APXvYqyNUvZALjln+pn3J5Nvw3y9HrAHIAb9GQ1w9VWf2pZ2BHcUsqmXIr+KGgm8fNiWIfbsDxWyDg==
X-Received: by 2002:a63:289:: with SMTP id 131mr53477901pgc.149.1577429527727;
        Thu, 26 Dec 2019 22:52:07 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d1sm13099541pjx.6.2019.12.26.22.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2019 22:52:07 -0800 (PST)
Date:   Thu, 26 Dec 2019 22:51:53 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Niklas Cassel <nks@flawful.org>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/5] power: avs: qcom-cpr: make sure that regmap is
 available
Message-ID: <20191227065153.GL1908628@ripper>
References: <20191223141934.19837-1-nks@flawful.org>
 <20191223141934.19837-4-nks@flawful.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191223141934.19837-4-nks@flawful.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 23 Dec 06:19 PST 2019, Niklas Cassel wrote:

> drivers/power/avs/qcom-cpr.c:402:4:
> error: implicit declaration of function ‘regmap_multi_reg_write’
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Niklas Cassel <nks@flawful.org>
> ---
>  drivers/power/avs/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/power/avs/Kconfig b/drivers/power/avs/Kconfig
> index c21882908a66..b8fe166cd0d9 100644
> --- a/drivers/power/avs/Kconfig
> +++ b/drivers/power/avs/Kconfig
> @@ -16,6 +16,7 @@ config QCOM_CPR
>  	tristate "QCOM Core Power Reduction (CPR) support"
>  	depends on POWER_AVS
>  	select PM_OPP
> +	select REGMAP
>  	help
>  	  Say Y here to enable support for the CPR hardware found on Qualcomm
>  	  SoCs like QCS404.
> -- 
> 2.24.1
> 
