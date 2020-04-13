Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1EB01A6C03
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 20:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728022AbgDMSV5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 14:21:57 -0400
Received: from smtprelay0213.hostedemail.com ([216.40.44.213]:49966 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732988AbgDMSV5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 14:21:57 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id D64AD181D330D;
        Mon, 13 Apr 2020 18:21:55 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2559:2562:2731:2828:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3872:3873:4250:4321:5007:6120:7901:7903:10004:10226:10400:10848:11026:11232:11473:11658:11914:12043:12048:12296:12297:12679:12740:12760:12895:13069:13255:13311:13357:13439:13972:14096:14097:14659:14721:21080:21324:21451:21627:21990:30012:30054:30070:30080:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: doll17_109959b0eed47
X-Filterd-Recvd-Size: 2761
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf07.hostedemail.com (Postfix) with ESMTPA;
        Mon, 13 Apr 2020 18:21:53 +0000 (UTC)
Message-ID: <6566837cdb0e8db522c53daba8baf49c2ca79376.camel@perches.com>
Subject: Re: [PATCH v4 01/10] drivers: qcom: rpmh-rsc: Clean code
 reading/writing TCS regs/cmds
From:   Joe Perches <joe@perches.com>
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>, evgreen@chromium.org,
        Lina Iyer <ilina@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Mon, 13 Apr 2020 11:19:46 -0700
In-Reply-To: <20200413100321.v4.1.I1b754137e8089e46cf33fc2ea270734ec3847ec4@changeid>
References: <20200413170415.32463-1-dianders@chromium.org>
         <20200413100321.v4.1.I1b754137e8089e46cf33fc2ea270734ec3847ec4@changeid>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 2020-04-13 at 10:04 -0700, Douglas Anderson wrote:
> This patch makes two changes, both of which should be no-ops:
> 
> 1. Make read_tcs_reg() / read_tcs_cmd() symmetric to write_tcs_reg() /
>    write_tcs_cmd().
> 
> 2. Change the order of operations in the above functions to make it
>    more obvious to me what the math is doing.  Specifically first you
>    want to find the right TCS, then the right register, and then
>    multiply by the command ID if necessary.

Though these operations are only used a couple times, perhaps
it'd be useful to have static inlines for the calcs.

> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
[]
> @@ -67,28 +67,33 @@
>  #define CMD_STATUS_ISSUED		BIT(8)
>  #define CMD_STATUS_COMPL		BIT(16)

Maybe something like:

static inline void __iomem *
tcs_reg_addr(struct rsc_drv drv, int reg, int tcs_id)
{
	return drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg;
}

static inline void __iomem *
tcs_cmd_addr(struct rsc_drv drv, int reg, int tcs_id, int cmd_id)
{
	return tcs_reg_addr(drv, reg, tcs_id) + RSC_DRV_CMD_OFFSET * cmd_id;
}

> -static u32 read_tcs_reg(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id)
> +static u32 read_tcs_cmd(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id)
>  {
> -	return readl_relaxed(drv->tcs_base + reg + RSC_DRV_TCS_OFFSET * tcs_id +
> +	return readl_relaxed(drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg +
>  			     RSC_DRV_CMD_OFFSET * cmd_id);

	return readl_relaxed(tcs_cmd_addr(drv, reg, tcs_id, cmd_id));

etc...


