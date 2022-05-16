Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2E97527EC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 May 2022 09:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241239AbiEPHp0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 May 2022 03:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241234AbiEPHpY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 May 2022 03:45:24 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D39C024F04
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 00:45:22 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id i19so26901007eja.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 00:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=21e+O6a/0NQnBECsUblxR6mTia9rEVhmdm2lp/29jkY=;
        b=fcr1QxfEr0HCRvXrgOstMlmzEa5x/qaQxKyfu87La+0aiPxd3NTmjHb8XZCfaIhBBR
         yZlIeLPDeeQc0LNHSTOu8R9/lW/f+PZTUdMn+6icXtB2qKIdRQyE6TVS6z1npqbEYNDG
         YjMQLUq92ZtZ+Nz6GPH2rLo3PRuYQ8ptHRS/aOcO2S/Da07Wn5JmLOuNfr9GxhB/PbcL
         Y6ycu+J9BeM+v3oWsRCzyg1COi9tdHK9SnvGQMD6j9ezQm9ih0KrDJxuhb7adI7YumE5
         DgQD/OANI8nFfI7hjE03ejAV64e3EYwgJGnJNmQ74fPZzHqLY1y245jobjRYSq1tiGiq
         Os4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=21e+O6a/0NQnBECsUblxR6mTia9rEVhmdm2lp/29jkY=;
        b=b/au5kXDBzKC7eWfXYhO9KBe//Wq9+jy/I4KjgJTDuBpuGGWlXyQNc3Xn+10f1pKXh
         NSvgnl8OOW9lXsPFtEa7DYRHIabDFA85++CGBPVye1nK8GlqDJh5S9xh4mTL/TosWozY
         SlruH9nIoJqaY0GOrxJhyb56/fQkgDvhJsX3l7iLaz66vkETZIHlL0o6H3S44AHQ9N0v
         LjJQOwBlqo3LftnbRLb/wbIrj/4WJQ26LNabaUjba2UpoHwOKJjrNc8S92LM44jx16KV
         TUpBc+zUCCxAgl/3JSmz4fIOn+oa4m2kH9BhGBPqQfnu5Tmh9fmbDXBL+ibo1jJylYUM
         FDpA==
X-Gm-Message-State: AOAM531XAf6ua3F8mPBAgcf++u34wn/Tq9Qbfwe5JUU4NPkC6nVS4ais
        B5CCqn2xqaUgJDkwtmiNgPMzuXfLOIBXQQ==
X-Google-Smtp-Source: ABdhPJz7BbCTvyGtaVJ3tAW9MxQnhNQH6NUdZwryDCDX+Ji2qugloOBjcp9IZjWHCPc380+95m3wxg==
X-Received: by 2002:a17:906:3087:b0:6f4:2901:608a with SMTP id 7-20020a170906308700b006f42901608amr14292893ejv.646.1652687121379;
        Mon, 16 May 2022 00:45:21 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id eo10-20020a1709069b0a00b006f3ef214dbesm3409794ejc.36.2022.05.16.00.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 May 2022 00:45:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 16 May 2022 09:45:20 +0200
Message-Id: <CK10OTVFAP75.WCSVY40A7PXO@otso>
Cc:     <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, "Rob Herring" <robh@kernel.org>,
        "Andy Gross" <agross@kernel.org>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        "Marc Zyngier" <maz@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2] dt-bindings: qcom,pdc: convert to YAML
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
        <linux-arm-msm@vger.kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>
X-Mailer: aerc 0.9.0
References: <20220103074348.6039-1-luca.weiss@fairphone.com>
 <bef4922d-4a32-f184-44a1-8f5430190938@linaro.org>
 <fef5f229-f247-d032-fc76-46ed7083dbf4@linaro.org>
In-Reply-To: <fef5f229-f247-d032-fc76-46ed7083dbf4@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Krzysztof,

On Mon May 9, 2022 at 10:40 AM CEST, Krzysztof Kozlowski wrote:
> On 09/05/2022 10:38, Krzysztof Kozlowski wrote:
> > On 03/01/2022 08:43, Luca Weiss wrote:
> >> Convert the PDC interrupt controller bindings to YAML.
> >>
> >> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >> Reviewed-by: Rob Herring <robh@kernel.org>
> >> ---
> >> Changes since v1:
> >> * Adjust description of second reg-name as suggested by Maulik Shah
> >>
> >> @Rob Herring: Hope it's ok to keep your R-b given the above changes
> >>
> >> This patch depends on the following patch, which fixed sm8250 & sm8350
> >> compatibles and adds sm6350.
> >> https://lore.kernel.org/linux-arm-msm/20211213082614.22651-4-luca.weis=
s@fairphone.com/
> >=20
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >=20
> > Luca,
> > I think this needs resending as dependency was merged. Alternatively,
> > maybe Bjorn could pick it up through QCom SoC?
>
> Correction - it seems that Rob took the dependency in April, so this
> should go via Rob's tree as well.
>
> Luca, can you resend without Rob's Review tag and ask him to pick it up?
>

So... since torvalds/master my sm6350 patch is merged through Rob's
tree, but there was also a sm8150 patch applied through Linus Walleij's
tree. This means (as far as I understand) that neither can really
properly apply this (rebased) patch as one tree will have missed the
other commit.

Does it make sense to send a v3 rebased on linux-next now, or wait until
this has settled down in torvalds's tree?

Regards
Luca

>
> Best regards,
> Krzysztof

