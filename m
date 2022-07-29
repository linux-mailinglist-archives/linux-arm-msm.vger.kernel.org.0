Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6015851DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Jul 2022 16:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235283AbiG2O4B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Jul 2022 10:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236796AbiG2O4A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Jul 2022 10:56:00 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4202165B5
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Jul 2022 07:55:58 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id f14so3814964qkm.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Jul 2022 07:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LU2jKHS2Nm/7auV+iXP7l5+JlImO2zH8Ua3fe+uAhns=;
        b=OZNDxgLZk8wvXTdP85PMsUJiFJIIaXj4v3T3Ey2Nov8fiANefz2/gBDsigiFOapewA
         fMI6JTAspaRMOntcwIsXngHPqho4GhdgPVPGySVXZWPoXd0tppemhOuBAL6EUiLwb8Ag
         6MBpafWXpbKCQBGt0HQIBSQaUXOV2bJJ4U8QYvty6YaxmUP+V69cwI76abBIGId6rcG8
         2J3nW+bleIJQvESYr6Qk5E73UinO/6hd2LC2T/ENHI4dXFHYNcLJv3vXe5J01rRRQRto
         PmRJf1K9hWUMiG0NZ1c1k8z5Qfq4lXYyKzCfADSTjLrJJ/6ZEMd1Du9tH6Zqg5WqZ+E1
         AvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LU2jKHS2Nm/7auV+iXP7l5+JlImO2zH8Ua3fe+uAhns=;
        b=eGqJ/La4Hawl44C5ve1/uhUwQVJTohIDZKqJZDl5UeIPgK4YHdb+bwdq8xYne/BQq6
         zbMlFwUPZiYU1wLL3iearQ+Pz/inPgD2NH5nvG6Wyvpcr3d3Q05+HJ56jZn8Oy2C5Cga
         jaeeYPu8Mwg2UsJ8Gn8SL5OWXbxEJzPfg7aXv2GcdJ3hNHn5KtKbmlMX/INBRQvJ+6lK
         ky74zwx/6h6NerCckx6/m+xzan/1tgQhUwZFNubYBzkgVm1ZxaR4Fpqc9aBRzjZ1QhGt
         JFHTGuCHhbLRvcA4iOcugw05ubb0IsE3swvM7XwO/iueB6Uj4QocDmTUxy8278Co7hQ3
         aBNA==
X-Gm-Message-State: AJIora95xobIEkBihOoq2wYHnAdDogFTxaZJGT4C4syESzyq30Da0QjW
        Yc4NXEKFUmfn5dOzxe/qW09gRH2olqdZf4UvKFd8AGBzR0g=
X-Google-Smtp-Source: AGRyM1uwfw5+ktHeTJCgth0/QP6b+8gJhL4OadszNPMbvavG0KWq6WmdZnKKeu+eI7Idy2MZJbV2Kx0JdGducq73Kac=
X-Received: by 2002:ae9:e906:0:b0:6b5:f0ec:ed92 with SMTP id
 x6-20020ae9e906000000b006b5f0eced92mr2964676qkf.59.1659106557689; Fri, 29 Jul
 2022 07:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220727200901.1142557-1-dmitry.baryshkov@linaro.org> <YuKRPB/Ilb0al3ro@sirena.org.uk>
In-Reply-To: <YuKRPB/Ilb0al3ro@sirena.org.uk>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 29 Jul 2022 17:55:46 +0300
Message-ID: <CAA8EJpqKXoLNKEyfSrUoABFwPqqZT5reiAJ5muGz-+FUwxzUcg@mail.gmail.com>
Subject: Re: [PATCH] firmware/psci: Add debugfs support to ease debugging
To:     Mark Brown <broonie@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 28 Jul 2022 at 16:38, Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Jul 27, 2022 at 11:09:01PM +0300, Dmitry Baryshkov wrote:
>
> > +} psci_fn_ids[] = {
> > +     PSCI_ID_NATIVE(0_2, MIGRATE),
> > +     PSCI_ID(0_2, MIGRATE_INFO_TYPE),
> > +     PSCI_ID_NATIVE(0_2, MIGRATE_INFO_UP_CPU),
> > +     PSCI_ID(1_0, CPU_FREEZE),
> > +     PSCI_ID_NATIVE(1_0, CPU_DEFAULT_SUSPEND),
> > +     PSCI_ID_NATIVE(1_0, NODE_HW_STATE),
> > +     PSCI_ID_NATIVE(1_0, SYSTEM_SUSPEND),
> > +     PSCI_ID(1_0, SET_SUSPEND_MODE),
> > +     PSCI_ID_NATIVE(1_0, STAT_RESIDENCY),
> > +     PSCI_ID_NATIVE(1_0, STAT_COUNT),
> > +     PSCI_ID_NATIVE(1_1, SYSTEM_RESET2),
> > +};
>
> There's other functions like the MEM_PROTECT ones which we don't
> currently use but it might be interesting to enumerate...

Argh, missed the next page in PSCI spec. Will fix in v2.

>
> >  #define PSCI_1_0_FN_PSCI_FEATURES            PSCI_0_2_FN(10)
> > +#define PSCI_1_0_FN_CPU_FREEZE                       PSCI_0_2_FN(11)
> > +#define PSCI_1_0_FN_CPU_DEFAULT_SUSPEND              PSCI_0_2_FN(12)
>
> ...we're already adding functions here.
>
> > +#define PSCI_1_0_FN_NODE_HW_STATE            PSCI_0_2_FN(13)
>
> > +#define PSCI_1_0_FN_STAT_RESIDENCY           PSCI_0_2_FN(16)
> > +#define PSCI_1_0_FN_STAT_COUNT                       PSCI_0_2_FN(17)
>
> Some of these state query things might be interesting to actually call
> and output results from at some point, doesn't seem like something that
> should be a blocker though.

I thought about it, but deferred for now.

-- 
With best wishes
Dmitry
