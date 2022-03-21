Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FC1D4E30F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Mar 2022 20:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352121AbiCUTz5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Mar 2022 15:55:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241819AbiCUTz5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Mar 2022 15:55:57 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6343E17337B
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Mar 2022 12:54:31 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id b188so17388329oia.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Mar 2022 12:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=QXBlf8R7fSGWR/3BuJsl/P1v33Zj5B3eEF5yigv4sNc=;
        b=Vce7EfiITzm8gxl6NBwyGua5ixW1vZhH1Ir7v7sc4x6VG3tSVGKfdZvO4l1xRRS/i5
         U6XfBNFmzm6KDU9MRxSrKJv3+XlaQzIxsz+CR7/ADzSr7woQqe+pbOCxWGDNmT4HJXZr
         CoSwMmU7qY0ubYritcAx0ydZsYThxSXezBK/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=QXBlf8R7fSGWR/3BuJsl/P1v33Zj5B3eEF5yigv4sNc=;
        b=i7W2bU8sNZspSBUeAdLJKq7kgOd+wsAQxavjbMZTgpM8jSsop0/wq5nHWO0IRzbQZD
         jhVgG7B3oaNtKEeLS9PME3nGOUKugZSxzOZcUfU4QDOLDLFVVIkTyYqbuvsOXwvGephk
         SsGjUE+/iavnh2XDVY5ChedsMZTwkQVDZzFhqyXgBAoeiPm7flcfutobytj9wniHzWMR
         OL6ooqhYsyYpX3MfvgdFcMNMxzOJKhdPFF1DHsYU9iBZK9PvmP/yEfAsV4co21Iss61T
         kHSYDJOGJ02qQ1vf7t02S0g1f1gOSMUvcaaG32coJG6ZBNRPK4tHo4L4gNPrzT/N30d0
         6p+Q==
X-Gm-Message-State: AOAM5310YXSNUSzlPQii4cztV15A/m8L3LdvBTmWVOQhO0+V5GepdGpf
        pWLTEz130CYa1ghpSUlaHPRmMC5dh7mNg1cETA9H7w==
X-Google-Smtp-Source: ABdhPJyzcozfVCs/7sEauDjanN2DXGsR9pAH0AU6PpC1N1xDz/t8s6lXxcpcfcEAr4grxIi39N4fBq58a/fdEqI7/hA=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr403257oif.63.1647892470808; Mon, 21 Mar
 2022 12:54:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Mar 2022 20:54:30 +0100
MIME-Version: 1.0
In-Reply-To: <1647865696-19192-4-git-send-email-quic_srivasam@quicinc.com>
References: <1647865696-19192-1-git-send-email-quic_srivasam@quicinc.com> <1647865696-19192-4-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 21 Mar 2022 20:54:30 +0100
Message-ID: <CAE-0n535vbyis3APbVpSoKg8p7017HcYZHSoC=rtfngKp-3U9w@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sc7280: Add dt nodes for sound card
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, dianders@chromium.org,
        judyhsiao@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org
Cc:     Venkata Prasad Potturu <quic_potturu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-03-21 05:28:16)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index ca799c2..369c1e9 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -84,6 +84,99 @@
>                 pinctrl-names = "default";
>                 pinctrl-0 = <&nvme_pwren>;
>         };
> +
> +       sound: sound-card {

How about

	sound: sound {

It's not an actual sound card that you can plug in right?

> +               compatible = "google,sc7280-herobrine";
> +               model = "sc7280-wcd938x-max98360a-1mic";
> +               status = "okay";

This status can be left out as it's the default.
