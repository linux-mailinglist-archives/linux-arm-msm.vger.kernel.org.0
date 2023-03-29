Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 404C76CD4EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 10:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbjC2Il5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 04:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbjC2Ily (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 04:41:54 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8625F195
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 01:41:53 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id n125so18346490ybg.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 01:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680079313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=we/N4oQDR6XoZiEvq5GnI6M0YFT7oJjEt6185k+IGaY=;
        b=qFyiav9b1zdKBdgJCfyqcCgfBQBBsA1ndNq+BFIggKyw9cQxX1k9udJayM/p50i3Ov
         XHgtrpALhf5R3F/4m4bplS/w9Tvv1E9IWQhg33ExSmsRqULE+rAmnl2S48M8xvhdWXW4
         G4vD2EFmWTLP7+0KSCLYgJ7t8VeDgTjz35ekRb1Rts/9dPllu7Rd2oRy1X2EljuLDaDI
         9cRQOzYkmNzleaiRqiJpaDqAQgtV11V/IFo10uYG4AKrKOQsnVqFhSW5fShFt+ZAAKIz
         Vv/ALNRwC+zO+YL6b4j8tE8xMp9X8zOtWRykHa61iPEu9d6RxMwIFKs/hEFt8nYQcKwf
         IGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680079313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=we/N4oQDR6XoZiEvq5GnI6M0YFT7oJjEt6185k+IGaY=;
        b=PuNFjuGSAiWNg3X30A43MOJpaLqtulvGqjhV/c3HBz3ZJjYFDwSi6EpGC5DbKJR2zR
         2ROr2i4yTszicRQ+3i2rWgjcAMzjQ399px2VJND0481Dzo8szI5bvLWgA/ysrhHrwiY+
         D6g9qp3ie/0iCzZq3ViCrq4+uXioniQgyMhCKSMx5KamVvDd3syCYg/1SrS/fBRPBtCZ
         plpa/ttUzunqBH6/qOEBlL+V4VrpDUiZZJra28Qnip74MHnDjQYaHdxxJPvsZ6PDeifG
         34A7dpJixv+K4tlmScCqYLSmyIBUHp84HHBsMWg8D+4XI6mmjRYMFheiRec1T4Mjb3cs
         78pQ==
X-Gm-Message-State: AAQBX9fnOgZAimPj9xOxHzUMTgkfheJPcPEL0bzhQyD+EzhjDB412j2A
        fWRi7oxemazkiCXqh6gyk8QVu5++hqWfyPDJ4Pr1Ch2lZ9Ftk+G5
X-Google-Smtp-Source: AKy350aor2tRD3I/kJ+6CWloLqkSEKVo/h//FFtfDDrUGgRIOB5h7pz62ZhQRQC3LuXLMNjQOK3qmDTy7PR0MhwWPvs=
X-Received: by 2002:a05:6902:1586:b0:b23:4649:7ef3 with SMTP id
 k6-20020a056902158600b00b2346497ef3mr12388881ybu.4.1680079312776; Wed, 29 Mar
 2023 01:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230324084127.29362-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230324084127.29362-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 29 Mar 2023 10:41:41 +0200
Message-ID: <CACRpkdYNPNQRC22KD9gK2BwcEYJKc-2OvKmT9kVzTLDpWkK9-g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,sm8550-lpass-lpi: allow
 input-enabled and bias-bus-hold
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 24, 2023 at 9:41=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Add missing common pin configuration properties: input-enabled and
> bias-bus-hold.
>
> Fixes: 268e97ccc311 ("dt-bindings: pinctrl: qcom,sm8550-lpass-lpi-pinctrl=
: add SM8550 LPASS")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Linus, please take it directly.

Roger that, patch applied!

Yours,
Linus Walleij
