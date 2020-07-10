Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 583B421C0B9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 01:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbgGJX1s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 19:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbgGJX1r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 19:27:47 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E2CC08C5DD
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 16:27:47 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id x8so2858988plm.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 16:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=1KgjCvGYsPEwY3hIMJvN1I+nBQQMZD4O0k3S1JS7Jzc=;
        b=ZlDt7fatfStgfAIZPJqQmlFZpkGnO9iuPVXSVxTanufGMgMlhHMxUo3jBKYtQE0znR
         SR+WcB3ZwxCGOtVUKtjcgO3ePLoorGRfPXAf8M25lOws0li5gXoYvmem/P6VagpqImRt
         nKL/T8GT3xJGbkcTdHWmqEubc/Zzg+gpv+ePc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=1KgjCvGYsPEwY3hIMJvN1I+nBQQMZD4O0k3S1JS7Jzc=;
        b=UjFz4oxiIh4GONIwYFi71RdVBmr1LYQcU/ZjY/VR498TrVlazPEtaOtxk7lCng7H4b
         2W+g0kYj0XhAa0aXxXWJszzdTkrtBvtX/p+JlJtHXRLR7RvKvSOlGmJfaBXnpovnXArG
         1WfqPVESPHNzTJd7MHqhh2YW4FvQzSSkC0jpJHEYbdmGl3GPe7004kWyLQCUCfY1rYAT
         dQc+lzIrqUorvUvMRSkt4elom/YO3QAjaRmje3HAgZp7mkpJvGYGnkc0LqdZyKBCdfdQ
         6+sIs8rtAktd6cIZ9qh5cfXn1GzkhV8XnR3jFR/Z/9PSFzuaQHHnFgt1lAbmN4q8Ocmv
         EOvw==
X-Gm-Message-State: AOAM532q6aPxv7AF0/Q0hXj0/4klVp2sdKSbmQ16SGT65eYvmn7PGCL4
        i6oppLZkapj1mQ9S4BelbGCB8g==
X-Google-Smtp-Source: ABdhPJwkvHuJGy/BobEJFjeeamXIZFvC9w8oHpTxafgWv0gdfY9kS4v8UzTMQwlP2PwG+JyMcl0n+w==
X-Received: by 2002:a17:90b:23d5:: with SMTP id md21mr8444282pjb.0.1594423667073;
        Fri, 10 Jul 2020 16:27:47 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id o17sm6475469pjq.6.2020.07.10.16.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 16:27:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CALAqxLW14f4Gn6Q3b89X10y7=Zct2NJSgjagUqxez_bObcp42w@mail.gmail.com>
References: <20200625001039.56174-1-john.stultz@linaro.org> <20200625001039.56174-4-john.stultz@linaro.org> <159315737502.62212.16093934831673347066@swboyd.mtv.corp.google.com> <CALAqxLVNGar8g+FvHaVHN_e-MOZZ+=ZPmDt_GKKSC8AS-wLFGg@mail.gmail.com> <87wo3setn8.wl-maz@kernel.org> <159436097057.1987609.13993891118929459851@swboyd.mtv.corp.google.com> <CALAqxLW14f4Gn6Q3b89X10y7=Zct2NJSgjagUqxez_bObcp42w@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] irqchip: Allow QCOM_PDC to be loadable as a permanent module
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Marc Zyngier <maz@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        iommu@lists.linux-foundation.org, linux-gpio@vger.kernel.org
To:     John Stultz <john.stultz@linaro.org>
Date:   Fri, 10 Jul 2020 16:27:45 -0700
Message-ID: <159442366514.1987609.434612639050774557@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting John Stultz (2020-07-10 15:44:18)
> On Thu, Jul 9, 2020 at 11:02 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Does it work? I haven't looked in detail but I worry that the child
> > irqdomain (i.e. pinctrl-msm) would need to delay probing until this
> > parent irqdomain is registered. Or has the hierarchical irqdomain code
> > been updated to handle the parent child relationship and wait for things
> > to probe or be loaded?
>=20
> So I can't say I know the underlying hardware particularly well, but
> I've been using this successfully on the Dragonboard 845c with both
> static builds as well as module enabled builds.
> And the same patch has been in the android-mainline and android-5.4
> kernels for a while without objections from QCOM.
>=20
> As to the probe ordering question, Saravana can maybe speak in more
> detail if it's involved in this case but the fw_devlink code has
> addressed many of these sorts of ordering issues.
> However, I'm not sure if I'm lucking into the right probe order, as we
> have been able to boot android-mainline w/ both fw_devlink=3Don and
> fw_devlink=3Doff (though in the =3Doff case, we need
> deferred_probe_timeout=3D30 to give us a bit more time for modules to
> load after init starts).
>=20

Ok I looked at the code (sorry for not checking earlier) and I see this in
msm_gpio_init()

        np =3D of_parse_phandle(pctrl->dev->of_node, "wakeup-parent", 0);
        if (np) {
                chip->irq.parent_domain =3D irq_find_matching_host(np,
                                                 DOMAIN_BUS_WAKEUP);
                of_node_put(np);
                if (!chip->irq.parent_domain)
                        return -EPROBE_DEFER;

so it looks like we'll probe defer the pinctrl driver until the pdc module
loads. Meaning it should work to have pinctrl builtin and pdc as a module.
