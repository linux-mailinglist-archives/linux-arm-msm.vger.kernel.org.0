Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9B4C51759C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 19:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386612AbiEBRVN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 13:21:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347686AbiEBRVK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 13:21:10 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94843AE75
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 10:17:41 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id l7so29011709ejn.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 10:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U6I8l2/ksiQd63xGl5KCPWmwyj9JWjRhGv3A0r30Lxs=;
        b=eTQFfROjG1qUk1tXr04rLGRtNfHRxSVeDMHEKcSFJsWB2lR87/reU6RgOyiv7E0qxt
         fUq+C3AJS8urPlLqMtWicVO+G9N1mRO6lsGXvu7mjehiG33ekyO0H9hzZBSmG8CoJ/H/
         xlGLQpdPwl7jKLkTG4yZ/QYEk11Z1W9wmbWRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U6I8l2/ksiQd63xGl5KCPWmwyj9JWjRhGv3A0r30Lxs=;
        b=GqHfWXaiBG/wOStQbq1LZ3sEAM0HmvryM6dLLpKsQlsHRoqc8TpJrEx5zO5c6Rk5ZG
         +55bvrJ7xFsNT4m+e6BYWsBM9riI2S1Ee4dc+cqgnVnRojruMgEcFP3H3fjDzX0CVpkn
         KMfpjnNG4yJX1uJJFfZKfjU98j1l3G/aHJptymOtKjtxaM3vecs8dyXVdl2BSffnHCPG
         aFeEN/f9ENkpw+AdmeqFPGmez8Mu4Qvp4kSZocomv94kdijc9lj8If+daxjlzbZm7LRP
         VV4Bcs3yNY9HK1GcA5nMPDFyCT3vKqTKR+lUvNY9VIHfG907t//05RXiAhI9DBkCr6oh
         OMGQ==
X-Gm-Message-State: AOAM532mLRh+160oZs4769X+riY8fiBWOwy/8NjdeOav/ucbrbWjIVXB
        8ef0/l8D4BTqZyY8WvJdul3h7WDfBUAf8uZQ
X-Google-Smtp-Source: ABdhPJyk3wUP/et/6/4hCQxg2pG5H0Cz8OqMLuYVa7ufT7CVESeRwfBTKekJmT+0Rfalo00BqCwcLA==
X-Received: by 2002:a17:907:7e8a:b0:6f4:487c:5e60 with SMTP id qb10-20020a1709077e8a00b006f4487c5e60mr5784209ejc.53.1651511860009;
        Mon, 02 May 2022 10:17:40 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id j12-20020aa7de8c000000b0042617ba63b2sm6910284edv.60.2022.05.02.10.17.38
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 10:17:39 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id 125-20020a1c1983000000b003941f354c62so4998837wmz.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 10:17:38 -0700 (PDT)
X-Received: by 2002:a05:600c:3c99:b0:392:b49c:7b79 with SMTP id
 bg25-20020a05600c3c9900b00392b49c7b79mr89734wmb.199.1651511858472; Mon, 02
 May 2022 10:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220430011402.1.If7c3471db53bea55213f7bcf17e9043084d3ac0c@changeid>
 <20220430011402.2.Iac7ac752b18224ab1458a7681301d9b48cab25c4@changeid>
In-Reply-To: <20220430011402.2.Iac7ac752b18224ab1458a7681301d9b48cab25c4@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 2 May 2022 10:17:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XZsUkCMjV9bBweVOPgJBUi72hDXpiMcuQfi7ZcQ4xqtw@mail.gmail.com>
Message-ID: <CAD=FV=XZsUkCMjV9bBweVOPgJBUi72hDXpiMcuQfi7ZcQ4xqtw@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sc7180: Add mrbland dts files
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

On Sat, Apr 30, 2022 at 1:18 AM Joseph S. Barrera III
<joebar@chromium.org> wrote:
>
> Mrbland is a trogdor-based board. These dts files are copies from
> the downstream Chrome OS 5.4 kernel, but with downstream bits removed.
>
> Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/Makefile             |   4 +
>  .../qcom/sc7180-trogdor-mrbland-rev0-auo.dts  |  22 ++
>  .../qcom/sc7180-trogdor-mrbland-rev0-boe.dts  |  22 ++
>  .../dts/qcom/sc7180-trogdor-mrbland-rev0.dtsi |  53 +++
>  .../qcom/sc7180-trogdor-mrbland-rev1-auo.dts  |  22 ++
>  .../qcom/sc7180-trogdor-mrbland-rev1-boe.dts  |  24 ++
>  .../boot/dts/qcom/sc7180-trogdor-mrbland.dtsi | 352 ++++++++++++++++++
>  7 files changed, 499 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
