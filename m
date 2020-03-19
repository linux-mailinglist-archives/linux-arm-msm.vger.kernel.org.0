Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB3818BEB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2020 18:48:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728364AbgCSRsN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Mar 2020 13:48:13 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36503 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728345AbgCSRsN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Mar 2020 13:48:13 -0400
Received: by mail-pf1-f193.google.com with SMTP id i13so1819607pfe.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2020 10:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=iWUSd6tNelA3B2gV8L14dd3S0Goj3iWlFgAqgwk5kPw=;
        b=T5wSGnt2PrWmaej5pxTQjA5iZ75Iq5B8ryc8SsC0GZUqDnlwetsWMpCtffoLmhaty7
         MEpRGQOi8ly0/vnWHX7gn8Je3y5VDnIUpNcgALh6uSrWPV9q0Ly1fiQ5RC4Xi02iZE6W
         JyMt029uRbZPrTBbpHeGtn40yI63DT1zUUIhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=iWUSd6tNelA3B2gV8L14dd3S0Goj3iWlFgAqgwk5kPw=;
        b=fkiddccm5UHSHksZWf7kjSl9D3f212ubCM6ANTPsURyHFhOAJMcyKoqrxZ1lRa6HNl
         egF6LbPX5YU/+F0uFmr2Dm+hz088XpFEBUnUhjdcRR2LT2DWbRqzF9pZXRZIHY6wQkyh
         7X+gjm1qsufi5Ed5OZ4E77FOl7iA0VF6df3o9LUvlyJ8RDtRjQcBPKX6uXVv0sB6Dmmr
         jdC9M6B5Gs+l6ehVfb4TEC5khjl08AlsEH7v00m0dSnN06r3F2bFKWr837l0ZWqR7Are
         gCDXdoL+ygqatr3vPOuhCjAMBFvjl2VRUOr+vNTD9gv7/bwFlDmn3HbtYKOxeD7V2Hub
         sXxQ==
X-Gm-Message-State: ANhLgQ3to5N35G4gQQbjKL11ipulERG+aMYurgsbMnsGpbNkD6dVPqId
        A8du9XZV7Gzn2cFXRtfeHfyqEQ==
X-Google-Smtp-Source: ADFU+vut6Lso223EbxYK+y4BZyU7C3AfV3mD375ioWsMfGKfgEhQlPlHMn0XJNEJoyfTIpfVnP8PYA==
X-Received: by 2002:a63:c811:: with SMTP id z17mr4386751pgg.41.1584640092091;
        Thu, 19 Mar 2020 10:48:12 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id h11sm2990799pfq.56.2020.03.19.10.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 10:48:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1584356562-13181-1-git-send-email-mkrishn@codeaurora.org>
References: <1584356562-13181-1-git-send-email-mkrishn@codeaurora.org>
Subject: Re: [v2] arm64: dts: sc7180: modify assigned clocks for sc7180 target
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, nganji@codeaurora.org
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Date:   Thu, 19 Mar 2020 10:48:10 -0700
Message-ID: <158464009041.152100.18425074316530931981@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Subject could be "sc7180: update DPU assigned clocks"

Quoting Krishna Manikandan (2020-03-16 04:02:42)
> Add DISP_CC_MDSS_ROT_CLK and DISP_CC_MDSS_AHB_CLK
> in the assigned clocks list for sc7180 target.

Why?

>=20
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>

Does this need a Fixes: tag?

> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/q=
com/sc7180.dtsi
> index 998f101..e3b60f1 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1544,8 +1544,12 @@
>                                 clock-names =3D "iface", "rot", "lut", "c=
ore",
>                                               "vsync";
>                                 assigned-clocks =3D <&dispcc DISP_CC_MDSS=
_MDP_CLK>,
> -                                                 <&dispcc DISP_CC_MDSS_V=
SYNC_CLK>;
> +                                                 <&dispcc DISP_CC_MDSS_V=
SYNC_CLK>,
> +                                                 <&dispcc DISP_CC_MDSS_R=
OT_CLK>,
> +                                                 <&dispcc DISP_CC_MDSS_A=
HB_CLK>;
>                                 assigned-clock-rates =3D <300000000>,
> +                                                      <19200000>,
> +                                                      <19200000>,
>                                                        <19200000>;
> =20
>                                 interrupt-parent =3D <&mdss>;
