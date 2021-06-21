Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6643AF130
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 19:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231638AbhFURDD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 13:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbhFURCw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 13:02:52 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BA88C0A888E
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 09:33:22 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id x22so7330152pll.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 09:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RfuZmFTIa+BiKpP9D0IXA33fRGcBiajcpX+BWebyFZw=;
        b=mDzJgNZcryGHFACHFEDHgkTmlIYQ/uZ4s01IIQTfG0d33to/CCfw1fwmh5sUn1rYjF
         G/YRtL9q75MzrMaZqzgAmXP0RPJFRmneElRZiNX+dDJqiJsu/tp9TrCT8uNNge1Vq3Gt
         F7xIbG2WdbCTb+k5CtoLC3Zu7/sS9NZ163zmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RfuZmFTIa+BiKpP9D0IXA33fRGcBiajcpX+BWebyFZw=;
        b=ojtO5+/HGGf7anq/SwWGmy3f8zRgK6s9myA88wnEzsaRSBOYfY1NgUBE+J1u7z5N6G
         gRVp0sxTmA4ew1ucPoDQ+XLhk/gOPgxHzOZS7QnjPEnqIcjBDUasOCbXi6c1PJLoSuz6
         8fOn/wjBmdJfSYxik1h8arvq/LSD6RXIyWZ1qEq1VxM6qVd+Cgwk9QHf8PG0EbRWcRZS
         KWb+8rMSnj068wEDmqgR0HHKJ1OI5EcYWj11hkVt4+TDcvIa0ewCxN1ztAJ0aU3rvN55
         AsebtGVDnAqK78UfcG7XN5pOeakmGCw9gW4zkxIG5VVmkTWT2Mk/qtBaDXqq8tKkPP+u
         76tg==
X-Gm-Message-State: AOAM530A4MG2fqB9VI7G0Z66MDVmindlmOtONpDPElXe0bFWKq5DkVcK
        Ai5tHC09D2eGmfcbb7MQj9iDaA==
X-Google-Smtp-Source: ABdhPJyecCMpcNv4WWa9XLQ4xt+7SYjSI34gpgBHcc3fgq11CMS9BCdQ4yBSGWL8tcElRKvvq8qFEg==
X-Received: by 2002:a17:90a:8d08:: with SMTP id c8mr21813735pjo.177.1624293201955;
        Mon, 21 Jun 2021 09:33:21 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:9f0f:4fd2:adeb:6f55])
        by smtp.gmail.com with UTF8SMTPSA id u23sm19400322pgk.38.2021.06.21.09.33.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 09:33:21 -0700 (PDT)
Date:   Mon, 21 Jun 2021 09:33:19 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Odelu Kukatla <okukatla@codeaurora.org>
Cc:     georgi.djakov@linaro.org, bjorn.andersson@linaro.org,
        evgreen@google.com, Georgi Djakov <djakov@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        sboyd@kernel.org, mdtipton@codeaurora.org, sibis@codeaurora.org,
        saravanak@google.com, seansw@qti.qualcomm.com, elder@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH] interconnect: Aggregate bandwidth votes for unused nodes
 in sync_state()
Message-ID: <YNC/T4gpCh/QAkCU@google.com>
References: <1624122509-17508-1-git-send-email-okukatla@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1624122509-17508-1-git-send-email-okukatla@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jun 19, 2021 at 10:38:29PM +0530, Odelu Kukatla wrote:
> When removing the initial bandwidth votes in sync_state(), make sure
> to call the aggregate() function for nodes which don't have any
> clients yet. aggregate_requests() does not invoke aggregate()
> for unused nodes.
> 
> Signed-off-by: Odelu Kukatla <okukatla@codeaurora.org>

It seems this should have a 'Fixes' tag for b1d681d8d324 ("interconnect:
Add sync state support")', to make sure the change makes it into the
stable trees.

> ---
>  drivers/interconnect/core.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
> index 8a1e70e..1d9a00a 100644
> --- a/drivers/interconnect/core.c
> +++ b/drivers/interconnect/core.c
> @@ -1106,7 +1106,16 @@ void icc_sync_state(struct device *dev)
>  		dev_dbg(p->dev, "interconnect provider is in synced state\n");
>  		list_for_each_entry(n, &p->nodes, node_list) {
>  			if (n->init_avg || n->init_peak) {
> -				aggregate_requests(n);
> +				if (hlist_empty(&n->req_list)) {

nit: consider handling the common case in the 'if' branch and the exception of
the initial votes in 'else'.

> +					if (p->pre_aggregate)
> +						p->pre_aggregate(n);
> +
> +					p->aggregate(n, 0, 0, 0, &n->avg_bw,
> +						&n->peak_bw);
> +				} else {
> +					aggregate_requests(n);
> +				}
> +
>  				p->set(n, n);
>  			}
>  		}
