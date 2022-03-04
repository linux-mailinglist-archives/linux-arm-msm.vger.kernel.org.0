Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F9DB4CDF99
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Mar 2022 22:10:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbiCDVJN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Mar 2022 16:09:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbiCDVJM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Mar 2022 16:09:12 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A42555EDF3;
        Fri,  4 Mar 2022 13:08:22 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id r11so6247390ioh.10;
        Fri, 04 Mar 2022 13:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+1nj/bV58T86vRULqYSrk0fp3mH3kwOexdVzL+2xa7w=;
        b=YX5IPyq5QE9LtP9iq6PbsK4mzvMBvB8mrhAWXXcj0suX2NKQWvpWNu8MM+aiSAMN+4
         cg0RHHXNvzkT58+gVV9sc0EUxp1IQjgWzIjFvN/RP1H13Dc1YRYJfzHZ9y2E6le5QnWl
         HCVM3TqiZHd/Aa76l4hMvYB+GE4/8GMj7N0+K84cCS5b0vG89akbi06B8j+YbLO+XM/a
         UkmzpimRg7ImLBqQxCAcR23ooL0W7uMaXFR3kJfmSWgfHGQDQbAtsGoqQj7Z86anWdMr
         5igmCAMSduZNJybkWLSjfrUkKCuOC4+yLZf/wfG39y7aLD02PpPKgasb8ieMaH1agPhB
         SO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+1nj/bV58T86vRULqYSrk0fp3mH3kwOexdVzL+2xa7w=;
        b=m1An4fAOpC0p0zG5XZhVOAU9B5lQ1lpEaoF3c9Jj+m8moIJS8+EwTKJZCIuvmm2N8B
         cP4zY9IRM0wafAa0/tQK5cpoHsZtqmujb6qMiMiJWv5IFXwU/WAhrpQw4OiOqb6a864H
         9PbtVle790kgWuyxvf+pG5qaQJhZbnVx7SU42j62wNbqkQnPl8+k/Gti0mWFq5k9bVPv
         ZH/l5CxEC8yMJiBz9qBg8sM6YH5JQaJw662JVFlo+QA4eW6/BDRAnYkIG9jyAJb98pOj
         R6SvUff/DH/iW2mDr4MYEURa8cJi0oNHGyLeSJcZBIj6hNQp9m/9YORIoBBf8NHh3OcW
         rENQ==
X-Gm-Message-State: AOAM531Lk58mAWzjWHLFgY75WQw9fFrAWOdVHbJDgnkIzr0S12tW7LWC
        izjc6wTvRaZLeLeWt84R349LeUdAr/uGfqCt5qA=
X-Google-Smtp-Source: ABdhPJyukb0Vx+kUt9TMAW1NlYkVkIFyurWnaZA+WD+20odVbv2985f++gTIb7cGMQHG905i7b6xtYPfULHd29MoJ90=
X-Received: by 2002:a02:c850:0:b0:30e:54b4:d8de with SMTP id
 r16-20020a02c850000000b0030e54b4d8demr361728jao.146.1646428102014; Fri, 04
 Mar 2022 13:08:22 -0800 (PST)
MIME-Version: 1.0
References: <20220228131435.29207-1-michael.srba@seznam.cz> <20220228131435.29207-4-michael.srba@seznam.cz>
In-Reply-To: <20220228131435.29207-4-michael.srba@seznam.cz>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Fri, 4 Mar 2022 14:08:11 -0700
Message-ID: <CAOCk7NreHiYdUHMY94YP=emQEy0nMfxuzGC=uCbiUCv6YqBX3w@mail.gmail.com>
Subject: Re: [PATCH v9 4/5] drivers: bus: add driver for initializing the SSC
 bus on (some) qcom SoCs
To:     michael.srba@seznam.cz
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 28, 2022 at 6:18 AM <michael.srba@seznam.cz> wrote:
>
> From: Michael Srba <Michael.Srba@seznam.cz>
>
> Add bindings for the AHB bus which exposes the SSC (Snapdragon Sensor Core)
> block in the global address space. This bus (and the SSC block itself) is
> present on certain qcom SoCs.
>
> In typical configuration, this bus (as some of the clocks and registers
> that we need to manipulate) is not accessible to Linux, and the resources
> on this bus are indirectly accessed by communicating with a hexagon CPU
> core residing in the SSC block. In this configuration, the hypervisor is
> the one performing the bus initialization for the purposes of bringing
> the hexagon CPU core out of reset.
>
> However, it is possible to change the configuration, in which case this
> driver will initialize the bus.
>
> In combination with drivers for resources on the SSC bus, this driver can
> aid in debugging, and for example with a TLMM driver can be used to
> directly access SSC-dedicated GPIO pins, removing the need to commit
> to a particular usecase during hw design.
>
> Finally, until open firmware for the hexagon core is available, this
> approach allows for using sensors hooked up to SSC-dedicated GPIO pins
> on mainline Linux simply by utilizing the existing in-tree drivers for
> these sensors.
>
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>

Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
