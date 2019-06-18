Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4625B4A559
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 17:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729272AbfFRP3C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 11:29:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:55472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729247AbfFRP3C (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 11:29:02 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 141962085A;
        Tue, 18 Jun 2019 15:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560871741;
        bh=CF7FRkL2iwwVYjbCaQgrgRX+K2cxB9iPmG+x2eAyy9Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C77rrrEvPFlhBrbHNBm+BOxFFDfKGdu0ap03ztelW4IIobTlRpUQCKcOizOc2xSEd
         FOK4ir94zSoUkwYJkwmy7wF79J+29xNEmtFYBU7/cVJnNsI6NuAFJOfo9ai0sx90V7
         rgrp6sa4HcF0ZT+TooI7Ihq4z8a4eA9ZtWklx9Rw=
Date:   Tue, 18 Jun 2019 17:28:59 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Muchun Song <smuchun@gmail.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Prateek Sood <prsood@codeaurora.org>,
        Mukesh Ojha <mojha@codeaurora.org>, gkohli@codeaurora.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        zhaowuyun@wingtech.com
Subject: Re: [PATCH v4] driver core: Fix use-after-free and double free on
 glue directory
Message-ID: <20190618152859.GB1912@kroah.com>
References: <20190516142342.28019-1-smuchun@gmail.com>
 <20190524190443.GB29565@kroah.com>
 <CAPSr9jH3sowszuNtBaTM1Wdi9vW+iakYX1G3arj+2_r5r7bYwQ@mail.gmail.com>
 <CAPSr9jFG17YnQC3UZrTZjqytB5wpTMeqqqOcJ7Sf6gAr8o5Uhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPSr9jFG17YnQC3UZrTZjqytB5wpTMeqqqOcJ7Sf6gAr8o5Uhg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 18, 2019 at 09:40:13PM +0800, Muchun Song wrote:
> Ping guys ? I think this is worth fixing.

That's great (no context here), but I need people to actually agree on
what the correct fix should be.  I had two different patches that were
saying they fixed the same issue, and that feels really wrong.

So can everyone actually agree on one patch please?

thanks,

greg k-h
