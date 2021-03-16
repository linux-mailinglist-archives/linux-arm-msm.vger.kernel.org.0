Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5244033CDBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Mar 2021 07:10:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232431AbhCPGGc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Mar 2021 02:06:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232023AbhCPGGb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Mar 2021 02:06:31 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0820FC06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 23:06:31 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id e2so11181051pld.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 23:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7NE5qRppEh+vuD5w5V/nMu/zyhNN/XrhmdRPI+9wiC0=;
        b=Td1jxmn39AwTl8uHORTeIBbhli4+n/1Z5mTPDDLP21XZQmZT8Em/DG2qNT3FUiAm+g
         1PDVpPS+6EYvIv76fFaVl1ty48R411f0/lOgRZodXGdizu1UmBGXJTHzDhr6M3mnmXeT
         9TJUHu34Rly/4NRUrdhSaycEvwr7K3y97y647AreHd79haF2L90gt3BoUCKagQ3Am+i7
         CxHvZY7o4+jCElrW/J2/6UouO12SgITh/kvskSd3NQd8xcRmh/z8NCZ8MODWYVD8wuul
         NZrD1sk0GW3UyvrQV5Je53FmLPhfMoId34tJ50DARsMWBtfozrZ9Bz2bd3vMDrp3+oDv
         2jKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7NE5qRppEh+vuD5w5V/nMu/zyhNN/XrhmdRPI+9wiC0=;
        b=EmZFn4yFbNdJakzOz4B50lPUt9VOr0hS8aLc2j6uHAdRt+csZ81M3e8VZRjNx5vE+n
         MELsT+znng5mBzKyc7YOMuqMMM6RUkG9h/mhZMmVoq9OFRLQ8sKtzJHDwqs/j9+XOJY/
         T7k6z/JNJUuUa2ihHoBoJq051DspcWGY/RFJ14rxBM+lfqrARmLZV3938LQulX6ooDTr
         p/GkfAGXNqdBkuKg6+2zFqaOOPnrJpDuCTbaIswhyoZG8ptT9jdHDT4OLR8H1BujkGqx
         58c1tHL5Us16ben1/SKeoxUoQR6rZCrPdPk8hL7C0bKvTF7ebHexJuafXeS0/X+yhmZp
         9b0A==
X-Gm-Message-State: AOAM530ekmfvYoxjgcpbhsVZQzMrlLJec0epmuJKilddQjCZ/Y6CVBA8
        34rwvG9wqugtZ7Qge8hWWuRP
X-Google-Smtp-Source: ABdhPJwWzCPXHKAmG/UbO02vIg/yn4CTsiE8CFyBgcqNZK1XUg4dgqJ1pkPpCRrDqxycQ5KryRV6cw==
X-Received: by 2002:a17:902:82c7:b029:e4:74ad:9450 with SMTP id u7-20020a17090282c7b02900e474ad9450mr15278280plz.58.1615874789908;
        Mon, 15 Mar 2021 23:06:29 -0700 (PDT)
Received: from thinkpad ([103.66.79.72])
        by smtp.gmail.com with ESMTPSA id i1sm14484826pfo.160.2021.03.15.23.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 23:06:29 -0700 (PDT)
Date:   Tue, 16 Mar 2021 11:36:24 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fan Wu <wufan@codeaurora.org>
Subject: Re: [PATCH v3 RESEND] bus: mhi: core: Return EAGAIN if MHI ring is
 full
Message-ID: <20210316060624.GF1798@thinkpad>
References: <1615408803-7016-1-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615408803-7016-1-git-send-email-jhugo@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 10, 2021 at 01:40:03PM -0700, Jeffrey Hugo wrote:
> From: Fan Wu <wufan@codeaurora.org>
> 
> Currently ENOMEM is returned when MHI ring is full. This error code is
> very misleading. Change to EAGAIN instead.
> 
> Signed-off-by: Fan Wu <wufan@codeaurora.org>
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 2c61dfd..a7811fb 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -1020,7 +1020,7 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
>  
>  	ret = mhi_is_ring_full(mhi_cntrl, tre_ring);
>  	if (unlikely(ret)) {
> -		ret = -ENOMEM;
> +		ret = -EAGAIN;
>  		goto exit_unlock;
>  	}
>  
> -- 
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
