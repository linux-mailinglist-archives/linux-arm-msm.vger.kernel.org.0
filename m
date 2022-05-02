Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 202225175A0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 19:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386609AbiEBRVX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 13:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386636AbiEBRVV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 13:21:21 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D05B7F7
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 10:17:50 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id z99so17349071ede.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 10:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5e/P3oCGEzzkwU7JvpMT6jdvjjKGHwDIEd56ZHarYG8=;
        b=LRJmQXlGVU2DXOpRaxkWINyGq8im14P66sIAc+s5stQ6gWHu3ieT0hyw9ypui62TL/
         0HCNbJb78UhLPPcP7Ys6YMx+plMmvVyOV+dmgS4Xq9ldBPtLIhKx9EA+OME3u5GsimO6
         VrZS8x+d3mWw1OZ1V0rFOEn2qc5IdDiE1Xsxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5e/P3oCGEzzkwU7JvpMT6jdvjjKGHwDIEd56ZHarYG8=;
        b=wRK8m7cJgTlLIxrs6Ssw4VCZT3O2KJYWM7dKdWn7SE/CLrdJgCQx/SVDPA4bpOxJg1
         /xTAfUB9TZZAERJ1GxxbNDN5fTkAqSIhexPofj+Dcp7dNWQ68Z4SWbANAn3zP1QXd9q5
         C5RnPTDeUyAanQMipJ/11u4yH1liy2E9sVeIaFLfRECpZdAEyfJf5s/iw455rPw6iArc
         lxwshwpdjY2315cI483WGQxE5C3snknegY63AsG3Gel1Oj4L53anfL1XAeOt1fzD0ifb
         SxM/Cs6tVjS55tFycuwiCKvQchOkr4vaks40QKM1eERCLsumBi3cwvcou4pLNVZFjeQc
         yk8w==
X-Gm-Message-State: AOAM5321E78ow+zdKE3udIZJ1jFxRfmRXcbDOFC41P1DiUozdtE5Mt/k
        eZyOMPAAm90tOOush8xQQddOZHGo3q5HBg3x
X-Google-Smtp-Source: ABdhPJyXMU0ml3jpNXIMPiHum0qdvcbYO5fsXr0F30hARDEcA+Ix2MFGdYbmowucLmXYtrj58blBgw==
X-Received: by 2002:a05:6402:5107:b0:427:ded9:9234 with SMTP id m7-20020a056402510700b00427ded99234mr705952edd.275.1651511868463;
        Mon, 02 May 2022 10:17:48 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id mm29-20020a170906cc5d00b006f3ef214e0fsm3780556ejb.117.2022.05.02.10.17.47
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 10:17:47 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id q23so20388972wra.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 10:17:47 -0700 (PDT)
X-Received: by 2002:adf:f50d:0:b0:20a:e096:ef with SMTP id q13-20020adff50d000000b0020ae09600efmr10002004wro.679.1651511867348;
 Mon, 02 May 2022 10:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220430011402.1.If7c3471db53bea55213f7bcf17e9043084d3ac0c@changeid>
 <20220430011402.4.Ifba00241fe6e70b59dc3c07eb234da3146e11a03@changeid>
In-Reply-To: <20220430011402.4.Ifba00241fe6e70b59dc3c07eb234da3146e11a03@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 2 May 2022 10:17:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XxPimB8uyboWtUcuCJW3NkVB-nKzaw=dE9xqCtpNj2rg@mail.gmail.com>
Message-ID: <CAD=FV=XxPimB8uyboWtUcuCJW3NkVB-nKzaw=dE9xqCtpNj2rg@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sc7180: Add pazquel dts files
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
> Pazquel is a trogdor-based board. These dts files are copies from
> the downstream Chrome OS 5.4 kernel, but with downstream bits removed.

Actually, in pazquel's case no downstream bits are removed.


> Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/Makefile             |   4 +
>  .../sc7180-trogdor-pazquel-lte-parade.dts     |  22 ++
>  .../qcom/sc7180-trogdor-pazquel-lte-ti.dts    |  22 ++
>  .../qcom/sc7180-trogdor-pazquel-parade.dts    |  17 ++
>  .../dts/qcom/sc7180-trogdor-pazquel-ti.dts    |  17 ++
>  .../boot/dts/qcom/sc7180-trogdor-pazquel.dtsi | 221 ++++++++++++++++++
>  6 files changed, 303 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
