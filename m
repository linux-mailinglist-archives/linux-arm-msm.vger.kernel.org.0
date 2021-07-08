Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 840EF3BF615
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 09:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbhGHHRO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 03:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbhGHHRN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 03:17:13 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6953CC061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 00:14:32 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so4936681otl.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 00:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=EExaHI1thjef0RoUFOMDogl2sDpmm35wAYmQrG+YsrQ=;
        b=dxC2cDjRWk8y0DcKuvUIf6RY4Um7IgIWF4hpiAr6MhIyIw3kZ7WnFuPA6CoD1tgorB
         vwcBXRWBk0O+IzOMw03wYyvVRfLIe63zsI7ljfvMFzfylTasJNEdDzKa29/IKCFsSzY0
         vPZ/leRChW2En9Nfbw4ZSh9DSaua+jT75xtxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=EExaHI1thjef0RoUFOMDogl2sDpmm35wAYmQrG+YsrQ=;
        b=hArOAJyeUKzj2jzT3cK3Zv+mZtqX7ORdVfQHkyHsnERYIJzKbxPikAN/m4TSMgOOMI
         LqQ1E/gRg2OY1pH8o/zQZxmfS3Vuygjhu+MLMUGDpLqvfo9B18Bx5yI4/JIzbfByfZE1
         g7fgnI6DaJ+9avToZn5j0qehcz+18taacB/dBqvSM2hRHqgITzBpFBAacHarru8cx7EO
         4tvec3H1LTzpKCwg3tL88pUShH8/m25dpswMwYtpckfSWUmTqyKOwbBNXA4LTDX+uOsv
         WowF0HigXwX7P8FMBGqJBIWDlOVT2S1XK53KFeDwCSrOaR56MDIuikQhPt4tiKrq+zdc
         IHrQ==
X-Gm-Message-State: AOAM530M7TPUFNvgaUKRilds/qPH4q0+iSLeBSVl9YzXRZM3KYbExZzP
        lLPmSRDLRNxPI6j85cmm047WCtlrDXMrpTIsNQLGUQ==
X-Google-Smtp-Source: ABdhPJx7ElYsrePGFPR2BFjaZQI/FirCtlNOKAZzX5n2/4/kEnVJ5rYSzPPfVR+nmzhjQgoBci3gJw1a23+7SGL7XWs=
X-Received: by 2002:a9d:2781:: with SMTP id c1mr22131987otb.34.1625728471826;
 Thu, 08 Jul 2021 00:14:31 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Jul 2021 07:14:31 +0000
MIME-Version: 1.0
In-Reply-To: <1625592020-22658-6-git-send-email-khsieh@codeaurora.org>
References: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org> <1625592020-22658-6-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 8 Jul 2021 07:14:31 +0000
Message-ID: <CAE-0n53BnbjD3QaZ5vynJxw44ANatvvRW3rqytyG4jvjKs7L_g@mail.gmail.com>
Subject: Re: [PATCH 5/7] drm/msm/dp: return correct edid checksum after
 corrupted edid checksum read
To:     Kuogee Hsieh <khsieh@codeaurora.org>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-07-06 10:20:18)
> Response with correct edid checksum saved at connector after corrupted edid
> checksum read. This fixes Link Layer CTS cases 4.2.2.3, 4.2.2.6.
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_panel.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 88196f7..0fdb551 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -271,7 +271,7 @@ static u8 dp_panel_get_edid_checksum(struct edid *edid)
>  {
>         struct edid *last_block;
>         u8 *raw_edid;
> -       bool is_edid_corrupt;
> +       bool is_edid_corrupt = false;
>
>         if (!edid) {
>                 DRM_ERROR("invalid edid input\n");
> @@ -303,7 +303,12 @@ void dp_panel_handle_sink_request(struct dp_panel *dp_panel)
>         panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
>
>         if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
> -               u8 checksum = dp_panel_get_edid_checksum(dp_panel->edid);
> +               u8 checksum;
> +
> +               if (dp_panel->edid)
> +                       checksum = dp_panel_get_edid_checksum(dp_panel->edid);
> +               else
> +                       checksum = dp_panel->connector->real_edid_checksum;
>
>                 dp_link_send_edid_checksum(panel->link, checksum);

It looks like this can be drm_dp_send_real_edid_checksum()? Then we
don't have to look at the connector internals sometimes and can drop
dp_panel_get_edid_checksum() entirely?

>                 dp_link_send_test_response(panel->link);
