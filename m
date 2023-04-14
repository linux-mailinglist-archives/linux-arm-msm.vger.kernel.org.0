Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03E9E6E1F55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Apr 2023 11:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbjDNJd5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Apr 2023 05:33:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbjDNJd4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Apr 2023 05:33:56 -0400
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B63868F
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Apr 2023 02:33:36 -0700 (PDT)
Received: by mail-ua1-x931.google.com with SMTP id l17so25497uak.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Apr 2023 02:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1681464808; x=1684056808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmnkUWMaBh/dQ2evri0SLi/J8TMxwOaXw9HZAIykNPQ=;
        b=AxSpE3IaPuxvlb/rnjlmHt5HDSPQ9PAIoq686N9ZUofrsSWuHTTqftC68x1PR/P2WJ
         rWJCgFovzJyEhPa8gnJJ5ljEdxPo0q4omf5c3rGqcpl9nayNsOA5TwlrSMJXHr9KVJY3
         N8yvbUELy+2DRXenNJ0B6WUcBchkv6tGAtZTh39DHRYcw6Q5K7hcDmzienQ9lnuJBUjD
         KZIls+bpIW8hxQ3uCksqzT4Msmq0pI7LTS1BR00cDjzxANZx0jgA26YQoeg+8XYX9Yor
         QhtYg5oZkK2GbDq5oksH7iHHQuiT31mmPV1nFqpmYSMXOSMa8PbvT7vfEJWrZi3NVYT3
         Mahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681464808; x=1684056808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hmnkUWMaBh/dQ2evri0SLi/J8TMxwOaXw9HZAIykNPQ=;
        b=DHXhdiMhjSpDM3G9Yj6luXAcpUGeis6Nzb+7B4L7kifaPK9Mg4e7HasFT+EK2RfOxs
         jTS/8JuhnsKnfu0TVzksf+GopUFxGUSMymhcJkGEPJUzdk+n8Eua9V6z8RUSQ3dEx9bD
         z5kn3Cm8Ltna7so+BgS9L410THy2Ms+hmgUiNi9Gvmf+/UyBw2u7NsGbFUiHZ08HHDlQ
         XBUiKzSd9ySYH5F8UeGX8jOW290ks0hpjMnMGumn6P1afhF2ypR2W5hOrCi68T/AL7Dm
         PNiGk71SPXcvGfIR38p0o4NYw5kXOl+ClbY0MyoRFNgRjazpJ57VKixUvESi+y25r8TK
         X89Q==
X-Gm-Message-State: AAQBX9epluwcrnR8DYz/ovz6u1KbCtG6b5vq0C2VXLpUU2t9nppWDdTu
        O4o/aBWhs8HJwUA7ErsDA4c3amyZaXNulWG7xFF1bA==
X-Google-Smtp-Source: AKy350bfsTtcHUxo29RImIJqDEHQ7T/MfcbWBd1biJy46lDDvJh6lED1lqs9QUqdbdlXBY7vDWk0nEhrfV1vzEezIQQ=
X-Received: by 2002:a1f:3857:0:b0:43a:d64:5aba with SMTP id
 f84-20020a1f3857000000b0043a0d645abamr2575462vka.2.1681464807793; Fri, 14 Apr
 2023 02:33:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230327125316.210812-1-brgl@bgdev.pl> <20230327125316.210812-4-brgl@bgdev.pl>
 <CAMRc=Mfe6gCM=Mz6Can6xsSsrjX-9T_aR2Yev+b57koky_az-A@mail.gmail.com>
In-Reply-To: <CAMRc=Mfe6gCM=Mz6Can6xsSsrjX-9T_aR2Yev+b57koky_az-A@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 14 Apr 2023 11:33:16 +0200
Message-ID: <CAMRc=Mfw+4Co8JPz51_E+DSawijO8EB6rMmFXEmM0e5F3Fg_8A@mail.gmail.com>
Subject: Re: [PATCH v3 03/18] dt-bindings: interrupt-controller: qcom-pdc: add
 compatible for sa8775p
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 6, 2023 at 4:10=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> On Mon, Mar 27, 2023 at 2:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Add a compatible for the Power Domain Controller on SA8775p platforms.
> > Increase the number of PDC pin mappings.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Marc Zyngier <maz@kernel.org>
> > ---
> >  .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml     | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/qco=
m,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pd=
c.yaml
> > index 94791e261c42..641ff32e4a6c 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.y=
aml
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.y=
aml
> > @@ -26,6 +26,7 @@ properties:
> >    compatible:
> >      items:
> >        - enum:
> > +          - qcom,sa8775p-pdc
> >            - qcom,sc7180-pdc
> >            - qcom,sc7280-pdc
> >            - qcom,sc8280xp-pdc
> > @@ -53,7 +54,7 @@ properties:
> >    qcom,pdc-ranges:
> >      $ref: /schemas/types.yaml#/definitions/uint32-matrix
> >      minItems: 1
> > -    maxItems: 32 # no hard limit
> > +    maxItems: 38 # no hard limit
> >      items:
> >        items:
> >          - description: starting PDC port
> > --
> > 2.37.2
> >
>
> Bjorn,
>
> Will you pick up the dt-bindings patches from this series as well or
> should they go through Rob's tree?
>
> Bart

Gentle ping as this one's still not in next.

Bart
