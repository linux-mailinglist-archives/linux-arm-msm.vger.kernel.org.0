Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EB15675821
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 16:08:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbjATPI5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 10:08:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbjATPI4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 10:08:56 -0500
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9EB380BA6
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 07:08:54 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-4d19b2686a9so76167117b3.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 07:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pBi3ffU51iejmbjZQdj0oR9LDHIFBr0OZALJjIdQl6s=;
        b=IAR+djixseOq3jujbfi2bCnwrdqKvF/Hj92LldFzw7K3pR0UkGgZo29Kj1ScJMqbVT
         QWO1o80x9LlwXtpRk3xF3uN0OmsR0u42fQWOf3fDIuzu13H0miJ701CibLZpoOtLwFo2
         2jqgEwILWw9h7eHpp90ieOd1D+/9wY1RY4R2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pBi3ffU51iejmbjZQdj0oR9LDHIFBr0OZALJjIdQl6s=;
        b=ZcyoFUwAjOOjxhricvYBi0UNvTwZkIcAZmQqlnfnpNjeFk5sCmH1c05liCppfTCVIq
         GDrTECuJ4OjyFW3oPtKSKjbq0BgqOlvCdwnIe+/HkhiN6nBM2jWfd9m75y1/TtrRkCGX
         MUqIXriCO3/hMS5mdomssPDmyx28w79IQdubQ98REhwkkcFPqEbW729UcGjUqcqFHwaA
         6/hdXwcGfSt/iLgDVy/92h1BAzKxf0lj/ScnhwWNQvRpOINMe3ay6t6LLyz0fj9quftm
         361wP85O8fsLpTxgW19KNDZdHFQ4Ip44Zm5W16gCRjM//n5/MnAJonWlFDz8nx1v99aT
         r7dg==
X-Gm-Message-State: AFqh2kp7b4JVevP0eZkjhcd7QAjvtAeMMK/5LBdTTgW7H2Ci2NhxgzAD
        9HdwlZDpO/+FWwDLIY6NxMQfKawuwHFbgDzZAQPFqAHm3QbVMNaSNzs=
X-Google-Smtp-Source: AMrXdXte3RJRifErKDri4ufOLNtUc+I381qg5srevvWpCT+9akcsEUzeJT7w9khoMlB0A7nSuyN3J3u1pWiC2hEGDCg=
X-Received: by 2002:a0d:cbcb:0:b0:4f2:1365:fa5 with SMTP id
 n194-20020a0dcbcb000000b004f213650fa5mr1686671ywd.279.1674227333774; Fri, 20
 Jan 2023 07:08:53 -0800 (PST)
MIME-Version: 1.0
References: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org>
From:   Simon Glass <sjg@chromium.org>
Date:   Fri, 20 Jan 2023 08:08:07 -0700
Message-ID: <CAPnjgZ3MQ4E_3n_Z881QsdO-zELPkLaCm0cOFwz6Fds+u73OWg@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] clk: qcom: msm8996: add support for the CBF clock
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_SPF_WL
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On Thu, 19 Jan 2023 at 23:14, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On MSM8996 two CPU clusters are interconnected using the Core Bus
> Fabric (CBF). In order for the CPU clusters to function properly, it
> should be clocked following the core's frequencies to provide adequate
> bandwidth. On the other hand the CBF's clock rate can be used by other
> drivers (e.g. by the pending SPDM driver to provide input on the CPU
> performance).
>
> Thus register CBF as a clock (required for CPU to boot) and add a tiny
> interconnect layer on top of it to let cpufreq/opp scale the CBF clock.
>
> Dependencies: [1]
>
> [1] https://lore.kernel.org/linux-arm-msm/20230111191453.2509468-1-dmitry.baryshkov@linaro.org/
>
> Changes since v2:
> - Added interconnect-related bindings
> - Switched CPU and CBF clocks to RPM_SMD_XO_A_CLK_SRC
>
> Changes since v1:
> - Relicensed schema to GPL-2.0 + BSD-2-Clause (Krzysztof)
> - Changed clock driver to use parent_hws (Konrad)
> - Fixed indentation in CBF clock driver (Konrad)
> - Changed MODULE_LICENSE of CBF clock driver to GPL from GPL-v2
> - Switched CBF to use RPM_SMD_XO_CLK_SRC as one of the parents
> - Enabled RPM_SMD_XO_CLK_SRC on msm8996 platform and switch to it from
>   RPM_SMD_BB_CLK1 clock
>
> Dmitry Baryshkov (8):
>   dt-bindings: clock: qcom,msm8996-cbf: Describe the MSM8996 CBF clock
>     controller
>   dt-bindints: interconnect/msm8996-cbf: add defines to be used by CBF
>   clk: qcom: add msm8996 Core Bus Framework (CBF) support
>   clk: qcom: cbf-msm8996: scale CBF clock according to the CPUfreq
>   clk: qcom: smd-rpm: provide RPM_SMD_XO_CLK_SRC on MSM8996 platform
>   arm64: qcom: dts: msm8996 switch from RPM_SMD_BB_CLK1 to
>     RPM_SMD_XO_CLK_SRC
>   arm64: dts: qcom: msm8996: add CBF device entry
>   arm64: dts: qcom: msm8996: scale CBF clock according to the CPUfreq
>
>  .../bindings/clock/qcom,msm8996-cbf.yaml      |  53 ++
>  arch/arm64/boot/dts/qcom/msm8996.dtsi         |  72 ++-
>  drivers/clk/qcom/Makefile                     |   2 +-
>  drivers/clk/qcom/clk-cbf-8996.c               | 458 ++++++++++++++++++
>  drivers/clk/qcom/clk-smd-rpm.c                |   2 +
>  .../interconnect/qcom,msm8996-cbf.h           |  12 +
>  6 files changed, 591 insertions(+), 8 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
>  create mode 100644 drivers/clk/qcom/clk-cbf-8996.c
>  create mode 100644 include/dt-bindings/interconnect/qcom,msm8996-cbf.h
>
> --
> 2.39.0
>

Could you please tell me which dev board this is targeting and where I
can get one? Also could you please point me to the SoC documentation?

Thanks,
Simon
