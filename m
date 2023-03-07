Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF5C6AF9A5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 23:59:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbjCGW66 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 17:58:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbjCGW6j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 17:58:39 -0500
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D2BA16332
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 14:55:45 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-536be69eadfso273607267b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 14:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678229744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOumxYNupJ270oxfqqpBEcjU4dd6uD/r4togrRDieg4=;
        b=Lkva8Yqv6yfbbe56NAGI6TppDFJfd9ensNRUWXkdcF5LkmTeW55SEDYN3Qy+C2p9ai
         YUlDDqKvcV24AFRf8W5qUxIU2gbHlDjFfhw9c69zvRJAFfmRUUgyIs3Jy8ye7F5W+yBn
         6201eqKNf3VQMA2vlijZkLl+4M1P7lDqY1isu1mM7MKBiAHq/AUKY2yuN2ENw7IV2beP
         xQnxBK6E2Iadt3LmOkoEhsqvin5VOhEbFDyOhKuXql1Fteg8j7yiOnhAnvutX6f6c2JF
         YXjMcH4CJr37LyqPUIVFhNMkIjUTMkmEqFA/y67WMvUrq+HkVFQNnDQGNnDgxOlGQ33z
         1MEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678229744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOumxYNupJ270oxfqqpBEcjU4dd6uD/r4togrRDieg4=;
        b=LendZKanHW0UAbc3JCTm/SrHik0ZolO7iTXnUJ7azqqO3/x4xuHVIEtYt3RszSlc+C
         uTe+5N5zc75zmO9vH3RWc/V1MCaPXCPRn+Hyg+wUsrgkyYbXsgwQpTj8OPBEteK1fXl2
         tpzqzJXV3ghlcnnFKJ3gJJcrWEJ3Oo0yYS5T51VigXTKKcLhRH/tfI5zHZMB9VvczEmE
         ywVs1PePj2gsLJyL+Hw98k8OkUtxovhfyeL+r6/wopX1whz9X8o/ypqh7D7SyHys+cPk
         Jj7efKVBQRt9lOipfwfYJe+OuQwGpMp8BiiR140BL1avZ1xW762kBZuepQ0TTKhYDTJ3
         5OEw==
X-Gm-Message-State: AO0yUKUnLs80eOMOePB+wo16Dr8IxbbqA7b/clsAVWN0yiG+vZBKiWi5
        CJcvQuIVHsWb0VG/jjH4j847axXXxsFPuAxk35Ukew==
X-Google-Smtp-Source: AK7set9MfC1PxNng6Vma+yRI7hRnqfXJxNmDi52QuFYnS9zfjs79ZjNGCHl8MlsdVidRYygFsWFznmMwQJa3NB16f9E=
X-Received: by 2002:a81:ac4b:0:b0:533:9ffb:cb12 with SMTP id
 z11-20020a81ac4b000000b005339ffbcb12mr10523196ywj.10.1678229743868; Tue, 07
 Mar 2023 14:55:43 -0800 (PST)
MIME-Version: 1.0
References: <20230119163201.580858-1-konrad.dybcio@linaro.org> <20230119163201.580858-2-konrad.dybcio@linaro.org>
In-Reply-To: <20230119163201.580858-2-konrad.dybcio@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Mar 2023 23:55:32 +0100
Message-ID: <CACRpkdakgumdpkEdbcUkmSgGRzSOxX6rFD_a9bjMaE1yemgUbw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] gpu/drm/panel: Add Sony TD4353 JDI panel driver
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        dri-devel@lists.freedesktop.org, marijn.suijten@somainline.org
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

On Thu, Jan 19, 2023 at 5:32=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:

> From: Konrad Dybcio <konrad.dybcio@somainline.org>
>
> Add support for the Sony TD4353 JDI 2160x1080 display panel used in
> some Sony Xperia XZ2 and XZ2 Compact smartphones. Due to the specifics
> of smartphone manufacturing, it is impossible to retrieve a better name
> for this panel.
>
> This revision adds support for the default 60 Hz configuration, however
> there could possibly be some room for expansion, as the display panels
> used on Sony devices have historically been capable of >2x refresh rate
> overclocking.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

Looks good, so patch applied to drm-misc-next.

Yours,
Linus Walleij
