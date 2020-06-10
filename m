Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDC431F4B4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 04:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbgFJCU4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 22:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725798AbgFJCU4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 22:20:56 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2316EC05BD1E
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2020 19:20:56 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id d6so231092pjs.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2020 19:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=dC9/KQFuZY34yyqjXgNCYCIKz+z0z+M8UxzxcZfntAU=;
        b=LshfhBDcAKWKw+BwL1711CUtdj63qrkSDCAl1hU9a4s8T0Drnxqgtvu2sGmOsJJ2yl
         hhnoTDwRU6tZveA+vXZWA7u1LgoUgm7DV4DVmTHTRN8gEI2fuqMAjW+hkOhnQRcep6A+
         esCNzWyueKfigoevJr9Sf8d9sDZ06p66fvk6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=dC9/KQFuZY34yyqjXgNCYCIKz+z0z+M8UxzxcZfntAU=;
        b=h+ncP6XomIqENMzxuN7Dhs2nQSA7CEaxr4jQ/DC3B+wcMRrpWOa3n0IRUKTbGKL0cL
         YGJ2j8GrUeb5lcSgaeSGorVYu5DSL6sStpJFBylRSVIy5dkYjVLN6TpjjrRnpxEmEJOf
         1AP9EVMOFaANZiCsqnb6KLAZYN5GnO+gKgSP1TR2rcTiv/UE3HXiaOrDu3QrRiJe6S8I
         jyk68pDSRO4A6MUIb4BiZgDl1g6Gb+K5azaSb9jzUXtM50Tl1SPpuNFgwqXXY0nUQdgj
         bg4WxSSyUYKnBPuArwnlFtAKciGKTn/C1NFGCePxJtwpHcW1K7UR5PG6KAffqZAmWvCf
         1+jw==
X-Gm-Message-State: AOAM533GBhoTRKKPV3NjnFIc6GOPdBVfyI5X2sP5A4O+hzy+Id8o36AN
        TnqBvX/VMI7/cqdQjpV1ewU1/A==
X-Google-Smtp-Source: ABdhPJxmED+EAnYjUtWkB7dB6RYq/eITyPggCRbENMcrnsfK8Hlc1oCgRoX7471ZCmTD51mFldzUag==
X-Received: by 2002:a17:902:aa88:: with SMTP id d8mr1082183plr.257.1591755655666;
        Tue, 09 Jun 2020 19:20:55 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id d2sm9249070pgp.56.2020.06.09.19.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 19:20:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200609034047.9407-1-tanmay@codeaurora.org>
References: <20200609034047.9407-1-tanmay@codeaurora.org>
Subject: Re: [PATCH v6 2/5] drm: add constant N value in helper file
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     sam@ravnborg.org, seanpaul@chromium.org,
        freedreno@lists.freedesktop.org, chandanu@codeaurora.org,
        robdclark@gmail.com, abhinavk@codeaurora.org,
        nganji@codeaurora.org, linux-clk@vger.kernel.org,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>
To:     Tanmay Shah <tanmay@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Date:   Tue, 09 Jun 2020 19:20:54 -0700
Message-ID: <159175565407.242598.7527036274929582020@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Tanmay Shah (2020-06-08 20:40:47)
> From: Chandan Uddaraju <chandanu@codeaurora.org>
>=20
> The constant N value (0x8000) is used by i915 DP
> driver. Define this value in dp helper header file
> to use in multiple Display Port drivers. Change
> i915 driver accordingly.
>=20
> Change in v6: Change commit message
>=20
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> Signed-off-by: Vara Reddy <varar@codeaurora.org>
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Can you resend this series as an actual patch series? None of the
patches have the proper In-Reply-To headers so it is hard to track the
thread.
