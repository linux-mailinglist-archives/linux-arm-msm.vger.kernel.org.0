Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78BD57AFECD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Sep 2023 10:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbjI0InO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Sep 2023 04:43:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbjI0InN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Sep 2023 04:43:13 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA9D3D6
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Sep 2023 01:43:11 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-579de633419so130833227b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Sep 2023 01:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695804191; x=1696408991; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbZf2fFA2FQ5qrsMA6J+4jlQPmdMuMWJbNxXkcx0woQ=;
        b=ttxs85YMPPlc891Jam9KQgtHLayUWR9Y8PTt9jjRiyfrzIc3ou/w/TM2pwe3w+c6Zy
         BRfu3Qhap3uw/i7IISn6kNQoO54OXPyiouk248Dhb2zqRz3FzK6c4V6f+jiX22I/14ep
         os1MxLf9tYs2kbEwNIjiTD9gfSnvR5lP/xwPRL3+KuIAshXxqH95yJqKYoH2hJhPgCIx
         w6V+XoYbzGnw3hM5Do+NT8eOZV+wRO7lKHEHXv3GJyB3/bgm/PBtjO83XieBntqGBGgJ
         HwYUNxqL6XRLx+n60pRXrYk+qiVxlS+Md1t5U56Np5VzCZVIbyvxU+FjP3YmDgzNGi7+
         Dgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695804191; x=1696408991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbZf2fFA2FQ5qrsMA6J+4jlQPmdMuMWJbNxXkcx0woQ=;
        b=tVFH5POVwXjGbgEtFOT9L1xkyDZzp4aCfZOS55KLpwSfVeOV0IXdzazoqfkylSmdg5
         eEBdW/0n3gepWpR3jelT/Ed5j/WDYAArPcXR0CMjgFlcw675ZiCjOSSC5B+25imNlGMd
         q8yn0rsgzZQurbsjNvULV00Sf5fOKg2ZeJpPqOdgN1Cjr/YoPLGKLd9nGd1qnL+Mv/MM
         ft6J/2u6B4d5eQh9cRsHBu0adAAM4+RnHV+dooZqNwtrHub43ym+j6yE2I13wG2bAjma
         zZtInmCvaaHJUklBCBVORcfBR8yCBYGvdVtSYGzf3uBd9XfHVzk7CUxn1BMGSjJm14rg
         9Q0g==
X-Gm-Message-State: AOJu0YyFP3hMU029ajVUO6SqbAwfW0g1RS3LJNwAG1FrCUQ5CwDIb3c8
        rbsxotP6ZqRbcj2tRT99iyy4F5WIKkf41dlo2HWUyA==
X-Google-Smtp-Source: AGHT+IGARZ/ws1fRu2Yb4a4UQx44nHbRJFszxMdFAdC60oItaObm/kXlaW74QXdyzbXLViFp8x3ekZb9MDLlCcs2TJI=
X-Received: by 2002:a81:5d87:0:b0:59b:cff1:a8eb with SMTP id
 r129-20020a815d87000000b0059bcff1a8ebmr1698986ywb.34.1695804191087; Wed, 27
 Sep 2023 01:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230922-msm8226-i2c6-v2-0-3fb55c47a084@z3ntu.xyz>
In-Reply-To: <20230922-msm8226-i2c6-v2-0-3fb55c47a084@z3ntu.xyz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 Sep 2023 10:43:00 +0200
Message-ID: <CACRpkdZHjsm8HLg9B1KYHnhstcjwd18r0bE5GF0_Z4EqcuAWWA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add blsp1_i2c6 and blsp1_uart2 to MSM8226 SoC
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 22, 2023 at 6:56=E2=80=AFPM Luca Weiss <luca@z3ntu.xyz> wrote:

> Add the I2C bus and UART interface found on the MSM8226. For the I2C bus
> we also first need to add the pinctrl function in the driver.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

v2 looks fine and ACKs in place, so patches applied!

Yours,
Linus Walleij
