Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60B862B824E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Nov 2020 17:54:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727933AbgKRQuM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Nov 2020 11:50:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727926AbgKRQuL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Nov 2020 11:50:11 -0500
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF46C061A48
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2020 08:50:10 -0800 (PST)
Received: by mail-oo1-xc41.google.com with SMTP id l20so591820oot.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2020 08:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=URQNgyNxIHm+Nf/Hqg7Nkrw+oIop3mCsDqykmWHiPgE=;
        b=P6gdbcboxT0pSx5moV/y7QRhQdx2rrNm5RZwDp6W140s0AVfhrvYve+BBzSe3CgJ00
         AS/J+She41UTSheICK4rQ1vpVNpfc8Oq5daP284Q3qcv6xunrJEEq9xnGaN/ZluzIahD
         70Sch3yBFzePEXofd97lJj36zkjq9uKFLFOEsXg5XIKQ1ViPZFpiz3P7qCPweZhF9RG/
         eCl7OPp6j7+PW/lu4zzXkkTnosF92Sw5YWfjYRsdNsBS5nBwP1RtunNW5ZZiNrs9osjq
         u/tPDZGzQm5Hv4bGZmv/20LiBCoYzmHcBwZ9eIf8983qPjdiVRhAWpR7Ur6zbd9ZvySd
         ysoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=URQNgyNxIHm+Nf/Hqg7Nkrw+oIop3mCsDqykmWHiPgE=;
        b=HT7f9SQGBrzGtIapqdSEjv7FM0GlNbCdwDOBeutCKyyYqlhHA+Y3n5brTP4vBHjuoW
         XCHeVq0CYXNev54/ygQqNoTqCn8nPHfU7YXE8T4onuu6wkQRatS5mwUadFz7c4vHwhoB
         0P43sPRQhi7SQ2zVOeDkPjrhzIUASKtZR+n+xgY6LurRO+Baqznvy/31K4FblBRIZpvq
         XTUkn1v71PdabnjWmG6/Nv87Nt5cSKuuFjjttVEd5Nn1Jl6+pob1dlWsu0+nkldMy6Z/
         cHu6Z1ZBwzuxd1LOB+V0Xm/6CwsUBIjxQOzHtCAjHnp/luYhtwYqnZzMcXerjoZDShVQ
         Cprw==
X-Gm-Message-State: AOAM532UaFec6ff7U5HrrxeamJENnFSm8SfWR/38xuT0foJmxhy5ArPq
        b4jiiXtg/efRPU0pkv0Yx0Zj9Q==
X-Google-Smtp-Source: ABdhPJxki4cZFgEf6A0WK9Hze8CJ+1QEdKRx5vi7OqXv2q274o6Dpqb031Rjo/CXDFV0u/MWI8xRMQ==
X-Received: by 2002:a4a:d81a:: with SMTP id f26mr7135860oov.59.1605718209627;
        Wed, 18 Nov 2020 08:50:09 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w21sm6374700ooj.32.2020.11.18.08.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 08:50:08 -0800 (PST)
Date:   Wed, 18 Nov 2020 10:50:07 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 4/4] remoteproc: qcom: Add minidump id for sm8150 modem
Message-ID: <20201118165007.GD9177@builder.lan>
References: <1604395160-12443-1-git-send-email-sidgup@codeaurora.org>
 <1604395160-12443-5-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604395160-12443-5-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 03 Nov 03:19 CST 2020, Siddharth Gupta wrote:

> Add minidump id for modem in sm8150 chipset so that the regions to be
> included in the coredump generated upon a crash is based on the minidump
> tables in SMEM instead of those in the ELF header.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 349f725..23f4532 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -707,6 +707,7 @@ static const struct adsp_data mpss_resource_init = {
>  	.crash_reason_smem = 421,
>  	.firmware_name = "modem.mdt",
>  	.pas_id = 4,
> +	.minidump_id = 3,
>  	.has_aggre2_clk = false,
>  	.auto_boot = false,
>  	.active_pd_names = (char*[]){
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
