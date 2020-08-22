Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99AB124E46E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Aug 2020 03:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726938AbgHVBUX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Aug 2020 21:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726856AbgHVBUW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Aug 2020 21:20:22 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A9C2C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2020 18:20:21 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id m8so1922747pfh.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2020 18:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=+grt2lq7z6Xfwjj3obNToZK2iikIyYEevhepcH8Y3zA=;
        b=K5ahScP0ndnTcA/McyN9stxj4UZT171xHGRjMWbB5W8cDeTg/1iLTqmTGsaqDu0fiK
         rfF4DBi8OBRUiMAZBtP8Qx8amcB9RrJEwsC86I3XR89LNYY/IO64eHSPHRS+LFrZIFcj
         HxA4U4qMiFI5/bRQZbT4d6+Ss8gvk4W2oqZeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=+grt2lq7z6Xfwjj3obNToZK2iikIyYEevhepcH8Y3zA=;
        b=iZ+1ez9Z5Hql1W7xwXOovIFkg5re++Jl31MZuzbRQBnZ0JOSc0jbyWhRtBuU1C++Zb
         pB61SFA9y0x1R33HSlmAGNZMoWQ/JaWLuq7+C79Q3cYUFOSmy06B94WmBbH6v2nbhYDq
         gtpPHJeYzhuXAPZ1PmtUk7y+YwFDLBSWx9OC0J0KvWP0qDKwPgZ5eOfabKyVMxfw7U00
         seb5dEV12yaauu0E72R8a9GjL2uBXMexK5KKkY7j0CMj2O8oQIem6e2/deh1Vm5GJv5n
         sLp2ibPNw59bZKQYtp1qnoSDZoZ6AKO9cBE4Enh+BWjqxTptDe84zXuz5fLTMqLx1q/w
         eqXg==
X-Gm-Message-State: AOAM531vQQ/FHT/xuAtMb/ZksGcBs+KX33hoR3QNA7e2eFodHzdH2cbx
        aASYRIuRvx80w+kN0zhF1ADj1w==
X-Google-Smtp-Source: ABdhPJyy/NybCCraoY2LInilmxjLXa17wS6eM5dZSb+zo1iqkBgmWudnyHSBaYln4qN66CDjiBjOJA==
X-Received: by 2002:a63:4b10:: with SMTP id y16mr4067214pga.93.1598059220930;
        Fri, 21 Aug 2020 18:20:20 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id u8sm2912191pjy.35.2020.08.21.18.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 18:20:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200818163119.715410-1-robdclark@gmail.com>
References: <20200818163119.715410-1-robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm: enable vblank during atomic commits
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Date:   Fri, 21 Aug 2020 18:20:18 -0700
Message-ID: <159805921877.334488.15322995741035336582@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rob Clark (2020-08-18 09:31:19)
> From: Rob Clark <robdclark@chromium.org>
>=20
> This has roughly the same effect as drm_atomic_helper_wait_for_vblanks(),
> basically just ensuring that vblank accounting is enabled so that we get
> valid timestamp/seqn on pageflip events.
>=20
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Tested-by: Stephen Boyd <swboyd@chromium.org>
