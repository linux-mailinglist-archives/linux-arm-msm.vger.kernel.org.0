Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB9C74E7C09
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Mar 2022 01:21:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbiCYT1v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Mar 2022 15:27:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbiCYT1Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Mar 2022 15:27:24 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29FD81E6EBF
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 12:01:00 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id t11so15632347ybi.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 12:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=pf88tpS11ppiNWSTVMzPek22eA+nbbXRk6ZktmUAOeg=;
        b=cAjr+obn0D59Rm4C2G8ZencaVITkxhwDnMSiEWsaXLckF6yM3adrw5dbPRZK6u96F3
         DLI7Ulyim206iMap4rxTYPIlmK981wpxwB5MjovYFcq3gmPxfLS9TMWEA6gWyY2fACHQ
         oKC2lrqX/6pMT8INjBAGA91ynMHE7hp6ZGLUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=pf88tpS11ppiNWSTVMzPek22eA+nbbXRk6ZktmUAOeg=;
        b=Cqio/KshB3iDuXrsvu670X+yr9hEhuTl0iscu9/xENYke0sDr6S1/iMp8xd91I2Ziu
         GA9MrbuyVfYSHsdyCfZxzbNTCUS1dr4MLj1x5QwfQ0itbMm/c1uJZkZidjEBTGVQcNpT
         firflDALGA2OaAZVJedAxKFBraXvEIYcxx98hLoKq9iU8tp4k9658hEtOxsK3evACgEN
         uypYh/WaES9bDCXE6yD8jyT5GL5lrPnTedPt/YckRiq3NjnaIRE1zTss2+JcYiQvIkNS
         iR/MdTdfZ3aEzsz8mpuMYLNfR5fK6DqWWvW5UfS4TrCmRscs8a9gVB9yfnkS0JpdDMtI
         zKew==
X-Gm-Message-State: AOAM531QQAzQdGKo99WcnbrE8dSVvVwFswi9cB0DsMXjfNX5mB18innp
        gifZZGxU6lUCCZctzSADHTLuAc73muzh2VwfWLu+XyN/I78=
X-Google-Smtp-Source: ABdhPJwQ0+3fOgwXbl9kN3tNs5HjMHNRzLggFSoBe0MHfMz28g7bQQnaO+jHlXDdRMvP21RMDBa3JzcaBhwj/2Dla3I=
X-Received: by 2002:a05:6830:61b:b0:5cc:e44:7dc3 with SMTP id
 w27-20020a056830061b00b005cc0e447dc3mr4774019oti.159.1648230509494; Fri, 25
 Mar 2022 10:48:29 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Mar 2022 12:48:29 -0500
MIME-Version: 1.0
In-Reply-To: <1648209491-30165-8-git-send-email-quic_c_skakit@quicinc.com>
References: <1648209491-30165-1-git-send-email-quic_c_skakit@quicinc.com> <1648209491-30165-8-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 25 Mar 2022 12:48:29 -0500
Message-ID: <CAE-0n511eQTnJHqt0B=uiiSjigy-RHZ52YuYz4kfEpX1x6CMfw@mail.gmail.com>
Subject: Re: [PATCH V8 7/7] arm64: dts: qcom: sc7280: Add pm8008 support for sc7280-idp
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_collinsd@quicinc.com,
        quic_subbaram@quicinc.com, quic_jprakash@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2022-03-25 04:58:11)
> Add pm8008_infra and pm8008_regulators support for sc7280 idp.
>
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> ---
> Changes in V6:
>  - No changes.
>
> Changes in V7:
>  - No Changes.
>
> Changes in V8:
>  - Add an extra phandle "pm8008_bus" and then include pm8008 dtsi files inside it.
>  - Remove output-high from pm8008_active node.
>
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 70 ++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index ecbf2b8..0843e92 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -263,6 +263,67 @@
>         };
>  };
>
> +pm8008_bus: &i2c1 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;

These two properties should already be in the i2c1 node. Can you remove
them?

> +       status = "okay";
> +};
> +
> +&pm8008_bus {
> +       #include "pm8008-infra.dtsi"
> +       #include "pm8008-regulators.dtsi"
> +};

I was thinking more of like

	&pm8008_bus: &i2c1 {
		status = "okay";
	};

	#include "pm8008.dtsi"

and then the nodes below.
