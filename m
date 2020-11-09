Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD812AB7A6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 13:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729302AbgKIMAX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 07:00:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbgKIMAW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 07:00:22 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B2B2C0613D3
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2020 04:00:21 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id cp9so1186575plb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2020 04:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nCL53S41RiNDoD/SUkXrKkhzPSJiipl3oRL8zmZJVxo=;
        b=UYfuwoDIdHw3vFyhB8ob9PaByQvIVhMzhP2tw//afjvDKJh14QUg+ltkmCZHWUYfc9
         f+Q+LpTimttAg9gZLcBFy8yvHXiTHN7F2ZiKOox3JrNOZy9tgButmpglJvm9YLvr5W/Y
         D9xzwhq8WBIuOA8zxi8Hhgs+ckOk9ngVpizCvxrtk8TLy0IkeCpIyqkU+LrEg1NImR7y
         lAn+KMtDdGiGYY+fWEZxoa+Jksb3kwFuDCLMke3wf+iBdLHvZx10f/NramjivOgHbSO0
         dkA1aTrxzL2pReZVCPc6s0tJQX+NmNHUEJ1qJ58pOqt32QMCg/xjDu56LgaCCTrMzoen
         /aWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nCL53S41RiNDoD/SUkXrKkhzPSJiipl3oRL8zmZJVxo=;
        b=czy9kRlftm3b24Bw19KRRBMbbJvLlWeMKVE1M1SleGip6AX+WqIhtkQDoLCuS/38C0
         98RAcAkbXlE63mAMnm1nS5k7TSY0R6qZiJCK3H21MNcGE6q9ewoDn26YtHu+OZGkhDFa
         DAXkF3w2m8BGWloYeflIsHXS5QdPcz2EKQSI0pR8VvWhI8TcJHStW740DKQAthpy4Zy4
         z/aWL1ge+mdUNa+VizqOEJxyHg+FhiR9lKwGhdjLp4bTOhe5lbWtxJwc9BdWFPNiRP7q
         Vtz4JJgx6AZd34CUySjw+xbPsEbOqChLYsrvQ9NSHF+6f5uDtWtpxqSV6SWHA7x6gHzb
         BnJw==
X-Gm-Message-State: AOAM532IYYVXkX3Nks8WgzyY6fME6n2NO6KWzzV3mSmL0avCjxF7VH4q
        WVuM83UwIBGI7ee5zcU+J/2/
X-Google-Smtp-Source: ABdhPJywqkmbWbffoziLh1OZi7ze5FZwCmcPbD/Oam3tLhCVZVWLCgus/KdI9+/Nq0QJtduoc3/zMQ==
X-Received: by 2002:a17:902:7408:b029:d6:8208:bc7 with SMTP id g8-20020a1709027408b02900d682080bc7mr12170659pll.82.1604923220504;
        Mon, 09 Nov 2020 04:00:20 -0800 (PST)
Received: from work ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id b67sm11387103pfa.151.2020.11.09.04.00.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 04:00:19 -0800 (PST)
Date:   Mon, 9 Nov 2020 17:30:14 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: core: fix potential operator-precedence with
 BHI macros
Message-ID: <20201109120014.GE24289@work>
References: <1603225785-21368-1-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603225785-21368-1-git-send-email-jhugo@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 20, 2020 at 02:29:45PM -0600, Jeffrey Hugo wrote:
> The BHI_MSMHWID and BHI_OEMPKHASH macros take a value 'n' which is
> a BHI register index. If 'n' is an expression rather than a simple
> value, there can be an operator precedence issue which can result
> in the incorrect calculation of the register offset. Adding
> parentheses around the macro parameter can prevent such issues.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/internal.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index 7989269..78e4e84 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -153,8 +153,8 @@ extern struct bus_type mhi_bus_type;
>  #define BHI_SERIALNU (0x40)
>  #define BHI_SBLANTIROLLVER (0x44)
>  #define BHI_NUMSEG (0x48)
> -#define BHI_MSMHWID(n) (0x4C + (0x4 * n))
> -#define BHI_OEMPKHASH(n) (0x64 + (0x4 * n))
> +#define BHI_MSMHWID(n) (0x4C + (0x4 * (n)))
> +#define BHI_OEMPKHASH(n) (0x64 + (0x4 * (n)))
>  #define BHI_RSVD5 (0xC4)
>  #define BHI_STATUS_MASK (0xC0000000)
>  #define BHI_STATUS_SHIFT (30)
> -- 
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
