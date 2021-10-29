Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD814402CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 21:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbhJ2TGf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 15:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbhJ2TGf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 15:06:35 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B46C061767
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Oct 2021 12:04:05 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id x16-20020a9d7050000000b00553d5d169f7so13203208otj.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Oct 2021 12:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=msvWE2t5mYMtRDZ8I+17Fkh9yjZ5rWivjCZQNykv7fk=;
        b=h8ZNXZO6Y41SOBnORBN6mWRYXD8NiYviTASTihebDxoUBuG4reKkOwBjpj+PhwUfIR
         EV5RM3FzdALQPD4l4MUqP3QJRnMHFt/0jEojgCD2KmkD14HzRAd3+BkSsi/qrM3jG9+U
         JTXeDZrrA9GfjTCcPg4wlcAMDm50yudFoBXYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=msvWE2t5mYMtRDZ8I+17Fkh9yjZ5rWivjCZQNykv7fk=;
        b=FLcJxJa7jnY2gEsQ74cOhNMnwb25yXTvX5Ht828XhhSIY6MpHR6xo96i1eAH5BzfXo
         Kiqrmbh5xufy7066+CgpHDADZbAvkthTosgzzT4zIOdFa7ajRHnDQbDvbzLyr1PmewyK
         XuuS+Hz9uyYIOxP3ChHSwwDZzw8Et9WYiiZSiq2nyTaZ0f1L3x/hGqCbMdOQzgHziWSj
         +0pGNYMqXsu4e2ArP39RjhK1yniR2j1mNVLCOTt2R8gu5ZCOr30ZtU1Ai7iWgrVZC6+1
         OZHAysb0tI2a3qbuecAFG0JYY0Bb9jWXp8Gqu5xusi3PwNV8+5HTpEH3So9YIuRkCRcr
         zy2g==
X-Gm-Message-State: AOAM5307GRSkDKkmyAy2IGf672r7/yTUOfjFXmF29wf64pdZkfLp2wAW
        EFOxFgBW0H6fAOHVzf6rBayxmDZHPPSR0iz/QR/7Qw==
X-Google-Smtp-Source: ABdhPJwejTge5mxVTo1xpsG7+GmYiYIEclbSkYga1ic0Puo/7kWiWy21jY9P4cFhgjzOxE55swj6TqN6+gG4s2vvMTY=
X-Received: by 2002:a9d:7655:: with SMTP id o21mr9902382otl.126.1635534245276;
 Fri, 29 Oct 2021 12:04:05 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 29 Oct 2021 14:04:04 -0500
MIME-Version: 1.0
In-Reply-To: <000201d7ccb2$300dba50$90292ef0$@codeaurora.org>
References: <1635408817-14426-1-git-send-email-pillair@codeaurora.org>
 <1635408817-14426-3-git-send-email-pillair@codeaurora.org>
 <CAE-0n50z=h-avn+K-weZnZFVN7nsR=fLAtge7jFZ0JLx2JvP2w@mail.gmail.com> <000201d7ccb2$300dba50$90292ef0$@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 29 Oct 2021 14:04:04 -0500
Message-ID: <CAE-0n5155J4vvvFES9V5=v+nX3BhZsBgZxkB=uLQOPij=-sf-Q@mail.gmail.com>
Subject: RE: [PATCH v7 2/3] dt-bindings: remoteproc: qcom: Add SC7280 WPSS support
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, ohad@wizery.com,
        p.zabel@pengutronix.de, pillair@codeaurora.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibis@codeaurora.org, mpubbise@codeaurora.org, kuabhs@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting pillair@codeaurora.org (2021-10-29 03:46:03)
>
> > > +
> > > +        glink-edge {
> > > +            interrupts-extended = <&ipcc IPCC_CLIENT_WPSS
> > > +                                         IPCC_MPROC_SIGNAL_GLINK_QMP
> > > +                                         IRQ_TYPE_EDGE_RISING>;
> > > +            mboxes = <&ipcc IPCC_CLIENT_WPSS
> > > +                            IPCC_MPROC_SIGNAL_GLINK_QMP>;
> > > +
> > > +            label = "wpss";
> > > +            qcom,remote-pid = <13>;
> >
> > There are a few properties here that don't seem to be required. Is that
> > intentional?
>
> Hi Stephen,
> All the properties in the example are listed as required (except for status, which will be removed in the subsequent patchset).
> Do you mean the glink-edge node properties ?

Yes I mean all the properties in the glink-edge node. Are they required?
If so then we need to list them in the schema.
