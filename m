Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 793E46CB5CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Mar 2023 07:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbjC1FNC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 01:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbjC1FNB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 01:13:01 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2518C19C
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 22:12:58 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id j18-20020a05600c1c1200b003ee5157346cso8584109wms.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 22:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679980376;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7NL5B2zEB3jTPHtWtDx1iz+SHXOLfKNEdYRThYQwGLc=;
        b=zlnoQGiVIjJQBluz7v2YslRDbX63SbDbQkVOJkD/dKCrBo2xUDsMADewjEASdH0oTk
         MT3kPwB22TWJZA0dWtYlg7kZ0x+102BmK2n40Dvk1lWEbInKiGKNLB8nL1EJ9PreJf4d
         +IOuTuIsy0HD/Wg+rP3J56aUUchOwePBSkrtueL7/e7e7ATfA+mIApkDVsMndN/JkZPT
         PrRQOWE9/8o8fPS7IpCV7aCBpNFwBKRaB2mq/Kbxp2sdXqSVWO8EQd4raCQGPgxV4mEC
         cLyOPnMYmrFYyt8vKCo1vkW/bgA5MWrF2MTJWzyMMrTHphDU0FTSncc9pJpkEzrxwjsO
         jYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679980376;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7NL5B2zEB3jTPHtWtDx1iz+SHXOLfKNEdYRThYQwGLc=;
        b=SrfGKVpkY7DLFBkAqqA0oh26d2+DcY6YMZ4qDyQf5K8jtdlAJtytguXWMk+0yIhaNA
         jHvTURJrpWT+GEgfXYlU784bSxLvBATN74Mz0FTpkWP5lfkgNJp29p4p60H+tlnBR2SA
         Kr4g/6zln9Ue3ff1aK0CRjK3btVvPX3Xz2ziMRAOrRelqF0gAbvsc+5n25tR+G6uvs3b
         gyavcRxoptzUpwN7nqxHSbPF92eITuiLpFSEGJTYoO1N5DhdtiKnQAMUPkj7DfzbFPo5
         IoQxYbzcT+xqDDZ3ZW7QWnPnVCcwlHUCq+bEGkLejxGiZtOJtjHuWlMep06CJ+qwVcbg
         d/sA==
X-Gm-Message-State: AO0yUKUl4zoDYZqwNunSQ3aW22RNzuQkABE/F0lX3AOTHlkRhTtH3rgY
        P453jE3bxuH8MtkGLO2vRIbYfuVzZnM4QOvN6e8AWg==
X-Google-Smtp-Source: AK7set9bejMNLadUHItCJEY+tvClPEZKRImqA5n8bQgifJgLS2Xs4Uk1TMn55w2Pog1JrL8aEtG93Bl3lse9l0tEV+0=
X-Received: by 2002:a7b:cd17:0:b0:3ed:526c:25cb with SMTP id
 f23-20020a7bcd17000000b003ed526c25cbmr3217797wmj.8.1679980376495; Mon, 27 Mar
 2023 22:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230322114519.3412469-1-bhupesh.sharma@linaro.org>
 <20230322114519.3412469-4-bhupesh.sharma@linaro.org> <333081a2-6b31-3fca-1a95-4273b5a46fb7@linaro.org>
 <d5821429-032d-e1e6-3a4e-ca19eb4a60ed@linaro.org>
In-Reply-To: <d5821429-032d-e1e6-3a4e-ca19eb4a60ed@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Tue, 28 Mar 2023 10:42:45 +0530
Message-ID: <CAH=2NtypbmwuXgHTdCiaY6zRZEMrVvZipkoYRW=d_WmOMqE3Og@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] dt-bindings: qcom-qce: Fix compatibles
 combinations for SM8150 and IPQ4019 SoCs
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.linux@gmail.com, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, rfoss@kernel.org,
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

On Mon, 27 Mar 2023 at 17:49, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 27/03/2023 13:49, Vladimir Zapolskiy wrote:
> > Hi Bhupesh,
> >
> > On 3/22/23 13:45, Bhupesh Sharma wrote:
> >> Currently the compatible list available in 'qce' dt-bindings does not
> >> support SM8150 and IPQ4019 SoCs directly, leading to following
> >> 'dtbs_check' error:
> >>
> >>   arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb:
> >>    crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
> >>      ['qcom,sm8150-qce', 'qcom,qce'] is too long
> >>      ['qcom,sm8150-qce', 'qcom,qce'] is too short
> >>
> >> Fix the same.
> >>
> >> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> >> ---
> >>   Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 6 ++++++
> >>   1 file changed, 6 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> >> index e375bd981300..90ddf98a6df9 100644
> >> --- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> >> +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> >> @@ -24,6 +24,12 @@ properties:
> >>           deprecated: true
> >>           description: Kept only for ABI backward compatibility
> >>
> >> +      - items:
> >> +          - enum:
> >> +              - qcom,ipq4019-qce
> >> +              - qcom,sm8150-qce
> >> +          - const: qcom,qce
> >> +
> >
> > thank you for the fix, the change is correct, please apply the tag:
> >
> > Fixes: 00f3bc2db351 ("dt-bindings: qcom-qce: Add new SoC compatible strings for Qualcomm QCE IP")
> >
> > But let me ask you to split the "items" into two:
> >
> >        - items:
> >            - const: qcom,ipq4019-qce
> >            - const: qcom,qce
> >
> >        - items:
> >            - const: qcom,sm8150-qce
> >            - const: qcom,qce
> >
>
> Why splitting these? The enum is the preferred way usually, so why here
> do it differently?

Exactly, so our compatibles as per my patch can be :
"qcom,ipq4019-qce", "qcom,qce" or "qcom,sm8150-qce", "qcom,qce" which
is what we want to achieve as these are the base compatible versions
for further socs, with compatible strings as:

"qcom,<new-soc-with-crypto-same-as-ipq4019-qce", "qcom,ipq4019-qce",
"qcom,qce" , or
"qcom,<new-soc-with-crypto-same-as-sm8150-qce", "qcom,sm8150-qce", "qcom,qce"

Thanks,
Bhupesh
