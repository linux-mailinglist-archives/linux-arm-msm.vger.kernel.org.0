Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE73D47C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2019 20:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbfJKSjn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 14:39:43 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:32889 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728472AbfJKSjn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 14:39:43 -0400
Received: by mail-pf1-f195.google.com with SMTP id q10so6598150pfl.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2019 11:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lwWZ1BSEiAs6avMUbGhrgTIvNodesvQRhyRgPzlrHsQ=;
        b=OGEl8+OXDAIs8vJC1UB0yr5NA4I9xd/0/Uc6k8efasx0S90iUqOOdUJdjiaZTNQpOk
         Z4otOBVHj6ZB05PknrEdkOUDQxIcBdkg8SmYUgX2VLIZRoQcLurAoIfkExCBhrLpQfFP
         F/Jzv71PvpMamtM0I7nx5+Cnx7DYmvotb5y9Lr4Byh4tw8+EboCI20DKJ+S/qLoD/ecM
         OTpcvvP592CAKBkzScEvOnTQ80jr7eHK4NMyGOv4bcrzWrfnqTvoxxBnWZxGLYFknbOD
         BM+R72yblf+mENBnsN0hapKq7yaOlVO4gE5HRSmvLWN2wdKwot/kz3MAYteXNZyn6/MR
         djVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lwWZ1BSEiAs6avMUbGhrgTIvNodesvQRhyRgPzlrHsQ=;
        b=Sg4a8SW2CaFaaLMU3QG6kzGsP6pTDvhUb5aparuDDjAPmLvLeuo60DP5aD4UiteKAu
         GIZCx6HvR5GoT7Ec5oPp0ijoKkG0rMrEWMPwZy9Tp7FQClOXWzUsU+V3e6SR8furmHkl
         sCCIzyXBMMvlHzxv7skiQ/h4JF8RcV5jbMBQrNTuIiwjtdGhUHdH28Sj4ktHXIMeD1ko
         P6hAZ/eLmlCC2fsgLr3BtVBTkEICrclZuR22spoPjU/gyW7EzyT6kFuiBuja3kXd1lXE
         teISU4U2fTWCVkR9CEca5WUGHAyCzQ7tD03hYlduj2bNkgjOrDk6QzrgWwS+XJjMyQpN
         UkYg==
X-Gm-Message-State: APjAAAUKOch4949Eh62FYj0nfU+YcpTUNF6BdbuE4r0yjAgbXmKEI38R
        kD9frbyYSSrpQFDm7G8WiWT8IUx7d2U=
X-Google-Smtp-Source: APXvYqyWDMUhtm6lJueqy/HUEdKliXxg7NyE8TkTIUdm5qMsSZ5p7RDl7MDX95I1LPZLE3rI7eaq/w==
X-Received: by 2002:a63:77cc:: with SMTP id s195mr5854243pgc.147.1570819182473;
        Fri, 11 Oct 2019 11:39:42 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c62sm13279165pfa.92.2019.10.11.11.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 11:39:41 -0700 (PDT)
Date:   Fri, 11 Oct 2019 11:39:39 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Chris Lew <clew@codeaurora.org>
Cc:     andy.gross@linaro.org, david.brown@linaro.org,
        aneela@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rpmsg: glink: Set tail pointer to 0 at end of FIFO
Message-ID: <20191011183939.GA30457@tuxbook-pro>
References: <1530148797-31904-1-git-send-email-clew@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1530148797-31904-1-git-send-email-clew@codeaurora.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 27 Jun 18:19 PDT 2018, Chris Lew wrote:

> When wrapping around the FIFO, the remote expects the tail pointer to
> be reset to 0 on the edge case where the tail equals the FIFO length.
> 

Applied

Thanks,
Bjorn

> Signed-off-by: Chris Lew <clew@codeaurora.org>
> ---
>  drivers/rpmsg/qcom_glink_smem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
> index 2b5cf2790954..7a276be598d6 100644
> --- a/drivers/rpmsg/qcom_glink_smem.c
> +++ b/drivers/rpmsg/qcom_glink_smem.c
> @@ -109,7 +109,7 @@ static void glink_smem_rx_advance(struct qcom_glink_pipe *np,
>  	tail = le32_to_cpu(*pipe->tail);
>  
>  	tail += count;
> -	if (tail > pipe->native.length)
> +	if (tail >= pipe->native.length)
>  		tail -= pipe->native.length;
>  
>  	*pipe->tail = cpu_to_le32(tail);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
