Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5AA63B1C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Nov 2022 20:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232854AbiK1TCI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 14:02:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232679AbiK1TCH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 14:02:07 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B10CA26AD4
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 11:02:06 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id vv4so28300806ejc.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 11:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AvcsqOLDEgZfhGUaEz8COVF/l5RKQZT/ZHo2hpf2YEs=;
        b=TZApyyqu3+lIUYq/nIpvz3YAkuyy3nX4GjcLECf52hWQiWYR/jG/KleP0WVpBIfPZh
         +lSDZJUYBy87YJW+uMGSv0H+zUEEvIDaokUyNjZmg57VaBlufpfhJ4L0j+TteGx40z/S
         KbYj/LVLnejrHFBFw3V5Alo6g/Yym6mPHamqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvcsqOLDEgZfhGUaEz8COVF/l5RKQZT/ZHo2hpf2YEs=;
        b=m1aDwtWcabZ2Lde9l2DKXA2itR1sLAd78ml/tLLIGMj19nvlM3BNF9EFGP0v6uJr9D
         nGtvlPNfxpruv9KEUKlbjik0sBH/0bxRn327ZXGv34sx56nLt9sLCxH1WuVze16ls33N
         tq5YBFpTMOR89Gnzwb5NHIsRrVgEmdeD562AGxuoc9qmKzgr41/brNx80TUDDtlM1Aj0
         xiPf8EKMx84FW2yPZv+Li/DXDCbruQyT50lFMVqsOiYxLDcn9hWLxYkpEESV+8L7obtq
         PovAQTmMo5qQNu3q7nraObF5enZcgBjXR3fHeBRo5SQ97X4ULx5C17cLZjq/rz2vPLgH
         8S+w==
X-Gm-Message-State: ANoB5pmlYAvES961G34mOrGGqTY/p7S0g+OrnDg05S3ITGuNHSjljKCg
        nfio6It4KjJl6WFbJeo0HTiGrenbEd0vowvn
X-Google-Smtp-Source: AA0mqf5FuyTZPQtKxKzopbQoHdBs6AiQj+TZ5sr1dKV+rgWGmLrHmfOeskhXPeM5x38C0oDTC7uEyQ==
X-Received: by 2002:a17:906:f84d:b0:7b9:631b:7dfb with SMTP id ks13-20020a170906f84d00b007b9631b7dfbmr26044025ejb.32.1669662125212;
        Mon, 28 Nov 2022 11:02:05 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id u1-20020a1709061da100b00780982d77d1sm5269995ejh.154.2022.11.28.11.02.04
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 11:02:05 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id g12so18448614wrs.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 11:02:04 -0800 (PST)
X-Received: by 2002:adf:cd82:0:b0:238:b29e:4919 with SMTP id
 q2-20020adfcd82000000b00238b29e4919mr32489126wrj.583.1669662124286; Mon, 28
 Nov 2022 11:02:04 -0800 (PST)
MIME-Version: 1.0
References: <20221124115712.v4.1.Idfcba5344b7995b44b7fa2e20f1aa4351defeca6@changeid>
 <CAPao8GK93KMrtaXw7mNWOCE60zk=uCENLfBXhNRVxJXEnnaGFg@mail.gmail.com>
 <f58866c8-0164-2e59-4ff3-f9a4f9334e49@linaro.org> <CAD=FV=UtiBYg_S-n7ZGFEChQcaMiima19qfYPibyW9DbQEsivA@mail.gmail.com>
 <9fea68d5-cdae-dc94-bd3b-71ba12a23a9b@linaro.org>
In-Reply-To: <9fea68d5-cdae-dc94-bd3b-71ba12a23a9b@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 28 Nov 2022 11:01:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WJF86Gx4o4=x-8wDkV+TV+O-bAhgzGPcfXsO4LuffGdA@mail.gmail.com>
Message-ID: <CAD=FV=WJF86Gx4o4=x-8wDkV+TV+O-bAhgzGPcfXsO4LuffGdA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: qcom: Add zombie
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     =?UTF-8?B?5qWK5a6X57+w?= <ecs.taipeikernel@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Bob Moragues <moragues@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, Harvey <hunge@google.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Gavin.Lee@ecs.com.tw,
        Darren.Chen@ecs.com.tw, Abner.Yen@ecs.com.tw, Vicy.Lee@ecs.com.tw,
        Jason.Huang@ecs.com.tw
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Nov 28, 2022 at 9:30 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 28/11/2022 16:51, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Nov 24, 2022 at 1:29 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >>> 2.
> >>> I notice Kryzysztof say he didn't in cc mail loop at beggin, and below is
> >>> my updated mail list:
> >>> ---
> >>> Series-to: LKML <linux-kernel@vger.kernel.org>
> >>> Series-cc: Douglas Anderson <dianders@chromium.org>
> >>> Series-cc: Bob Moragues <moragues@chromium.org>
> >>> Series-cc: Harvey <hunge@google.com>
> >>> Series-cc: Stephen Boyd <swboyd@chromium.org>
> >>> Series-cc: Matthias Kaehlcke <mka@chromium.org>
> >>> Series-cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>> ---
> >>> Is there anyone I missed?
> >>
> >> These are not correct addresses and not complete list of them. Don't
> >> invent the entries, don't add there some weird addresses.
> >>
> >> Use get_maintainers.pl. That's it. Nothing more, nothing less.
> >
> > Just to give context here, I think Owen is using `patman` [0] to send
> > patches. Yes, it's part of the u-boot tree but it's designed for
> > sending Linux patches too.
> >
> > By default, that means that get_maintainer is automatically called on
> > all patches and those entries are CCed. The extra "Series-cc" just
> > lets you add extra people. It's fine to add extra people to patches if
> > you think that those people are interested in getting it.
>
> The tool is just the tool, if it uses get_maintainers.pl, then result
> would be correct. The problem was that CC list on v1 and v2:
>
> https://lore.kernel.org/linux-devicetree/20221117094251.2.Ibfc4751e4ba044d1caa1f88a16015e7c45c7db65@changeid/
>
> https://lore.kernel.org/linux-devicetree/20221122203635.v2.1.Ie05fd439d0b271b927acb25c2a6e41af7a927e90@changeid/
>
> As you can notice there easily:
> 1. Bjorn's address is wrong
> 2. My and Konrad's are missing
>
> So if you say that get_maintainers.pl were used and tree is not v5.15,
> then what else?

Certainly on v1 and v2 he was targeting v5.15, not upstream. When I
replied to v1 I told him this. Apparently he messed up still on v2.
Matthias again pointed it out on v2. After v2, it was corrected. ...so
right, you didn't get v1 and v2 and those of us on the email thread
pointed that out and it got corrected. I'm not sure what happened to
v3, but that seems like yet another mistake and I believe Matthias
also commented on this. Here we're on v4 which is correctly tagged as
v4 and sent (as far as I can tell) mostly correctly. It makes sense
that you're surprised that v4 came without you seeing earlier
versions, but given that the error had already been identified and
corrected (which is why you got v4 at all) then I don't think we need
to keep debugging it, right?


-Doug
