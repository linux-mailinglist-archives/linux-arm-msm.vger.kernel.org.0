Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 867C84A656
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 18:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729272AbfFRQNn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 12:13:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:51042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729249AbfFRQNn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 12:13:43 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DF82B20B1F;
        Tue, 18 Jun 2019 16:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560874422;
        bh=bVVkiFHLJaXqthJlNED1JjG6SMoMKVmDToBpACNCwTk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Io7Qr15/LSttBNs/+tDG05cnvzqIJHScRK0PKh95Q99XXk382mpxo6LJrg8l60WfV
         dQjYT/H5KwKYQ4I8sNpBxBrMN4OBGMBy49X1IVQaeu0Y408AZxdMZh3QR3I5KVHFde
         8MMYh/hPHE6ckWA7dt0Ezplj2twor1JAXb9YHWfo=
Date:   Tue, 18 Jun 2019 18:13:40 +0200
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
Message-ID: <20190618161340.GA13983@kroah.com>
References: <20190516142342.28019-1-smuchun@gmail.com>
 <20190524190443.GB29565@kroah.com>
 <CAPSr9jH3sowszuNtBaTM1Wdi9vW+iakYX1G3arj+2_r5r7bYwQ@mail.gmail.com>
 <CAPSr9jFG17YnQC3UZrTZjqytB5wpTMeqqqOcJ7Sf6gAr8o5Uhg@mail.gmail.com>
 <20190618152859.GB1912@kroah.com>
 <CAPSr9jFMKb1bQAbCFLqP2+fb60kcbyJ+cDspkL5FH28CNKFz3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPSr9jFMKb1bQAbCFLqP2+fb60kcbyJ+cDspkL5FH28CNKFz3A@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 19, 2019 at 12:09:40AM +0800, Muchun Song wrote:
> Greg KH <gregkh@linuxfoundation.org> 于2019年6月18日周二 下午11:29写道：
> >
> > On Tue, Jun 18, 2019 at 09:40:13PM +0800, Muchun Song wrote:
> > > Ping guys ? I think this is worth fixing.
> >
> > That's great (no context here), but I need people to actually agree on
> > what the correct fix should be.  I had two different patches that were
> > saying they fixed the same issue, and that feels really wrong.
> 
> Another patch:
>     Subject: [PATCH v3] drivers: core: Remove glue dirs early only
> when refcount is 1
> 
> My first v1 patch:
>     Subject: [PATCH] driver core: Fix use-after-free and double free
> on glue directory
> 
> The above two patches are almost the same that fix is based on the refcount.
> But why we change the solution from v1 to v4? Some discussion can
> refer to the mail:
> 
>     Subject: [PATCH] driver core: Fix use-after-free and double free
> on glue directory

Again, I am totally confused and do not see a patch in an email that I
can apply...

Someone needs to get people to agree here...

thanks,

greg k-h
