Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8D6441EB9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Nov 2021 17:41:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233052AbhKAQns (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Nov 2021 12:43:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232992AbhKAQnk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Nov 2021 12:43:40 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABFE0C04318D
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Nov 2021 09:39:31 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id v7so46203555ybq.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Nov 2021 09:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6D1/2gQxbnGpVgtWgxnv1w+4Tli42sOLhEgYXuwUzt0=;
        b=h5rPHQC1pu2cvUO8P/os9oYWozs5nxS6ilyRW67A9lewOpt1safImNLBJDrygWkarb
         PzpZ8dA6vavzj0W2VGF42sgjb2jmwNLaM9dimAJlja0oCOyXz0E+ddq6hU5VG/tJNxKd
         hyqO7tWuxUxukFJ1dY2icjvwidsgiAQWOO60o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6D1/2gQxbnGpVgtWgxnv1w+4Tli42sOLhEgYXuwUzt0=;
        b=IzdYXtUCLb6Y+jAopx7L4454JrBmfs8z4H6oXuzzSJZYOPl3reKNwzNyovdcUqLdD1
         q1CfiSRflgnrqFRvxYqM6dbjilb+HcDkYXfJYSkDhw+UabkcYRqmMbx3h1WBBakvcJza
         5fhq9iAN97PZ7Hu1lpjeV8qw0wiSMctIm0yS63Ipph1tJtSq3WxCzF+5YZi5QKuHEe7U
         SJU18lAw0GrubQiIzFbPYpjKQlMJ4JEp/ja0TN2jLZ1ex6hFnH7q7JOMD6TBVEbpvGtc
         9l6WOIkTN+lZOK+c7WD8meyORBxuV48lJwCa252UPXKizgYOshRsI7L2Yb+EqOfP9g0Q
         gbag==
X-Gm-Message-State: AOAM533acJRq4WOAd28KEQzFHLiLnEWwULWbaY2NUfQv2/B9JUEpDpcF
        cQKDpWb+f9Tchc3ugmhtfartnBYplDcNtFo0abUyWA==
X-Google-Smtp-Source: ABdhPJzsXEXrcfS87G/zEfFgnDQZA66KoarVL6ufdAQfXLAqHSAlXoeWEO5FR1YPVUIoTfVeEw9Y37uRrC01PHMHK+c=
X-Received: by 2002:a25:9090:: with SMTP id t16mr15844303ybl.57.1635784770962;
 Mon, 01 Nov 2021 09:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211029152647.v3.1.Ie17e51ad3eb91d72826ce651ca2786534a360210@changeid>
 <20211029152647.v3.2.If23c83a786fc4d318a1986f43803f22b4b1d82cd@changeid>
 <CAE-0n50JTi+62Nzs+Lc4h4PGDdzEV2Ojm+OD+sqM1LDqC_QSow@mail.gmail.com>
 <CA+cxXhmswiRa7urqXAtF0r6qtAMs1PVMydqGM49O6koOOfUDdA@mail.gmail.com>
 <e91a6134-c2ce-6112-0818-ffd9483feeeb@quicinc.com> <55f951c1-1713-ad55-4ca3-b83d4f3763f6@quicinc.com>
In-Reply-To: <55f951c1-1713-ad55-4ca3-b83d4f3763f6@quicinc.com>
From:   Philip Chen <philipchen@chromium.org>
Date:   Mon, 1 Nov 2021 09:39:20 -0700
Message-ID: <CA+cxXh=72ScQ6TVmJt6zU3gMm3EggPXYxsY3TKdHa12kS3AoSA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: sc7180: Specify "data-lanes" for DSI
 host output
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>, dianders@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sun, Oct 31, 2021 at 7:52 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
> On 10/31/2021 2:01 PM, Abhinav Kumar wrote:
>
> Hi Philip
>
> On 10/29/2021 4:24 PM, Philip Chen wrote:
>
> Hi Stephen,
>
> On Fri, Oct 29, 2021 at 4:16 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Philip Chen (2021-10-29 15:27:41)
>
> MSM DSI host driver actually parses "data-lanes" in DT and compare
> it with the number of DSI lanes the bridge driver sets for
> mipi_dsi_device. So we need to always specify "data-lanes" for the
> DSI host output. As of now, "data-lanes" is added to ti-sn65dsi86 dts
> fragment, but missing in parade-ps8640 dts fragment, which requires
> a fixup.
>
> I don't see data-lanes required in the schema, and
> dsi_host_parse_lane_data() seems happy to continue without it. I do see
> that num_data_lanes isn't set though. Does this patch fix it?
>
> The problem I see is from dsi_host_attach().
> If there is no "data-lanes" in DT, num_data_lanes would be 0.
> Then dsi_host_attach() would return -EINVAL.
>
> Let me know if i am missing something here. the dsi_host_attach returns an error if
>
> dsi->lanes is > than msm_host->num_data_lanes. That shouldnt happen even if
>
> num_data_lanes will be 0
>
> static int dsi_host_attach(struct mipi_dsi_host *host,
>                     struct mipi_dsi_device *dsi)
> {
>     struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>     int ret;
>
>     if (dsi->lanes > msm_host->num_data_lanes)
>         return -EINVAL;
>
> Thanks
>
> Abhinav
>
> Please ignore this comment, I understood now. The fix you had posted to default to 4 lanes seems fine.
>
> Will ack that one.
Thanks!
For the other folks: the fix I posted for dsi_host is here:
https://patchwork.kernel.org/project/linux-arm-msm/patch/20211030100812.1.I6cd9af36b723fed277d34539d3b2ba4ca233ad2d@changeid/

>
>
> ----8<----
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index e269df285136..f6fba07220e5 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1696,6 +1696,7 @@ static int dsi_host_parse_lane_data(struct
> msm_dsi_host *msm_host,
>         if (!prop) {
>                 DRM_DEV_DEBUG(dev,
>                         "failed to find data lane mapping, using default\n");
> +               msm_host->num_data_lanes = 4;
>                 return 0;
>         }
>
> I haven't tried.
> But I think it can fix the problem I described above.
> Would you like to send it as a separate patch?
> Or I can do it.
