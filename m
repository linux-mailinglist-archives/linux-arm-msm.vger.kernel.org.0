Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C92F7ABB41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Sep 2023 23:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbjIVVy4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Sep 2023 17:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbjIVVy4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Sep 2023 17:54:56 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E77B5F7
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Sep 2023 14:54:49 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c02e232c48so48670081fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Sep 2023 14:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695419688; x=1696024488; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7c/oVDshAtS1tuVwC10Rg8pKnTEHEmvA4PAkfR7yFw=;
        b=VKCgJvUxWz94ECwr1VTVteEa/tL/HwYlpkr80qg8cuwmelHMkjoQsbV8NS9QDyI85K
         1gaYnmTZhvW1I8Oc5kVrGykUCWadgerWQD+O+FsQmTmxy5ZS7gJrB070AGMzNXy/DEQe
         c7s899MKfJqAEkU+RG4ghL4VNPaBQLoEdu+gU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695419688; x=1696024488;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7c/oVDshAtS1tuVwC10Rg8pKnTEHEmvA4PAkfR7yFw=;
        b=sdULmG55jAQujk3IBl01tubJUo4y5MutJ9j1aBd9dl6rtvK9bd08LpZd/0V2nPoLjc
         hz+DsX3+ZpVFTArzcv4yaG+YCCsnMgeoRusRaFRjagW/3Tb9/BQf91JHLCjk/w1YpH6n
         nmQY/f4W9sjNnZhQ0pwsnve5EIhjTdL853wau8Wm7p3/ybubF+TzvCSo6zADM34VKBn4
         PwHzIzBtZPJeJkJIMbs16vC1suKlW+vGWmRxnmTfz6XMaEFVmYhrIucFlpRg/qd0b4DP
         /mlycPZqgV5Ac85EtOIgnXHCEBCgLMVQyrfDgF2x5VOAb446TXzxJi/uxX76iTeHlOBo
         ysRA==
X-Gm-Message-State: AOJu0YzxeshnFlMY9lGUl3/O8hlJFh+CvvLEznzaRARtrTP/H4LZw3yt
        zHjZbtyikyFePoMRY2nPSyhkfFHUr5Aho3D1CJiZsQ==
X-Google-Smtp-Source: AGHT+IFqBQ9m6cEHlfgPZ1B6LtM3dzQO5UTlrujPO5byQq0rStgb2iQQqBzg/dzkHnhTV6MLei3X7/hNVsZxdNYxgNY=
X-Received: by 2002:a2e:3505:0:b0:2bc:d8cb:59fe with SMTP id
 z5-20020a2e3505000000b002bcd8cb59femr424762ljz.8.1695419688131; Fri, 22 Sep
 2023 14:54:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 Sep 2023 14:54:47 -0700
MIME-Version: 1.0
In-Reply-To: <CAA8EJpr2wRq6Txi7YAQpJKa_9UGqH_nmHzvVOaAPkwOrtDg4Tw@mail.gmail.com>
References: <1694813901-26952-1-git-send-email-quic_khsieh@quicinc.com>
 <1694813901-26952-7-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpqPXoFX4LXyXYgfh07Vpxg-KgD8VBR6x5bXf4GOJmbOtw@mail.gmail.com>
 <2f98d5f1-57c1-d9fe-cb1c-b975db057287@quicinc.com> <CAA8EJpr2wRq6Txi7YAQpJKa_9UGqH_nmHzvVOaAPkwOrtDg4Tw@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 22 Sep 2023 14:54:47 -0700
Message-ID: <CAE-0n53dqHONzMTd_ZC-fKWTzDVq6Wqwo4OFZMUcghZ5SD5RhA@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] drm/msm/dp: add pm_runtime_force_suspend()/resume()
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, dianders@chromium.org, vkoul@kernel.org,
        daniel@ffwll.ch, airlied@gmail.com, agross@kernel.org,
        andersson@kernel.org, quic_abhinavk@quicinc.com,
        quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com,
        marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2023-09-19 02:50:12)
> On Mon, 18 Sept 2023 at 20:48, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >
> >
> > On 9/15/2023 6:21 PM, Dmitry Baryshkov wrote:
> > > On Sat, 16 Sept 2023 at 00:38, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> > >> Add pm_runtime_force_suspend()/resume() to complete incorporating pm
> > >> runtime framework into DP driver. Both dp_pm_prepare() and dp_pm_complete()
> > >> are added to set hpd_state to correct state. After resume, DP driver will
> > >> re training its main link after .hpd_enable() callback enabled HPD
> > >> interrupts and bring up display accordingly.
> > > How will it re-train the main link? What is the code path for that?
> >
> > 1) for edp, dp_bridge_atomic_enable(), called from framework, to start
> > link training and bring up display.
>
> And this path doesn't use .hpd_enable() which you have mentioned in
> the commit message. Please don't try to shorten the commit message.
> You see, I have had questions to several of them, which means that
> they were not verbose enough.
>
> >
> > 2) for external DP, HPD_PLUG_INT will be generated to start link
> > training and bring up display.
>
> This should be hpd_notify, who starts link training, not some event.

I think this driver should train the link during atomic_enable(), not
hpd_notify() (or directly from the irq handler). The drm_bridge_funcs
talk a bit about when the clocks and timing signals are supposed to be
enabled. For example, struct drm_bridge_funcs::atomic_pre_enable() says
the "display pipe (i.e.  clocks and timing signals) feeding this bridge
will not yet be running when this callback is called". And struct
drm_bridge_funcs::atomic_enable() says "this callback must enable the
display link feeding the next bridge in the chain if there is one."

That looks to me like link training, i.e. the display link, should
happen in the enable path and not hpd_notify. It looks like link
training could fail, but when that happens I believe the driver should
call drm_connector_set_link_status_property() with
DRM_MODE_LINK_STATUS_BAD. The two callers of that which exist in the
tree also call drm_kms_helper_hotplug_event() or
drm_kms_helper_connector_hotplug_event() after updating the link so that
userspace knows to try again.

It would be nice if there was some drm_bridge_set_link_status_bad() API
that bridge drivers could use to signal that the link status is bad and
call the hotplug helper. Maybe it could also record some diagnostics
about which bridge failed to setup the link and stop the atomic_enable()
chain for that connector.
