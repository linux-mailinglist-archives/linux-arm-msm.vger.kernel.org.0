Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A297588DEC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Aug 2022 15:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238418AbiHCNxT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Aug 2022 09:53:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238586AbiHCNxG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Aug 2022 09:53:06 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B99BB52DC7
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Aug 2022 06:50:55 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id c24so825392ejd.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Aug 2022 06:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=JobmQomHLtYAJ+DDomxdN8Lk7HYy1OLd4rHEITgLQdA=;
        b=OPbC8bWfgzWIie1MfD0jyh6gObqMl3sUtChiIWlKH1yMV8iPxv4ElTDcA/PzHNegar
         6Q0saDylV3e1iDeJ1byjBXOSyeKWMBGjWYRa5oQbwaeiE8Z2F7rmGUHCGcWI70WcGI+X
         +jYxrmH6tmuZkcUvlnKf2JFiqxRcT748c8QQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=JobmQomHLtYAJ+DDomxdN8Lk7HYy1OLd4rHEITgLQdA=;
        b=KTs4Ft+9nzsEVJqF1sY4rWVit10vu4QQ4sEdWfFFOcd5eRDWb4WgrxI9/hVjt9ZiXL
         aplvotxjSAsS/plCJT9Mmm5X7lMYsEXfGP5uXBvgt6naTR7sJBGR+M2Wnsf/YxI5Owd8
         VSmHCef0jDT65lWbeiu6Akb0OFlUNPuqNV8drkobN/rQO1izZBBKlKpqSCQbQs80K7+3
         1MSlvIH3hQiaqUqPIPOV4Z+5Ka8hFtJI4cJZIrmeG9OEag6W4OU/iMQwDAzxzrKnZZ+Q
         0EnNrmcDOWPojX000N/uo1Iww4LjQmjiGFlTaO+39E7oDr5I7uKhFZtI7sR5ZJ57qL9Z
         6mUQ==
X-Gm-Message-State: ACgBeo3NCiOpuUN76+5Q2Un7/+5SbdC/dt64k3XukdZwSg3OqDmoPr7p
        2je2PEItbCej3JDUuHH7U6Y0kRE15u2Ep644
X-Google-Smtp-Source: AA6agR74mFa/jHxz/T7lHOocPm40LQhX2NiE6nZpNldDv3pIMEmeGpw0pyzKspRLA3Tk9XwDCnUm2Q==
X-Received: by 2002:a17:906:cc13:b0:730:97a4:8fbe with SMTP id ml19-20020a170906cc1300b0073097a48fbemr8602229ejb.412.1659534651952;
        Wed, 03 Aug 2022 06:50:51 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id q21-20020a170906941500b00715a02874acsm2694692ejx.35.2022.08.03.06.50.48
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Aug 2022 06:50:50 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id z12so11545903wrs.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Aug 2022 06:50:48 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr16303940wrr.583.1659534647816; Wed, 03
 Aug 2022 06:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220802223738.898592-1-dianders@chromium.org>
 <20220802153434.v3.4.I7b3c72949883846badb073cfeae985c55239da1d@changeid> <232f875a-4986-300a-f1e8-18f2da3a8fc6@linaro.org>
In-Reply-To: <232f875a-4986-300a-f1e8-18f2da3a8fc6@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 3 Aug 2022 06:50:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XWxMis61zouPeAoTUC6xYz7rSUC33wdvyLii0Cd2j4Ww@mail.gmail.com>
Message-ID: <CAD=FV=XWxMis61zouPeAoTUC6xYz7rSUC33wdvyLii0Cd2j4Ww@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] drm/msm/dsi: Use the new regulator bulk feature to
 specify the load
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Mark Brown <broonie@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jonathan Marek <jonathan@marek.ca>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Aug 3, 2022 at 12:12 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 03/08/2022 01:37, Douglas Anderson wrote:
> > As of commit 6eabfc018e8d ("regulator: core: Allow specifying an
> > initial load w/ the bulk API") we can now specify the initial load in
> > the bulk data rather than having to manually call regulator_set_load()
> > on each regulator. Let's use it.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> It might have been better, if the previous patch had only removed the
> load_setting on disable and inlined the dsi_host_regulator_disable().
> Then this patch would drop the regulator_set_load() from
> dsi_host_regulator_enable() path and inline it. Then it would have been
> more obvious that after these two changes the time when we set loads is
> not changed.

Seems like I should post a v4 to update the commit message of the
final patch in the series, but I'm going to leave this the way it is
since the end result is the same. Originally when I wrote the series I
didn't know if the new regulator API changes would be accepted, so the
previous patch did the most cleanup it could do with the old API. ;-)

-Doug
