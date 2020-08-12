Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87B7F242ECE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 20:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726456AbgHLS7A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 14:59:00 -0400
Received: from smtprelay0165.hostedemail.com ([216.40.44.165]:54520 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726447AbgHLS7A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 14:59:00 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id 78FAA100E86C6;
        Wed, 12 Aug 2020 18:58:59 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:966:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1538:1568:1593:1594:1711:1714:1730:1747:1777:1792:2110:2196:2199:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3622:3867:3871:3872:3873:3874:4321:4385:5007:6742:7901:7903:10004:10400:10848:10967:11232:11658:11914:12297:12740:12760:12895:13069:13311:13357:13439:14181:14659:14721:21080:21627:30054:30083:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: head53_0e1322226fed
X-Filterd-Recvd-Size: 1835
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf03.hostedemail.com (Postfix) with ESMTPA;
        Wed, 12 Aug 2020 18:58:56 +0000 (UTC)
Message-ID: <81cfca4309624b4f33cace78297872a526aa4763.camel@perches.com>
Subject: Re: [PATCH 00/44] SPMI patches needed by Hikey 970
From:   Joe Perches <joe@perches.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Stephen Boyd <sboyd@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Wei Xu <xuwei5@hisilicon.com>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>, devel@driverdev.osuosl.org,
        linux-arm-msm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Date:   Wed, 12 Aug 2020 11:58:55 -0700
In-Reply-To: <20200812154752.3223b9d8@onda.lan>
References: <cover.1597247164.git.mchehab+huawei@kernel.org>
         <305f0df155e89e0c626b8f7366c4ab5f6741aedd.camel@perches.com>
         <20200812154752.3223b9d8@onda.lan>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 2020-08-12 at 15:47 -0300, Mauro Carvalho Chehab wrote:
> Em Wed, 12 Aug 2020 10:13:51 -0700
> Joe Perches <joe@perches.com> escreveu:
> 
> > Perhaps these trivial bits on top:
> 
> Sounds fine for me. Feel free to send it with your SOB, adding my reviewed by:
> 
> Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

I don't know that your original
series is going to be applied as-is
so I think you should carry it.

cheers, Joe


