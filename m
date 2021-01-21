Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCE92FE8C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 12:30:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728202AbhAUL0c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 06:26:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730402AbhAUL0E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 06:26:04 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 144E1C061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 03:25:22 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id u4so1459840pjn.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 03:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0OcdjvobOk+GPxpivSATMN83Kpqse1ZwZ2bkbAfIi3I=;
        b=Ny0GKzB+6ASi8RoV11oi9EEWdjvtCnewhNQUTK2+73E91tXrFr7IL6BX3fDd63oA/F
         aVQ402ywrcPsofOg0lg4QSmbMtCwwhgdtx1KggjnD+gg93oarzjm8+4WrydeLdaVtDOj
         Aq0SdDdeoysffCAvxgh8eR7gjpnQkuCz8XKL9DjOB1qz/W26dwvFzv5SVvhkCLitUw9q
         39xBwqfQ7rNpcpNfHkdMXhljq2I0pdkEp4DUdjGO22lqQa+eJ0nr2owznK5wSwGMEGJS
         /loaRZEUNmogKsciBitAN092h/gm3aW6cYeNqHkX2rHifWMVuGoV7D0pjUlCFC3oJBcs
         F0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0OcdjvobOk+GPxpivSATMN83Kpqse1ZwZ2bkbAfIi3I=;
        b=X6gIoEA2Iug4Bb7fyd/cmtMe65BlUSlroEw9XpaQtIne7Q4pP3f9+l8f/qs0k+669B
         ua/WrZM4yc1fCt6O+DZM/sa88aqFbZLFjWh/e12Um0JUCCiaPsoDMnoDqjNujV7pBP25
         1K1GzzJCNSVnOCKToKXe0zflITtC6wheQlBW1TE+VlfeH1nuLK3YDiJbkq/gUmrgbAP7
         MT7xzeVDb7xZhGay3Hvvo8E+EhzOaBKQ8sawcWN8WJsGJxJt4QzLOIG1v7f+QnVHuqoe
         0woHwDPOIAcktebiE3+hll8kn2+beDlN6nC0CqVFwm3yF9Uq7F9/80+7IH4ThBaZAXi7
         dh4g==
X-Gm-Message-State: AOAM531MFOciFtWNrCD/vijwF+PhQ41YK8E6tusRR300N6llQcpx/ZiX
        AJEiKVltft1RHp9y4FTKt4Hc
X-Google-Smtp-Source: ABdhPJwTqLONGyllam1rWz9UROqUdgwC5myu9UQulmmXu6Vjawb5lfxDJ7kjTLbZ+naXu7NgnqNZMg==
X-Received: by 2002:a17:90a:f2d2:: with SMTP id gt18mr11402525pjb.102.1611228321558;
        Thu, 21 Jan 2021 03:25:21 -0800 (PST)
Received: from thinkpad ([2409:4072:6182:23c4:4d5:e6d9:fc7e:c8e2])
        by smtp.gmail.com with ESMTPSA id h3sm5171463pgm.67.2021.01.21.03.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 03:25:20 -0800 (PST)
Date:   Thu, 21 Jan 2021 16:55:15 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH v5 1/9] bus: mhi: core: Allow sending the STOP channel
 command
Message-ID: <20210121112515.GE30041@thinkpad>
References: <1610139297-36435-1-git-send-email-bbhatt@codeaurora.org>
 <1610139297-36435-2-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1610139297-36435-2-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 08, 2021 at 12:54:49PM -0800, Bhaumik Bhatt wrote:
> Add support to allow sending the STOP channel command. If a
> client driver would like to STOP a channel and have the device
> retain the channel context instead of issuing a RESET to it and
> clearing the context, this would provide support for it after
> the ability to send this command is exposed to clients.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/main.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 8576b0f..c22d7df 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -1224,6 +1224,11 @@ int mhi_send_cmd(struct mhi_controller *mhi_cntrl,
>  		cmd_tre->dword[0] = MHI_TRE_CMD_RESET_DWORD0;
>  		cmd_tre->dword[1] = MHI_TRE_CMD_RESET_DWORD1(chan);
>  		break;
> +	case MHI_CMD_STOP_CHAN:
> +		cmd_tre->ptr = MHI_TRE_CMD_STOP_PTR;
> +		cmd_tre->dword[0] = MHI_TRE_CMD_STOP_DWORD0;
> +		cmd_tre->dword[1] = MHI_TRE_CMD_STOP_DWORD1(chan);
> +		break;
>  	case MHI_CMD_START_CHAN:
>  		cmd_tre->ptr = MHI_TRE_CMD_START_PTR;
>  		cmd_tre->dword[0] = MHI_TRE_CMD_START_DWORD0;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
