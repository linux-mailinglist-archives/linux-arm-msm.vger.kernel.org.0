Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB43550144
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jun 2022 02:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231921AbiFRARC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 20:17:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234451AbiFRARB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 20:17:01 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 673273BA74
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 17:16:59 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id m16so2457137ilf.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 17:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tNaquVGK4MANQcU7YIAYS6nMk49CnRDX81BKkL8HJ+o=;
        b=gfNJLvjT3OOqpTcyZcgjOAX1w1VjWNeZFeqIjJURUXH4jzfd9QnB47rg3YffaSILKZ
         KYEMIcEE99bqsM/xZcho680yrlpU1NtjSb0WnW8HLbfwI3ksgEPlw+W9U5ClbVDp0sNN
         PbQROK4lmPrdpupDhTTFhBWfIGg9u91NI9y1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tNaquVGK4MANQcU7YIAYS6nMk49CnRDX81BKkL8HJ+o=;
        b=j6McoTo8ujnY6YcKJYVtLFu/41lUUfS4CcjPple70LFSH6pdBJ8jt8ggnMIG8BiDtx
         fO3nFcCUreLqy4LgJ0Id+bWsL010gZkgne9Iim3yzDFnGr9ItC+Tgns4pf2KIBWZa0U1
         EMY+NvrO9vbe2A/Bk6+f5o2ZgpPl0eNdH0YiPQzZVGXRmBgPh0SxON8AeVshIwpDfDpi
         1UO1hkWUfS++0N2UkhgzD5qX8nOPU3jBpjbD9cL2M3dBrsJQY2HBLJhAXeEzdfyKgoZE
         r3eJHN9t/oky9dJNX5vPlPe/YhjqVWpdWF5b+S/aOeCqbsYIc6XM7aVxLITOc6zTBsR6
         8I7A==
X-Gm-Message-State: AJIora8hAui0Pivhjok1BbY0+vuR4l8BX28Mxi+mvGIRviF7BnNCFpN/
        JR2i3yrjG+25zMSA+G35kEugxkHastCn7ts50OQ=
X-Google-Smtp-Source: AGRyM1u7wH7ewyNBV1WU8sMIgzCBgYt2gqMyLVL3UcZ/hsRiqPk3cGxNiFg4Ty7yXaqem5rlFPDM7Q==
X-Received: by 2002:a05:6e02:144f:b0:2d1:90c9:9047 with SMTP id p15-20020a056e02144f00b002d190c99047mr7358426ilo.211.1655511418694;
        Fri, 17 Jun 2022 17:16:58 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com. [209.85.166.54])
        by smtp.gmail.com with ESMTPSA id c4-20020a6bcc04000000b006696754eef5sm3143933iog.13.2022.06.17.17.16.58
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 17:16:58 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id p128so6061852iof.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 17:16:58 -0700 (PDT)
X-Received: by 2002:a02:8665:0:b0:335:e259:e54d with SMTP id
 e92-20020a028665000000b00335e259e54dmr4122258jai.184.1655511417885; Fri, 17
 Jun 2022 17:16:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220617164000.v8.1.Id769ddc5dbf570ccb511db96da59f97d08f75a9c@changeid>
 <20220617164000.v8.5.Ib62291487a664a65066d18a3e83c5428a6d2cc6c@changeid>
In-Reply-To: <20220617164000.v8.5.Ib62291487a664a65066d18a3e83c5428a6d2cc6c@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 17 Jun 2022 17:16:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VxO2a0kTXRc29GRpnDsDRqxttnfoTmRN=rttG3+Xn00Q@mail.gmail.com>
Message-ID: <CAD=FV=VxO2a0kTXRc29GRpnDsDRqxttnfoTmRN=rttG3+Xn00Q@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] arm64: dts: qcom: sc7180: Add kingoftown dts files
To:     "Joseph S. Barrera III" <joebar@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jun 17, 2022 at 4:40 PM Joseph S. Barrera III
<joebar@chromium.org> wrote:
>
> Kingoftown is a trogdor-based board. These dts files are unchanged copies
> from the downstream Chrome OS 5.4 kernel.
>
> Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> (no changes since v7)
>
> Changes in v7:
> - Incorporated changes from Stephen's "Simplify!" series.
>
> Changes in v4:
> - Fixed description (no downstream bits removed).
> - Added missing version history.
>
> Changes in v2:
> - First inclusion in series.
>
>  arch/arm64/boot/dts/qcom/Makefile             |   2 +
>  .../dts/qcom/sc7180-trogdor-kingoftown-r0.dts |  44 ++++
>  .../dts/qcom/sc7180-trogdor-kingoftown-r1.dts |  17 ++
>  .../dts/qcom/sc7180-trogdor-kingoftown.dtsi   | 220 ++++++++++++++++++
>  4 files changed, 283 insertions(+)

I'm not doing a detailed review, but many of the same comments from
the pazquel review apply here as well.

-Doug
