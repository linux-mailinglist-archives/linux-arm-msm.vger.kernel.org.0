Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8013DCBC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 18:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729286AbfJRQoH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 12:44:07 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37166 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728368AbfJRQoH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 12:44:07 -0400
Received: by mail-pf1-f193.google.com with SMTP id y5so4226356pfo.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2019 09:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZwMcOsbGZZ8f6uWMLDj+pQEnHD4UiXo77mMaA+m9Cec=;
        b=MaoAVrEWrYmStM42VmjkhM+yBqW5nmFdZUdMgNJxJxHlLHKaZFNCxq6OBgTpGLhKGc
         OWdO81hilPq/aXDzQ9k9l5FMpOwQTtX9aSf/gh8k9HJLlpNNhyBbwzQztVt7Ln578bg2
         TxoaQzzeexqQEm2Me70b+h7c69cdFw+yNHFPR4P/kCRWUaXTKxvLuxWPHHcZhBKMXmRa
         haUzz/7Z5U1iMglzLf+T+vfBOWLIzKGazC+M4utXX8Q/+VWjHY0wZMILMMrJmlC5rYMY
         hO4NiYtRo41y6gSO5oLkynBW3PZH36X124Jp7D/tax93FnMXCzAKfFehw6NNhZxlFywY
         tqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZwMcOsbGZZ8f6uWMLDj+pQEnHD4UiXo77mMaA+m9Cec=;
        b=YOoMt3psA/1ipuB48pJiekDBjhPtjd/9smLUb5r4jAICGiAdugPFFyjp1woeOXDQHp
         f1oH0LcSKaY1ARzVuEjeOI9zZ/aZOvzx9Ew/YfQ85V+cctQxrKZ0uCsTNd3c5dLWak8j
         wO6zS2ScxIlLGHw3c2QiQiJ1OCDPNckENREfRgDWxCzlscmH++gXyFr81IubDGWWKGix
         r6YHwjlHFikxcx9/QDPN+6zzDbV6n7G3c9ZnOG3Pqb0JME3axfrNZIBrcvp2q+GaPEvM
         p+7rdykdocpnYwCJS5i4xUbzdyzrsi7kbPmlj0+HwMGQlU5Qwso2cgOWiAQco3Alk28N
         7Zuw==
X-Gm-Message-State: APjAAAUl1lLHbH8KAGA1/5bnSukiXUAXDNHB12YHt5gunKvcdQAN2VfK
        tz9FeijrfLHLdHfV+sjy3F7xIw==
X-Google-Smtp-Source: APXvYqzbk5aRYFgKZCpTVv7zh/wqaJImwgGdmlEdKxg+rLkTLwys+lHKrS40lv4h4mITrIuv7V5cHg==
X-Received: by 2002:a63:f908:: with SMTP id h8mr10900767pgi.244.1571417046622;
        Fri, 18 Oct 2019 09:44:06 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v19sm7230962pff.46.2019.10.18.09.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 09:44:05 -0700 (PDT)
Date:   Fri, 18 Oct 2019 09:44:03 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-pm@vger.kernel.org, rostedt@goodmis.org, mingo@redhat.com,
        vincent.guittot@linaro.org, daidavid1@codeaurora.org,
        okukatla@codeaurora.org, evgreen@chromium.org, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] interconnect: Add basic tracepoints
Message-ID: <20191018164403.GB1669@tuxbook-pro>
References: <20191018140224.15087-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018140224.15087-1-georgi.djakov@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 18 Oct 07:02 PDT 2019, Georgi Djakov wrote:

> The tracepoints can help with understanding the system behavior of a
> given interconnect path when the consumer drivers change their bandwidth
> demands. This might be interesting when we want to monitor the requested
> interconnect bandwidth for each client driver. The paths may share the
> same nodes and this will help to understand "who and when is requesting
> what". All this is useful for subsystem drivers developers and may also
> provide hints when optimizing the power and performance profile of the
> system.
> 

This is very useful, thanks for writing it up.

> diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
[..]
> @@ -449,6 +452,9 @@ int icc_set_bw(struct icc_path *path, u32 avg_bw, u32 peak_bw)
>  
>  		/* aggregate requests for this node */
>  		aggregate_requests(node);
> +
> +		trace_icc_set_bw(node, dev_name(path->reqs[i].dev),
> +				 avg_bw, peak_bw);

When I've been debugging interconnect things I've added a
kstrdup_const() of "name" in of_icc_get() and then included that here.

I find including the path name quite useful for devices with multiple
paths.

>  	}
>  
>  	ret = apply_constraints(path);
> @@ -461,6 +467,9 @@ int icc_set_bw(struct icc_path *path, u32 avg_bw, u32 peak_bw)
>  			path->reqs[i].avg_bw = old_avg;
>  			path->reqs[i].peak_bw = old_peak;
>  			aggregate_requests(node);
> +
> +			trace_icc_set_bw(node, dev_name(path->reqs[i].dev),
> +					 old_avg, old_peak);
>  		}
>  		apply_constraints(path);

And analog to e.g. the clock traces I would suggest that you trace
device, path and "ret" here.

Regards,
Bjorn
