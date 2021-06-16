Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A430B3A9E9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 17:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234428AbhFPPKF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 11:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234011AbhFPPKE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 11:10:04 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD6E0C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 08:07:57 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id o5-20020a4a2c050000b0290245d6c7b555so748006ooo.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 08:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j51VtbWEsPmNthXDSqqlA/0JAvr0xhkR2POpSAUOx9c=;
        b=ZUIi2qzqYGHwJx+79Fc4944r16x9UMQqqYLtcBz8HCOT0nsZkxfGcmRp23lvyNfAP+
         2knAodSGIE5+PM0wcoqn9rQAvNIbG2+5Sas5+iUH6G+5iioPe8sGy4aqBr4h9MHBFQLA
         j4DhsbCGODeTQCqVCt1gM8KYJ3xJ2R6oiax+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j51VtbWEsPmNthXDSqqlA/0JAvr0xhkR2POpSAUOx9c=;
        b=aC3QA74bnm+LTJZihEl85UT6jcsBXDAJARuXEjB87Qu/Meqa95yndeL/a1AorG71Wl
         8l7sXVjQUWuuotrz0zhoY2Z2twrUgo6+9KDLDhWtx1d+KrH7AmahmTT5/QxTTom9/H6W
         5/S8Bzr62T8UrTCi8LNtNZFGPUIg+ZAfwv0iULS39B0HT56ZLjVKhhL1f1x0053YttN8
         B7a606MSJmnTBC/PQ0j67sN07nrgC/iwoUZn12jKjmnZt3VcV7WZdrBq616vxzmEqaUC
         Wk5DeDAWYqzj3NmQxQ+FzqzceaO+ryV3mx4vfzLDcvUx51Bfnxa9KWyeVaDVB0Jotipx
         MPng==
X-Gm-Message-State: AOAM531ESErPgSrsqZjxxLKQsmS6052/REkb8/3YB65wph5EE+JrO6DL
        TDdfgMVK8F5cirl5+mZyLZD8m0ZvXiFxGw==
X-Google-Smtp-Source: ABdhPJx4IEC74b+AZx7qBkIQtGfSfPTpymFx2MtMXU+YWC/4x0sFfLSn5GlEquaPh0Xh36kP+cjFTw==
X-Received: by 2002:a4a:d781:: with SMTP id c1mr396631oou.23.1623856076970;
        Wed, 16 Jun 2021 08:07:56 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com. [209.85.210.52])
        by smtp.gmail.com with ESMTPSA id c205sm475263oib.20.2021.06.16.08.07.56
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 08:07:56 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id 66-20020a9d02c80000b02903615edf7c1aso2748859otl.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 08:07:56 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr207252ybp.476.1623855739461;
 Wed, 16 Jun 2021 08:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <1623499682-2140-1-git-send-email-rajeevny@codeaurora.org> <1623499682-2140-6-git-send-email-rajeevny@codeaurora.org>
In-Reply-To: <1623499682-2140-6-git-send-email-rajeevny@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 16 Jun 2021 08:02:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V2_LJkXX-9v2ArSspKHy6PABn1E-hkCOeT=Dk5R0CQ+Q@mail.gmail.com>
Message-ID: <CAD=FV=V2_LJkXX-9v2ArSspKHy6PABn1E-hkCOeT=Dk5R0CQ+Q@mail.gmail.com>
Subject: Re: [v6 5/5] drm/panel-simple: Add Samsung ATNA33XC20
To:     Rajeev Nandan <rajeevny@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Clark <robdclark@gmail.com>, Lyude Paul <lyude@redhat.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Rob Herring <robh@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, Jun 12, 2021 at 5:09 AM Rajeev Nandan <rajeevny@codeaurora.org> wrote:
>
> +static const struct panel_desc samsung_atna33xc20 = {
> +       .modes = &samsung_atna33xc20_mode,
> +       .num_modes = 1,
> +       .bpc = 10,
> +       .size = {
> +               .width = 294,
> +               .height = 165,
> +       },
> +       .delay = {
> +               .disable_to_power_off = 150,
> +               .power_to_enable = 150,

As per <https://crrev.com/c/2966167> it's apparently been discovered
that these should be:

.disable_to_power_off = 200,
.power_to_enable = 400,
