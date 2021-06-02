Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B63F397D6D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 02:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235180AbhFBAEo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 20:04:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234766AbhFBAEn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 20:04:43 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF44C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jun 2021 17:03:01 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id eb9so425178qvb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jun 2021 17:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4c5M/4ASBDazYuMTsoBgKbQDxXIKQJjbqe689VN4ejk=;
        b=kxYjkg/NBi6qjStnO92K4KhaG9Arp5oxtgla+7JNqQSYIHPOW6FRszAVRa6J2ZS1MT
         rtgXu5cAW8N2sAXmhNIDIF7d1eH7vgQ2ZBH1+FlRUnVXmUsjhm4q5L39e/sWWcgYj5pL
         hdfhmVnItYHJIxaLeHfR+nAdelMyolletTY1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4c5M/4ASBDazYuMTsoBgKbQDxXIKQJjbqe689VN4ejk=;
        b=LlCYqk4LKx8+9OCoJ8zs7d7/ND0HLmSzv3xhSB09Gn9ZFMSinaEOhIjAuN1f/IXwwY
         A6rsJK9UHkiBFRKkQUGFOs5zWTjTZVvUjNxc9jagKVgrK+2eaMPR+CsWcrZUY1OTxVyf
         2Jsfy92y0Wq5yjtyOWZXa+NDKuO5zzv95jQXWHdQx/8hfdeTtd4L9AVSPuKC2bRrJVcb
         GX2UKVDbGNXwwlrH/6OXrfxC8bIVlsDbC/UuSfqHB88EA5qwnyW2s0aJaq0HGlg/hDxh
         +gf+GcvXvnSfZoNSD0EFNyqji9LFB6oSa5t+XrxqKYf8gQnN/fzFKkBrm0pbY973lAFL
         NDtA==
X-Gm-Message-State: AOAM531Bkc71HmOTzorKVxL2JzAC2PCgm52/yD/ymPEvhEe+5bREd96V
        CM6CDJnyliYEssNP0O/T+UdqDLL99ox08g==
X-Google-Smtp-Source: ABdhPJxyQ8t7lvZGQsQCGzA5QPH+OFqhbpWfGI0KWaxx9/WiBRaOjt3RgBjhNP8hQDZ1M3OigOmD1Q==
X-Received: by 2002:a05:6214:c49:: with SMTP id r9mr23188001qvj.1.1622592180511;
        Tue, 01 Jun 2021 17:03:00 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id s18sm1539390qtk.85.2021.06.01.17.03.00
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 17:03:00 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id n133so1268334ybf.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jun 2021 17:03:00 -0700 (PDT)
X-Received: by 2002:a25:80d4:: with SMTP id c20mr42463237ybm.345.1622592179611;
 Tue, 01 Jun 2021 17:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210601185959.3101132-1-swboyd@chromium.org>
In-Reply-To: <20210601185959.3101132-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 1 Jun 2021 17:02:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W0qN3EqFFhftvU2AoSj5S4fV-14tCifGLiv4Rmoh9dsQ@mail.gmail.com>
Message-ID: <CAD=FV=W0qN3EqFFhftvU2AoSj5S4fV-14tCifGLiv4Rmoh9dsQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: Remove cros-pd-update on Trogdor
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jun 1, 2021 at 12:00 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> This compatible string isn't present upstream. Let's drop the node as it
> isn't used.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 4 ----
>  1 file changed, 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
