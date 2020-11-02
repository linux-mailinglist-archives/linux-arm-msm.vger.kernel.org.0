Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A077C2A23E0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Nov 2020 06:06:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgKBFGV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 00:06:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgKBFGV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 00:06:21 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 163FFC0617A6;
        Sun,  1 Nov 2020 21:06:21 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id j5so6248822plk.7;
        Sun, 01 Nov 2020 21:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0i5kulrXeAXUUmHumUD66U2ITbxD8qnUW4/n36OfF0g=;
        b=oxLWWeV0SaX8q4sdK7/2sB2mbbneJH+6xiBYeqoFyU0KRp6CX4AAHRz6ZcIpCMuGs1
         K57ec6IiNS0f09FIv7F0ALXBwtlgJkApB7AmFEzolud2Scts1RGkIMpChWza8ZWYqq32
         iG9jnd6FoC1qoTUt8FG+Tqh96LB63osUaZFzASsd331qTXlfszZF8qEYTXDyIEPza1g6
         rCQ6+kS0iVGm1BZVWvdi5ujQ+XT4q5cIgozr9tH4CuJAWawDb1tPvyX1UyBa64dZOmY/
         Qseu2Xk2wdM8W4NJUc/aIg4txizhbYAMC1xRU1E+saPOrw0Lb6Opw2ZfetN7H7my9w9C
         FGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0i5kulrXeAXUUmHumUD66U2ITbxD8qnUW4/n36OfF0g=;
        b=TdFcON4xECEqAq8l0KuK9gJOM6sIOmDzkqV+exAz+lpzk+7XzgO6tNO4u3hrrV86sl
         98XD0xf+z6fG5x1vH6qxichtqWYHpiPuR/H3QWC4Jw72gi+bYkh1GbM0s5zSrWMXByQp
         f5z8Zy/OhZ/RdZl3r00YVaxzE4DbgO5YLvsIaQA1f86QGI6jlebnYCEAPg8L3FYL/VwA
         rC8NQHIiQYqdd2BpdgC8LMI6kGHaRrZWViJ3rO+YPlof8abuzgddeHb3CfcFiSSe5AVi
         XayiZDuisKorGgIC2n9rQwG1wP9W4UKuC0ixVWzpdYGIPanUjb9uNwoNANEtv8CM0+Xr
         f7Vg==
X-Gm-Message-State: AOAM533ZRYskGWpmWSMM+cpSfV4F6DsvD9oGLy16MdT2Na4WMB+yrmsI
        7EYNs7Xea6+4AKAOSMJiy0HfLSR8BYpoHkDLO9I=
X-Google-Smtp-Source: ABdhPJzWpC1jLa2KqR8b6+I+di15SNciBGq8RyUOeA6dDIbQSFfhtHxvZw1hOKfw0BDne7Nf3l3IdI42sswxOrnNTvA=
X-Received: by 2002:a17:902:8eca:b029:d2:4276:1b2d with SMTP id
 x10-20020a1709028ecab02900d242761b2dmr19651785plo.17.1604293580359; Sun, 01
 Nov 2020 21:06:20 -0800 (PST)
MIME-Version: 1.0
References: <20201030075724.1616766-1-ajye_huang@compal.corp-partner.google.com>
 <20201030075724.1616766-3-ajye_huang@compal.corp-partner.google.com>
 <CA+Px+wXPRg7aDU5+vr6R_BxuFfhuDeG3iEQeAUKWNtX8YmVC1Q@mail.gmail.com>
 <CALprXBZ+NmR8Y4sMkh4Y-N_FG+rGEOhUBVTKXRXNFp8H+f0btw@mail.gmail.com> <CA+Px+wWouXWS2F+Bqs3MkJxCuXORhpXcUF5ZuSHo6exprBF4hg@mail.gmail.com>
In-Reply-To: <CA+Px+wWouXWS2F+Bqs3MkJxCuXORhpXcUF5ZuSHo6exprBF4hg@mail.gmail.com>
From:   ajye huang <ajye.huang@gmail.com>
Date:   Mon, 2 Nov 2020 13:06:06 +0800
Message-ID: <CACCVik-enBjUsaB1cZPb4Dp01Wj222jsT5Y-fjSL5E50XAFLcA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: qcom: sc7180: Modify machine driver for 2mic
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
        ALSA development <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi, Tzung-Bi
I will release v3 version base on your suggestion

Thank you for your reply
Ajye

Tzung-Bi Shih <tzungbi@google.com> =E6=96=BC 2020=E5=B9=B410=E6=9C=8830=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=887:19=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Fri, Oct 30, 2020 at 6:55 PM Ajye Huang
> <ajye_huang@compal.corp-partner.google.com> wrote:
> > But dmic_get() will need dmic_switch, should i keep dmic_switch?
>
> I see.  I overlooked it.  You can keep the dmic_switch for this
> purpose or just call gpiod_get_value_cansleep().
