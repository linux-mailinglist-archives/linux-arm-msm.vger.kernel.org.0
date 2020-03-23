Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BCA51900B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2020 22:53:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgCWVwL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Mar 2020 17:52:11 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36124 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbgCWVwK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Mar 2020 17:52:10 -0400
Received: by mail-pf1-f195.google.com with SMTP id i13so8205354pfe.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2020 14:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zzaojujfcls2hgFyVUn0hD1Rb+7tZyy+TgUJhbpUoN0=;
        b=tWTwtLciVWGSxsbK51pBsm7+vZ073MLGRYvTY2C4gVsjjvEfn14hy7mCtlIsWT+LvQ
         al5phEEv8sdIIHJnFOjBu5CNIfygJVjQbwKif/nBhzkXYzPt2NeARsXaQbO7sHjYl7Ho
         IyuMyLSDe76UZsuPAvnYEFVGKNVGSkygCw+8o5OXo9RGlOSzkscK/JydAc5DUTMZO83W
         03ohm0vE/DAPjcuZXljtjSbkdPHLTIyQmiBH6KTiDrfaisDWAPIrUN0bK7hUee01IuaS
         2vh5bPwOmBCgwlmBoPM7NeRT3ejSr2KPgaJ3H/+g6hW07PbV15/ZheZ3OF+7xCrlsE1Y
         pXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zzaojujfcls2hgFyVUn0hD1Rb+7tZyy+TgUJhbpUoN0=;
        b=fOV80VC0x872czGXBzHHI4AHEXq6U/jBFamYQLNac635AZyo68EnTRZecYYRjH1TJc
         3FA4K/qCQL8Ify7BtRIvG57L5uhVGMlWAfzRTFimkfN4IM7jmhWmV9qoTjIVYsq3qmQw
         SXZw/TL0Wb61ke4yuZXMtP/LW4D/Aq2VzCTV71yclJ61kblb0Re2/jwkFrxRJds4M9nj
         35JiTEAany2C40/XpOTUQWFvuQDbWpDkagJPYc5J9xjDm/Gkh5NX82eJ3Zu3WE9icYQz
         5zh31pUHioHZjv6U0n2nNy3L4hOkDhUmBFAQePr5Plhj1LP5RKq5+1GOt1zChE9vrDKc
         oEww==
X-Gm-Message-State: ANhLgQ1RAa61jzrXeT2drdgRWUhJuZnn288E4SkOBWGbRZUZFW0Xheff
        7tbzH1Yuamo44RSKu2DeW8WFlw==
X-Google-Smtp-Source: ADFU+vvmkqQHQNARe/Cfqm5giF+9fLK7xjtj+Kr/nmczELP2SRPVq3XmEvxUAYfyJp75b2PX8eQsiQ==
X-Received: by 2002:a63:ec50:: with SMTP id r16mr25369318pgj.274.1585000327853;
        Mon, 23 Mar 2020 14:52:07 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id j12sm5499008pgs.0.2020.03.23.14.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 14:52:07 -0700 (PDT)
Date:   Mon, 23 Mar 2020 15:52:05 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] remoteproc: Traverse rproc_list under RCU read
 lock
Message-ID: <20200323215205.GA30464@xps15>
References: <20200310063817.3344712-1-bjorn.andersson@linaro.org>
 <20200310063817.3344712-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310063817.3344712-2-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 09, 2020 at 11:38:14PM -0700, Bjorn Andersson wrote:
> In order to be able to traverse the mostly read-only rproc_list without
> locking during panic migrate traversal to be done under rcu_read_lock().
> 
> Mutual exclusion for modifications of the list continues to be handled
> by the rproc_list_mutex and a synchronization point is added before
> releasing objects that are popped from the list.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Change v3:
> - New patch
> 
>  drivers/remoteproc/remoteproc_core.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 097f33e4f1f3..f0a77c30c6b1 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1854,8 +1854,8 @@ struct rproc *rproc_get_by_phandle(phandle phandle)
>  	if (!np)
>  		return NULL;
>  
> -	mutex_lock(&rproc_list_mutex);
> -	list_for_each_entry(r, &rproc_list, node) {
> +	rcu_read_lock();
> +	list_for_each_entry_rcu(r, &rproc_list, node) {
>  		if (r->dev.parent && r->dev.parent->of_node == np) {
>  			/* prevent underlying implementation from being removed */
>  			if (!try_module_get(r->dev.parent->driver->owner)) {
> @@ -1868,7 +1868,7 @@ struct rproc *rproc_get_by_phandle(phandle phandle)
>  			break;
>  		}
>  	}
> -	mutex_unlock(&rproc_list_mutex);
> +	rcu_read_unlock();
>  
>  	of_node_put(np);
>  
> @@ -1925,7 +1925,7 @@ int rproc_add(struct rproc *rproc)
>  
>  	/* expose to rproc_get_by_phandle users */
>  	mutex_lock(&rproc_list_mutex);
> -	list_add(&rproc->node, &rproc_list);
> +	list_add_rcu(&rproc->node, &rproc_list);
>  	mutex_unlock(&rproc_list_mutex);
>  
>  	return 0;
> @@ -2140,9 +2140,12 @@ int rproc_del(struct rproc *rproc)
>  
>  	/* the rproc is downref'ed as soon as it's removed from the klist */
>  	mutex_lock(&rproc_list_mutex);
> -	list_del(&rproc->node);
> +	list_del_rcu(&rproc->node);
>  	mutex_unlock(&rproc_list_mutex);
>  
> +	/* Ensure that no readers of rproc_list are still active */
> +	synchronize_rcu();
> +

Please add linuc/rculist.h to include the RCU API.  With that:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  	device_del(&rproc->dev);
>  
>  	return 0;
> -- 
> 2.24.0
> 
