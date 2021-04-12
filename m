Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2305535D0D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Apr 2021 21:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245168AbhDLTIS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Apr 2021 15:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245157AbhDLTIR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Apr 2021 15:08:17 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E7E6C061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Apr 2021 12:07:58 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id k23-20020a17090a5917b02901043e35ad4aso9381514pji.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Apr 2021 12:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=CebE5qyQpll4V79rPwWriZ7YR0CHEOZQO7SaD3bm2sE=;
        b=Arpet9dZM9/Q0PmiTS8YtsDgk/dCwiFFl6zlJQobHz8P0+4tgNY7Dp/6AHSo18wXfd
         +mCZzdnAMkpfcRLgMJ7gWNsqlvFgqrUCDdNUOOqr1f/g7x74KsOcl6X+egMniSd+qVHB
         F6kt1/A3UCxSeMVx3raNkY2PixEtK0qO/vk/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=CebE5qyQpll4V79rPwWriZ7YR0CHEOZQO7SaD3bm2sE=;
        b=jQLGPRUwS4UqqQeqNYKH/DZPYwzlqx1ei5xpI/e6xkUauZqehXF0oGxRJILjPy+If0
         4S7niZ0uQGIbArmiRDEuT7BltT8ZbjIza4TAV4mMmQiXpLFZYn6o7+DQcccat6RcQfCW
         zoZ0rM9Af6nZaU9UXF1W+tUwkj5E12995lhZKZszyKZtHj6n+5t2dM1b04FY7iAgj6NS
         6+5p1nGguuqcIyZNz4exg7V7QFpXhnIvkAfEfS/i9Udk1V02k5q5cSYNUZVp0ebyUviJ
         PbOQ9lrj3TJo3e+yfzoTakzGBb6Nwk/kRgcIstDaMGKF7V3XhepBGbOPydagCeKwWTqu
         VZQA==
X-Gm-Message-State: AOAM532qKkqC95urwjtRtr1cQyxm/tzu+eMyCkhvwHqOsZelJZN/L8la
        M8iZ45KNLTqIskctXmECUTufIQ==
X-Google-Smtp-Source: ABdhPJziE71JAVTa1fIPDlkylfiLGrPI5e3Gar3JlZm6Rfwqz8Rg4/xf8FER0LY/+EHp2/qDeILfQQ==
X-Received: by 2002:a17:90b:3613:: with SMTP id ml19mr716305pjb.38.1618254478085;
        Mon, 12 Apr 2021 12:07:58 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:1d18:a339:7993:e548])
        by smtp.gmail.com with ESMTPSA id f187sm10437595pfa.104.2021.04.12.12.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 12:07:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b955dcbb-48b6-f236-ccbd-bc7d0de1df60@codeaurora.org>
References: <20210406163330.11996-1-srivasam@codeaurora.org> <161798766423.3790633.3895809656191757415@swboyd.mtv.corp.google.com> <b955dcbb-48b6-f236-ccbd-bc7d0de1df60@codeaurora.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: Update iommu property for simultaneous playback
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, dianders@chromium.org,
        judyhsiao@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org
Date:   Mon, 12 Apr 2021 12:07:56 -0700
Message-ID: <161825447608.3764895.10280020916196054814@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2021-04-09 22:17:07)
> Hi Stephen.
>=20
> Thanks for your time!!!
>=20
>=20
> On 4/9/2021 10:31 PM, Stephen Boyd wrote:
> > Quoting Srinivasa Rao Mandadapu (2021-04-06 09:33:30)
> >> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> >>
> >> Update iommu property in lpass cpu node for supporting
> >> simultaneous playback on headset and speaker.
> >>
> >> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> >> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> >> ---
> >> Changes since v1:
> >>     -- Commit messge header change
> >>
> >>   arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dt=
s/qcom/sc7180.dtsi
> >> index a6da78d31fdd..6228ba2d8513 100644
> >> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> >> @@ -3566,7 +3566,8 @@ lpass_cpu: lpass@62f00000 {
> >>                          reg =3D <0 0x62f00000 0 0x29000>;
> >>                          reg-names =3D "lpass-lpaif";
> >>  =20
> >> -                       iommus =3D <&apps_smmu 0x1020 0>;
> >> +                       iommus =3D <&apps_smmu 0x1020 0>,
> >> +                               <&apps_smmu 0x1021 0>;
> > The stream ID 0x1032 was also dropped in this version but there's no
> > mention of that in the changelog. Why?
> That is ID is for HDMI Stream, so as part of DP patches that will be adde=
d.

Ok, got it.
