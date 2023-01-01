Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 473C765AAAF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Jan 2023 17:38:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231557AbjAAQim (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Jan 2023 11:38:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbjAAQil (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Jan 2023 11:38:41 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EE68F47
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 Jan 2023 08:38:40 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id o31-20020a17090a0a2200b00223fedffb30so26198175pjo.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Jan 2023 08:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mc1B01KqzevdpjMajtl5h9LEaPSHWJodP26+oaFdvjY=;
        b=NzLcuMT+b0jS961KhEJ1C1zDTTzqTYi99bOLgRL4OZGrP9xQbDvaf68yTHafQZlclP
         B/1+E1mQTIftHVenpY0PhVG5+oTGc56vtBO8W/QXJSPKAgeDxwKRAOqY+ob/6J4yRbRS
         JgA6LrqsIKFyH70HjLcmDwu4QopPzxk5UwMSKkVnColc1rsssOyq+g+VwNStAXa1Y/d0
         AU1WrCSXmYLu9xyzAzBRi2ScJc4Ed9u2qwPnK5uIUHoBeE7KP6LNo4D6TrQLt4zAjVW2
         8EjUtHv9L6Dj032W9jVWd6xvpD2rz5sZ68M0t+/IJ/wuQiNimcFqITG8rIE2Nqn9Tt8d
         G8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mc1B01KqzevdpjMajtl5h9LEaPSHWJodP26+oaFdvjY=;
        b=fZe9MCsSlvnckCCsfWBhtLGoyMgJnoPskX7GHNBWX5SISJJKPBY08OR0yKwOXmgjIv
         0n1VKgA9bk8tqx9/EyFV05WudfvN4Ds2hndCPN3TT0yx+s6Yoz5P/2j0tnifRr1/Jljg
         uyBJVthTt//PnshBpfPbaDBq+mkmjDFBxZpB087wrs40cUGChN+tWOFiwaonAry/XvgI
         VKLpDFuDvlBHZdldx5LvTVqrh4jtM1ili/yzC0vl6r1jq08Ws49KCEBV8ziuaeP51P57
         yMBfuMDz8vHtDKYk/4t9XxraP42QqvbWcJ3xk9NKYx/+6utSPqAliJuC2GxQoHU2y0oO
         gnoQ==
X-Gm-Message-State: AFqh2kokh5xdw1YaR+g9taYZQPA7uGlow5U3M5SaJxWk5QnlBqg413XG
        YEq4zn4UJjzFgw/gEy5shljFeILaVKE4xFdsoFc=
X-Google-Smtp-Source: AMrXdXsFcuynzTuoqvgMSmOPPfD3wVAIAf22r64mLHGun8npzl6PdxsjZ6qsHsjy+WMJbPZEMDyek7kI/qcqiyV1W/4=
X-Received: by 2002:a17:90b:485:b0:219:720c:29cb with SMTP id
 bh5-20020a17090b048500b00219720c29cbmr3673388pjb.76.1672591119460; Sun, 01
 Jan 2023 08:38:39 -0800 (PST)
MIME-Version: 1.0
References: <20230101155753.779176-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230101155753.779176-1-dmitry.baryshkov@linaro.org>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sun, 1 Jan 2023 13:38:28 -0300
Message-ID: <CAOMZO5AaZrXe8w7XhzG5LzCxdodOde-5ACV6Kgd8B+uYneKxWA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a2xx: support loading legacy (iMX) firmware
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        freedreno@lists.freedesktop.org,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On Sun, Jan 1, 2023 at 12:58 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Support loading A200 firmware generated from the iMX firmware header
> files. The firmware lacks protection support, however it allows GPU to
> function properly while using the firmware files with clear license
> which allows redistribution.

Could you please share more details as to what firmware you are using
with the i.MX53?

Is it available on the linux-firmare repository?

Please advise.
