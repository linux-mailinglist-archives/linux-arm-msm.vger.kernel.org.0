Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC5F580DDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 09:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238054AbiGZHeU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 03:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238595AbiGZHd5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 03:33:57 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D70C2D1C9
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 00:31:07 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id oy13so24604895ejb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 00:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pbTApP5FjDQingRY/H/GZ1QffrBKNL73g1VJDFx7U7g=;
        b=kzDyG1w1YeNT+Gs20iGw8yaOZDw46hsTfQVY+xW1dE9SN5RG6o7wcJQ+zoX9z5VmVb
         fG9uiSIlA8Dr1rXmZR+wk01mrVTGAFafqmafD2YtQ+c2yBMlQ+s922XmXJ07sEXT6JSQ
         o0xtHQpeICXcDnuz/ugrM26j04Pm6OONOs0nLRKF5XKPHavla4n1bMBwm3Ou2HLle3Gp
         NqWX+SfELP2mkXhEcwD/cd1wiTCr8s3qhxfHrnLarLAPISyazwBDeKpDJnMi3aOKPzZ9
         xGdQvqmSgmj6cxP5fGE8KzMz6UFuXQsvRLHXPR7w89xc5Sfgc+KAs840W6OJS4GnHT3v
         rJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pbTApP5FjDQingRY/H/GZ1QffrBKNL73g1VJDFx7U7g=;
        b=GPNAJdGoxm2ZZFVZMxL+ncd0SCzEdSuP3IiEsKu5Ega61nbTK3DCmW+LPAwqOw2fHh
         lGaBRlzrtaMoJBxmDu5j3er+dB23ov8jFleptwD81ucpWR+wDh3FVaf4rX5aCYK0HpN8
         Ej/mkgfQSrSsleQ9in0LVbxgxh6CjVXANnjr2OThVsULFq3gsaxCoWW/13etsoZfVJpX
         A4+2NV0EhlFePM4iNtf9b2Eeltts9K2XQe55s9gXCC8JGyHsjqP3x8Sh7/ncB9enRNDn
         mnKkh44WUKmgbp1zvLLsoUI5pI+c+2idpxBZHvM7ylrTs9Xe840NeNDJdPvhIYUBOxJa
         xM0w==
X-Gm-Message-State: AJIora+K3VbjBgSxK9lToWIyWv4DogvystLTGbkU/8cqVa8naeVT25Wf
        /XszwPFftmaFGziImB80wy5i/HKLjuk+0o0QdkwmfKj9fpLYbQ==
X-Google-Smtp-Source: AGRyM1vZ1J+KCGDQDyAL70SvZC8MFvfMDNaLV76mBPoiaexxQ0HHhneER77kF7q2EcEPaqvNvF+4v1Xbdwpa4VQm6bA=
X-Received: by 2002:a17:906:2ed7:b0:72f:d080:411 with SMTP id
 s23-20020a1709062ed700b0072fd0800411mr8344430eji.203.1658820665357; Tue, 26
 Jul 2022 00:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220716192900.454653-1-konrad.dybcio@somainline.org> <20220716192900.454653-2-konrad.dybcio@somainline.org>
In-Reply-To: <20220716192900.454653-2-konrad.dybcio@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jul 2022 09:30:54 +0200
Message-ID: <CACRpkdYrJoWBKR0nEa23ObH2md3Bxr47T15zN0WR8vhuLqG-Ng@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add SM6375 TLMM driver
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org
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

On Sat, Jul 16, 2022 at 9:29 PM Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:

> Add a driver to control the TLMM block on SM6375. This is an adapted
> version of msm-5.4's pinctrl-blair driver.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Patch applied, we are getting close to the merge window and this needs
to sit in linux-next. And it's nice to get it in for v5.20.

If there are further review comments we can patch on top or I can even pull it
out if necessary.

Yours,
Linus Walleij
