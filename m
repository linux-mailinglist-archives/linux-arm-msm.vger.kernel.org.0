Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4CA755E2A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235346AbiF0OAR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 10:00:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236342AbiF0OAK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 10:00:10 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DC60BE0A
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 07:00:04 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id i194so9584468ioa.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 07:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UAGsVNxzk8vNVq19Sa60bi66Tur02wHflrMgGeyRF+s=;
        b=CQWg2HiBV3Oqv2N5JkIFVX6uhued3VniNsN/6MZnprAs0w0befTTVXJdYdXld6Xccc
         rQqhPIeHYBAO/y9KxoFV4oc6o+VDqNiKqgjbnjH1e1IjUR37VeMWP0muj3YzV12B8BVw
         B3QxynUfGs/RXAH7r/660sm6WiDOf2KZ7Nw+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UAGsVNxzk8vNVq19Sa60bi66Tur02wHflrMgGeyRF+s=;
        b=yJ9Def4/DB6udTQlF8VDncDUM0fYwbOh6eMzXKVTDKcnxAm9bh61q3IE2AvZlC6wv9
         bOISIahMteJVmf8QZzR5piqbxP6eonWVVzxBeiwUMibhxsv4DpuMg/O7KFKo3HxdrkNB
         0ZOu1Y4aewUvDxA/TKg62ce13sLCDbcZYDxBNH6uz/pu6W/1ZNCDiZp54ujbN399aEdk
         0bZyDTTSSCyG5CqjFE93xbFvHf/sMPCoICd7i2xC49t1vt6Bo05+7MuqLCs2gorp2e9O
         9CEa+k9pGJlmyTQWa0zQH96ZLYtWjkQ52wgXe+oKDAZpEpY7VPttNVsU+HCy9mCgx50o
         hwug==
X-Gm-Message-State: AJIora8bRem0FiOELEwtg4h9lf9t3izB7wAbdqRz6kC341xmnb/mM/Fl
        aL69QLodLnhLrhLuLy2zP3dIBW8qnjs9NnfY
X-Google-Smtp-Source: AGRyM1sVhcsE+Z/325S9Wmt8bsOfL9mMHTvPs/YptpKvGaS/vewwajSpsqNKZrwLuq+T0654vYOkKw==
X-Received: by 2002:a5d:9919:0:b0:675:48c7:d959 with SMTP id x25-20020a5d9919000000b0067548c7d959mr1465425iol.27.1656338403671;
        Mon, 27 Jun 2022 07:00:03 -0700 (PDT)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com. [209.85.166.170])
        by smtp.gmail.com with ESMTPSA id i6-20020a056e020d8600b002d90ac862b6sm4600514ilj.55.2022.06.27.07.00.03
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 07:00:03 -0700 (PDT)
Received: by mail-il1-f170.google.com with SMTP id i17so6051423ils.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 07:00:03 -0700 (PDT)
X-Received: by 2002:a05:6e02:1a6b:b0:2d3:ae9f:112f with SMTP id
 w11-20020a056e021a6b00b002d3ae9f112fmr7618358ilv.187.1656338402699; Mon, 27
 Jun 2022 07:00:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220626013906.885523-1-joebar@chromium.org> <20220625183538.v14.2.I0977b1a08830d0caa8bfb1bdedb4ecceac709a7f@changeid>
In-Reply-To: <20220625183538.v14.2.I0977b1a08830d0caa8bfb1bdedb4ecceac709a7f@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 27 Jun 2022 06:59:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U9sQ5qFzP3jBWt7CipJuyFjvwiDjybwrMS+j6orDrcjg@mail.gmail.com>
Message-ID: <CAD=FV=U9sQ5qFzP3jBWt7CipJuyFjvwiDjybwrMS+j6orDrcjg@mail.gmail.com>
Subject: Re: [PATCH v14 2/5] arm64: dts: qcom: sc7180: Add quackingstick dts files
To:     "Joseph S. Barrera III" <joebar@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, Jun 25, 2022 at 6:40 PM Joseph S. Barrera III
<joebar@chromium.org> wrote:
>
> Quackingstick is a trogdor-based board. These dts files are copies from
> the downstream Chrome OS 5.4 kernel, but with downstream bits removed.
>
> Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>
>
> ---
>
> (no changes since v8)
>
> Changes in v8:
> - Incorporate the deletion of the usb_c1 node from 9f9fb70a7294.
>
> Changes in v7:
> - Restore changes requested by Doug.
> - Only include sc7180.dtsi in sc7180-trogdor.dtsi (19794489fa24).
> - Simplify spi0/spi6 labeling (d277cab7afc7).
> - Simplify trackpad enabling (51d30402be75).
>
> Changes in v6:
> - Accidentally deleted changes requested by Doug.
>
> Changes in v5:
> - Remove extra newline
> - Add comment that compatible will be filled in per-board
>
> Changes in v4:
> - Add missing version history
>
> Changes in v3:
> - First inclusion in this series
>
>  arch/arm64/boot/dts/qcom/Makefile             |   2 +
>  .../sc7180-trogdor-quackingstick-r0-lte.dts   |  38 +++
>  .../qcom/sc7180-trogdor-quackingstick-r0.dts  |  26 ++
>  .../qcom/sc7180-trogdor-quackingstick.dtsi    | 318 ++++++++++++++++++
>  4 files changed, 384 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi

Reviewed-by: Douglas Anderson <dianders@chromium.org>
