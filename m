Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F177A2709
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 21:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728162AbfH2TKC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 15:10:02 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43902 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727798AbfH2TJ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 15:09:58 -0400
Received: by mail-pf1-f195.google.com with SMTP id v12so2696015pfn.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2019 12:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=REnHj/EWqJBFRPAqiny/Na+szdlJ2JK7cCM/8YDJ4Wc=;
        b=MFWmCdLF+LwePY3Zth/JgwrB6iisib3W48GnTPFjr8rFBaiyaqlfqL664fwmmfrMar
         UjFDKUDVtYc9Tr0x9PYJn2DlKlWeWu6qcpMz8QfbdRPiJEBOfRzfY/B3ZJZ9MYDQIj36
         RTx5Lyz26OhXT2oFBeTNM5LY0x/fcQfTZAi+rAb8tCAZW9eVBsfO051/OHO1zCd2at80
         qPgMx3f2IaNBnxbsmxOPBGlADw6HDFRWRc00Nzfuk282+DJqcGd43P/ImMY2A73C5ptP
         XPn/JoznaW+iw/z2UK4e2QC4Ph6BTxsrocfXtiBrorLxkW4nc8vZo55adXGSuXCAc8h9
         0vVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=REnHj/EWqJBFRPAqiny/Na+szdlJ2JK7cCM/8YDJ4Wc=;
        b=Ly+GYzAmCwGrXiBeheTB7iXNWLZ/ko2AfOlZJIULmexFeosHFPNHDkHxTmsnSqTXAp
         Uk6OOP80cnMwI5XLnXBvaLRRLjo+7jg+Kp28lLpvy30ItWkq8wZw7FtSMzpb++0d5Hcg
         GdQPQ48Vi2udZ2w42qmaIE7auRzvEaJLI67xRJlGmnnS/K5h8/XnbM/WtMEoVTgu+cXR
         7XOOZHFqaNA2SSFiBN9o2YLPDHUqdK310lt7ygwcfQpy6uobkR1PHrUqVpwAK2ldzmRq
         uucEJ1ITVF3VVH+pfuTkNcVU0KWQKCcLeyXAAJeG14WnXRDHZsLPfXDlwgxMyMAj0F8o
         SkWQ==
X-Gm-Message-State: APjAAAUzSvAnmNQfe3mY+iJ4vP+uqsu5WUmTNgDH3NhlRWZdbGu0/VfO
        ygLlV9Y1/rFz33F1XcgVA+vx0Q==
X-Google-Smtp-Source: APXvYqxOlXUr8Ltf38dWyE0JRNEtXL3FY/R3/1FGtaqR11AgbcZU9BVM8q2BE+w45XKeozEms02+XA==
X-Received: by 2002:a17:90a:f011:: with SMTP id bt17mr11500065pjb.21.1567105797871;
        Thu, 29 Aug 2019 12:09:57 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b24sm2710244pgw.66.2019.08.29.12.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 12:09:57 -0700 (PDT)
Date:   Thu, 29 Aug 2019 12:09:55 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rpmsg: glink: Use struct_size() helper
Message-ID: <20190829190955.GP6167@minitux>
References: <20190829181721.GA22554@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190829181721.GA22554@embeddedor>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 29 Aug 11:17 PDT 2019, Gustavo A. R. Silva wrote:

> One of the more common cases of allocation size calculations is finding
> the size of a structure that has a zero-sized array at the end, along
> with memory for some number of elements for that array. For example:
> 
> struct {
> 	...
> 	struct intent_pair intents[];
> } __packed * msg;
> 
> Make use of the struct_size() helper instead of an open-coded version
> in order to avoid any potential type mistakes.
> 
> So, replace the following form:
> 
> sizeof(*msg) + sizeof(struct intent_pair) * count
> 
> with:
> 
> struct_size(msg, intents, count)
> 
> This code was detected with the help of Coccinelle.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Applied, thanks!

> ---
>  drivers/rpmsg/qcom_glink_native.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index f46c787733e8..621f1afd4d6b 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -892,7 +892,7 @@ static void qcom_glink_handle_intent(struct qcom_glink *glink,
>  		struct intent_pair intents[];
>  	} __packed * msg;
>  
> -	const size_t msglen = sizeof(*msg) + sizeof(struct intent_pair) * count;
> +	const size_t msglen = struct_size(msg, intents, count);
>  	int ret;
>  	int i;
>  	unsigned long flags;
> -- 
> 2.23.0
> 
