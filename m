Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D49F390669
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 18:17:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbhEYQSl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 12:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbhEYQSk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 12:18:40 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCA6DC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 09:17:10 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id i8-20020a4aa1080000b0290201edd785e7so7293645ool.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 09:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=e7vC82MOW0NW82MNwotSo5AjRB6ZfFedgPehiglFXVE=;
        b=VV2g3jXLjNwfucKdlWfV4nRFS80jeb3aFXhtJ2AzqlGmxZUsqbU05G5W7KCmBkqpDL
         ahNknuP6P5g901L0942qdMcdIDfgQ4hL8PM+EJozRybINL/+fsZvXlynDh6hIGygN1qk
         j12wrvt5JAfE3LewTyCnlQnDbBB2LAEcWWM0ZBmKG6pVaw84RyyS/qivGg1w8/GgwDyd
         ws7Lpm1aUvf1tj/WNbeeVVERuF7aGng6D/nZ6rA/+l/6W4jz4QijyVFnSQizjFg9XKPF
         /fRjpS86hFl/O0cpdm7MZFqZUuXfPIQtSmy7541HMMP1ljykUerNe76XybNKykIz/M04
         hNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e7vC82MOW0NW82MNwotSo5AjRB6ZfFedgPehiglFXVE=;
        b=IqrjnhhWWs8fJbslzg/LWtj50TNoGn6wcy0UlrD52l30r9KFId6ZKxY6GOCJ3KFiJs
         LIZ7Rnbdn/BFzn6laLpTtqujXm+qToNoufH0+WnQ0SsUMks9V2+fRkc27YbqLPzsEp2x
         wFuzGqO5MN8RBTlvMUm0SLjcZiEGYKQ5r2tfyVMh06711SaIzPZjgRuQKaEDGnK0kqKO
         c52S/XuVV0tWoHoVP2RIV0ko9fuXNyvzaIyKwC2mX3yAlDPTsdiNBFZMmQ/ad/VDiw7J
         y+GT4OvLaofNaHaOdYWD5nNPuENtmUon3ZH8ios7ghEEY62QOmgoYtfiMEPYopiFDSx5
         yxSw==
X-Gm-Message-State: AOAM5319qIAQzSxLfRdSjMz9omQiOyaE/3YbxwLkErGs52Fqtd30FiV9
        +p9VSiIXK8pCKoxte13/X/t2DA==
X-Google-Smtp-Source: ABdhPJx5dyMTI6IS+EXOFg/tcrLCy9sK0qfNIS9Yu/9171h7psVC/ReR2mUWfvwOujBWOmDkWTb76A==
X-Received: by 2002:a05:6820:611:: with SMTP id e17mr23313335oow.0.1621959430140;
        Tue, 25 May 2021 09:17:10 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s187sm3373925oig.6.2021.05.25.09.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 09:17:09 -0700 (PDT)
Date:   Tue, 25 May 2021 11:17:07 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shaokun Zhang <zhangshaokun@hisilicon.com>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: remove the repeated declaration
Message-ID: <YK0jA9tV/2GUlXQj@builder.lan>
References: <1621945327-10871-1-git-send-email-zhangshaokun@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621945327-10871-1-git-send-email-zhangshaokun@hisilicon.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 25 May 07:22 CDT 2021, Shaokun Zhang wrote:

> Function 'dp_catalog_audio_enable' is declared twice, remove the
> repeated declaration.
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 176a9020a520..f12468dcbb56 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -124,7 +124,6 @@ void dp_catalog_audio_get_header(struct dp_catalog *catalog);
>  void dp_catalog_audio_set_header(struct dp_catalog *catalog);
>  void dp_catalog_audio_config_acr(struct dp_catalog *catalog);
>  void dp_catalog_audio_enable(struct dp_catalog *catalog);
> -void dp_catalog_audio_enable(struct dp_catalog *catalog);
>  void dp_catalog_audio_config_sdp(struct dp_catalog *catalog);
>  void dp_catalog_audio_init(struct dp_catalog *catalog);
>  void dp_catalog_audio_sfe_level(struct dp_catalog *catalog);
> -- 
> 2.7.4
> 
