Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4263524EF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 03:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234067AbhDBBKh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 21:10:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234029AbhDBBKe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 21:10:34 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70324C0613E6
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 18:10:33 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id x7-20020a17090a2b07b02900c0ea793940so3937863pjc.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 18:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=jXgYMA7YCHDSkhxOIGN+mMtiGXJRf6IQGVRpfhafWXA=;
        b=N19112hWdtQxyfgCcDt0DhZfb4+8mWmRhR7MM3//DSDFmb7rUMs4igONxhRatjxPTM
         SMnEZFtr0w8IPyC7jGOXxGxC/AF/flItO5xuXKily40SRRJ/ncXAZrgBU0IK9oZfkSCC
         KZa7fdxQyGtuy2tZGJUzNeRH8VGT6mkRha5Sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=jXgYMA7YCHDSkhxOIGN+mMtiGXJRf6IQGVRpfhafWXA=;
        b=WJVwvIUQa36ZAEaAQIdvV1UO7m2780TscOOl8k0n6PQt5SHFwIVVsHyBb2awr3LRfN
         1+YHYq0oghJXwSQuG45srDR+NInAwfdEQzivACXlGOURpf/u5jAEmIgfZiBRyqczdvaf
         86M63ymleovP79ll4iRJqNhCK+FHGHmLU71QfxpePIaigPbufEjXB3GicHf+7F2FC1zp
         Pfq0GkQ/GlVbs4e26HVJA4wePQbVPoz/a9kZ5A6da7sNX1pAMhLUno891FUUsYR1JgKo
         0WWIsQSfrFilPKJsYcXCIwrexq0X18Gmi66jzzdbGKXCy5YZA/8upko4dRqu0thIgVE5
         /l0g==
X-Gm-Message-State: AOAM532TqYOqEEBNdFaZR1lbNCsghPkoPRm/gsMUjilNOJ5t6tAr2jOQ
        9DpYPe4WzOYtiZoAajUWEGop9A==
X-Google-Smtp-Source: ABdhPJycw1gGh96FUFq87p46EFqj1fP4tEKbORG/9YP8Yqh+ZkzZ0UsUt+GcKzZ8k5FI1ilZH1VkJQ==
X-Received: by 2002:a17:90a:6e44:: with SMTP id s4mr10949129pjm.112.1617325832870;
        Thu, 01 Apr 2021 18:10:32 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:450:f2a9:b3ca:879f])
        by smtp.gmail.com with ESMTPSA id r23sm6764940pje.38.2021.04.01.18.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 18:10:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <56a657ebc4b843575037e3ba9ec9cb9a@codeaurora.org>
References: <cover.1616651305.git.schowdhu@codeaurora.org> <eeb3cfe92cba2c7981170f3c3ff96dd440b69f25.1616651305.git.schowdhu@codeaurora.org> <161704857307.3012082.499264834486221320@swboyd.mtv.corp.google.com> <56a657ebc4b843575037e3ba9ec9cb9a@codeaurora.org>
Subject: Re: [PATCH V2 3/5] DCC: Added the sysfs entries for DCC(Data Capture and Compare) driver
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, vkoul@kernel.org
To:     schowdhu@codeaurora.org
Date:   Thu, 01 Apr 2021 18:10:31 -0700
Message-ID: <161732583102.2260335.10112716468679763483@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting schowdhu@codeaurora.org (2021-04-01 08:42:50)
> On 2021-03-30 01:39, Stephen Boyd wrote:
> > Quoting Souradeep Chowdhury (2021-03-25 01:02:34)
> >> The DCC is a DMA engine designed to store register values either in
> >> case of a system crash or in case of software triggers manually done
> >> by the user.Using DCC hardware and the sysfs interface of the driver
> >> the user can exploit various functionalities of DCC.The user can=20
> >> specify
> >> the register addresses,the values of which is stored by DCC in it's
> >> dedicated SRAM.The register addresses can be used either to read from,
> >> write to,first read and store value and then write or to loop.All=20
> >> these
> >> options can be exploited using the sysfs interface given to the user.
> >> Following are the sysfs interfaces exposed in DCC driver which are
> >> documented
> >> 1)trigger
> >> 2)config
> >> 3)config_write
> >> 4)config_reset
> >> 5)enable
> >> 6)rd_mod_wr
> >> 7)loop
> >>=20
> >> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
> >> ---
> >>  Documentation/ABI/testing/sysfs-driver-dcc | 114=20
> >> +++++++++++++++++++++++++++++
> >=20
> > Please combine this with the driver patch.
>=20
> Ack
>=20
> >=20
> >>  1 file changed, 114 insertions(+)
> >>  create mode 100644 Documentation/ABI/testing/sysfs-driver-dcc
> >=20
> > Perhaps this should be an ioctl interface instead of a sysfs interface?
>=20
> The reasons for choosing sysfs over ioctl is as follows

Cool, please add these details to the commit text.

>=20
>=20
> i) As can be seen from the sysfs attribute descriptions, most of it does =

> basic hardware manipulations like dcc_enable, dcc_disable, config reset=20
> etc. As a result sysfs is preferred over ioctl as we just need to enter=20
> a 0 or 1
> signal in such cases.
>=20
> ii) Existing similar debug hardwares are there for which drivers have=20
> been written using sysfs interface. One such example is the=20
> coresight-etm-trace driver. Following is the link for reference
>=20
> https://www.kernel.org/doc/html/latest/trace/coresight/coresight-etm4x-re=
ference.html

I wasn't deeply involved but I recall that the whole coresight sysfs
interface was disliked and it mostly got rewritten to go through the
perf tool instead. Pointing to the coresight sysfs API is not the best
approach here.

Maybe a closer analog would be the watchdog subsystem, which is ioctl
based and uses a character device like /dev/watchdog. Watchdogs are
simple debug features that reboot the system when everything goes wrong.
This looks like a hardware block that can be used to gather information
when the watchdog fires.

Reading the doc closer it is quite frightening that a device like this
can let you read registers in the hardware on-demand and even store
values of registers over time. This is like /dev/mem on steroids. This
needs to be highly restricted as it sounds like it could be used to
snoop on security keys that are set in the hardware or secrets stored in
memory. Is the hardware restricted at all in what it can read?
