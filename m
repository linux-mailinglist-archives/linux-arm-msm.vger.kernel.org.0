Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE17351CBA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 20:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234822AbhDASVF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 14:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234238AbhDASNr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 14:13:47 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C65AC0225B0
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 08:35:04 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id l13so1723738qtu.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 08:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SPcX6QtS7Ve6UUCNbDaDbB4vAvudpBUFG69ugXPs6T8=;
        b=AHguOOTFAO2NQe8XmSdmlyagtr/wB7GhsgTQRCF/4VWbWuMjMbDGipaw0RxlA0M6yR
         men4W9o7Z3lOPEhONt01til0PnMg/us3/Y7ioK47S+E3qh5tEsfAwsau3lssAXnET16Z
         y4UgVblAdat0wp63BW2m5H52N9VLE+J5QNlQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SPcX6QtS7Ve6UUCNbDaDbB4vAvudpBUFG69ugXPs6T8=;
        b=L07lVFEWhAaNmPGW5R6W3JLMA4wzCLGHUacLFzbYKecaLdMJXM4cPVSxd/rEpHW1L3
         z+3CX5Wip766k1Op0TgAOdWkFeX+7FddcNckhHKFn6YdGUTv4GqvYJ6hC0B6je8OzEXP
         +DXo1F1dTRTXbqmcblfFJTLj1rL+Ip7+fQHlrDY5PXkdbMzmCeQQTAn7UhGKLNlUUOV0
         e+qdALRonUJFYdMQtS+9AzB35AEQRNou2xUfFbjuXo1eqVRo3aYJTDrU2u6RZvIvIDzH
         9MSAte1PXTclOv82GB189lqzAnvJZln5qcPITy/DQbaa7V7eMUniDHxUw+YIzZw2fUdG
         A5kQ==
X-Gm-Message-State: AOAM531+jtDK+jnNUX595zzjhEyaeRRIWOIPzwkHeQEA/XpPf8SpAkJ4
        P6AharWo4sYx71CXL32NQJThoD95Kln16A==
X-Google-Smtp-Source: ABdhPJwXxbyzTNIl+6m9Cwpj+W0QZ8P0eWOTRho6ia/Q8nKJ3gnuhrWA50OiWXm8LBQ1X0KvFH4W0A==
X-Received: by 2002:ac8:a4c:: with SMTP id f12mr7816736qti.329.1617291303247;
        Thu, 01 Apr 2021 08:35:03 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id r23sm3723282qtc.31.2021.04.01.08.35.01
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Apr 2021 08:35:02 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id j198so2175790ybj.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 08:35:01 -0700 (PDT)
X-Received: by 2002:a25:74ca:: with SMTP id p193mr12383521ybc.405.1617291301361;
 Thu, 01 Apr 2021 08:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210331221630.488498-1-robdclark@gmail.com> <20210401012722.527712-1-robdclark@gmail.com>
 <20210401012722.527712-4-robdclark@gmail.com>
In-Reply-To: <20210401012722.527712-4-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 1 Apr 2021 08:34:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XQoauA5kzmmj5ask_sK19mJycYLJfAOeriXsr2pvxaFw@mail.gmail.com>
Message-ID: <CAD=FV=XQoauA5kzmmj5ask_sK19mJycYLJfAOeriXsr2pvxaFw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm: Fix debugfs deadlock
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Mar 31, 2021 at 6:24 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> In normal cases the gem obj lock is acquired first before mm_lock.  The
> exception is iterating the various object lists.  In the shrinker path,
> deadlock is avoided by using msm_gem_trylock() and skipping over objects
> that cannot be locked.  But for debugfs the straightforward thing is to
> split things out into a separate list of all objects protected by it's
> own lock.
>
> Fixes: d984457b31c4 ("drm/msm: Add priv->mm_lock to protect active/inactive lists")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Tested-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Douglas Anderson <dianders@chromium.org>
