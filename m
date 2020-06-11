Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 958021F6CDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2020 19:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbgFKRgd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 13:36:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgFKRgd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 13:36:33 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37E58C03E96F
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2020 10:36:33 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id d67so6132881oig.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2020 10:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jrCOk7vsq1IE7uGd57AzoLSP1ALvkvtrfTao0LV5h+4=;
        b=PjCLvAgUk17O5rGvaRSULcAXIKgAeNPYfQj4+nc/jEDzvDt79xSOJ9y90gnyDsej57
         d6kv8CTeKJDW3tgsSbIhUH7B684pz0QDJS1PAC3ELlVYxup3lQZTLhIejtwsgQQWCbBm
         whcIjLz3Q4YA0rJbpmM7ez8cXb5PsSzB5hLw90jsFbfweSA0DgsHHTj0a3UpXNkTiXsK
         FHCNP6NH+PXkniJe6PD0IrUkKYLC/AfJYgTbByfESpbB7Eh6RWa3w2B8JexkbcgtqPsr
         BKFM8ErfoR7rUDwZJTpr2FypGZPTKX734j7VFNPPb3SuZIWCuP8HJJ3I2VIKp5nax4vd
         X7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jrCOk7vsq1IE7uGd57AzoLSP1ALvkvtrfTao0LV5h+4=;
        b=E78dY2aTL9fDX1uqVqa82d/XmU3jN0Fca6Nk/CRLe+2SG2awp1m85FPkThQLQaBp6g
         GRUxzy3Eq5TLIVIv3DpmDvgTdeTGiOFkH8Om31floj2wm8hAwHgdqzPs5nxVX30wK0d1
         aud1P1ENWA9FiZ5sNQAh6Z82R2QIyh0mUo20qoKBUB8FhTSgInCO8FaMa/zWwsdGoB0/
         BhPHySlG6QWM6UpzoDw2f8Qibg4GI2zRmAJ8eperSMbaZjkvpsc/jR8COrObbZwdgXGt
         iNetAY0xRKAoSarW2THqzHDry9voPhGx/b+BAutGxBZ3EkkT8ZpR9dUzK+4AEx60vtWB
         46+g==
X-Gm-Message-State: AOAM533LFD3+bHPfEk+plHNzv4+i5TG9sGM3XYYV4KtPm8JiApGv+qjE
        kmLbaG/LDt8cBFriJlDE701D1hbiEIdmsuwDnAjaUQ==
X-Google-Smtp-Source: ABdhPJzBOdT+Dsmoz25Sk2BkH7lQgOo+1veTThTfIOcpemZoPqBRr3Bokq20sHjcYAD8NriytacdHguqDLTVuu4eLUw=
X-Received: by 2002:aca:2108:: with SMTP id 8mr7354040oiz.10.1591896992417;
 Thu, 11 Jun 2020 10:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <1591880115-12721-1-git-send-email-mkrishn@codeaurora.org>
In-Reply-To: <1591880115-12721-1-git-send-email-mkrishn@codeaurora.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 11 Jun 2020 10:36:21 -0700
Message-ID: <CALAqxLWnXD4XzGU=7mkLCyAkN1ONB=NRne9y8PxPWGZg4hgX8Q@mail.gmail.com>
Subject: Re: [v1] drm/msm/dpu: request for display color blocks based on hw
 catalog entry
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno@lists.freedesktop.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>, hoegsberg@chromium.org,
        nganji@codeaurora.org, Matthias Kaehlcke <mka@chromium.org>,
        Doug Anderson <dianders@chromium.org>, abhinavk@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 11, 2020 at 5:55 AM Krishna Manikandan
<mkrishn@codeaurora.org> wrote:
>
> From: Kalyan Thota <kalyan_t@codeaurora.org>
>
> Request for color processing blocks only if they are
> available in the display hw catalog and they are
> sufficient in number for the selection.
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>

Tested-by: John Stultz <john.stultz@linaro.org>

Thanks so much for the quick fix!
-john
