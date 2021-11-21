Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB76145872C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 00:33:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbhKUXg4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Nov 2021 18:36:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbhKUXg4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Nov 2021 18:36:56 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09D22C061714
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Nov 2021 15:33:50 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id n104-20020a9d2071000000b005799790cf0bso5628850ota.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Nov 2021 15:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nK6iLH75GmtUb32ATKOSnde/+E+3wfkY7819OwR+W1g=;
        b=tIAK7N8qeDwcsrOYeegLESU3yjeCzjY5rIiX4EEDwdf+chivYFSvy+2Nitza/Pb80Q
         14A8tx+AOpiKjOnx83rRYd4dop6NncFsXP02K1iDDen8i0WHFYyA8sNpjYlS3YxOoydB
         LnaofAcDp8tN61UAIBbG8JtRS0lW/y5SnT5U/Zd0E05inCU8lqlQL+njiWcmfSETtHIz
         jwOTRmdOhpxqEiSefD5b1z6Q3DPu/SNHqYCJiUASkDAOg6DZcqbjHidCG5xF0o2H66xq
         tdinMlFK6hZsVvgMIT2QBwypZcPsyni/9E0rJj22oye8AHXt7xiQUArTjpsv9FsHCC8V
         csCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nK6iLH75GmtUb32ATKOSnde/+E+3wfkY7819OwR+W1g=;
        b=dFLi91hJK3GUmhKVH4JYQRsBbL5LWXoTBJFlDPPL2KzvElNIsxG3dl5epwaiJql7s5
         avGs/VgUc/WkGN9NesN2A8AVzOoWuhKfl+FEFWI5gtyppbY1ds+bNGFNh7XdL3vRA740
         w9rG8kVr7/iG5G1iZ1tPAyvmsCU2Yg1b5ZIOzZ8GTQs6W6gwLsJaSheoSQobrwiyfFSo
         F2z2mpQFo7penKmrOeE/2B+ydC7NB/3LonJrLbdXPkHA/U1KWk6qsqMVaXhhlBq9cMfB
         NqOalmWYuDCJa39lD2u6FoVZI0of9fWtw5lcgl5b9pAxELH22XDl84niedZONvWIuF91
         YUFQ==
X-Gm-Message-State: AOAM5326gpv6G7AKFmlmxbW6YEU/SISrytnSzZcaro6civ6VL5lNu24w
        HgvqOu/VXi4ry0l0qONqCaWUxofKIxoCq4j+PwtTDg==
X-Google-Smtp-Source: ABdhPJzPoyhqevkijm4/1yiWLhi9EElDtB0NKEZ9AYKG/+Y9tAiVL7KTF6Yf73Ts6AbzpvwXZGvINPpecXWSHOakhAc=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr20607229otj.35.1637537629279;
 Sun, 21 Nov 2021 15:33:49 -0800 (PST)
MIME-Version: 1.0
References: <1637076915-3280-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1637076915-3280-1-git-send-email-loic.poulain@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Nov 2021 00:33:37 +0100
Message-ID: <CACRpkdaKA=aF4MtUBgLWfFTrkfSyhTkP=eJdL1RS_tzrQ8AunQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: spmi-gpio: Add support for PM2250
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        shawn.guo@linaro.org, bjorn.andersson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 16, 2021 at 4:24 PM Loic Poulain <loic.poulain@linaro.org> wrote:

> PM2250, commonly combined with QCM2290, provides ten SPMI GPIOs.
>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Both patches applied because trivial.

Bjorn, complain if I'm doing the wrong thing.

Yours,
Linus Walleij
