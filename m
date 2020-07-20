Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE4E226F9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 22:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731080AbgGTUWT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 16:22:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730125AbgGTUWS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 16:22:18 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34542C0619D4
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 13:22:18 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id u185so9624514pfu.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 13:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=e/gkrMJkoJ8Gzkw35N54O/4TXm7cpCXE+s3Q+cJcAMo=;
        b=Vr+VO3GgxxJ3XgaUuzjU4jdFPwjbDokN5xrQeUMMfXgwRdTHCHwZTAE2ILc0ue7Ehw
         OgdTqABI7e9qsXUmL+ec3X+iVH3WCreGZ7gGHKH6n8INCwXUMyApeXLPOCjeRnTZTOop
         HQGjVM7mK3DZGLq21/GtNQ9dCCIGDao7lO20o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=e/gkrMJkoJ8Gzkw35N54O/4TXm7cpCXE+s3Q+cJcAMo=;
        b=sa9sr9znrn/m1RYt0/zI/w3IqGgb44UvdrznN0BZ39Hqc+efbm+h9DozGGhmy+Qb4s
         ZA+bA0a0ctjNvkVQEyEAumT2t/tdvdM8e5/k6s5fPviHqdqWN+U9RNdFAIzgXWEGZT9u
         F4SxYbIajYAk35ZqL4Eb7QGwevgHxpRTRT98mGQfNiAZwUf0HyUhN5vIvetyXWrtP+Jb
         A1xQJUkcGdByUnBB0ORCbbQWg2OhtvxUm9PRiX2iYX8ENVjvXul+wZPIJEAOe0PAOYUk
         BQYTUh6d9Ncm/lTOSf/Gq+62XH/T9kCnVZd4iYL5zdkYl3bHqPtg7p6ufsI1BUSbIm+4
         H4rQ==
X-Gm-Message-State: AOAM530iYwXCaGxZNbR1jz+Zw+LTk//nmeTWCnDS5jJpzvjwvG7M2/nj
        O97R4J/4hEndbhL5NgsHRmPhmg==
X-Google-Smtp-Source: ABdhPJwY5+t3cAgBV19SyR9ntol+iXjbmlVfcj+4ZwcCHf/TU9rAdzloIULARI11bkIVcdpT1Twh2g==
X-Received: by 2002:a62:3582:: with SMTP id c124mr21220132pfa.288.1595276537552;
        Mon, 20 Jul 2020 13:22:17 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id h18sm17980753pfr.186.2020.07.20.13.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 13:22:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200630195151.347-1-tanmay@codeaurora.org>
References: <20200630195151.347-1-tanmay@codeaurora.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7180: Add Display Port dt node
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        sam@ravnborg.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, aravindh@codeaurora.org,
        abhinavk@codeaurora.org, chandanu@codeaurora.org,
        varar@codeaurora.org, Tanmay Shah <tanmay@codeaurora.org>
To:     Tanmay Shah <tanmay@codeaurora.org>, seanpaul@chromium.org
Date:   Mon, 20 Jul 2020 13:22:16 -0700
Message-ID: <159527653610.1987609.18177358790741857860@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Tanmay Shah (2020-06-30 12:51:51)
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/q=
com/sc7180.dtsi
> index 31b9217bb5bf..271d55db62ab 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2440,6 +2447,44 @@ dsi_phy: dsi-phy@ae94400 {
> =20
>                                 status =3D "disabled";
>                         };
> +
> +                       msm_dp: displayport-controller@ae90000{
> +                               status =3D "disabled";
> +                               compatible =3D "qcom,sc7180-dp";
> +
> +                               reg =3D <0 0xae90000 0 0x1400>;

Please use full 8 digits in address, i.e. 0x0ae90000.

> +                               reg-names =3D "dp_controller";

reg-names is pretty useless here. Please remove it.

> +
> +                               interrupt-parent =3D <&mdss>;
> +                               interrupts =3D <12 0>;

Please use irq flags instead of 0.

> +
> +                               clocks =3D <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_DP_AUX_CLK=
>,
> +                                        <&dispcc DISP_CC_MDSS_DP_LINK_CL=
K>,
> +                                        <&dispcc DISP_CC_MDSS_DP_LINK_IN=
TF_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_DP_PIXEL_C=
LK>;
> +                               clock-names =3D "core_iface", "core_aux",=
 "ctrl_link",
> +                                             "ctrl_link_iface", "stream_=
pixel";
> +                               #clock-cells =3D <1>;
> +                               assigned-clocks =3D <&dispcc DISP_CC_MDSS=
_DP_PIXEL_CLK_SRC>;
> +                               assigned-clock-parents =3D <&msm_dp 1>;

Why don't we assign both clk parents here (&msm_dp 0) so that we don't
need any clk_set_parent() calls in the code?

> +
> +                               ports {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                                       port@0 {
> +                                               reg =3D <0>;
> +                                               dp_in: endpoint {
> +                                                       remote-endpoint =
=3D <&dpu_intf0_out>;
> +                                               };
> +                                       };
> +
> +                                       port@1 {
> +                                               reg =3D <1>;
> +                                               dp_out: endpoint { };
> +                                       };
> +                               };
> +                       };
>                 };
> =20
>                 dispcc: clock-controller@af00000 {
