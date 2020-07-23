Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7AF22B6D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 21:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbgGWTgK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jul 2020 15:36:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726021AbgGWTgK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jul 2020 15:36:10 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2084DC0619E2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2020 12:36:10 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id gc15so4725346pjb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2020 12:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=T9S8E8lvuZVVhYPajIXC6YC8Nh7x5PkiYERMVvcqyEs=;
        b=SXDFQt7wkm9KO+tDx44s0AgqKKzsE36eUwC1LuHXeojB2lpkq/9cLhiToMZj01mQGD
         vQiKIx6SRzaSxWdUmaQnzI288H8yf4Xznsf+IfaodJFoLUgYXdGmmqJj/9s/8TfrFJFN
         W7eywATU9UFEQyi5Ixkmlhkz3n1wM2zA2zNJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=T9S8E8lvuZVVhYPajIXC6YC8Nh7x5PkiYERMVvcqyEs=;
        b=kxDx0Yb6ehfYRgj2Gp/rqHD2+dqwSWhPRDmMLtm4JBUQWf9aUD19o2Wz5DDS10ttOA
         oRiixPfdU0V+Vn+7W9X+ug6SP3DfIc7X/42oq02hmmNowr5sbtuZkBb+9hbVM7aYvdbg
         Hn98+UpmSkV1dgGtRu6mhD3d2hSQ6xecJlKGUpY725uCr1W1ntKYqhmiV0c+EOMmKgCr
         NP2cy3E8xGdaRRG0CQouAuql7yO7jzSz11JSl3EWL5diaAJxP4G1XQ5gWxusOsI0c4XM
         W0wREIdjC9PN04o6YNGxza4hcJ1/d7TS9nms9D0EdAR4IbAr4kV2kTvcqpemts9XYz6U
         gVyg==
X-Gm-Message-State: AOAM530KULXlP2Ak+r/NSpKI/whPvMNV0Th3lMawIuNFanv12/cnhGij
        B0NgV4FC1VgefTI+Q81u0ViWRDUrCK8=
X-Google-Smtp-Source: ABdhPJw1PsgScfvulQgiZ4vJgl6Oix6y6KGjvzt4a9BmQeotaYAhYvf6y1Ff801Qri/swwX/hWr/cQ==
X-Received: by 2002:a17:902:7683:: with SMTP id m3mr5136340pll.182.1595532969562;
        Thu, 23 Jul 2020 12:36:09 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id n14sm4087042pgd.78.2020.07.23.12.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 12:36:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200723174254.GF9185@codeaurora.org>
References: <20200723010137.3127584-1-swboyd@chromium.org> <20200723174254.GF9185@codeaurora.org>
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Sleep waiting for tcs slots to be free
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>
Date:   Thu, 23 Jul 2020 12:36:08 -0700
Message-ID: <159553296815.3847286.2798719474122080066@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lina Iyer (2020-07-23 10:42:54)
> On Wed, Jul 22 2020 at 19:01 -0600, Stephen Boyd wrote:
> >The busy loop in rpmh_rsc_send_data() is written with the assumption
> >that the udelay will be preempted by the tcs_tx_done() irq handler when
> >the TCS slots are all full. This doesn't hold true when the calling
> >thread is an irqthread and the tcs_tx_done() irq is also an irqthread.
> >That's because kernel irqthreads are SCHED_FIFO and thus need to
> >voluntarily give up priority by calling into the scheduler so that other
> >threads can run.
> >
> >I see RCU stalls when I boot with irqthreads on the kernel commandline
> >because the modem remoteproc driver is trying to send an rpmh async
> >message from an irqthread that needs to give up the CPU for the rpmh
> >irqthread to run and clear out tcs slots.
> >
> Would this be not better, if we we use a threaded IRQ handler or offload
> tx_done to another waitqueue instead of handling it in IRQ handler?
>=20

Are you asking if jitter is reduced when the rpmh irq is made into a
threaded irq? I haven't done any benchmarking to see if it improves
things.
