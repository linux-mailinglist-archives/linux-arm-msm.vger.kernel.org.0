Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED6BE4F86FB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Apr 2022 20:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233600AbiDGSSQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Apr 2022 14:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233115AbiDGSSL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Apr 2022 14:18:11 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DACEE22FD95
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Apr 2022 11:16:10 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id v75so6501449oie.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Apr 2022 11:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=XVxlM+817FJT8H5/eqfV4sWLJEZR2m3rmCdfP3oay/E=;
        b=PEWjTExje4yOFoYkMCrvWFzabQQ92bC6+VE85If+xFzo5BTgyvE3rOzNo9S/7ZQwzw
         UMa/sVntgHsH3hl/uMMswllsEbJKO1EuMWWP3ocVij7fnewQ4j7+pMCW9CYl9ByGBSy8
         gE2RqOly+Ze/uPNpVkb/CV4pVHjFGH5H5M2JE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=XVxlM+817FJT8H5/eqfV4sWLJEZR2m3rmCdfP3oay/E=;
        b=GvUuxZu5Qqv9xzYEYYm8IryswZQOHAhcndFs0LIE+nBeEZljYRAKJllV9P4dbmPBNJ
         YL0psJZJxySlxB9ZbeZNrQ8UDsuKH2o8m3uYMgH1amf6WUfoaiDyCNjdYHfySvxZ43Cc
         qTbp3/7u5+5lw043smnnmFYCe0s9ZbqJrGCi8biy3zQhaKc6uFvOgmHgawkDkvAhYbpO
         +xfGq7osuv9a89sUwDbgrvQkIkQVVWO1T6SrU/3eR3GebMgkelr8s1s83p7kNqotaBla
         h83cZoLKHFHgZYUulRIT+roVVWQz/0+DhvnmeOj36rRgspE4/8leC2dZcWw++BunwROU
         wMoQ==
X-Gm-Message-State: AOAM532uSSgvbHTOfhc7bFT+two9qpoSwG2kWCToSukK+aLdB52WddM9
        YONYWmnouv9jCYzbAgiMZoujXNNpnUhPQ7XwIS51XQ==
X-Google-Smtp-Source: ABdhPJwuAuhdX0hEySqeCo3+X9rbYlLqdOPDPqFH6dFaZe2W7uWs32pWCAifwoqvygyfqx9dlJdbFUtM5ngGNZ/aFdc=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr6042316oie.193.1649355370278; Thu, 07
 Apr 2022 11:16:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Apr 2022 11:16:09 -0700
MIME-Version: 1.0
In-Reply-To: <5c87d5d9-66d0-41d9-4adb-53b3ec7cadeb@quicinc.com>
References: <20220406111101.27412-1-quic_mpubbise@quicinc.com>
 <CAE-0n51vq_V85SKh+hN1Ueas9t1dV7ZFaFyQsG9vukRBAHUc5A@mail.gmail.com> <5c87d5d9-66d0-41d9-4adb-53b3ec7cadeb@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 7 Apr 2022 11:16:09 -0700
Message-ID: <CAE-0n51PheX1poksttyYVEOVe2amWbWwZSQMwguTUxajSHm6bQ@mail.gmail.com>
Subject: Re: [PATCH v11] arm64: dts: qcom: sc7280: Add WPSS remoteproc node
To:     Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
        agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_sibis@quicinc.com,
        kuabhs@chromium.org, quic_pillair@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Manikanta Pubbisetty (2022-04-06 23:11:50)
>
>
> On 4/6/2022 8:47 PM, Stephen Boyd wrote:
> > Quoting Manikanta Pubbisetty (2022-04-06 04:11:01)
> >> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> >> index ecbf2b89d896..f61a3e15fa8b 100644
> >> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> >> @@ -547,3 +547,6 @@ sw_ctrl: sw-ctrl {
> >>          };
> >>   };
> >>
> >> +&remoteproc_wpss {
> >> +       status = "okay";
> >> +};
> >
> > This should be before the PINCTRL section in this file. I believe after
> > the uart node.
>
> I have not understood your concern, any specific reason as why
> remoteproc_wpss node has to be before PINCTRL section?
> There is no problem in moving, just wanted to understand the reason.
>

It's a style that this file is following. The end of the file is for
pinctrl configurations. Before that section is where soc nodes are
modified. There are different sections of the file with comments
delineating them.

Furthermore, adding things to the end of the file is a recipe for
conflicts when applying patches as a maintainer. This is another reason
why we sort the nodes. I suspect having different sections helps here so
that we don't sort everything alphabetically and have pinctrl settings
scattered throughout the file.
