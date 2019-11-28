Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F09310CE68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2019 19:14:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbfK1SOm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Nov 2019 13:14:42 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38057 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbfK1SOm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Nov 2019 13:14:42 -0500
Received: by mail-pg1-f195.google.com with SMTP id t3so12778466pgl.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2019 10:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kzxdGrRpbIx3iqer3NoD+i566/YUyl1UTsZIqIXHL8g=;
        b=jghqLvEpZPEY8roPdXK4chlHRt4N3R0YUvdb23sed3yv2N0d778VpDPtB7LqAtxJ4R
         JxgGg3oiw4h7SceC5WZOmyMVHe3Pa9Z8gLILLF08n0c9dZz5ZjRLml1mAOGrm6+0V7AQ
         sk/z7l72egF6jOyKWG2AriNrIiq7TLavZ1U8PkIaULHqCe8rVewKFo5rw6iLGSSN2q3R
         uZ5xqRz3kC9ionb3CJr7HUozeGXLwKGuJkssyKglqK+8ZxCBbvfpuA8ed4fRnBvHe846
         dtM8DGX0z7g3butb6L+vUwmhFL6fHBF+V7BF/SIhF43Is5JTpgfOQa3Yx641alio6plu
         bAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kzxdGrRpbIx3iqer3NoD+i566/YUyl1UTsZIqIXHL8g=;
        b=m7SzKrItgmzg3wFjmHRexMmTgnuA5+DlcCCjPrjuYriOy51ohQLB0H/iwrIOcUnGTk
         a9NtXicklIe1XoWajis5Xa29eqf2UBTdBFsMuRJnlyoAXfhi+K6zbg/tAVlBmgsd4Sa4
         8NkCZyrHV3ufZUvLvVnq7xnk5cgAAMzjB/tWeu8A3iEEDVgTGVjYAFkU+O4SWnr6XJ3v
         YL4wHTCPJcJoX4WGOkrUATDyHVg6ZbmjUmeMmGPAtCWeQ3uW4ctkTbd/5rkdztVGU1Mr
         WpKfHbE3A1fhTyNoVaKOLzR+OGEDxa/c4ta9rRumo7I82+rDE7MMeVsjO7Dl/lUyrBjO
         TZRA==
X-Gm-Message-State: APjAAAVl3E/eS9pkiLGtO44BVJo7jcMq/LD+mFR2LI/s3WNV0XkphM+y
        WZvfx78D3w2jq1ey4oZV7HZkpQ==
X-Google-Smtp-Source: APXvYqwNngPDp9Mzjo6D7IqZvUWBgaCWIGeB0o1wC9C/oX8BxWwFagWvKZ5iq1wprcMAPLXSE1JfMQ==
X-Received: by 2002:a05:6a00:3:: with SMTP id h3mr1847541pfk.78.1574964881686;
        Thu, 28 Nov 2019 10:14:41 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r62sm3077816pfc.89.2019.11.28.10.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 10:14:41 -0800 (PST)
Date:   Thu, 28 Nov 2019 10:14:38 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-pm@vger.kernel.org, agross@kernel.org, digetx@gmail.com,
        evgreen@chromium.org, daidavid1@codeaurora.org,
        masneyb@onstation.org, sibis@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/5] interconnect: qcom: sdm845: Walk the list safely on
 node removal
Message-ID: <20191128181438.GI82109@yoga>
References: <20191128133435.25667-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191128133435.25667-1-georgi.djakov@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 28 Nov 05:34 PST 2019, Georgi Djakov wrote:

> As we will remove items off the list using list_del(), we need to use the
> safe version of list_for_each_entry().
> 
> Fixes: b5d2f741077a ("interconnect: qcom: Add sdm845 interconnect provider driver")
> Reported-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
>  drivers/interconnect/qcom/sdm845.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/interconnect/qcom/sdm845.c b/drivers/interconnect/qcom/sdm845.c
> index 502a6c22b41e..924c2d056d85 100644
> --- a/drivers/interconnect/qcom/sdm845.c
> +++ b/drivers/interconnect/qcom/sdm845.c
> @@ -870,7 +870,7 @@ static int qnoc_remove(struct platform_device *pdev)
>  	struct icc_provider *provider = &qp->provider;
>  	struct icc_node *n;
>  
> -	list_for_each_entry(n, &provider->nodes, node_list) {
> +	list_for_each_entry_safe(n, &provider->nodes, node_list) {

This now takes 4 parameters, please update (same issue in next patch).

Regards,
Bjorn

>  		icc_node_del(n);
>  		icc_node_destroy(n->id);
>  	}
