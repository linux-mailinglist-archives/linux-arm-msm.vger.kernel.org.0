Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25A09556ED8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jun 2022 01:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377065AbiFVXHO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 19:07:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244426AbiFVXHN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 19:07:13 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31009419A0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 16:07:12 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id r8-20020a4ab508000000b0041bf4086124so3610035ooo.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 16:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=RZMSJ/mPopNz20DjkFCGoOR0DjNJu0ReQuyg8RsZs5I=;
        b=dY4Q+yk6qCUQnttSR71RfA0zfg7dG0C6z/ke8zSPPNSmJHy/c2bpMSQwh6cgh7EGDt
         CrL0olB7bRHhuh9gK4XFBy8qdaIIvA05r/Eqi/BbCqA00wZuNQbVnYJ9LUizUKTr7tFP
         CehiJ8okXfIOepGuo8fSyPIqntG7GUulLMfrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=RZMSJ/mPopNz20DjkFCGoOR0DjNJu0ReQuyg8RsZs5I=;
        b=EBJ9740DigJ0dip066LHmwcrZ3BHrzlEpZ8Hmx33qxbWInarrGDmtrTXLIWLGylwag
         1AHrzLw8Lh1n/O1nidas3yCCy0WzHR5xO/iX24iw/8h7rpRtQL841l7jB14tn0zYljDq
         0sHywXquqo/vCwogjq6Lt1EtM50/U49BjzAXXkMpH6NoczgOVxNr8SgQgLCPO7MPBAx6
         4GXuLy5KAlz1SEIPUP0lfavSw8QO4nhoTC5/cuIAw2uZ5sMXPKQUqY3fanF7ZMS2l4xn
         TQOZ4B+ZX79F/cTM9XJFXTdGIkAYm54C/aeMM/I/vZyImGwyl7vpmrJbqMrI2zugaz1G
         r2oQ==
X-Gm-Message-State: AJIora+7nUTN0Uczw2EsdxR0prFhlGg1sAx01ovB/8ibDpXRrofGD9cv
        c+/dWzLoduVO5q96OtvHQjROUx/oB8RYB/0QLsHscw==
X-Google-Smtp-Source: AGRyM1ttSY8mam9MakCXQBl0Wcnhs2Eq1XDHdV3tla7Vyx4FbmzRqmJiV4eZX1RbevsB6heHmrVvGv/v/lWdjsBJbPU=
X-Received: by 2002:a4a:ca95:0:b0:41c:e2c:ab2d with SMTP id
 x21-20020a4aca95000000b0041c0e2cab2dmr2414660ooq.1.1655939231472; Wed, 22 Jun
 2022 16:07:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 22 Jun 2022 19:07:11 -0400
MIME-Version: 1.0
In-Reply-To: <20220622215805.1121982-1-joebar@chromium.org>
References: <20220622215805.1121982-1-joebar@chromium.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 22 Jun 2022 19:07:11 -0400
Message-ID: <CAE-0n53Yg_89EnGFhDKUKsqDEXOeqwFDN0=meKsvehbKkf_KAw@mail.gmail.com>
Subject: Re: [PATCH v10 0/5] arm64: dts: qcom: sc7180: Add five new
 trogdor-based boards
To:     "Joseph S. Barrera III" <joebar@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Joseph S. Barrera III (2022-06-22 14:58:00)
> This series adds five new trogdor-based boards to upstream.
> The patches should be applied *after* applying
> https://lore.kernel.org/all/20220602190621.1646679-1-swboyd@chromium.org/
> (arm64: dts: qcom: Remove duplicate sc7180-trogdor include on lazor/homestar)
>
> The patches do *not* expect
> https://lore.kernel.org/all/20220518172525.3319993-1-swboyd@chromium.org/
> (sc7180-trogdor: Split out keyboard node and describe detachables)
> to be applied.

Sounds fine to me. I'll pull in this series and rebase my patch atop.
