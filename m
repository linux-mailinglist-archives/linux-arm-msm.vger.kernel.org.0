Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E48305A2DFA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 20:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244087AbiHZSIr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 14:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbiHZSIq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 14:08:46 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C9B6192BB
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 11:08:45 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id l5-20020a05683004a500b0063707ff8244so1502671otd.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 11:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc;
        bh=CppDCJwy+pfEiyfqdA6WVXDmtoQK9zZP2tsICyNNVEI=;
        b=WcpwYf06HlBBYhu1jCwEnSlaeCtDD4JcNogXLv536HCUQ3n8SvF/CVfVSux27Zi1ye
         OpXtUIBQ21q1V+qG8E7umV2AntflsEY9ab1lsThMByh7/f0/opzsKRl2Jf+LV75oMXGD
         X5AZZ58yNTqRMfOzD9T6sCkrezZ2IZrPgNJWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
        bh=CppDCJwy+pfEiyfqdA6WVXDmtoQK9zZP2tsICyNNVEI=;
        b=pqRa6+CVAs+L7PEKtpLQtz+lI8Bd72o+4nDxqRgovsCct2HhypE7412KVoTG08QYn+
         0rpc1k17Y0t04p1rNrz+IPOdhi/uRdygmQMt23Ed657koPIa7ENLlTpBQgCb949ZlUWH
         mhRunDKslRXR10NWMX/8FbcKjXVuCix5NL2RwG2WRAGBcykHjQ+2WH5PjvFHJMGS7Lzu
         5xLzy4XYSmJiZhgrJc3Gi8LkFG7LXdFcsSnaVJiWlwF9AAuh7Xq3MqVjes2HKFO89+th
         vKSDmvaG96UKKrbAcgPfT8iylU+LYQjf/VnzQDKY1pNJRV+53NykWE6reNvWw1PmefE6
         H1cA==
X-Gm-Message-State: ACgBeo17XbTtYZ7/hLI9ez40KWeT1ZL8MA0ICdtmdGBh/jBuucHpCwYG
        0/qwbsDUKGmJmwbYLw2kVkTWeVQrO1ruUJOVshDk2Q==
X-Google-Smtp-Source: AA6agR4OYCRv3RliIFEMCZX/FFk7+UtuEH6UFx2i07S0YUDQ71aNSZY9yYdxDpVAk/Ize79lNJgrkD6Ks9ttmzX0DWI=
X-Received: by 2002:a9d:53cb:0:b0:637:1ddc:615c with SMTP id
 i11-20020a9d53cb000000b006371ddc615cmr1908132oth.3.1661537324727; Fri, 26 Aug
 2022 11:08:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Aug 2022 13:08:44 -0500
MIME-Version: 1.0
In-Reply-To: <20220826065621.2255795-1-judyhsiao@chromium.org>
References: <20220826065621.2255795-1-judyhsiao@chromium.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 26 Aug 2022 13:08:44 -0500
Message-ID: <CAE-0n51WNeMy5gEEQ9XpR1k2g=jSiknNkwJLz-bQbMN115JSxg@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: sc7280: Fix Dmic no sound on villager-r1
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, mka@chromium.org, cychiang@google.com,
        judyhsiao@google.com, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

Quoting Judy Hsiao (2022-08-25 23:56:21)
> Fix the DMIC no sound issue of villager-r1 by using "PP1800_L2C" as the
> DMIC power source to match the hardware schematic.
>
> This patch:
>    1. set vdd-micb-supply to PP1800_L2C as the MIC Bias voltage regulator.
>    2. In audio-routing, set VA DMIC01~VA DMIC03 to use the vdd-micb-supply
>       setting.
>
> Co-developed-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dts
> index c03b3ae4de50..fd202a8f6a33 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dts
> @@ -12,3 +12,30 @@ / {
>         model = "Google Villager (rev1+)";
>         compatible = "google,villager", "qcom,sc7280";
>  };
> +
> +&lpass_va_macro {
> +       vdd-micb-supply = <&pp1800_l2c>;
> +};

I wonder if we'll want to move this to some common "lpass audio" mixin
dtsi file, but we can do that later.
