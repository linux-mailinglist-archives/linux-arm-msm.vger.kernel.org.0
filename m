Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2CAD6D3D28
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 08:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbjDCGPb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 02:15:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbjDCGPa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 02:15:30 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CB1065A8
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Apr 2023 23:15:28 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id q19so24980557wrc.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Apr 2023 23:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680502526;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OYr1/KuS7kMHwn46ltI5HEmCt5k4aJgWKClGbWF133s=;
        b=NTT03Lm8sZsH76eTG3jdAAaurDzfPUGB/iUpyvrJJCgS/iHAOeP0mrd1UJgq2TUEf4
         PHikextz4mHfKRXGZ4176flEtQA/gWpe9qSMGNQywQtYGkfXzsQxACYuZL2EPyY1WuLH
         zfgdDB7IP0Cq5JaR/05zHCo8WFZZANccGr8a3VV3/ATQhd2bPMp2PGSd3VuyW3TytX/9
         SsoAXEjVr4cLrtTZfufguHJhwRPZxbI4dOyUo11D3Sp2U35r1NGH4GBoT5loZVl4ey+j
         QwbzVdgsaj55u3lJQXWm+Nlm9GErX/1dT51kDE6G5ziC++k4jRAkazihgt5lJheHXYgP
         H1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680502526;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYr1/KuS7kMHwn46ltI5HEmCt5k4aJgWKClGbWF133s=;
        b=kXi9NBQJfQ8FibhymBXgZ2FjxCgz1ACIq5Z1PareDlLI1JUZ/YbBA4fDq1xJ4u6DrS
         mElly5hvhJOMJCAe/7DdB3TCQ3V5+FxCk9LkkDwhAGazy2XwEN533nezojYFKEf7M6aZ
         DjgaXMq4IzvUdGZaXz+Is9MEYKwCkAtDH+dzyYXR1CK4MstqezzHJjSnWYueKMw9HR/O
         t3XSYSjKBjM+KJ8ZwAiyiRsPin4eIftrkiF5nGvHj9B4qJzeUfcFcqLVLO94T397jMNl
         ULvN6jQPPqwC3pzBEOjLAfRd+su2eA9TsXJ474aQ2ajFjCJk+/C2bg4j8xieCDOIglH5
         WZXA==
X-Gm-Message-State: AAQBX9dnDzugNBUEXwyTJaFHa+YZrsbdBCXHRHUdBTI8dl2EHunowzt3
        DZJx+eHqs+DlvrJXyOTgRvzgJIXJlllGG3gCk+TRdg==
X-Google-Smtp-Source: AKy350acf1mfzrEPgp1c2mLaWyYaPeg8MW/g55MD0k5rk9VLpt+743GauRSVo2/m6TW4qS0GzGWVj+lSeid5yNUguIM=
X-Received: by 2002:a05:6000:5c1:b0:2d7:9771:fc4b with SMTP id
 bh1-20020a05600005c100b002d79771fc4bmr4955083wrb.5.1680502526512; Sun, 02 Apr
 2023 23:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230402100509.1154220-1-bhupesh.sharma@linaro.org>
 <20230402100509.1154220-6-bhupesh.sharma@linaro.org> <21eaeea4-4f2e-5ce5-c75b-d74ded8e6e4c@linaro.org>
In-Reply-To: <21eaeea4-4f2e-5ce5-c75b-d74ded8e6e4c@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Mon, 3 Apr 2023 11:45:05 +0530
Message-ID: <CAH=2NtzKGxzmCq2JTajxWoeRFR+mPnFY3YF5mn0tGt30T7SJoQ@mail.gmail.com>
Subject: Re: [PATCH v5 05/11] dt-bindings: qcom-qce: Fix compatible
 combinations for SM8150 and IPQ4019 SoCs
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.linux@gmail.com, krzysztof.kozlowski@linaro.org,
        robh+dt@kernel.org, konrad.dybcio@linaro.org, rfoss@kernel.org,
        neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 3 Apr 2023 at 11:06, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> On 4/2/23 13:05, Bhupesh Sharma wrote:
> > Currently the compatible list available in 'qce' dt-bindings does not
> > support SM8150 and IPQ4019 SoCs directly which may lead to potential
> > 'dtbs_check' error(s).
> >
> > Fix the same.
> >
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >   Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> > index e375bd981300..90ddf98a6df9 100644
> > --- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> > +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> > @@ -24,6 +24,12 @@ properties:
> >           deprecated: true
> >           description: Kept only for ABI backward compatibility
> >
> > +      - items:
> > +          - enum:
> > +              - qcom,ipq4019-qce
> > +              - qcom,sm8150-qce
> > +          - const: qcom,qce
> > +
> >         - items:
> >             - enum:
> >                 - qcom,ipq6018-qce
>
> Two commit tags given for v2 are missing.

Cannot get your comment. Please be more descriptive.

Thanks,
Bhupesh
