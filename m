Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10AB35288AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 May 2022 17:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244677AbiEPPXd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 May 2022 11:23:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245340AbiEPPXU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 May 2022 11:23:20 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE013B550
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 08:22:47 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id m12so3327515edb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 08:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jP1Z/t75Zd6+QfO0rBYQNP9W66P0QAZBvkxPxWMCEHY=;
        b=HzgnGElJcy8Kom4TATLPw1DcUEH44GqfdZxPziBJAjMYplYbhEaAxZbm4LdHD3D4/v
         hkCwqG4CD/WoFFMnuLnuuTvOxmSjctrf5dh2+OCPOpqZhPPBBbBGPYP3ORxEm3A66gsg
         h/CPTcnbxFRmyXJ8IzwezD1foSwtGz2VR8OrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jP1Z/t75Zd6+QfO0rBYQNP9W66P0QAZBvkxPxWMCEHY=;
        b=A2LzgMX9KaAQnm67d5nxUW5Bt2VeokKHm56iyxci0AWHB2jzyN8QeRdnqLaqZYeVsA
         oBVTSRYo+pjSaOmt8g3PzKX8TdRdqr96iz4I9H7i35lVN1aThnOrTUdYMb7eo+ntWnrw
         9OSPdZXm302JWDaCoeFh3zXBkn0E+0FS1RoGVe3Ar9OIKaiiXPub3gFN3N+HkMYgr7XX
         K6B2K/fMn0rtv5bdMKIMdnJSOUjgKn7LQo994Q2ggrESRCPQKiJDT38BZqRnCLglRuoc
         wQId4Sz/na+c4F5bC1ZVkVfMGcxf1Zj8Ku2wrg0n4zfy2rhHpuN22XKnTasJhPVwA6GE
         FqRw==
X-Gm-Message-State: AOAM532XeT3dD1LH8YHlfneCMR0MipaXMm673FjI9aGIx9nkt7IgeVe9
        KxQ6M+MqaMH2M+xuufk1Vtpugl+wMoYTF3kvKnY=
X-Google-Smtp-Source: ABdhPJzS0FCa1v5GiMQqB1ExmZ8rxTskYcbR7FEzEhcOJ33kno07DGTg7EHr8VfUmR1rmystq2ZLBw==
X-Received: by 2002:a05:6402:2743:b0:42a:2cee:20c4 with SMTP id z3-20020a056402274300b0042a2cee20c4mr14080353edd.338.1652714565978;
        Mon, 16 May 2022 08:22:45 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id j20-20020a1709066dd400b006f3ef214e75sm3724737ejt.219.2022.05.16.08.22.45
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 May 2022 08:22:45 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id kq17so29385025ejb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 08:22:45 -0700 (PDT)
X-Received: by 2002:a5d:6d09:0:b0:20c:53a9:cc30 with SMTP id
 e9-20020a5d6d09000000b0020c53a9cc30mr14313656wrq.513.1652714224237; Mon, 16
 May 2022 08:17:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220513095722.v2.1.I71e42c6174f1cec17da3024c9f73ba373263b9b6@changeid>
 <20220513095722.v2.4.Ie8713bc0377672ed8dd71189e66fc0b77226fb85@changeid> <125970b0-af71-1695-a3ab-10a159ac63a5@linaro.org>
In-Reply-To: <125970b0-af71-1695-a3ab-10a159ac63a5@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 16 May 2022 08:16:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XR+WwWmrB1wGX65=szBc2PbGNOHbm2tiQT5Wp8CPG0Kg@mail.gmail.com>
Message-ID: <CAD=FV=XR+WwWmrB1wGX65=szBc2PbGNOHbm2tiQT5Wp8CPG0Kg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] dt-bindings: arm: qcom: Add more sc7180 Chromebook
 board bindings
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Alexandru M Stan <amstan@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        "Joseph S . Barrera III" <joebar@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, May 16, 2022 at 12:05 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 13/05/2022 18:59, Douglas Anderson wrote:
> > This adds board bindings for boards that are downstream but not quite
> > upstream yet.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Use a "description" instead of a comment for each item.
> > - Use the marketing name instead of the code name where possible.
>
> These should be published with the patch adding their upstream DTS/DTSI.
> There is no point to list all possible boards in the world from any
> downstream source. For upstream there is no particular benefit for such
> bindings, for downstream you also said there is no.

Joe has been working on upstreaming these boards:

https://lore.kernel.org/r/20220510154406.v5.1.Id769ddc5dbf570ccb511db96da59f97d08f75a9c@changeid/

I think there is little chance that they won't go upstream at this
point. However, we're at a time in the merge window where it will be
several weeks before anything can land. If Joe were to include this
patch as part of his series I suspect it would be much more confusing
because it would add an unnecessary dependency between my series and
his and make it harder for Bjorn to apply it later. Keeping the patch
with my series means that the series can be applied more easily.

How about: I'll add a link to his latest posting in my next version.
Then, in the future (after these bindings patches have landed) then
future boards can go together with their bindings.

-DOug
