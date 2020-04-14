Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62EB81A8819
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 19:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503141AbgDNR6h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 13:58:37 -0400
Received: from smtprelay0237.hostedemail.com ([216.40.44.237]:57432 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729303AbgDNR6e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 13:58:34 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id 53DB2837F27B;
        Tue, 14 Apr 2020 17:58:31 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:2901:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3872:4321:4605:5007:8531:10004:10400:10481:10848:11026:11232:11473:11658:11914:12296:12297:12740:12760:12895:13069:13153:13161:13228:13229:13255:13311:13357:13439:13972:14659:14721:19900:21080:21627:30054:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: thing26_ffa4eda79c27
X-Filterd-Recvd-Size: 1879
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf08.hostedemail.com (Postfix) with ESMTPA;
        Tue, 14 Apr 2020 17:58:29 +0000 (UTC)
Message-ID: <9c633ea161df91265a338aaa93a78443894c268f.camel@perches.com>
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Factor "tcs_reg_addr" and
 "tcs_cmd_addr" calculation
From:   Joe Perches <joe@perches.com>
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mkshah@codeaurora.org, mka@chromium.org, swboyd@chromium.org,
        evgreen@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Tue, 14 Apr 2020 10:56:20 -0700
In-Reply-To: <20200414104120.1.Ic70288f256ff0be65cac6a600367212dfe39f6c9@changeid>
References: <20200414104120.1.Ic70288f256ff0be65cac6a600367212dfe39f6c9@changeid>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 2020-04-14 at 10:41 -0700, Douglas Anderson wrote:
> We can make some of the register access functions more readable by
> factoring out the calculations a little bit.

unrelated trivia:

> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
[]
>  static void write_tcs_reg_sync(struct rsc_drv *drv, int reg, int tcs_id,
>  			       u32 data)
>  {
> -	writel(data, drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg);
> +	writel(data, tcs_reg_addr(drv, reg, tcs_id));
>  	for (;;) {
> -		if (data == readl(drv->tcs_base + reg +
> -				  RSC_DRV_TCS_OFFSET * tcs_id))
> +		if (data == readl(tcs_reg_addr(drv, reg, tcs_id)))
>  			break;
>  		udelay(1);
>  	}

There a lockup potential here.

It might be better to use some max loop counter with
an error/warning emitted instead of a continuous retry.


