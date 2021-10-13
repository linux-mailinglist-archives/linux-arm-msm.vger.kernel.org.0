Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE6BA42CA65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 21:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230474AbhJMTvX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 15:51:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbhJMTvW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 15:51:22 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F94EC061746
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 12:49:18 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id u69so5353657oie.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 12:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=51iCtJfwF5rNqKCUIND5PpXwy486y8bSNPCFCoqsvKM=;
        b=GtN6f8PMidexfjnF/349pYjiZmXuf6rowzWXAw7EvtyJS68wcCRNFBO0ttVehwhlVh
         il/ckZ8S2Ye4H4vbo6TOFCgaFJAN1lTCglERo0fqfglSlD0AWLI9QAJRQMmSWnVyFHpO
         D4kmC6mAwQRLnVM1DUj8rY42VzjXPBOdS3izs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=51iCtJfwF5rNqKCUIND5PpXwy486y8bSNPCFCoqsvKM=;
        b=uxne4v8fGYxiTTlbS4hWs/ZZ/XZTqC4lvU0s5wgrvA+Y6kwhCX6r5h72TFK1L4dfSe
         Uq4m0wxLuJs4bbin6gJrqkXGWqKdAMDP+SjkvwIAiqjkZ2/K+ETiqvJa3qBOLJsU76F+
         HlJSMePpazBDoupssDTncBzguI4+NqGibKNWqD3yR+t5jtNRQ/Mkb8dHqmqqJ8Nb8wUh
         CcdfTAvZpH9XfMSfTPS3oDAJxBS4dwH0umAv5zZkutDTgzs5XDY70zl9HOnscolQXPWv
         krsBuu1OnDJP2oKYjzlzJw+pyg1aoOlEjb/X9ZPoJr2Rzn2m4iERxCKweqhsW3VXptSO
         7Atg==
X-Gm-Message-State: AOAM530hvttFu8lzR0LxtABQvrZEQ4Sp3/FmqK5GzXB+JI+RAijftnFw
        6mImGvUN7Sgc5YBm9lzr1lA7Pd9DdO6FQKJLxLL11w==
X-Google-Smtp-Source: ABdhPJxX7OwXr/yMPANG+HHhHuaY5istIek0XSOY4+ZivdVb8quhuZc49QWi/nEmYjVgcpXIEGjwzniAFVFFCF4sz7c=
X-Received: by 2002:aca:3306:: with SMTP id z6mr9586177oiz.164.1634154558286;
 Wed, 13 Oct 2021 12:49:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 13 Oct 2021 14:49:17 -0500
MIME-Version: 1.0
In-Reply-To: <YWbPfwnbLKNZkRcB@phenom.ffwll.local>
References: <20211006193819.2654854-1-swboyd@chromium.org> <20211006193819.2654854-2-swboyd@chromium.org>
 <YWbPfwnbLKNZkRcB@phenom.ffwll.local>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 13 Oct 2021 14:49:17 -0500
Message-ID: <CAE-0n51FFUCb8C55bHSM0Fz16U65CvjGzVVe9CToqnFNZ6-bSQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/34] component: Introduce struct aggregate_device
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Daniel Vetter (2021-10-13 05:22:23)
> On Wed, Oct 06, 2021 at 12:37:46PM -0700, Stephen Boyd wrote:
> > Replace 'struct master' with 'struct aggregate_device' and then rename
> > 'master' to 'adev' everywhere in the code. While we're here, put a
> > struct device inside the aggregate device so that we can register it
> > with a bus_type in the next patch.
> >
> > The diff is large but that's because this is mostly a rename, where
> > sometimes 'master' is replaced with 'adev' and other times it is
> > replaced with 'parent' to indicate that the struct device that was being
> > used is actually the parent of the aggregate device and driver.
> >
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> > Cc: Saravana Kannan <saravanak@google.com>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>
> This adds device model stuff, please cc Greg KH and ask him to review
> this. Maybe also an ack from Rafael would be good whether this makes
> sense.

I will explicitly Cc Greg on these component.c patches.

>
> Once we have that I think we can then go&collect acks/review for all the
> driver changes and get this sorted. Thanks a lot for pushing this forward.

I'll resend the series today. This one has some compilation problems
that I've fixed now.
