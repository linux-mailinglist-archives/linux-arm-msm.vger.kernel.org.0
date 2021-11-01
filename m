Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87351441FD3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Nov 2021 19:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231605AbhKASN2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Nov 2021 14:13:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231533AbhKASLv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Nov 2021 14:11:51 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23A3DC061766
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Nov 2021 11:02:23 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id h81so13772880iof.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Nov 2021 11:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AI0EGtO0fwy8ABQM2b3fEK3eUYU6jqjRFDdZhYpaGeo=;
        b=JY8uJTVzX0Ut5XrdC7dgInIh7GV7XogEtOsPZDF0iBibhsdEyA2fur4Td5p/bBfbP4
         oMAGLpI6qDbHoQvCijJI9XalSLExjH7lI1CJfN3K/r3kltW5RRKMIGLcxEp/0FDCQvzk
         J88GY6szvCD0jZogUoNp+4HFUlPG2WGbLBzpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AI0EGtO0fwy8ABQM2b3fEK3eUYU6jqjRFDdZhYpaGeo=;
        b=PlGqTuqwgrCvIfJ+Oz20GmVvxZyrI1UI5zw7dD+MZEm/Fs1z9RkHp2pv7q8hkENkmT
         qDuC2IRXJLvwCdnMLUdH6yq77KDsZ9Wn2GMv7h40itGNjgP+EevFry7QR0USFGBoz/sn
         lLJCuliWnOlqPLQbBUbjd+vGBiwI0sGt1ikPPy/Sm3dHs2eecv/sPk8sW29l7ahN/5UF
         cwW1rA8KoWJ9Dmrb1uYIaqwQfOgeVBX08VXvAx6m2AwrWLX4lGODGc6puSAnQWjh5QDC
         yqBajbOINeVnMr1lJKm4MgFnZoAZPfSzlnuwSG9NoqV663FSeI6oAJZDQLTf+0ICneHz
         T3Mg==
X-Gm-Message-State: AOAM530fMnuP/rbPWb82xfws9SKsXc6drHACAC0Qw9N2+glhgNP7w7IY
        n3x3zOxVVbjSByrIGvVRWHigFJZbiwqa9Q==
X-Google-Smtp-Source: ABdhPJz9YGxbxjda2NdWmoKjeCyMg6dBktyZ4worRDpJZKbk5L0PnObuADv1qUSrLCGUOq9gYMVktg==
X-Received: by 2002:a5d:8e13:: with SMTP id e19mr1712621iod.169.1635789742843;
        Mon, 01 Nov 2021 11:02:22 -0700 (PDT)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com. [209.85.166.41])
        by smtp.gmail.com with ESMTPSA id q13sm5808299ioh.41.2021.11.01.11.02.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 11:02:21 -0700 (PDT)
Received: by mail-io1-f41.google.com with SMTP id b203so7278137iof.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Nov 2021 11:02:21 -0700 (PDT)
X-Received: by 2002:a5d:9753:: with SMTP id c19mr8257662ioo.136.1635789741166;
 Mon, 01 Nov 2021 11:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211030100812.1.I6cd9af36b723fed277d34539d3b2ba4ca233ad2d@changeid>
In-Reply-To: <20211030100812.1.I6cd9af36b723fed277d34539d3b2ba4ca233ad2d@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 1 Nov 2021 11:02:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xoaypn6wy5mHfTneDrQYexGcdcaMqkSnPJf0YS=jHpPA@mail.gmail.com>
Message-ID: <CAD=FV=Xoaypn6wy5mHfTneDrQYexGcdcaMqkSnPJf0YS=jHpPA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: set default num_data_lanes
To:     Philip Chen <philipchen@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Bernard Zhao <bernard@vivo.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Yangtao Li <tiny.windzz@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, Oct 30, 2021 at 10:08 AM Philip Chen <philipchen@chromium.org> wrote:
>
> If "data_lanes" property of the dsi output endpoint is missing in
> the DT, num_data_lanes would be 0 by default, which could cause
> dsi_host_attach() to fail if dsi->lanes is set to a non-zero value
> by the bridge driver.
>
> According to the binding document of msm dsi controller, the
> input/output endpoint of the controller is expected to have 4 lanes.
> So let's set num_data_lanes to 4 by default.
>
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ---
>
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
