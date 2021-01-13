Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9418A2F5415
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 21:26:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728954AbhAMU0i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 15:26:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbhAMU0i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 15:26:38 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D38FBC0617A2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jan 2021 12:25:56 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id u4so1902694pjn.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jan 2021 12:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=gcin89rV0I7IqOVbv9QUmTeBAufbW/EP7UVT7uECDZc=;
        b=W3/hfnVx1RKsL4BcMpubo4sIVkeHPQNvBiKClmnTGfqiZIKSQNo4mDZfx0kJQnXQm7
         D6jatbyMCWCHJMfpg2HfYmnwgMGkzs5HYGM0kgMjpRA0wpvjZq/pIqVf6PJsRt+Kx6XW
         r/YcVR2l5+N25gm2DaDM+Ap+SK+7GQuvK7rx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=gcin89rV0I7IqOVbv9QUmTeBAufbW/EP7UVT7uECDZc=;
        b=XtbWxfA3zIUXjiJ/+rLnd+mMv0ir7k7BT3Ivdy6/+WpOtQp5vxzGwHkmf1ktt7jCNr
         nZMvnx8Q7/+TOcY9Kdl3xWOAMgNont8zVEl+r64Fta3J8rrdp3IvRC19udTTWXCzolCS
         nk95cffNv3luz/5ycDg77h9F88IE9A2I+c4t/0EoHNzJ+zs14BTJ4SMAk93chlCVQeTN
         VYpbtiwEvUfjS+U2tvNuatc4MGokPxBgKI2VXj8zXGzrDRBVc8Ls+jtZ3QU7KKrwPB/9
         DSdANY3zuWRMRz6O5m8AE0AKLYSknivXBjaSaT5VHteQJc0il4/LeJwWukLGX4dSq5u7
         qGDg==
X-Gm-Message-State: AOAM530vvrRkXsMJCqRp3XvqPgYYhZ8bosjbCPQfPIGvSCB4vqM77C/e
        VtCrFZvWpdErJUGTfIZUp3Cw9w==
X-Google-Smtp-Source: ABdhPJycCWJ3lRjFwltpCDQVyM6m4HdsDCiUKkLSp4ACw4lxoBY0IFDGY9PSQ9YLIGnXpVCrdx04ug==
X-Received: by 2002:a17:902:9009:b029:dc:52a6:575 with SMTP id a9-20020a1709029009b02900dc52a60575mr3869284plp.57.1610569556468;
        Wed, 13 Jan 2021 12:25:56 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id 36sm3511232pgr.56.2021.01.13.12.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 12:25:55 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1610564400-29788-1-git-send-email-khsieh@codeaurora.org>
References: <1610564400-29788-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [PATCH v2 0/2]  fix missing unplug interrupt problem
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
To:     Kuogee Hsieh <khsieh@codeaurora.org>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run
Date:   Wed, 13 Jan 2021 12:25:54 -0800
Message-ID: <161056955435.3661239.1548841852585636847@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-01-13 10:59:58)
> Both AUX_SW_RESET and DP_SW_RESET clear pending HPD interrupts.
> Therefore irq_hpd handler should not issues either aux or sw reset
> to avoid following unplug interrupt be cleared accidentally.
>=20
> Kuogee Hsieh (2):
>   drm/msm/dp: return fail when both link lane and rate are 0 at dpcd
>     read
>   drm/msm/dp: unplug interrupt missed after irq_hpd handler

It won't apply to the drm msm tree. Please rebase and resend.
