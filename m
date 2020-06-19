Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4214120037D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2020 10:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731255AbgFSIVF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jun 2020 04:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731188AbgFSIUc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jun 2020 04:20:32 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A0F0C0613EF
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2020 01:20:24 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id h95so3996198pje.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2020 01:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=3/EAr2y0sc9d0konJThPJ+OgywU1nfaO8eAafmovNU0=;
        b=jjyeZkkQunEwop9f0LcDn+xOYox58f+EyJWfWwuKPsT2m3jeeEXzsNwKB8Y2i9wcl9
         vo65pKBvtPpVUYXK51tqsLJ5wDkY59dFhtjw/6t1w+SMfcdH0GrEThb79HPhXJ+amXFR
         ldpGJoI0uNoaCKlCymivglXrHLHKLZn7CAa1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=3/EAr2y0sc9d0konJThPJ+OgywU1nfaO8eAafmovNU0=;
        b=jnN2YmgDQWRnyMjvEEtW04sVrM6Xh2xoVpj2rNXIJWwQPkwxMl68oMYh+UMpkZvwlZ
         OA5UCCEwgQtqaeBLMqnIvSnNAtCHmWTvorMUo7Hzv0vKEhUBaDyLPqUgB8EkmYsdA3My
         yELXdYI/cIBe7j5jgwGGGxDrqw+aj0sZT+YvGY+20CdfxcK1jXdeNmK0Es+8DdoG+gcj
         r74EUfE75jarzUiqGxpOrO8Y5DkoHMXHCMQEqS+ZzwKRgov9DUqNoV8wFRoLs3MHpnGv
         81YvFssjLeeYFkk02kDeFPVQoc3ZOPkFWBba7V2H2hwQg2N4WX9hanEyBwiA488NJxSZ
         2j1w==
X-Gm-Message-State: AOAM533dWcAnowXRtwkDDIWIFi9Mc4Gs1x+NWIaEsO7RMWby5vePBoSY
        27/pIyJjAIvK91AVnsW/d1iEdT8uwB0=
X-Google-Smtp-Source: ABdhPJwDYhRixLXDiLuE5z9EfNBJNzp4oZwlJ5YgbWv4V4xHUKOmq4b2mrDu7UpTh4t5Iyj085GNfQ==
X-Received: by 2002:a17:902:8544:: with SMTP id d4mr7371334plo.234.1592554822936;
        Fri, 19 Jun 2020 01:20:22 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id j10sm116707pgh.28.2020.06.19.01.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 01:20:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1592485553-29163-1-git-send-email-mkshah@codeaurora.org>
References: <1592485553-29163-1-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH] soc: qcom: rpmh: Update rpmh_invalidate function to return void
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dianders@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, georgi.djakov@linaro.org
Date:   Fri, 19 Jun 2020 01:20:21 -0700
Message-ID: <159255482149.62212.13349249528460316271@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-06-18 06:05:53)
> Currently rpmh_invalidate() always returns success. Update its
> return type to void.
>=20
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
