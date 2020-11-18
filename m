Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 036F82B7538
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Nov 2020 05:06:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727402AbgKREEb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Nov 2020 23:04:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbgKREEb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Nov 2020 23:04:31 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D494FC061A53
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 20:04:30 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id t143so718763oif.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 20:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=R94wEpUfL2NKtVDFH5Y2aFUGBitl6ab36JrcLKkrNH0=;
        b=jfijKa+cC77mqgTmoTpVsOXjnBOQp5dGy8CZcjgV4tvq0mKLrejs2+SJhZ8G2I1/cJ
         WFi4egXhek8qbqDuCA0tyuuMomO5lrPdBNriDA8HRFuefDkJRrWl/U1r2EHFtl6zKjtd
         38xrSfX2gYAJiLG/n+jUCPTe3YHZAKvNNV15SMmnC4+RpoKUPrkLV2ywtkzsdHDhYbb+
         lCEjRlK1qyQEWd70WkIfgNYUx6GyXC3emUuGxEWAnxcY5ruYQ++ZEq9hOF5hfAY/dQFc
         OdjfndVVrm6AwdlP0LF12Yzt9k9XeFt5prI3+q+U/WIYNhhUk274QHHxVRWZ4qJJcWFv
         2tsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R94wEpUfL2NKtVDFH5Y2aFUGBitl6ab36JrcLKkrNH0=;
        b=iHJMwn17IfSNRwDg/0rSmgkJfW3MbAim/eZkpmH8u7CpNQKww5UnMpFYvkrABfYGsk
         gAe485wVDg2M1nhMmTix0JJztU/iW1CmS0ZBozP8cZwLGN0eSCy5oGVXUg/JdEORi/5X
         0lleAs5ugXxF7sSYS0j0XEtQwO4QgojA7vAKdzMGDgGbWdDX00ZfH0Ee1pUmYmhXRCOt
         FQgUAR2salIfHpGs1DL39EDr9b61nA7m3kBvEuj0ibaU0YauOIUE3joHaOQ3jGYjkFOK
         jDlgC8mqbP4r8oQ5DVWvGF1JspgDBQQ5d/ItNW+cqYJ+L1gIjvRSyT1H6hYSuB12KuM6
         odrw==
X-Gm-Message-State: AOAM530zlxcl39cApaoHNKhVAlnY7MOnYau3OJS1HCxtNyvYUKjOsdwE
        Z1YP8FWM4KqV+qG9b+XV2Ahj2w==
X-Google-Smtp-Source: ABdhPJy6qRvJFmxOZYVT1YtwoL7wjfYsi8dQojG+8Ue46HN3ul+5ZYwCzblv9PCFOLFpmKwbJxZbXw==
X-Received: by 2002:aca:f083:: with SMTP id o125mr1591204oih.164.1605672270137;
        Tue, 17 Nov 2020 20:04:30 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q3sm7248653oot.33.2020.11.17.20.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 20:04:29 -0800 (PST)
Date:   Tue, 17 Nov 2020 22:04:27 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     agross@kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, robh+dt@kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/6] drivers:crypto:qce: Fix SHA result buffer corruption
 issues.
Message-ID: <20201118040427.GD8532@builder.lan>
References: <20201117134714.3456446-1-thara.gopinath@linaro.org>
 <20201117134714.3456446-5-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117134714.3456446-5-thara.gopinath@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 17 Nov 07:47 CST 2020, Thara Gopinath wrote:

> Partial hash was being copied into the final result buffer without the
> entire message block processed. Depending on how the end user processes
> this result buffer, errors vary from result buffer corruption to result
> buffer poisoing. Fix this issue by ensuring that only the final hash value
> is copied into the result buffer.
> 

Looks reasonable to me

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> ---
>  drivers/crypto/qce/sha.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
> index 87be96a0b0bb..61c418c12345 100644
> --- a/drivers/crypto/qce/sha.c
> +++ b/drivers/crypto/qce/sha.c
> @@ -48,7 +48,7 @@ static void qce_ahash_done(void *data)
>  	dma_unmap_sg(qce->dev, &rctx->result_sg, 1, DMA_FROM_DEVICE);
>  
>  	memcpy(rctx->digest, result->auth_iv, digestsize);
> -	if (req->result)
> +	if (req->result && rctx->last_blk)
>  		memcpy(req->result, result->auth_iv, digestsize);
>  
>  	rctx->byte_count[0] = cpu_to_be32(result->auth_byte_count[0]);
> -- 
> 2.25.1
> 
