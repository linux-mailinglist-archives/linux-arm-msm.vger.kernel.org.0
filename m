Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3D827418C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jun 2023 21:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjF1TTC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jun 2023 15:19:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231453AbjF1TSy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jun 2023 15:18:54 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C9CF1FF7
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jun 2023 12:18:50 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-c15a5ed884dso80318276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jun 2023 12:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687979930; x=1690571930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DUD/shWe46KMvA0LBMlGn2qbYD6iSa8fQ8POxlPlXM=;
        b=bwFjvvNcUJo7//TF8Jp1vEu1xBV6qJmdrgeX0/ANiiVkekDwHHURXv+DV88cWYT6jW
         RbHZEIn3r9PtHYcU4fIMjie5zJI6IS0zU0Yq+6jHzzBqH1S+8mbos0IDAI3y4O1YxynU
         imdW1P2optY818M2gbNF5hU4q2ZU/cpterMPuJEU5VtKZ63vv5BOPOYpaOXFEVDcJCZe
         njEyQ1uoFmFpp8jWN7ztedU+45WHoCMjLCJHxIZUoYY3yo0OHqUkekyUbJVC4tKKMOka
         OguEhhd/Ez61qhzCh0w6nIJMbVWfYEit5vhI4og1FaIZ6NwTsVbGXZoQEAU8iEt/P0Zs
         bmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687979930; x=1690571930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7DUD/shWe46KMvA0LBMlGn2qbYD6iSa8fQ8POxlPlXM=;
        b=EN9INhvY94SzW/5l+YELHHjlXhVtJtzLLErkNPDw6+zrX/SUcvOM+6PuSX2WBTC9hR
         bpj+yLfewKc8DkXiuYfZihuKmF+7kChbAIRp44bNhiOA6T2+vfIWYqLcgQkbMFkhFh9b
         XBZOicskJm5xsafmPPG6xQwfZqaPGD+/VcgqZBQwCyW6ZuojhN+NSWVCS9wNs58M9+W2
         K27pyIYYfzy/+SSak2R11BNu4fNIlaTB/IdsbUlkgr2YC1PKLTHvNKng1xfcNKHIKtwZ
         EQ98gfWP15VBGFviDAtGwMt4rMw2b3+2ce3YYK0yf50bwBe+LoAhftlWkxD7MbVK1NPn
         o9Nw==
X-Gm-Message-State: AC+VfDzu4snwqZG9/gTKvVhnz/c/cpATQ96N8oHz8OlKuo5DV5EJ/Vwa
        XJ849utTunFbLaMUsd8nstsHopx2abxXuPo9tSMkoA==
X-Google-Smtp-Source: ACHHUZ7rpDB3iLiEU8xufHcYAsfVBnrCQGv7FT1VlaIgweQmvXwzogrWdJylssczyf5duNaEFnucjJqA02PevJT363c=
X-Received: by 2002:a05:6902:91:b0:bb8:4cc6:9d09 with SMTP id
 h17-20020a056902009100b00bb84cc69d09mr28026725ybs.29.1687979929795; Wed, 28
 Jun 2023 12:18:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-10-541c341d6bee@somainline.org>
 <CACRpkdbrk_pPqewo-bGPq4NQScHSRKNMeO0ik_aqEQ+BY12BBQ@mail.gmail.com> <a7h7hudmgg3ldb334o2knga7dqilvp47tfd46se4szpri2xi35@lxg5i5igjfmj>
In-Reply-To: <a7h7hudmgg3ldb334o2knga7dqilvp47tfd46se4szpri2xi35@lxg5i5igjfmj>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 28 Jun 2023 21:18:38 +0200
Message-ID: <CACRpkdZSNzeh8v=HW6948dJ8j0xNMhgrAz2+CpvQX=meGwPkyg@mail.gmail.com>
Subject: Re: [PATCH RFC 10/10] drm/panel/sony-griffin-samsung: Add panel
 driver for Sony Xperia 1
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Caleb Connolly <caleb@connolly.tech>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 28, 2023 at 4:20=E2=80=AFPM Marijn Suijten
<marijn.suijten@somainline.org> wrote:

> But for now we might already create a step-up version of that by having
> a "Samsung panel driver library" to deduplicate generic commands, which
> drivers can freely call into?

Yeah something like that is likely what we want.

> On the other hand of the spectrum we currently have 4 downstream panels
> for Sony devices that all declare to be using the sofef01 controller,
> but with vastly different command sets.  And even if we "accidentally"
> send the wrong set for the wrong device, the panel works anyway with no
> noticeable color shifts or otherwise...

Yeah that is typically the case :/

We should try to group the similar code together and expect that sooner
or later we will figure out what display controller(s) it is and name it af=
ter
that rather than after the panel (which I define as the combination of
a display controller and an actual panel).

Yours,
Linus Walleij
