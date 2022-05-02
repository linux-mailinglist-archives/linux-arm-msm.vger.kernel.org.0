Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B11345175A2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 19:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386641AbiEBRVZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 13:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386631AbiEBRVX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 13:21:23 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 023DAB1DA
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 10:17:54 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id bv19so28978104ejb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 10:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1z2xMYMcF+/vzx55XisKKTVU2oHyYL+qwW8wjgY4MBM=;
        b=h7ETZog5UHxteO1Z4h2PQhLAnYd04U27aV7xua2b9cSc5JO0KVa2cLDc2aULBEc47h
         +7xyK8zFhDozHC0NcaeSq+yPdzfKw4I8tQVfSymv2wxIgRPY9qzGbN+uEr/z0UuA/uBu
         l+56NhBePzsTzScSOKtKGJ1236TPfg9G/Bhqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1z2xMYMcF+/vzx55XisKKTVU2oHyYL+qwW8wjgY4MBM=;
        b=LV0gLjhmvf71xHwd7fMblDw1dsbM7B6V3WWkCyFICvkCY4JQsSPVt+RoSbJyZIjwkI
         LgK9hwYQLxVd214TzvsmUGxJBIQQXYQYWdFlDQE1iAjBu3SA4u9JEZOUkdkL8yIVmu8t
         /l7PkvTI0HQZtRZAhQWkeMatqHBrUYu7QjgNc0XvxnDLT8un8xdNhvET20gDYH/nC9mf
         j/a6Y4ErvKbfy1CmayetG1IsQ/LBzRGzZeLnlA/GCRXGwIyQ6HzshLacXWnKgvvYuBDa
         3yYtKyQUgdKqk+oNvawu9I8dO4ZLQIlPv68i3/HSIAe8oKZwHp8yIIkyvUkzrbIwjq58
         ETxw==
X-Gm-Message-State: AOAM533myBzJXb6PosVvy9RivYOCBbr1vAHAlRwl42mz6xaCdO5sIdlF
        83pAojyhnS6ve5J2vf7sPdEpRemHpIR4YUh8
X-Google-Smtp-Source: ABdhPJzHY5e0YdOLj56SSZMjWCzq9O9kXHcUjeekxjvvkvhQMxX1EPjaPI4ZKLhgfwdeg+g20KCAHg==
X-Received: by 2002:a17:906:1ec3:b0:6cf:d118:59e2 with SMTP id m3-20020a1709061ec300b006cfd11859e2mr12100720ejj.767.1651511872128;
        Mon, 02 May 2022 10:17:52 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id e16-20020a50fb90000000b0042617ba63d7sm6839469edq.97.2022.05.02.10.17.51
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 10:17:51 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id e24so20343506wrc.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 10:17:51 -0700 (PDT)
X-Received: by 2002:a05:6000:2c1:b0:20c:5e37:3ed1 with SMTP id
 o1-20020a05600002c100b0020c5e373ed1mr5787424wry.342.1651511870901; Mon, 02
 May 2022 10:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220430011402.1.If7c3471db53bea55213f7bcf17e9043084d3ac0c@changeid>
 <20220430011402.5.I93d9a95aa7299f48ec081845ed29a1128f2ebe32@changeid>
In-Reply-To: <20220430011402.5.I93d9a95aa7299f48ec081845ed29a1128f2ebe32@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 2 May 2022 10:17:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VF5KJ1wc2V-MxgtJz+DVb7BFCieWoNaYVES-wbq6QwMQ@mail.gmail.com>
Message-ID: <CAD=FV=VF5KJ1wc2V-MxgtJz+DVb7BFCieWoNaYVES-wbq6QwMQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sc7180: Add kingoftown dts files
To:     "Joseph S. Barrera III" <joebar@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, Apr 30, 2022 at 1:19 AM Joseph S. Barrera III
<joebar@chromium.org> wrote:
>
> Kingoftown is a trogdor-based board. These dts files are copies from
> the downstream Chrome OS 5.4 kernel, but with downstream bits removed.

Actually for kingoftown no downstream bits were removed.


> Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/Makefile             |   2 +
>  .../dts/qcom/sc7180-trogdor-kingoftown-r0.dts |  44 ++++
>  .../dts/qcom/sc7180-trogdor-kingoftown-r1.dts |  17 ++
>  .../dts/qcom/sc7180-trogdor-kingoftown.dtsi   | 223 ++++++++++++++++++
>  4 files changed, 286 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
