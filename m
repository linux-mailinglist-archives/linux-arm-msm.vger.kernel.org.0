Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A84E7261B43
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 21:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgIHS6Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 14:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727051AbgIHS5W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 14:57:22 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 004C8C061755
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2020 11:57:21 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 7so186392pgm.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 11:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=bZ0hdB3aDnQdw+HPiv6w6/rS4ctBv4+DDy7Q7mzZQJA=;
        b=kQSLq1W11bCof3VZGivNs9jhTs6eQXMNg151pVMeum5ivTvrGyNKTmBC8o3aAVTMCD
         fWHq03en9zOkEUNKYb6mITKGyBNqVTB2ceHUt93ApjVkk5vDvZP7SZyD5G3hpSk3mpff
         TpEU3uBAzAcI94SB+dVKpTJKqYy/8/3vpSWho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=bZ0hdB3aDnQdw+HPiv6w6/rS4ctBv4+DDy7Q7mzZQJA=;
        b=d1RPv3JHaWOUBRQnKPvIJ2Wuq730qwX9VimxTig/XvReEk5c5BvCScS+/Bx9ZNpJOH
         6tMJGdO6u1DOK5j1hMCZ17ryfnPQqPRks+TWHnocGmL0h23j6f8lG22rGkTph6plaLUh
         PalMhrVIIiWjTS1IEJGCKFSRcs79c2Ie7P39NX2Sn1y0bHEQjA/ZLjHPreHQec74CXNs
         EGn5b+fiBOJ+tDhs2pA1vHAVjGJXzCjm4KvoJlijfJLdmooC14lnhnH7tJAsTKp2GtKX
         l2NYJiqJm5OJUdy+IqSMam2v7L+U/2MYUm0IBAYkOHHILL1iyGXC9jlBTvbjR5QGla0i
         ffiA==
X-Gm-Message-State: AOAM531zg6leOnLnjuuHj9TFh6rguni2rQPvBfWXi4IHfjXd6md8HefM
        l4HO+MQIfvTnQve89N6jT68fkw==
X-Google-Smtp-Source: ABdhPJwf6IhPcHFN4xXP49f62bCdnIGRRPklRPb2u3kzC8iwzMNMbimK4omnPZ6atruNND3LgaRG1g==
X-Received: by 2002:a63:b202:: with SMTP id x2mr126839pge.432.1599591441474;
        Tue, 08 Sep 2020 11:57:21 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id o6sm44291pju.25.2020.09.08.11.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 11:57:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <010101745aaf685e-49eb2897-ee17-40bf-89e8-2adebe8d022f-000000@us-west-2.amazonses.com>
References: <010101745aaf685e-49eb2897-ee17-40bf-89e8-2adebe8d022f-000000@us-west-2.amazonses.com>
Subject: Re: [PATCH v5] drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
To:     Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
        sean@poorly.run
Date:   Tue, 08 Sep 2020 11:57:19 -0700
Message-ID: <159959143931.454335.4137726843867018185@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2020-09-04 12:54:39)
> add event thread to execute events serially from event queue. Also
> timeout mode is supported  which allow an event be deferred to be
> executed at later time. Both link and phy compliant tests had been
> done successfully.
>=20
> Changes in v2:
> - Fix potential deadlock by removing redundant connect_mutex
> - Check and enable link clock during modeset
> - Drop unused code and fix function prototypes.
> - set sink power to normal operation state (D0) before DPCD read
>=20
> Changes in v3:
> - push idle pattern at main link before timing generator off
> - add timeout handles for both connect and disconnect
>=20
> Changes in v4:
> - add ST_SUSPEND_PENDING to handles suspend/modeset test operations
> - clear dp phy aux interrupt status when ERR_DPPHY_AUX error
> - send segment addr during edid read
> - clear bpp depth before MISC register write
>=20
> Changes in v5:
> - add ST_SUSPENDED to fix crash at resume
>=20
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>=20
> This patch depends-on following series:
> https://lore.kernel.org/dri-devel/20200818051137.21478-1-tanmay@codeauror=
a.org/

Can this be based on v12 of the patch series? v4 of this patch was based
on v12, but this has regressed and gone back to v11.

v12 is https://lkml.kernel.org/lkml/20200827211658.27479-1-tanmay@codeauror=
a.org/
