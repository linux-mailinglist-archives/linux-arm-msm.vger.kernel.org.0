Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97F6057E2E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jul 2022 16:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbiGVOQb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Jul 2022 10:16:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230486AbiGVOQa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Jul 2022 10:16:30 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F1DA024C
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Jul 2022 07:16:29 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id t3so6073787edd.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Jul 2022 07:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nxeR7Lo5PYoDSgSUtAiC935tL0yHF6pLSDAauA9BG7w=;
        b=MR4DklGeYf0D/wYM8Tyks/4W15tt7jHZxpOHeWkrP8SiiLYJgMMJZeb9xKy35RcKBs
         K02sZymDAJh71V2xCJ/MwdvDF50YToUQ5aK/Gclm4R1CHh8YMaSpCriWuruPQwmdVmmO
         nAg3zgaWjMnm7XHZdvJjYWVs694bvxq+EB2rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nxeR7Lo5PYoDSgSUtAiC935tL0yHF6pLSDAauA9BG7w=;
        b=VewnDGpxMAJiNfwHmZQT+JUfofpkSU91gS+OCqGC7rGe52ugASKLZ1dKfn+Vsml03U
         R3F+W7UAjqcMbt3TpXY6bm6vXywyIpaOqKzM8WOummveu7YwusQPPv446onu9YNxnvRV
         FC2M70BAgtSghmm1UinYJGiRxneHPv8qDmzX1AhjSO+SMirGb9tKpcnbwwe1y4cXxgvu
         +XVDGocRLf7phf9Z1iQlm556etuQqTZFk8PpI7Wo1K7TLOxhkE6aHEaqGyvT6IjF2yjj
         cLZMY7hR2v0ssdEo7Tcz5TqG+oWqJRVf8WyBuYxYNekcTDvRPtyRoGg+YK3wb1jcC3Vu
         MCUw==
X-Gm-Message-State: AJIora94BIKBxNV/jyLJVb74IwFxWSkxjyalDZqihLS0917QbV5T2fw+
        Cd8i1dYvyn+GyqU3m2RwnfB7ZUF2BG9iDIdKQLI=
X-Google-Smtp-Source: AGRyM1uVYCGLktxhI/ECP++GGT7Fszz5fYo6asbP1hU1Pwa4wPy2DJb2Pp8vY+oSVcLmUNPKKpBCrA==
X-Received: by 2002:a05:6402:388b:b0:42b:5f20:c616 with SMTP id fd11-20020a056402388b00b0042b5f20c616mr108088edb.50.1658499387946;
        Fri, 22 Jul 2022 07:16:27 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id dm21-20020a05640222d500b0043ab81e4230sm2604200edb.50.2022.07.22.07.16.26
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jul 2022 07:16:26 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id bv24so6690450wrb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Jul 2022 07:16:26 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr76737wrr.583.1658499386136; Fri, 22 Jul
 2022 07:16:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220722081127.228971-1-jinghung.chen3@hotmail.com> <SG2PR03MB500658668FBB9BE1DC2B3F24CC909@SG2PR03MB5006.apcprd03.prod.outlook.com>
In-Reply-To: <SG2PR03MB500658668FBB9BE1DC2B3F24CC909@SG2PR03MB5006.apcprd03.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 22 Jul 2022 07:16:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WgzOn7EsGgWd-qkEMccBQQn1id1u_0Ph1V6qExfCEioA@mail.gmail.com>
Message-ID: <CAD=FV=WgzOn7EsGgWd-qkEMccBQQn1id1u_0Ph1V6qExfCEioA@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: arm: qcom: document sc7280 and
 villager board
To:     Jimmy Chen <jinghung.chen3@hotmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alan Huang <alan-huang@quanta.corp-partner.google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jul 22, 2022 at 1:11 AM Jimmy Chen <jinghung.chen3@hotmail.com> wrote:
>
> This adds a LTE skus for Chromebook Villager to the yaml.
>
> Signed-off-by: Jimmy Chen <jinghung.chen3@hotmail.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> -Add this patch
>
>  Documentation/devicetree/bindings/arm/qcom.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Please carry forward tags from previous versions unless you've done
something to justify removing them. From v6:

Acked-by: Rob Herring <robh@kernel.org>
