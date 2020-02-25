Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69AE016E944
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2020 16:03:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730934AbgBYPDd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Feb 2020 10:03:33 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:41724 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730345AbgBYPDc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Feb 2020 10:03:32 -0500
Received: by mail-qk1-f195.google.com with SMTP id b5so5019766qkh.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2020 07:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wAHb7rK639CcDCtnM7iJQZElyiD2uywLhpHa6tq57/0=;
        b=j3YeRKujuPj9zGjGOLEkt6wdH3hlRbWvAzwSpsAFnd+E0Vl11Qkczyj0JZGkg6Rd/d
         OyORz2UcsIwsakv9MMRaOoz/C/BbwKMHNX+pXr3AtBb/VtQ53CsVk5jd5v340Qua6VDw
         Bedv2EeiN5pdEZFaYMTd0GQB1lnUxvpYO8pOg5bT7QO/OU9WQ8naLOVo/67Z56BjwymC
         kDH5k9Hxz+ZkY7KLoxOgPswpMct6k9BAX2ni0w86KyYaNEohu20Ed8BOJuZ8U2M5MFKj
         nacWEMMAjE6jXiWafw8SOxqrluPoCzTYzDOgvLqI2nsE5BlNorCr2l81nYX9/nayT6iB
         PMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wAHb7rK639CcDCtnM7iJQZElyiD2uywLhpHa6tq57/0=;
        b=C4b00ts5uCaZryto0V46Ube0xDGhZkbSC+qUvFZCNE91/q67AznQl3D/gGecUwBWvY
         OwjefJQMIS5HTEKKHSPtleBXeMICrOMX/hO7YHZ9vUXszDtkg8lfF7B5YKVg/fox/USt
         iF34veOSy+nuPwP0c0yssKUk5hgou2U1Z4JVEh7jIiTbfXOUesVEF32Z/ErBkcCKE26w
         aaZpngaC4gY9RXDqxMyZObCy42SxAb7D9UTvwGCnOudPQ3TqWYAvSx5PPcsUIMv9Mt2B
         8MfPMzimKW1rlm3WXuydV0NQlV5E4jP+XnD16zPNJmbIX9rOejzogRfiPn6uCol5ePKw
         LJzg==
X-Gm-Message-State: APjAAAWnXtsWrcLK1yrJK02haybomcnB5ypzWTgPF8E7XHWLT4daFGQc
        80MocByNfHbj1Prtk3nT+UshiEWe5/ezqoPe4Htkow==
X-Google-Smtp-Source: APXvYqzigvoxgWcb3ZmCCwvHRtpN3dxkcq9+kpu7VpR9hQ20upkiH0Yza2Z8PIe6Eb+Flk9FSwpWt8uJ4z71H80aDnk=
X-Received: by 2002:a37:a9c3:: with SMTP id s186mr4972168qke.118.1582643009968;
 Tue, 25 Feb 2020 07:03:29 -0800 (PST)
MIME-Version: 1.0
References: <20200210213924.20037-1-mike.leach@linaro.org> <20200210213924.20037-9-mike.leach@linaro.org>
 <04b739fd-7bb3-bd28-8013-918e7d4dfcb7@arm.com> <20200221165134.GA25043@xps15>
In-Reply-To: <20200221165134.GA25043@xps15>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Tue, 25 Feb 2020 15:03:18 +0000
Message-ID: <CAJ9a7VjJMtftam3t_e25ckOW_dufncbqdLkHeV3G8e7W9K5bCw@mail.gmail.com>
Subject: Re: [PATCH v9 08/15] coresight: cti: Enable CTI associated with devices.
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Andy Gross <agross@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As using devm_... for allocation, there is no need to explicitly free
up tc->con_dev_name, also the lifetime of the connection is linked to
the lifetime of csdev, so we can drop the devm_kstrdup in the csdev
case so this becomes

/* match: so swap in csdev name & dev */
               tc->con_dev_name = dev_name(&csdev->dev);
                tc->con_dev = csdev;
                return true;

Same true for similar link in patch 1, removing 2 un-needed
allocations, leaving 1 to be fixed up with error checking

Mike


On Fri, 21 Feb 2020 at 16:51, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Fri, Feb 21, 2020 at 12:20:17AM +0000, Suzuki K Poulose wrote:
> > Hi Mike
> >
> > Sorry for the delay. one minor comment below.
> >
> > On 02/10/2020 09:39 PM, Mike Leach wrote:
> > > The CoreSight subsystem enables a path of devices from source to sink.
> > > Any CTI devices associated with the path devices must be enabled at the
> > > same time.
> > >
> > > This patch adds an associated coresight_device element to the main
> > > coresight device structure, and uses this to create associations between
> > > the CTI and other devices based on the device tree data. The associated
> > > device element is used to enable CTI in conjunction with the path elements.
> > >
> > > CTI devices are reference counted so where a single CTI is associated with
> > > multiple elements on the path, it will be enabled on the first associated
> > > device enable, and disabled with the last associated device disable.
> > >
> > > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > ---
> > >   drivers/hwtracing/coresight/coresight-cti.c  | 129 +++++++++++++++++++
> > >   drivers/hwtracing/coresight/coresight-cti.h  |   1 +
> > >   drivers/hwtracing/coresight/coresight-priv.h |  12 ++
> > >   drivers/hwtracing/coresight/coresight.c      |  71 +++++++++-
> > >   include/linux/coresight.h                    |   4 +
> > >   5 files changed, 212 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/hwtracing/coresight/coresight-cti.c b/drivers/hwtracing/coresight/coresight-cti.c
> > > index 77c2af247917..c4494923d030 100644
> > > --- a/drivers/hwtracing/coresight/coresight-cti.c
> > > +++ b/drivers/hwtracing/coresight/coresight-cti.c
> > > @@ -4,6 +4,7 @@
> > >    * Author: Mike Leach <mike.leach@linaro.org>
> > >    */
> > > +#include <linux/property.h>
> > >   #include "coresight-cti.h"
> > >   /**
> > > @@ -440,6 +441,131 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
> > >     return err;
> > >   }
> > > +/*
> > > + * Look for a matching connection device name in the list of connections.
> > > + * If found then swap in the csdev name, set trig con association pointer
> > > + * and return found.
> > > + */
> > > +static bool
> > > +cti_match_fixup_csdev(struct cti_device *ctidev, const char *node_name,
> > > +                 struct coresight_device *csdev)
> > > +{
> > > +   struct cti_trig_con *tc;
> > > +   const char *csdev_name;
> > > +
> > > +   list_for_each_entry(tc, &ctidev->trig_cons, node) {
> > > +           if (tc->con_dev_name) {
> > > +                   if (!strcmp(node_name, tc->con_dev_name)) {
> > > +                           /* match: so swap in csdev name & dev */
> > > +                           csdev_name = dev_name(&csdev->dev);
> > > +                           tc->con_dev_name =
> > > +                                   devm_kstrdup(&csdev->dev, csdev_name,
> > > +                                                GFP_KERNEL);
> >
> > In the extreme rare case of an allocation failure, we may want to
> > check if the allocation was successful or not, rather than silently
> > ignoring it. With that fixed,
>
> Line 419 and 423 in patch 1 need the same attention.
>
> >
> > Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>



--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
