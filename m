Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0168C28DCC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 11:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730693AbgJNJUD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 05:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730634AbgJNJUA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 05:20:00 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A9CBC02524A
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 17:36:55 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id h4so556818pjk.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 17:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=9imkWvMot1MzH+ehLJwgyaxPJxuOFrOphid59RBNFTo=;
        b=HmED74OGfPJeiSnehPVeZnQq0lW4FvMWAIKlf6FYb2rHCFz01nDI709PwTOJWBOj/0
         MqXvSM8QPTAfDM0pB4JgvphWDxwGWuejZM0o8302Eeidj20nyPmXqdAJwiviFChpfl/v
         s9g+sRDQ98tTWvQF3cB4/9eQhNX2CD4UTJsuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=9imkWvMot1MzH+ehLJwgyaxPJxuOFrOphid59RBNFTo=;
        b=L1/66vLZVs9tA8z8TZcO3a5HLIk0kVuA/zi9wFY+C7QYvIOQMLMidixHY1mm4PkbH8
         uvWCkSXZVgAtOWV3exGWjmv0dv7K6yrsMT6nuuznW6txKwKrD7Tc2pXKd/kKXYak/Mj2
         RRd4Y94sFHQtIjRsHuJZHldfu7J4MiID7WrgDCt6AvTQCdCclGe05wux6Lha2dHKrdvD
         LtQnCAoJrVu4lGHpC6RV86N6SOz2uwG8eb3iTCoiAo0lm6Kfjsdv3KcASmbrMgLFTgRT
         keu/TAz0eFKXasIxrVUqOllgXoEBSeXaQNUHTixN5JkQc+6NFZ40bVXDbIRAa3G5NrRM
         BKTA==
X-Gm-Message-State: AOAM530ON78RnvdRiUmHkqwj8D7orInTvNU6QXaQ4Xu899rmdjdu/aep
        B/bxNlS8sy9BBgfiAfa3p51M8zZR7iNmeA==
X-Google-Smtp-Source: ABdhPJz//cpuLR3q6+8Xtvz7MFQA92okbEa8Sfnd9VzfzsJ3RYQ0rokXMZ0mF0DjfGRDqJuhhbjOPA==
X-Received: by 2002:a17:902:708a:b029:d4:cf7c:6c59 with SMTP id z10-20020a170902708ab02900d4cf7c6c59mr2262370plk.52.1602635814708;
        Tue, 13 Oct 2020 17:36:54 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id w10sm455476pjy.13.2020.10.13.17.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 17:36:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201013233522.5222-1-khsieh@codeaurora.org>
References: <20201013233522.5222-1-khsieh@codeaurora.org>
Subject: Re: [PATCH v4] drm/msm/dp: return correct connection status after suspend
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
To:     Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
        sean@poorly.run
Date:   Tue, 13 Oct 2020 17:36:52 -0700
Message-ID: <160263581242.310579.522359444728182805@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2020-10-13 16:35:22)
> During suspend, dp host controller and hpd block are disabled due to
> both ahb and aux clock are disabled. Therefore hpd plug/unplug interrupts
> will not be generated. At dp_pm_resume(), reinitialize both dp host
> controller and hpd block so that hpd plug/unplug interrupts will be
> generated and handled by driver so that hpd connection state is updated
> correctly. This patch will fix link training flaky issues.
>=20
> Changes in v2:
> -- use container_of to cast correct dp_display_private pointer
>    at both dp_pm_suspend() and dp_pm_resume().
>=20
> Changes in v3:
> -- replace hpd_state atomic_t  with u32
>=20
> Changes in v4
> -- call dp_display_host_deinit() at dp_pm_suspend()
> -- call dp_display_host_init() at msm_dp_display_enable()
> -- fix phy->init_count unbalance which causes link training failed
>=20
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Can we add some sort of Fixes tag? Maybe the beginning of this DP driver
support?

Tested-by: Stephen Boyd <swboyd@chromium.org>
