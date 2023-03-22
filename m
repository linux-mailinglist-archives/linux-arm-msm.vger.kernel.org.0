Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B54B6C44F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 09:32:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbjCVIcY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 04:32:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbjCVIcX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 04:32:23 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA1135C9DF
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 01:32:21 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso10886246wmo.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 01:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679473940;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QnZkdiX76ZN4vR+x/LMRxd2A2o1J9Wji75teHmv4ZGg=;
        b=dWVu6SIIh8b+euxhaENPGQzYd8nRA7uF26Ge6FGV3JsAUisKNWU7N5sIui2caEBk3E
         Ba10ioxVisjmg8Dn4S+t5uRM7xYas/Q7XRZkg24/J7o76yC5ABAl3D21DgHvsFdnmJvG
         mB/byZH5fhFbN5ApzqL5rLSyZXS4BYgXMbrHQKGZZ4x1oLoEuws1Fn6D/VKE9QmW59ir
         6pnV8mYg9as87TwK94YjE4vct41hXW9oUCJIw3VG7vBs4P7OciPecd7RX24CmX3us3XW
         YLDY8wwvqInAe10Br8DeqCqi9B+PnJiZdxlX77PksSVaJPhpMSlXy8fqL1VHxiWTVU77
         Nm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679473940;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QnZkdiX76ZN4vR+x/LMRxd2A2o1J9Wji75teHmv4ZGg=;
        b=n3n4kxrqO1wyroQI/1Q59xlrhTGzvW75ehnWkb51j7gOL6QY9YrZiYFH3S4VsQzreo
         zmwSEJtbxxPhvWx/NCmUPLdTgxqru467FYqYdV0DOmzh50w0DVW0ZrfTf90UbS5lp0y5
         JfGuegrry/ImvkGTJf7vA1Vo/nECRlXV9Z/qf1QY2jW/tdO2XAjDlzsJOjsD2A1v31qV
         F/ttB98Aeb2TFgCjZbVrJymDavlORnfRyS1FO5KFUEAsllyzGM1QmTx5NjYDi9l+oQ3E
         fmh2fpOpOActgVYfU6jKK45f3XuAvDZhP2YFtJfzzKlK67jQxmTWkl/IzZvkTpsfPZur
         6Ixg==
X-Gm-Message-State: AO0yUKWxHdZFw4T+9HjHA8sUf9z2DQMTOa40i+HsRtRwBMjHYorLdMWp
        coEMVH6kkz4VHE50yuYPZGwUfW9nLeY22I6TE5A7CQ==
X-Google-Smtp-Source: AK7set9jbx6IcXCXy5IlWquYuPV9FZa4fN8gjTQ+iLZe9YDGw/vuRit6/77PtV6GsQyRt50mmKUcUXD1tooXXwhGm6o=
X-Received: by 2002:a1c:7c18:0:b0:3ed:d2ae:9aeb with SMTP id
 x24-20020a1c7c18000000b003edd2ae9aebmr1348176wmc.8.1679473940269; Wed, 22 Mar
 2023 01:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230320073816.3012198-1-bhupesh.sharma@linaro.org> <20230321213139.GA1646917-robh@kernel.org>
In-Reply-To: <20230321213139.GA1646917-robh@kernel.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Wed, 22 Mar 2023 14:02:09 +0530
Message-ID: <CAH=2NtxpREHJptSaEmAOLrVQwSJ86TaneOv-MKqnZc-AF-222Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: qcom-qce: Add compatibles for SM6115 and QCS2290
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andersson@kernel.org, bhupesh.linux@gmail.com,
        linux-crypto@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 22 Mar 2023 at 03:01, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Mar 20, 2023 at 01:08:16PM +0530, Bhupesh Sharma wrote:
> > Crypto Engine block on Qualcomm SoCs SM6115 and QCS2290
> > do not require clocks strictly, so add compatibles for these
> > SoCs, indicating that they are similar to the flavour
> > found on SM8150.
> >
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> > index e375bd981300..e6840d124af3 100644
> > --- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> > +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> > @@ -35,10 +35,12 @@ properties:
> >
> >        - items:
> >            - enum:
> > +              - qcom,sm6115-qce
> >                - qcom,sm8250-qce
> >                - qcom,sm8350-qce
> >                - qcom,sm8450-qce
> >                - qcom,sm8550-qce
> > +              - qcom,qcs2290-qce
>
> 'q' goes before 's'

Ok, will send v2

Thanks,
Bhupesh
