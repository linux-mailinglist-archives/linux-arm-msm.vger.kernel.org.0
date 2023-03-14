Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D94A16BA13C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 22:12:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbjCNVMW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 17:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbjCNVMV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 17:12:21 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C811B4216
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 14:12:20 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id e194so17159524ybf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 14:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678828340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cqr+dkq3tKG1sOKc+R1dR6rEMBcdSL+6uVvzhQ5+DTc=;
        b=Rf3B/WgrDERHLhDsxraQ9u7MIYRa2UtRzu5Fv/LEeOHwTXrql8M6zu3LlTTtMs/34p
         5ugfXw/xlY7/K39+nDJ286rb+hsLlmnec4cFy37wBo3gXixzmy0aujVzR7HVIkOe99pV
         7bgYZt7SdNLgjF/IY9YrEd1cByAJ5J7cHjsgsOBNQ7f+3Qyifz9v6e8uKMiCDs1GbCJW
         CyuDlKOesBGEen4fiHLNlIe1gpDD5U2mdgU2smQ0GjJrTUE/7pOCX96ddDdOUy5Jzf/z
         7HxUSenGJ7Xdtrh41LglFsUsgw/lZAS5gz/CS+c8qyeL+mysC+t3Jp8YWn0MGJ8leoHh
         1G7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678828340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cqr+dkq3tKG1sOKc+R1dR6rEMBcdSL+6uVvzhQ5+DTc=;
        b=upWlLzXILbh3YN7/quf6UBltecQkLTtYewCfmFy92rpuMQCRuYASFPfDhrE27yRJOe
         1P8sil+FgQyM8rrhFEXurhnTiJOJcHxjxYT8o9t+50ZJh9+Bx5Fw0QFG298ktCVfz1Jk
         mHgf9XglaWBZtFfOsABeFdANGusJka6z1jT1oQ9fh/RTU8mUJzMWwcBdHr97fqZx+j+G
         khUI7oEmcZaavnZIrNVAuaVJXXDEgBQfV6/5CYsXX3InG4Ta5N2q2o6CXSe7OQgoqFNB
         bPyKCqQtYLxGRJ+CuJxHnUR2JTUSQ7OlQtD3tP9lhuh24a2K18v7/+EKECC3DaC9D47y
         UHZQ==
X-Gm-Message-State: AO0yUKXl7YrqDpmsgKn48TTpsFoJLtjA8I0rUZ7ZlhIpg3z6O0/upSgs
        /441tylemYhcks2ugpLl+ykntaPYZAcYHpTopiny/6xOpYfloW/IQ7A=
X-Google-Smtp-Source: AK7set9D9hI8LpHpVG8zSymZGfcmshk7rrgZk+MQjvT9TpkhjAo/60IP+pUw8JJWZqDzH+1WvgJuAfABTWIovZKVfl8=
X-Received: by 2002:a5b:6c8:0:b0:b36:32f8:852d with SMTP id
 r8-20020a5b06c8000000b00b3632f8852dmr2947856ybq.4.1678828340023; Tue, 14 Mar
 2023 14:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230314193709.15208-1-xhxgldhlpfy@gmail.com>
In-Reply-To: <20230314193709.15208-1-xhxgldhlpfy@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 14 Mar 2023 22:12:08 +0100
Message-ID: <CACRpkdan0Vt_T3aRVAK4rd=hQV=MOARm9Wq7sD8rjoisTW6Dkw@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: qcom-pm8xxx-xoadc: Remove useless condition in pm8xxx_xoadc_parse_channel()
To:     Kasumov Ruslan <xhxgldhlpfy@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
        Kasumov Ruslan <s02210418@gse.cs.msu.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 14, 2023 at 8:37=E2=80=AFPM Kasumov Ruslan <xhxgldhlpfy@gmail.c=
om> wrote:

> The left side of the loop condition never becomes false.
> hwchan cannot be NULL, because it points to elements of the
> hw_channels array that takes one of 4 predefined values:
> pm8018_xoadc_channels, pm8038_xoadc_channels,
> pm8058_xoadc_channels, pm8921_xoadc_channels.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.

I am not impressed with that tool. See below:

> Fixes: 63c3ecd946d4 ("iio: adc: add a driver for Qualcomm PM8xxx HK/XOADC=
")
> Signed-off-by: Kasumov Ruslan <s02210418@gse.cs.msu.ru>

(...)
>         hwchan =3D &hw_channels[0];
> -       while (hwchan && hwchan->datasheet_name) {
> +       while (hwchan->datasheet_name) {
>                 if (hwchan->pre_scale_mux =3D=3D pre_scale_mux &&
>                     hwchan->amux_channel =3D=3D amux_channel)
>                         break;

NAK have you tested this on a real system?

Here is the complete loop:

        hwchan =3D &hw_channels[0];
        while (hwchan && hwchan->datasheet_name) {
                if (hwchan->pre_scale_mux =3D=3D pre_scale_mux &&
                    hwchan->amux_channel =3D=3D amux_channel)
                        break;
                hwchan++;
                chid++;
        }

Notice how hwchan is used as iterator in hwchan++.

What you are doing will cause a zero-pointer dereference.

Whoever is developing "SVACE" needs to fix the tool to understand
this kind of usage.

Yours,
Linus Walleij
