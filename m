Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE4E1F3B1C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 14:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgFIMso (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 08:48:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727047AbgFIMsl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 08:48:41 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12C60C08C5C2
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2020 05:48:40 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id z9so24837786ljh.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2020 05:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PCNDWi4W86xASW8FtuEfEJaeXXXa1muCZ0DikS2IxmI=;
        b=mPvH/CmSSgHpsp6C/uqGy+AZnrwq9ay/aD+xL69u0ckBRA03GUU6MFGxmh+3CM1tav
         AfWDP7Q9/kw8uNorr4dLbJuH/FugHOrbW0L1kLqWhDSSadhfoReraccYGm4jgU7kawd8
         RGjIDKBu5LhPtGQKJgD/ULY4bXazpgO9iA14JBJv66Y3rQpom722EcFJrvzFlju4+PPd
         63XOl+NUFcOXugFmtxpKQxHGSYD0dz7w2Cx82vNQ64DciwKJ7UBf4oAtnd9ez4db6tPv
         EbJNPf78cg6H1YxzFFexQgQPzILS0+t7j4K95pw+fRVIfPDJAVT7HG2C9pHJDGj5daVO
         vuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PCNDWi4W86xASW8FtuEfEJaeXXXa1muCZ0DikS2IxmI=;
        b=Nb/JCxRXz08PSQIm2AbCD4hVKUJFghbO16NkwLgS+tTJE9sIzv60Nhk7GtY2y4SJF2
         XjnvTDYfDRf8sdRkHN46Z65dZYZK8XCdo2NCuzvD0n0wRrOb1O0AYKKy33IbNsc7Dqyh
         9/ZeN7dgWsdmn269v0eM6z+1jDjuKx6YBCwoEJbG7i+v6okzTc2YOIu22F5WwaFOSP+y
         +195gGyQOoUq37ohpP6gLdxYYfvhZam7Scu5TtQ7EdUcz8hJdScUobWyxEy6+d5jMvrg
         gb6By9VMO6g24Bph80yKAt+/8fZaQUmkOoUTxNm/kLz/qyNdAvO/tOEw0g37iRPBtS2/
         i4dw==
X-Gm-Message-State: AOAM531s2xRRy4BeSUGMA3lidmFe4W1yq2idTy2oEOtBWW2nKEJa0aZc
        8pzCeBLbd1QFNg9iyt/i8s6+9l8LkiAD1dTHs9rZSw==
X-Google-Smtp-Source: ABdhPJy/jDW/k8Iu7wTAdiTg2q3uE99N0IA6oABBl2JcyK9DT3ERhQ6uhNzdJoff9mYZXt3GW+4EBXl7qqFZLpBxRpQ=
X-Received: by 2002:a2e:a40f:: with SMTP id p15mr14419265ljn.286.1591706918718;
 Tue, 09 Jun 2020 05:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200408191458.1260397-1-arnd@arndb.de> <CACRpkdYQJocN_-i07J0fFC16pDUfb9o0mzRF0YRO8UMrE=Suxw@mail.gmail.com>
In-Reply-To: <CACRpkdYQJocN_-i07J0fFC16pDUfb9o0mzRF0YRO8UMrE=Suxw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Jun 2020 14:48:27 +0200
Message-ID: <CACRpkdYUTujUX7FdwFjehFVAOLz_w6epXRzYc8e8yB=zDsRCyw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix link error without CONFIG_DEBUG_FS
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@gmail.com>,
        Allison Randal <allison@lohutok.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 5, 2020 at 10:27 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Apr 8, 2020 at 9:15 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> > I ran into a randconfig link error with debugfs disabled:
> >
> > arm-linux-gnueabi-ld:
> > drivers/gpu/drm/msm/msm_gpu.o: in function `should_dump': msm_gpu.c:(.text+0x1cc): undefined reference to `rd_full'
> >
> > Change the helper to only look at this variable if debugfs is present.
> >
> > Fixes: e515af8d4a6f ("drm/msm: devcoredump should dump MSM_SUBMIT_BO_DUMP buffers")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> This fixes a compilation error for me on the APQ8060.
> Tested-by: Linus Walleij <linus.walleij@linaro.org>

Could someone be so kind and apply this fix to the MSM DRM tree?

Yours,
Linus Walleij
