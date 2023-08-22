Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57F79784242
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 15:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236140AbjHVNlX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 09:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233488AbjHVNlX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 09:41:23 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BADF1A1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 06:41:21 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b703a0453fso75706881fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 06:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692711678; x=1693316478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcgDocHR3AS6T5F0NbvfXCbpFyony7w3WuvNA0XYYRs=;
        b=hfTF+UAST2CfCQfAM7m4zVeEmDW2auHQh/I2FQdfSigtVheBITXh5Gf32pObwshGm3
         0GSACTbnr8EZHR/YKc9szjMp+tvTOGEcTI5oc4FQ1vcREWvx+eCUIwMbqq3dUTJupKwO
         pG2JBvVuESYTC9FR0IUz+lp+pKfiWPRHOEPck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692711678; x=1693316478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XcgDocHR3AS6T5F0NbvfXCbpFyony7w3WuvNA0XYYRs=;
        b=ktGXMcT0u0o+8rws5qz8pdgBrVLPI7LKlRtYh2eyBHfS8rK6mgzAdisOxRtBgwoxlA
         4WQFMYNd7PkT3tl5QHVOo0Sw1WitspJHXktKAQTYF3HPsmBZsChcvvIEgnR2R6ZxWxta
         CtkcMg6AAS2i9Q1lFB2lFDS4Na4768HLHLobjdifTH/9OAgMNZfEgvjMwcQHHsJBCYTx
         j5GbFTIQKEg9nD1eQZnir59DN7nGD1S+JPG1P3B87moWGyxEIzNi3M0dfRykoZ9n2QOd
         EfIP26z5nHFgnYakeGwSO/YBYrrQs7reyUU1/T18sy4tgHzTPCS5QLItOlnyFpsYxr+R
         aDJw==
X-Gm-Message-State: AOJu0YzZdAsj+Id+BQyTjgYrqlCNnMpZino6ujaftaQQqmMqobGpexsM
        jbhIY+8ebRUr5+yXfSECxd9UbnpiuzzBXMxDZib57OPU
X-Google-Smtp-Source: AGHT+IF1dZsDowlpUxFXcrtlHhPq+Ey9umq9i9RCOnveO8OPDSjGYLwvtHVbYGCi8ChIsWDzPngjhg==
X-Received: by 2002:a2e:9690:0:b0:2bb:9fcf:6f56 with SMTP id q16-20020a2e9690000000b002bb9fcf6f56mr8022898lji.22.1692711678239;
        Tue, 22 Aug 2023 06:41:18 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id pv21-20020a170907209500b009829dc0f2a0sm8129869ejb.111.2023.08.22.06.41.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 06:41:17 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fef56e85edso70695e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 06:41:17 -0700 (PDT)
X-Received: by 2002:a05:600c:5123:b0:3fe:cd3a:ef92 with SMTP id
 o35-20020a05600c512300b003fecd3aef92mr109374wms.6.1692711677321; Tue, 22 Aug
 2023 06:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230822100359.124282-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20230822180054.v5.1.I26e017b00a341e7a5a2e94a83596923713408817@changeid>
In-Reply-To: <20230822180054.v5.1.I26e017b00a341e7a5a2e94a83596923713408817@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 22 Aug 2023 06:41:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UkQhrPH=8N+TcErXHEFMh5nunZsCAvXiYyT+LRk-s5-g@mail.gmail.com>
Message-ID: <CAD=FV=UkQhrPH=8N+TcErXHEFMh5nunZsCAvXiYyT+LRk-s5-g@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: qcom: add sc7180-lazor board bindings
To:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Aug 22, 2023 at 3:04=E2=80=AFAM Sheng-Liang Pan
<sheng-liang.pan@quanta.corp-partner.google.com> wrote:
>
> Introduce more sc7180-lazor sku and board version configuration,
> add no-eSIM SKU 10 for Lazor, no-eSIM SKU 15 and 18 for Limozeen,
> add new board version 10 for audio codec ALC5682i-VS.
>
> Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.googl=
e.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v3:
> - correct corresponding of new board and new sku
>
> Changes in v2:
> - add new entry rev9 with Parade bridge chip
> - correct newly create dts files
>  .../devicetree/bindings/arm/qcom.yaml         | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)

In my response to v3 [1] I mentioned that you should make sure to add
Krzysztof's tag that he added on v2 [2], since v2 and v3 were nearly
identical. IMO, you don't need to send a v6 just for this but please
remember to do this in the future.

[1] https://lore.kernel.org/r/CAD=3DFV=3DWKTdaQgH4Cf2OCV9Uy6APjxfP8Pz+1-uWA=
cLC2PphYnw@mail.gmail.com
[2] https://lore.kernel.org/r/55d4090f-d2f3-ffb2-cc6f-a13222f14e47@linaro.o=
rg
