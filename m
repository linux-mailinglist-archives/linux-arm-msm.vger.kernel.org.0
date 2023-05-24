Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A05BA70FCAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 May 2023 19:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233153AbjEXRaO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 13:30:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235966AbjEXR35 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 13:29:57 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D6AD12E
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 10:29:53 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1ae4d1d35e6so4130535ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 10:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684949392; x=1687541392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yq6BLiBB15ZpThHz2GQJH12upVOih5oQeiwfZRvJZIs=;
        b=itggRbHMCgNgnl6cxudPM95tuM0o3O3rDkIro7IzOdAwhmTRIxQmH/i5xdbGy0M1ke
         ryXWzHjHVqA7djfRLAHdYp2kOdgTpGuvBviHPf7336Bfl3tOo98LSCO92QX+NXOCTX7p
         67i9FieWeUJqrk34iteLqoYm3rAF/P7IiblcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684949392; x=1687541392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yq6BLiBB15ZpThHz2GQJH12upVOih5oQeiwfZRvJZIs=;
        b=STUweXdxoTBwwqEFJcxgGvc6KoYTSep4/IhHd+lKYAeu5PKuwtYk1R3ji8yiBlIvU9
         8iqDQyH+p88PESyCxUC1K0ZQOLDB6w6Xw02biWGFug3ttELmPjWM9iqeRlIf96hV1G3n
         CPqZZTSA2TtH1Vxn6rT4IvQdqFlZKyhmzAqy7Y3hRgoOTdffqf2wax69wqHekU94SIUL
         pX7cSYlzGs0uaJFCRvA4zEM2Un5fyet5c9q/uytR+Fn9lzDF5l8o0EBv1BkvF7aC/oKg
         fgl+t98isc9r6wkj053JFgSpQb+tkPGwZaX5e4zmglWmFoHSsKTN9coZp9ZRK4kF7yAo
         csBQ==
X-Gm-Message-State: AC+VfDxc0bONkhdCTb6OzKC2qaFiSZSTa9rV2jOjjebbzW0Wd2Ri8WqD
        Mf0qGstzCegL6SN/k5MXFUjhb0v9bojMvBTrHv0=
X-Google-Smtp-Source: ACHHUZ7si1ffAcR3NGJrgyQxFfXlFbZ+1eETMlKLOrwftreciyYEkMM/3jlvrOhR6VIEfFsi8HPeAA==
X-Received: by 2002:a17:902:d2cb:b0:1ae:10b3:6203 with SMTP id n11-20020a170902d2cb00b001ae10b36203mr18843919plc.16.1684949392113;
        Wed, 24 May 2023 10:29:52 -0700 (PDT)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com. [209.85.214.174])
        by smtp.gmail.com with ESMTPSA id h7-20020a170902f7c700b001a19196af48sm9043079plw.64.2023.05.24.10.29.51
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 10:29:51 -0700 (PDT)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1ae64580e9fso7715ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 10:29:51 -0700 (PDT)
X-Received: by 2002:a05:6e02:1b09:b0:335:a48:f668 with SMTP id
 i9-20020a056e021b0900b003350a48f668mr199716ilv.15.1684949370785; Wed, 24 May
 2023 10:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230523193017.4109557-1-dianders@chromium.org> <20230523122802.7.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid>
In-Reply-To: <20230523122802.7.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 24 May 2023 10:29:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ucn7BeWWGOOEX0ho7yH31VF-w7U60KFB8qSn4L1xn3fw@mail.gmail.com>
Message-ID: <CAD=FV=Ucn7BeWWGOOEX0ho7yH31VF-w7U60KFB8qSn4L1xn3fw@mail.gmail.com>
Subject: Re: [PATCH 7/9] HID: i2c-hid: Support being a panel follower
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>, hsinyi@google.com,
        devicetree@vger.kernel.org,
        yangcong5@huaqin.corp-partner.google.com,
        linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, cros-qcom-dts-watchers@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, May 23, 2023 at 12:31=E2=80=AFPM Douglas Anderson <dianders@chromiu=
m.org> wrote:
>
> As talked about in the patch ("drm/panel: Add a way for other devices
> to follow panel state"), we really want to keep the power states of a
> touchscreen and the panel it's attached to in sync with each other. In
> that spirit, add support to i2c-hid to be a panel follower. This will
> let the i2c-hid driver get informed when the panel is powered on and
> off. From there we can match the i2c-hid device's power state to that
> of the panel.
>
> NOTE: this patch specifically _doesn't_ use pm_runtime to keep track
> of / manage the power state of the i2c-hid device, even though my
> first instinct said that would be the way to go. Specific problems
> with using pm_runtime():
> * The initial power up couldn't happen in a runtime resume function
>   since it create sub-devices and, apparently, that's not good to do
>   in your resume function.
> * Managing our power state with pm_runtime meant fighting to make the
>   right thing happen at system suspend to prevent the system from
>   trying to resume us only to suspend us again. While this might be
>   able to be solved, it added complexity.
> Overall the code without pm_runtime() ended up being smaller and
> easier to understand.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/hid/i2c-hid/i2c-hid-core.c | 82 +++++++++++++++++++++++++++++-
>  1 file changed, 81 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c=
-hid-core.c
> index 34c0d98b4976..f1bb89377e8d 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -38,6 +38,8 @@
>  #include <linux/mutex.h>
>  #include <asm/unaligned.h>
>
> +#include <drm/drm_panel.h>
> +
>  #include "../hid-ids.h"
>  #include "i2c-hid.h"
>
> @@ -107,6 +109,8 @@ struct i2c_hid {
>         struct mutex            reset_lock;
>
>         struct i2chid_ops       *ops;
> +       struct drm_panel_follower panel_follower;
> +       bool                    is_panel_follower;
>  };
>
>  static const struct i2c_hid_quirks {
> @@ -1058,6 +1062,34 @@ int i2c_hid_core_initial_power_up(struct i2c_hid *=
ihid)
>         return ret;
>  }
>
> +int i2c_hid_core_panel_prepared(struct drm_panel_follower *follower)

As pointed out by the kernel test robot, I clearly missed making
several functions "static" in this patch series. :( I'll fix that in
v2, but for now I'll hold off sending v2 to wait for additional
feedback.

-Doug
