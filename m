Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC898349E80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 02:18:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbhCZBRe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 21:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229979AbhCZBRa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 21:17:30 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CAD7C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 18:17:30 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id cl21-20020a17090af695b02900c61ac0f0e9so4807635pjb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 18:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=J8nMLjAEeKpV02aUXHe43+I2wZF8cyZVnRX+KUOYqss=;
        b=cQhkxLDX3nfXrkWTIxByCJ4xpoDKyM+27Txt7k5RBYAWHPGDhWWVlsBwOwNencRKz/
         Q2i6Cln6j2qCOHTzvLLP0Kc6mdXJfSQNrNG3hV2Lv69JaILutM8Gp5OboWcWt3j8Yc92
         ftttjrTuBnhcKtjGGvJeQrGhq8aXAM9g+IWXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=J8nMLjAEeKpV02aUXHe43+I2wZF8cyZVnRX+KUOYqss=;
        b=P0uTkH0kC4Fjgua8fN7E9DNjV6ZCYtUvJTl6W1ov1ue14YQuYcUom5knQIFaMdf+zK
         b4TkbrxuAMjgGkkPga2Z9h1d25Umlzof8XY34WbyRadw11gjehBwksWqBChoc0rG4S2A
         Ny4M/y0gw/LPvoo8IuMHpYtE6A78lEhwOeXDyAIXUGe90knx23invnxY5kN7tGml4bAT
         pS8a8zmqfWP1231FGtacmwmNxJh31sbumpeBLwlgI5uXTkYOzzCuh0gVOI229c/fxD6V
         waqA1fzlHa4feUCxpysTRRHv8W72O1/vN+tJhKgHnAfQ+cOzVr7itzOnDEKfcBYIWG0Y
         QpgQ==
X-Gm-Message-State: AOAM532RnEPKvRcjYcvk3+3vLxpHa9zlnb4SxI6uoEap/uBx6FxmsB/i
        Hf0I+Hlhl5JVGzB4zxR+0b9QrA==
X-Google-Smtp-Source: ABdhPJw7n1WJkB8t3PJN5A8OrPXJszf8d70/YXB8F0M2+OC2bcrP01DdXIMGtmX33dBgo78OsqXA9g==
X-Received: by 2002:a17:90a:c249:: with SMTP id d9mr11398591pjx.104.1616721450015;
        Thu, 25 Mar 2021 18:17:30 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:18a3:238:26c5:1521])
        by smtp.gmail.com with ESMTPSA id u17sm6642910pgl.80.2021.03.25.18.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 18:17:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1614971839-2686-1-git-send-email-abhinavk@codeaurora.org>
References: <1614971839-2686-1-git-send-email-abhinavk@codeaurora.org>
Subject: Re: [PATCH 1/3] drm/msm/dp: Fix indentation kbot warnings in DP driver
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, tanmay@codeaurora.org,
        khsieh@codeaurora.org, dan.carpenter@oracle.com
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        dri-devel@lists.freedesktop.org
Date:   Thu, 25 Mar 2021 18:17:27 -0700
Message-ID: <161672144775.3012082.15468817158271994036@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Abhinav Kumar (2021-03-05 11:17:17)
> Fix a couple of indentation warnings reported by
> kbot across MSM DP driver:
>=20
> New smatch warnings:
> drivers/gpu/drm/msm/dp/dp_debug.c:229 dp_test_data_show()
> warn: inconsistent indenting
>=20
> drivers/gpu/drm/msm/dp/dp_power.c:203 dp_power_clk_enable()
> warn: inconsistent indenting
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
