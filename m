Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A282C639852
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Nov 2022 22:54:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbiKZVyL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Nov 2022 16:54:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiKZVyK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Nov 2022 16:54:10 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D266175BF
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Nov 2022 13:54:09 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id b73so8988134yba.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Nov 2022 13:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zqe81NVe4wdrr2qX6L4lKfxkGOclAd0cUZt1hvJHh6k=;
        b=KSesdFAk+hx2US2lXbKFOn0Csy1YQU/Q4fmPt3IHZVJjZQh6iVjthC8P0w9jg8Weim
         Nzxu6WUEVv2q/uHzt0SwvOZViEwISSJW+DSBA8jsnM4qt/56XSpR5l23VkH+cxImmgLU
         39e0RqgGVD3EG49hxlE4QkbCmSixA4q17vObjYhW39wAZgn6vclsseAnpff6Pg7uDK8Z
         zs0yxHw7TkG92GRjJOd3S01JujZqsZtTyEBznfSjOiD6J49b6phBn/HEZVDeZCZQtecx
         3MnevQ2ZREIW455Qx4UcJiRG4N4Rx/g/BWdFCRC11O2VNT+l2Md1ZGhxNQJnebIEuc4T
         M5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zqe81NVe4wdrr2qX6L4lKfxkGOclAd0cUZt1hvJHh6k=;
        b=3U13oPi4yoavLPe6oaH8uQDGzOqCk+sb1f3VTtYPpHpb1isl3xD2XTzWq2X+lQCEIO
         yP/3i1pjKifVbT8TfB8dCp4TWsCD1yTpvI36UkwkTv9bvD7h/F/sm7SgrWYefpufrzp0
         mONEuNSE1/brUzgja4R/CxX2s2xrdDrEqgh9In7QoAMWRF6z5x3WVZ9PL08LaQ28aEkI
         xn/rTqRB5tVr9K4bO3lxD/DtWXuf7lav1gDufSRqXQ84+iThCjCTh8iiV1s4XBazDLWC
         EOnO7JVf//lrjO9bQ5Ytkft4MaZ4q2DhDypqmjdR7VkKXsN8KWqHdvmdfuQfs3HKQTMS
         0IAQ==
X-Gm-Message-State: ANoB5pkiE/O7lLfpK+iUKMIK76Av08qGFKh33sp6g4RYgQZhiqdzqfJH
        fxDRxcclRxq+T7HZixXPbwh2tvzkUimJZWXnNefR0g==
X-Google-Smtp-Source: AA0mqf78FRQ1441202IFUwXz8NzZChqqyuytSPBEfAvEooJvd057yNmqCvNaVpwYu33ZVh/g47KT0G8ilKiWDJ9YkDE=
X-Received: by 2002:a25:c7c8:0:b0:6bd:1ca1:afd6 with SMTP id
 w191-20020a25c7c8000000b006bd1ca1afd6mr40579650ybe.43.1669499648876; Sat, 26
 Nov 2022 13:54:08 -0800 (PST)
MIME-Version: 1.0
References: <20221123152001.694546-1-abel.vesa@linaro.org> <20221123152001.694546-3-abel.vesa@linaro.org>
 <CACRpkdZtkHCkfUAcezSJvmei=HOezK6oyx+4C5kBrEtU+vAB-g@mail.gmail.com>
 <fecb2dd6-9be2-78dc-4598-cc338fbdc2a2@linaro.org> <CACRpkdZJaz9BEorQa7dTNkgTkwZjJNB-MWrpKFxHRgdsf3xJww@mail.gmail.com>
 <8602cacd-f552-e843-5c17-681b099069a3@linaro.org>
In-Reply-To: <8602cacd-f552-e843-5c17-681b099069a3@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 26 Nov 2022 22:53:57 +0100
Message-ID: <CACRpkdbqjNJH_QvWyEPceUUxRQ2tOpErNOWA0rg5GNwq7PfUFQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: pinctrl: qcom,tlmm-common: document
 i2c pull property
To:     neil.armstrong@linaro.org
Cc:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
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

On Fri, Nov 25, 2022 at 1:40 PM <neil.armstrong@linaro.org> wrote:

> As I understood, it enables an "I2C resistor" on the pin, removing the need
> of an external pull-up resistor on the line.
>
> I assume the classical pull-up bias is not strong enough to replace an actual
> resistor on the PCB.

In that case I think this should be an argument to bias-pull-up like:

bias-pull-up = <360000>;

Nominally the pull up is in ohms:

  bias-pull-up:
    oneOf:
      - type: boolean
      - $ref: /schemas/types.yaml#/definitions/uint32
    description: pull up the pin. Takes as optional argument on hardware
      supporting it the pull strength in Ohm.

Then the driver can choose to shunt in this extra I2C resistance
from the resistance passed as argument. So no special property
is needed, provided you can get an idea about the resistance
provided here.

Yours,
Linus Walleij
