Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10380242EE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 21:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgHLTHg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 15:07:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:36398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726456AbgHLTHg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 15:07:36 -0400
Received: from onda.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4A4E420838;
        Wed, 12 Aug 2020 19:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597259256;
        bh=+2MX8lMPobxkg5Sd92d2N9QmRdXu/gmf1DtCDwVeNMc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GGJWOUBHdHx6FYBQZUIF1C/maagqop8zENLGUFECJirYqYO7THLnB5L8mL2qZhWMH
         /bk+NJSZeSNSAPBTE/soRkC21ws7Km2DH7YNNb0hBmuuD7LpbJ1Gy8CEzb2UTuWY9G
         9gf8QWZCIv2NIBjtiDYQwSjQsac7gBG5saW6K1Ek=
Date:   Wed, 12 Aug 2020 16:07:30 -0300
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Joe Perches <joe@perches.com>
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
Subject: Re: [PATCH 00/44] SPMI patches needed by Hikey 970
Message-ID: <20200812160730.292ae1d4@onda.lan>
In-Reply-To: <81cfca4309624b4f33cace78297872a526aa4763.camel@perches.com>
References: <cover.1597247164.git.mchehab+huawei@kernel.org>
        <305f0df155e89e0c626b8f7366c4ab5f6741aedd.camel@perches.com>
        <20200812154752.3223b9d8@onda.lan>
        <81cfca4309624b4f33cace78297872a526aa4763.camel@perches.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Em Wed, 12 Aug 2020 11:58:55 -0700
Joe Perches <joe@perches.com> escreveu:

> On Wed, 2020-08-12 at 15:47 -0300, Mauro Carvalho Chehab wrote:
> > Em Wed, 12 Aug 2020 10:13:51 -0700
> > Joe Perches <joe@perches.com> escreveu:
> >   
> > > Perhaps these trivial bits on top:  
> > 
> > Sounds fine for me. Feel free to send it with your SOB, adding my reviewed by:
> > 
> > Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> 
> I don't know that your original
> series is going to be applied as-is
> so I think you should carry it.


Ok. I'll then add the hunks you wrote to the affected changesets.
> 
> cheers, Joe
> 
> 
