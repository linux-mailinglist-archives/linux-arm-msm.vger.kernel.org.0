Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF2122D6F0E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Dec 2020 05:19:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390269AbgLKERt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 23:17:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726930AbgLKERZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 23:17:25 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DAD4C0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 20:16:45 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id w3so7123923otp.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 20:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Oflm2M8W75nqLACAp+HxrhJoSVAeZq3VBL/edv7E8y0=;
        b=QqTZGLL1PvrccMMNlnezUHcAi6U5+JlJXOp2ogSAy/N6lVXcZLMPZNfk0fvz8mZKkg
         oCUsufP3ZWBh1Z1SRTi5qmhm95fTA0nIVcYfAeAvP+n4j0usSYWHn0kKGB16DPk3hS9n
         KGYvMXavWL9DN7g8EAEWJMEC4AnNUeJzEFKvZY9zr4IDsz6yVLhPecS0WuZB85IKSsNs
         MYBKm0gu0c9PhDOObH/2fH5FXrt+Kxt342s+YTs2waeIANLHD+RNLt7GuTmKaC6xBYvj
         3/GDmX+3PM9PD/bS69t8p6VTMrOhXjymHl4FkryYIVUtW/vXdi3GTAnf7O95DVuARUEM
         WZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Oflm2M8W75nqLACAp+HxrhJoSVAeZq3VBL/edv7E8y0=;
        b=Vz4DQZzu1kvHMtdaHB8jl5s7aXvpQd1Alxq8TAIB2XWs+n8g9fku148Oi4BsSMkix6
         034SymEbag0uXTbvWJ+WYOxxU21V0tO3aP+aeXf38S3LLNR5gKw759FpbkoGi5BQWmJf
         O5+USujPvLZ+qGeNCLke8xQPd6Uv0u2lq/bnGnZssOlV9dJ5JXsSlo+6Dg7PcJYXkYAq
         fiBgp4hONqhYYkT7lLFKLl5XnOV87My8NIPmEhBqr3o+czGyqj7sDMYlfgVcspsjTOpA
         VeXGxL5mfSOVvpxRxJRcNx1tMLXr6JdDKQhUEfY3yVoK5o8eRYClMKllDnZ+8CnzpWpf
         ZbWQ==
X-Gm-Message-State: AOAM533KI4c30p5etRKT5wz0gliW4LwBttf9LojGOFdSVLWR7GpTF+dP
        bvxJTv50agHsM8Ek9hNDtkb2vw==
X-Google-Smtp-Source: ABdhPJyMiX6asySH5NwXe5+2bbPXbKELLiXLzqZ7jVPvT6J548PFaeziSTFjQ6Pi1MF+SMBbgYfQuA==
X-Received: by 2002:a05:6830:2144:: with SMTP id r4mr7834919otd.180.1607660204731;
        Thu, 10 Dec 2020 20:16:44 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z14sm1593774otk.70.2020.12.10.20.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 20:16:44 -0800 (PST)
Date:   Thu, 10 Dec 2020 22:16:42 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Jassi Brar <jassisinghbrar@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mailbox: qcom-apcs-ipc: use PLATFORM_DEVID_AUTO to
 register device
Message-ID: <X9LyqlcDVsfBY1lm@builder.lan>
References: <20201013021241.5656-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013021241.5656-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 12 Oct 21:12 CDT 2020, Shawn Guo wrote:

> On MSM8916, only one qcom-apcs-msm8916-clk device is needed, as there is
> only one APCS clock.  However, on MSM8939 three APCS clocks need to be
> registered for cluster0 (little cores), cluster1 (big cores) and CCI
> (Cache Coherent Interconnect).  That said, we will need to register 3
> qcom-apcs-msm8916-clk devices.  Let's use PLATFORM_DEVID_AUTO rather
> than PLATFORM_DEVID_NONE for platform_device_register_data() call.
> Otherwise, the second APCS clock registration will fail due to duplicate
> device name.
> 
> [    0.519657] sysfs: cannot create duplicate filename '/bus/platform/devices/qcom-apcs-msm8916-clk'
> ...
> [    0.661158] qcom_apcs_ipc b111000.mailbox: failed to register APCS clk
> 

Spotted this as I was looking for another patch, hence the late reply.
But it seems this was never reviewed or merged.

What does the bigger picture look like? Do we have 3 APCS global, or
it's a single memory region that provides the 3 clocks? How does the
qcom-apcs-msm8916-clk with it's hard coded offset of 0x50 deal with
this? (Is this a single qcom-apcs-msm8939-clk that registers 3 clocks
instead? Making this patch unnecessary?)

Regards,
Bjorn

> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index 077e5c6a9ef7..3d100a004760 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -128,7 +128,7 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>  	if (apcs_data->clk_name) {
>  		apcs->clk = platform_device_register_data(&pdev->dev,
>  							  apcs_data->clk_name,
> -							  PLATFORM_DEVID_NONE,
> +							  PLATFORM_DEVID_AUTO,
>  							  NULL, 0);
>  		if (IS_ERR(apcs->clk))
>  			dev_err(&pdev->dev, "failed to register APCS clk\n");
> -- 
> 2.17.1
> 
