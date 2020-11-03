Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D71F2A3B22
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 04:48:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbgKCDsx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 22:48:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727109AbgKCDsx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 22:48:53 -0500
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B077C061A48
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2020 19:48:53 -0800 (PST)
Received: by mail-io1-xd43.google.com with SMTP id r12so8091881iot.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2020 19:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=356DvTETJyiGqigir3KqVa/M8PT+DOU3v5yq9tbXO5Y=;
        b=h6ajoktJyyYPVqAu19y/Soi4oOwDxm8ve3d47LilDvB5z3QXDfpeUIGcSr4jQLFKNf
         pkgCpHeR6E6hyZ1ap5nMc2ZQTNTgKH2jcboQLM66k1PkDorjJN6MKK2LeNt4kiW/DJy5
         1t7F6h6Wkeq/Ma4XS72ppen4Lfm0tLgkI1/yUyLwbXg/lIMycywAwP9BKIqqpZNWTbVU
         AEaqtK9ExezIUYYpdTTRrE9+IUg8y4q7I5GjmLwlD/qTrpI0xu1Q5hSVn7GYH2w5pT64
         PImq4JwM4zpxHTCqIGp8v8G+0dGsG/DLtAwgn4qNQ0SVfqHTv0phVtYfBL4C8C2qLwgA
         SVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=356DvTETJyiGqigir3KqVa/M8PT+DOU3v5yq9tbXO5Y=;
        b=G8svMGr1reJBzb25iA70MbM3/tNg7s7fIZtCwwCoAa49f5DTebqyIoZ843BGrbAWjD
         kyCNGJfWZbiZJxq8Oh2ROmI4BHozoKRTLsJMtJGO8DcXPZ0BicQ6t2KLDfZ+WOPwYq2S
         fr8KdzEowwxRTaAIs7pHDmfLhbjO5AjdRhUtrVV+9eICso4bbhB5+fqAcZna7QsaFsOS
         ibbIr57RkhDquf8KjrkQrItQHawC/GvKF/WV+I7B0hG7EFQqSAkQYcv8eLrCq4ng8SME
         yCoXKKI5Ugoak2Qe6lGFn421QOFytQ5kb/+2Xcqz0OT6aZK975ta8qKl0VvCH2j0zgt2
         RE9w==
X-Gm-Message-State: AOAM533X/kIbT6+qFTIQWRPNzMAjrw1mW1Cad9GIxW087UX2eqGbm2R8
        fZxlR7ZlNc0+DzbkQUrYJVM+w7m1XGTelb2A0ouG7w==
X-Google-Smtp-Source: ABdhPJw+sKAlWbLH9dvti6+ofKTt1hG/S9sKvy/nAe/EwnWKMwnJ85MPubKgZF3tzrQnZSWrtQvv2H3QP9t21aUfICw=
X-Received: by 2002:a02:1c8a:: with SMTP id c132mr14676862jac.126.1604375332462;
 Mon, 02 Nov 2020 19:48:52 -0800 (PST)
MIME-Version: 1.0
References: <20201103025347.510940-1-ajye_huang@compal.corp-partner.google.com>
 <20201103025347.510940-3-ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20201103025347.510940-3-ajye_huang@compal.corp-partner.google.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Tue, 3 Nov 2020 11:48:41 +0800
Message-ID: <CA+Px+wV8z_S09RiespXQiuYm=JRA1JMAPS7MK5ZAFTdaR_DdCA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] ASoC: qcom: sc7180: Modify machine driver for 2mic
To:     Ajye Huang <ajye.huang@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        ALSA development <alsa-devel@alsa-project.org>,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 3, 2020 at 10:54 AM Ajye Huang <ajye.huang@gmail.com> wrote:
>
> In addition, having mixer control to switch between DMICs by
> using "dmic-gpios" property.
>
> Refer to this one as an example,
> commit b7a742cff3f6 ("ASoC: AMD: Use mixer control to switch between DMICs")
>
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>

LGTM.

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
