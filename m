Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1400EE6FE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 19:12:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728377AbfKDSMm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 13:12:42 -0500
Received: from smtprelay0076.hostedemail.com ([216.40.44.76]:56688 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727998AbfKDSMm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 13:12:42 -0500
X-Greylist: delayed 494 seconds by postgrey-1.27 at vger.kernel.org; Mon, 04 Nov 2019 13:12:41 EST
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave04.hostedemail.com (Postfix) with ESMTP id 2787218020B00;
        Mon,  4 Nov 2019 18:04:28 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id 35FEA8384368;
        Mon,  4 Nov 2019 18:04:26 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::::::::,RULES_HIT:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3870:3872:3873:3874:4321:4362:4605:5007:6117:6119:9010:10004:10400:10848:11026:11232:11473:11658:11914:12048:12296:12297:12679:12740:12760:12895:13069:13311:13357:13439:14659:14721:21080:21627:30012:30054:30070:30091,0,RBL:47.151.135.224:@perches.com:.lbl8.mailshell.net-62.8.0.100 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:24,LUA_SUMMARY:none
X-HE-Tag: hour56_60b9b720d6924
X-Filterd-Recvd-Size: 1844
Received: from XPS-9350.home (unknown [47.151.135.224])
        (Authenticated sender: joe@perches.com)
        by omf16.hostedemail.com (Postfix) with ESMTPA;
        Mon,  4 Nov 2019 18:04:24 +0000 (UTC)
Message-ID: <d3626d96b7fb9e0b1b25159a85d337f8882ceca1.camel@perches.com>
Subject: Re: [PATCH v5 1/3] clk: qcom: Allow constant ratio freq tables for
 rcg
From:   Joe Perches <joe@perches.com>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org
Cc:     agross@kernel.org, marc.w.gonzalez@free.fr,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Mon, 04 Nov 2019 10:04:14 -0800
In-Reply-To: <20191031185715.15504-1-jeffrey.l.hugo@gmail.com>
References: <20191031185538.15402-1-jeffrey.l.hugo@gmail.com>
         <20191031185715.15504-1-jeffrey.l.hugo@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 2019-10-31 at 11:57 -0700, Jeffrey Hugo wrote:
> Some RCGs (the gfx_3d_src_clk in msm8998 for example) are basically just
> some constant ratio from the input across the entire frequency range.  It
> would be great if we could specify the frequency table as a single entry
> constant ratio instead of a long list, ie:
> 
> 	{ .src = P_GPUPLL0_OUT_EVEN, .pre_div = 3 },
>         { }
> 
> So, lets support that.
[]
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
[]
> @@ -29,6 +29,9 @@ struct freq_tbl *qcom_find_freq(const struct freq_tbl *f, unsigned long rate)
>  	if (!f)
>  		return NULL;
>  
> +	if(!f->freq)
> +		return f;
> +

trivia:

Space after if before open parenthesis please.

Can you please make sure to style check your
code with checkpatch before submission?

Thanks.


