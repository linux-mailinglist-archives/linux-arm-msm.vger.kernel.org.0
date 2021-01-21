Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3E4D2FEE3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 16:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732659AbhAUPQt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 10:16:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732670AbhAUPQY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 10:16:24 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A519AC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 07:15:44 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id cq1so1841844pjb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 07:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=017f7Vgbf4r/DrOA9HquXGhPze8oTZ1XNjwKwdM5E88=;
        b=VaIowgBJWcGE2BCwMH7rHrWUuK+7cTtZvMH7ey1V2jxIbj2ccAFzvsemfMFB+WHTWN
         yOjsJ/Amkpub6ehmSgndXnoj4wwAQ81VulyCYCmbrMOjr8Ikpzq52Tu0Arme9ILGZDOl
         CXzjirbd2LNSPLPVe0eMi/2y3cOwIcza5M3HxSlg8frdNHWAAcacab9uAFKGSMJt+LkW
         qivTL0RL8kp4ha8zqMzUhuCIfA5oe8PNN5Lf34QgtsZSlUpO89HU6SGvHskOxP0NOZPf
         mjKrra5sf//CE+7dhy7Rc3zYUiTiOVpfddj0whlkWDhyzd91g0k9lak6QBA0whRpMqoQ
         9uLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=017f7Vgbf4r/DrOA9HquXGhPze8oTZ1XNjwKwdM5E88=;
        b=FkR6by4bkXi1EG1S9v5Pyy5oYsvwrBCNvQoczA5FceZB3h4abXvZ5gvdzhjuVh29zs
         sAh8kA7o3e/hj3zd/5732Gl39m4Q90pBfeFqAnDo+saNkgD2rO2WqQhRD5KGOVTr83YX
         FBZ6iSMSS4u985Gs/iWZqTpwYKNmi1+bnWqEQj2/cwMcjxRiaQ20+LQIJh1i93PUZI4b
         ueKTi6YgJTPVMn0CLRWepSwXujMYWZGaCMQR5XqhyUvgSn1HLBReJuqgPAqx9CuWHgE7
         2hF5a6PAUzAdWg+IXu4b3KiiGAownvdoWFA2KpmUju4jQXzz/L3Oq44iKhY0BNUvgXv1
         2dcA==
X-Gm-Message-State: AOAM5323T7cElhExRQb/DUYoxWRRlu2Q6QD2HEDuOWoAXpsO7ePcVwdK
        uo7lFTbyrExdSUuy0N1edqo/
X-Google-Smtp-Source: ABdhPJzEuq1urm8otko9ZdBeTT7MCwRP8x/qEhZNK+22lddnmF4W530FRmbQ652Vy0TFBzseVgPwiA==
X-Received: by 2002:a17:902:a711:b029:da:f065:1315 with SMTP id w17-20020a170902a711b02900daf0651315mr190873plq.36.1611242144088;
        Thu, 21 Jan 2021 07:15:44 -0800 (PST)
Received: from work ([103.77.37.184])
        by smtp.gmail.com with ESMTPSA id o76sm5838405pfg.164.2021.01.21.07.15.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jan 2021 07:15:43 -0800 (PST)
Date:   Thu, 21 Jan 2021 20:45:39 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH v5 9/9] bus: mhi: core: Do not clear channel context more
 than once
Message-ID: <20210121151539.GE5473@work>
References: <1610139297-36435-1-git-send-email-bbhatt@codeaurora.org>
 <1610139297-36435-10-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1610139297-36435-10-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 08, 2021 at 12:54:57PM -0800, Bhaumik Bhatt wrote:
> When clearing the channel context, calling mhi_free_coherent()
> more than once can result in kernel warnings such as "trying to
> free invalid coherent area". Prevent extra work by adding a check
> to skip calling mhi_deinit_chan_ctxt() if the client driver has
> already disabled the channels.
> 

Again, please explain where and when exactly you spotted this issue.

Thanks,
Mani

> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  drivers/bus/mhi/core/init.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 30eef19..272f350 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -1314,6 +1314,7 @@ static int mhi_driver_remove(struct device *dev)
>  
>  		if ((ch_state[dir] == MHI_CH_STATE_ENABLED ||
>  		     ch_state[dir] == MHI_CH_STATE_STOP) &&
> +		    mhi_chan->ch_state != MHI_CH_STATE_DISABLED &&
>  		    !mhi_chan->offload_ch)
>  			mhi_deinit_chan_ctxt(mhi_cntrl, mhi_chan);
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
