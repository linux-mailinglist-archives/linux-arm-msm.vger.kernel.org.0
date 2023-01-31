Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 712CD682DA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 14:21:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbjAaNV6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 08:21:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbjAaNV5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 08:21:57 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37142423E
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 05:21:51 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id h5so18003391ybj.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 05:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PS8+qSIHWKmyaRKr/7lxTJ6J5mm+kDSGr6zIeoJ549o=;
        b=htWHRzHAwcQ0yAcUaCKKPMHpnADzNrTlXGi4VxX0uQm6MD5SZoGdgtpzL8o65lkS+J
         oHMjPWTpazwCPHW7PkbXQ39ODcdQ1zpni0YxDqQ/UVxtfGJx/im8ae03Vi2I2Lsfm5wZ
         Vvy1OV1p4w8Am06cqaXTgvkN5CXA83hz2FvTGR3i5oE7Gc34i9sQ6O0L09ycJxwkZnnI
         8FetWLWHvZhRRYdbL5KJUVXWHmrOhxpgc1OnN4VU+pIzMHAiEZ9rE8AdFTrenobeV1ER
         uoTXdc7ZBzK0MZIV7d83dCH6iWt3eI0IU6D/ynC2juhtHyRJpwH2EaR1sJmYkcBzZcDd
         hi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PS8+qSIHWKmyaRKr/7lxTJ6J5mm+kDSGr6zIeoJ549o=;
        b=yBmEKx2paaEms+xDRxejNpeVgdCXSztcOBHmu8feTejtFw77R9GA+7djpd3/wGra2S
         EXuq4lpOSl0Ap8pGAw9MaTg1gzc9FgJ7ATW8OH34t4IvG7sJDnlAhYZu6fdZCgMDKvdo
         +ucUNA/AbW0fSQWKVpKVrGGtr0wUNGVFIRSCxZKPK/8VIaiJPEOz++dxsSQaCMijCQu1
         Yg0nz2GOnb2JGbPIeVaL39hP+GwDuPnUTjKhaeK1lCAeqHzNa2tt8hGAH8116wZKQbhA
         /fhuDbOqGcGQSJWAaTch4xiYOjdWY+Z4ZtWe1Yey07tncf+FLEKxzsl4bxkAmHhVQFcp
         s1+A==
X-Gm-Message-State: AO0yUKW1gFNZXj0LuUN7qfJSy1mABK+vhfaiM4K7zBKBmfF1QWNp0IUx
        F8HdLLO1cM2X5AvRyhQPgTWoxcgcM77uXsnXtILbjQ==
X-Google-Smtp-Source: AK7set8/PVrN2trOeEjFNnfvyMyl2HcH5os3U2pgQpYPFiW4trjlvzIOwEyxdrdhyrEiLoAumJMcFGsPSB5DntGMFsc=
X-Received: by 2002:a5b:c1:0:b0:80b:c9d0:c676 with SMTP id d1-20020a5b00c1000000b0080bc9d0c676mr2496081ybp.341.1675171310442;
 Tue, 31 Jan 2023 05:21:50 -0800 (PST)
MIME-Version: 1.0
References: <20230130165435.2347569-1-konrad.dybcio@linaro.org>
 <CACRpkdZjAyLUg3V7ZTzeMfUOTrndLrRX_gTFdO+amSmZkzB72Q@mail.gmail.com> <f3f70ac2-d097-b6ee-22d3-92fcfdd7c53f@linaro.org>
In-Reply-To: <f3f70ac2-d097-b6ee-22d3-92fcfdd7c53f@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 31 Jan 2023 14:21:38 +0100
Message-ID: <CACRpkdbD+vtiFnPHoSR9fpV5zwtdNo923frROR7Nb1nkAMP4wQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: pincfg-node: Introduce an
 overridable way to set bias on pins
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        marijn.suijten@somainline.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 31, 2023 at 12:50 AM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:

> > +#define DRIVE_STRENGTH                 9
> > +#define DRIVE_STRENGTH_UA              10
> >
> > drive-strength = <8>; // 8mA drive strength
> >
> > bias-type = <DRIVE_STRENGTH>;
> >
> > OK where do I put my 8 mA now?
> >
> If you look at the 2/2 patch, this property only reads BIAS_
> values, which can't coexist anyway.

Well the DT bindings have to be consistent and clear on their
own, no matter how Linux implements it.

But I'm sure you can make YAML verification such that it is
impossible to use both schemes at the same time, and it's not
like I don't understand what you're getting at.

What I need as input is mainly the DT bindings people opinion
on introducing another orthogonal way of doing something
that is already possible to do another way, just more convenient.
Because that is essentially what is happening here.

Yours,
Linus Walleij
