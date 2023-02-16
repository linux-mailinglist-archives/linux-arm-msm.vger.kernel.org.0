Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C94C0699C9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 19:48:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbjBPSsE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 13:48:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbjBPSsD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 13:48:03 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CA0F3B209
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 10:48:01 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id i18so2354769ljc.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 10:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5x4srqu8+E5b3lPl8C5EE89hoCZiNAwx02bgGSRJQw=;
        b=mQTa0ihQcGaB/Rl75QKagVoHXYRpKxksf1PYQvf5nUBAIFBuSb5gcM6iAZpV5B+0tJ
         cC8eLkWI8ph1YZtkhhP/UkJchA0VJIw8mTmDFuryyns5UqvDb5FlWwSnDAEYjvbYYwIg
         VCkTp3EvLKnW6yEPTkJShevu2Pub0uhOAD5hU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5x4srqu8+E5b3lPl8C5EE89hoCZiNAwx02bgGSRJQw=;
        b=aPVbZY6hlNG9Xw8ycinS6LiddZ0hkJ84jMJNIrSBwVTVW/BeDpQtAUwIwWVn5nwkob
         Ul/5KvZP28il5g98n5+Edr0PFQIGxADBVWpO2l/6JrLRWZq+oRQqrGGs74ETIA+PpCj4
         A0cAR5mDeIGJP43KXyaOcV/j8H6GNywnKCFIQuldKvMAclQjQCQjJVBVRvBi0/mCQNSz
         P7F0dbG+BtpqEhH3vcnBu2AK9cHLLu2EgqwEKLi2325N1QvH0jhwaKoXzianJdg2oyyp
         IAdEM4uUS7lwbgPVNkM8ry1QQrvSuoolpgj1HQxPITTpS/E0uksZDp5sI5m2spNujOBK
         6PpQ==
X-Gm-Message-State: AO0yUKWhvZ1C6W1Qy5Tik8ewGPDhJ9MG1kVz65QITOIG6SxrJmhiNHlT
        7/qCQFR7xzPmAGt9Er4Ktyl+DH4TqC+sOTsK4BmJ/Q==
X-Google-Smtp-Source: AK7set/5cWL+9RoprxCJpYtDR2RSSrX12B4LkE2SG2Xd4fAB7pBEImjaQVpSdbK7PR/ToOLIvR42vyxy58MgKVn3B1w=
X-Received: by 2002:a05:651c:231b:b0:294:710a:fe63 with SMTP id
 bi27-20020a05651c231b00b00294710afe63mr55807ljb.0.1676573279279; Thu, 16 Feb
 2023 10:47:59 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Feb 2023 19:47:58 +0100
MIME-Version: 1.0
In-Reply-To: <CAE-0n51OSS=Nh2pZmPO3mg4QCvqGZsJ+AFBTAUGr-TZBHCPLCw@mail.gmail.com>
References: <20230213165743.1.I6f03f86546e6ce9abb1d24fd9ece663c3a5b950c@changeid>
 <CAE-0n51OSS=Nh2pZmPO3mg4QCvqGZsJ+AFBTAUGr-TZBHCPLCw@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 16 Feb 2023 19:47:58 +0100
Message-ID: <CAE-0n519PbRr6vzpkK9dL-gEp=QCHYPipZUTAAyC4YfCSpNjPw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7180: Fix trogdor qspi pull direction
To:     Bjorn Andersson <andersson@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     amstan@chromium.org, mka@chromium.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Stephen Boyd (2023-02-15 21:46:52)
> Quoting Douglas Anderson (2023-02-13 16:57:51)
> > Though it shouldn't matter very much, we've decided that it's slightly
> > better to park the qspi lines for trogdor with an internal pulldown
> > instead of an internal pullup. There was a footnote that Cr50 (which
> > connects to these lines too) may have pulldowns configured on one of
> > the data lines and we don't want to have fighting pulls.
>
> Ok.
>
> > This also
> > means that if the pulls somehow get left powered in S3 (which I'm
> > uncertain about) that they won't be pulling up lines on an unpowered
> > SPI part.
>
> As far as I know, the pulls are maintained in S3. There's verbage about
> "keeper" on the pins.
>
> The SPI part is powered in S3 though. I believe it only loses power in
> S5. Can you reword this statement?

I see that we list pp1800_l13a in sc7180-trogdor.dtsi but don't mark it
always on. I suspect it is turned off at late init, but then wifi turns
it on itself because it is the IO voltage for the wcn chip. We're at the
mercy of the wifi firmware here? Shouldn't we just mark it always on and
boot on? I wonder how this is working.
