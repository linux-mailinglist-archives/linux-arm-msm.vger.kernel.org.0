Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3C76C82D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 18:05:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbjCXRFF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 13:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231915AbjCXRFB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 13:05:01 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4264B19C44
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 10:04:56 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5456249756bso44254417b3.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 10:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679677492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55jXLirChjS+BkN9O/QVlhBVJ6/URXMG6y24YCNnkYA=;
        b=guU1oU5G7/yHf2+DsUxV9XQtKtafHnGW8LxGkAehMw/sR3e3gnFng83w07+icz93Rm
         wv1+oDHt4AqUvxv5Ez4tT7OSaju8El1XZWyDrKBDbs2wAf4Tf9JvEbXXA9t3Jw2cduB9
         nhn53QKaK9vezYM1B9jSf/mJ9S5JwvQoPNgd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679677492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55jXLirChjS+BkN9O/QVlhBVJ6/URXMG6y24YCNnkYA=;
        b=2gVw9hc6Har7kh2rpnaniOAGy06RQeAGBqa/ER7digzZ9II3YXw50GR+2EkpIXtJu1
         flnetRXjgq7V5x02tl85jZNi2Tw+NXjujh9kwd0AyUwVqxkEkKafQaVuPD7yr4UCYid2
         X6ORM9yKe7U1/D2YEuq/XNgfKiDEz8yi7ckPjX9UxZfCgs42h80pJPLELmSuw3obxacr
         /qOT3vigRfziyKHmdVPXFZnREnXVspbgxi2wYF+0p4iumjImbpNI/RmVzzG1xgaGsKDz
         XOvgsmxtgPH0qPebYTmllNI6Tg6drqQX1ki7QrbG+raI40JYObp+LY+loTROe+4FYqA5
         +k/A==
X-Gm-Message-State: AAQBX9e20mxpWjhSHfKc/oAH7s/ZY13kMnhewMbCh/GK+k0cCm2cY1fZ
        Em0aBNp6ZYVdiTIss5BveIttWo0/+h16iOIlaBE=
X-Google-Smtp-Source: AKy350a/XYx9zWz4aHKZysL281whem6+bXImgwj94QgijKiAUyqdB9XTNp/wzyQCO00Igh3nwsNbfA==
X-Received: by 2002:a81:6783:0:b0:541:a451:17f4 with SMTP id b125-20020a816783000000b00541a45117f4mr2909364ywc.39.1679677492638;
        Fri, 24 Mar 2023 10:04:52 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id p184-20020a81b1c1000000b00545a08184bbsm502749ywh.75.2023.03.24.10.04.51
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 10:04:51 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id k17so2986219ybm.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 10:04:51 -0700 (PDT)
X-Received: by 2002:a05:6902:18cd:b0:b74:6c88:7bff with SMTP id
 ck13-20020a05690218cd00b00b746c887bffmr1571883ybb.0.1679677491319; Fri, 24
 Mar 2023 10:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230324165909.131831-1-vkoul@kernel.org>
In-Reply-To: <20230324165909.131831-1-vkoul@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 24 Mar 2023 10:04:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UJepzmKczemVGB8NacjyvLDqXiRoc81s1tJ=u5+HAeqg@mail.gmail.com>
Message-ID: <CAD=FV=UJepzmKczemVGB8NacjyvLDqXiRoc81s1tJ=u5+HAeqg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add B133UAN01.0 edp panel entry
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Mar 24, 2023 at 9:59=E2=80=AFAM Vinod Koul <vkoul@kernel.org> wrote=
:
>
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> This panel is found in Lenovo Flex 5G laptop, so add the entry for it
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...assuming nothing distracts me, I'll plan to land this Monday to
drm-misc-next.
