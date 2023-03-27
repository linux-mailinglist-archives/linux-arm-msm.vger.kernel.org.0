Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E01296CB1D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Mar 2023 00:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbjC0WcD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 18:32:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231432AbjC0WcC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 18:32:02 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 873ED26A9
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 15:31:57 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id h27so8876438vsa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 15:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679956314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9Wt+WsnnVD5DSCi0zCQh6BBH6TNLjKpNQABAtkF2NM=;
        b=TJJnlhbbvX8CYLVVoocAVzW32w5wyAy0w60WP17fBop9zORjJqlfutrdzs/xPjGob3
         uEulrtjagGT+SgE63CFj5egKzLS3IbJHrXB6yTWm1tmCzSoarY0t5YK0cyBT/kqQnlq8
         eRBkjUz66+OCudU1Z0B0MRnmlsKdT+AOpyZPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679956314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9Wt+WsnnVD5DSCi0zCQh6BBH6TNLjKpNQABAtkF2NM=;
        b=NWET4h7KyxADPEp329FnII3P+hMLlLgss1+BYqNTNYT6cEGcSHIS/8K4n85RuBtbjy
         z7VeNzBc7vy6HTWiL1ufxg04GTDb3xciqTZ326k2/gd21gpDnuYLEoETBb2OaRUPny6t
         vkDdYS5IY60UUmsFmskZ64Izt4eHzr9hmjhSc+6UxR618zqfwqH32OyWHyT+JfLHrr+T
         JKdspP+4uJYG3c4B53mn10BmDlZ7RA/C91lSPxj3qHhmLI5k+ExhTNNHzW9ODGlleyW9
         cKspfyVGoypSmtf8CR3EmaeIz5XyWY9yGRmkosikcwVOULXjpm8xMsKVrRuw7nRWMdPm
         sgZA==
X-Gm-Message-State: AAQBX9fuu3f0eTcXXj6NTFWF0YKuHEqUprT9aJHse39QJYCsyk/8OPHT
        NrHjoonZt07T6uKBIrIFhfNMn18sm5Swr8OHlJc=
X-Google-Smtp-Source: AKy350Y7PTxlIRsg0M58GzAw0nsSqXR7SOk1KPwhu5VNxF932ocSy85c5adD40VaIMvjNV1H42G/iQ==
X-Received: by 2002:a67:edd2:0:b0:426:84d2:5ecc with SMTP id e18-20020a67edd2000000b0042684d25eccmr3998735vsp.33.1679956314732;
        Mon, 27 Mar 2023 15:31:54 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a3-20020ab00c03000000b00747dd9831dfsm3533726uak.28.2023.03.27.15.31.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 15:31:53 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id v48so7532755uad.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 15:31:53 -0700 (PDT)
X-Received: by 2002:ab0:6082:0:b0:765:8f29:d679 with SMTP id
 i2-20020ab06082000000b007658f29d679mr329648ual.1.1679956313217; Mon, 27 Mar
 2023 15:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230324165909.131831-1-vkoul@kernel.org> <CAD=FV=UJepzmKczemVGB8NacjyvLDqXiRoc81s1tJ=u5+HAeqg@mail.gmail.com>
 <fb2d333e-c459-f394-a299-533083b83596@linaro.org>
In-Reply-To: <fb2d333e-c459-f394-a299-533083b83596@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 27 Mar 2023 15:31:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WTz=FVPP+pB8VMA8qWtD9hH00yBhFvs5rkfynranyr4w@mail.gmail.com>
Message-ID: <CAD=FV=WTz=FVPP+pB8VMA8qWtD9hH00yBhFvs5rkfynranyr4w@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add B133UAN01.0 edp panel entry
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
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

On Fri, Mar 24, 2023 at 12:13=E2=80=AFPM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Le 24/03/2023 =C3=A0 18:04, Doug Anderson a =C3=A9crit :
> > Hi,
> >
> > On Fri, Mar 24, 2023 at 9:59=E2=80=AFAM Vinod Koul <vkoul@kernel.org> w=
rote:
> >>
> >> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> >>
> >> This panel is found in Lenovo Flex 5G laptop, so add the entry for it
> >>
> >> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> >> ---
> >>   drivers/gpu/drm/panel/panel-edp.c | 1 +
> >>   1 file changed, 1 insertion(+)
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > ...assuming nothing distracts me, I'll plan to land this Monday to
> > drm-misc-next.
>
> If you get distracted, I'll apply it!
>
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Pushed to drm-misc-next:

981f8866754d drm/panel-edp: Add B133UAN01.0 edp panel entry
