Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1036B349E84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 02:18:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbhCZBSJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 21:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbhCZBRt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 21:17:49 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C684CC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 18:17:48 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id w8so1782319pjf.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 18:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=MXU0W4hXQSn5cT7nm9jJj1Hb0+VGd0Zn55IsoZ/3xBk=;
        b=ExHK77K4VDDdqJH5CuFON7d7VeJ6QZbD6RH8skpBGIrkJjX9bY2zXQ6ZIFA9k2iXcT
         IdF3zJ0D9RFCU2+qYJBYJpSNK2wIZ0cLm/0XUr43gRoroudO+4DLsCuNR0OvM/AdLBiK
         68KfdHjYt/Qwr3Iw0gWJGQhVghgZKnTC7s7oc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=MXU0W4hXQSn5cT7nm9jJj1Hb0+VGd0Zn55IsoZ/3xBk=;
        b=RpvJzSZ7qxy1HbY7+XsLno3SwFRQkqjEFO3hbqW214gISWq6jioHd6y72NTqBYjICZ
         kdVNHosby6Um5fWph5l56cvpUyLIqny5rF3Lk7yHyzW0gWJGJskbXxtADnKKUrkYHNEv
         1L6vsQo7fpsEvMAx0YOl+24QiAv1S2oRi5+X8r3iWaSxXqF6Q5xF9+D05QN5zidVvlQN
         xTe+a+eO/DK/r5bFG9nMMC7pHbgRUo6koQakO04iIHAQCq++beoNHZup0Ze2jsgWhco/
         6PzVDz+iQRCkgyqB2e5pBCbebxZ3w422/WRU/75iY9X4Nh37/5JEyM0EjQNob7xZFB0p
         25Ow==
X-Gm-Message-State: AOAM5323Ia46Fqi7t8zzpEH2vBQvF/i5YAPLvBKxLVSJCr8XR9lUjKU3
        Ph9g9tkxn30WR17/hw3CXw5DbAgBvcN9jQ==
X-Google-Smtp-Source: ABdhPJxVdMESi38YKv6tWdoN04fZg2j9Ch/YSvv1lfeNHE28AamjYJomTaTYGm57PsOUU1cZ1UNVLg==
X-Received: by 2002:a17:90a:bb91:: with SMTP id v17mr11019736pjr.24.1616721468438;
        Thu, 25 Mar 2021 18:17:48 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:18a3:238:26c5:1521])
        by smtp.gmail.com with ESMTPSA id x7sm7453681pfp.23.2021.03.25.18.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 18:17:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1614971839-2686-2-git-send-email-abhinavk@codeaurora.org>
References: <1614971839-2686-1-git-send-email-abhinavk@codeaurora.org> <1614971839-2686-2-git-send-email-abhinavk@codeaurora.org>
Subject: Re: [PATCH 2/3] drm/msm/dp: Fix incorrect NULL check kbot warnings in DP driver
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, tanmay@codeaurora.org,
        khsieh@codeaurora.org, dan.carpenter@oracle.com
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        dri-devel@lists.freedesktop.org
Date:   Thu, 25 Mar 2021 18:17:46 -0700
Message-ID: <161672146644.3012082.15695024069473643069@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Abhinav Kumar (2021-03-05 11:17:18)
> Fix an incorrect NULL check reported by kbot in the MSM DP driver
>=20
> smatch warnings:
> drivers/gpu/drm/msm/dp/dp_hpd.c:37 dp_hpd_connect()
> error: we previously assumed 'hpd_priv->dp_cb' could be null
> (see line 37)
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
