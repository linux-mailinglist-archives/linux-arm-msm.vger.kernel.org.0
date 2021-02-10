Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A33D317495
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 00:42:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233896AbhBJXlo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 18:41:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233800AbhBJXln (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 18:41:43 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89DA5C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 15:41:02 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id g10so5102206eds.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 15:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anholt-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=vM//4U9/+YKnq/E5n2pFW1Akp/52mAADNYiWm65AElA=;
        b=iLbknNn8g5cXQ9Y5WEZB/SuN/D7M44YoydiXZwO90Ea603ZhkZk+X2DhxR2l/7Ou7W
         O9lbiJXseLd5lHzZXZXHBHf3rC5nAkVCv1/mhuxcvVL6B9jzWe6McyoFHB7NwMfZ6jLj
         FQWDrTow6HC7XADzkQz+NStxb4/OrSKj+PUp3/S3HR+wpZoP2TFcqoA1fcK1/iykCQOf
         IlV8wPg5jqpMj3TwEcTnxIoQZ9cF2eLGIo0/0zTnuZb/HKNUzwQlBxqw3m6ZB4w9QjQs
         bdV7YGO0n0NsfBuyAvU/hJvlACy90vZ5b+xRW3YcJapCxclEQaRVwLbB1BgqIa2NT9Qr
         kAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=vM//4U9/+YKnq/E5n2pFW1Akp/52mAADNYiWm65AElA=;
        b=TxRgtbAH3t/Y3wh23QZTg5lea0EK2Ez9rSh8o8hDH3BmB3zjxWIodi1EHUcr0bbIiu
         0QRpccfRjDaoeN7Lg6FbMJTfHq64hfvKOHClgRfj6O0NvO5HKUHIQD3oNAK76+9jT60b
         LTMG9XRX8AuocSMZf28qK7K9lzXmYEt2fy5Fn+Y1k9d8ixtehtvmdeO3n5wL9RvWteHZ
         crHvHBFHPnc5inDjdGCoEPjdbmXpa04jHU16f4pgCKhOl5D2phh4K9seoOy+iDHKO6tg
         Qh2hED0y7xH8+bj3zSsYuBy66IsdU2/7C3FQVZT00nElsXPtp32XXOmhphQ4KDz0i853
         6u2A==
X-Gm-Message-State: AOAM532WslXlTMQ1A+LWidBmD7y45Qy1LluCyy18324FmuPOq30kzTXm
        2qUQw9AruwVmNBFLga8t6iY6xuiRDSu+QkOA+YfmiQ==
X-Google-Smtp-Source: ABdhPJyzOOsjzeNegxjWLA64CRyamr52BQ7tdtH8yRwCD3yHfBmFpCDjXQjjyBdheo2dwUS59Eb4MOAlE+OG71etSGo=
X-Received: by 2002:a50:fe11:: with SMTP id f17mr5530428edt.88.1613000461311;
 Wed, 10 Feb 2021 15:41:01 -0800 (PST)
MIME-Version: 1.0
References: <20210208185557.15703-1-jonathan@marek.ca> <20210210012450.GA26503@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20210210012450.GA26503@jcrouse1-lnx.qualcomm.com>
From:   Eric Anholt <eric@anholt.net>
Date:   Wed, 10 Feb 2021 15:40:50 -0800
Message-ID: <CADaigPWA8Vw6YxAFztorYN_zQsX=y5U9X_N_TBRcB8Hd3U61Tg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix a6xx_gmu_clear_oob
To:     Jonathan Marek <jonathan@marek.ca>,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 9, 2021 at 5:24 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Mon, Feb 08, 2021 at 01:55:54PM -0500, Jonathan Marek wrote:
> > The cleanup patch broke a6xx_gmu_clear_oob, fix it by adding the missing
> > bitshift operation.
> >
> > Fixes: 555c50a4a19b ("drm/msm: Clean up GMU OOB set/clear handling")
> > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>
> Thanks.  I feel silly that I missed that.
>
> Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

Yeah, oops.

Reviewed-by: Eric Anholt <eric@anholt.net>
