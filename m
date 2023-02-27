Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CAAC6A46C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Feb 2023 17:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbjB0QKo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Feb 2023 11:10:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjB0QKo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Feb 2023 11:10:44 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8C2821A02
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 08:10:41 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id m22so2341971ioy.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 08:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IDYao4+klqBlSHhE2pkjIhJjL+MuNJUDI23FLbU6dUE=;
        b=mstgBzaiAVkACCuOMLp/3Dm8yNAa7Mwz9HyjdOlTalcAEs33vqm7hoMmEdunIx8+Ph
         jnva3xFwWoCLp7wb33LqhUt4eOovHJI5pqheILP/D2MTbeVx4tnF1tVSdrB9VwugoGUs
         oSetSr1v8KpT9TygcF1lVH47q+DYWFhJbRtXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IDYao4+klqBlSHhE2pkjIhJjL+MuNJUDI23FLbU6dUE=;
        b=KhRz5XjIaqgx8u/k3svhmqenBcgGN8AkGTD5Ke5vHTWq8KTbnobhDdpSlem/Hao1PS
         RjLJ/wfSA8taoMuTvyYfV+WM38/QaCW7rIkxlCuaGpcdk3Ni5jDmwyoJaiI4XATVXwrF
         Y3Q+XgyPARmOvMZvDb2vG46iyGezxA/cAMfJKd39JHqIsWkAsLKH6qzeQlj14HInNqjZ
         yydw9pLqKj7s1Drj4BX3/oYtMYPkS5EuuESzvOk/ZF+6qTDPgWQYIw8h4uXKTbRPsmsE
         c13z7SwXTJ+L3FXu0tnIkiXBFtZm07Gegm+bhTMg9osv0V828vcn7RhxFL/Th876D7JW
         QUfA==
X-Gm-Message-State: AO0yUKVS6u87c9AIPeSqTORGPTJn2xyP+R/Zbli5+4XQl4WIKznZnUvL
        l2WygMk8Zh8EbclhTNPzyJ0z5t/2gvf14YXk
X-Google-Smtp-Source: AK7set8dz9+u1JqVUnqnB4WdvmgepHw9aytLw1OHCsrts2jTzlFwD0b5OurIvg5gRuJlZghWN9ZtPQ==
X-Received: by 2002:a6b:e705:0:b0:74c:8a51:ecf7 with SMTP id b5-20020a6be705000000b0074c8a51ecf7mr16812661ioh.11.1677514240936;
        Mon, 27 Feb 2023 08:10:40 -0800 (PST)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id n3-20020a92dd03000000b003158e48f1e9sm2067183ilm.60.2023.02.27.08.10.39
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 08:10:40 -0800 (PST)
Received: by mail-io1-f44.google.com with SMTP id bf15so2736665iob.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 08:10:39 -0800 (PST)
X-Received: by 2002:a6b:ac06:0:b0:745:6c2f:61dd with SMTP id
 v6-20020a6bac06000000b007456c2f61ddmr6111510ioe.2.1677514239445; Mon, 27 Feb
 2023 08:10:39 -0800 (PST)
MIME-Version: 1.0
References: <20230215071649.9078-1-quic_mkshah@quicinc.com> <20230227153848.auqs4e5hf2qmwmg2@ripper>
In-Reply-To: <20230227153848.auqs4e5hf2qmwmg2@ripper>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 27 Feb 2023 08:10:27 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UK9zyQ=Mg3BaVCwOGBG3G7rW2pdpMFtGptR88p8ce9kg@mail.gmail.com>
Message-ID: <CAD=FV=UK9zyQ=Mg3BaVCwOGBG3G7rW2pdpMFtGptR88p8ce9kg@mail.gmail.com>
Subject: Re: [PATCH 0/1] Use PSCI OS initiated mode for sc7280
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Maulik Shah <quic_mkshah@quicinc.com>, ulf.hansson@linaro.org,
        swboyd@chromium.org, wingers@google.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_lsrao@quicinc.com, quic_rjendra@quicinc.com,
        Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Feb 27, 2023 at 7:35=E2=80=AFAM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Wed, Feb 15, 2023 at 12:46:48PM +0530, Maulik Shah wrote:
> > This change adds power-domains for cpuidle states to use PSCI OS
> > initiated mode for sc7280.
> >
> > This change depends on external project changes [1] & [2] which are und=
er
> > review/discussion to add PSCI os-initiated support in Arm Trusted Firmw=
are.
> >
> > I can update here once the dependency are in and change is ready to mer=
ge.
> >
>
> Please do, I will drop this from the queue for now.

I'm a bit confused about why we're doing this. There's always been a
question about exactly why we need OSI mode. As far as I can tell it
can't be for "correctness" reasons because we managed to ship sc7180
without OSI mode. ...so I guess somehow the argument is that OSI mode
is more performant in some cases? Are there actual numbers backing
this up, or is it all theoretical? Before making such a big change, it
would be good to actually understand what the motivation is and see
real data. This should be easy to collect since we currently have
things working without OSI and (presumably) you have OSI working. It
would also be good to document this motivation in the commit message
and/or cover letter.

-Doug
