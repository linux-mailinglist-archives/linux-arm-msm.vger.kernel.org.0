Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52357581D09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jul 2022 03:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240099AbiG0BWl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 21:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbiG0BWk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 21:22:40 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1200B39B96
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 18:22:40 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id k25-20020a056830169900b0061c6f68f451so12001433otr.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 18:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=dzYkFnzKNRLeXUsCkZgu16teiRoh5GfDTn6fhQts7oo=;
        b=TVdxEej7zvly6wv5TNAXpc5tA5MBNvX/DGGHGbV4/K+2QCoxi/KDJZLcLP7j315seA
         o5AtXxTy0KkAG4B/NtMBT1I03GAVm0nnfJxWHJy4eT64K9Bmq2PeeOUAdHCdMwQb/vrE
         efhTMKzgE3SLIMilT/E9yb41+7Fg7c84GhWU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=dzYkFnzKNRLeXUsCkZgu16teiRoh5GfDTn6fhQts7oo=;
        b=tLhLyQUUL5Uo+OOZTOyO14zKUzvqtxbVuQOIbcKqQKKu9YdEl0qXPilWAUJ02AWGza
         HyPjf7nPG9g1gdVLVHOm5FOJJx+qhmz5x3lLiUIixCUmvz6p8FiA/8o5a3O1LKP139VA
         iybmB67g2pxCKRM0qVblAMEcyG97b3R0EpM3FYsSXP43gwYgtAiHB6InRieeQv9lxxPM
         UIJ+XkGvmDbnxZg8pSitYpy3tCdatw9SYq5s53b0NSDGaeZNIQXRvStPXhg4I9ZA3tVS
         yiG8hX00F7sq/W1UGF+6cFnuIv4pwDpz0yZEAJB5l0Tur/8LH7zFsEYO0iRtQa/gkdyF
         tjcw==
X-Gm-Message-State: AJIora+dSyAMcSe+8h8v4Z8YgWs60vM5ERU7uBHUPyMHkkuClYuvOnjl
        EQmsE9ILVjaycp8nGxUuf5ycA2U9bmCT1mom/9y4nQ==
X-Google-Smtp-Source: AGRyM1sUN8naA9fnEOzbQgvRY9ky+jL0upLCp5I5rFs9OptUN1BFlt0Rf5afSFJtK4EPV+OGI/OwMBRlTGCFxFfuUCk=
X-Received: by 2002:a05:6830:1d88:b0:61c:8b2a:22b0 with SMTP id
 y8-20020a0568301d8800b0061c8b2a22b0mr7833793oti.3.1658884959405; Tue, 26 Jul
 2022 18:22:39 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 Jul 2022 20:22:38 -0500
MIME-Version: 1.0
In-Reply-To: <1658316144-16520-3-git-send-email-quic_c_skakit@quicinc.com>
References: <1658316144-16520-1-git-send-email-quic_c_skakit@quicinc.com> <1658316144-16520-3-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 26 Jul 2022 20:22:38 -0500
Message-ID: <CAE-0n53wdhH2P729KDDbghScCcU=4-sFmxVugyJgxmGeFs4mgw@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] arm64: dts: qcom: sc7280: Update lpassaudio clock
 controller for resets
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_tdas@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2022-07-20 04:22:24)
> From: Taniya Das <quic_tdas@quicinc.com>
>
> The lpass audio supports TX/RX/WSA block resets. Also to keep
> consistency update lpasscore to lpass_core.

Consistency with what?

>
> Fixes: 9499240d15f2 ("arm64: dts: qcom: sc7280: Add lpasscore & lpassaudio clock controllers")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> ---
> Changes since v3:
>  - Remove the status="disabled" from lpasscc node.
>
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 71735bb..c641f0b 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2184,6 +2184,7 @@
>                         power-domains = <&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
>                         #clock-cells = <1>;
>                         #power-domain-cells = <1>;
> +                       #reset-cells = <1>;

Is there a binding update for qcom,sc7280-lpassaudiocc?

>                 };
>
>                 lpass_aon: clock-controller@3380000 {
> @@ -2191,13 +2192,13 @@
>                         reg = <0 0x03380000 0 0x30000>;
>                         clocks = <&rpmhcc RPMH_CXO_CLK>,
>                                <&rpmhcc RPMH_CXO_CLK_A>,
> -                              <&lpasscore LPASS_CORE_CC_CORE_CLK>;
> +                              <&lpass_core LPASS_CORE_CC_CORE_CLK>;

Is this really necessary?

>                         clock-names = "bi_tcxo", "bi_tcxo_ao", "iface";
>                         #clock-cells = <1>;
>                         #power-domain-cells = <1>;
>                 };
>
> -               lpasscore: clock-controller@3900000 {
> +               lpass_core: clock-controller@3900000 {

Is this really necessary?

>                         compatible = "qcom,sc7280-lpasscorecc";
>                         reg = <0 0x03900000 0 0x50000>;
>                         clocks = <&rpmhcc RPMH_CXO_CLK>;
