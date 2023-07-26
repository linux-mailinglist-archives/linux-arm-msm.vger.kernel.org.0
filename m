Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 546C6764053
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jul 2023 22:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbjGZULl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jul 2023 16:11:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231743AbjGZULd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jul 2023 16:11:33 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B9564205
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 13:11:07 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-ca4a6e11f55so158489276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 13:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690402261; x=1691007061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kufOwej6Ejbu5UGEHHxvJUz093XdV+Z/egA8g8BdoVg=;
        b=JgVbVvYXHxshK0T/IlE8H3nthHY0QuAZLiew9dPYmP1NxVeZwZBosl3RqoKwQzAoI2
         2y/wNk9OPa1kA4Ay/ytM2QPgOAS6faHXSzWjCF7hhAy3EokTNL6LE4aHEH3iKkzLfZgi
         zU1Y8VSG8sWtOpzt5ly3G3p2Rth+M3OBtMd5qvVZQIrg4S5zoXw8QWDiWW3GnsFBucXc
         cR0dIgXEBbYh9MqFuTzV01JGtNrfSPWBkvvpJ8wedMgCVDS1Hsl+Q167CnJJDye24elx
         5C77OfwK66hxvAv8MSu+y8WJ70VfHSEnT0fd2HMO/54mblwerHilD3tGXX1qSKXaiavL
         vgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690402261; x=1691007061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kufOwej6Ejbu5UGEHHxvJUz093XdV+Z/egA8g8BdoVg=;
        b=Bgqw730g/cNiHuNUixr5bO7VQWsiAv7lMC7v2FKpclxohppBNb+VYiePA9xhMO5dFS
         lIDt7bHS4wnJR1n3Sr/JkgXRI5zeoJoEni/2gxSGW3j7Z4Gh6ggMQHjlXqrljEFCIRSv
         4Ue53P9UqPR0QztaUiluqu/TXUkew/zkhw2VkHdvJSWj9QpFJ+h66BpmCrvQsZYsEgHF
         0wGmEcXji9xxisRNkd0Q6orSQW5i4ttTcR9cSasZgqiikPN9oR708LafWYbOobzc9NCB
         tkArOhMvpwbOZ2+mS2tg08Wm12RA85Syd6BmUK2uW+hkfW3MEu5Em97UqEvMwHBafLpv
         1o3A==
X-Gm-Message-State: ABy/qLbArqaOoGb2Wolb1ZPvpwpnZHxhDl9PfuhWRaUWjah2HoKlRes1
        CGUUR5IJXBm+fSUwd6kVAhUF09yZb8jHUfGtIWY96A==
X-Google-Smtp-Source: APBJJlH+WpCCBd7d7lqpF39cu0njy1wg9FdHONGwvu0qZWhQV9X/xdKzXc3YRZ+vgsCchotgbrX0A7icgH/FdUwcvaA=
X-Received: by 2002:a25:ab08:0:b0:d21:fa08:d683 with SMTP id
 u8-20020a25ab08000000b00d21fa08d683mr361206ybi.35.1690402261257; Wed, 26 Jul
 2023 13:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <SY7P282MB378740C6070900BEBF5D0D7CB203A@SY7P282MB3787.AUSP282.PROD.OUTLOOK.COM>
 <8bd8fa38-551b-35dc-cb6b-7c5fd79dc0a0@linaro.org> <31324276-9222-aab3-533e-6aae5fec4751@linaro.org>
In-Reply-To: <31324276-9222-aab3-533e-6aae5fec4751@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 26 Jul 2023 23:10:50 +0300
Message-ID: <CAA8EJprpzWgKMfk9O42_jtYuyri5cx8Ovteas_XEBcON-R8V3A@mail.gmail.com>
Subject: Re: [PATCH V2] arm64: dts: qcom: sm8150: Fix the I2C7 interrupt
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        qaz6750 lzy <qaz6750@outlook.com>, andersson@kernel.org,
        agross@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 26 Jul 2023 at 21:47, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 26.07.2023 20:46, Krzysztof Kozlowski wrote:
> > On 25/07/2023 10:42, qaz6750 lzy wrote:
> >> I2C6 and I2C7 use the same interrupts, which is incorrect.
> >> In the downstream kernel, I2C7 has interrupts of 608 instead of 607.
> >>
> >> Fixes: 81bee6953b58 ("arm64: dts: qcom: sm8150: add i2c nodes")
> >> Signed-off-by: qaz6750 lzy <qaz6750@outlook.com>
> >> ---
> >>  [v2] Fixed issue of not using full name
> >
> > You mentioned your full name as a bit different, so I am not sure what
> > improved here.
> To be clear: "real name" usually means "the name that is present on your
> government-issued ID card.

Or at least some kind of a 'full name', not the nickname or a random
set of characters. The same name should be a part of the 'From' and
'Signed-off-by' tags.

-- 
With best wishes
Dmitry
