Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37CE8230209
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 07:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbgG1Fsi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 01:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbgG1Fsh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 01:48:37 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64A60C061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 22:48:36 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t6so9325143plo.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 22:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nwCaKQb7A1eifXGGV7a5eCD4TFiRpHJ0WWrvyibHWGo=;
        b=ThWzK6aItUQJQGmMwE/9XgdMnE3B8hgl9stdZ4ANGGr+GXR4MVlckDEryvdOb2X1g5
         rL2UJp+8963+tjSiFZq9HYa8ojAwcGwamA3DkAiZ9W/7V+DMV4R7xwxRmKJvs4tuMYCI
         WPYIW9LGaYCxAGDtPNK7WVsr+SW2pcW1yddoo8tzfOBh3xUA5/gJG/7GFX5vv43Wt1nD
         BRtQPGuzmen4qMkYU1kaCKyBVW1cy+FgHMrISIsB2NpLAxRJ5iu2T1q+qKwhvD2jsFkP
         GlE1N03xv0RYfJa3HBjoIysGmu2qHV/x8w2bKOVxTNOyCaTWTZsUsU4UOr+4BSI6Fd3Z
         4JCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nwCaKQb7A1eifXGGV7a5eCD4TFiRpHJ0WWrvyibHWGo=;
        b=RSCTWHXKG9RMe1FeDR+h3cHCRYP5nrmSjBBKtmCwc/mHdS9ZWvw0cxLFFVN5qdeAJP
         CRX6LdlG/ZhQmwXFoHflfaAkUf+htqEd9qV7s14zh0eu6KkOoICEakWekRZcqsXEe0Or
         UX2dKCgaOjqWOjESQyCNfsyiiqrXWmcT07C6ksq43eY3fARkoc2r56+5T2Q8X3FQ15Z6
         wPjhMkJ+NM9MeLGOznZU+542fOywWPptpmoqf5FyzC4T2n4Sckp9ERb4XijloN611K9D
         ZFN1IUUiLBGC8UpeCmjKVIW/Q7Ce5XcHZsMdTeM2c/44VvuxujlOml6on/ma9gsKR3FB
         Hypw==
X-Gm-Message-State: AOAM532PV8pRoBTPK0HcLvfRRSRKcetV0WVHYMEoDe2fgnW5lKGGFafq
        F3+QWSynqkcb06rNQvoMe6mS+A==
X-Google-Smtp-Source: ABdhPJyagl/2lErbHeLHksDS/3HV3/viNDfs3CKy+8bqQ7BW6jnH4d6jKx8IhtFZ7KIx602H7iB0jw==
X-Received: by 2002:a17:90b:3685:: with SMTP id mj5mr2738571pjb.123.1595915315827;
        Mon, 27 Jul 2020 22:48:35 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p127sm16543663pfb.17.2020.07.27.22.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 22:48:35 -0700 (PDT)
Date:   Mon, 27 Jul 2020 22:45:03 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/3] remoteproc: qcom_q6v5_mss: Validate MBA firmware
 size before load
Message-ID: <20200728054503.GA349841@builder.lan>
References: <20200722201047.12975-1-sibis@codeaurora.org>
 <20200722201047.12975-2-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722201047.12975-2-sibis@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 22 Jul 13:10 PDT 2020, Sibi Sankar wrote:

> The following mem abort is observed when the mba firmware size exceeds
> the allocated mba region. MBA firmware size is restricted to a maximum
> size of 1M and remaining memory region is used by modem debug policy
> firmware when available. Hence verify whether the MBA firmware size lies
> within the allocated memory region and is not greater than 1M before
> loading.
> 
> Err Logs:
> Unable to handle kernel paging request at virtual address
> Mem abort info:
> ...
> Call trace:
>   __memcpy+0x110/0x180
>   rproc_start+0x40/0x218
>   rproc_boot+0x5b4/0x608
>   state_store+0x54/0xf8
>   dev_attr_store+0x44/0x60
>   sysfs_kf_write+0x58/0x80
>   kernfs_fop_write+0x140/0x230
>   vfs_write+0xc4/0x208
>   ksys_write+0x74/0xf8
>   __arm64_sys_write+0x24/0x30
> ...
> 
> Fixes: 051fb70fd4ea4 ("remoteproc: qcom: Driver for the self-authenticating Hexagon v5")
> Cc: stable@vger.kernel.org

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 718acebae777f..4e72c9e30426c 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -412,6 +412,12 @@ static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct q6v5 *qproc = rproc->priv;
>  
> +	/* MBA is restricted to a maximum size of 1M */
> +	if (fw->size > qproc->mba_size || fw->size > SZ_1M) {
> +		dev_err(qproc->dev, "MBA firmware load failed\n");

I'll change this to "MBA firmware exceeds size limit\n". Please let me
know if you object.

Regards,
Bjorn

> +		return -EINVAL;
> +	}
> +
>  	memcpy(qproc->mba_region, fw->data, fw->size);
>  
>  	return 0;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
