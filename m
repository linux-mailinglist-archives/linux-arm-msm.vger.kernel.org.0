Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBE520971E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 01:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388735AbgFXXW0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 19:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388737AbgFXXWZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 19:22:25 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F627C061795
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 16:22:24 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id n5so3621070otj.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 16:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ixR4kIucjZXiRtwMzxKSRPAHfL+FLubXnd+GvW1h77s=;
        b=Z7YPQvc6norraPne8OACkSUlKBVmLzg0FP9LZ7gduh3U4fiXJckSxRV8Rw/M6ozRWJ
         CjO2/AkaXd9R+o9hVzdrRw1hQuKb2mCZ1GENwhRmQMvXPb4YogDL9Anl/z4vNHibhS7O
         NK3IrFNQK8cYxuy21niT7Scw64KVhXT99fgZQNoQLHaS4zd3qSpDwRBNF69Va9CI3Su1
         XOZeXBH0cz4qgxb4LruxmpvoG9P53uUpxNMeGz+7XTSEjo/48iNu+ULMKQcpWyfIRnzG
         WGAjrfnyEm3aD+QzMcQW7ICI5L5cy+GzJeuU+I+SuwLYvFoAuMEzV69tL1xuT3vPCjHY
         qcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ixR4kIucjZXiRtwMzxKSRPAHfL+FLubXnd+GvW1h77s=;
        b=uWtQmAXgXjlnQU867fxVmQdz9Xmx//AE21mYO6JAvhayd/DMU0diP4UylZKWGNsfIw
         HA9l6jRzGQZXsxf2oAta3FASCTEEk3HzYd+XhviL45dwWxCqJT/Ir78H7Cx7e/9vnu2l
         o8GRJ9ea+kSKuARD6GM0O7uK/qDXeqZRcfTt9/YQrL2QK3v4WSQfXWkrOkMqwQ8d6Lv9
         3eXEN/B6SWrU/kQ59m42IIeN2DCz3pd4NVBtt034+j79Kc2sXewvSAt55eQpNDiILKJs
         YCX5bwz68Awc3ccs9+e0+fjfhyQNaOKywNapQzZIUIG5BG62irNWCYtCZAEiMP7GATNh
         +6UA==
X-Gm-Message-State: AOAM533Z2i0yr55kUnChO1eWnnLjeGd0mRvjBlYys/JQYFdZ6KyCvcU1
        AyoHcXMi11QBQMiJKG132E/o57zx2pZArY/iilXxng==
X-Google-Smtp-Source: ABdhPJyDeT0KDPGBY+XrtAn4IpWyHShWZgknfbRvrpyv5ICBQ0JbfIvQE3n6cpvnMFZ4tsBYi4nHf3OPeZeTeb/2RbY=
X-Received: by 2002:a05:6830:1e13:: with SMTP id s19mr9494408otr.102.1593040943632;
 Wed, 24 Jun 2020 16:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200616061338.109499-1-john.stultz@linaro.org>
 <20200616061338.109499-5-john.stultz@linaro.org> <20200621060055.GA2421@builder.lan>
In-Reply-To: <20200621060055.GA2421@builder.lan>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 24 Jun 2020 16:22:12 -0700
Message-ID: <CALAqxLUhi4qQpz5b+6hc8T5mA2E6ugg6UD44WA+Dc2+=Hjm=DQ@mail.gmail.com>
Subject: Re: [RFC][PATCH 4/5] pinctrl: qcom: Allow pinctrl-msm code to be
 loadable as a module
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        iommu@lists.linux-foundation.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jun 20, 2020 at 11:03 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 15 Jun 23:13 PDT 2020, John Stultz wrote:
>
> > Tweaks to allow pinctrl-msm code to be loadable as a module.
> > This is needed in order to support having the qcom-scm driver,
> > which pinctrl-msm calls into, configured as a module.
> >
>
> This means that we need a "depends on QCOM_SCM || QCOM_SCM=n" on all
> entries in the Kconfig that selects PINCTRL_MSM, or switch PINCTRL_MSM
> to be user selectable and make all the others depend on it.

Oh, good point! I already had to fix that in a different tree, but
forgot to move the fix over to my upstreaming tree.


> >
> > +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. pinctrl-msm driver");
>
> It's the "Qualcomm Technologies, Inc. TLMM driver"
>
> > +MODULE_LICENSE("GPL v2");
> > +
>
> Please don't retain my empty line at the end of this file :)

Done and done. Thanks so much for the review!
-john
