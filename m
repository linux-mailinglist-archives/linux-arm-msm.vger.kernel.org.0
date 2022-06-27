Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3450455DBC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235692AbiF0OAU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 10:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236330AbiF0OAP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 10:00:15 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C222FBF4A
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 07:00:10 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id p13so6110748ilq.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 07:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4CI2gKPn+n2fDcgFRqBz8cXn2h29L1c+hQX/TyD+r20=;
        b=jteZlLGNTXsQBPp78Rb1uBIQkU60XD5rgTNmv0BDc4hkbCvDkyR838Pmx4FL+maIAu
         7mKyLaD3bvwGLGL3BTk5a0sIwR2szqQ+qBrv61sSceDBsvtbA3Jf9SZ9gK3G2ZZdQXN5
         kjJKybFBRDUM5zuAAmzoB07gZg3IMnw4+EyrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4CI2gKPn+n2fDcgFRqBz8cXn2h29L1c+hQX/TyD+r20=;
        b=iUP58H7urAJ2NXnuqeljmH68hPLGccjipeWfqWosUdiIdewlrK06xn54yUaYD3osSZ
         TKoh/5Y/ZQAz8Zq8I5wAK5C45izvvrVmB7YqoaVkL8SJBsJiUxo36g1zYTcBxhRLmYQl
         fPMN2FjJCg07E0xoWvyomRH4T6+F5/B+1udY3U4rJsoIRvw+lbbtOVwk6Q9EKpLePxxw
         INNBeRZoQ3FoHIe7KesRJNxphN17rJHvx4j78QHaGuJvVfemYXb5Souv3F34I93TclK0
         RoxyOybApqJMKoJxmeKdGVtm4jjcuenG/MsZ3cS1j/QtG6zjH9BlWs5Ua0fnA4f8TE2K
         AIhA==
X-Gm-Message-State: AJIora9YV8jp+gyo1eTyhM7VRvZUDHq618psiV3reto/2nQH+XkZFLwO
        h37bCopwIdP8iq74tNynzsZRf46EC6pDc7EG
X-Google-Smtp-Source: AGRyM1sno4YUUdtwjTAaMmbKSjI/OLVKrVZq+csrMOjv68VvIB+8KyOU4OlZBJi4PZeh+aAzySGUvA==
X-Received: by 2002:a05:6e02:5a4:b0:2d9:e062:2d8c with SMTP id k4-20020a056e0205a400b002d9e0622d8cmr7314504ils.306.1656338409934;
        Mon, 27 Jun 2022 07:00:09 -0700 (PDT)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id n6-20020a92d9c6000000b002da835550fbsm2311640ilq.33.2022.06.27.07.00.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 07:00:09 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id p128so9657935iof.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 07:00:08 -0700 (PDT)
X-Received: by 2002:a02:cf17:0:b0:33c:976c:ef8f with SMTP id
 q23-20020a02cf17000000b0033c976cef8fmr3622193jar.164.1656338408046; Mon, 27
 Jun 2022 07:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220626013906.885523-1-joebar@chromium.org> <20220625183538.v14.3.I71176ebf7e5aebddb211f00e805b32c08376d1be@changeid>
In-Reply-To: <20220625183538.v14.3.I71176ebf7e5aebddb211f00e805b32c08376d1be@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 27 Jun 2022 06:59:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wq4w=AKYCEy71uYFysHD7F+go5oWBuBs0NwBvtahgpRA@mail.gmail.com>
Message-ID: <CAD=FV=Wq4w=AKYCEy71uYFysHD7F+go5oWBuBs0NwBvtahgpRA@mail.gmail.com>
Subject: Re: [PATCH v14 3/5] arm64: dts: qcom: sc7180: Add mrbland dts files
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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
> Mrbland is a trogdor-based board. These dts files are copies from
> the downstream Chrome OS 5.4 kernel, but with downstream bits removed.
>
> Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>
> ---
>
> (no changes since v7)
>
> Changes in v7:
> - Restore mrbland patch.
> - Only include sc7180.dtsi in sc7180-trogdor.dtsi (19794489fa24).
> - Simplify spi0/spi6 labeling (d277cab7afc7).
> - Simplify trackpad enabling (51d30402be75).
>
> Changes in v6:
> - Remove mrbland patch.
>
> Changes in v5:
> - Replace _ in node name with -
> - Order nodes by name.
> - Add comment that compatible will be filled in per-board.
>
> Changes in v4:
> - Add missing version history
>
> Changes in v2:
> - Add word wrapping to patch description.
> - Remove "Author" from patch description.
> - Fix whitespace around "en_pp3300_dx_edp".
>
>  arch/arm64/boot/dts/qcom/Makefile             |   4 +
>  .../qcom/sc7180-trogdor-mrbland-rev0-auo.dts  |  22 ++
>  .../qcom/sc7180-trogdor-mrbland-rev0-boe.dts  |  22 ++
>  .../dts/qcom/sc7180-trogdor-mrbland-rev0.dtsi |  53 +++
>  .../qcom/sc7180-trogdor-mrbland-rev1-auo.dts  |  22 ++
>  .../qcom/sc7180-trogdor-mrbland-rev1-boe.dts  |  24 ++
>  .../boot/dts/qcom/sc7180-trogdor-mrbland.dtsi | 344 ++++++++++++++++++
>  7 files changed, 491 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland.dtsi

Reviewed-by: Douglas Anderson <dianders@chromium.org>
