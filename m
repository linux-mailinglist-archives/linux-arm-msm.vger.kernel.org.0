Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEB473924C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 May 2021 04:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234265AbhE0CXq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 22:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233691AbhE0CXn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 22:23:43 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF580C061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 May 2021 19:22:09 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id v19-20020a0568301413b0290304f00e3d88so3007282otp.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 May 2021 19:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=86qidsQGnZ9orpx9wbeojyR6A9+UtIu7xVkxc0d96Vk=;
        b=mwARPOZ7nc6S9n6HNepCzaItUuiLrMd0jIJTfYY2JeqU490EFIfc/FkG6Ig8FaUX2P
         fH2xTyJnwCpwozr9Reu3nCHdt0IQK8DFbizKXY8PBGwm4j8pvVWIctZKG7BUhKPzpE8K
         c4/9thKsgVYknZhN9d7ASpBkk5in7RJ7LHKk7VpY2JniC+NyoGB215aSPZARy/nVwG1C
         Yf5AYdpCJuuql5/t7mW2SdogAmSJt7XvTsy2gfFEQzx16+CMcwwKSdfG6SdXtIOFQPVF
         9IfqqENLXkepmH2dxRKaRrorg1JmIHh1poISBi1jyESNdLwbIKxLbNUS7rWkma0bXdso
         ulwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=86qidsQGnZ9orpx9wbeojyR6A9+UtIu7xVkxc0d96Vk=;
        b=YHw+Ee6kDNugYE835hopPDx2dX+/F8oRn9+5cJn+GVioDNw+xFMDzkUyv/zBKUoBoM
         0dbnQxJAdjWXfHSCVbnBiA2rmmR5B0b0dXMeLSgsw9BWBRf0bUwUp72gPFwlYEGkdBPe
         KwzawzI3ukWDmmHogGi/elqJ+A5I0/EQfsVeHd0xst/1vll48IguVDyrvskW6F35Ofq4
         xq3InqFdLy43MWlEABXLb3cvQ86COuem2JX2aO2F928RvSV7s3IIwkFpl5HF1rFtQQuw
         A0vtnq8uuheb5kLfglDySY9XFdVKkzWbMYsNsb3PODe+/oA4Kmw5OPD44F6ctcSAU4uZ
         I/MQ==
X-Gm-Message-State: AOAM530iOXx31odullSnmOsecwu/hHDLQrKaVXvD7yckjbztlwWKPyVy
        mlsRGLEaOkpLZw/Pszadt1xWvg==
X-Google-Smtp-Source: ABdhPJy2y7gtFUPiB18SB2VzoDzRnv4JHLN0VDpfetaunvZGj+snzrAAcnXnwnTVCx3nFaeODbb8KA==
X-Received: by 2002:a05:6830:4da:: with SMTP id s26mr975876otd.77.1622082129074;
        Wed, 26 May 2021 19:22:09 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h2sm179113oop.47.2021.05.26.19.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 19:22:08 -0700 (PDT)
Date:   Wed, 26 May 2021 21:22:06 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 07/10] bus: qcom-ebi2: Fix incorrect documentation for
 '{slow,fast}_cfg'
Message-ID: <YK8CTt+ZeU7sMjAB@builder.lan>
References: <20210526081038.544942-1-lee.jones@linaro.org>
 <20210526081038.544942-8-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210526081038.544942-8-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 26 May 03:10 CDT 2021, Lee Jones wrote:

> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/bus/qcom-ebi2.c:112: warning: Function parameter or member 'slow_cfg' not described in 'cs_data'
>  drivers/bus/qcom-ebi2.c:112: warning: Function parameter or member 'fast_cfg' not described in 'cs_data'
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Thanks Lee, I've picked this up in the qcom tree.

Regards,
Bjorn

> ---
>  drivers/bus/qcom-ebi2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/qcom-ebi2.c b/drivers/bus/qcom-ebi2.c
> index 0b8f53a688b8a..663c827492223 100644
> --- a/drivers/bus/qcom-ebi2.c
> +++ b/drivers/bus/qcom-ebi2.c
> @@ -102,8 +102,8 @@
>  /**
>   * struct cs_data - struct with info on a chipselect setting
>   * @enable_mask: mask to enable the chipselect in the EBI2 config
> - * @slow_cfg0: offset to XMEMC slow CS config
> - * @fast_cfg1: offset to XMEMC fast CS config
> + * @slow_cfg: offset to XMEMC slow CS config
> + * @fast_cfg: offset to XMEMC fast CS config
>   */
>  struct cs_data {
>  	u32 enable_mask;
> -- 
> 2.31.1
> 
