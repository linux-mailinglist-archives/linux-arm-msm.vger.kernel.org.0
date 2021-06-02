Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 961BB397D6F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 02:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235242AbhFBAFA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 20:05:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235034AbhFBAFA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 20:05:00 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DABCC06174A
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jun 2021 17:03:18 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id k2so428414qvc.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jun 2021 17:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wllkZ5VTRKXKgdK5L5Cgnkwqi9EJFNskFbDefsSBlM0=;
        b=QJR1j66iTgeWmuq4lZx1g+UpoySLqtwPkOKpoafsSJWcYACicFUqsc1gB7FVOGKh/S
         XBOL9ncyfo38z72T4ZU7NgDE7MSv3cmFMn2ZV6lvr1+sFTz2xPrc+OwtoFqB95AYdwGv
         ApJYDcKYhnn1iDA87HLiuk+Z+AgxoevJisrko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wllkZ5VTRKXKgdK5L5Cgnkwqi9EJFNskFbDefsSBlM0=;
        b=jXvHZDeCFE5va+cZftPgtbhqGPESEBddVYEhKhTxIO68dnkwgGtU4vxknMpUo3EcuF
         zDHk0wBRWamkSoKD/xEMpFcken0qiHmzhC4yMsk7GEFYBTQwwgmoFWAJq2MNGQ9EOsD6
         IaI1ORuMoAI298iGE2W49/DqHV700ILPwVluOTDo1LI/Gr7OSISneGQsUbbeiFSRvMIf
         l5LIQhRyXgt1Zx2iIeARl0j5MPT8e9sidWFx+aHbnlVs7tp14IRkwQyq3N94fhPVuexi
         HHDFCDtO81E76PrhNybkoarYg3mhYkAa2U5zJ6wtSSTLlbGNwn3qvYvB6x4f45g3QE1o
         iLfA==
X-Gm-Message-State: AOAM530XqAdSftv1ZgExeBwU6Fqpn4YSOgjvMFRJzWRA7xTLNfCNx6BO
        C+KN7CTEmmPVONvp0ca71via5L/fYk17zw==
X-Google-Smtp-Source: ABdhPJx0ZXhAt9H5ULzVyQVtO/gvjLEJzouhlfO5QBAIBglgOi79tRMC6VOHO9GGTt7vjqy2NmK3hg==
X-Received: by 2002:a05:6214:883:: with SMTP id cz3mr23464990qvb.38.1622592197047;
        Tue, 01 Jun 2021 17:03:17 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id g18sm4754741qtk.34.2021.06.01.17.03.16
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 17:03:16 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id y2so1208855ybq.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jun 2021 17:03:16 -0700 (PDT)
X-Received: by 2002:a25:6088:: with SMTP id u130mr43738372ybb.257.1622592196070;
 Tue, 01 Jun 2021 17:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210601185959.3101132-1-swboyd@chromium.org> <20210601185959.3101132-2-swboyd@chromium.org>
In-Reply-To: <20210601185959.3101132-2-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 1 Jun 2021 17:03:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W_zUuUCo5aixXzMYOBrQ5j1x9FYzdaqf_b+8njSB7gZA@mail.gmail.com>
Message-ID: <CAD=FV=W_zUuUCo5aixXzMYOBrQ5j1x9FYzdaqf_b+8njSB7gZA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Remove cros-pd-update on Cheza
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
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 4 ----
>  1 file changed, 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
