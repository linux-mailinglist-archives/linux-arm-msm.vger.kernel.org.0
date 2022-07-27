Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35B865827DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jul 2022 15:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233693AbiG0NjQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jul 2022 09:39:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232141AbiG0NjP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jul 2022 09:39:15 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A18033A19
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jul 2022 06:39:15 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id e16so13247117qka.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jul 2022 06:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2QFiCXkJxx739jgPLzShntoxWexyJZMXNXrZLpOZHHc=;
        b=JbCdVgRqKL+Uk7m/7kRGLDKv/rzSbFpfAYZE0yl6HsvBpTbY7idW4B/tXNd5wir9vk
         hvv5RLBXTs2+kuIughwvTsZHiyJdZdz0/a7NQDOtBLtUzWH9X0ClHbdrZ+BkJ6T7qLUo
         SEmvK0tQ9eb0fdQmr8Vdw1WXSVcqdp1/yt6myjLyUmsukc3IzCymaoOFbuahrh65dHEu
         oyTNaywVZJnPuFOmy+l3PwNX4a8B+N19ieCto9w3/SEJZsFYkJYknn5vQUZGnGpRTu52
         K+oCpqgqFhOlVVE7/QerPMpTbXOGqPIqS9YCZmhzfnf9YkchtB6o1Q+LfVqKBbOxyYE0
         kUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2QFiCXkJxx739jgPLzShntoxWexyJZMXNXrZLpOZHHc=;
        b=RrkrMOK1P/lp6lubSFawSJVRghG5llK3gsTsAqSUtMErmev/BU0lfMK1TApOG77la0
         o3uhV1bqzQos5LVHhQW3q/XyDfBj1ApumR4YHIEssdsFrL7MYSneJ5gSLaJQO1I7xcjA
         3nY0ZBSJ3BSMzQWhHkVR+5aMnAK8RP5fedtZdEe0GvKj1ljDYidHL1l4MqVOpSY2ftcG
         HTBvRMukvp3ykSZMm+xzCmD0n1nXrWooI3R6niPsFaf1rGlIj6sslhnS0zEZF715Bil+
         omXukm4HCkJOgH/+jPT4IDC159VYPLtgxyDPHPrQkkJMQQKZpksQXEA8BtVMY9k3lupY
         GnZg==
X-Gm-Message-State: AJIora+cYV5YtxlnaYv0/fU4fGYypjzGFMSSOKv/41MrpQ/Cf8rnUFRu
        AHMCgsmpJ/9t2vX/QHcLdqKKuJ9DZBURhBIDEXTx5g9eXZyvJg==
X-Google-Smtp-Source: AGRyM1voBUoxknVFyqPILlZPKXj50s2zoX+oML6D0mDkVJLzKx23q6u7KvAi+HN/MG4nC9aEI3JVuqX9m0hZQMJ+gdE=
X-Received: by 2002:ae9:f311:0:b0:6b6:30a9:1bb1 with SMTP id
 p17-20020ae9f311000000b006b630a91bb1mr16291367qkg.30.1658929154214; Wed, 27
 Jul 2022 06:39:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAA8EJpr2S-81+q-vjmk5i+T-JwaadkRpjCr_oGi7fMf7o3iH3A@mail.gmail.com>
 <20220727111410.bglx2u26456ray2u@bogus> <CAA8EJprNPJfGjkq2=hexbZn-=t2wKG6ZjSm5Mcbo4JuPQ-sc-A@mail.gmail.com>
In-Reply-To: <CAA8EJprNPJfGjkq2=hexbZn-=t2wKG6ZjSm5Mcbo4JuPQ-sc-A@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 27 Jul 2022 16:39:03 +0300
Message-ID: <CAA8EJpqP9XMcLP+Pmj5OnXD2_SJ9ULBZ_Q492+x56oQnPzqiUA@mail.gmail.com>
Subject: Re: PSCI domains without OSI support
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vinod.koul@linaro.org>,
        Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 27 Jul 2022 at 16:24, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, 27 Jul 2022 at 14:14, Sudeep Holla <sudeep.holla@arm.com> wrote:
> >
> > On Wed, Jul 27, 2022 at 12:09:27PM +0300, Dmitry Baryshkov wrote:

> > > - Allow DTS forcing the PSCI power domains even if OSI enablement fails?
> >
> > Meaning DTS flag for this ? If OSI enable fails, why would you want to
> > still proceed. It is non-compliant and must be fixed if the firmware
> > supports OSI and expects OSPM to use the same.
>
> I'm not sure at this moment. PSCI firmware reports that OSI mode is
> supported, but then when psci_pd_try_set_osi_mode() tries to switch
> into OSI mode, it gets NOT_SUPPORTED.
> Just for the sake of completeness, I added a print to the psci.c to
> dump the result of the psci_set_osi_mode(false). It also returns
> NOT_SUPPORTED!
>
> My logical assumption would be that the firmware reports support for
> OS_INITIATED, but then just fails to properly support
> SET_SUSPEND_MODE.

Okay. From the msm-3.14 commit log:

Add support to terminate all low power modes in PSCI. The lpm-levels will
work with version 1.0 of PSCI specification using the OS initiated scheme.
The lpm-levels driver would determine the last man standing and vote into
TZ accordingly.

Which means that the vendor kernel expected to work in the OSI mode
without calling SET_SUSPEND (such call doesn't exist in 3.14)

So, this looks like the "force-psci-domains" or "ignore-osi-error"
flag would be logical.
The question about testing still holds.

> I should probably try ignoring the error psci-domain.c and continue
> with binding power domains. What would be the best way to check that
> the domains setup works as expected?

-- 
With best wishes
Dmitry
