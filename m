Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6BF65FE71
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 10:59:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232460AbjAFJ7S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 04:59:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232707AbjAFJ7R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 04:59:17 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28C3D62F3
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 01:59:15 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id bq39so1351516lfb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 01:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+LdWRq5fCWm8JjYCgO39rTeTivKiGVldKJdA/0Hh1I=;
        b=jH0Z4pH0KLFit9qCwnVDOtvvHNWSdBW37O0etIqFHtpt0SWCTme2FD3UDei/IIJNHg
         ljApxx92B4xP4ubNfD8XH1J7WkIccMgCO9e4lINelGrubFtmUCrN6HlhwJMAhBdtzXCP
         ahK5KCWIzqmfUMAQi4mmXza8RU4JNglRTPs8P36+y0bs3byedW68ttfculVZxIofEBrm
         NzRSfXSOO+CE9RtWlB7KQ7CEhTl0zVIYa6S8e/1KmMIvnjQhvrR3M4n6X5XYJ6Y8giPS
         +NolZfT0EGTTC+M1HHqctqELdBo3P97Rsvb/nmO9PmLcbbvoEc3/t/WgNxF3gpWw+st9
         Zl5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+LdWRq5fCWm8JjYCgO39rTeTivKiGVldKJdA/0Hh1I=;
        b=jEP+JGACq9/z4IAqjKDizjXFvpgbrLcmEzXo7QJLDTss09IE6kGthlGoggx3znCDbr
         OkLTq6oedzNrbP6Nv3LDz7QOUUNaQMkfNLux8bHj4f549Qxnd6jhPMi+O36FWtEVODe6
         9xlBu+nX4WHhjwzQNVusuGg49I7aYC4IaYFTXB39OQE1dPGdCI8MYwaEjUTeDaftTxJx
         WXAlWMSMA5GiUjXYfcZ18RdAODxho8grmPnQrLHL1XSuRvrYQXZb8FqThLwLloTYm7x8
         RaZ9zLRJGZQnc+vs1zmD+o6oeCFpba2Sb+wstp//T+4HpsrxxFGYJLkJqhBB72sqdMTD
         vbtw==
X-Gm-Message-State: AFqh2krfFo6MV7bf45mit5284Z3qcx5FCU5kJckVQFToeI9/Kqny22fl
        KWrxenkf3V7hvHI8Fu1XenH34skz/u9qE35KKYA9x0Pu7FbQ+A==
X-Google-Smtp-Source: AMrXdXswe0SawivP7xFNZYxfdduHSC+ihxccaxSllNO6AcZOxbZESMNyPJ2gqBMW0OZefY7TGz2vwxEk0B7sQ3lr+r8=
X-Received: by 2002:ac2:563a:0:b0:4cb:4404:5188 with SMTP id
 b26-20020ac2563a000000b004cb44045188mr1008857lff.328.1672999153382; Fri, 06
 Jan 2023 01:59:13 -0800 (PST)
MIME-Version: 1.0
References: <20230103150419.3923421-1-bhupesh.sharma@linaro.org>
 <20230103150419.3923421-2-bhupesh.sharma@linaro.org> <fa0327b1-2180-1421-b448-a45ab0be9750@linaro.org>
In-Reply-To: <fa0327b1-2180-1421-b448-a45ab0be9750@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Fri, 6 Jan 2023 15:29:01 +0530
Message-ID: <CAH=2Nty2Gkx6ix3QwnhdLE6tZdAoUyQWQ_xHzbpD4Z2mr+oePA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: qcom: eud: Add SM6115 / SM4250 binding
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, quic_schowdhu@quicinc.com,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, 6 Jan 2023 at 14:43, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 03/01/2023 16:04, Bhupesh Sharma wrote:
> > Add dt-bindings for EUD found on Qualcomm SM6115 / SM4250 SoC.
> >
> > On this SoC (and derivatives) the enable bit inside 'tcsr_check_reg'
> > needs to be set first to 'enable' the eud module.
> >
>
> Subject: drop second, redundant "binding".
>
>
> > So, update the dt-bindings to accommodate the third register
> > property required by the driver on these SoCs.
> >
> > Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  .../devicetree/bindings/soc/qcom/qcom,eud.yaml         | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> > index c98aab209bc5d..1dffe14868735 100644
> > --- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> > @@ -18,12 +18,22 @@ properties:
> >      items:
> >        - enum:
> >            - qcom,sc7280-eud
> > +          - qcom,sm6115-eud
> >        - const: qcom,eud
> >
> >    reg:
> > +    minItems: 2
> >      items:
> >        - description: EUD Base Register Region
> >        - description: EUD Mode Manager Register
> > +      - description: TCSR Check Register
>
> Is this valid also for sc7280? From commit description looks like not,
> so you should have allOf:if:then constraining the items per variant.

Ok, I will fix and send an updated version.

Thanks,
Bhupesh

> > +
> > +  reg-names:
> > +    minItems: 2
> > +    items:
> > +      - const: eud-base
> > +      - const: eud-mode-mgr
> > +      - const: tcsr-check-base
> >
> >    interrupts:
> >      description: EUD interrupt
>
> Best regards,
> Krzysztof
>
