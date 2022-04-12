Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 727F14FCD91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 06:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237821AbiDLEYW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 00:24:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243976AbiDLEYT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 00:24:19 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A0C42F395
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 21:22:02 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id w127so17842018oig.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 21:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=tjT6fKt+FqeEOcNg0osLvB2083tulirjm/yjb0EMPNw=;
        b=if+yP4Pk/q28d73RXmoK3hDDqXFu1H3qtu1L+w4XrCR45OD2hD75330dqbWLYDyMTy
         zuohjk0ezFvJVPyEO49t8DYP7+w021vx7wAl1bCj8P803lDE+8h5KCq+gAu4rSy2E+mp
         vdozwB+OGr/AC5hX7IBcHGLWZjwaGa8A8KSEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=tjT6fKt+FqeEOcNg0osLvB2083tulirjm/yjb0EMPNw=;
        b=yvz2YzTlHdx5vZTdKiAQ+j2wYioT47nk8Y1v1DOcFn+W1+EkP2kOvBNjoRJS3fR2MG
         lVG7qjeNCSedMZzbHc+CvdL7j/IVC/ctoTn/8mWNiDJtO4edGnEFpuMiDBTUmdt31SYQ
         kwb6rVAOUFLxfKxztyvNRi0H/ZaTRmCJDtVeajF+Zl8upoLW5xaR0qu8JtL0FOQJLOfF
         vR5PrrFz0bnSjvgCKpU1Tin+Pf9Dqsi61JXmhSjvCXYqQSNOTvaXEct20DHiKB6SoHRi
         yeV8Gq13XTG8G6uXglPHYSr4ukTmOQg9W1Mg7AxPKUhAiWE7sq/YtEHt0Qdo6GH7e3cK
         QvEQ==
X-Gm-Message-State: AOAM530btcVp0/7Q/T4bvnRPO22rmQSgpRedFGZveRuHWmbH+Mv+s+Ys
        qZpzAqxO1QUZlm+eP9oKuuUuG1Aeb+A/BRllaBqoZA==
X-Google-Smtp-Source: ABdhPJx23C8bH5PTdYl8UcvVuno+rfEBOgQ0RygYLdcavLD1pmbKLxkf8ZLS/jFBVhj+Xqp91D6yZh3UFs9TdUx3Hgc=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr975536oif.63.1649737321426; Mon, 11 Apr
 2022 21:22:01 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Apr 2022 00:22:00 -0400
MIME-Version: 1.0
In-Reply-To: <dcdae9ca-1896-e632-17f3-ffd4de7c9c1b@quicinc.com>
References: <1649722129-12542-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n53zYpqJL9GCoqZRwMptCne+4Dk4thz-7rCDac7H98dm=A@mail.gmail.com>
 <7529d921-0b12-d162-416d-3542933a0aed@linaro.org> <dcdae9ca-1896-e632-17f3-ffd4de7c9c1b@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 12 Apr 2022 00:22:00 -0400
Message-ID: <CAE-0n52QWn6hZp2ty5kjJ-rrQ+VvhQuR7exTW=0k4Yu8=RobAg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: stop event kernel thread when DP unbind
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc:     quic_aravindh@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Abhinav Kumar (2022-04-11 17:29:17)
>
>
> On 4/11/2022 5:22 PM, Dmitry Baryshkov wrote:
> > On 12/04/2022 03:21, Stephen Boyd wrote:
> >> Quoting Kuogee Hsieh (2022-04-11 17:08:49)
> >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kthread_run(hpd_event_thread, d=
p_priv, "dp_hpd_handler");
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dp_priv->ev_tsk =3D kthread_run=
(hpd_event_thread, dp_priv,
> >>> "dp_hpd_handler");
> >>> +
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(dp_priv->ev_tsk))
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 DRM_ERROR("failed to create DP event thread\n");
> >>
> >> Why can't we error out? Why can't this kthread be started in probe?
> >
> > Just my 2c. I don't think starting it in probe is a good idea. The
> > driver uses components, so, in my opinion, the thread should be started
> > from bind and stopped in unbind.
>
> Yes, I also agree it should be started in bind and stopped in unbind.
>

Sounds good to me! I forgot that this is a component.
