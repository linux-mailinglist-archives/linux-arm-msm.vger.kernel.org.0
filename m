Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 040E1DCBDD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 18:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502753AbfJRQtI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 12:49:08 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36095 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502750AbfJRQtH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 12:49:07 -0400
Received: by mail-pl1-f195.google.com with SMTP id j11so3128229plk.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2019 09:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=v+xlH4n34GpIF8eBLaea0CeqXTV/EF6VBM7h/r2d6pw=;
        b=De5hTX3JBN8Q7ACyfo1u7clSDEwrCzdRy5Xr7tZu8/ZEeYl2SDXKBq4FZZE8ONBzRk
         tcHVTQhRFPYHeu0d0KYiDxfy3e598jTbMP8P+/D3K0XMBANSO28aweiVBVROm35frY39
         7giwoc/mPVGMlgwGf30B9JImNpcjDajzm1X/6QzVlEX2sSg+lCxyXjSgWDkk5YPCwGp1
         uLDTfR1vR5mG8EmKPbKIg282L12cq9MLmC20Srn8H78b6g5Qejh8GAyqu4Ovg/iIOzqj
         c5GHP7ZizTZX3/pxkTgAnEddZN6iBSO0AUuRd9xspOBOTo/jeNFSCsBF+BiNmex6gBF+
         tXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=v+xlH4n34GpIF8eBLaea0CeqXTV/EF6VBM7h/r2d6pw=;
        b=lqRzOjcqK6zuewZnUXDbcOO7RR4Q22f3BOHYZ7/0G6Oh3l7E2VukIGiLydO3u9JRDh
         4hvQnhkdk3v3vjkOPHCxD7KLAOaZBGy9eGzoPP8PMVY9RMwcf3x1HmEifunKyywwz7U+
         hP/PruCsePikNhE4p1ezQrJhZL7ZMizJl5rdTFdtMkjX9msbQTqI9/hZ0mZf8E3iZ59a
         Pm4PrDKMGQEobUU11LH9RMmgnV16MktiAFBXuals6MTQVkIzFEs4aB4buvfV1NjFULkZ
         U2ufdPQuVt6bXiVhfijFPARPydGalLZ4w0+kR03SaFVkhXIc8UOMA2f5VnJKGoGcFGUI
         R5dg==
X-Gm-Message-State: APjAAAX2THneM/ND19m2pRXpfu/m1SyQvgivJG/Vpol9bZpxRmHjNjzW
        WtDfeNiu2wZsCm0ZyiVzOUX87g==
X-Google-Smtp-Source: APXvYqxcNsgzf2s/TfKOdaEkn8qjpyFxXzFsL7/C6GIu4VsQgmDpxPUNU6tXa+mQfuPC/9jtCWUQ8g==
X-Received: by 2002:a17:902:d915:: with SMTP id c21mr3169206plz.264.1571417345139;
        Fri, 18 Oct 2019 09:49:05 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v19sm7239550pff.46.2019.10.18.09.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 09:49:04 -0700 (PDT)
Date:   Fri, 18 Oct 2019 09:49:01 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-pm@vger.kernel.org, evgreen@chromium.org,
        daidavid1@codeaurora.org, vincent.guittot@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] interconnect: Add locking in icc_set_tag()
Message-ID: <20191018164901.GC1669@tuxbook-pro>
References: <20191018141750.17032-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018141750.17032-1-georgi.djakov@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 18 Oct 07:17 PDT 2019, Georgi Djakov wrote:

> We must ensure that the tag is not changed while we aggregate the
> requests. Currently the icc_set_tag() is not using any locks and this
> may cause the values to be aggregated incorrectly. Fix this by acquiring
> the icc_lock while we set the tag.
> 
> Fixes: 127ab2cc5f19 ("interconnect: Add support for path tags")
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/interconnect/core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
> index e24092558c29..4940c0741d40 100644
> --- a/drivers/interconnect/core.c
> +++ b/drivers/interconnect/core.c
> @@ -408,8 +408,12 @@ void icc_set_tag(struct icc_path *path, u32 tag)
>  	if (!path)
>  		return;
>  
> +	mutex_lock(&icc_lock);
> +
>  	for (i = 0; i < path->num_nodes; i++)
>  		path->reqs[i].tag = tag;
> +
> +	mutex_unlock(&icc_lock);
>  }
>  EXPORT_SYMBOL_GPL(icc_set_tag);
>  
