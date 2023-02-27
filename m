Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5ECE6A4BBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Feb 2023 20:54:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbjB0TyU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Feb 2023 14:54:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjB0TyS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Feb 2023 14:54:18 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 224232887F
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 11:53:52 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id b10so7784534ljr.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 11:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1677527625;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Iog3w5RRep9QzX37UOT5VU6YtZPIJP1phd7Cipxg/4=;
        b=MlrScDn0uLRC083HdGy5QHOQFhYZ0UhHe8h98ssx4wE9iG2IlU14pW+svk1bwuUUXh
         lmtOrZ6TQLAstp4sXJgny76pWW++iPT2/N4XgNoaAf8qXxmrxDckPD8YuKhA56ZQADXO
         5iufKDnd0bCNkJlQHhteTngGIXOEme+n5fX80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677527625;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Iog3w5RRep9QzX37UOT5VU6YtZPIJP1phd7Cipxg/4=;
        b=gZgB16jZIM8LH1ZGkwMFM3x+GFlbSFpV89NdjmlxJXw5A1n/t3OR3j/PcbxwAL09Wd
         X8XpqB7hEc6qvxqh0eFHzgXgLioIxJOv3UuUu9/UrsvaArWFsD8M/zUtUf8JF/JJsTc6
         VeV72XNt5BTSAstCqX/bSnQLJVCK0nYSCEVWPypOxijAsQYEG7oqJm8iP57l2bjku4ZJ
         vRDjDwG75baoLashaQdMXReUkmowQZZ44oUyiEIuWVdz3umh17CsJ8JXjHzkO6ZJAWTW
         mm7BpnIkcCcaUHhRHaVkk9yAIrSWdJWQn1IcynHZgieLi5AvXE2kdvR1lua7o6JdMqgb
         bDXg==
X-Gm-Message-State: AO0yUKXdGTOibQIvkqMZeCSN9UbfWcQVEErMfbTbovLqgn6TkXwUaeGM
        kFpk/eNJf6/23eZObWPy/jG6SlFmNOcJaqaNPtfseQ==
X-Google-Smtp-Source: AK7set9u/nN5Vzao374dais8uxKf3RxzP5pIYQ6lkrJ2r0ZXV/mqpKtvXzlYxqTmuIGQ+TLof9Pu75FYo+aKuNXKi3U=
X-Received: by 2002:a2e:a4b7:0:b0:295:897c:6f7a with SMTP id
 g23-20020a2ea4b7000000b00295897c6f7amr6940229ljm.0.1677527624730; Mon, 27 Feb
 2023 11:53:44 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Feb 2023 14:53:44 -0500
MIME-Version: 1.0
In-Reply-To: <1677263398-13801-1-git-send-email-quic_khsieh@quicinc.com>
References: <1677263398-13801-1-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 27 Feb 2023 14:53:44 -0500
Message-ID: <CAE-0n514WpXDhE17DzqF9X7DYg_3DYuYSGzhvx-=eXVJpgq3Yg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: check core_initialized flag at both
 host_init() and host_deinit()
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@gmail.com, andersson@kernel.org, daniel@ffwll.ch,
        dianders@chromium.org, dmitry.baryshkov@linaro.org,
        robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2023-02-24 10:29:58)
> There is a reboot/suspend test case where system suspend is forced during
> system booting up. Since host_init() of external DP is executed at hpd

dp_display_host_init()?

> thread context, this test case may created a scenario that host_deinit()

dp_display_host_deinit()?

> from pm_suspend() run before host_init() if hpd thread has no chance to
> run during booting up while suspend request command was issued.
> At this scenario system will crash at aux register access at host_deinit()
> since aux clock had not yet been enabled by host_init().  Therefore we

The aux clk is enabled in dp_power_clk_enable() right? Can you clarify?

> have to ensure aux clock enabled by checking core_initialized flag before
> access aux registers at pm_suspend.

I'd much more like to get rid of 'core_initialized'. What is preventing
us from enabling the power (i.e. dp_power_init()), or at least enough
clks and pm runtime state, during probe? That would fix this problem and
also clean things up. As I understand, the device is half initialized in
probe and half initialized in the kthread. If we put all power
management into the runtime PM ops and synced that state during probe so
that runtime PM state matched device probe state we could make runtime
PM be the only suspend function and then push the power state tracking
into the device core.

>
> Fixes: 989ebe7bc446 ("drm/msm/dp: do not initialize phy until plugin interrupt received")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

The code looks OK to me, so

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

once the commit text is cleaned up to indicate the proper function
names.
