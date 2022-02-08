Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1EF14AE35B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Feb 2022 23:21:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350771AbiBHWVy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Feb 2022 17:21:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386793AbiBHVM4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Feb 2022 16:12:56 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894D1C0612B8
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Feb 2022 13:12:55 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id l12-20020a0568302b0c00b005a4856ff4ceso126843otv.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Feb 2022 13:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=LL/sflvxWaUAXAGdJC51C+uyHW63BSfpyz0nzMbF71k=;
        b=CEBp4Xx8m8+Si17VtgJS4H6OHPFDA0zrEDV8RrC5debX5KP6YuoJZoHfsTZSGIGdn0
         mCjGsM7KaQmRWwkNEkTxNj6lhcuNYXJ4TRFVZm/w2OjQZqurlvrEd+FsnXaBl2us/wgd
         tgVrgJ62dJmq+1AVM6QvyPpJtwLWNydDIsL9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=LL/sflvxWaUAXAGdJC51C+uyHW63BSfpyz0nzMbF71k=;
        b=Bc7t0k2ZMEAfxmYQfdMZL+g2vs8Rizp901x7l0UEOVVOiFCE7/THKs5ETVfvolz71Q
         Hei5bVmyFApq7fekemFRRRyztJCHeogaAlzZzNnZukc5QpIq7orSuG+7E7su6ejv7D2Z
         Xia1nA7pjqy6qek6o+sgwR95dc0BV91xCDh1ziEZVRjsAgjIlWLtQQ+RuSJcASsQWf/N
         tWWKqL3xLbnd3yK1ehlVm2XUqALQ6e8vsMO9BckxFcZcB2XmLRLDP8WbQF8FLEPjc8Ut
         E9W7PuFA3qlmPPF2iRD3Fk3jb5aaCRFehHtp4ucjzoejEVaGbUCX2cm31a6RwdXLOP18
         Yshw==
X-Gm-Message-State: AOAM531vOuGtWiVj4LXYZTsJJs9n/Z7tUafXzR1su9/JXTq0RcMaxtlS
        Lil0Cc3mhR1eOB9wGNxMsReD6iZvjhwfMgBmGr+NCQ==
X-Google-Smtp-Source: ABdhPJzCuIPxXVr4pSaHx7DsFzXUIFhOeCbBT/GM9KO4xXxbzYDyI03OS2TzgivV+6Xt/+YIkRe9EP9XpZAU90SSNpQ=
X-Received: by 2002:a05:6830:1d8f:: with SMTP id y15mr2602969oti.77.1644354774846;
 Tue, 08 Feb 2022 13:12:54 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Feb 2022 13:12:54 -0800
MIME-Version: 1.0
In-Reply-To: <1644334454-16719-4-git-send-email-quic_srivasam@quicinc.com>
References: <1644334454-16719-1-git-send-email-quic_srivasam@quicinc.com> <1644334454-16719-4-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 8 Feb 2022 13:12:54 -0800
Message-ID: <CAE-0n50jBeOnkpogPFm+zqTf8bqQs-Bo0Gma658uFE6aA=Edxg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc7280: Add wcd9380 pinmux
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, dianders@chromium.org,
        judyhsiao@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org
Cc:     Venkata Prasad Potturu <quic_potturu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-02-08 07:34:14)
> Add pinmux to reset wcd codec, conneceted on SC7280 based platforms.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index 4704a93..6b38fa1 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -594,6 +594,21 @@
>                  */
>                 bias-pull-up;
>         };
> +
> +       wcd938x_reset_active: wcd938x_reset_active {

No underscore in node names.

> +                       pins = "gpio83";
> +                       function = "gpio";
> +                       drive-strength = <16>;
> +                       output-high;
> +       };
> +
> +       wcd938x_reset_sleep: wcd938x_reset_sleep {
> +                       pins = "gpio83";
> +                       function = "gpio";
> +                       drive-strength = <16>;
> +                       bias-disable;
> +                       output-low;

Why doesn't the device drive the reset gpio by requesting the gpio and
asserting and deasserting it? We shouldn't need to use pinctrl settings
to toggle reset gpios.
