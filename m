Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8B9761D0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jul 2023 17:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231933AbjGYPNY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jul 2023 11:13:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230376AbjGYPNX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jul 2023 11:13:23 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EF8B199E
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 08:13:22 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b95d5ee18dso83502201fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 08:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690298000; x=1690902800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZUa3uDyejgNax81C3rf+wIL3cUgqBQKB2P7I+aBclw=;
        b=NQOD2mWnBowq+ozvEKVBIM+8v7Qy1UbZrB+FkUXRPEsdZffMYs2hxTj/EH+lXgqiFP
         Ewz8znFmQoP+t01nNMzyyS1KAIgYVRAfV0P0DLFXNm01yyjqLz69Dao/wnGXDpFOMtEZ
         nqaw/dnNCKw+9ojsBIjvgeEL7EewJQANuHaQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690298000; x=1690902800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZUa3uDyejgNax81C3rf+wIL3cUgqBQKB2P7I+aBclw=;
        b=bWHW6C4NsLHQEz+Z/R3m/Nvza+UsM/GIFD1ZZjFuXmwxmYtw7VNxH4l2s8z2kdZDER
         2N7MWs/FFAonnjLYlxlFTgprVAJ1a7KW0+OLaYbLZjDbYd5AmEGtwM6goqUWht/ANWGN
         dpsxX039O/f79arMCwpU9WuoChNpqytJAwdQHueoQWFBNBrCVubLC7ddvAPR7Y19sl7P
         slDOsoQyO9pWav4hGEM1G1gpJGSk8JHvOmov8YTmMzqHiHOPRIdWqVowqItVq1YdxhtU
         cLw1xXEZMtvd8h2OM6uD2GQajktH9/CNNQ+h5Vn0VozOj2AdhmVjgHuZsOLcSC8OFg17
         kfMA==
X-Gm-Message-State: ABy/qLauolCXkxdneDXdZwPsWJdbHuN2vxjN6IhehG65BtrzyMvzsuNj
        +R8rNwENX888Lz9pYNEKSM1Jp0/H3lKpqkNkQZ8bKmVd
X-Google-Smtp-Source: APBJJlHCYEoUPGIw2h7dPKLXQfbdz2+IpR61XyuEsYeqzdvjVyea/4MCe6c20j6RghOHYr+NSqbHEQ==
X-Received: by 2002:a05:651c:1036:b0:2b5:7a87:a85a with SMTP id w22-20020a05651c103600b002b57a87a85amr7720678ljm.13.1690297999997;
        Tue, 25 Jul 2023 08:13:19 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id f17-20020a2ea0d1000000b002b97fe43238sm2555954ljm.19.2023.07.25.08.13.19
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 08:13:19 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4f14865fcc0so3289e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 08:13:19 -0700 (PDT)
X-Received: by 2002:a50:d55c:0:b0:51e:16c5:2004 with SMTP id
 f28-20020a50d55c000000b0051e16c52004mr113153edj.6.1690297603084; Tue, 25 Jul
 2023 08:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org> <20230627-topic-more_bindings-v1-1-6b4b6cd081e5@linaro.org>
In-Reply-To: <20230627-topic-more_bindings-v1-1-6b4b6cd081e5@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 25 Jul 2023 08:06:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WsWyTWk8W23PEgw7vXWpLDCih1kGZHkqYCNHLFOPrkGw@mail.gmail.com>
Message-ID: <CAD=FV=WsWyTWk8W23PEgw7vXWpLDCih1kGZHkqYCNHLFOPrkGw@mail.gmail.com>
Subject: Re: [PATCH 01/11] arm64: dts: qcom: sc7180: Fix DSI0_PHY reg-names
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Benjamin Li <benl@squareup.com>,
        James Willcox <jwillcox@squareup.com>,
        Joseph Gates <jgates@squareup.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Zac Crosby <zac@squareup.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Jun Nie <jun.nie@linaro.org>, Max Chen <mchen@squareup.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        alsa-devel@alsa-project.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Leo Yan <leo.yan@linaro.org>, Rob Herring <robh@kernel.org>,
        Andy Gross <andy.gross@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jun 27, 2023 at 9:24=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> Commit 2b616f86d51b ("arm64: dts: qcom: sc7180: rename labels for DSI
> nodes") broke reg-names, possibly with search-and-replace. Fix it.
>
> Fixes: 2b616f86d51b ("arm64: dts: qcom: sc7180: rename labels for DSI nod=
es")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/q=
com/sc7180.dtsi
> index 34eff97f8630..b9640574e73b 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -3120,8 +3120,8 @@ mdss_dsi0_phy: phy@ae94400 {
>                                 reg =3D <0 0x0ae94400 0 0x200>,
>                                       <0 0x0ae94600 0 0x280>,
>                                       <0 0x0ae94a00 0 0x1e0>;
> -                               reg-names =3D "dsi0_phy",
> -                                           "dsi0_phy_lane",
> +                               reg-names =3D "dsi_phy",
> +                                           "dsi_phy_lane",

I noticed that this patch got applied [1], but I think it got put into
a branch targeting 6.6 instead of 6.5. Specifically I see it in
"arm64-for-6.6" but not "arm64-fixes-for-6.5". Any chance it could be
landed in a "Fixes" tree and get sent out sooner rather than later?
v6.5 will be pretty broken without it and it would be nice to see it
in Linus's tree sooner rather than later.

[1] https://lore.kernel.org/r/168896565982.1376307.13166434967387866925.b4-=
ty@kernel.org

Thanks!

-Doug
