Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A85321B979
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 17:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgGJP3Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 11:29:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:52136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726832AbgGJP3N (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 11:29:13 -0400
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5DABB2078B;
        Fri, 10 Jul 2020 15:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594394952;
        bh=A+5H0viLCweISXKhZ8vukjCT/YthyI0T6G22a0E9wP0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mJsAbAS7bLMR4MIKisf/3VlNypxyehVH+9BwAL4A4vgISOkEiO6mGXdKX087waoJM
         fyUO+PMEDS/T576yL6+oEmzLMT21Vq1DkfIV7JjxQFNTP3kaUzxAWsgrpi1PQNmyPC
         jsxswVgDNeMI9i5IR6BIIRWOGeip8p5Yl6Flv5Os=
Received: by mail-ot1-f49.google.com with SMTP id w17so4484408otl.4;
        Fri, 10 Jul 2020 08:29:12 -0700 (PDT)
X-Gm-Message-State: AOAM533Aq/iK9eQH0XZXrhV8qwP7QjNqV2XkdVEMpAeHXBi50pNdC2aV
        ae/T9hr6SlPvkQans2HoeSRhMxYVu8y3upULtA==
X-Google-Smtp-Source: ABdhPJxgp0IgRa0RKnSG7bJrUjnRw1wt0F8ZA2+d85ACmCNg+Fh7mRY7d4DZzaL2DFznGG81bchkn3CjCx5gorcXI3Y=
X-Received: by 2002:a05:6830:3104:: with SMTP id b4mr59510659ots.192.1594394951793;
 Fri, 10 Jul 2020 08:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <ce0d7561-ff93-d267-b57a-6505014c728c@infradead.org>
In-Reply-To: <ce0d7561-ff93-d267-b57a-6505014c728c@infradead.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 10 Jul 2020 09:28:59 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+AWo6xP1vC1NubFcdWzoX4hVvSW4KGry1NhOXUieDrSA@mail.gmail.com>
Message-ID: <CAL_Jsq+AWo6xP1vC1NubFcdWzoX4hVvSW4KGry1NhOXUieDrSA@mail.gmail.com>
Subject: Re: [PATCH -next] <linux/of.h>: add stub for of_get_next_parent() to
 fix qcom build error
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 29, 2020 at 10:43 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix a (COMPILE_TEST) build error when CONFIG_OF is not set/enabled
> by adding a stub for of_get_next_parent().
>
> ../drivers/soc/qcom/qcom-geni-se.c:819:11: error: implicit declaration of function 'of_get_next_parent'; did you mean 'of_get_parent'? [-Werror=implicit-function-declaration]
> ../drivers/soc/qcom/qcom-geni-se.c:819:9: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
>

Fixes tag?

> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> ---
>  include/linux/of.h |    5 +++++
>  1 file changed, 5 insertions(+)

I'm assuming this will be applied to the tree that introduced the problem.

Acked-by: Rob Herring <robh@kernel.org>
