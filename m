Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0DAA2DA44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 12:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbfE2KUQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 06:20:16 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:42395 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbfE2KUQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 06:20:16 -0400
Received: by mail-ed1-f65.google.com with SMTP id g24so2901932eds.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2019 03:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P8ka2+bxJnQPHb/IDd/VfordB+PMGKVkIhugicMFKzs=;
        b=XF+w9RV8bhJ3242HapwUEBakMNiXppxTlsihA2p7lAIRWwmJsCx0hhPZCepOCjFsN1
         /k9+CAuTYW5fkvDD/AvswXCFo1YqlfRAqMQtGXh90GRGaZVtDThf7+IafnrGPJdXCIMc
         LC6U3LXPs6sdgBaFPhmsnpQeAegkVOUyqnlwW5KsRlxCJ7mxppAz8d3d8Fof3KKUpQTv
         YRAm+kTWfBUN9WrixQ1xaQAPGP5ebSLPzY7mUkcFxQ8R1NAfDSHGziSOkFuWA/+X7l8D
         m+50IZEhJ5i6P130neqYbJ/aZ2HtjIZjB5oSdCJk9ldke/rxepiZHhVD99yN0v3cDJTp
         K61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P8ka2+bxJnQPHb/IDd/VfordB+PMGKVkIhugicMFKzs=;
        b=owo48SDoKnpV2KMwsQsHST3w6apWDKdQXYLtRxHWiz92VjtiH9sX+toK6J6o2M+AVX
         C6xb4VkGg74CEJi3modSjf3Nix10hsHgJ3YCoD43s/RgZtYI573K6TF7YelcqcBBMU+g
         TAw7UvVhxbWqHW7w0CR73BzIjBUSWZUFwJZaK03o/th6o1DXRmcwcu7z/BbjYr85we6I
         eiQlNQt9jUlC2j1cQZY9sMgeSq3y43MrMeCGBE9a3xAhcYmgNnlWzmRSBYSL8EIzDpLs
         Gt5p905n3HTZq0vBc2BQXgHykb1Zd71StKLFPPF99sMSTs28+CPhpTXBh0yssSDgpKfd
         8/8Q==
X-Gm-Message-State: APjAAAXyidXERxhGgIEGuv/FXyuYu8bu2EkjbRFuAwXBBfnbzfmzLblR
        s4ucKIjhiEi0U2Yc+9JqQ0V+L7xkx84phE875CbQSg==
X-Google-Smtp-Source: APXvYqyyuOSJwMbRE0IpyZJFEqQayTJn6ZPM2g7Hnz25efVf4lIFAuyvYRNa40rcFHDxIOdG/4ZlgZhZziVx5rAJ1jw=
X-Received: by 2002:a50:8877:: with SMTP id c52mr135002894edc.253.1559125214798;
 Wed, 29 May 2019 03:20:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190508021902.10358-1-leo.yan@linaro.org> <20190529101445.GC15808@leoy-ThinkPad-X240s>
In-Reply-To: <20190529101445.GC15808@leoy-ThinkPad-X240s>
From:   Chunyan Zhang <zhang.chunyan@linaro.org>
Date:   Wed, 29 May 2019 18:20:03 +0800
Message-ID: <CAG2=9p94C+1dv2rYNQ++hMM=e8kCz-7QJ6K6USdrnqp-qa9Ucg@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] dts: Update DT bindings for CoreSight replicator
 and funnel
To:     Leo Yan <leo.yan@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mike Leach <mike.leach@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, Guodong Xu <guodong.xu@linaro.org>,
        Zhangfei Gao <zhangfei.gao@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Chris Healy <cphealy@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 29 May 2019 at 18:14, Leo Yan <leo.yan@linaro.org> wrote:
>
> On Wed, May 08, 2019 at 10:18:51AM +0800, Leo Yan wrote:
> > Since the DT bindings consolidatoins for CoreSight replicator and funnel
> > is ready for kernel v5.2 merge window [1], this patch set is to update
> > the related CoreSight DT bindings for platforms; IIUC, this patch set
> > will be safe for merging into kernel v5.2 because the dependency
> > patches in [1] will be landed into mainline kernel v5.2 cycle.
>
> [...]
>
> > Leo Yan (11):
> >   ARM: dts: hip04: Update coresight DT bindings
> >   ARM: dts: imx7s: Update coresight DT bindings
> >   ARM: dts: qcom-apq8064: Update coresight DT bindings
> >   ARM: dts: ste: Update coresight DT bindings
> >   ARM: dts: vexpress-v2p-ca15_a7: Update coresight DT bindings
> >   ARM: dts: qcom-msm8974: Update coresight DT bindings
> >   arm64: dts: hi6220: Update coresight DT bindings
> >   arm64: dts: juno: Update coresight DT bindings
> >   arm64: dts: qcom-msm8916: Update coresight DT bindings
> >   arm64: dts: sc9836: Update coresight DT bindings
> >   arm64: dts: sc9860: Update coresight DT bindings
>
> Gentle ping for maintainers.
>
> Hi Andy, David,
>
> Could you pick up patches 03, 06, 09/11 for QCOM DT bindings?
>
> Hi Sudeep,
>
> Could you pick up patches 05, 08/11 for Arm DT bindings?
>
> Hi Chunyan, Orson, Baolin,
>
> Could you pick up patches 10, 11/11 for Unisoc DT bindings?

Sure, will do.

Thanks,
Chunyan

>
> Thanks a lot for Shawn and Linus have picked up 02, 04/11 separately.
>
> Thanks,
> Leo Yan
