Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4E7531AED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 May 2022 22:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232659AbiEWUMl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 May 2022 16:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232754AbiEWUMW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 May 2022 16:12:22 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 062FD9BAE1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 13:12:16 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id wh22so31002128ejb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 13:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QZXLD0VurYCh4Xqp/G9KEyyGkpU1wTIUGVr+sFogb9o=;
        b=Fj0W+N17zW6yRB4z6FkPqWEjRsyQ3VQSEGzXc/5AmfMrpkVI6MFFl9VFv9gD4moqur
         MJO9gvDkoO1boyRj1TJD795LktG2BjimRT2Gu1I300lL3fWQ5usYaZLYclexuSqNF45Y
         FdBoQBnUnSSAAH6TSh8d0dYmyZ1QnEiVktIcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QZXLD0VurYCh4Xqp/G9KEyyGkpU1wTIUGVr+sFogb9o=;
        b=5t3IVA2xlvro5gwHoygJYIvKuc0IecRdHSrAkDYDs4fA8sgcnFG8wgTNUhv07p/fGF
         wlz4gpAv8AlyaSN5H9gBHQh42Il/mCPTdzAEo6Nk0rdIxC1LqnKVduM3z66znoSz6rgH
         x1XvZIimuOOfhAJwMznXUKEcnmNuNll4P3GMNXb94XoIHXC0kiIXUlAsSX3n+n/3z0Nv
         AbbuLVNONVj9M/2PflqUbkx6N9bVlqHxCdzd1d6Gusw50vao3crCHfepDAo56NM83euH
         L+18GAuglfHUR3QX/sj7VhXoK3yDBCqUHcpqN5caeaYgPJg1pLZjaqPdw/IJdFvgKUbN
         sMaA==
X-Gm-Message-State: AOAM5314VfXMiwwnF4P70EzrIxlj71i0nhBdOB+ivGOajpxjFwjQoi5P
        HYTio/mZHeUzgNjSlDpX9/O8gbh+XzpAYnu6sQs=
X-Google-Smtp-Source: ABdhPJxiMnVxs+ZSgp7JVIJb2/2QjW0bK0uPfkNB8QuMaUxNSQuzs3zXH7Y1xMKVYihqkYF/qK6ozg==
X-Received: by 2002:a17:906:e07:b0:6fe:8f00:cb0d with SMTP id l7-20020a1709060e0700b006fe8f00cb0dmr21015799eji.332.1653336734288;
        Mon, 23 May 2022 13:12:14 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id k7-20020a1709063fc700b006feece1e053sm1157776ejj.90.2022.05.23.13.12.11
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 13:12:12 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id t13so3719423wrg.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 13:12:11 -0700 (PDT)
X-Received: by 2002:a05:6000:1c03:b0:20e:5cac:1eb5 with SMTP id
 ba3-20020a0560001c0300b0020e5cac1eb5mr20567416wrb.422.1653336730934; Mon, 23
 May 2022 13:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220523123157.v2.1.I47ec78581907f7ef024f10bc085f970abf01ec11@changeid>
In-Reply-To: <20220523123157.v2.1.I47ec78581907f7ef024f10bc085f970abf01ec11@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 23 May 2022 13:11:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XAVrBuOiHJju+xsLbzEvdMjRO2a7U8T9j=H85xuBQrdA@mail.gmail.com>
Message-ID: <CAD=FV=XAVrBuOiHJju+xsLbzEvdMjRO2a7U8T9j=H85xuBQrdA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sc7280: herobrine: Don't disable
 the keyboard backlight node
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, May 23, 2022 at 12:32 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On herobrine boards the keyboard backlight is controlled through the
> PWM LED driver. Currently both the PWM LED node and the node for the
> keyboard backlight are disabled in sc7280-herobrine.dtsi, which
> requires boards with a backlit keyboard to enable both nodes. There
> are no other PWM LEDs on herobrine boards besides the keyboard
> backlight, delete the 'disabled' status from the keyboard backlight
> node, with that boards only have to enable the 'pwmleds' node for
> keyboard backlight support.
>
> Also add a label to the 'pwmleds' node to allow board files to refer to
> it with a phandle.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
> (no changes since v1)
>
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
