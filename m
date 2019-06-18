Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A48DD4AD8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 23:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730520AbfFRVwA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 17:52:00 -0400
Received: from gate.crashing.org ([63.228.1.57]:51590 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729982AbfFRVwA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 17:52:00 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x5ILpmff022036;
        Tue, 18 Jun 2019 16:51:49 -0500
Message-ID: <e3e064d85790a56b661ef9641e02c571540c6f44.camel@kernel.crashing.org>
Subject: Re: [PATCH v4] driver core: Fix use-after-free and double free on
 glue directory
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Muchun Song <smuchun@gmail.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Prateek Sood <prsood@codeaurora.org>,
        Mukesh Ojha <mojha@codeaurora.org>, gkohli@codeaurora.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        zhaowuyun@wingtech.com
Date:   Wed, 19 Jun 2019 07:51:46 +1000
In-Reply-To: <20190618161340.GA13983@kroah.com>
References: <20190516142342.28019-1-smuchun@gmail.com>
         <20190524190443.GB29565@kroah.com>
         <CAPSr9jH3sowszuNtBaTM1Wdi9vW+iakYX1G3arj+2_r5r7bYwQ@mail.gmail.com>
         <CAPSr9jFG17YnQC3UZrTZjqytB5wpTMeqqqOcJ7Sf6gAr8o5Uhg@mail.gmail.com>
         <20190618152859.GB1912@kroah.com>
         <CAPSr9jFMKb1bQAbCFLqP2+fb60kcbyJ+cDspkL5FH28CNKFz3A@mail.gmail.com>
         <20190618161340.GA13983@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 2019-06-18 at 18:13 +0200, Greg KH wrote:
> 
> Again, I am totally confused and do not see a patch in an email that
> I
> can apply...
> 
> Someone needs to get people to agree here...

I think he was hoping you would chose which solution you prefered here
:-) His original or the one I suggested instead. I don't think there's
anybody else with understanding of sysfs guts around to form an
opinion.

Cheers,
Ben.


