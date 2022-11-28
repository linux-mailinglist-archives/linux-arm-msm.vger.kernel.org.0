Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35AA263ACFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Nov 2022 16:51:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232351AbiK1Pv0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 10:51:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232341AbiK1PvX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 10:51:23 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 767949581
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 07:51:21 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id v8so16036230edi.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 07:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gxG+EkRus6rhlH9PRO/Fl75BWcHi0qNFQ20NSLLna24=;
        b=nx7GCKRFLL47qNWuL85bW7jEZbEvLQrpLeKgX+4ToR8wPAZ+YwMFp4qjwGK7a3OZ16
         U4TdjV2p2mISH7yXy2ozLk23QmMbfOxzNIQ1glT+3GbKj9RIZgfBYW9AfbJb5lDgg3Nu
         oDJLFWa5zndoh5Py/ZXUqmVByH/gMEBjdAvLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gxG+EkRus6rhlH9PRO/Fl75BWcHi0qNFQ20NSLLna24=;
        b=amqadYmG/oOJ6YhSKRdci4tVHIej/if6oUiECGhjBF4vrYFMNebWFgaGX8mT5uEvas
         U9ELksKo6wh76dc/lHZZyR2bSrrca48THS8toGDmLPumWRv5Tlt3pzsH3fTZgspkPji5
         kWV1Y1GfILNx/JfPR9N9KnzgjfJ9zT0/D4fOf1wL4ZMY/g4iFcpzydxatskCIy+oEcRU
         6c5cDEgzh8EgHYhnPIgof+K7jRRkOEydK7E7UqqUebOz4UmU3hpRqAKwS1wnHnsIuEMp
         K/KFmk4iCY4O2SAqguofy7JJF4c7eZDJil6lHqHsahy5WVOsFTilR3LaBC+Y68TUEoUd
         eR2A==
X-Gm-Message-State: ANoB5pn+3xqZdktZDxaZrQh6EluL+Q3blOYtCNONqf75HeO0ZOoA4UlE
        bPtrN26JGYkFtYGbvv0KnuvJ3SZ3hp4uXA==
X-Google-Smtp-Source: AA0mqf7U538/lyT9kQFI377rgAemF4jrnozdRA1CD/16YEdMSHyLS4qJKSzch3sU6foCD5CoWoSCTg==
X-Received: by 2002:a05:6402:114c:b0:457:35d4:ac66 with SMTP id g12-20020a056402114c00b0045735d4ac66mr47379989edw.415.1669650679579;
        Mon, 28 Nov 2022 07:51:19 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id p9-20020a17090653c900b007aea1dc1840sm5117605ejo.111.2022.11.28.07.51.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 07:51:18 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id t4so8779206wmj.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 07:51:18 -0800 (PST)
X-Received: by 2002:a1c:cc04:0:b0:3cf:7716:8954 with SMTP id
 h4-20020a1ccc04000000b003cf77168954mr38239298wmb.57.1669650677812; Mon, 28
 Nov 2022 07:51:17 -0800 (PST)
MIME-Version: 1.0
References: <20221124115712.v4.1.Idfcba5344b7995b44b7fa2e20f1aa4351defeca6@changeid>
 <CAPao8GK93KMrtaXw7mNWOCE60zk=uCENLfBXhNRVxJXEnnaGFg@mail.gmail.com> <f58866c8-0164-2e59-4ff3-f9a4f9334e49@linaro.org>
In-Reply-To: <f58866c8-0164-2e59-4ff3-f9a4f9334e49@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 28 Nov 2022 07:51:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UtiBYg_S-n7ZGFEChQcaMiima19qfYPibyW9DbQEsivA@mail.gmail.com>
Message-ID: <CAD=FV=UtiBYg_S-n7ZGFEChQcaMiima19qfYPibyW9DbQEsivA@mail.gmail.com>
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

On Thu, Nov 24, 2022 at 1:29 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> > 2.
> > I notice Kryzysztof say he didn't in cc mail loop at beggin, and below is
> > my updated mail list:
> > ---
> > Series-to: LKML <linux-kernel@vger.kernel.org>
> > Series-cc: Douglas Anderson <dianders@chromium.org>
> > Series-cc: Bob Moragues <moragues@chromium.org>
> > Series-cc: Harvey <hunge@google.com>
> > Series-cc: Stephen Boyd <swboyd@chromium.org>
> > Series-cc: Matthias Kaehlcke <mka@chromium.org>
> > Series-cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> > Is there anyone I missed?
>
> These are not correct addresses and not complete list of them. Don't
> invent the entries, don't add there some weird addresses.
>
> Use get_maintainers.pl. That's it. Nothing more, nothing less.

Just to give context here, I think Owen is using `patman` [0] to send
patches. Yes, it's part of the u-boot tree but it's designed for
sending Linux patches too.

By default, that means that get_maintainer is automatically called on
all patches and those entries are CCed. The extra "Series-cc" just
lets you add extra people. It's fine to add extra people to patches if
you think that those people are interested in getting it.

[0] https://source.denx.de/u-boot/u-boot/-/blob/master/tools/patman/patman.rst
