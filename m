Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB8B773FAFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 13:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbjF0LV1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 07:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbjF0LV0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 07:21:26 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C603A294A
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 04:21:18 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-977e0fbd742so535622266b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 04:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1687864876; x=1690456876;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xUCZlFod1gFIQWmLgn2mr25s7m8GFrqoNi5bt+JZdA=;
        b=Fpvq6FzYjDUwnZuR/6hC50SsztpIKEOpSFfl+3rQ5kylgDP+xh8c3FdLy69HFzmd06
         TgilgJCR0oTnzcA+KZBA5PFjmMze7blXMrsQlwZD6F6fHQB1kvJgkP0xBcXibM90AtYY
         uroCYlM52w2btVeLUz5UN5dr0XKrKhDLT7o5+QmjADYVkaNMWEQewaqF85b3lvv98Z7J
         TYPUAjsMs4Y2U2LwpnLu6Z1Hy9Td6TR5lbVwPKQdMnijqNfe9EKtNt7QnhuP2HA87Ire
         rEqdGgbNsaWqd6tLjET19LlM267UyW7T+BJUVAXGeRUH5bJ5okp607LHADMzcYXULHci
         g4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687864876; x=1690456876;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9xUCZlFod1gFIQWmLgn2mr25s7m8GFrqoNi5bt+JZdA=;
        b=XysH9YK+2o03/PsXDBi1gm7RfFEuZs8JYXLcf2N+7wvdoQBfeJIW921nPIGXsL4FHx
         oLIadfILr45rgPx7KsdW0jBvsogpAdPkyaSGj57PTKrHPCRphmsz9g6rCWzm7kmJZXzQ
         ewUy2izdJ4jn88XBmWRTJC1B3KzxFAQdlNWyBdPVFt+dn86p4CHzKqpOnXtSclLmnG+A
         8kSCT8q3a9WpopXVTbiytrhoZoJh0Ex43EAA6iIFsjSfQl9okQdHZRGrtTUd7gjPP9En
         7oNfLeeH8KhZW88z2H5B+tYlvg0nzZ0WobGO8mQE09OGFE2Qgp7Q4VCvCvCP+xNtKJ/e
         lI1A==
X-Gm-Message-State: AC+VfDyIXPuNc74HjZ/yjTCV1qApc16LOEJI4g+t6BMHiWc5I23uwZgu
        ARi/GrD9ht2kyI6QqOTe5W6LFg==
X-Google-Smtp-Source: ACHHUZ5m6Y1OOMJb0fGLWzPJIHuIjLljczo/77S4FcS2sEnrI3e8bDRG9eDJFOFwLvOEDqxEF7QQuQ==
X-Received: by 2002:a17:907:26cb:b0:96f:e5af:ac5f with SMTP id bp11-20020a17090726cb00b0096fe5afac5fmr26590904ejc.47.1687864876657;
        Tue, 27 Jun 2023 04:21:16 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id jt24-20020a170906dfd800b00988b8ff849csm4402034ejc.108.2023.06.27.04.21.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 04:21:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 27 Jun 2023 13:21:15 +0200
Message-Id: <CTNE5VJF78AJ.37DA4CKP3E6K6@otso>
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Luca Weiss" <luca.weiss@fairphone.com>,
        "Rob Herring" <robh@kernel.org>
Cc:     "Conor Dooley" <conor+dt@kernel.org>,
        "Andy Gross" <agross@kernel.org>,
        "Alim Akhtar" <alim.akhtar@samsung.com>,
        <devicetree@vger.kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Iskren Chernev" <me@iskren.info>,
        "Manivannan Sadhasivam" <mani@kernel.org>,
        "Avri Altman" <avri.altman@wdc.com>, <linux-scsi@vger.kernel.org>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        <linux-arm-msm@vger.kernel.org>, <phone-devel@vger.kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Bart Van Assche" <bvanassche@acm.org>
Subject: Re: [PATCH v5 3/5] dt-bindings: ufs: qcom: Add ICE to sm8450
 example
X-Mailer: aerc 0.15.1
References: <20221209-dt-binding-ufs-v5-0-c9a58c0a53f5@fairphone.com>
 <20221209-dt-binding-ufs-v5-3-c9a58c0a53f5@fairphone.com>
 <168785971145.1233664.7985274899454909326.robh@kernel.org>
 <CTNCLCWEUWJO.19I1NW2GL7QMZ@otso>
In-Reply-To: <CTNCLCWEUWJO.19I1NW2GL7QMZ@otso>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue Jun 27, 2023 at 12:07 PM CEST, Luca Weiss wrote:
> On Tue Jun 27, 2023 at 11:55 AM CEST, Rob Herring wrote:
> >
> > On Tue, 27 Jun 2023 10:28:03 +0200, Luca Weiss wrote:
> > > SM8450 actually supports ICE (Inline Crypto Engine) so adjust the
> > > example to match.
> > >=20
> > > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > > ---
> > >  Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> >
> > My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_chec=
k'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings=
/ufs/qcom,ufs.example.dtb: ufs@1d84000: Unevaluated properties are not allo=
wed ('qcom,ice' was unexpected)
> > 	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>
> qcom,ice should land with v5.4

Sorry, obviously wrong version: I meant v6.5

>
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D29a6d1215b7cd5fdff9c3c31ea26076a694ee0a3
>
> And as mentioned in the cover letter, validation will still fail with
> without the extra patch linked there (which is not in -next yet).
>
> Regards
> Luca
>
> >
> > doc reference errors (make refcheckdocs):
> >
> > See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/2022=
1209-dt-binding-ufs-v5-3-c9a58c0a53f5@fairphone.com
> >
> > The base for the series is generally the latest rc1. A different depend=
ency
> > should be noted in *this* patch.
> >
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> >
> > pip3 install dtschema --upgrade
> >
> > Please check and re-submit after running the above command yourself. No=
te
> > that DT_SCHEMA_FILES can be set to your schema file to speed up checkin=
g
> > your schema. However, it must be unset to test all examples with your s=
chema.

