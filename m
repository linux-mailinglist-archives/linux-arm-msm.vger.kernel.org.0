Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9858E3615AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Apr 2021 00:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237465AbhDOWr1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Apr 2021 18:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237445AbhDOWr0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Apr 2021 18:47:26 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3171C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Apr 2021 15:47:01 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id em21-20020a17090b0155b029014e204a81e6so5432767pjb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Apr 2021 15:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=4QXyNLhNR/ybAA8PhqI1Y4BCgzCX+KpeDdgoizSFaz0=;
        b=L8G3d+gV+ZHqNkVAriDsrtVhQMCQV82uICqEb1zx1gUZUrHTLb/QtmAwXKfy4wXRNo
         sbi42TE/mnsc+Lp3EC3yZuCmD88NlzUjqVXVC0gKoWE3IyTBrFsxCEmEtKHEQa35W/3/
         eoBFIqvEgEVTAx6u4F3UxeGblQP8MygfDsj2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=4QXyNLhNR/ybAA8PhqI1Y4BCgzCX+KpeDdgoizSFaz0=;
        b=pUirz8H6qxpEScVaoYVZlv4KZwBfe2XX4pgMahHT2vlNCo9NsEsKI41EJSrwKmxicn
         btSoMxguwFrKKIlc8UpoAhPJY6qA31LmFvjqOOJaHw6RSbknhZBj5jeINCtGxsaGHNGp
         RYBrHXtk89XenFXeceMagNOOsk1KOeNLqMj8oAun/4mj9smU7aWs02t+NKTTzwa78hjm
         QeyZ22OK7XhWQcQOhQdWiW0R7lwx7wfXjp7oAD+y2cXMLF0kXZQbOfT0lQJQOhmWN9zD
         tn6P/BWGHrDTDYdacwIL4dKETLhw6wEcse8CtQXhAbgvY94eO1nX+YpPEScnwJ5Lf8ux
         6emA==
X-Gm-Message-State: AOAM5337AMVoxx8NhA2sIasP4MKQmpxBc/NtQBwje8rQPz5Lo8OxybSJ
        r8W7bNhw2TlOLAPhbjFhhv2lHA==
X-Google-Smtp-Source: ABdhPJxFhcnc0BQvrngfQ3Z5AFfIdVKhj/xb/yL3sabyo7p2u8N5bSvEyBbGwKVUGR30J7RRrB+6pA==
X-Received: by 2002:a17:902:b188:b029:e8:bd90:3f99 with SMTP id s8-20020a170902b188b02900e8bd903f99mr6372521plr.6.1618526821364;
        Thu, 15 Apr 2021 15:47:01 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:1ddc:37d8:5171:510d])
        by smtp.gmail.com with ESMTPSA id a128sm3038828pfd.115.2021.04.15.15.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 15:47:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <78036f23979206070bd9c9df180e2866@codeaurora.org>
References: <1618355504-5401-1-git-send-email-khsieh@codeaurora.org> <161843459482.46595.11409016331159748598@swboyd.mtv.corp.google.com> <60bceecc3d4dcc71c66a4b093d0e6c0f@codeaurora.org> <161851718969.46595.12896385877607476879@swboyd.mtv.corp.google.com> <78036f23979206070bd9c9df180e2866@codeaurora.org>
Subject: Re: [PATCH v2 3/3] drm/msm/dp: check main link status before start aux read
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     robdclark@gmail.com, sean@poorly.run, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
To:     khsieh@codeaurora.org
Date:   Thu, 15 Apr 2021 15:46:59 -0700
Message-ID: <161852681935.46595.9941294298184495830@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting khsieh@codeaurora.org (2021-04-15 15:02:40)
> On 2021-04-15 13:06, Stephen Boyd wrote:
> >=20
> > Is it really necessary to have this patch at all? I think there are
> > bigger problems with suspend/resume of the DP driver in relation to the
> > kthread stopping. I hope that the aux channel would start NAKing
> > transfers once the cable is disconnected too, so that we don't need to
> > do an extra check for each aux transfer.
>=20
> I am working on duplicate this problem, but it is not happen on me yet=20
> so far.
>  From kernel dump, i can see it crash at dp_irq_hdp_handle() after=20
> suspended.
> dp_irq_hpd_handle and dp_pm_suspend() are serialized by event_mutex.
>=20
> After suspend, ahb clock is disabled.
> Hence next dp_catalog_link_is_connected() crash at acess dp ctrl=20
> registers.
>=20
>=20
> aux channel does not do NAKing immediately if unplugged. Therefore=20
> aux_transfer will wait until timeout (HZ/4).
> worst, drm_dp_dpcd_access() will retry 32 times before return dpcd=20
> read/write failed.
> This patch try to eliminate the time spinning on waiting for timeout 32=20
> times.
>=20

Would be useful to have that level of detail in the commit text.

Maybe when the cable is disconnected the DP phy should be shutdown and
some bit in the phy could effectively "cut off" the aux channel and then
NAKs would start coming through here in the DP controller I/O register
space?
