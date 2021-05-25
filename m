Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5834A390760
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 19:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233726AbhEYRVd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 13:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233698AbhEYRVN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 13:21:13 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B42C06138D
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 10:19:30 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id q10so31181621qkc.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 10:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0I/7mJjy8fAtyuQW3u9pKYduA4z2KSC8v2zpf0k2q4Q=;
        b=LoEAi62rRu7tHFsRIAnERe0Uo6+lB7bp00VbsoFCad2BNA4J/p4XQRSUgdI2W2YwpI
         BCwReshEWdDvXBR49YxtAe1g92O1OceM2w/LWlaEzlpySS/rDNROaMb5tLKesjeJPP0X
         CNKYpCq57mgvBz5whA92hLzX7uNngLYIcuAIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0I/7mJjy8fAtyuQW3u9pKYduA4z2KSC8v2zpf0k2q4Q=;
        b=pJVqmhYXzF0188TILh+qf1l5JlJJZs0D9EMlt37xc45ZacxXG0o1o9JnoYe/BrsTA7
         2AxYfPFRPs9r75gFgfuK4qEKZFaVvrcrq5DnxPvvIq+vR+WNU1zY2VhBGDDVXmJ5Xxwi
         UT+9I0ZmY3u9dFo8dUCzWqg4zI1bRzlZwEzwijvU/PkIXi0/8EDxVHPvY6v+aU6KyAHJ
         LwHSocsvpZUdHph1e4gc5gzAO3rwo5BZ9UTuaym/Hw10b2fisCrdrPCXlpNfPf1yYwmF
         /TUdNhDiRfDnai8ksTyhQHYzSA7FZiN3IDSjB0zIf3qXYEE67VwwVv6KEeZJpohFz1GW
         52jA==
X-Gm-Message-State: AOAM532PPIniL2jWvw4XuSpB5c+/Yicv/2uApl98qwyqTx1Y5fFdupzu
        ONoWUOID5P9o4JmznUv3dsKWTVB/zunsFg==
X-Google-Smtp-Source: ABdhPJx1fNUb+ecuxPwmRmKWEJOenQ5ekTJFSZwXprW0Jan30q1ij47PKYoYXKTlnsiMb1xrziT5xQ==
X-Received: by 2002:ae9:eb12:: with SMTP id b18mr23738220qkg.459.1621963169894;
        Tue, 25 May 2021 10:19:29 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id j16sm12689495qtr.27.2021.05.25.10.19.29
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 10:19:29 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id y197so2387069ybe.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 10:19:29 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr44274582ybp.476.1621963168291;
 Tue, 25 May 2021 10:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <1621927831-29471-1-git-send-email-rajeevny@codeaurora.org> <1621927831-29471-5-git-send-email-rajeevny@codeaurora.org>
In-Reply-To: <1621927831-29471-5-git-send-email-rajeevny@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 25 May 2021 10:19:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X=VtC9EGyxUGptRN1=PcKwyWLEyRfA9J1frTVPCKY68w@mail.gmail.com>
Message-ID: <CAD=FV=X=VtC9EGyxUGptRN1=PcKwyWLEyRfA9J1frTVPCKY68w@mail.gmail.com>
Subject: Re: [v4 4/4] drm/panel-simple: Add Samsung ATNA33XC20
To:     Rajeev Nandan <rajeevny@codeaurora.org>
Cc:     y@qualcomm.com, dri-devel <dri-devel@lists.freedesktop.org>,
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
        Kalyan Thota <kalyan_t@codeaurora.org>, mkrishn@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, May 25, 2021 at 12:31 AM Rajeev Nandan <rajeevny@codeaurora.org> wrote:
>
> Add Samsung 13.3" FHD eDP AMOLED panel.
>
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---
>
> Changes in v4:
> - New
>
>  drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index caed71b..21af794 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3644,6 +3644,37 @@ static const struct panel_desc rocktech_rk101ii01d_ct = {
>         .connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>
> +static const struct drm_display_mode samsung_atna33xc20_mode = {
> +       .clock = 138770,
> +       .hdisplay = 1920,
> +       .hsync_start = 1920 + 48,
> +       .hsync_end = 1920 + 48 + 32,
> +       .htotal = 1920 + 48 + 32 + 80,
> +       .vdisplay = 1080,
> +       .vsync_start = 1080 + 8,
> +       .vsync_end = 1080 + 8 + 8,
> +       .vtotal = 1080 + 8 + 8 + 16,
> +       .flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
> +};
> +
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
> +               .hpd_absent_delay = 200,
> +               .unprepare = 500,
> +       },
> +       .connector_type = DRM_MODE_CONNECTOR_eDP,
> +       .uses_dpcd_backlight = true,

From my feedback on the previous patch in this series, I believe the
"uses_dpcd_backlight" property should be removed and this should be
auto-detected. Other than that this patch looks fine to me. Feel free
to add my Reviewed-by tag next spin when that property is removed.
